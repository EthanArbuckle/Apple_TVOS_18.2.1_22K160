uint64_t sub_100004634(unsigned int a1, const void *a2, size_t a3)
{
  CFDictionaryRef v5;
  io_service_t MatchingService;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  io_object_t v13;
  uint64_t v14;
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
  char outputStruct;
  uint64_t input;
  io_connect_t connect;
  connect = 0;
  input = a1;
  v5 = IOServiceMatching("AppleEffaceableStorage");
  MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v5);
  v13 = MatchingService;
  if (MatchingService)
  {
    v14 = IOServiceOpen(MatchingService, mach_task_self_, 0, &connect);
    if ((_DWORD)v14)
    {
      v28 = v14;
      sub_100012238("storeBlastableBytes", @"Unable to open service: 0x%08x", v15, v16, v17, v18, v19, v20, v14);
    }

    else
    {
      v21 = IOConnectCallMethod(connect, 6u, &input, 1u, a2, a3, 0LL, 0LL, 0LL, 0LL);
      v28 = v21;
      if ((_DWORD)v21) {
        sub_100012238( "storeBlastableBytes",  @"Can't store blastable bytes: %08x",  v22,  v23,  v24,  v25,  v26,  v27,  v21);
      }
    }
  }

  else
  {
    sub_100012238( "storeBlastableBytes",  @"Can't find EffaceableStorage kext!",  v7,  v8,  v9,  v10,  v11,  v12,  outputStruct);
    v28 = 3758097084LL;
  }

  if (connect) {
    IOServiceClose(connect);
  }
  if (v13) {
    IOObjectRelease(v13);
  }
  return v28;
}

uint64_t sub_100004764(unsigned int a1, void *a2, size_t *a3)
{
  io_connect_t connect = 0;
  uint64_t input = a1;
  uint32_t outputCnt = 1;
  v5 = IOServiceMatching("AppleEffaceableStorage");
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v5);
  io_object_t v13 = MatchingService;
  if (MatchingService)
  {
    uint64_t v14 = IOServiceOpen(MatchingService, mach_task_self_, 0, &connect);
    if ((_DWORD)v14)
    {
      uint64_t v28 = v14;
      sub_100012238("loadBlastableBytes", @"Unable to open service: 0x%08x", v15, v16, v17, v18, v19, v20, v14);
    }

    else
    {
      uint64_t v21 = IOConnectCallMethod(connect, 5u, &input, 1u, 0LL, 0LL, &output, &outputCnt, a2, a3);
      uint64_t v28 = v21;
      if ((_DWORD)v21) {
        sub_100012238( "loadBlastableBytes",  @"Can't load blastable bytes: %08x",  v22,  v23,  v24,  v25,  v26,  v27,  v21);
      }
    }
  }

  else
  {
    sub_100012238( "loadBlastableBytes",  @"Can't find EffaceableStorage kext!",  v7,  v8,  v9,  v10,  v11,  v12,  outputStruct);
    uint64_t v28 = 3758097084LL;
  }

  if (connect) {
    IOServiceClose(connect);
  }
  if (v13) {
    IOObjectRelease(v13);
  }
  return v28;
}

uint64_t sub_10000489C(unsigned int a1)
{
  size_t v32 = 1024LL;
  io_connect_t connect = 0;
  uint64_t input = a1;
  uint32_t outputCnt = 1;
  v2 = IOServiceMatching("AppleEffaceableStorage");
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v2);
  io_object_t v10 = MatchingService;
  if (MatchingService)
  {
    uint64_t v11 = IOServiceOpen(MatchingService, mach_task_self_, 0, &connect);
    if ((_DWORD)v11)
    {
      uint64_t v18 = v11;
      sub_100012238("effaceBlastableBytes", @"Unable to open service: 0x%08x", v12, v13, v14, v15, v16, v17, v11);
    }

    else
    {
      uint64_t v18 = IOConnectCallMethod(connect, 5u, &input, 1u, 0LL, 0LL, &output, &outputCnt, v33, &v32);
      if (!(_DWORD)v18)
      {
        uint64_t v19 = IOConnectCallMethod(connect, 7u, &input, 1u, 0LL, 0LL, &output, &outputCnt, 0LL, 0LL);
        uint64_t v18 = v19;
        if ((_DWORD)v19) {
          sub_100012238("effaceBlastableBytes", @"efface failed: 0x%x", v20, v21, v22, v23, v24, v25, v19);
        }
      }
    }
  }

  else
  {
    sub_100012238( "effaceBlastableBytes",  @"Can't find EffaceableStorage kext!",  v4,  v5,  v6,  v7,  v8,  v9,  outputStruct);
    uint64_t v18 = 3758097084LL;
  }

  if (connect) {
    IOServiceClose(connect);
  }
  if (v10) {
    IOObjectRelease(v10);
  }
  return v18;
}

CFDictionaryRef sub_100004A44()
{
  uint64_t v15 = 0LL;
  snprintf(__str, 0x401uLL, "%s%s", "/private/var/", "keybags");
  uint64_t v6 = 0LL;
  if (!sub_100004B3C(__str, "systembag", (CFPropertyListRef *)&v15))
  {
    uint64_t v6 = v15;
    if (v15)
    {
      if (!sub_10000DB44(v15, @"KeyBagKeys"))
      {
        sub_100012238( "KBLoadSystemKeyBag",  @"Keybag %s doesn't actually contain keys",  v8,  v9,  v10,  v11,  v12,  v13,  (char)__str);
        CFRelease(v6);
        return 0LL;
      }
    }

    else
    {
      sub_100012238( "KBLoadSystemKeyBag",  @" Empty Keybag returned from KBLoadLoadKeyBagFile",  v0,  v1,  v2,  v3,  v4,  v5,  v14);
    }
  }

  return v6;
}

uint64_t sub_100004B3C(const char *a1, const char *a2, CFPropertyListRef *a3)
{
  uint64_t v4 = (const __CFDictionary *)sub_10000E140(__str);
  uint64_t v5 = v4;
  if (v4) {
    BOOL v6 = CFDictionaryGetValue(v4, @"KeybagxART") != 0LL;
  }
  else {
    BOOL v6 = 0;
  }
  int v7 = sub_1000064B0(":/defaults", @"no-effaceable-storage");
  if (v6 || v7)
  {
    *a3 = 0LL;
    uint64_t v16 = sub_10000E140(__str);
    *a3 = v16;
    if (!v16)
    {
      snprintf(v26, 0x401uLL, "%s.writing", __str);
      uint64_t v17 = sub_10000E140(v26);
      *a3 = v17;
      if (!v17)
      {
        uint64_t v15 = 4294967289LL;
        sub_100012238( "KBLoadLoadKeyBagFile",  @"Unable to load keybag with No Crypto: %d",  v18,  v19,  v20,  v21,  v22,  v23,  -7);
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
    uint64_t v8 = sub_100006C68(__str, a3);
    uint64_t v15 = v8;
    if ((_DWORD)v8)
    {
      sub_100012238( "KBLoadLoadKeyBagFile",  @"Unable to load keybag with Crypto: %d",  v9,  v10,  v11,  v12,  v13,  v14,  v8);
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

CFMutableDictionaryRef sub_100004CA4(uint64_t a1)
{
  uint64_t v16 = 0LL;
  snprintf(__str, 0x401uLL, "%s%s", "/private/var/", "keybags");
  int v2 = sub_100004B3C(__str, "userbag", (CFPropertyListRef *)&v16);
  uint64_t v3 = v16;
  if (!v2 && v16)
  {
    CFStringRef v4 = CFStringCreateWithFormat(kCFAllocatorDefault, 0LL, @"%d", a1);
    if (!v4)
    {
      CFMutableDictionaryRef MutableCopy = 0LL;
      goto LABEL_10;
    }

    uint64_t v5 = (const __CFDictionary *)v4;
    Value = (const __CFDictionary *)CFDictionaryGetValue(v3, v4);
    if (Value)
    {
      int v7 = Value;
      if (sub_10000DB44(Value, @"KeyBagKeys"))
      {
        CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(kCFAllocatorDefault, 0LL, v7);
LABEL_9:
        CFRelease(v3);
        uint64_t v3 = v5;
LABEL_10:
        CFRelease(v3);
        return MutableCopy;
      }

      sub_100012238( "KBLoadUserKeybag",  @"Keybag %s doesn't actually contain keys",  v8,  v9,  v10,  v11,  v12,  v13,  (char)__str);
    }

    CFMutableDictionaryRef MutableCopy = 0LL;
    goto LABEL_9;
  }

  CFMutableDictionaryRef MutableCopy = 0LL;
  CFMutableDictionaryRef result = 0LL;
  if (v16) {
    goto LABEL_10;
  }
  return result;
}

uint64_t sub_100004E08(const void *a1)
{
  int v2 = sub_100004A44();
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

uint64_t sub_100004EF0( const __CFDictionary *a1, const char *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = a5;
  unsigned int v10 = a3;
  unsigned int v13 = sub_10000728C(0xFFFFFFFFLL, a1, a3, (uint64_t)a4, a5, a6, a7, a8);
  CFDictionarySetValue(a1, @"KeyBagVersion", @"1");
  if (v13) {
    CFDictionarySetValue(a1, @"KeybagxART", @"1");
  }
  if (mkdir(a2, 0x1C0u) && *__error() != 17)
  {
    v38 = __error();
    strerror(*v38);
    sub_100012238("KBSaveKeyBag", @"Can't create %s: %s", v39, v40, v41, v42, v43, v44, (char)a2);
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
    int v188 = -1;
    snprintf(__old, 0x401uLL, "%s.writing", __str);
    if (!sub_10000DEC4(a1, __old, &v188))
    {
      if (renamex_np(__old, __str, 2u) && (__error(), rename(__old, __str)))
      {
        v167 = __error();
        strerror(*v167);
        sub_100012238( "KBSecureSaveObjectNoCrypto",  @"could not rename %s to %s: %s (%d)",  v168,  v169,  v170,  v171,  v172,  v173,  (char)__old);
      }

      else if (fcntl(v188, 51))
      {
        v150 = __error();
        strerror(*v150);
        sub_100012238( "KBSecureSaveObjectNoCrypto",  @"Unable to fsync %s: %s",  v151,  v152,  v153,  v154,  v155,  v156,  (char)__old);
      }

      else
      {
        if (unlink(__old))
        {
          uint64_t v16 = __error();
          char v17 = strerror(*v16);
          sub_100012238("KBSecureSaveObjectNoCrypto", @"unlink failed: %s", v18, v19, v20, v21, v22, v23, v17);
        }

        uint64_t v15 = 0LL;
      }
    }

    if (v188 != -1 && close(v188))
    {
      char v24 = v188;
      uint64_t v25 = __error();
      strerror(*v25);
      sub_100012238("KBSecureSaveObjectNoCrypto", @"failed to close(%d): %s", v26, v27, v28, v29, v30, v31, v24);
    }

    return v15;
  }

  CCCryptorRef cryptorRef = 0LL;
  size_t v179 = 52LL;
  memset(v186, 0, sizeof(v186));
  int v187 = 0;
  if (!v8)
  {
    if (SecRandomCopyBytes(kSecRandomDefault, 0x20uLL, (char *)&v186[1] + 4))
    {
      v175 = @"Can't create key";
    }

    else
    {
      if (!SecRandomCopyBytes(kSecRandomDefault, 0x10uLL, (char *)v186 + 4))
      {
LABEL_28:
        CFDataRef v51 = CFDataCreate(0LL, (const UInt8 *)&v186[1] + 4, 32LL);
        if (v51)
        {
          CFDataRef v58 = v51;
          CFDataRef v59 = CFDataCreate(0LL, (const UInt8 *)v186 + 4, 16LL);
          if (v59)
          {
            CFDataRef v66 = v59;
            v67 = (const __CFData *)sub_10000DCC0(a1);
            if (!v67)
            {
              sub_100012238( "KBSecureSaveObjectWithCrypto",  @"Can't serialize object",  v68,  v69,  v70,  v71,  v72,  v73,  v176);
              v91 = 0LL;
              uint64_t v15 = 4294967291LL;
LABEL_59:
              CFRelease(v58);
              CFRelease(v66);
              if (v91) {
                CFRelease(v91);
              }
              goto LABEL_61;
            }

            v74 = v67;
            CCCryptorStatus v75 = CCCryptorCreate(0, 0, 1u, (char *)&v186[1] + 4, 0x20uLL, (char *)v186 + 4, &cryptorRef);
            if (v75)
            {
              sub_100012238( "KBSecureSaveObjectWithCrypto",  @"Can't create cryptor: %d",  v76,  v77,  v78,  v79,  v80,  v81,  v75);
              v91 = 0LL;
            }

            else
            {
              size_t Length = CFDataGetLength(v74);
              Outputsize_t Length = CCCryptorGetOutputLength(cryptorRef, Length, 1);
              Mutable = CFDataCreateMutable(0LL, OutputLength);
              v91 = Mutable;
              if (!Mutable)
              {
                v157 = "KBSecureSaveObjectWithCrypto";
                v158 = @"Can't create crypt buffer";
LABEL_74:
                sub_100012238(v157, v158, v85, v86, v87, v88, v89, v90, v176);
                uint64_t v15 = 4294967291LL;
                goto LABEL_58;
              }

              CFDataSetLength(Mutable, OutputLength);
              v92 = cryptorRef;
              BytePtr = CFDataGetBytePtr(v74);
              MutableBytePtr = CFDataGetMutableBytePtr(v91);
              CCCryptorStatus v95 = CCCryptorUpdate(v92, BytePtr, Length, MutableBytePtr, OutputLength, &dataOutMoved);
              if (!v95)
              {
                v102 = cryptorRef;
                v103 = CFDataGetMutableBytePtr(v91);
                CCCryptorFinal(v102, &v103[dataOutMoved], OutputLength - dataOutMoved, &dataOutMoved);
                unsigned int valuePtr = v10;
                CFTypeRef cf = 0LL;
                int v182 = -1;
                CFMutableDictionaryRef v104 = CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
                if (v104)
                {
                  v105 = v104;
                  CFNumberRef v106 = CFNumberCreate(0LL, kCFNumberIntType, &valuePtr);
                  if (!v106) {
                    goto LABEL_81;
                  }
                  CFDictionaryAddValue(v105, @"_MKBIV", v66);
                  CFDictionaryAddValue(v105, @"_MKBWIPEID", v106);
                  CFDictionaryAddValue(v105, @"_MKBPAYLOAD", v91);
                  snprintf(__old, 0x401uLL, "%s.writing", __str);
                  if (renamex_np(__old, __str, 2u))
                  {
                    __error();
                    if (rename(__old, __str))
                    {
                      v174 = __error();
                      strerror(*v174);
                      v177 = __old;
                      v166 = @"could not rename %s to %s: %s (%d)";
LABEL_80:
                      sub_100012238("KBSecureSaveObject", v166, v127, v128, v129, v130, v131, v132, (char)v177);
                      goto LABEL_81;
                    }
                  }

                  if (fcntl(v182, 51))
                  {
                    v159 = __error();
                    strerror(*v159);
                    sub_100012238( "KBSecureSaveObject",  @"Unable to fsync %s: %s",  v160,  v161,  v162,  v163,  v164,  v165,  (char)__old);
LABEL_81:
                    uint64_t v15 = 0xFFFFFFFFLL;
LABEL_51:
                    if (v182 != -1 && close(v182))
                    {
                      char v141 = v182;
                      v142 = __error();
                      strerror(*v142);
                      sub_100012238( "KBSecureSaveObject",  @"failed to close(%d): %s",  v143,  v144,  v145,  v146,  v147,  v148,  v141);
                    }

                    CFRelease(v105);
                    if (cf) {
                      CFRelease(cf);
                    }
                    if (v106) {
                      CFRelease(v106);
                    }
                    goto LABEL_58;
                  }

                  if ((v8 & 1) == 0)
                  {
                    unsigned int v107 = valuePtr;
                    if (CFDataGetLength(v66) != 16 || CFDataGetLength(v58) != 32)
                    {
                      sub_100012238( "storeWipeIDInfo",  @"trying to store invalid iv or secret",  v108,  v109,  v110,  v111,  v112,  v113,  (char)v177);
                      goto LABEL_46;
                    }

                    int v188 = v107;
                    v192.location = 0LL;
                    v192.length = 16LL;
                    CFDataGetBytes(v66, v192, v189);
                    v193.location = 0LL;
                    v193.length = 32LL;
                    CFDataGetBytes(v58, v193, v190);
                    int v114 = sub_100004634(v107, &v188, 0x34uLL);
                    if (v114)
                    {
                      sub_100012238( "storeWipeIDInfo",  @"Unable to save wipe info: %08x",  v115,  v116,  v117,  v118,  v119,  v120,  v114);
LABEL_46:
                      sub_100012238( "KBSecureSaveObject",  @"Oh no! Can't save wipe ID",  v121,  v122,  v123,  v124,  v125,  v126,  v178);
                    }
                  }

                  if (!sub_100006C68(__str, &cf))
                  {
                    if (unlink(__old))
                    {
                      v133 = __error();
                      char v134 = strerror(*v133);
                      sub_100012238( "KBSecureSaveObject",  @"unlink failed: %s",  v135,  v136,  v137,  v138,  v139,  v140,  v134);
                    }

                    uint64_t v15 = 0LL;
                    goto LABEL_51;
                  }

                  v166 = @"failed to validate newly created bag -- should never happen";
                  goto LABEL_80;
                }

                v157 = "KBSecureSaveObject";
                v158 = @"Can't create dict";
                goto LABEL_74;
              }

              sub_100012238( "KBSecureSaveObjectWithCrypto",  @"Can't encrypt: %d",  v96,  v97,  v98,  v99,  v100,  v101,  v95);
            }

            uint64_t v15 = 4294967289LL;
LABEL_58:
            CFRelease(v74);
            goto LABEL_59;
          }

          sub_100012238( "KBSecureSaveObjectWithCrypto",  @"Can't create iv data",  v60,  v61,  v62,  v63,  v64,  v65,  v176);
          CFRelease(v58);
        }

        else
        {
          sub_100012238( "KBSecureSaveObjectWithCrypto",  @"Can't create key data",  v52,  v53,  v54,  v55,  v56,  v57,  v176);
        }

        uint64_t v15 = 4294967291LL;
        goto LABEL_61;
      }

      v175 = @"Can't create IV";
    }

    sub_100012238("KBSecureSaveObjectWithCrypto", v175, v45, v46, v47, v48, v49, v50, v176);
    goto LABEL_85;
  }

  sub_100012238( "KBSecureSaveObjectWithCrypto",  @"Unable to load wipe info:%08x",  v32,  v33,  v34,  v35,  v36,  v37,  v10);
LABEL_85:
  uint64_t v15 = 0xFFFFFFFFLL;
LABEL_61:
  if (cryptorRef) {
    CCCryptorRelease(cryptorRef);
  }
  return v15;
}

uint64_t sub_100005728(uint64_t a1, const char *a2, const void *a3, int a4, uint64_t a5)
{
  if ((_DWORD)a5) {
    uint64_t v16 = @"Saving SystemBag with NO EFFACEABLE ROLL";
  }
  else {
    uint64_t v16 = @"Saving SystemBag with EFFACEABLE ROLL";
  }
  sub_100012238("KBSaveSystemBagHandle", v16, v10, v11, v12, v13, v14, v15, v38);
  int v17 = sub_100005978();
  if ((_DWORD)a1 || !v17)
  {
    v41[0] = 0LL;
    *(_DWORD *)bytes = 0;
    if (!aks_save_bag(a1, v41, bytes))
    {
      CFDataRef v26 = CFDataCreateWithBytesNoCopy(kCFAllocatorDefault, v41[0], *(int *)bytes, kCFAllocatorDefault);
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
  aks_unload_bag(LODWORD(v41[0]));
  CFDataRef v18 = CFDataCreate(kCFAllocatorDefault, bytes, 4LL);
  if (!v18) {
    return 0xFFFFFFFFLL;
  }
  CFDataRef v25 = v18;
  sub_100012238( "KBSaveSystemBagHandle",  @"Saving handle 0 with the magic handle",  v19,  v20,  v21,  v22,  v23,  v24,  v39);
LABEL_14:
  uint64_t v27 = sub_10000E280();
  if (v27)
  {
    uint64_t v28 = v27;
    CFDictionaryAddValue(v27, @"KeyBagKeys", v25);
    if (a3) {
      CFDictionaryAddValue(v28, @"OpaqueStuff", a3);
    }
    if (a4)
    {
      uint64_t v29 = sub_100004A44();
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

uint64_t sub_100005978()
{
  if ((byte_100029288 & 1) == 0)
  {
    int v0 = sub_1000064B0(":/filesystems", @"e-apfs");
    size_t __len = 1023LL;
    bzero(__big, 0x400uLL);
    if ((byte_10002928A & 1) == 0)
    {
      if (!sysctlbyname("kern.bootargs", __big, &__len, 0LL, 0LL) && strnstr(__big, "-apfs_shared_datavolume", __len)) {
        byte_10002928B = 1;
      }
      byte_10002928A = 1;
    }

    if (v0 == 1) {
      char v7 = 1;
    }
    else {
      char v7 = byte_10002928B;
    }
    byte_100029289 = v7;
    sub_100012238("MKBDeviceSupportsEnhancedAPFS", @"dt = %d, bootarg = %d", v1, v2, v3, v4, v5, v6, v0);
    byte_100029288 = 1;
  }

  return byte_100029289;
}

uint64_t sub_100005A9C(uint64_t a1, uint64_t a2, const void *a3, int a4)
{
  *(void *)&length[1] = 0LL;
  length[0] = 0;
  CFMutableDictionaryRef theDict = 0LL;
  if ((sub_100005978() & 1) != 0) {
    return 0LL;
  }
  if (a4) {
    uint64_t v14 = @"Saving UserBag for uid %d with NO EFFACEABLE ROLL";
  }
  else {
    uint64_t v14 = @"Saving UserBag for uid %d with EFFACEABLE ROLL";
  }
  sub_100012238("KBSaveUserBagHandle", v14, v8, v9, v10, v11, v12, v13, a2);
  snprintf(__str, 0x401uLL, "%s%s", "/private/var/", "keybags");
  uint64_t v15 = sub_100004B3C(__str, "userbag", (CFPropertyListRef *)&theDict);
  if (!(_DWORD)v15
    || (CFMutableDictionaryRef theDict = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks)) != 0LL)
  {
    CFStringRef v16 = CFStringCreateWithFormat(kCFAllocatorDefault, 0LL, @"%d", a2);
    if (v16)
    {
      if ((_DWORD)a1 == -1)
      {
        uint64_t v21 = theDict;
        CFDictionaryRemoveValue(theDict, v16);
        CFDataRef v18 = 0LL;
        uint64_t v20 = 0LL;
        goto LABEL_16;
      }

      if (!aks_save_bag(a1, &length[1], length))
      {
        CFDataRef v17 = CFDataCreateWithBytesNoCopy( kCFAllocatorDefault,  *(const UInt8 **)&length[1],  length[0],  kCFAllocatorDefault);
        if (v17)
        {
          CFDataRef v18 = v17;
          Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
          if (!Mutable)
          {
            CFDateRef v23 = 0LL;
            CFDateRef v26 = 0LL;
LABEL_32:
            CFRelease(v18);
LABEL_33:
            if (theDict)
            {
              CFRelease(theDict);
              CFMutableDictionaryRef theDict = 0LL;
            }

            if (v16) {
              CFRelease(v16);
            }
            if (v23) {
              CFRelease(v23);
            }
            if (v26) {
              CFRelease(v26);
            }
            return v15;
          }

          uint64_t v20 = Mutable;
          CFDictionarySetValue(Mutable, @"KeyBagKeys", v18);
          if (a3) {
            CFDictionarySetValue(v20, @"OpaqueStuff", a3);
          }
          uint64_t v21 = theDict;
          CFDictionarySetValue(theDict, v16, v20);
LABEL_16:
          CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
          CFDateRef v23 = CFDateCreate(kCFAllocatorDefault, Current);
          Value = (const __CFDate *)CFDictionaryGetValue(v21, @"LastWipeKeyUpdateTimeStamp");
          if (Value)
          {
            CFAbsoluteTime AbsoluteTime = CFDateGetAbsoluteTime(Value);
            CFDateRef v26 = CFDateCreate(kCFAllocatorDefault, AbsoluteTime + 86400.0);
            if (CFDateCompare(v26, v23, 0LL) != kCFCompareLessThan)
            {
              if ((a4 & 1) == 0) {
                CFDictionarySetValue(v21, @"WipeKeyUpdatePending", kCFBooleanTrue);
              }
              goto LABEL_23;
            }

            uint64_t v30 = CFDictionaryGetValue(v21, @"WipeKeyUpdatePending");
            if (!CFEqual(v30, kCFBooleanTrue) && (a4 & 1) != 0)
            {
LABEL_23:
              uint64_t v31 = 1LL;
              goto LABEL_26;
            }

            CFDictionarySetValue(v21, @"LastWipeKeyUpdateTimeStamp", v23);
            CFDictionarySetValue(v21, @"WipeKeyUpdatePending", kCFBooleanFalse);
          }

          else
          {
            CFDictionarySetValue(v21, @"WipeKeyUpdatePending", kCFBooleanFalse);
            CFDictionarySetValue(v21, @"LastWipeKeyUpdateTimeStamp", v23);
            CFDateRef v26 = 0LL;
          }

          uint64_t v31 = 0LL;
LABEL_26:
          else {
            uint64_t v15 = 0LL;
          }
          if (v20) {
            CFRelease(v20);
          }
          if (!v18) {
            goto LABEL_33;
          }
          goto LABEL_32;
        }
      }
    }

    CFDateRef v23 = 0LL;
    CFDateRef v26 = 0LL;
    goto LABEL_33;
  }

  return v15;
}

uint64_t sub_100005E48(char *cStr, _DWORD *a2, char **a3)
{
  uint64_t v5 = CFStringCreateWithCString(0LL, cStr, 0x8000100u);
  io_registry_entry_t v6 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/options");
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
      sub_100012238("getNVRam", @"Could not create string for value", v15, v16, v17, v18, v19, v20, v30);
      if (a2) {
        *a2 = 0;
      }
    }

    IOObjectRelease(v13);
    uint64_t v23 = 0LL;
  }

  else
  {
    sub_100012238("getNVRam", @"Could not get options entry from the device tree", v7, v8, v9, v10, v11, v12, v30);
    uint64_t v23 = 0xFFFFFFFFLL;
  }

  CFRelease(v5);
  return v23;
}

uint64_t sub_100006010(char *cStr, const char *a2)
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
  io_registry_entry_t v4 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/options");
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
        sub_100012238("setNVRam", @"Could not save value:%08x", v21, v22, v23, v24, v25, v26, v20);
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
      sub_100012238("setNVRam", @"Could not create string for value", v13, v14, v15, v16, v17, v18, v29);
      uint64_t v27 = 0xFFFFFFFFLL;
    }

    IOObjectRelease(v11);
  }

  else
  {
    sub_100012238("setNVRam", @"Could not get options entry from the device tree", v5, v6, v7, v8, v9, v10, v29);
    uint64_t v27 = 0xFFFFFFFFLL;
  }

  CFRelease(v3);
  return v27;
}

uint64_t sub_10000611C(const char *a1)
{
  return sub_100006010("IONVRAM-DELETE-PROPERTY", a1);
}

uint64_t sub_10000612C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, const void *a7)
{
  uint64_t v14 = 0xFFFFFFFFLL;
  int v63 = -1;
  if (!aks_get_system(a1, &v63))
  {
    unsigned int v64 = -1;
    unsigned int v21 = sub_10000728C(a1, 0LL, v15, v16, v17, v18, v19, v20);
    char v28 = v21;
    uint64_t v29 = "two";
    if (v21) {
      uint64_t v29 = "single";
    }
    sub_100012238( "KBChangeSystemNonSeSecret",  @"changing non-SE passcode %s phase, (params:%d)",  v22,  v23,  v24,  v25,  v26,  v27,  (char)v29);
    char v62 = 0;
    int v30 = aks_change_secret_opts(a1, a3, a4, a5, a6, 0LL, 0LL, 0LL);
    if (v30)
    {
      sub_100012238("KBChangeSystemNonSeSecret", @"change-secret failed %x", v31, v32, v33, v34, v35, v36, v30);
      goto LABEL_35;
    }

    if ((v28 & 1) != 0)
    {
      unsigned int v64 = a1;
      uint64_t v37 = a1;
    }

    else
    {
      uint64_t v37 = v64;
      if (v64 == -1 || v64 == (_DWORD)a1)
      {
        sub_100012238( "KBChangeSystemNonSeSecret",  @"temp handle is invalid: %d",  v31,  v32,  v33,  v34,  v35,  v36,  v64);
        goto LABEL_35;
      }
    }

    if ((_DWORD)a1)
    {
    }

    else if (!sub_100005728(v37, "/private/var/", a7, 1, 0LL))
    {
LABEL_11:
      if ((v28 & 1) == 0)
      {
        int v44 = aks_set_system_with_passcode(v64, a1, a5, a6);
        if (v44)
        {
          sub_100012238("KBChangeSystemNonSeSecret", @"set-system failed %d", v45, v46, v47, v48, v49, v50, v44);
          char v59 = 0;
          int v58 = 1;
LABEL_15:
          if (v64 == -1) {
            char v60 = 1;
          }
          else {
            char v60 = v28;
          }
          if ((v60 & 1) == 0) {
            aks_unload_bag(v64);
          }
          if (!v58) {
            goto LABEL_24;
          }
          if ((_DWORD)a1)
          {
          }

          else if (!sub_100005728(0LL, "/private/var/", a7, 1, 1LL))
          {
LABEL_24:
            if ((v59 & 1) != 0) {
              return 0LL;
            }
            sub_100012238( "KBChangeSystemSecret",  @"Failed to change non-se pw",  v52,  v53,  v54,  v55,  v56,  v57,  v62);
            return 0xFFFFFFFFLL;
          }

          sub_100012238( "KBChangeSystemNonSeSecret",  @"welp, unable to persist old bag",  v52,  v53,  v54,  v55,  v56,  v57,  v62);
          goto LABEL_24;
        }
      }

      int v51 = aks_change_secret_epilogue(a1, a5, (int)a6);
      if (!v51)
      {
        int v58 = 0;
        char v59 = 1;
        goto LABEL_15;
      }

      sub_100012238( "KBChangeSystemNonSeSecret",  @"aks_change_secret_epilogue() failed %x",  v52,  v53,  v54,  v55,  v56,  v57,  v51);
LABEL_35:
      char v59 = 0;
      int v58 = 0;
      goto LABEL_15;
    }

    sub_100012238("KBChangeSystemNonSeSecret", @"unable to save bag %d", v38, v39, v40, v41, v42, v43, v64);
    goto LABEL_35;
  }

  return v14;
}

uint64_t sub_1000063E0( const __CFData *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, const void *a7)
{
  if (a1)
  {
    BytePtr = CFDataGetBytePtr(a1);
    CFIndex Length = CFDataGetLength(a1);
  }

  else
  {
    BytePtr = 0LL;
    CFIndex Length = 0LL;
  }

  if ((sub_100005978() & 1) != 0) {
    return 0LL;
  }
  return sub_100005728(0LL, "/private/var/", a7, 1, 0LL);
}

uint64_t sub_1000064B0(const char *a1, const __CFString *a2)
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
  io_registry_entry_t v7 = IORegistryEntryFromPath(kIOMainPortDefault, v6);
  if (v7)
  {
    io_object_t v8 = v7;
    CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(v7, a2, kCFAllocatorDefault, 0);
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

uint64_t sub_10000658C(uint64_t a1, uint64_t a2)
{
  if ((_DWORD)a1) {
    size_t v4 = sub_100004CA4(-(int)a1);
  }
  else {
    size_t v4 = sub_100004A44();
  }
  io_registry_entry_t v11 = v4;
  if (v4)
  {
    Value = CFDictionaryGetValue(v4, @"OpaqueStuff");
    uint64_t v13 = Value;
    if (Value) {
      CFRetain(Value);
    }
    CFRelease(v11);
    sub_100012238("KBUpdateKeyBag", @"Got opaqueStuff from ondisk keybag", v14, v15, v16, v17, v18, v19, v29);
    if (aks_get_system(a1, &v30))
    {
      uint64_t v27 = 0xFFFFFFFFLL;
      if (!v13) {
        return v27;
      }
      goto LABEL_13;
    }

    if ((_DWORD)a1) {
      uint64_t v20 = sub_100005A9C(v30, -(int)a1, v13, a2);
    }
    else {
      uint64_t v20 = sub_100005728(v30, "/private/var/", v13, 1, a2);
    }
    uint64_t v27 = v20;
    sub_100012238( "KBUpdateKeyBag",  @"Saved new keybag for handle %d with result %d",  v21,  v22,  v23,  v24,  v25,  v26,  a1);
    if (v13) {
LABEL_13:
    }
      CFRelease(v13);
  }

  else
  {
    sub_100012238( "KBUpdateKeyBag",  @"failed to open ondisk keybag, failing UpdateKeyBag",  v5,  v6,  v7,  v8,  v9,  v10,  v29);
    return 0xFFFFFFFFLL;
  }

  return v27;
}

void sub_1000066AC(uint64_t a1, uint64_t a2, void **a3, void *a4, int a5, uint64_t a6)
{
  uint64_t v39 = 0LL;
  uint64_t v40 = 0LL;
  CFStringRef v12 = dlopen("/System/Library/PrivateFrameworks/APFS.framework/APFS", 2);
  if (!v12)
  {
    uint64_t v27 = @"Failed to open APFS framework";
    goto LABEL_8;
  }

  uint64_t v19 = (uint64_t (*)(uint64_t, void, void *, uint64_t))dlsym(v12, "APFSVolumePayloadSet");
  if (!v19)
  {
    uint64_t v27 = @"Failed to resolve gAPFSVolumePayloadSet";
LABEL_8:
    sub_100012238("KBSetCookie", v27, v13, v14, v15, v16, v17, v18, v37);
    uint64_t v19 = 0LL;
    if (a5) {
      goto LABEL_4;
    }
LABEL_9:
    int v28 = aks_copy_volume_cookie(a1, &v40, &v39);
    if (v28)
    {
      sub_100012238( "KBSetCookie",  @"Failed to get keybag Cookie from AKS:0x%x",  v21,  v22,  v23,  v24,  v25,  v26,  v28);
      goto LABEL_17;
    }

    char v29 = @"Retrieved keybag Cookie from AKS, setting in APFS volume";
    goto LABEL_13;
  }

  if (!a5) {
    goto LABEL_9;
  }
LABEL_4:
  int v20 = aks_copy_volume_cookie_persona(a1, a6, &v40, &v39);
  if (v20)
  {
    sub_100012238( "KBSetCookie",  @"Failed to get keybag persona Cookiefrom AKS:0x%x",  v21,  v22,  v23,  v24,  v25,  v26,  v20);
    goto LABEL_17;
  }

  char v29 = @"Retrieved keybag persona Cookie from AKS, setting in APFS volume";
LABEL_13:
  sub_100012238("KBSetCookie", v29, v21, v22, v23, v24, v25, v26, v37);
  if (v19)
  {
    int v30 = v19(a2, 0LL, v40, v39);
    if (v30) {
      sub_100012238("KBSetCookie", @"APFSVolumePayloadSet failed with %d", v31, v32, v33, v34, v35, v36, v30);
    }
    else {
      sub_100012238("KBSetCookie", @"APFSVolumePayloadSet succeeded", v31, v32, v33, v34, v35, v36, v38);
    }
  }

LABEL_17:
  if (a3 && a4)
  {
    *a3 = v40;
    *a4 = v39;
  }

  else if (v40)
  {
    free(v40);
  }

  _Block_object_dispose(v57, 8);
  _Block_object_dispose(&v60, 8);
}

  _Block_object_dispose(v58, 8);
  _Block_object_dispose(&v61, 8);
}

  _Block_object_dispose(v55, 8);
  _Block_object_dispose(&v58, 8);
}
}

uint64_t sub_100006838(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6)
{
  size_t __size = 0LL;
  uint64_t v69 = 0LL;
  CFStringRef v12 = dlopen("/System/Library/PrivateFrameworks/APFS.framework/APFS", 2);
  if (!v12)
  {
    uint64_t v47 = @"Failed to open APFS framework";
    goto LABEL_11;
  }

  uint64_t v19 = v12;
  uint64_t v26 = dlsym(v12, "APFSVolumePayloadGet");
  if (!v26) {
    sub_100012238("KBMapVolume", @"Failed to resolve gAPFSVolumePayloadGet", v20, v21, v22, v23, v24, v25, v67);
  }
  if (!dlsym(v19, "APFSVolumePayloadSet")) {
    sub_100012238("KBMapVolume", @"Failed to resolve gAPFSVolumePayloadSet", v27, v28, v29, v30, v31, v32, v67);
  }
  if (v26)
  {
    int v33 = ((uint64_t (*)(uint64_t, void, void, size_t *))v26)(a3, 0LL, 0LL, &__size);
    if (v33)
    {
      int v40 = v33;
      sub_100012238("KBMapVolume", @"APFSVolumePayloadGet failed with %d", v34, v35, v36, v37, v38, v39, v33);
      if (v40 == 49154)
      {
        sub_100012238( "KBMapVolume",  @"Not cookie in this volume, attempting to write it",  v41,  v42,  v43,  v44,  v45,  v46,  v67);
        sub_1000066AC(a1, a3, &v69, &__size, a5, a6);
      }

      goto LABEL_12;
    }

    sub_100012238( "KBMapVolume",  @"APFSVolumePayloadGet len reveived to be %zd",  v34,  v35,  v36,  v37,  v38,  v39,  __size);
    char v59 = malloc(__size);
    uint64_t v69 = v59;
    if (v59)
    {
      int v60 = ((uint64_t (*)(uint64_t, void, void *, size_t *))v26)(a3, 0LL, v59, &__size);
      if (v60) {
        sub_100012238( "KBMapVolume",  @"Failed to  obtain cookie from the volume with error %d",  v61,  v62,  v63,  v64,  v65,  v66,  v60);
      }
      else {
        sub_100012238( "KBMapVolume",  @"Successfully obtained the cookie for the volume with length:%zd",  v61,  v62,  v63,  v64,  v65,  v66,  __size);
      }
      goto LABEL_12;
    }

    uint64_t v47 = @"Failed to allocate Cookie malloc space";
LABEL_11:
    sub_100012238("KBMapVolume", v47, v13, v14, v15, v16, v17, v18, v67);
  }

LABEL_12:
  if (a5)
  {
    uint64_t v48 = aks_set_keybag_for_volume_with_cookie_persona(a2, a4, 0LL, v69, __size, a6);
    uint64_t v55 = v48;
    if ((_DWORD)v48)
    {
      sub_100012238( "KBMapVolume",  @"aks_set_keybag_for_volume_with_cookie_persona FAIL with 0x%x",  v49,  v50,  v51,  v52,  v53,  v54,  v48);
      goto LABEL_20;
    }

    uint64_t v57 = @"aks_set_keybag_for_volume_with_cookie_persona SUCCESS";
  }

  else
  {
    uint64_t v56 = aks_set_keybag_for_volume_with_cookie(a2, a4, 0LL, v69, __size);
    uint64_t v55 = v56;
    if ((_DWORD)v56)
    {
      sub_100012238( "KBMapVolume",  @"aks_set_keybag_for_volume_with_cookie FAIL with 0x%x",  v49,  v50,  v51,  v52,  v53,  v54,  v56);
      goto LABEL_20;
    }

    uint64_t v57 = @"aks_set_keybag_for_volume_with_cookie SUCCESS";
  }

  sub_100012238("KBMapVolume", v57, v49, v50, v51, v52, v53, v54, v67);
LABEL_20:
  if (v69) {
    free(v69);
  }
  return v55;
}

uint64_t sub_100006AA8(const char *a1, int a2, uint64_t a3)
{
  uint64_t v47 = 0LL;
  uint64_t v48 = 0LL;
  uint64_t v49 = 0LL;
  if (statfs(a1, &v50))
  {
    CFStringRef v12 = __error();
    char v46 = strerror(*v12);
    sub_100012238("has_data_protection", @"Statfs failed due to:%s on  (%s)", v13, v14, v15, v16, v17, v18, v46);
LABEL_5:
    sub_100012238( "has_data_protection",  @"mount point (%s) does not support Data Protection",  v19,  v20,  v21,  v22,  v23,  v24,  (char)a1);
    return 0LL;
  }

  if ((v50.f_flags & 0x80) == 0)
  {
    sub_100012238( "has_data_protection",  @"mount is with NO CPROTECT:0x%x on  (%s)",  v6,  v7,  v8,  v9,  v10,  v11,  v50.f_flags);
    goto LABEL_5;
  }

  LOWORD(v47) = 5;
  LODWORD(v48) = -2147188736;
  if (getattrlist(a1, &v47, &v50, 0x41CuLL, 0))
  {
    __error();
    sub_100012238( "KBMapDeviceBag",  @"Could not get %s volume attributes (errno=%d)",  v32,  v33,  v34,  v35,  v36,  v37,  (char)a1);
    return 4294967290LL;
  }

  uint64_t v38 = (char *)&v50.f_iosize + v50.f_iosize;
  if (v38 >= &v50.f_mntonname[964] || &v38[LODWORD(v50.f_blocks)] >= &v50.f_mntonname[964])
  {
    sub_100012238( "KBMapDeviceBag",  @"Attribute buffer too small. offset=%d, lenght=%u",  (uint64_t)v38,  v27,  v28,  v29,  v30,  v31,  v50.f_iosize);
    return 4294967290LL;
  }

  uint64_t v39 = sub_100006838(0LL, 0LL, (uint64_t)v38, (uint64_t)&v50.f_blocks + 4, a2, a3);
  uint64_t v25 = sub_10000E388(v39);
  if ((_DWORD)v25) {
    sub_100012238("KBMapDeviceBag", @"Could not map %s volume (ret=%d)", v40, v41, v42, v43, v44, v45, (char)a1);
  }
  return v25;
}

uint64_t sub_100006C68(const char *a1, CFPropertyListRef *a2)
{
  CFDataRef theData = 0LL;
  CFDataRef v77 = 0LL;
  CCCryptorRef cryptorRef = 0LL;
  *a2 = 0LL;
  bzero(__str, 0x401uLL);
  size_t dataOutMoved = 0LL;
  int v4 = sub_100006F84(a1, &dataOutMoved, (CFTypeRef *)&v77, (CFTypeRef *)&theData);
  if (v4)
  {
    sub_100012238("KBSecureLoadObject", @"Failed to validate keybag file: %d, %d", v5, v6, v7, v8, v9, v10, v4);
    snprintf((char *)__str, 0x401uLL, "%s.writing", a1);
    int v11 = sub_100006F84((const char *)__str, &dataOutMoved, (CFTypeRef *)&v77, (CFTypeRef *)&theData);
    if (v11 || !dataOutMoved)
    {
      sub_100012238( "KBSecureLoadObject",  @"Failed to validate keybag file: %d",  v12,  v13,  v14,  v15,  v16,  v17,  v11);
    }

    else
    {
      char v67 = __error();
      strerror(*v67);
      sub_100012238( "KBSecureLoadObject",  @"could not rename %s to %s: %s",  v68,  v69,  v70,  v71,  v72,  v73,  (char)__str);
    }

    uint64_t v59 = 4294967288LL;
    sub_100012238( "KBSecureLoadObjectWithCrypto",  @"Can't load secure keybag Object: %d",  v61,  v62,  v63,  v64,  v65,  v66,  -8);
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
    sub_100012238( "KBSecureLoadObjectWithCrypto",  @"Can't create decryptor: %d",  v23,  v24,  v25,  v26,  v27,  v28,  v22);
    uint64_t v59 = 4294967289LL;
    goto LABEL_12;
  }

  uint64_t v29 = CFDataGetBytePtr(v18);
  size_t v30 = CFDataGetLength(v18);
  uint64_t v31 = (UInt8 *)malloc(v30);
  if (!v31)
  {
    sub_100012238( "KBSecureLoadObjectWithCrypto",  @"Can't allocate decryption buffer",  v32,  v33,  v34,  v35,  v36,  v37,  v74);
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
    sub_100012238("KBSecureLoadObjectWithCrypto", @"Unable to decrypt: %d", v43, v44, v45, v46, v47, v48, v42);
  }

  else
  {
    uint64_t v49 = cryptorRef;
    statfs v50 = &v38[dataOutMoved];
    CFIndex v51 = CFDataGetLength(v18);
    CCCryptorStatus v52 = CCCryptorFinal(v49, v50, v51 - dataOutMoved, __str);
    if (!v52)
    {
      uint64_t v59 = 0LL;
      *a2 = sub_10000DD64(v38, (LODWORD(__str[0]) + dataOutMoved));
      goto LABEL_10;
    }

    sub_100012238("KBSecureLoadObjectWithCrypto", @"Unable to finalize: %d", v53, v54, v55, v56, v57, v58, v52);
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

uint64_t sub_100006F84(const char *a1, void *a2, CFTypeRef *a3, CFTypeRef *a4)
{
  char v7 = (char)a1;
  uint64_t v8 = (const __CFDictionary *)sub_10000E140(a1);
  if (!v8)
  {
    sub_100012238("validateSecureFile", @"Unable to load %s", v9, v10, v11, v12, v13, v14, v7);
    return 0xFFFFFFFFLL;
  }

  uint64_t v15 = v8;
  Value = (const __CFNumber *)CFDictionaryGetValue(v8, @"_MKBWIPEID");
  if (!Value || (uint64_t v23 = Value, v24 = CFGetTypeID(Value), v24 != CFNumberGetTypeID()))
  {
    sub_100012238("validateSecureFile", @"%s missing wipeID", v17, v18, v19, v20, v21, v22, v7);
LABEL_35:
    CFRelease(v15);
    return 0xFFFFFFFFLL;
  }

  uint64_t v25 = CFDictionaryGetValue(v15, @"_MKBIV");
  if (!v25 || (uint64_t v32 = v25, v33 = CFGetTypeID(v25), v33 != CFDataGetTypeID()))
  {
    sub_100012238("validateSecureFile", @"%s missing IV", v26, v27, v28, v29, v30, v31, v7);
    goto LABEL_35;
  }

  uint64_t v34 = CFDictionaryGetValue(v15, @"_MKBPAYLOAD");
  if (!v34 || (size_t v41 = v34, v42 = CFGetTypeID(v34), v42 != CFDataGetTypeID()))
  {
    sub_100012238("validateSecureFile", @"%s missing payload", v35, v36, v37, v38, v39, v40, v7);
    goto LABEL_35;
  }

  CFNumberGetValue(v23, kCFNumberIntType, &valuePtr);
  unsigned int v43 = valuePtr;
  size_t v84 = 52LL;
  int v44 = sub_100004764(valuePtr, &v85, &v84);
  if (v44)
  {
    sub_100012238("loadWipeIDInfo", @"Unable to load wipe info: %08x", v45, v46, v47, v48, v49, v50, v44);
LABEL_34:
    sub_100012238( "validateSecureFile",  @"Can't load wipe info for ID:%08x",  v76,  v77,  v78,  v79,  v80,  v81,  valuePtr);
    goto LABEL_35;
  }

  if (v85 != v43)
  {
    sub_100012238("loadWipeIDInfo", @"Wipe Info ID is wrong: %d", v45, v46, v47, v48, v49, v50, v85);
    goto LABEL_34;
  }

  CFDataRef v51 = CFDataCreate(0LL, v86, 16LL);
  if (!v51)
  {
    sub_100012238("loadWipeIDInfo", @"Can't create iv data", v52, v53, v54, v55, v56, v57, v82);
    goto LABEL_34;
  }

  CFDataRef v58 = v51;
  CFDataRef v59 = CFDataCreate(0LL, v87, 32LL);
  if (!v59)
  {
    sub_100012238("loadWipeIDInfo", @"Can't create key data", v60, v61, v62, v63, v64, v65, v82);
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

  sub_100012238( "validateSecureFile",  @"fileIV to wipeIV mismatch, no payload returned",  v67,  v68,  v69,  v70,  v71,  v72,  v82);
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

CFDataRef sub_10000728C( uint64_t a1, const __CFDictionary *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if ((_DWORD)a1 != -1)
  {
    int v14 = 1;
    int lock_state = aks_get_lock_state(a1, &v14);
    if (!lock_state)
    {
      uint64_t v9 = (const __CFData *)((BYTE2(v14) >> 6) & 1);
      goto LABEL_7;
    }

    sub_100012238("KBisxARTBasedKeyBag", @"get_lock_state() -> 0x%x", a3, a4, a5, a6, a7, a8, lock_state);
LABEL_9:
    uint64_t v9 = 0LL;
    goto LABEL_7;
  }

  if (!a2) {
    goto LABEL_9;
  }
  uint64_t v10 = (const __CFData *)sub_10000DB44(a2, @"KeyBagKeys");
  uint64_t v9 = v10;
  if (v10)
  {
    BytePtr = CFDataGetBytePtr(v10);
    CFIndex Length = CFDataGetLength(v9);
    uint64_t v9 = (const __CFData *)aks_bag_in_xart(BytePtr, Length);
  }

LABEL_7:
  sub_100012238("KBisxARTBasedKeyBag", @"Result = %d", a3, a4, a5, a6, a7, a8, (char)v9);
  return v9;
}

  if (ppStmt) {
    sqlite3_finalize(ppStmt);
  }
  uint64_t v76 = v30;
  sub_10000FB00((uint64_t)&v76, v23, v24, v25, v26, v27, v28, v29, v75);
  return v30;
}

uint64_t sub_100007358(uint64_t result)
{
  qword_100029290 = result;
  return result;
}

uint64_t sub_100007364(uint64_t result)
{
  qword_100029298 = result;
  return result;
}

void sub_100007474(uint64_t a1)
{
  uint64_t v1 = objc_opt_class(*(void *)(a1 + 32));
  uint64_t v2 = objc_opt_new(v1);
  uint64_t v3 = (void *)qword_1000292A0;
  qword_1000292A0 = v2;
}

void sub_100007A44( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, char a23, uint64_t a24, uint64_t a25, uint64_t a26, char a27)
{
}

uint64_t sub_100007A78(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100007A88(uint64_t a1)
{
}

void sub_100007A90( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = "NULL";
  if (*(void *)(a1 + 64) && *(void *)(a1 + 72)) {
    uint64_t v9 = "SECRET";
  }
  sub_100012238( "-[KBXPCService changeSystemSecretfromOldSecret:oldSize:toNewSecret:newSize:opaqueData:withParams:reply:]_block_invoke",  @"oldpass=%s newpass=%s %s (params:%d)",  a3,  a4,  a5,  a6,  a7,  a8,  (char)v9);
  uint64_t v10 = *(void *)(a1 + 64);
  if (v10)
  {
    uint64_t v10 = *(void *)(a1 + 72);
    if (v10)
    {
      uint64_t v10 = *(void *)(a1 + 80);
      if (v10) {
        LOBYTE(v10) = *(void *)(a1 + 88) != 0LL;
      }
    }
  }

  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = v10;
  uint64_t v11 = sub_100012234();
  uint64_t v12 = sub_100012548();
  uint64_t v13 = *(void *)(a1 + 72);
  if (v13) {
    uint64_t v14 = *(void *)(a1 + 64);
  }
  else {
    uint64_t v14 = 0LL;
  }
  uint64_t v15 = *(void *)(a1 + 88);
  if (v15) {
    uint64_t v16 = *(void *)(a1 + 80);
  }
  else {
    uint64_t v16 = 0LL;
  }
  int v17 = sub_10000612C(v12, v11, v14, v13, v16, v15, *(const void **)(a1 + 32));
  if (v17)
  {
    int v24 = v17;
    sub_100012238( "-[KBXPCService changeSystemSecretfromOldSecret:oldSize:toNewSecret:newSize:opaqueData:withParams:reply:]_block_invoke",  @"Can't change passcode: 0x%08x",  v18,  v19,  v20,  v21,  v22,  v23,  v17);
    uint64_t v25 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v24,  0LL));
    uint64_t v26 = *(void *)(*(void *)(a1 + 48) + 8LL);
    uint64_t v27 = *(void **)(v26 + 40);
    *(void *)(v26 + 40) = v25;
  }

  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 0;
    sub_100012238( "-[KBXPCService changeSystemSecretfromOldSecret:oldSize:toNewSecret:newSize:opaqueData:withParams:reply:]_block_invoke",  @"change passcode success",  v18,  v19,  v20,  v21,  v22,  v23,  v41);
    if (*(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL))
    {
      sub_100012238( "-[KBXPCService changeSystemSecretfromOldSecret:oldSize:toNewSecret:newSize:opaqueData:withParams:reply:]_block_invoke",  @"Posting analytics stats",  v28,  v29,  v30,  v31,  v32,  v33,  v42);
      uint64_t v44 = 1LL;
      sub_10000FBC0(&v44, v34, v35, v36, v37, v38, v39, v40, v43);
    }
  }

void sub_100008188( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
}

void sub_1000081B0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v10 = "NULL";
  if (*(void *)(a1 + 64) && *(void *)(a1 + 72)) {
    uint64_t v10 = "SECRET";
  }
  sub_100012238( "-[KBXPCService changeSystemSecretWithEscrow:fromOldSecret:oldSize:toNewSecret:newSize:opaqueData:keepstate:reply:]_block_invoke",  @"oldpass=%s newpass=%s %s",  a3,  a4,  a5,  a6,  a7,  a8,  (char)v10);
  uint64_t v11 = *(void *)(a1 + 72);
  if (v11) {
    uint64_t v12 = *(void *)(a1 + 64);
  }
  else {
    uint64_t v12 = 0LL;
  }
  uint64_t v13 = *(void *)(a1 + 88);
  if (v13) {
    uint64_t v14 = *(void *)(a1 + 80);
  }
  else {
    uint64_t v14 = 0LL;
  }
  int v15 = sub_1000063E0( *(const __CFData **)(a1 + 40),  v12,  v11,  v14,  v13,  *(unsigned __int8 *)(a1 + 96),  *(const void **)(a1 + 32));
  if (v15)
  {
    int v22 = v15;
    sub_100012238( "-[KBXPCService changeSystemSecretWithEscrow:fromOldSecret:oldSize:toNewSecret:newSize:opaqueData:keepstate:reply:]_block_invoke",  @"Can't change passcode: 0x%08x",  v16,  v17,  v18,  v19,  v20,  v21,  v15);
    uint64_t v23 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v22,  0LL));
    uint64_t v24 = *(void *)(*(void *)(a1 + 48) + 8LL);
    uint64_t v25 = *(void **)(v24 + 40);
    *(void *)(v24 + 40) = v23;
  }

  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 0;
    sub_100012238( "-[KBXPCService changeSystemSecretWithEscrow:fromOldSecret:oldSize:toNewSecret:newSize:opaqueData:keepstate:reply:]_block_invoke",  @"change passcode success",  v16,  v17,  v18,  v19,  v20,  v21,  a9);
  }

void sub_100009CD4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, char a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, char a26)
{
}

void sub_100009CFC(uint64_t a1)
{
  uint64_t v2 = *(const __CFDictionary **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 64);
  if (v3) {
    uint64_t v4 = *(void *)(a1 + 72);
  }
  else {
    uint64_t v4 = 0LL;
  }
  int v5 = sub_1000110EC(v2, *(unsigned int *)(a1 + 80), v4, v3, *(_DWORD *)(a1 + 84), *(const void **)(a1 + 40));
  if (v5)
  {
    int v12 = v5;
    sub_100012238( "-[KBXPCService createKeybagForUserSession:withSessionUID:WithSecret:secretSize:withGracePeriod:withOpaqeStuff:with Reply:]_block_invoke",  @"Can't createKeybag for usersession(uid=%d): 0x%08x",  v6,  v7,  v8,  v9,  v10,  v11,  *(_DWORD *)(a1 + 80));
    uint64_t v13 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v12,  0LL));
    uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8LL);
    int v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;
  }

  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 0;
    sub_100012238( "-[KBXPCService createKeybagForUserSession:withSessionUID:WithSecret:secretSize:withGracePeriod:withOpaqeStuff:with Reply:]_block_invoke",  @"Created keybag for user:%d success",  v6,  v7,  v8,  v9,  v10,  v11,  *(_DWORD *)(a1 + 80));
  }

void sub_10000A128( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, char a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, char a26)
{
}

void sub_10000A150( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v10 = *(const __CFDictionary **)(a1 + 32);
  uint64_t v11 = *(void *)(a1 + 56);
  if (v11) {
    uint64_t v12 = *(void *)(a1 + 64);
  }
  else {
    uint64_t v12 = 0LL;
  }
  int v13 = sub_100010A5C( v10,  *(unsigned int *)(a1 + 72),  v12,  v11,  *(unsigned __int8 *)(a1 + 80),  *(_DWORD *)(a1 + 76),  *(unsigned __int8 *)(a1 + 81));
  if (v13)
  {
    int v20 = v13;
    sub_100012238( "-[KBXPCService loadKeybagForUserSession:withSessionID:withSecret:secretSize:shouldSetGracePeriod:withGracePeriod:i sInEarlyStar:withReply:]_block_invoke",  @"Can't loadkeybag for usersession(uid=%d): 0x%08x",  v14,  v15,  v16,  v17,  v18,  v19,  *(_DWORD *)(a1 + 72));
    uint64_t v21 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v20,  0LL));
    uint64_t v22 = *(void *)(*(void *)(a1 + 40) + 8LL);
    uint64_t v23 = *(void **)(v22 + 40);
    *(void *)(v22 + 40) = v21;
  }

  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 0;
    sub_100012238( "-[KBXPCService loadKeybagForUserSession:withSessionID:withSecret:secretSize:shouldSetGracePeriod:withGracePeriod:i sInEarlyStar:withReply:]_block_invoke",  @"loadUserKeybag successful",  v14,  v15,  v16,  v17,  v18,  v19,  a9);
  }

void sub_10000A350( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_10000A368( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  int v10 = sub_10001141C(*(unsigned int *)(a1 + 40), a2, a3, a4, a5, a6, a7, a8);
  if (v10)
  {
    int v17 = v10;
    sub_100012238( "-[KBXPCService unloadKeybagForUserSession:withReply:]_block_invoke",  @"Can't unloadkeybag for usersession(uid=%d): 0x%08x",  v11,  v12,  v13,  v14,  v15,  v16,  *(_DWORD *)(a1 + 40));
    uint64_t v18 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v17,  0LL));
    uint64_t v19 = *(void *)(*(void *)(a1 + 32) + 8LL);
    int v20 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = v18;
  }

  else
  {
    sub_100012238( "-[KBXPCService unloadKeybagForUserSession:withReply:]_block_invoke",  @"unloadUserKeybag successful",  v11,  v12,  v13,  v14,  v15,  v16,  a9);
  }

void sub_10000A558( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_10000A570( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  int v10 = sub_100005A9C(0xFFFFFFFFLL, *(unsigned int *)(a1 + 40), 0LL, 0);
  if (v10)
  {
    int v17 = v10;
    sub_100012238( "-[KBXPCService deleteKeybagForUserSession:withReply:]_block_invoke",  @"Can't invalidate keybag for usersession(uid=%d): 0x%08x",  v11,  v12,  v13,  v14,  v15,  v16,  *(_DWORD *)(a1 + 40));
    uint64_t v18 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v17,  0LL));
    uint64_t v19 = *(void *)(*(void *)(a1 + 32) + 8LL);
    int v20 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = v18;
  }

  else
  {
    sub_100012238( "-[KBXPCService deleteKeybagForUserSession:withReply:]_block_invoke",  @"deleteUserKeybag successful",  v11,  v12,  v13,  v14,  v15,  v16,  a9);
  }

void sub_10000A798( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t sub_10000A7B0(uint64_t a1)
{
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  *(_OWORD *)in = 0u;
  __int128 v30 = 0u;
  if (CFStringGetCString(*(CFStringRef *)(a1 + 32), buffer, 1024LL, 0x8000100u))
  {
    if (CFStringGetCString(*(CFStringRef *)(a1 + 40), in, 256LL, 0x8000100u))
    {
      if (uuid_parse(in, uu))
      {
        uint64_t v5 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  22LL,  0LL));
        uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8LL);
        uint64_t v7 = *(void **)(v6 + 40);
        *(void *)(v6 + 40) = v5;

        uint64_t v14 = @"failed to parse unique string to uuid_t";
      }

      else
      {
        int v22 = sub_100011394(0LL, 0LL, 0LL, buffer, (uint64_t)uu, v2, v3, v4);
        if (v22)
        {
          int v23 = v22;
          sub_100012238( "-[KBXPCService setVolumeToPersona:withPersonaString:withReply:]_block_invoke",  @"Can't map volumepath:%s to uuid with error: 0x%08x",  v8,  v9,  v10,  v11,  v12,  v13,  (char)buffer);
          uint64_t v24 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v23,  0LL));
          uint64_t v25 = *(void *)(*(void *)(a1 + 56) + 8LL);
          uint64_t v26 = *(void **)(v25 + 40);
          *(void *)(v25 + 40) = v24;

          return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16LL))();
        }

        uint64_t v14 = @"setupKeybagForPersona successful";
      }
    }

    else
    {
      uint64_t v18 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  22LL,  0LL));
      uint64_t v19 = *(void *)(*(void *)(a1 + 56) + 8LL);
      int v20 = *(void **)(v19 + 40);
      *(void *)(v19 + 40) = v18;

      uint64_t v14 = @"Failed to get cstring from uuid string";
    }
  }

  else
  {
    uint64_t v15 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  22LL,  0LL));
    uint64_t v16 = *(void *)(*(void *)(a1 + 56) + 8LL);
    int v17 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = v15;

    uint64_t v14 = @"Failed to get volume path";
  }

  sub_100012238( "-[KBXPCService setVolumeToPersona:withPersonaString:withReply:]_block_invoke",  v14,  v8,  v9,  v10,  v11,  v12,  v13,  v27);
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

void sub_10000AB64( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_10000AB7C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  int v10 = sub_1000114E8(*(void *)(a1 + 32), *(unsigned int *)(a1 + 48), a3, a4, a5, a6, a7, a8);
  if (v10)
  {
    int v17 = v10;
    sub_100012238( "-[KBXPCService createSyncBagForUserSession:withSessionUID:withReply:]_block_invoke",  @"Can't unloadkeybag for usersession(uid=%d): 0x%08x",  v11,  v12,  v13,  v14,  v15,  v16,  *(_DWORD *)(a1 + 48));
    uint64_t v18 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v17,  0LL));
    uint64_t v19 = *(void *)(*(void *)(a1 + 40) + 8LL);
    int v20 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = v18;
  }

  else
  {
    sub_100012238( "-[KBXPCService createSyncBagForUserSession:withSessionUID:withReply:]_block_invoke",  @"createSyncbag successful",  v11,  v12,  v13,  v14,  v15,  v16,  a9);
  }

void sub_10000AD84( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_10000AD9C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  int v10 = sub_10001175C(*(const __CFDictionary **)(a1 + 32), *(unsigned int *)(a1 + 48), a3, a4, a5, a6, a7, a8);
  if (v10)
  {
    int v17 = v10;
    sub_100012238( "-[KBXPCService loadSyncBagForUserSession:withSessionUID:withReply:]_block_invoke",  @"Can't unloadkeybag for usersession(uid=%d): 0x%08x",  v11,  v12,  v13,  v14,  v15,  v16,  *(_DWORD *)(a1 + 48));
    uint64_t v18 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v17,  0LL));
    uint64_t v19 = *(void *)(*(void *)(a1 + 40) + 8LL);
    int v20 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = v18;
  }

  else
  {
    sub_100012238( "-[KBXPCService loadSyncBagForUserSession:withSessionUID:withReply:]_block_invoke",  @"loadSyncbag successful",  v11,  v12,  v13,  v14,  v15,  v16,  a9);
  }

void sub_10000AFA4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_10000AFBC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  int v10 = sub_100011CBC(*(void *)(a1 + 32), *(unsigned int *)(a1 + 48));
  if (v10)
  {
    int v17 = v10;
    sub_100012238( "-[KBXPCService verifySyncBagForUserSession:withSessionUID:withReply:]_block_invoke",  @"Can't unloadkeybag for usersession(uid=%d): 0x%08x",  v11,  v12,  v13,  v14,  v15,  v16,  *(_DWORD *)(a1 + 48));
    uint64_t v18 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v17,  0LL));
    uint64_t v19 = *(void *)(*(void *)(a1 + 40) + 8LL);
    int v20 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = v18;
  }

  else
  {
    sub_100012238( "-[KBXPCService verifySyncBagForUserSession:withSessionUID:withReply:]_block_invoke",  @"verifySyncbag successful",  v11,  v12,  v13,  v14,  v15,  v16,  a9);
  }

void sub_10000B1C4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_10000B1DC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  int v10 = sub_100012234();
  sub_100012238( "-[KBXPCService unloadSyncBagForUserSession:withSessionUID:withReply:]_block_invoke",  @"currentFGID:%d, session uid:%d",  v11,  v12,  v13,  v14,  v15,  v16,  v10);
  if (*(_DWORD *)(a1 + 48) == v10)
  {
    int v23 = @"No need to unload syncbag for current user, skip..";
  }

  else
  {
    sub_100012238( "-[KBXPCService unloadSyncBagForUserSession:withSessionUID:withReply:]_block_invoke",  @"Unloading the bag",  v17,  v18,  v19,  v20,  v21,  v22,  v35);
    int v30 = sub_100011D90(*(void *)(a1 + 32), *(unsigned int *)(a1 + 48), v24, v25, v26, v27, v28, v29);
    if (v30)
    {
      int v31 = v30;
      sub_100012238( "-[KBXPCService unloadSyncBagForUserSession:withSessionUID:withReply:]_block_invoke",  @"Can't unloadkeybag for usersession(uid=%d): 0x%08x",  v17,  v18,  v19,  v20,  v21,  v22,  *(_DWORD *)(a1 + 48));
      uint64_t v32 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v31,  0LL));
      uint64_t v33 = *(void *)(*(void *)(a1 + 40) + 8LL);
      __int128 v34 = *(void **)(v33 + 40);
      *(void *)(v33 + 40) = v32;

      return;
    }

    int v23 = @"unloadSyncbag successful";
  }

  sub_100012238( "-[KBXPCService unloadSyncBagForUserSession:withSessionUID:withReply:]_block_invoke",  v23,  v17,  v18,  v19,  v20,  v21,  v22,  a9);
}

void sub_10000B434( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_10000B44C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  int v10 = sub_100012234();
  sub_100012238( "-[KBXPCService removeSyncBagForUserSession:withSessionUID:withReply:]_block_invoke",  @"currentFGID:%d, session uid:%d",  v11,  v12,  v13,  v14,  v15,  v16,  v10);
  int v23 = *(_DWORD *)(a1 + 48);
  BOOL v24 = v23 == v10;
  BOOL v25 = v23 != v10;
  if (v24) {
    uint64_t v26 = @"removing syncbag for current user, only sync bag will be cleared";
  }
  else {
    uint64_t v26 = @"Syncbag removal for non foreground user, unloading session bag as well";
  }
  sub_100012238( "-[KBXPCService removeSyncBagForUserSession:withSessionUID:withReply:]_block_invoke",  v26,  v17,  v18,  v19,  v20,  v21,  v22,  v43);
  int v32 = sub_100011A40(*(__CFDictionary **)(a1 + 32), *(unsigned int *)(a1 + 48), v25, v27, v28, v29, v30, v31);
  if (v32)
  {
    int v39 = v32;
    sub_100012238( "-[KBXPCService removeSyncBagForUserSession:withSessionUID:withReply:]_block_invoke",  @"Can't unloadkeybag for usersession(uid=%d): 0x%08x",  v33,  v34,  v35,  v36,  v37,  v38,  *(_DWORD *)(a1 + 48));
    uint64_t v40 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v39,  0LL));
    uint64_t v41 = *(void *)(*(void *)(a1 + 40) + 8LL);
    __int128 v42 = *(void **)(v41 + 40);
    *(void *)(v41 + 40) = v40;
  }

  else
  {
    sub_100012238( "-[KBXPCService removeSyncBagForUserSession:withSessionUID:withReply:]_block_invoke",  @"removeSyncbag successful",  v33,  v34,  v35,  v36,  v37,  v38,  a9);
  }

void sub_10000B898( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, char a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, char a26)
{
}

void sub_10000B8C0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v10 = *(unsigned int *)(a1 + 80);
  uint64_t v11 = *(void *)(a1 + 64);
  if (v11) {
    uint64_t v12 = *(void *)(a1 + 72);
  }
  else {
    uint64_t v12 = 0LL;
  }
  int v13 = sub_100011E60(v10, *(const __CFString **)(a1 + 32), *(const __CFString **)(a1 + 40), v12, v11);
  if (v13)
  {
    int v20 = v13;
    sub_100012238( "-[KBXPCService createPersonaKeyForUserSession:forPath:withUID:WithSecret:secretSize:withReply:]_block_invoke",  @"Can't create persona key for user with error: 0x%08x",  v14,  v15,  v16,  v17,  v18,  v19,  v13);
    uint64_t v21 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v20,  0LL));
    uint64_t v22 = *(void *)(*(void *)(a1 + 48) + 8LL);
    int v23 = *(void **)(v22 + 40);
    *(void *)(v22 + 40) = v21;
  }

  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 0;
    sub_100012238( "-[KBXPCService createPersonaKeyForUserSession:forPath:withUID:WithSecret:secretSize:withReply:]_block_invoke",  @"createPersonaKey successful",  v14,  v15,  v16,  v17,  v18,  v19,  a9);
  }

void sub_10000BB0C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_10000BB24( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  int v10 = sub_100012044(*(_DWORD *)(a1 + 56), *(CFStringRef *)(a1 + 32), *(const __CFString **)(a1 + 40));
  if (v10)
  {
    int v17 = v10;
    sub_100012238( "-[KBXPCService removePersonaKeyForUserSession:withUID:withVolumeUUIDString:withReply:]_block_invoke",  @"Can't delete persona key for user: 0x%08x",  v11,  v12,  v13,  v14,  v15,  v16,  v10);
    uint64_t v18 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v17,  0LL));
    uint64_t v19 = *(void *)(*(void *)(a1 + 48) + 8LL);
    int v20 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = v18;
  }

  else
  {
    sub_100012238( "-[KBXPCService removePersonaKeyForUserSession:withUID:withVolumeUUIDString:withReply:]_block_invoke",  @"removePersonaKey successful",  v11,  v12,  v13,  v14,  v15,  v16,  a9);
  }

id sub_10000BBC8()
{
  int v0 = objc_opt_new(&OBJC_CLASS___KBXPCListener);
  uint64_t v1 = (void *)qword_1000292B8;
  qword_1000292B8 = (uint64_t)v0;

  uint64_t v2 = -[NSXPCListener initWithMachServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCListener),  "initWithMachServiceName:",  @"com.apple.mobile.keybagd.xpc");
  uint64_t v3 = (void *)qword_1000292B0;
  qword_1000292B0 = (uint64_t)v2;

  [(id)qword_1000292B0 setDelegate:qword_1000292B8];
  return [(id)qword_1000292B0 resume];
}

void sub_10000BD20(_Unwind_Exception *a1)
{
}

void sub_10000BD34(id a1)
{
  qword_1000292C0 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
}

id sub_10000BECC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_persistentStateQueue_beginSpeculativeFailureCharge");
}

id sub_10000BF2C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_persistentStateQueue_rollbackSpeculativeFailureCharge");
}

id sub_10000BF8C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_persistentStateQueue_unlockSucceeded");
}

id sub_10000BFEC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_persistentStateQueue_unlockFailed");
}

uint64_t sub_10000C088(uint64_t result)
{
  *(_BYTE *)(*(void *)(*(void *)(result + 40) + 8LL) + 24LL) = *(_BYTE *)(*(void *)(result + 32) + 57LL);
  return result;
}

double sub_10000C16C(uint64_t a1)
{
  double result = *(double *)(*(void *)(a1 + 32) + 64LL);
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = result;
  return result;
}

uint64_t sub_10000C210(uint64_t result)
{
  *(_BYTE *)(*(void *)(*(void *)(result + 40) + 8LL) + 24LL) = *(_BYTE *)(*(void *)(result + 32) + 56LL);
  return result;
}

uint64_t sub_10000C2B0(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8LL) + 24LL) = *(void *)(*(void *)(result + 32) + 72LL);
  return result;
}

NSDictionary *sub_10000C8E8(uint64_t a1)
{
  id v1 = +[MKBDeviceLockModelEducationalMode sharedLockModelWithUID:]( &OBJC_CLASS___MKBDeviceLockModelEducationalMode,  "sharedLockModelWithUID:",  a1);
  [v1 timeUntilUnblockedSinceReferenceDate];
  double v3 = v2;
  -[NSDate timeIntervalSinceReferenceDate]( +[NSDate date](&OBJC_CLASS___NSDate, "date"),  "timeIntervalSinceReferenceDate");
  double v5 = v4;
  double v6 = 0.0;
  if (v3 > v5) {
    -[NSDate timeIntervalSinceNow]( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  v3),  "timeIntervalSinceNow");
  }
  v8[0] = @"TimeUntilUnblockedSinceReferenceDate";
  v9[0] = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v6);
  v8[1] = @"FailedPasscodeAttempts";
  v9[1] = +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v1 failedPasscodeAttempts]);
  v8[2] = @"IsPermanentlyBlocked";
  v9[2] = +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v1 isPermanentlyBlocked]);
  v8[3] = @"IsWipePending";
  v9[3] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v1 isWipePending]);
  return  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v9,  v8,  4LL);
}

id sub_10000CA50(uint64_t a1)
{
  return objc_msgSend( +[MKBDeviceLockModelEducationalMode sharedLockModelWithUID:]( MKBDeviceLockModelEducationalMode,  "sharedLockModelWithUID:",  a1),  "notePasscodeEntryBegan");
}

id sub_10000CA70(uint64_t a1)
{
  return objc_msgSend( +[MKBDeviceLockModelEducationalMode sharedLockModelWithUID:]( MKBDeviceLockModelEducationalMode,  "sharedLockModelWithUID:",  a1),  "notePasscodeUnlockSucceeded");
}

id sub_10000CA90(uint64_t a1)
{
  return objc_msgSend( +[MKBDeviceLockModelEducationalMode sharedLockModelWithUID:]( MKBDeviceLockModelEducationalMode,  "sharedLockModelWithUID:",  a1),  "notePasscodeUnlockFailed");
}

uint64_t sub_10000CAB0(sqlite3 *a1, int a2)
{
  errmsg = 0LL;
  if (a2) {
    double v2 = "BEGIN TRANSACTION";
  }
  else {
    double v2 = "END TRANSACTION";
  }
  uint64_t v3 = sqlite3_exec(a1, v2, 0LL, 0LL, &errmsg);
  if (errmsg) {
    sqlite3_free(errmsg);
  }
  return v3;
}

BOOL sub_10000CB10(sqlite3 *a1)
{
  ppStmt = 0LL;
  BOOL v2 = sqlite3_prepare_v2(a1, "PRAGMA integrity_check;", -1, &ppStmt, 0LL)
    || sqlite3_step(ppStmt) != 100
    || (id v1 = sqlite3_column_text(ppStmt, 0)) == 0LL
    || strncasecmp((const char *)v1, "ok", 3uLL) != 0;
  if (ppStmt) {
    sqlite3_finalize(ppStmt);
  }
  return v2;
}

uint64_t sub_10000CBA0(sqlite3 *a1)
{
  uint64_t v2 = sqlite3_file_control(a1, 0LL, 101, 0LL);
  if (!(_DWORD)v2) {
    return (sub_10000CBFC(a1, v3, v4, v5, v6, v7, v8, v9) - 1);
  }
  uint64_t v10 = v2;
  sub_100012238("db_truncate", @"unable to truncate", v4, v5, v6, v7, v8, v9, v12);
  return v10;
}

BOOL sub_10000CBFC( sqlite3 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  errmsg = 0LL;
  sub_100012238("init_db", @"initializing sqlite db", a3, a4, a5, a6, a7, a8, v17);
  int v15 = sqlite3_exec( a1,  "DROP TABLE IF EXISTS WrappedKeys;CREATE TABLE WrappedKeys(Inode INT, Uuid BLOB, Key BLOB, Flagged BOOLEAN DEFA"
          "ULT 0, AddTime TIMESTAMP DEFAULT 0, ClearTime TIMESTAMP DEFAULT 0, AccessTime TIMESTAMP DEFAULT 0, unique(Inod"
          "e, Uuid));CREATE INDEX Inode ON WrappedKeys(Inode);CREATE INDEX InodeUuid ON WrappedKeys(Inode, Uuid);PRAGMA u"
          "ser_version = 3;",
          0LL,
          0LL,
          &errmsg);
  if (v15)
  {
    sub_100012238("init_db", @"sqlite error: %s", v9, v10, v11, v12, v13, v14, (char)errmsg);
    sqlite3_free(errmsg);
  }

  return v15 == 0;
}

sqlite3 *sub_10000CC88(const char *a1, int a2, int a3, uint64_t a4)
{
  char v5 = a3;
  ppDb = 0LL;
  memset(&v43, 0, sizeof(v43));
  if (a2 && a3)
  {
    if (!a4) {
      return 0LL;
    }
    int v40 = 1;
LABEL_48:
    double result = 0LL;
    *(_DWORD *)(a4 + 20) = v40;
    return result;
  }

  if (a3) {
    int v7 = 1;
  }
  else {
    int v7 = 2;
  }
  if (a2) {
    int v8 = v7 | 4;
  }
  else {
    int v8 = v7;
  }
  if (!sub_1000125DC())
  {
    if (!a4) {
      return 0LL;
    }
    int v40 = 2;
    goto LABEL_48;
  }

  int v42 = 0;
  char v9 = 0;
  int v10 = v8 | 0x300000;
  char v11 = 1;
  while (1)
  {
    char v12 = v11;
    int v13 = stat(a1, &v43);
    BOOL v14 = v13 == 0;
    int v15 = sqlite3_open_v2(a1, &ppDb, v10, 0LL);
    if (v15)
    {
      if (a4) {
        *(_DWORD *)(a4 + 24) = v15;
      }
      int v22 = 4;
      goto LABEL_23;
    }

    if (_sqlite3_maintain_load_factor(ppDb, 0LL)) {
      sub_100012238( "db_open_mode_with_stats",  @"_sqlite3_maintain_load_factor for %s failed: %d",  v16,  v17,  v18,  v19,  v20,  v21,  (char)a1);
    }
    double result = ppDb;
    if (v13)
    {
      if (!ppDb) {
        goto LABEL_44;
      }
      goto LABEL_38;
    }

    uint64_t v31 = ppDb;
    errmsg = 0LL;
    sub_100012238("db_migrate_from_v2", @"Migrating backup db from v2", v25, v26, v27, v28, v29, v30, v41);
    if (!sqlite3_exec( v31,  "ALTER TABLE WrappedKeys ADD COLUMN AddTime TIMESTAMP DEFAULT 0;ALTER TABLE WrappedKeys ADD COLUMN AccessTime"
            " TIMESTAMP DEFAULT 0;ALTER TABLE WrappedKeys ADD COLUMN ClearTime TIMESTAMP DEFAULT 0;PRAGMA user_version = 3;",
            0LL,
            0LL,
            &errmsg))
      break;
    sub_100012238("db_migrate_from_v2", @"sqlite error: %s", v32, v33, v34, v35, v36, v37, (char)errmsg);
    sqlite3_free(errmsg);
    int v22 = 7;
LABEL_23:
    int v42 = v22;
    sub_100012238( "db_open_mode_with_stats",  @"db(%d) @ %s has a problem, rc=%d, version=%d",  v16,  v17,  v18,  v19,  v20,  v21,  v9);
    if (ppDb)
    {
      if ((v5 & 1) != 0)
      {
        sqlite3_close(ppDb);
        ppDb = 0LL;
      }

      else
      {
        int v38 = sub_10000CBA0(ppDb);
        if (a4) {
          *(_BYTE *)(a4 + 2_Block_object_dispose(va, 8) = 1;
        }
        sqlite3_close(ppDb);
        ppDb = 0LL;
        if (v38)
        {
          unlink(a1);
          if (a4) {
            *(_BYTE *)(a4 + 29) = 1;
          }
        }
      }
    }

    char v11 = 0;
    char v9 = 1;
    if ((v12 & 1) == 0) {
      goto LABEL_36;
    }
  }

  if (sub_10000CF2C(ppDb) != 3)
  {
    int v22 = 6;
    goto LABEL_23;
  }

  BOOL v14 = 1;
LABEL_36:
  double result = ppDb;
  if (!ppDb)
  {
LABEL_44:
    int v40 = v42;
    if (a4) {
      goto LABEL_48;
    }
    return 0LL;
  }

  if (v14) {
    return result;
  }
LABEL_38:
  BOOL v39 = sub_10000CBFC(result, v23, v16, v17, v18, v19, v20, v21);
  double result = ppDb;
  if (v39) {
    return result;
  }
  sqlite3_close(ppDb);
  if (a4)
  {
    int v40 = 3;
    goto LABEL_48;
  }

  return 0LL;
}

uint64_t sub_10000CF2C(sqlite3 *a1)
{
  ppStmt = 0LL;
  if (sqlite3_prepare_v2(a1, "PRAGMA user_version;", -1, &ppStmt, 0LL) || sqlite3_step(ppStmt) != 100) {
    uint64_t v1 = 0LL;
  }
  else {
    uint64_t v1 = sqlite3_column_int(ppStmt, 0);
  }
  if (ppStmt) {
    sqlite3_finalize(ppStmt);
  }
  return v1;
}

sqlite3 *sub_10000CFA4(const char *a1, int a2, int a3)
{
  return sub_10000CC88(a1, a2, a3, 0LL);
}

uint64_t sub_10000CFAC(sqlite3 *a1)
{
  uint64_t v1 = sqlite3_close(a1);
  uint64_t v8 = v1;
  if ((_DWORD)v1) {
    sub_100012238("db_close", @"failed to close sqlite with %d", v2, v3, v4, v5, v6, v7, v1);
  }
  return v8;
}

uint64_t sub_10000CFF4(sqlite3 *a1, sqlite3_int64 *a2, const void *a3, int *a4)
{
  ppStmt = 0LL;
  int v8 = sqlite3_prepare_v2( a1,  "REPLACE INTO WrappedKeys (Inode, Uuid, Key, AddTime) VALUES(?, ?, ?, datetime('now', 'subsec'))",  -1,  &ppStmt,  0LL);
  if (v8)
  {
    int v22 = v8;
    char v23 = sqlite3_errmsg(a1);
    sub_100012238("db_add_item_with_error", @"Cannot prepare statement: %s", v24, v25, v26, v27, v28, v29, v23);
    uint64_t v20 = 2LL;
    if (!a4) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }

  int v9 = sqlite3_bind_int64(ppStmt, 1, *a2);
  if (v9)
  {
    int v22 = v9;
    char v30 = sqlite3_errmsg(a1);
    sub_100012238("db_add_item_with_error", @"Cannot bind inode int64 %s", v31, v32, v33, v34, v35, v36, v30);
    uint64_t v20 = 3LL;
    if (!a4) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }

  int v10 = sqlite3_bind_blob(ppStmt, 2, a2 + 1, 16, 0LL);
  if (v10)
  {
    int v22 = v10;
    char v37 = sqlite3_errmsg(a1);
    sub_100012238("db_add_item_with_error", @"Cannot bind uuid blob %s", v38, v39, v40, v41, v42, v43, v37);
    uint64_t v20 = 4LL;
    if (!a4) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }

  int v11 = sqlite3_bind_blob(ppStmt, 3, a3, 108, 0LL);
  if (v11)
  {
    int v22 = v11;
    char v44 = sqlite3_errmsg(a1);
    sub_100012238("db_add_item_with_error", @"Cannot bind key blob %s", v45, v46, v47, v48, v49, v50, v44);
    uint64_t v20 = 5LL;
    if (!a4) {
      goto LABEL_7;
    }
LABEL_19:
    *a4 = v22;
    goto LABEL_7;
  }

  int v12 = sqlite3_step(ppStmt);
  if (v12 == 101)
  {
    uint64_t v20 = 0LL;
    goto LABEL_7;
  }

  int v22 = v12;
  char v51 = sqlite3_errmsg(a1);
  sub_100012238("db_add_item_with_error", @"step failed: %s", v52, v53, v54, v55, v56, v57, v51);
  uint64_t v20 = 6LL;
  if (a4) {
    goto LABEL_19;
  }
LABEL_7:
  if (ppStmt) {
    sqlite3_finalize(ppStmt);
  }
  uint64_t v59 = v20;
  sub_10000FA40((uint64_t)&v59, v13, v14, v15, v16, v17, v18, v19, v58);
  return v20;
}

uint64_t sub_10000D1C8(sqlite3 *a1, sqlite3_int64 *a2, _OWORD *a3, CFTypeRef *a4)
{
  ppStmt = 0LL;
  int v8 = sqlite3_prepare_v2( a1,  "UPDATE WrappedKeys SET AccessTime = (CASE WHEN Key NOT NULL THEN datetime('now', 'subsec') END) WHERE Inode = ? AND Uuid = ? RETURNING Key, AddTime, AccessTime, ClearTime",  -1,  &ppStmt,  0LL);
  if (v8)
  {
    int v38 = v8;
    char v39 = sqlite3_errmsg(a1);
    sub_100012238("db_get_item", @"Failed to execute get statement: %s\n", v40, v41, v42, v43, v44, v45, v39);
    uint64_t v13 = 0LL;
    char v37 = 0LL;
    uint64_t v14 = 0LL;
    uint64_t v30 = 2LL;
  }

  else
  {
    int v9 = sqlite3_bind_int64(ppStmt, 1, *a2);
    if (v9)
    {
      int v38 = v9;
      char v46 = sqlite3_errmsg(a1);
      sub_100012238("db_get_item", @"Cannot bind inode int64 %s", v47, v48, v49, v50, v51, v52, v46);
      uint64_t v13 = 0LL;
      char v37 = 0LL;
      uint64_t v14 = 0LL;
      uint64_t v30 = 3LL;
    }

    else
    {
      int v10 = sqlite3_bind_blob(ppStmt, 2, a2 + 1, 16, 0LL);
      if (v10)
      {
        int v38 = v10;
        char v53 = sqlite3_errmsg(a1);
        sub_100012238("db_get_item", @"Cannot bind uuid blob %s", v54, v55, v56, v57, v58, v59, v53);
        uint64_t v13 = 0LL;
        char v37 = 0LL;
        uint64_t v14 = 0LL;
        uint64_t v30 = 4LL;
      }

      else
      {
        int v11 = sqlite3_step(ppStmt);
        if (v11 == 100)
        {
          int v12 = sqlite3_column_bytes(ppStmt, 0);
          uint64_t v13 = (char *)sqlite3_column_text(ppStmt, 1);
          uint64_t v14 = (char *)sqlite3_column_text(ppStmt, 2);
          uint64_t v15 = sqlite3_column_text(ppStmt, 3);
          if (v12 == 108)
          {
            int v22 = sqlite3_column_blob(ppStmt, 0);
            uint64_t v30 = 0LL;
            __int128 v32 = v22[1];
            __int128 v31 = v22[2];
            *a3 = *v22;
            a3[1] = v32;
            a3[2] = v31;
            __int128 v34 = v22[4];
            __int128 v33 = v22[5];
            __int128 v35 = v22[3];
            *(_OWORD *)((char *)a3 + 92) = *(_OWORD *)((char *)v22 + 92);
            a3[4] = v34;
            a3[5] = v33;
            a3[3] = v35;
            goto LABEL_7;
          }

          char v37 = (char *)v15;
          if (v12)
          {
            sub_100012238("db_get_item", @"Invalid Key", v16, v17, v18, v19, v20, v21, v75);
            uint64_t v30 = 8LL;
          }

          else
          {
            sub_100012238("db_get_item", @"Cleared Key", v16, v17, v18, v19, v20, v21, v75);
            uint64_t v30 = 7LL;
          }

          int v38 = 100;
        }

        else
        {
          int v38 = v11;
          sqlite3_errmsg(a1);
          sub_100012238("db_get_item", @"Step failed rc=%d, %s", v60, v61, v62, v63, v64, v65, v38);
          uint64_t v13 = 0LL;
          char v37 = 0LL;
          uint64_t v14 = 0LL;
          uint64_t v30 = 6LL;
        }
      }
    }
  }

  if (a4)
  {
    Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    int valuePtr = v38;
    CFNumberRef v67 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
    if (v67)
    {
      CFNumberRef v74 = v67;
      CFDictionaryAddValue(Mutable, @"sqlError", v67);
      CFRelease(v74);
    }

    else
    {
      sub_100012238( "CFDictionaryAddInt",  @"Internal error: could not create CFNumber from int",  v68,  v69,  v70,  v71,  v72,  v73,  v75);
    }

    sub_10000D518(Mutable, @"added", v13);
    sub_10000D518(Mutable, @"accessed", v14);
    sub_10000D518(Mutable, @"cleared", v37);
    if (*a4) {
      CFRelease(*a4);
    }
    *a4 = CFErrorCreate(kCFAllocatorDefault, @"MobileKeyBagError.DbGetError", v30, Mutable);
    if (Mutable) {
      CFRelease(Mutable);
    }
  }

void sub_10000D518(__CFDictionary *a1, const void *a2, char *cStr)
{
  if (cStr)
  {
    char v3 = (char)cStr;
    CFStringRef v6 = CFStringCreateWithCString(kCFAllocatorDefault, cStr, 0x8000100u);
    if (v6)
    {
      CFStringRef v13 = v6;
      CFDictionaryAddValue(a1, a2, v6);
      CFRelease(v13);
    }

    else
    {
      sub_100012238( "CFDictionaryAddSQLStringIfNotNull",  @"Internal error: could not create CFString from C string %s",  v7,  v8,  v9,  v10,  v11,  v12,  v3);
    }
  }

uint64_t sub_10000D5B4(sqlite3 *a1, const void *a2)
{
  ppStmt = 0LL;
  uint64_t v4 = 0xFFFFFFFFLL;
  if (sqlite3_prepare_v2(a1, "DELETE FROM WrappedKeys WHERE Uuid = ?", -1, &ppStmt, 0LL))
  {
    CFStringRef v6 = @"Failed to execute get statement: %s\n";
  }

  else if (sqlite3_bind_blob(ppStmt, 1, a2, 16, 0LL))
  {
    uint64_t v4 = 5LL;
    CFStringRef v6 = @"Cannot bind uuid blob %s";
  }

  else
  {
    if (sqlite3_step(ppStmt) == 101)
    {
      uint64_t v4 = 0LL;
      goto LABEL_5;
    }

    CFStringRef v6 = @"step failed: %s";
  }

  char v7 = sqlite3_errmsg(a1);
  sub_100012238("db_delete_volume", v6, v8, v9, v10, v11, v12, v13, v7);
LABEL_5:
  if (ppStmt) {
    sqlite3_finalize(ppStmt);
  }
  return v4;
}

uint64_t sub_10000D68C(sqlite3 *a1, const void *a2)
{
  ppStmt = 0LL;
  if (sqlite3_prepare_v2(a1, "UPDATE WrappedKeys SET Flagged = 1 WHERE Uuid = ?", -1, &ppStmt, 0LL))
  {
    char v6 = sqlite3_errmsg(a1);
    sub_100012238("db_flag_volume", @"Failed to execute get statement: %s\n", v7, v8, v9, v10, v11, v12, v6);
    uint64_t v4 = 0xFFFFFFFFLL;
  }

  else if (sqlite3_bind_blob(ppStmt, 1, a2, 16, 0LL))
  {
    char v13 = sqlite3_errmsg(a1);
    sub_100012238("db_flag_volume", @"Cannot bind uuid blob %s", v14, v15, v16, v17, v18, v19, v13);
    uint64_t v4 = 5LL;
  }

  else if (sqlite3_step(ppStmt) == 101)
  {
    uint64_t v4 = 0LL;
  }

  else
  {
    uint64_t v4 = 0xFFFFFFFFLL;
  }

  if (ppStmt) {
    sqlite3_finalize(ppStmt);
  }
  return v4;
}

uint64_t sub_10000D760(sqlite3 *a1)
{
  ppStmt = 0LL;
  if (sqlite3_prepare_v2(a1, "UPDATE WrappedKeys SET Flagged = 1", -1, &ppStmt, 0LL))
  {
    char v4 = sqlite3_errmsg(a1);
    sub_100012238("db_flag_all", @"Failed to execute get statement: %s\n", v5, v6, v7, v8, v9, v10, v4);
    uint64_t v2 = 0xFFFFFFFFLL;
  }

  else if (sqlite3_step(ppStmt) == 101)
  {
    uint64_t v2 = 0LL;
  }

  else
  {
    uint64_t v2 = 0xFFFFFFFFLL;
  }

  if (ppStmt) {
    sqlite3_finalize(ppStmt);
  }
  return v2;
}

uint64_t sub_10000D7EC(sqlite3 *a1, const void *a2)
{
  ppStmt = 0LL;
  uint64_t v4 = 0xFFFFFFFFLL;
  if (sqlite3_prepare_v2( a1,  "UPDATE WrappedKeys SET Key = NULL, Flagged = 0, ClearTime = datetime('now', 'subsec') WHERE Flagged = 1 AND Key NOT NULL AND Uuid = ?",  -1,  &ppStmt,  0LL))
  {
    uint64_t v6 = @"Failed to execute get statement: %s\n";
  }

  else if (sqlite3_bind_blob(ppStmt, 1, a2, 16, 0LL))
  {
    uint64_t v4 = 5LL;
    uint64_t v6 = @"Cannot bind uuid blob %s";
  }

  else
  {
    if (sqlite3_step(ppStmt) == 101)
    {
      uint64_t v4 = 0LL;
      goto LABEL_5;
    }

    uint64_t v4 = 6LL;
    uint64_t v6 = @"step failed: %s";
  }

  char v7 = sqlite3_errmsg(a1);
  sub_100012238("db_clear_flagged_volume", v6, v8, v9, v10, v11, v12, v13, v7);
LABEL_5:
  if (ppStmt) {
    sqlite3_finalize(ppStmt);
  }
  return v4;
}

uint64_t sub_10000D8C8(sqlite3 *a1)
{
  ppStmt = 0LL;
  uint64_t v2 = 0xFFFFFFFFLL;
  if (sqlite3_prepare_v2( a1,  "UPDATE WrappedKeys SET Key = NULL, ClearTime = datetime('now', 'subsec') WHERE Flagged = 1 AND Key NOT NULL;",
         -1,
         &ppStmt,
         0LL))
  {
    uint64_t v4 = @"Failed to execute get statement: %s\n";
  }

  else
  {
    if (sqlite3_step(ppStmt) == 101)
    {
      uint64_t v2 = 0LL;
      goto LABEL_4;
    }

    uint64_t v2 = 6LL;
    uint64_t v4 = @"step failed: %s";
  }

  char v5 = sqlite3_errmsg(a1);
  sub_100012238("db_clear_flagged", v4, v6, v7, v8, v9, v10, v11, v5);
LABEL_4:
  if (ppStmt) {
    sqlite3_finalize(ppStmt);
  }
  return v2;
}

uint64_t sub_10000D974(sqlite3 *a1, sqlite3_int64 a2)
{
  ppStmt = 0LL;
  uint64_t v4 = 0xFFFFFFFFLL;
  if (sqlite3_prepare_v2( a1,  "DELETE FROM WrappedKeys WHERE Flagged = 1 AND Key IS NULL AND unixepoch('now') - unixepoch(ClearTime) > ? ;",
         -1,
         &ppStmt,
         0LL))
  {
    uint64_t v6 = @"Failed to prepare get statement: %s\n";
  }

  else if (sqlite3_bind_int64(ppStmt, 1, a2))
  {
    uint64_t v6 = @"Cannot bind age: %s\n";
  }

  else
  {
    if (sqlite3_step(ppStmt) == 101)
    {
      uint64_t v4 = 0LL;
      goto LABEL_5;
    }

    uint64_t v4 = 6LL;
    uint64_t v6 = @"step failed: %s";
  }

  char v7 = sqlite3_errmsg(a1);
  sub_100012238("db_delete_flagged_old", v6, v8, v9, v10, v11, v12, v13, v7);
LABEL_5:
  if (ppStmt) {
    sqlite3_finalize(ppStmt);
  }
  return v4;
}

uint64_t sub_10000DA44(const char *a1, int a2, int a3)
{
  char v4 = (char)a1;
  if (a3)
  {
    char v5 = opendir(a1);
    if (v5)
    {
      uint64_t v6 = v5;
      int v7 = dirfd(v5);
      if (v7 == -1)
      {
        BOOL v10 = 1LL;
        goto LABEL_16;
      }

      int v8 = v7;
LABEL_7:
      if (fcntl(v8, 63) == 3)
      {
        BOOL v10 = 1LL;
      }

      else
      {
        int v11 = fcntl(v8, 64, 3LL);
        BOOL v10 = v11 == 0;
        if (v11 && a2)
        {
          __error();
          sub_100012238( "db_move_to_class_c",  @"Failed to set class C on file:%s with error %d",  v12,  v13,  v14,  v15,  v16,  v17,  v4);
          BOOL v10 = 0LL;
        }
      }

      if (!v6)
      {
        close(v8);
        return v10;
      }

LABEL_16:
      closedir(v6);
      return v10;
    }
  }

  else
  {
    int v9 = open(a1, 2);
    if (v9 != -1)
    {
      int v8 = v9;
      uint64_t v6 = 0LL;
      goto LABEL_7;
    }
  }

  return 1LL;
}

const void *sub_10000DB44(const __CFDictionary *a1, const void *a2)
{
  double result = CFDictionaryGetValue(a1, a2);
  if (result)
  {
    char v3 = result;
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

uint64_t sub_10000DB7C(const __CFDictionary *a1, const void *a2)
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

CFBooleanRef sub_10000DBE4(const __CFDictionary *a1, const void *a2)
{
  double result = (const __CFBoolean *)CFDictionaryGetValue(a1, a2);
  if (result)
  {
    char v3 = result;
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

const void *sub_10000DC34(const __CFDictionary *a1, const void *a2)
{
  Value = CFDictionaryGetValue(a1, a2);
  if (!Value) {
    return 0LL;
  }
  char v3 = Value;
  CFTypeID v4 = CFGetTypeID(Value);
  if (v4 != CFStringGetTypeID()) {
    return 0LL;
  }
  return v3;
}

BOOL sub_10000DC74(const __CFDictionary *a1, const void *a2, char *a3, int a4)
{
  uint64_t v6 = (const __CFString *)sub_10000DC34(a1, a2);
  return v6 && CFStringGetCString(v6, a3, a4, 0x8000100u);
}

CFTypeRef sub_10000DCC0(const void *a1)
{
  uint64_t v2 = CFWriteStreamCreateWithAllocatedBuffers(kCFAllocatorDefault, kCFAllocatorDefault);
  if (!v2) {
    return 0LL;
  }
  char v3 = v2;
  if (CFWriteStreamOpen(v2))
  {
    if (CFPropertyListWrite(a1, v3, kCFPropertyListBinaryFormat_v1_0, 0LL, 0LL) < 1) {
      CFTypeRef v4 = 0LL;
    }
    else {
      CFTypeRef v4 = CFWriteStreamCopyProperty(v3, kCFStreamPropertyDataWritten);
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

CFPropertyListRef sub_10000DD64(UInt8 *bytes, CFIndex length)
{
  CFPropertyListFormat format = kCFPropertyListBinaryFormat_v1_0;
  uint64_t v2 = CFReadStreamCreateWithBytesNoCopy(kCFAllocatorDefault, bytes, length, kCFAllocatorNull);
  if (v2)
  {
    int v9 = v2;
    if (CFReadStreamOpen(v2))
    {
      CFPropertyListRef v22 = CFPropertyListCreateWithStream(kCFAllocatorDefault, v9, 0LL, 2uLL, &format, 0LL);
      if (!v22) {
        sub_100012238( "convertBinaryToObject",  @"Could not create object from stream",  v16,  v17,  v18,  v19,  v20,  v21,  v24);
      }
      CFReadStreamClose(v9);
    }

    else
    {
      sub_100012238("convertBinaryToObject", @"Could not open the stream", v10, v11, v12, v13, v14, v15, v24);
      CFPropertyListRef v22 = 0LL;
    }

    CFRelease(v9);
  }

  else
  {
    sub_100012238( "convertBinaryToObject",  @"Could not create stream for serialized data",  v3,  v4,  v5,  v6,  v7,  v8,  v24);
    return 0LL;
  }

  return v22;
}

size_t sub_10000DE4C(int __fd, char *__buf, size_t __nbyte)
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

uint64_t sub_10000DEC4(const void *a1, const char *a2, int *a3)
{
  uint64_t v5 = (const __CFData *)sub_10000DCC0(a1);
  if (!v5)
  {
    sub_100012238("store_binary_dict_fd", @"Can't serialize dictionary", v6, v7, v8, v9, v10, v11, v34);
    return 0xFFFFFFFFLL;
  }

  uint64_t v12 = v5;
  int v13 = open_dprotected_np(a2, 1537, 4, 0, 420LL);
  if (v13 == -1)
  {
    uint64_t v18 = __error();
    strerror(*v18);
    sub_100012238("store_binary_dict_fd", @"Could not create %s: %s", v19, v20, v21, v22, v23, v24, (char)a2);
    uint64_t v17 = 0xFFFFFFFFLL;
    goto LABEL_7;
  }

  int v14 = v13;
  BytePtr = (char *)CFDataGetBytePtr(v12);
  size_t Length = CFDataGetLength(v12);
  if (sub_10000DE4C(v14, BytePtr, Length) == -1LL)
  {
    uint64_t v25 = @"Could not write to %s: %s";
LABEL_12:
    uint64_t v26 = __error();
    strerror(*v26);
    sub_100012238("store_binary_dict_fd", v25, v27, v28, v29, v30, v31, v32, (char)a2);
    uint64_t v17 = 0xFFFFFFFFLL;
    goto LABEL_13;
  }

  if (fcntl(v14, 51))
  {
    uint64_t v25 = @"Unable to fsync %s: %s";
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

uint64_t sub_10000E018(const void *a1, const char *a2)
{
  return sub_10000DEC4(a1, a2, 0LL);
}

const void *sub_10000E020(UInt8 *bytes, CFIndex length)
{
  uint64_t v2 = 0LL;
  CFPropertyListFormat format = kCFPropertyListBinaryFormat_v1_0;
  if (bytes && length)
  {
    uint64_t v4 = CFReadStreamCreateWithBytesNoCopy(kCFAllocatorDefault, bytes, length, kCFAllocatorNull);
    if (!v4)
    {
      sub_100012238( "load_binary_dict_from_buffer",  @"Could not create stream from serialized data",  v5,  v6,  v7,  v8,  v9,  v10,  v27);
      return 0LL;
    }

    uint64_t v11 = v4;
    if (CFReadStreamOpen(v4))
    {
      CFPropertyListRef v18 = CFPropertyListCreateWithStream(kCFAllocatorDefault, v11, length, 2uLL, &format, 0LL);
      uint64_t v2 = v18;
      if (!v18)
      {
        sub_100012238( "load_binary_dict_from_buffer",  @"Could not create dictionary from stream",  v19,  v20,  v21,  v22,  v23,  v24,  v27);
        goto LABEL_9;
      }

      CFTypeID v25 = CFGetTypeID(v18);
      if (v25 == CFDictionaryGetTypeID())
      {
LABEL_9:
        CFReadStreamClose(v11);
        CFRelease(v11);
        return v2;
      }

      CFRelease(v2);
    }

    else
    {
      sub_100012238( "load_binary_dict_from_buffer",  @"Could not open the stream",  v12,  v13,  v14,  v15,  v16,  v17,  v27);
    }

    uint64_t v2 = 0LL;
    goto LABEL_9;
  }

  return v2;
}

const void *sub_10000E140(const char *a1)
{
  char v1 = (char)a1;
  int v2 = open(a1, 0);
  if (v2 == -1)
  {
    uint64_t v15 = __error();
    strerror(*v15);
    sub_100012238("load_binary_dict", @"Could not open %s: %s", v16, v17, v18, v19, v20, v21, v1);
    uint64_t v11 = 0LL;
    uint64_t v13 = 0LL;
    goto LABEL_7;
  }

  int v3 = v2;
  if (fstat(v2, &v32))
  {
    uint64_t v22 = __error();
    strerror(*v22);
    sub_100012238("load_binary_dict", @"Could not fstat %s: %s", v23, v24, v25, v26, v27, v28, v1);
    uint64_t v13 = 0LL;
    uint64_t v11 = 0LL;
    goto LABEL_6;
  }

  off_t st_size = v32.st_size;
  uint64_t v11 = malloc(LODWORD(v32.st_size));
  if (!v11)
  {
    uint64_t v29 = @"Could not allocate buffer";
LABEL_12:
    sub_100012238("load_binary_dict", v29, v5, v6, v7, v8, v9, v10, v31);
    uint64_t v13 = 0LL;
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

  uint64_t v13 = sub_10000E020((UInt8 *)v11, v12);
LABEL_6:
  close(v3);
LABEL_7:
  free(v11);
  return v13;
}

CFMutableDictionaryRef sub_10000E280()
{
  CFMutableDictionaryRef result = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  if (!result)
  {
    sub_100012238("create_dict", @"Out of Memory!!! Dying!...so...cold....", v1, v2, v3, v4, v5, v6, vars0);
    exit(-1);
  }

  return result;
}

uint64_t sub_10000E2D4(uint32_t *a1)
{
  uint32_t multiuser_flags = 0;
  mach_port_t v2 = mach_host_self();
  uint64_t result = host_get_multiuser_config_flags(v2, &multiuser_flags);
  if (a1)
  {
    if (!(_DWORD)result) {
      *a1 = multiuser_flags;
    }
  }

  return result;
}

uint64_t sub_10000E318()
{
  int v3 = 0;
  int v0 = sub_10000E2D4((uint32_t *)&v3);
  if (v3 >= 0) {
    uint32_t v1 = -1;
  }
  else {
    uint32_t v1 = v3 & 0x3FFFFFFF;
  }
  if (v0) {
    return 0xFFFFFFFFLL;
  }
  else {
    return v1;
  }
}

BOOL sub_10000E354()
{
  int v2 = 0;
  return !sub_10000E2D4((uint32_t *)&v2) && v2 < 0;
}

uint64_t sub_10000E388(uint64_t a1)
{
  uint64_t v1 = a1;
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
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v4[0] = 67109120;
      v4[1] = v1;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Unexpected AppleKeyStore error: %d\n",  (uint8_t *)v4,  8u);
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

uint64_t sub_10000E564()
{
  int v2 = -1;
  if (!qword_1000292D0)
  {
    __int128 v3 = off_100020C08;
    uint64_t v4 = 0LL;
    qword_1000292D0 = _sl_dlopen(&v3, 0LL);
  }

  if (!qword_1000292D0) {
    return 0LL;
  }
  uint64_t result = sub_10000E650();
  if (!result) {
    return result;
  }
  unsigned int v1 = objc_msgSend( objc_msgSend((id)sub_10000E650(), "sharedConnection"),  "unlockScreenTypeWithOutSimplePasscodeType:",  &v2);
  if (v1 == 2) {
    return 4LL;
  }
  if (v1 == 1) {
    return 3LL;
  }
  if (v1) {
    return 0LL;
  }
  if (v2 == 1) {
    return 2LL;
  }
  return v2 == 0;
}

uint64_t sub_10000E650()
{
  uint64_t v3 = 0LL;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x3052000000LL;
  uint64_t v6 = sub_10000E854;
  uint64_t v7 = sub_10000E864;
  uint64_t v0 = qword_1000292D8;
  uint64_t v8 = qword_1000292D8;
  if (!qword_1000292D8)
  {
    v2[0] = _NSConcreteStackBlock;
    v2[1] = 3221225472LL;
    v2[2] = sub_10000E870;
    v2[3] = &unk_100020C28;
    v2[4] = &v3;
    sub_10000E870((uint64_t)v2);
    uint64_t v0 = v4[5];
  }

  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_10000E6F8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_10000E710(_BYTE *a1)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  if (!qword_1000292E0)
  {
    __int128 v10 = off_100020C48;
    uint64_t v11 = 0LL;
    qword_1000292E0 = _sl_dlopen(&v10, 0LL);
  }

  if (!qword_1000292E0) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  int v2 = (uint64_t (*)(uint64_t))off_1000292E8;
  uint64_t v9 = off_1000292E8;
  if (!off_1000292E8)
  {
    *(void *)&__int128 v10 = _NSConcreteStackBlock;
    *((void *)&v10 + 1) = 3221225472LL;
    uint64_t v11 = sub_10000E94C;
    ssize_t v12 = &unk_100020C28;
    uint64_t v13 = &v6;
    sub_10000E94C((uint64_t)&v10);
    int v2 = (uint64_t (*)(uint64_t))v7[3];
  }

  _Block_object_dispose(&v6, 8);
  if (!v2) {
    sub_100015A68();
  }
  char v4 = v2(v3);
  uint64_t result = 0LL;
  *a1 = v4;
  return result;
}

void sub_10000E834( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_10000E854(uint64_t a1, uint64_t a2)
{
}

void sub_10000E864(uint64_t a1)
{
}

Class sub_10000E870(uint64_t a1)
{
  uint64_t v3 = 0LL;
  if (!qword_1000292D0)
  {
    __int128 v4 = off_100020C08;
    uint64_t v5 = 0LL;
    qword_1000292D0 = _sl_dlopen(&v4, &v3);
  }

  if (!qword_1000292D0) {
    sub_100015ACC(&v3);
  }
  if (v3) {
    free(v3);
  }
  Class result = objc_getClass("MCProfileConnection");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL)) {
    sub_100015B30();
  }
  qword_1000292D8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
  return result;
}

void *sub_10000E94C(uint64_t a1)
{
  __int128 v4 = 0LL;
  if (!qword_1000292E0)
  {
    __int128 v5 = off_100020C48;
    uint64_t v6 = 0LL;
    qword_1000292E0 = _sl_dlopen(&v5, &v4);
  }

  int v2 = (void *)qword_1000292E0;
  if (!qword_1000292E0) {
    sub_100015B94(&v4);
  }
  if (v4) {
    free(v4);
  }
  Class result = dlsym(v2, "MAGetActivationState");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  off_1000292E8 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  return result;
}

uint64_t sub_10000EA24(CFStringRef theString1, unsigned int a2, uint64_t a3)
{
  uint64_t valuePtr = a3;
  if (!theString1 || a2 && arc4random() % a2) {
    return 0xFFFFFFFFLL;
  }
  int v4 = sub_10000EDE4(theString1);
  uint64_t v79 = v4;
  if (v4 == -1)
  {
    uint64_t v73 = @"unsupported key";
LABEL_32:
    sub_100012238("analytics_persist_event", v73, v5, v6, v7, v8, v9, v10, v77);
    return 0xFFFFFFFFLL;
  }

  Mutable = sub_10000EE48();
  if (!Mutable)
  {
    Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    if (!Mutable)
    {
      uint64_t v73 = @"Can't create dict";
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
      CFNumberRef v74 = @"wrong type";
      goto LABEL_45;
    }

    uint64_t v21 = kCFAllocatorDefault;
    CFMutableArrayRef MutableCopy = CFArrayCreateMutableCopy(kCFAllocatorDefault, 0LL, v13);
  }

  else
  {
    uint64_t v21 = kCFAllocatorDefault;
    CFMutableArrayRef MutableCopy = CFArrayCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeArrayCallBacks);
  }

  uint64_t v23 = MutableCopy;
  if (!MutableCopy)
  {
    CFNumberRef v74 = @"unable to allocate array";
LABEL_45:
    sub_100012238("analytics_persist_event", v74, v15, v16, v17, v18, v19, v20, v77);
    char v75 = Mutable;
    goto LABEL_46;
  }

  CFNumberRef v24 = CFNumberCreate(v21, kCFNumberSInt64Type, &valuePtr);
  if (!v24)
  {
    sub_100012238("analytics_persist_event", @"unable to allocate", v25, v26, v27, v28, v29, v30, v77);
    CFRelease(Mutable);
    char v75 = v23;
LABEL_46:
    CFRelease(v75);
    return 0xFFFFFFFFLL;
  }

  CFNumberRef v31 = v24;
  CFNumberRef v38 = CFNumberCreate(v21, kCFNumberSInt64Type, &v79);
  if (v38)
  {
    char v39 = CFArrayCreateMutable(v21, 0LL, &kCFTypeArrayCallBacks);
    uint64_t v40 = v39;
    if (v39)
    {
      CFArrayAppendValue(v39, v38);
      CFArrayAppendValue(v40, v31);
      CFArrayAppendValue(v23, v40);
      if (CFArrayGetCount(v23) >= 6)
      {
        sub_100012238( "analytics_persist_event",  @"at capacity, discarding oldest data entry",  v41,  v42,  v43,  v44,  v45,  v46,  v77);
        CFArrayRemoveValueAtIndex(v23, 0LL);
      }

      CFDictionarySetValue(Mutable, @"DATA", v23);
      int v78 = 0;
      CFNumberRef v47 = CFNumberCreate(v21, kCFNumberSInt32Type, &v78);
      if (v47)
      {
        CFNumberRef v48 = v47;
        CFDictionarySetValue(Mutable, @"VERS", v47);
        io_registry_entry_t v49 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/options");
        CFTypeRef v50 = sub_10000DCC0(Mutable);
        if (v50)
        {
          uint64_t v57 = v50;
          if (IORegistryEntrySetCFProperty(v49, @"mkb-reports", v50))
          {
            sub_100012238("SetPersistedReports", @"cant set", v58, v59, v60, v61, v62, v63, v77);
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
          sub_100012238("SetPersistedReports", @"Can't serialize dictionary", v51, v52, v53, v54, v55, v56, v77);
          int v64 = -1;
          if (!v49) {
            goto LABEL_23;
          }
        }

        IOObjectRelease(v49);
LABEL_23:
        if (v64)
        {
          sub_100012238("analytics_persist_event", @"failed to persist dict", v65, v66, v67, v68, v69, v70, v77);
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

  sub_100012238("analytics_persist_event", v76, v32, v33, v34, v35, v36, v37, v77);
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

uint64_t sub_10000EDE4(CFStringRef theString1)
{
  if (!theString1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v2 = 0LL;
  for (i = (CFStringRef *)&qword_100029240; !*i || CFStringCompare(theString1, *i, 1uLL); i += 2)
  {
    if (++v2 == 4) {
      return 0xFFFFFFFFLL;
    }
  }

  return v2;
}

CFDictionaryRef sub_10000EE48()
{
  io_registry_entry_t v0 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/options");
  if (!v0) {
    return 0LL;
  }
  io_object_t v1 = v0;
  CFTypeRef CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(v0, @"mkb-reports", kCFAllocatorDefault, 0);
  if (!CFProperty)
  {
    IOObjectRelease(v1);
    return 0LL;
  }

  uint64_t v3 = CFProperty;
  BytePtr = (UInt8 *)CFDataGetBytePtr(CFProperty);
  CFIndex Length = CFDataGetLength(v3);
  uint64_t v6 = (const __CFDictionary *)sub_10000E020(BytePtr, Length);
  uint64_t v7 = v6;
  if (!v6) {
    goto LABEL_24;
  }
  Value = (const __CFNumber *)CFDictionaryGetValue(v6, @"VERS");
  if (!Value)
  {
    uint64_t v28 = @"no version";
LABEL_22:
    sub_100012238("analytics_persistance_validate_dict", v28, v9, v10, v11, v12, v13, v14, v36);
LABEL_23:
    CFRelease(v7);
    sub_100012238("CopyPersistedReports", @"invalid dict", v29, v30, v31, v32, v33, v34, v37);
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
    sub_100012238( "analytics_persistance_validate_dict",  @"non-current version %d",  v9,  v10,  v11,  v12,  v13,  v14,  valuePtr);
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

uint64_t sub_10000F124(uint64_t a1)
{
  unint64_t v20 = 0LL;
  uint64_t valuePtr = 0LL;
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v2 = sub_10000EE48();
  if (!v2) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v3 = v2;
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
          uint64_t v17 = qword_100029240[2 * v20];
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
    sub_100012238("analytics_iterate_persisted_eventsWithBlock", @"no data", v5, v6, v7, v8, v9, v10, v20);
    uint64_t v18 = 0xFFFFFFFFLL;
  }

  CFRelease(v3);
  return v18;
}

uint64_t sub_10000F260(uint64_t a1)
{
  kern_return_t v8;
  char v10;
  io_registry_entry_t v1 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/options");
  uint64_t v8 = IORegistryEntrySetCFProperty(v1, @"IONVRAM-DELETE-PROPERTY", @"mkb-reports");
  if (v8)
  {
    sub_100012238("DeletePersistedReports", @"cant delete", v2, v3, v4, v5, v6, v7, v10);
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
  sub_100012238("analytics_submit_persisted_eventsWithBlock", @"cant delete", v2, v3, v4, v5, v6, v7, v10);
  return 0xFFFFFFFFLL;
}

uint64_t sub_10000F304( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char v8 = a1;
  uint64_t v12 = 0LL;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2000000000LL;
  char v15 = 0;
  if (a1)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 0x40000000LL;
    v11[2] = sub_10000F3BC;
    v11[3] = &unk_100020C68;
    v11[4] = &v12;
    v11[5] = a1;
    sub_10000F124((uint64_t)v11);
  }

  sub_100012238("analytics_is_event_persisted", @"event %@ is already persisted: %d", a3, a4, a5, a6, a7, a8, v8);
  uint64_t v9 = *((unsigned __int8 *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return v9;
}

uint64_t sub_10000F3BC(uint64_t a1, const void *a2)
{
  if (CFEqual(*(CFTypeRef *)(a1 + 40), a2)) {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1;
  }
  return 0LL;
}

uint64_t sub_10000F3F8()
{
  return sub_10000F260((uint64_t)&stru_100020CA8);
}

int sub_10000F404(id a1, __CFString *a2, BOOL a3, int a4, int64_t a5)
{
  BOOL v6 = a3;
  char CStringPtr = CFStringGetCStringPtr(a2, 0x8000100u);
  sub_100012238( "analytics_submit_persisted_events_block_invoke",  @"persisted-report-submit %s:%llx",  v9,  v10,  v11,  v12,  v13,  v14,  CStringPtr);
  unsigned int v15 = sub_10000EDE4(a2);
  if (v15 <= 3) {
    ((void (*)(int64_t))qword_100029240[2 * v15 + 1])(a5);
  }
  return sub_1000109CC((uint64_t)a2, v6, 0, a5);
}

void sub_10000F498( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = a1;
  sub_10000F664(&v9, a2, a3, a4, a5, a6, a7, a8, v8);
}

void sub_10000F4BC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = a1;
  sub_10000FE1C(&v9, a2, a3, a4, a5, a6, a7, a8, v8);
}

void sub_10000F4E0( char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (&_analytics_send_event_lazy)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 0x40000000LL;
    v16[2] = sub_10000F5A4;
    v16[3] = &unk_100020CC8;
    v16[4] = a1;
    analytics_send_event_lazy("com.apple.mobile.keybagd.passcode.status", v16);
  }

  else
  {
    sub_100012238( "analytics_send_passcode_status",  @"CA fwk missing, not sending event",  v10,  v11,  v12,  v13,  v14,  v15,  a9);
  }

xpc_object_t sub_10000F5A4(uint64_t a1)
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

void sub_10000F664( _WORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  *a1 = *a1 & 0xFFF0 | 1;
  sub_100012238( "analytics_send_sidp_recovery",  @"AnalyticsEvent: version: %llu, type: %llu, event: %llu, recoverable: %llu, recovery_required: %llu, se_entangled: %llu, se_recovery_required: %llu, smdk_entalgned: %llu",  a3,  a4,  a5,  a6,  a7,  a8,  1);
  if (&_analytics_send_event_lazy)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 0x40000000LL;
    v16[2] = sub_10000F748;
    v16[3] = &unk_100020CE8;
    v16[4] = a1;
    analytics_send_event_lazy("com.apple.mobile.keybagd.sidp.recovery", v16);
  }

  else
  {
    sub_100012238( "analytics_send_sidp_recovery",  @"CA fwk missing, not sending event",  v10,  v11,  v12,  v13,  v14,  v15,  a9);
  }

xpc_object_t sub_10000F748(uint64_t a1)
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

void sub_10000F858( void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (&_analytics_send_event_lazy)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 0x40000000LL;
    v16[2] = sub_10000F904;
    v16[3] = &unk_100020D08;
    v16[4] = a1;
    analytics_send_event_lazy("com.apple.mobile.keybagd.db.filekey.found", v16);
  }

  else
  {
    sub_100012238( "analytics_send_db_filekey_found",  @"CA fwk missing, not sending event",  v10,  v11,  v12,  v13,  v14,  v15,  a9);
  }

xpc_object_t sub_10000F904(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v2, "filekey_count", **(void **)(a1 + 32));
  return v2;
}

void sub_10000F94C( void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (&_analytics_send_event_lazy)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 0x40000000LL;
    v16[2] = sub_10000F9F8;
    v16[3] = &unk_100020D28;
    v16[4] = a1;
    analytics_send_event_lazy("com.apple.mobile.keybagd.db.filekey.not_found", v16);
  }

  else
  {
    sub_100012238( "analytics_send_db_filekey_not_found",  @"CA fwk missing, not sending event",  v10,  v11,  v12,  v13,  v14,  v15,  a9);
  }

xpc_object_t sub_10000F9F8(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v2, "filekey_count", **(void **)(a1 + 32));
  return v2;
}

void sub_10000FA40( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (&_analytics_send_event_lazy)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 0x40000000LL;
    v9[2] = sub_10000FAB8;
    v9[3] = &unk_100020D48;
    void v9[4] = a1;
    analytics_send_event_lazy("com.apple.mobile.keybagd.db.add", v9);
  }

  else
  {
    sub_100012238("analytics_send_db_add", @"CA fwk missing, not sending event", a3, a4, a5, a6, a7, a8, a9);
  }

xpc_object_t sub_10000FAB8(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v2, "status", **(void **)(a1 + 32));
  return v2;
}

void sub_10000FB00( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (&_analytics_send_event_lazy)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 0x40000000LL;
    v9[2] = sub_10000FB78;
    v9[3] = &unk_100020D68;
    void v9[4] = a1;
    analytics_send_event_lazy("com.apple.mobile.keybagd.db.get", v9);
  }

  else
  {
    sub_100012238("analytics_send_db_get", @"CA fwk missing, not sending event", a3, a4, a5, a6, a7, a8, a9);
  }

xpc_object_t sub_10000FB78(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v2, "status", **(void **)(a1 + 32));
  return v2;
}

void sub_10000FBC0( void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (&_analytics_send_event_lazy)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 0x40000000LL;
    v16[2] = sub_10000FC6C;
    v16[3] = &unk_100020D88;
    v16[4] = a1;
    analytics_send_event_lazy("com.apple.mobile.keybagd.phrasechange", v16);
  }

  else
  {
    sub_100012238( "analytics_send_passphrase_change",  @"CA fwk missing, not sending event",  v10,  v11,  v12,  v13,  v14,  v15,  a9);
  }

xpc_object_t sub_10000FC6C(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v2, "change_count", **(void **)(a1 + 32));
  return v2;
}

void sub_10000FCB4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (&_analytics_send_event_lazy)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 0x40000000LL;
    v9[2] = sub_10000FD2C;
    v9[3] = &unk_100020DA8;
    void v9[4] = a1;
    analytics_send_event_lazy("com.apple.mobile.keybagd.backup.drain", v9);
  }

  else
  {
    sub_100012238( "analytics_send_backup_key_drain",  @"CA fwk missing, not sending event",  a3,  a4,  a5,  a6,  a7,  a8,  a9);
  }

xpc_object_t sub_10000FD2C(uint64_t a1)
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

void sub_10000FE1C( _DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (&_analytics_send_event_lazy)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 0x40000000LL;
    v16[2] = sub_10000FED8;
    v16[3] = &unk_100020DC8;
    v16[4] = a1;
    analytics_send_event_lazy("com.apple.mobile.keybagd.forgotten_passcode", v16);
  }

  else
  {
    sub_100012238( "analytics_send_forgotten_passcode_event",  @"CA fwk missing, not sending event",  v10,  v11,  v12,  v13,  v14,  v15,  a9);
  }

xpc_object_t sub_10000FED8(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v2, "days_since_passcode_change", **(unsigned int **)(a1 + 32));
  xpc_dictionary_set_uint64(v2, "passcode_reset_expired", *(_BYTE *)(*(void *)(a1 + 32) + 4LL) & 1);
  xpc_dictionary_set_uint64( v2,  "passcode_reset_exists",  ((unint64_t)*(unsigned __int8 *)(*(void *)(a1 + 32) + 4LL) >> 1) & 1);
  return v2;
}

void sub_10000FF58( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (&_analytics_send_event_lazy)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 0x40000000LL;
    v16[2] = sub_10001030C;
    v16[3] = &unk_100020DE8;
    v16[4] = a1;
    analytics_send_event_lazy("com.apple.mobile.keybagd.user_keybag", v16);
  }

  else
  {
    sub_100012238( "analytics_send_user_keybag",  @"CA fwk missing, not sending event",  v10,  v11,  v12,  v13,  v14,  v15,  a9);
  }

xpc_object_t sub_10001030C(uint64_t a1)
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

uint64_t sub_1000109CC(uint64_t a1, int a2, unsigned int a3, uint64_t a4)
{
  if (&_ADClientAddValueForScalarKey) {
    BOOL v4 = &_ADClientSetValueForScalarKey == 0LL;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4 || a1 == 0) {
    return 0xFFFFFFFFLL;
  }
  if (a3 && arc4random() % a3) {
    return 0xFFFFFFFFLL;
  }
  if (a2) {
    ADClientSetValueForScalarKey(a1, a4);
  }
  else {
    ADClientAddValueForScalarKey(a1, a4);
  }
  return 0LL;
}

uint64_t sub_100010A5C(const __CFDictionary *a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6, int a7)
{
  unsigned int v102 = -1;
  unsigned int v103 = -1;
  uint64_t system = aks_get_system(a2, &v103);
  if ((_DWORD)system == -536870160)
  {
    if (a7) {
      sub_100012238( "loadKeybagForUserSession",  @"From EARLYSTART skip check switch between users",  v15,  v16,  v17,  v18,  v19,  v20,  v99);
    }
    uint64_t v32 = sub_100004CA4(a2);
    if (!v32)
    {
      sub_100012238("loadKeybagForUserSession", @"no user bag found for UID %d", v33, v34, v35, v36, v37, v38, a2);
      uint64_t v31 = 4294967288LL;
      goto LABEL_37;
    }

    uint64_t v21 = v32;
    Value = (const __CFData *)CFDictionaryGetValue(v32, @"KeyBagKeys");
    if (!Value)
    {
      sub_100012238("loadKeybagForUserSession", @"no keybag in user bag plist", v40, v41, v42, v43, v44, v45, v99);
      uint64_t v31 = 4294966296LL;
      goto LABEL_36;
    }

    uint64_t v46 = Value;
    BytePtr = CFDataGetBytePtr(Value);
    CFIndex Length = CFDataGetLength(v46);
    uint64_t v49 = aks_load_bag(BytePtr, Length, &v102);
    if ((_DWORD)v49)
    {
      uint64_t v56 = v49;
      sub_100012238( "loadKeybagForUserSession",  @"failed to load bag for user %d: 0x%x",  v50,  v51,  v52,  v53,  v54,  v55,  a2);
    }

    else
    {
      uint64_t v72 = aks_set_system(v102, a2);
      if (!(_DWORD)v72)
      {
        if ((_DWORD)a2 != 502)
        {
          sub_100012238( "loadKeybagForUserSession",  @"seting APFSVolumeID For KeyBag",  v73,  v74,  v75,  v76,  v77,  v78,  v99);
          sub_100010E48(v102, a2, a1, 0, v81, v82, v83, v84, v100);
        }

        uint64_t v85 = aks_get_system(a2, &v103);
        if (!(_DWORD)v85) {
          goto LABEL_4;
        }
        uint64_t v92 = v85;
        sub_100012238( "loadKeybagForUserSession",  @"loaded bag handle %ld as session bag for %d, but got no session handle back: 0x%x",  v86,  v87,  v88,  v89,  v90,  v91,  v102);
        uint64_t v79 = v92;
LABEL_35:
        uint64_t v31 = sub_10000E388(v79);
        goto LABEL_36;
      }

      uint64_t v56 = v72;
      sub_100012238( "loadKeybagForUserSession",  @"failed to set bag handle %d as session bag for UID %d: 0x%x",  v73,  v74,  v75,  v76,  v77,  v78,  v102);
    }

    uint64_t v79 = v56;
    goto LABEL_35;
  }

  if ((_DWORD)system)
  {
    uint64_t v31 = sub_10000E388(system);
    goto LABEL_37;
  }

  uint64_t v21 = 0LL;
LABEL_4:
  if (!a3)
  {
LABEL_24:
    uint64_t v31 = 0LL;
    if (v21) {
      goto LABEL_36;
    }
    goto LABEL_37;
  }

  id v22 = +[MKBDeviceLockModelEducationalMode sharedLockModelWithUID:]( &OBJC_CLASS___MKBDeviceLockModelEducationalMode,  "sharedLockModelWithUID:",  a2);
  [v22 notePasscodeEntryBegan];
  uint64_t v23 = aks_unlock_device(v103, a3, a4);
  if (!(_DWORD)v23)
  {
    [v22 notePasscodeUnlockSucceeded];
    if (a5)
    {
      sub_100012238( "loadKeybagForUserSession",  @"TRYING TO UPDATE GRACE PERIOD FOR USER:%d with %d secs",  v57,  v58,  v59,  v60,  v61,  v62,  a2);
      uint64_t v63 = sub_10000E280();
      uint64_t valuePtr = a6;
      CFNumberRef v64 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt64Type, &valuePtr);
      if (v64)
      {
        CFNumberRef v65 = v64;
        CFDictionarySetValue(v63, kAKSConfigGracePeriod, v64);
        CFRelease(v65);
      }

      uint64_t v31 = aks_set_configuration(v103, a3, a4, v63);
      if (v63) {
        CFRelease(v63);
      }
      if ((_DWORD)v31)
      {
        sub_100012238( "loadKeybagForUserSession",  @"FAILED TO AKS update Graceperiod of %d secs FOR USER:%d with error:%d",  v66,  v67,  v68,  v69,  v70,  v71,  a6);
      }

      else
      {
        sub_100012238( "loadKeybagForUserSession",  @"SUCCESSFUL AKS update of Graceperiod FOR USER:%d with %d secs",  v66,  v67,  v68,  v69,  v70,  v71,  a2);
        uint64_t v31 = sub_100005A9C(v103, a2, 0LL, 0);
        if ((_DWORD)v31) {
          sub_100012238( "loadKeybagForUserSession",  @"FAILED to save Keybag FOR USER:%d with Graceperiod of %d secs",  v93,  v94,  v95,  v96,  v97,  v98,  a2);
        }
        else {
          sub_100012238( "loadKeybagForUserSession",  @"SUCCESSFUL  saving of Keybag FOR USER:%d with Graceperiod of %d secs",  v93,  v94,  v95,  v96,  v97,  v98,  a2);
        }
      }

      if (v21) {
        goto LABEL_36;
      }
      goto LABEL_37;
    }

    goto LABEL_24;
  }

  uint64_t v30 = v23;
  sub_100012238( "loadKeybagForUserSession",  @"failed to unlock session bag handle %ld: 0x%x",  v24,  v25,  v26,  v27,  v28,  v29,  v103);
  uint64_t v31 = sub_10000E388(v30);
  [v22 notePasscodeUnlockFailed];
  if ([v22 isWipePending])
  {
    uint64_t v31 = 4294967281LL;
    if (!v21) {
      goto LABEL_37;
    }
LABEL_36:
    CFRelease(v21);
    goto LABEL_37;
  }

  if (([v22 isTemporarilyBlocked] & 1) != 0
    || [v22 isPermanentlyBlocked])
  {
    uint64_t v31 = 4294967282LL;
  }

  if (v21) {
    goto LABEL_36;
  }
LABEL_37:
  if (v102 != -1) {
    aks_unload_bag(v102);
  }
  return v31;
}

void sub_100010E48( uint64_t a1, uint64_t a2, const __CFDictionary *a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (!a3)
  {
    uint64_t v33 = @"PASSED in NULL Session";
LABEL_12:
    sub_100012238("setAPFSVolumeIDForKeyBag", v33, v13, v14, v15, v16, v17, v18, a9);
    return;
  }

  memset(v39, 0, sizeof(v39));
  sub_100012238("setAPFSVolumeIDForKeyBag", @"Passed in session is %@", v13, v14, v15, v16, v17, v18, (char)a3);
  if (!CFDictionaryContainsKey(a3, kMKBUserSessionVolumeDeviceNodeKey[0]))
  {
    uint64_t v33 = @"NO device node key to map.., returning";
    goto LABEL_12;
  }

  sub_10000DC74(a3, kMKBUserSessionVolumeDeviceNodeKey[0], (char *)v39, 256);
  if (LODWORD(v39[0]) != 1802725732)
  {
    if (!a4) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }

  __strlcat_chk(v37, v39, 1024LL, 1024LL);
  if (a4) {
LABEL_5:
  }
    sub_1000066AC(a1, (uint64_t)v37, 0LL, 0LL, 0, 0LL);
LABEL_6:
  if (CFDictionaryContainsKey(a3, kMKBUserSessionVolumeUUIDKey))
  {
    uint64_t v25 = sub_10000DC34(a3, kMKBUserSessionVolumeUUIDKey);
    if (!v25) {
      return;
    }
    sub_100012238("setAPFSVolumeIDForKeyBag", @"Updating VolumeUUID %@", v26, v27, v28, v29, v30, v31, (char)v25);
    bzero(in, 0x400uLL);
    sub_10000DC74(a3, kMKBUserSessionVolumeUUIDKey, in, 1024);
    if (!uuid_parse(in, uu))
    {
      sub_100012238("setAPFSVolumeIDForKeyBag", @"uuid_parse SUCCESS", v19, v20, v21, v22, v23, v24, v34);
      sub_100006838(a1, a2, (uint64_t)v37, (uint64_t)uu, 0, 0LL);
      return;
    }

    uint64_t v32 = @"uuid_parse failed";
  }

  else
  {
    uint64_t v32 = @"No VolumeUUID key present in the session";
  }

  sub_100012238("setAPFSVolumeIDForKeyBag", v32, v19, v20, v21, v22, v23, v24, v34);
}

uint64_t sub_1000110EC(const __CFDictionary *a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, const void *a6)
{
  unsigned int v66 = -1;
  CFMutableDictionaryRef v12 = sub_100004CA4(a2);
  if (v12)
  {
    CFRelease(v12);
    return 0LL;
  }

  else
  {
    uint64_t v14 = aks_create_bag(a3, a4, 0LL, &v66);
    if ((_DWORD)v14)
    {
      uint64_t v21 = v14;
      sub_100012238( "createKeybagForUserSession",  @"Failed to create bag with aks error:0x%x",  v15,  v16,  v17,  v18,  v19,  v20,  v14);
      uint64_t v13 = sub_10000E388(v21);
    }

    else
    {
      sub_100012238("createKeybagForUserSession", @"Created keybag for uid:%d", v15, v16, v17, v18, v19, v20, a2);
      if (a5 >= 1)
      {
        sub_100012238( "createKeybagForUserSession",  @"TRYING TO SET GRACE PERIOD FOR USER with %d secs",  v22,  v23,  v24,  v25,  v26,  v27,  a5);
        uint64_t v28 = sub_10000E280();
        uint64_t valuePtr = a5;
        CFNumberRef v29 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt64Type, &valuePtr);
        if (v29)
        {
          CFNumberRef v30 = v29;
          CFDictionarySetValue(v28, kAKSConfigGracePeriod, v29);
          CFRelease(v30);
        }

        int v37 = aks_set_configuration(v66, a3, a4, v28);
        if (v28) {
          CFRelease(v28);
        }
        if (v37) {
          sub_100012238( "createKeybagForUserSession",  @"FAILED TO SET  Graceperiod of %d secs with error:%d",  v31,  v32,  v33,  v34,  v35,  v36,  a5);
        }
        else {
          sub_100012238( "createKeybagForUserSession",  @"SUCCESSFUL Setting of Graceperiod of %d secs",  v31,  v32,  v33,  v34,  v35,  v36,  a5);
        }
      }

      sub_100012238("createKeybagForUserSession", @"Saving keybag for uid:%d", v22, v23, v24, v25, v26, v27, a2);
      uint64_t v13 = sub_100005A9C(v66, a2, a6, 0);
      if (!(_DWORD)v13)
      {
        sub_100012238( "createKeybagForUserSession",  @"Setting it to  System for user:%d",  v38,  v39,  v40,  v41,  v42,  v43,  a2);
        uint64_t v45 = aks_set_system_with_passcode(v66, a2, a3, a4);
        if ((_DWORD)v45)
        {
          uint64_t v52 = v45;
          sub_100012238( "createKeybagForUserSession",  @"Failed to setsystem for the bag with aks error:0x%x",  v46,  v47,  v48,  v49,  v50,  v51,  v45);
          uint64_t v13 = sub_10000E388(v52);
          if (sub_100005A9C(0xFFFFFFFFLL, a2, 0LL, 0)) {
            sub_100012238( "createKeybagForUserSession",  @"Failed to remove user bag for session %d: %d",  v53,  v54,  v55,  v56,  v57,  v58,  a2);
          }
        }

        else
        {
          if ((_DWORD)a2 != 502)
          {
            sub_100012238( "createKeybagForUserSession",  @"seting APFSVolumeID For KeyBag ",  v46,  v47,  v48,  v49,  v50,  v51,  v63);
            sub_100010E48(v66, a2, a1, 1, v59, v60, v61, v62, v64);
          }

          uint64_t v13 = 0LL;
        }
      }
    }

    if (v66 != -1) {
      aks_unload_bag(v66);
    }
  }

  return v13;
}

uint64_t sub_100011394( uint64_t a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10 = sub_100006AA8(a4, 1, a5);
  uint64_t v17 = v10;
  if ((_DWORD)v10) {
    sub_100012238( "setupKeybagForPersona",  @"KBMapDeviceBag failed with error %d",  v11,  v12,  v13,  v14,  v15,  v16,  v10);
  }
  else {
    sub_100012238("setupKeybagForPersona", @"KBMapDeviceBag Success", v11, v12, v13, v14, v15, v16, v19);
  }
  return v17;
}

uint64_t sub_10001141C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int v24 = -1;
  sub_100012238("unloadUserSessionUserBag", @"Unloading UserKeyBag for User:%d", a3, a4, a5, a6, a7, a8, a1);
  if (aks_get_system(a1, &v24))
  {
    sub_100012238( "unloadUserSessionUserBag",  @"no Userbag found for UID %d with error:0x%x",  v9,  v10,  v11,  v12,  v13,  v14,  a1);
    return 0LL;
  }

  else
  {
    sub_100012238( "unloadUserSessionUserBag",  @"Found loaded SyncBag and unloading the bag",  v9,  v10,  v11,  v12,  v13,  v14,  v23);
    uint64_t v15 = aks_unload_bag(v24);
    if ((_DWORD)v15) {
      sub_100012238( "unloadUserSessionUserBag",  @"failed to unload SyncBag for UID:%d with error:0x%x",  v16,  v17,  v18,  v19,  v20,  v21,  a1);
    }
    else {
      sub_100012238( "unloadUserSessionUserBag",  @"Unloaded of SyncBag for UID:%d , Successful",  v16,  v17,  v18,  v19,  v20,  v21,  a1);
    }
  }

  return v15;
}

uint64_t sub_1000114E8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int v68 = -1;
  unsigned int v69 = -1;
  uint64_t v67 = 0LL;
  int v66 = 0;
  sub_100012238("createSyncBagForSyncBubble", @"Creating a new SyncBag for User %d", a3, a4, a5, a6, a7, a8, a2);
  uint64_t system = aks_get_system(a2, &v68);
  if ((_DWORD)system)
  {
    uint64_t v16 = system;
    sub_100012238( "createSyncBagForSyncBubble",  @"Unable to find user session_handle for user %d with error:0x%x",  v10,  v11,  v12,  v13,  v14,  v15,  a2);
LABEL_7:
    uint64_t v31 = sub_10000E388(v16);
    goto LABEL_8;
  }

  uint64_t v17 = aks_create_sync_bag(0LL, 0LL, v68, &v69);
  if ((_DWORD)v17)
  {
    uint64_t v16 = v17;
    sub_100012238( "createSyncBagForSyncBubble",  @"failed to create SyncBag for uid %d: with error: 0x%x",  v18,  v19,  v20,  v21,  v22,  v23,  a2);
    goto LABEL_7;
  }

  sub_100012238( "createSyncBagForSyncBubble",  @"Saving content in usersyncbag for User %d",  v18,  v19,  v20,  v21,  v22,  v23,  a2);
  uint64_t v24 = aks_save_bag(v69, &v67, &v66);
  if ((_DWORD)v24)
  {
    uint64_t v16 = v24;
    sub_100012238( "createSyncBagForSyncBubble",  @"failed to retrive SyncBag content from keybag for uid %d: with error: 0x%x",  v25,  v26,  v27,  v28,  v29,  v30,  a2);
    goto LABEL_7;
  }

  CFDataRef v33 = CFDataCreateWithBytesNoCopy(kCFAllocatorDefault, v67, v66, kCFAllocatorDefault);
  if (!v33)
  {
    sub_100012238( "createSyncBagForSyncBubble",  @"failed to retrive SyncBag content from keybag for uid %d: with error: 0x%x",  v34,  v35,  v36,  v37,  v38,  v39,  a2);
    uint64_t v16 = 5LL;
    goto LABEL_7;
  }

  CFDataRef v40 = v33;
  if (stat("/private/var//keybags/usersyncbag.kb", &v65)
    || (sub_100012238( "createSyncBagForSyncBubble",  @"Existing SyncBag needs update",  v41,  v42,  v43,  v44,  v45,  v46,  v62),  (uint64_t v47 = (__CFDictionary *)sub_10000E140("/private/var//keybags/usersyncbag.kb")) == 0LL))
  {
    uint64_t v47 = sub_10000E280();
  }

  CFStringRef v48 = CFStringCreateWithFormat(kCFAllocatorDefault, 0LL, @"%d", a2);
  if (CFDictionaryContainsKey(v47, v48)) {
    CFDictionaryReplaceValue(v47, v48, v40);
  }
  else {
    CFDictionaryAddValue(v47, v48, v40);
  }
  else {
    uint64_t v55 = @"Saved UserSyncBag";
  }
  sub_100012238("createSyncBagForSyncBubble", v55, v49, v50, v51, v52, v53, v54, v63);
  sub_100012238("createSyncBagForSyncBubble", @"SyncBag Creation completed", v56, v57, v58, v59, v60, v61, v64);
  CFRelease(v40);
  if (v48) {
    CFRelease(v48);
  }
  if (v47) {
    CFRelease(v47);
  }
  uint64_t v31 = 0LL;
LABEL_8:
  if (v69 != -1) {
    aks_unload_bag(v69);
  }
  return v31;
}

uint64_t sub_10001175C( const __CFDictionary *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int v67 = -1;
  sub_100012238("loadSyncBagForSyncBubble", @"Loading SyncBag for the User:%d", a3, a4, a5, a6, a7, a8, a2);
  uint64_t v10 = sub_100010A5C(a1, a2, 0LL, 0LL, 0, 0, 0);
  if (!(_DWORD)v10)
  {
    sub_100012238("loadSyncBagForSyncBubble", @"LOAD SyncBag for uid %d", v11, v12, v13, v14, v15, v16, a2);
    uint64_t system = aks_get_system(a2, &v67);
    if ((_DWORD)system != -536870160)
    {
      uint64_t v25 = system;
      if ((_DWORD)system)
      {
        sub_100012238( "loadSyncBagForSyncBubble",  @"error with user session_handle for user %d with error:0x%x",  v19,  v20,  v21,  v22,  v23,  v24,  a2);
        goto LABEL_22;
      }

      sub_100012238( "loadSyncBagForSyncBubble",  @"KeyBag for uid %d loaded and ready for syncbag",  v19,  v20,  v21,  v22,  v23,  v24,  a2);
    }

    uint64_t v26 = (const __CFDictionary *)sub_10000E140("/private/var//keybags/usersyncbag.kb");
    if (!v26)
    {
      sub_100012238( "loadSyncBagForSyncBubble",  @"Failed to load userSyncBagDict file",  v27,  v28,  v29,  v30,  v31,  v32,  v65);
      uint64_t v25 = 5LL;
      return sub_10000E388(v25);
    }

    CFDataRef v33 = v26;
    CFStringRef v34 = CFStringCreateWithFormat(kCFAllocatorDefault, 0LL, @"%d", a2);
    if (CFDictionaryContainsKey(v33, v34))
    {
      Value = (const __CFData *)CFDictionaryGetValue(v33, v34);
      if (Value)
      {
        CFStringRef v48 = Value;
        sub_100012238( "loadSyncBagForSyncBubble",  @"SyncBagContent is being loaded to keybag %d",  v42,  v43,  v44,  v45,  v46,  v47,  a2);
        BytePtr = CFDataGetBytePtr(v48);
        CFIndex Length = CFDataGetLength(v48);
        uint64_t v51 = aks_unlock_with_sync_bag(BytePtr, Length, 0LL, 0LL, v67);
        uint64_t v25 = v51;
        if ((_DWORD)v51)
        {
          sub_100012238( "loadSyncBagForSyncBubble",  @"Failed to load SyncBag data with error 0x%x, clearing syncBag for user:%d",  v52,  v53,  v54,  v55,  v56,  v57,  v51);
          if (sub_100011A40(a1, a2, 0LL, v58, v59, v60, v61, v62))
          {
            sub_100012238( "loadSyncBagForSyncBubble",  @"Failed to clear SyncBag content for User:%d",  v52,  v53,  v54,  v55,  v56,  v57,  a2);
            goto LABEL_20;
          }

          char v66 = a2;
          char v63 = @"Cleared SyncBag content for User:%d";
        }

        else
        {
          char v63 = @"SyncBag loaded and unlocked";
        }

        sub_100012238("loadSyncBagForSyncBubble", v63, v52, v53, v54, v55, v56, v57, v66);
LABEL_20:
        CFRelease(v33);
        if (v34) {
          CFRelease(v34);
        }
LABEL_22:
        if (!(_DWORD)v25) {
          return 0LL;
        }
        return sub_10000E388(v25);
      }

      sub_100012238( "loadSyncBagForSyncBubble",  @"No SyncBagContent in userSyncBagDict for User %d",  v42,  v43,  v44,  v45,  v46,  v47,  a2);
    }

    else
    {
      sub_100012238( "loadSyncBagForSyncBubble",  @"No syncbag uidkey for the user:%d in userSyncBagDict",  v35,  v36,  v37,  v38,  v39,  v40,  a2);
      CFDictionarySetValue(a1, @"MKBUserSessionHasSyncBag", kCFBooleanFalse);
    }

    uint64_t v25 = 5LL;
    goto LABEL_20;
  }

  uint64_t v17 = v10;
  sub_100012238( "loadSyncBagForSyncBubble",  @"Failed to load User keybag for user:%d",  v11,  v12,  v13,  v14,  v15,  v16,  a2);
  return v17;
}

uint64_t sub_100011A40( __CFDictionary *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if ((_DWORD)a3)
  {
    int v10 = sub_100011D90((uint64_t)a1, a2, a3, a4, a5, a6, a7, a8);
    if (!v10)
    {
      uint64_t v11 = @"Unload of SyncBag successful";
      goto LABEL_6;
    }
  }

  else
  {
    LOBYTE(v10) = 5;
  }

  char v65 = v10;
  uint64_t v11 = @"Unload of SyncBag failed with error:%d";
LABEL_6:
  sub_100012238("removeSyncBagForSyncBubble", v11, a3, a4, a5, a6, a7, a8, v65);
  uint64_t v12 = (void *)sub_10000E140("/private/var//keybags/usersyncbag.kb");
  if (v12)
  {
    CFStringRef v13 = CFStringCreateWithFormat(kCFAllocatorDefault, 0LL, @"%d", a2);
    if (!CFDictionaryContainsKey((CFDictionaryRef)v12, v13))
    {
      sub_100012238( "removeSyncBagForSyncBubble",  @"No syncbag uidkey for the user:%d in userSyncBagDict, removing hasSyncKey",  v14,  v15,  v16,  v17,  v18,  v19,  a2);
      CFDictionarySetValue(a1, @"MKBUserSessionHasSyncBag", kCFBooleanFalse);
LABEL_14:
      CFRelease(v12);
      if (v13) {
        CFRelease(v13);
      }
      return sub_10000E388(5LL);
    }

    CFDictionaryRemoveValue((CFMutableDictionaryRef)v12, v13);
    sub_100012238( "removeSyncBagForSyncBubble",  @"Removed SyncBag coontent from UserSyncBag for user :%d",  v20,  v21,  v22,  v23,  v24,  v25,  a2);
    if (CFDictionaryGetCount((CFDictionaryRef)v12))
    {
      if (sub_10000E018(v12, "/private/var//keybags/usersyncbag.kb"))
      {
        sub_100012238( "removeSyncBagForSyncBubble",  @"Failed to save Updated UserSyncBag",  v32,  v33,  v34,  v35,  v36,  v37,  v67);
        goto LABEL_14;
      }

      sub_100012238( "removeSyncBagForSyncBubble",  @"Saved UserSyncBag and removal of user:%d syncbag completed",  v32,  v33,  v34,  v35,  v36,  v37,  a2);
    }

    else
    {
      sub_100012238( "removeSyncBagForSyncBubble",  @"NO SyncBag for any Users, removing file..",  v26,  v27,  v28,  v29,  v30,  v31,  v67);
      unlink("/private/var//keybags/usersyncbag.kb");
      sub_100012238("removeSyncBagForSyncBubble", @"Invalidate all SyncBags", v52, v53, v54, v55, v56, v57, v69);
      int v58 = aks_invalidate_sync_bags();
      if (v58) {
        sub_100012238( "removeSyncBagForSyncBubble",  @"Failed to invalidate all syncbags with error:0x%x",  v59,  v60,  v61,  v62,  v63,  v64,  v58);
      }
      else {
        sub_100012238( "removeSyncBagForSyncBubble",  @"XXXXXXXXXXXXXXXX INVALIDATED ALL SYNCBAGS XXXXXXXXXXXXXXXX",  v59,  v60,  v61,  v62,  v63,  v64,  v70);
      }
    }
  }

  else
  {
    int v38 = stat("/private/var//keybags/usersyncbag.kb", &v71);
    sub_100012238( "removeSyncBagForSyncBubble",  @"Failed to load userSyncBagDict file",  v39,  v40,  v41,  v42,  v43,  v44,  v66);
    if (!v38) {
      return sub_10000E388(5LL);
    }
    CFStringRef v13 = 0LL;
  }

  sub_100012238( "removeSyncBagForSyncBubble",  @"RESET kMKBUserSessionHasSyncBagKey",  v45,  v46,  v47,  v48,  v49,  v50,  v68);
  CFDictionarySetValue(a1, @"MKBUserSessionHasSyncBag", kCFBooleanFalse);
  if (!v12)
  {
    if (!v13) {
      return 0LL;
    }
    goto LABEL_23;
  }

  CFRelease(v12);
  if (v13) {
LABEL_23:
  }
    CFRelease(v13);
  return 0LL;
}

uint64_t sub_100011CBC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (const __CFDictionary *)sub_10000E140("/private/var//keybags/usersyncbag.kb");
  if (v3)
  {
    int v10 = v3;
    CFStringRef v11 = CFStringCreateWithFormat(kCFAllocatorDefault, 0LL, @"%d", a2);
    int v12 = CFDictionaryContainsKey(v10, v11);
    if (v12) {
      uint64_t v19 = @"Bag exists in UserSyncBag for user :%d";
    }
    else {
      uint64_t v19 = @"No syncbag uidkey for the user:%d in userSyncBagDict, removing hasSyncKey";
    }
    if (v12) {
      uint64_t v20 = 0LL;
    }
    else {
      uint64_t v20 = 5LL;
    }
    sub_100012238("verifySyncBagForSyncBubbleExists", v19, v13, v14, v15, v16, v17, v18, a2);
    CFRelease(v10);
    if (v11) {
      CFRelease(v11);
    }
  }

  else
  {
    sub_100012238( "verifySyncBagForSyncBubbleExists",  @"Failed to load userSyncBagDict file",  v4,  v5,  v6,  v7,  v8,  v9,  v22);
    return 5LL;
  }

  return v20;
}

uint64_t sub_100011D90( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int v25 = -1;
  sub_100012238("unloadSyncBagForSyncBubble", @"Unloading UserKeyBag for User:%d", a3, a4, a5, a6, a7, a8, a2);
  if (aks_get_system(a2, &v25))
  {
    sub_100012238( "unloadSyncBagForSyncBubble",  @"no SyncBag found for UID %d with error:0x%x",  v9,  v10,  v11,  v12,  v13,  v14,  a2);
    return 0LL;
  }

  sub_100012238( "unloadSyncBagForSyncBubble",  @"Found loaded SyncBag and unloading the bag",  v9,  v10,  v11,  v12,  v13,  v14,  v24);
  uint64_t v16 = aks_unload_bag(v25);
  if (!(_DWORD)v16)
  {
    sub_100012238( "unloadSyncBagForSyncBubble",  @"Unloaded of SyncBag for UID:%d , Successful",  v17,  v18,  v19,  v20,  v21,  v22,  a2);
    return 0LL;
  }

  uint64_t v23 = v16;
  sub_100012238( "unloadSyncBagForSyncBubble",  @"failed to unload SyncBag for UID:%d with error:0x%x",  v17,  v18,  v19,  v20,  v21,  v22,  a2);
  return sub_10000E388(v23);
}

uint64_t sub_100011E60(uint64_t a1, const __CFString *a2, const __CFString *a3, uint64_t a4, uint64_t a5)
{
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  *(_OWORD *)in = 0u;
  __int128 v37 = 0u;
  if (CFStringGetCString(a2, buffer, 1024LL, 0x8000100u))
  {
    if (CFStringGetCString(a3, in, 256LL, 0x8000100u))
    {
      uint64_t v15 = uuid_parse(in, uu);
      if ((_DWORD)v15)
      {
        uint64_t v16 = @"failed to parse unique string to uuid_t";
      }

      else
      {
        int v17 = aks_keybag_persona_create(v15, a4, a5, uu);
        if (v17)
        {
          char v33 = v17;
          uint64_t v16 = @"Failed to create persona key with error:0x%x";
        }

        else
        {
          sub_100012238( "createPersonaKeyForUser",  @"Created persona key in the keybag",  v9,  v10,  v11,  v12,  v13,  v14,  v33);
          int v25 = sub_100011394(v19, v20, v21, buffer, (uint64_t)uu, v22, v23, v24);
          if (!v25)
          {
            sub_100012238( "createPersonaKeyForUser",  @" Successful Setup of keybag with persona key",  v26,  v27,  v28,  v29,  v30,  v31,  v34);
            return 0LL;
          }

          sub_100012238( "createPersonaKeyForUser",  @"failed to Setup keybag with persona key:%d",  v26,  v27,  v28,  v29,  v30,  v31,  v25);
          int v32 = aks_keybag_persona_delete(0LL, uu);
          if (v32)
          {
            sub_100012238( "createPersonaKeyForUser",  @"Failed to delete persona key with error:0x%x",  v9,  v10,  v11,  v12,  v13,  v14,  v32);
            return 22LL;
          }

          uint64_t v16 = @"Successful deleted persona key";
        }
      }
    }

    else
    {
      uint64_t v16 = @"Failed to get cstring from uuid string";
    }
  }

  else
  {
    uint64_t v16 = @"Failed to get volume path";
  }

  sub_100012238("createPersonaKeyForUser", v16, v9, v10, v11, v12, v13, v14, v33);
  return 22LL;
}

uint64_t sub_100012044(int a1, CFStringRef theString, const __CFString *a3)
{
  *(_OWORD *)buffer = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  __int128 v53 = 0u;
  __int128 v54 = 0u;
  __int128 v55 = 0u;
  if (!CFStringGetCString(theString, buffer, 256LL, 0x8000100u))
  {
    uint64_t v11 = @"Failed to get cstring from uuid string";
    goto LABEL_5;
  }

  uint64_t v10 = uuid_parse(buffer, uu);
  if ((_DWORD)v10)
  {
    uint64_t v11 = @"failed to parse unique string to uuid_t";
LABEL_5:
    sub_100012238("deletePersonaKeyForUser", v11, v4, v5, v6, v7, v8, v9, v35);
    return 22LL;
  }

  uint64_t v14 = aks_keybag_persona_delete(v10, uu);
  uint64_t v12 = v14;
  if (!a3 || (_DWORD)v14)
  {
    if ((_DWORD)v14) {
      sub_100012238( "deletePersonaKeyForUser",  @"persona key delete failed with 0x%x",  v15,  v16,  v17,  v18,  v19,  v20,  v14);
    }
  }

  else
  {
    sub_100012238( "deletePersonaKeyForUser",  @"Non Null VolumeID, parsing the uuid",  v15,  v16,  v17,  v18,  v19,  v20,  v35);
    bzero(in, 0x400uLL);
    if (!CFStringGetCString(a3, in, 1024LL, 0x8000100u))
    {
      uint64_t v27 = @"failed to convert to CString";
      goto LABEL_16;
    }

    if (uuid_parse(in, v37))
    {
      uint64_t v27 = @"volume uuid_parse failed";
LABEL_16:
      sub_100012238("deletePersonaKeyForUser", v27, v21, v22, v23, v24, v25, v26, v36);
      return 0LL;
    }

    sub_100012238( "deletePersonaKeyForUser",  @"uuid_parse SUCCESS, Unmaping the Persona Volume",  v21,  v22,  v23,  v24,  v25,  v26,  v36);
    uint64_t v28 = aks_set_keybag_for_volume(0xFFFFFFFFLL, v37, 0LL);
    uint64_t v12 = v28;
    if ((_DWORD)v28) {
      sub_100012238( "deletePersonaKeyForUser",  @"persona volume unmap failed with 0x%x",  v29,  v30,  v31,  v32,  v33,  v34,  v28);
    }
  }

  return v12;
}

void sub_100012238( void *a1, const __CFString *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (!a1) {
    a1 = &unk_10001CBD7;
  }
  sub_100012270((int)a1, a2, &a9);
}

void sub_100012270(int a1, CFStringRef format, va_list arguments)
{
  if (dword_100029340)
  {
    if (&_MOLogWriteV) {
      BOOL v3 = qword_100029310 == 0;
    }
    else {
      BOOL v3 = 1;
    }
    if (!v3) {
      MOLogWriteV();
    }
  }

  else
  {
    uint64_t v4 = CFStringCreateWithFormatAndArguments(0LL, 0LL, format, arguments);
    if (v4)
    {
      uint64_t v5 = v4;
      if (CFStringGetCString(v4, buffer, 1024LL, 0x8000100u))
      {
        size_t v6 = strlen(buffer);
        if (v6)
        {
          size_t v7 = v6;
          if (v6 <= 0x3FF)
          {
            buffer[v6] = 10;
            size_t v7 = v6 + 1;
          }

          fprintf(__stdoutp, "MKB_INIT: %s", buffer);
          if (dword_100029280 != -1) {
            sub_10000DE4C(dword_100029280, buffer, v7);
          }
        }
      }

      CFRelease(v5);
    }
  }

void sub_1000123A4(const char *a1)
{
  xpc_object_t v2 = localtime(&v19);
  BOOL v3 = asctime(v2);
  snprintf(__str, 0x50uLL, "%s-%s", a1, v3);
  __str[strlen(__str) - 1] = 0;
  sub_100012238("fatality", @"FATAL KEYBAG ERROR: %s", v4, v5, v6, v7, v8, v9, (char)a1);
  sub_100006010("keybagd", __str);
  sub_100006010("auto-boot", "false");
  sub_100012238("fatality", @"Rebooting...", v10, v11, v12, v13, v14, v15, v18);
  uint64_t v16 = fopen("/dev/console", "a");
  if (v16)
  {
    uint64_t v17 = v16;
    fprintf(v16, "FATAL KEYBAG ERROR: %s\n", a1);
    fwrite("REBOOTING INTO RECOVERY MODE.\n", 0x1EuLL, 1uLL, v17);
    fclose(v17);
  }

  reboot(0);
  exit(71);
}

BOOL sub_1000124A4()
{
  size_t __len = 1023LL;
  bzero(__big, 0x400uLL);
  return !sysctlbyname("kern.bootargs", __big, &__len, 0LL, 0LL) && strnstr(__big, "keybag_initlog", __len) != 0LL;
}

uint64_t sub_100012548()
{
  int v0 = sub_100012234();
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  __int128 v6 = 0u;
  uint64_t v1 = 4294967293LL;
  if ((sub_100005978() & 1) == 0)
  {
    int current_persona_proximate_info = voucher_get_current_persona_proximate_info(&v6);
    int v3 = DWORD1(v7);
    if (current_persona_proximate_info) {
      int v3 = -1;
    }
    if (v3 != v0 || v0 == -1) {
      return 0LL;
    }
    else {
      return 4294967293LL;
    }
  }

  return v1;
}

uint64_t sub_1000125DC()
{
  if ((byte_1000292F0 & 1) == 0)
  {
    uint64_t v0 = sub_100012548();
  }

  return byte_1000292F0;
}

sqlite3 *sub_10001262C(uint64_t a1)
{
  Class result = sub_10000CFA4("/private/var//keybags/backup/backup_keys_cache.sql3", 0, 0);
  if (result)
  {
    int v3 = result;
    if (sub_10000D5B4(result, *(const void **)(a1 + 32)))
    {
      memset(out, 0, 37);
      uuid_unparse(*(const unsigned __int8 **)(a1 + 32), out);
      sub_100012238( "clear_volume_backup_keys_block_invoke",  @"Failed to delete cached keys for volume %s (err=%d)",  v4,  v5,  v6,  v7,  v8,  v9,  (char)out);
    }

    return (sqlite3 *)sub_10000CFAC(v3);
  }

  return result;
}

uint64_t sub_1000126F4()
{
  int v0 = aks_clear_backup_bag(0LL);
  if (v0)
  {
    sub_100012238( "unregister_backup_bag",  @"Can't unregister OTA Backup bag with AppleKeyStore: %x.",  v1,  v2,  v3,  v4,  v5,  v6,  v0);
    return 0xFFFFFFFFLL;
  }

  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 0x40000000LL;
    block[2] = sub_10001262C;
    block[3] = &unk_100020E08;
    block[4] = &unk_100029300;
    dispatch_sync((dispatch_queue_t)qword_1000292F8, block);
    return 0LL;
  }

uint64_t sub_100012784(const __CFData *a1, uint64_t a2, uint64_t a3, CFDataRef *a4, int a5)
{
  uint64_t v5 = 0xFFFFFFFFLL;
  unsigned int v29 = -1;
  *(void *)&length[1] = 0LL;
  length[0] = 0;
  if (!a1) {
    goto LABEL_9;
  }
  BytePtr = CFDataGetBytePtr(a1);
  CFIndex v12 = CFDataGetLength(a1);
  uint64_t v13 = aks_load_bag(BytePtr, v12, &v29);
  if ((_DWORD)v13)
  {
    sub_100012238("register_backup_bag", @"Can't read OTA Backup bag: %x.", v14, v15, v16, v17, v18, v19, v13);
LABEL_14:
    uint64_t v5 = 0xFFFFFFFFLL;
    goto LABEL_9;
  }

  int v20 = aks_set_backup_bag(v13, v29, a2, a3, &length[1], length);
  if (v20)
  {
    sub_100012238( "register_backup_bag",  @"Can't register OTA Backup bag with AppleKeyStore: %x.",  v21,  v22,  v23,  v24,  v25,  v26,  v20);
    goto LABEL_14;
  }

  if (a4) {
    *a4 = CFDataCreateWithBytesNoCopy(kCFAllocatorDefault, *(const UInt8 **)&length[1], length[0], kCFAllocatorDefault);
  }
  if (a5)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 0x40000000LL;
    block[2] = sub_10001262C;
    block[3] = &unk_100020E08;
    block[4] = &unk_100029300;
    dispatch_sync((dispatch_queue_t)qword_1000292F8, block);
  }

  uint64_t v5 = 0LL;
LABEL_9:
  if (v29 != -1) {
    aks_unload_bag(v29);
  }
  return v5;
}

uint64_t start(int a1, uint64_t a2)
{
  int v4 = setiopolicy_np(9, 0, 1);
  if (v4) {
    sub_100012238("main", @"Error setting io policy: %d", v5, v6, v7, v8, v9, v10, v4);
  }
  if (a1 == 2 && !strcmp(*(const char **)(a2 + 8), "--init"))
  {
    if (sub_1000064B0(":/product", @"boot-ios-diagnostics") == 1)
    {
      __int128 v40 = __stdoutp;
      __int128 v41 = "****** DIAGNOSTICS MODE ENABLED, SKIP INIT ****\n";
      size_t v42 = 48LL;
    }

    else if (os_variant_uses_ephemeral_storage("com.apple.mobile.keybagd"))
    {
      __int128 v40 = __stdoutp;
      __int128 v41 = "****** DEVICE HAS EPHEMERAL DATA VOLUME, SKIP INIT ****\n";
      size_t v42 = 56LL;
    }

    else
    {
      if (sub_1000124A4())
      {
        dword_100029280 = open("/var/logs/keybagd_init.log", 522, 448LL);
        if (dword_100029280 == -1) {
          fwrite("****** FAILED TO OPEN LOGFILE ****\n", 0x23uLL, 1uLL, __stdoutp);
        }
      }

      sub_100007358((uint64_t)sub_100012238);
      sub_100007364((uint64_t)sub_100012270);
      fwrite("****** IN MKB_INIT ****\n", 0x18uLL, 1uLL, __stdoutp);
      qword_1000292F8 = (uint64_t)dispatch_queue_create("com.apple.mobile.keybagd.db", 0LL);
      sub_100012D80();
      sub_100013028();
      if (dword_100029280 != -1) {
        close(dword_100029280);
      }
      __int128 v40 = __stdoutp;
      __int128 v41 = "****** DONE MKB_INIT ****\n";
      size_t v42 = 26LL;
    }

    fwrite(v41, v42, 1uLL, v40);
    exit(0);
  }

  sub_100007358((uint64_t)sub_100012238);
  sub_100007364((uint64_t)sub_100012270);
  uint64_t v11 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_USER_INITIATED, 0);
  BOOL v12 = sub_10000E354();
  uint64_t v13 = 0LL;
  uint64_t v14 = 0LL;
  if (v12)
  {
    uint64_t v14 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_USER_INTERACTIVE, 0);
    uint64_t v13 = v11;
  }

  qword_100029348 = (uint64_t)dispatch_queue_create("com.apple.mobile.keybagd.passcode", v13);
  qword_1000292F8 = (uint64_t)dispatch_queue_create("com.apple.mobile.keybagd.db", v14);
  qword_100029350 = (uint64_t)dispatch_queue_create("com.apple.mobile.keybagd.seshat", v11);
  if (!qword_100029348 || !qword_1000292F8)
  {
    sub_100012238("main", @"Can't create dispatch resources.", v15, v16, v17, v18, v19, v20, v43);
    return 71LL;
  }

  if (sub_1000159DC()) {
    sub_100012238( "main",  @"Can't register for notifications with AppleKeyStore",  v21,  v22,  v23,  v24,  v25,  v26,  v43);
  }
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  xpc_set_event_stream_handler("com.apple.notifyd.matching", global_queue, &stru_100020E48);
  sub_10000BBC8();
  openlog("keybagd", 1, 24);
  uint64_t v28 = getenv("__OSINSTALL_ENVIRONMENT");
  if (v28 || (&_MOLogEnableDiskLogging ? (BOOL v29 = &_MOLogOpen == 0LL) : (BOOL v29 = 1), v29))
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_24;
    }
    *(_DWORD *)buf = 67109120;
    BOOL v45 = v28 == 0LL;
    uint64_t v32 = "MOLog* unavailable, disabling MOLog*() based logging (enable: %d).";
    uint32_t v33 = 8;
LABEL_23:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v32, buf, v33);
    goto LABEL_24;
  }

  uint64_t v30 = MOLogOpen("com.apple.mobile.keybagd", 3LL);
  qword_100029310 = v30;
  if (!v30)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_24;
    }
    *(_WORD *)buf = 0;
    uint64_t v32 = "MOLogOpen() failed, disabling MOLog*() based logging.";
    uint32_t v33 = 2;
    goto LABEL_23;
  }

  MOLogEnableDiskLogging(v30, "/var/logs/keybagd.log", 3LL, 0x100000LL);
LABEL_24:
  sub_100007358((uint64_t)sub_100012238);
  sub_100007364((uint64_t)sub_100012270);
  dword_100029340 = 1;
  xpc_activity_register("com.apple.mobile.keybagd.data-analytics", XPC_ACTIVITY_CHECK_IN, &stru_100021158);
  dispatch_async((dispatch_queue_t)qword_100029348, &stru_100021198);
  xpc_activity_register("com.apple.mobile.keybagd.space_repetition", XPC_ACTIVITY_CHECK_IN, &stru_1000211D8);
  fsctl("/private/var/", 0x40104A60uLL, &unk_100029300, 0);
  CFRunLoopRun();
  return 0LL;
}

uint64_t sub_100012D80()
{
  uint64_t v6 = sub_100004A44();
  if (!v6)
  {
    goto LABEL_10;
  }

  sub_100012238("load_devicebag", @"Found system keybag plist on filesystem.", v0, v1, v2, v3, v4, v5, v62);
  uint64_t v13 = (const __CFData *)sub_10000DB44(v6, @"KeyBagKeys");
  if (!v13) {
    sub_100012238("load_devicebag", @"No valid keybag data found in plist.", v7, v8, v9, v10, v11, v12, v62);
  }
  Value = CFDictionaryGetValue(v6, @"KeybagxART");
  if (aks_get_system(0LL, &v63) == -536870160)
  {
    if (v13)
    {
      sub_100012238( "load_devicebag",  @"Try to load filesystem bag as handle 0.",  v15,  v16,  v17,  v18,  v19,  v20,  v62);
      if (Value)
      {
        int v21 = sub_100005978();
        char Length = CFDataGetLength(v13);
        if (v21)
        {
          sub_100012238( "load_devicebag",  @"xART based bag should have been loaded at startup, let's ignore it (eAPFS, len=%d)",  v23,  v24,  v25,  v26,  v27,  v28,  Length);
          goto LABEL_18;
        }

        sub_100012238( "load_devicebag",  @"xART based bag should have been loaded at startup, let's try to load it anyway (NOT eAPFS, len=%d)",  v23,  v24,  v25,  v26,  v27,  v28,  Length);
      }

      BytePtr = CFDataGetBytePtr(v13);
      CFIndex v31 = CFDataGetLength(v13);
      int v32 = aks_load_bag(BytePtr, v31, &v63);
      if (v32)
      {
        sub_100012238( "load_devicebag",  @"Uh Oh! Kernel doesn't like this keybag: 0x%08x.",  v33,  v34,  v35,  v36,  v37,  v38,  v32);
        goto LABEL_18;
      }

      int v39 = aks_set_system(v63, 0LL);
      aks_unload_bag(v63);
      if (v39)
      {
        sub_100012238( "load_devicebag",  @"Uh Oh! Can't set system keybag:0x%08x.",  v15,  v16,  v17,  v18,  v19,  v20,  v39);
        goto LABEL_18;
      }

      BOOL v29 = @"Handle 0 loaded.";
      goto LABEL_17;
    }

LABEL_10:
    BOOL v29 = @"No system keybag found on filesystem.";
LABEL_17:
    sub_100012238("load_devicebag", v29, v15, v16, v17, v18, v19, v20, v62);
  }

LABEL_18:
  char v40 = sub_100005978();
  int system = aks_get_system(0LL, &v63);
  if ((v40 & 1) != 0)
  {
    if (system)
    {
      sub_100012238("load_devicebag", @"No system keybag loaded.", v42, v43, v44, v45, v46, v47, v62);
      if (!v6) {
        goto LABEL_26;
      }
LABEL_25:
      CFRelease(v6);
      goto LABEL_26;
    }

    sub_100012238( "load_devicebag",  @"Update system keybag on disk after load.",  v42,  v43,  v44,  v45,  v46,  v47,  v62);
    sub_10000658C(0LL, 0LL);
    if (v6) {
      goto LABEL_25;
    }
  }

  else
  {
    if (system) {
      sub_1000123A4("failed to load system bag");
    }
    if (v6) {
      goto LABEL_25;
    }
  }

LABEL_26:
  sub_100012238("load_devicebag", @"Setup allow list:", v48, v49, v50, v51, v52, v53, v62);
  int v54 = aks_setupallowlist_fs("/private/var/", 1LL);
  if (v54) {
    sub_100012238("load_devicebag", @"aks_setupallowlist_fs completed with %d", v55, v56, v57, v58, v59, v60, v54);
  }
  unlink("/private/var//keybags/backup/backup_keys_cache.db");
  return unlink("/private/var//keybags/backup/backup_keys_cache_old.db");
}

uint64_t sub_100013028()
{
  if (stat("/private/var//keybags/backup", &v1) < 0 && *__error() == 2) {
    mkdir("/private/var//keybags/backup", 0x1C0u);
  }
  return sub_10000DA44("/private/var//keybags/backup", 0, 1);
}

void sub_100013088(id a1, void *a2)
{
  string = xpc_dictionary_get_string(a2, _xpc_event_key_name);
  if (!strcmp(string, "com.apple.mobile.keybagd.first_unlock")) {
    byte_1000292F0 = 1;
  }
}

void sub_1000130C8(int a1, char a2)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000LL;
  block[2] = sub_100013138;
  block[3] = &unk_100020E68;
  int v5 = a1;
  char v6 = a2;
  dispatch_async((dispatch_queue_t)qword_100029348, block);
}

void sub_100013138( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000131A0(int a1)
{
  if (a1) {
    char v1 = 2;
  }
  else {
    char v1 = 1;
  }
  sub_1000131B4(1, v1);
}

void sub_1000131B4(int a1, char a2)
{
  unsigned int v14 = 1;
  uint64_t v13 = 0LL;
  uint64_t v4 = sub_100012548();
  if (!aks_get_lock_state(v4, &v14))
  {
    LOWORD(v13) = ((4 * v14) & 0x100 | (((v14 >> 5) & 1) << 9) & 0xEFFF | (v14 >> 3) & 0x400 | (v14 >> 1) & 0x800 | (((v14 >> 9) & 1) << 12) | ((16 * (a2 & 3)) | ((_BYTE)a1 << 6)) | 1) ^ 0x100;
    switch(a1)
    {
      case 2:
LABEL_5:
        sub_10000EA24(@"com.apple.mobile.keybagd.sidp.recovery", 0, v13);
        return;
      case 1:
        sub_10000F664(&v13, v5, v6, v7, v8, v9, v10, v11, v12);
        break;
      case 0:
        goto LABEL_5;
      default:
        sub_100012238("_collect_recovery_stats", @"invalid event %d", v6, v7, v8, v9, v10, v11, a1);
        break;
    }
  }

void sub_10001329C()
{
}

void sub_1000132C0(id a1)
{
}

BOOL sub_1000132D4()
{
  uint64_t v43 = 0LL;
  uint64_t v44 = 0LL;
  if ((byte_100029318 & 1) == 0)
  {
    uint64_t v0 = sub_10000CC88("/private/var//keybags/backup/backup_keys_cache.sql3", 0, 0, 0LL);
    if (v0)
    {
      char v1 = v0;
      BOOL v2 = sub_10000CB10(v0);
      sub_10000CFAC(v1);
      if (v2)
      {
        sub_100012238( "db_check_once",  @"%s is corrupted, discarding",  v3,  v4,  v5,  v6,  v7,  v8,  (char)"/private/var//keybags/backup/backup_keys_cache.sql3");
        unlink("/private/var//keybags/backup/backup_keys_cache.sql3");
      }

      else
      {
        sub_100012238( "db_check_once",  @"%s is ok",  v3,  v4,  v5,  v6,  v7,  v8,  (char)"/private/var//keybags/backup/backup_keys_cache.sql3");
      }

      byte_100029318 = 1;
    }
  }

  BOOL v9 = 0LL;
  uint64_t v10 = v43;
  if (!v43) {
    return v9;
  }
  uint64_t v11 = (char *)v44;
  int v49 = 0;
  uint64_t v45 = 0LL;
  int v46 = 0;
  char v47 = sub_1000125DC();
  memset(v48, 0, 14);
  char v12 = sub_10000CC88("/private/var//keybags/backup/backup_keys_cache.sql3", 1, 0, (uint64_t)&v45);
  if (!v12)
  {
    int v27 = 0;
    int v46 = 3;
    goto LABEL_24;
  }

  uint64_t v20 = v12;
  int v27 = 0;
  while (1)
  {
    sqlite3_int64 v56 = 0LL;
    v57[0] = 0LL;
    v57[1] = 0LL;
    memset(v55, 0, 28);
    __int128 v53 = 0u;
    __int128 v54 = 0u;
    __int128 v51 = 0u;
    __int128 v52 = 0u;
    __int128 v50 = 0u;
    if (bswap32(*((_DWORD *)v11 + 12)) < 0x49) {
      break;
    }
    sub_100012238( "drain_backup_keys",  @"Found bad key (key data larger than expected) trying to skip",  v21,  v22,  v23,  v24,  v25,  v26,  v42);
    int v46 = 1;
LABEL_17:
    v11 += 124;
    if (!--v10) {
      goto LABEL_21;
    }
  }

  ++v45;
  sqlite3_int64 v56 = *((void *)v11 + 4);
  uuid_copy((unsigned __int8 *)v57, (const unsigned __int8 *)v11);
  __int128 v28 = *((_OWORD *)v11 + 1);
  __int128 v29 = *((_OWORD *)v11 + 3);
  __int128 v51 = *((_OWORD *)v11 + 2);
  __int128 v52 = v29;
  __int128 v50 = v28;
  __int128 v30 = *((_OWORD *)v11 + 4);
  __int128 v31 = *((_OWORD *)v11 + 5);
  __int128 v32 = *((_OWORD *)v11 + 6);
  *(_OWORD *)((char *)v55 + 12) = *(_OWORD *)(v11 + 108);
  v55[0] = v32;
  __int128 v53 = v30;
  __int128 v54 = v31;
  int v33 = sub_10000CFF4(v20, &v56, &v50, &v49);
  if (!v33)
  {
    int v27 = 1;
    goto LABEL_17;
  }

  int v34 = v33;
  sub_100012238("drain_backup_keys", @"Failed to add key to db %d", v21, v22, v23, v24, v25, v26, v33);
  int v46 = 2;
  LODWORD(v48[0]) = v34;
  LODWORD(v48[1]) = v49;
LABEL_21:
  sub_10000CFAC(v20);
LABEL_24:
  sub_10000FCB4((uint64_t)&v45, v13, v14, v15, v16, v17, v18, v19, v42);
  BOOL v9 = v27 != 0;
  free(v44);
  return v9;
}

uint64_t sub_1000135C0(char a1)
{
  uint64_t v5 = 0LL;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2000000000LL;
  uint64_t v8 = 0LL;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 0x40000000LL;
  v3[2] = sub_100013658;
  v3[3] = &unk_100020ED0;
  char v4 = a1;
  v3[4] = &v5;
  dispatch_sync((dispatch_queue_t)qword_100029348, v3);
  uint64_t v1 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v1;
}

void sub_100013658( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (sub_100012548())
  {
    uint64_t v10 = sub_100012234();
    uint64_t v11 = sub_100004CA4(v10);
  }

  else
  {
    uint64_t v11 = sub_100004A44();
  }

  uint64_t v18 = v11;
  if (v11)
  {
    if (*(_BYTE *)(a1 + 40)) {
      uint64_t v19 = @"BackupKeyBagKeys";
    }
    else {
      uint64_t v19 = @"OpaqueStuff";
    }
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = CFDictionaryGetValue(v11, v19);
    uint64_t v20 = *(const void **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
    if (v20) {
      CFRetain(v20);
    }
    CFRelease(v18);
  }

  else
  {
    sub_100012238( "keybagd_getpasscodeblob_block_invoke",  @"Huh? can't load the bag. That makes no sense",  v12,  v13,  v14,  v15,  v16,  v17,  a9);
  }

uint64_t sub_1000136F8(uint64_t a1)
{
  uint64_t v4 = 0LL;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2000000000LL;
  int v7 = -1;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 0x40000000LL;
  v3[2] = sub_100013790;
  v3[3] = &unk_100020EF8;
  v3[4] = &v4;
  void v3[5] = a1;
  dispatch_sync((dispatch_queue_t)qword_100029348, v3);
  uint64_t v1 = *((unsigned int *)v5 + 6);
  _Block_object_dispose(&v4, 8);
  return v1;
}

uint64_t sub_100013790(uint64_t a1)
{
  uint64_t v2 = sub_100012548();
  if ((_DWORD)v2)
  {
    uint64_t v3 = sub_100012548();
    uint64_t v4 = sub_100012234();
    uint64_t result = sub_100005A9C(v3, v4, *(const void **)(a1 + 40), 0);
  }

  else
  {
    uint64_t result = sub_100005728(v2, "/private/var/", *(const void **)(a1 + 40), 1, 0LL);
  }

  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  return result;
}

uint64_t sub_1000137FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = 0LL;
  int v7 = &v6;
  uint64_t v8 = 0x2000000000LL;
  int v9 = -1;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 0x40000000LL;
  v5[2] = sub_100013898;
  v5[3] = &unk_100020F20;
  v5[4] = &v6;
  v5[5] = a1;
  v5[6] = a2;
  v5[7] = a3;
  dispatch_sync((dispatch_queue_t)qword_100029348, v5);
  uint64_t v3 = *((unsigned int *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void sub_100013898( void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v9 = (const __CFData *)a1[5];
  if (v9)
  {
    CFTypeRef cf = 0LL;
    *(_DWORD *)(*(void *)(a1[4] + 8LL) + 24LL) = sub_100012784(v9, a1[6], a1[7], (CFDataRef *)&cf, 1);
    if (*(_DWORD *)(*(void *)(a1[4] + 8LL) + 24LL)) {
      BOOL v10 = 1;
    }
    else {
      BOOL v10 = cf == 0LL;
    }
    if (!v10)
    {
      sub_100004E08(cf);
      CFRelease(cf);
    }
  }

  else
  {
    *(_DWORD *)(*(void *)(a1[4] + 8LL) + 24LL) = sub_1000126F4();
    sub_100004E08(0LL);
  }

uint64_t sub_100013944(const __CFData *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v18 = 0LL;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2000000000LL;
  uint64_t v21 = 0LL;
  if (CFDataGetLength(a1) == 16)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 0x40000000LL;
    block[2] = sub_100013A64;
    block[3] = &unk_100020F48;
    void block[4] = &v18;
    void block[5] = a1;
    block[6] = a2;
    block[7] = a3;
    dispatch_sync((dispatch_queue_t)qword_1000292F8, block);
    if (v19[3])
    {
      int v13 = ++dword_10002931C;
    }

    else
    {
      ++dword_100029320;
      int v13 = dword_10002931C;
    }

    if (v13 >= 64)
    {
      uint64_t v22 = v13;
      sub_10000F858(&v22, v6, v7, v8, v9, v10, v11, v12, v16);
      dword_10002931C = 0;
    }

    if (dword_100029320 >= 64)
    {
      uint64_t v22 = dword_100029320;
      sub_10000F94C(&v22, v6, v7, v8, v9, v10, v11, v12, v16);
      dword_100029320 = 0;
    }
  }

  uint64_t v14 = v19[3];
  _Block_object_dispose(&v18, 8);
  return v14;
}

CFDataRef sub_100013A64(uint64_t a1)
{
  BytePtr = CFDataGetBytePtr(*(CFDataRef *)(a1 + 40));
  uuid_copy(dst, BytePtr);
  CFDataRef result = sub_100013B14(dst, *(void *)(a1 + 48), *(CFTypeRef **)(a1 + 56));
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    CFDataRef result = (CFDataRef)sub_1000132D4();
    if ((_DWORD)result)
    {
      CFDataRef result = sub_100013B14(dst, *(void *)(a1 + 48), *(CFTypeRef **)(a1 + 56));
      *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
    }
  }

  return result;
}

CFDataRef sub_100013B14(unsigned __int8 *src, unint64_t a2, CFTypeRef *a3)
{
  v14[0] = 0LL;
  v14[1] = 0LL;
  __int128 v11 = 0u;
  memset(v12, 0, sizeof(v12));
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  memset(v8, 0, sizeof(v8));
  unint64_t v13 = bswap64(a2);
  uuid_copy((unsigned __int8 *)v14, src);
  uint64_t v4 = sub_10000CFA4("/private/var//keybags/backup/backup_keys_cache.sql3", 0, 0);
  if (!v4) {
    return 0LL;
  }
  uint64_t v5 = v4;
  else {
    CFDataRef v6 = CFDataCreate(kCFAllocatorDefault, (const UInt8 *)v8, bswap32(v9) + 36LL);
  }
  sub_10000CFAC(v5);
  return v6;
}

uint64_t sub_100013C10(CFDataRef theData, char a2)
{
  uint64_t v8 = 0LL;
  __int128 v9 = &v8;
  uint64_t v10 = 0x2000000000LL;
  int v11 = -1;
  if (theData && CFDataGetLength(theData) != 16)
  {
    uint64_t v4 = 4294966296LL;
    *((_DWORD *)v9 + 6) = -1000;
  }

  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 0x40000000LL;
    block[2] = sub_100013CDC;
    block[3] = &unk_100020F70;
    char v7 = a2;
    void block[4] = &v8;
    void block[5] = theData;
    dispatch_sync((dispatch_queue_t)qword_1000292F8, block);
    uint64_t v4 = *((unsigned int *)v9 + 6);
  }

  _Block_object_dispose(&v8, 8);
  return v4;
}

void sub_100013CDC(uint64_t a1)
{
  uint64_t v2 = *(const __CFData **)(a1 + 40);
  if (v2)
  {
    BytePtr = CFDataGetBytePtr(v2);
    uuid_copy(dst, BytePtr);
    uuid_unparse(dst, out);
  }

  uint64_t v4 = sub_10000CFA4("/private/var//keybags/backup/backup_keys_cache.sql3", 0, 0);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)(a1 + 40);
    if (*(_BYTE *)(a1 + 48))
    {
      if (v6) {
        int v7 = sub_10000D68C(v4, dst);
      }
      else {
        int v7 = sub_10000D760(v4);
      }
      *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v7;
    }

    else
    {
      if (v6) {
        int v8 = sub_10000D7EC(v4, dst);
      }
      else {
        int v8 = sub_10000D8C8(v4);
      }
      *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v8;
      sub_10000D974(v5, 259200LL);
    }

    sub_10000CFAC(v5);
    uint64_t v15 = "Start";
    if (!*(_BYTE *)(a1 + 48)) {
      uint64_t v15 = "End";
    }
    sub_100012238( "keybagd_startstopBackup_block_invoke",  @"%s backup session (volume: %s - rc: %d)",  v9,  v10,  v11,  v12,  v13,  v14,  (char)v15);
  }

  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) == -1 && *__error() == 2) {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0;
  }
}

uint64_t sub_100013E84(const __CFData *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = 0LL;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2000000000LL;
  int v14 = -1;
  if (CFDataGetLength(a1) == 16)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 0x40000000LL;
    block[2] = sub_100013F5C;
    block[3] = &unk_100020F98;
    void block[6] = a2;
    block[7] = a3;
    void block[8] = a4;
    void block[4] = &v11;
    void block[5] = a1;
    dispatch_sync((dispatch_queue_t)qword_100029348, block);
    uint64_t v8 = *((unsigned int *)v12 + 6);
  }

  else
  {
    uint64_t v8 = 4294966296LL;
    *((_DWORD *)v12 + 6) = -1000;
  }

  _Block_object_dispose(&v11, 8);
  return v8;
}

uint64_t sub_100013F5C(uint64_t a1)
{
  CFIndex v17 = 0LL;
  uint64_t v18 = 0LL;
  BytePtr = CFDataGetBytePtr(*(CFDataRef *)(a1 + 40));
  uuid_copy(dst, BytePtr);
  uuid_unparse(dst, out);
  sub_100012238( "keybagd_enablebackup_block_invoke",  @"Enabling backup for volume %s",  v3,  v4,  v5,  v6,  v7,  v8,  (char)out);
  uint64_t v15 = aks_backup_enable_volume(dst, *(void *)(a1 + 48), *(void *)(a1 + 56), &v18, &v17);
  if ((_DWORD)v15)
  {
    sub_100012238( "keybagd_enablebackup_block_invoke",  @"Could not enable backup for volume %s, err=%x",  v9,  v10,  v11,  v12,  v13,  v14,  (char)out);
  }

  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 0x40000000LL;
    block[2] = sub_10001262C;
    block[3] = &unk_100020E08;
    void block[4] = dst;
    dispatch_sync((dispatch_queue_t)qword_1000292F8, block);
    **(void **)(a1 + 64) = CFDataCreate(kCFAllocatorDefault, v18, v17);
  }

  uint64_t result = sub_10000E388(v15);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  return result;
}

uint64_t sub_1000140B0(const __CFData *a1)
{
  uint64_t v5 = 0LL;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2000000000LL;
  int v8 = -1;
  if (CFDataGetLength(a1) == 16)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 0x40000000LL;
    _DWORD v4[2] = sub_100014154;
    v4[3] = &unk_100020FC0;
    v4[4] = &v5;
    v4[5] = a1;
    dispatch_sync((dispatch_queue_t)qword_100029348, v4);
  }

  uint64_t v2 = *((unsigned int *)v6 + 6);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t sub_100014154(uint64_t a1)
{
  BytePtr = CFDataGetBytePtr(*(CFDataRef *)(a1 + 40));
  uuid_copy(dst, BytePtr);
  uuid_unparse(dst, out);
  sub_100012238( "keybagd_disablebackup_block_invoke",  @"Disabling backup for volume %s",  v3,  v4,  v5,  v6,  v7,  v8,  (char)out);
  uint64_t v15 = aks_backup_disable_volume(dst);
  if ((_DWORD)v15)
  {
    sub_100012238( "keybagd_disablebackup_block_invoke",  @"Could not disable backup for volume %s, err=%x",  v9,  v10,  v11,  v12,  v13,  v14,  (char)out);
  }

  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 0x40000000LL;
    block[2] = sub_10001262C;
    block[3] = &unk_100020E08;
    void block[4] = dst;
    dispatch_sync((dispatch_queue_t)qword_1000292F8, block);
  }

  uint64_t result = sub_10000E388(v15);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  return result;
}

uint64_t sub_10001427C(uint64_t a1, uint64_t a2, int a3, char a4, int a5)
{
  uint64_t v27 = 0LL;
  __int128 v28 = &v27;
  uint64_t v29 = 0x2000000000LL;
  int v30 = -1;
  int v26 = 1;
  unsigned int v10 = sub_100012548();
  v25[0] = 0LL;
  v25[1] = v25;
  v25[2] = 0x2800000000LL;
  v25[3] = 0LL;
  v25[4] = 0LL;
  if ((a4 & 2) != 0) {
    uint64_t v11 = -a5;
  }
  else {
    uint64_t v11 = v10;
  }
  int lock_state = aks_get_lock_state(v11, &v26);
  *((_DWORD *)v28 + 6) = lock_state;
  if (lock_state)
  {
    sub_100012238("keybagd_stashcreate", @"get_lock_state() -> 0x%x", v13, v14, v15, v16, v17, v18, lock_state);
  }

  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 0x40000000LL;
    block[2] = sub_1000143B8;
    block[3] = &unk_100020FE8;
    void block[6] = a1;
    block[7] = a2;
    int v22 = v11;
    int v23 = a3;
    int v24 = a4 & 1;
    void block[4] = &v27;
    void block[5] = v25;
    dispatch_sync((dispatch_queue_t)qword_100029348, block);
  }

  uint64_t v19 = *((unsigned int *)v28 + 6);
  _Block_object_dispose(v25, 8);
  _Block_object_dispose(&v27, 8);
  return v19;
}

void sub_1000143B8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  unsigned int v10 = "NULL";
  if (*(void *)(a1 + 48) && *(void *)(a1 + 56)) {
    unsigned int v10 = "SECRET";
  }
  sub_100012238("keybagd_stashcreate_block_invoke", @"passcode=%s", a3, a4, a5, a6, a7, a8, (char)v10);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = aks_stash_create_for_bag_and_kek( *(unsigned int *)(a1 + 64),  *(unsigned int *)(a1 + 68),  *(unsigned int *)(a1 + 72),  *(void *)(a1 + 48),  *(unsigned int *)(a1 + 56),  *(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
  uint64_t v17 = *(void *)(*(void *)(a1 + 32) + 8LL);
  if (*(_DWORD *)(v17 + 24))
  {
    sub_100012238( "keybagd_stashcreate_block_invoke",  @"aks_stash_create_for_bag_and_kek failed %x",  v11,  v12,  v13,  v14,  v15,  v16,  *(_DWORD *)(v17 + 24));
  }

  else
  {
    *(_DWORD *)(v17 + 24) = 0;
    sub_100012238( "keybagd_stashcreate_block_invoke",  @"aks_stash_create_for_bag_and_kek success",  v11,  v12,  v13,  v14,  v15,  v16,  a9);
  }

uint64_t sub_10001448C(int a1, char a2)
{
  uint64_t v7 = 0LL;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2000000000LL;
  int v10 = -1;
  if ((a2 & 2) != 0) {
    int v2 = -a1;
  }
  else {
    int v2 = sub_100012548();
  }
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 0x40000000LL;
  v5[2] = sub_10001453C;
  v5[3] = &unk_100021010;
  v5[4] = &v7;
  int v6 = v2;
  dispatch_sync((dispatch_queue_t)qword_100029348, v5);
  uint64_t v3 = *((unsigned int *)v8 + 6);
  _Block_object_dispose(&v7, 8);
  return v3;
}

void sub_10001453C(uint64_t a1)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = aks_stash_commit(*(unsigned int *)(a1 + 40));
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8LL);
  int v9 = *(_DWORD *)(v8 + 24);
  if (v9)
  {
    sub_100012238( "keybagd_stashcommit_block_invoke",  @"aks_stash_commit failed %x (handle:%d)",  v2,  v3,  v4,  v5,  v6,  v7,  v9);
  }

  else
  {
    *(_DWORD *)(v8 + 24) = 0;
    sub_100012238( "keybagd_stashcommit_block_invoke",  @"success (handle:%d)",  v2,  v3,  v4,  v5,  v6,  v7,  *(_DWORD *)(a1 + 40));
  }

uint64_t sub_1000145C0()
{
  uint64_t v3 = 0LL;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2000000000LL;
  int v6 = -1;
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000LL;
  block[2] = sub_100014654;
  block[3] = &unk_100021038;
  void block[4] = &v3;
  dispatch_sync((dispatch_queue_t)qword_100029348, block);
  uint64_t v0 = *((unsigned int *)v4 + 6);
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_100014654(uint64_t a1)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = aks_stash_destroy();
  sub_100012238( "keybagd_stashdestroy_block_invoke",  @"aks_stash_destroy %x",  v2,  v3,  v4,  v5,  v6,  v7,  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL));
}

uint64_t sub_1000146AC(int a1, char a2, _DWORD *a3)
{
  uint64_t v16 = 0LL;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2000000000LL;
  int v19 = 0;
  if ((a2 & 2) != 0) {
    int v4 = -a1;
  }
  else {
    int v4 = sub_100012548();
  }
  v14[0] = 0LL;
  v14[1] = v14;
  void v14[2] = 0x2000000000LL;
  char v15 = 0;
  uint64_t v10 = 0LL;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2000000000LL;
  int v13 = 2;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 0x40000000LL;
  _OWORD v8[2] = sub_1000147BC;
  v8[3] = &unk_100021060;
  int v9 = v4;
  void v8[4] = v14;
  v8[5] = &v16;
  v8[6] = &v10;
  dispatch_sync((dispatch_queue_t)qword_100029348, v8);
  uint64_t v5 = v17;
  uint64_t v6 = *((unsigned int *)v17 + 6);
  if (a3 && !(_DWORD)v6)
  {
    *a3 = *((_DWORD *)v11 + 6);
    uint64_t v6 = *((unsigned int *)v5 + 6);
  }

  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(v14, 8);
  _Block_object_dispose(&v16, 8);
  return v6;
}

void sub_1000147BC(uint64_t a1)
{
  int v2 = aks_stash_verify(*(unsigned int *)(a1 + 56), *(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  if (v2)
  {
    sub_100012238( "keybagd_stashverify_block_invoke",  @"aks_stash_verify failed %x (handle:%d)",  v3,  v4,  v5,  v6,  v7,  v8,  v2);
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = -1;
  }

  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 32)
                                                                                                 + 8LL)
                                                                                     + 24LL);
    sub_100012238( "keybagd_stashverify_block_invoke",  @"AKS STASH VERIFY success (handle:%d)",  v3,  v4,  v5,  v6,  v7,  v8,  *(_DWORD *)(a1 + 56));
  }

uint64_t sub_10001485C(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v7 = 0LL;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2000000000LL;
  int v10 = -1;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 0x40000000LL;
  v5[2] = sub_1000148FC;
  v5[3] = &unk_100021088;
  v5[4] = &v7;
  void v5[5] = a1;
  v5[6] = a2;
  int v6 = a3;
  dispatch_sync((dispatch_queue_t)qword_100029348, v5);
  uint64_t v3 = *((unsigned int *)v8 + 6);
  _Block_object_dispose(&v7, 8);
  return v3;
}

void sub_1000148FC(uint64_t a1)
{
  uint64_t v2 = sub_100012548();
  if (!aks_get_system(v2, &v39))
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = aks_change_secret( v39,  *(void *)(a1 + 40),  *(unsigned int *)(a1 + 48),  *(void *)(a1 + 40),  *(unsigned int *)(a1 + 48),  *(unsigned int *)(a1 + 56),  &v39);
    if (*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL)) {
      goto LABEL_15;
    }
    if (sub_100012548())
    {
      uint64_t v3 = sub_100012234();
      CFMutableDictionaryRef v4 = sub_100004CA4(v3);
    }

    else
    {
      CFMutableDictionaryRef v4 = sub_100004A44();
    }

    uint64_t v11 = v4;
    sub_100012238( "keybagd_changegeneration_block_invoke",  @"Starting transition to new system bag at handle %d",  v5,  v6,  v7,  v8,  v9,  v10,  v39);
    if (v11)
    {
      Value = CFDictionaryGetValue(v11, @"OpaqueStuff");
      if (Value)
      {
        int v19 = Value;
        CFRetain(Value);
        CFRelease(v11);
        sub_100012238( "keybagd_changegeneration_block_invoke",  @"Got opaqueStuff from ondisk keybag",  v20,  v21,  v22,  v23,  v24,  v25,  v38);
        *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = sub_100005728(v39, "/private/var/", v19, 1, 0LL);
        CFRelease(v19);
      }

      else
      {
        CFRelease(v11);
        sub_100012238( "keybagd_changegeneration_block_invoke",  @"Got opaqueStuff from ondisk keybag",  v27,  v28,  v29,  v30,  v31,  v32,  v38);
        *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = sub_100005728(v39, "/private/var/", 0LL, 1, 0LL);
      }

      if (*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) || !*(_DWORD *)(a1 + 56))
      {
LABEL_15:
        uint64_t v35 = *(void *)(*(void *)(a1 + 32) + 8LL);
        int v36 = *(_DWORD *)(v35 + 24);
        if (v36 > -536870175)
        {
          if (!v36) {
            return;
          }
          if (v36 != -536870174) {
            goto LABEL_22;
          }
        }

        else if (v36 != -536870194)
        {
          if (v36 == -536870184)
          {
            int v37 = -13;
LABEL_23:
            *(_DWORD *)(v35 + 24) = v37;
            return;
          }

LABEL_22:
          int v37 = -1000;
          goto LABEL_23;
        }

        int v37 = -3;
        goto LABEL_23;
      }

      uint64_t v33 = v39;
      uint64_t v34 = sub_100012548();
      int v26 = aks_set_system_with_passcode(v33, v34, *(void *)(a1 + 40), *(unsigned int *)(a1 + 48));
    }

    else
    {
      sub_100012238( "keybagd_changegeneration_block_invoke",  @"Failed to load system keybag",  v12,  v13,  v14,  v15,  v16,  v17,  v38);
      int v26 = -1;
    }

    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v26;
    goto LABEL_15;
  }

uint64_t sub_100014B24(uint64_t a1)
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2000000000LL;
  int v9 = 2;
  v4[0] = 0LL;
  v4[1] = v4;
  _DWORD v4[2] = 0x2000000000LL;
  int v5 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000LL;
  block[2] = sub_100014BDC;
  block[3] = &unk_1000210B0;
  void block[4] = v4;
  void block[5] = &v6;
  void block[6] = a1;
  dispatch_sync((dispatch_queue_t)qword_100029348, block);
  uint64_t v1 = *((unsigned int *)v7 + 6);
  _Block_object_dispose(v4, 8);
  _Block_object_dispose(&v6, 8);
  return v1;
}

void sub_100014BDC( void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (sub_100005E48("enable-rolld-dev1", (_DWORD *)(*(void *)(a1[4] + 8LL) + 24LL), 0LL))
  {
    sub_100012238( "keybagd_iskeyrolling_block_invoke",  @"nvram keyroll check failed",  v10,  v11,  v12,  v13,  v14,  v15,  a9);
  }

  else
  {
    *(_DWORD *)(*(void *)(a1[5] + 8LL) + 24LL) = 0;
    *(_DWORD *)(*(void *)(a1[5] + 8LL) + 24LL) = *(_DWORD *)(*(void *)(a1[4] + 8LL) + 24LL) != 0;
    sub_100012238( "keybagd_iskeyrolling_block_invoke",  @"nvram keyroll check success",  v10,  v11,  v12,  v13,  v14,  v15,  v17);
    uint64_t v16 = (_DWORD *)a1[6];
    if (v16) {
      *uint64_t v16 = *(_DWORD *)(*(void *)(a1[4] + 8LL) + 24LL);
    }
  }

uint64_t sub_100014C88(int a1)
{
  uint64_t v5 = 0LL;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2000000000LL;
  uint64_t v8 = 0LL;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 0x40000000LL;
  v3[2] = sub_100014D20;
  v3[3] = &unk_1000210D8;
  int v4 = a1;
  v3[4] = &v5;
  dispatch_sync((dispatch_queue_t)qword_100029348, v3);
  uint64_t v1 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v1;
}

uint64_t sub_100014D20(uint64_t a1)
{
  uint64_t result = sub_100012548();
  if ((_DWORD)result)
  {
    uint64_t v3 = *(unsigned int *)(a1 + 40);
    if (!(_DWORD)v3) {
      uint64_t v3 = sub_100012234();
    }
    uint64_t result = (uint64_t)sub_10000C8E8(v3);
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  }

  return result;
}

void sub_100014D60()
{
}

void sub_100014D74(id a1)
{
  __int16 v27 = 0;
  memset(v26, 0, sizeof(v26));
  uint64_t v24 = 0LL;
  uint64_t v25 = 0LL;
  unint64_t v23 = 0LL;
  if (sub_10000F304( (uint64_t)@"com.apple.mobile.keybagd.forgotten_passcode",  v1,  v2,  v3,  v4,  v5,  v6,  v7))
  {
    sub_100012238( "keybagd_forgottenPasscodeEvent_block_invoke",  @"event already persisted",  v8,  v9,  v10,  v11,  v12,  v13,  v28);
  }

  else if (!aks_get_extended_device_state(4294967293LL, v26) {
         && !aks_memento_get_state(4294967293LL, &v24))
  }
  {
    unint64_t v14 = ((unint64_t)((HIDWORD(v25) >> 5) & 1) << 32) | ((unint64_t)((HIDWORD(v25) >> 1) & 1) << 33);
    if (aks_get_seconds_since_passcode_change(4294967293LL, &v23))
    {
      uint64_t v15 = 60LL;
    }

    else
    {
      uint64_t v15 = (v23 / 0x15180);
    }

    if (sub_10000EA24(@"com.apple.mobile.keybagd.forgotten_passcode", 0, v15 | v14)) {
      sub_100012238( "keybagd_forgottenPasscodeEvent_block_invoke",  @"analytics_persist_event failed",  v16,  v17,  v18,  v19,  v20,  v21,  v22);
    }
  }

void sub_100014EC8(uint64_t a1, uint64_t a2, const void *a3, const void *a4)
{
  char v38 = 0LL;
  *(void *)bytes = 0LL;
  uint64_t v37 = 0LL;
  __int128 v36 = 0u;
  memset(v35, 0, sizeof(v35));
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int16 v45 = 0;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  uint64_t v40 = 0LL;
  CFDataRef v7 = CFDataCreateWithBytesNoCopy(0LL, bytes, 16LL, kCFAllocatorNull);
  *(void *)&__int128 v31 = 1LL;
  if (!aks_get_configuration(a1, &v38))
  {
    uint64_t v8 = (const void *)kAKSConfigGracePeriod;
    *((void *)&v31 + 1) = sub_10000DB7C(v38, kAKSConfigGracePeriod);
    uint64_t v9 = sub_10000DB44(v38, kAKSConfigUserUUID);
    uint64_t v10 = sub_10000DB44(v38, kAKSConfigGroupUUID);
    if (v9)
    {
      if (a3) {
        BYTE10(v35[0]) = CFEqual(v9, a3) != 0;
      }
      BYTE11(v35[0]) = CFEqual(v9, v7) != 0;
    }

    if (v10)
    {
      if (a4) {
        BYTE12(v35[0]) = CFEqual(v10, a4) != 0;
      }
      BYTE13(v35[0]) = CFEqual(v10, v7) != 0;
    }

    *((void *)&v31 + 1) = sub_10000DB7C(v38, v8);
    *((void *)&v32 + 1) = sub_10000DB7C(v38, kAKSConfigMaxUnlockAttempts);
    *(void *)&__int128 v33 = sub_10000DB7C(v38, kAKSConfigRecoveryIterations);
    *((void *)&v33 + 1) = sub_10000DB7C(v38, kAKSConfigRecoveryTargetIterations);
    char v11 = sub_10000DB7C(v38, kAKSConfigRecoveryFlags);
    LOBYTE(v34) = (v11 & 8) != 0;
    BYTE1(v34) = v11 & 1;
    BYTE2(v34) = (v11 & 4) != 0;
    BYTE3(v34) = (v11 & 2) != 0;
    BYTE4(v34) = (v11 & 0x10) != 0;
    BYTE5(v34) = sub_10000DBE4(v38, kAKSConfigMementoSupported) != 0;
    BYTE6(v34) = sub_10000DBE4(v38, kAKSConfigMementoBlobExists) != 0;
    *((void *)&v34 + 1) = sub_10000DB7C(v38, kAKSConfigMementoPasscodeGeneration);
    *(void *)&v35[0] = sub_10000DB7C(v38, kAKSConfigPasscodeGeneration);
    BYTE8(v35[0]) = sub_10000DBE4(v38, kAKSConfigInactivityRebootEnabled) != 0;
    BYTE9(v35[0]) = sub_10000DBE4(v38, kAKSConfigOnenessAutomaticMode) != 0;
    if (aks_get_extended_device_state(a1, &v41))
    {
      LOBYTE(vmemset(out, 0, 37) = 1;
    }

    else
    {
      v12.i64[0] = *(void *)&vshl_u16( (uint16x4_t)(*(void *)&vdup_n_s16(v41) & 0xFF00FF00FF00FFLL),  (uint16x4_t)0xFFFBFFFCFFFDFFFELL) & 0xFF01FF01FF01FF01LL;
      *(_DWORD *)((char *)v35 + 15) = vmovn_s16(v12).u32[0];
      BYTE3(v35[1]) = (v41 & 0x40) != 0;
      BYTE4(v35[1]) = (v41 & 0x80) != 0;
      uint32x4_t v13 = (uint32x4_t)vdupq_n_s32(v41);
      BYTE9(v35[2]) = (v41 & 0x10000000) != 0;
      BYTE10(v35[2]) = (v41 & 0x20000000) != 0;
      BYTE11(v35[2]) = (v41 & 0x40000000) != 0;
      BYTE12(v35[2]) = BYTE2(v43) & 1;
      v14.i64[0] = 0x101010101010101LL;
      v14.i64[1] = 0x101010101010101LL;
      *(int8x16_t *)((char *)&v35[1] + 5) = vandq_s8( vuzp1q_s8( (int8x16_t)vuzp1q_s16( (int16x8_t)vshlq_u32(v13, (uint32x4_t)xmmword_10001DC90),  (int16x8_t)vshlq_u32(v13, (uint32x4_t)xmmword_10001DC80)),  (int8x16_t)vuzp1q_s16( (int16x8_t)vshlq_u32(v13, (uint32x4_t)xmmword_10001DCB0),  (int16x8_t)vshlq_u32(v13, (uint32x4_t)xmmword_10001DCA0))),  v14);
      int16x8_t v15 = (int16x8_t)vshlq_u32(v13, (uint32x4_t)xmmword_10001DCC0);
      v15.i64[0] = *(void *)&vmovn_s32((int32x4_t)v15) & 0xFF01FF01FF01FF01LL;
      *(_DWORD *)((char *)&v35[2] + 5) = vmovn_s16(v15).u32[0];
      v15.i64[0] = *(void *)&vshl_u16( (uint16x4_t)(*(void *)&vdup_n_s16(BYTE2(v43)) & 0xFF00FF00FF00FFLL),  (uint16x4_t)0xFFFCFFFDFFFEFFFFLL) & 0xFF01FF01FF01FF01LL;
      *(_DWORD *)((char *)&v35[2] + 13) = vmovn_s16(v15).u32[0];
      *(void *)&__int128 v32 = v42;
    }

    unint64_t v29 = 0LL;
    unint64_t v30 = 0LL;
    if (AKSIdentityGetSessionTimeWindows(&v30, &v29, 0LL))
    {
      if (v30 != -1LL) {
        DWORD1(v35[3]) = v30 / 0xE10;
      }
      if (v29 != -1LL) {
        DWORD2(v35[3]) = v29 / 0xE10;
      }
    }

    else
    {
      BYTE1(vmemset(out, 0, 37) = 1;
    }

    unint64_t v28 = 0LL;
    if (aks_get_seconds_since_passcode_change(a1, &v28))
    {
      BYTE2(vmemset(out, 0, 37) = 1;
    }

    else
    {
      unint64_t v16 = v28 / 0x15180;
      HIDWORD(v35[3]) = v16;
    }

    uint64_t v26 = 0LL;
    uint64_t v27 = 0LL;
    if (aks_memento_get_state(a1, &v26))
    {
      BYTE3(vmemset(out, 0, 37) = 1;
    }

    else
    {
      v24.i64[0] = *(void *)&vshl_u16( (uint16x4_t)(*(void *)&vdup_n_s16(BYTE4(v27)) & 0xFF00FF00FF00FFLL),  (uint16x4_t)0xFFFCFFFDFFFEFFFFLL) & 0xFF01FF01FF01FF01LL;
      LODWORD(v36) = vmovn_s16(v24).u32[0];
      BYTE4(v36) = (v27 & 0x2000000000LL) != 0;
      DWORD2(v36) = HIDWORD(v26);
      HIDWORD(v36) = v26;
    }

    sub_10000FF58((uint64_t)&v31, v17, v18, v19, v20, v21, v22, v23, v25);
  }

  if (v7) {
    CFRelease(v7);
  }
  if (v38) {
    CFRelease(v38);
  }
}

BOOL sub_1000153F0(int a1, int a2, _DWORD *a3)
{
  LODWORD(v6) = sub_100012548();
  if (a1 == -1) {
    uint64_t v6 = v6;
  }
  else {
    uint64_t v6 = -a1;
  }
  if (a2) {
    int extended_device_state = aks_get_extended_device_state(v6, v16);
  }
  else {
    int extended_device_state = aks_get_device_state(v6, v16);
  }
  int v14 = extended_device_state;
  if (extended_device_state)
  {
    sub_100012238( "keybagd_getDeviceLockState",  @"aks_get_device_state/aks_get_extended_device_state failed with %d",  v8,  v9,  v10,  v11,  v12,  v13,  extended_device_state);
  }

  else if (a3)
  {
    *a3 = v17;
  }

  return v14 == 0;
}

void sub_1000154A8(char a1)
{
  if ((a1 & 1) != 0) {
    sub_10000F3F8();
  }
  if ((a1 & 4) != 0) {
    sub_1000131B4(0, 0);
  }
}

void sub_1000154E4(id a1, _xpc_activity_s *a2)
{
  xpc_activity_state_t state = xpc_activity_get_state(a2);
  if (state == 2)
  {
    sub_100012238("data_analytics_init_block_invoke", @"data analytics activity", v4, v5, v6, v7, v8, v9, v37);
    uint64_t v18 = sub_100012548();
    int lock_state = aks_get_lock_state(v18, &v39);
    if (lock_state)
    {
      sub_100012238( "data_analytics_init_block_invoke",  @"get_lock_state() -> 0x%x",  v20,  v21,  v22,  v23,  v24,  v25,  lock_state);
    }

    else
    {
      __int128 v43 = xmmword_10001DCD0;
      __int128 v44 = &_mh_execute_header;
      char v42 = 0;
      LOBYTE(v43) = (v39 & 2) == 0;
      if ((v39 & 2) == 0) {
        DWORD1(v43) = sub_10000E564();
      }
      int v27 = sub_10000E710(&v42);
      if (v42) {
        int v28 = 1;
      }
      else {
        int v28 = 2;
      }
      if (v27) {
        int v28 = 0;
      }
      DWORD2(v43) = v28;
      int v41 = 0;
      if (!sub_100005E48("aks-inactivity", &v41, 0LL) && v41 == 1)
      {
        sub_10000611C("aks-inactivity");
        BYTE12(v43) = 1;
      }

      unint64_t v40 = 0LL;
      sub_10000F4E0((char *)&v43, v29, v30, v31, v32, v33, v34, v35, v38);
      sub_100014EC8(v18, v36, 0LL, 0LL);
    }
  }

  else if (!state)
  {
    sub_100012238( "data_analytics_init_block_invoke",  @"Checking in for data analytics",  v4,  v5,  v6,  v7,  v8,  v9,  v37);
    xpc_object_t v10 = xpc_activity_copy_criteria(a2);
    if (v10)
    {
      xpc_release(v10);
      int v17 = @"activity criteria already set";
    }

    else
    {
      xpc_object_t v26 = xpc_dictionary_create(0LL, 0LL, 0LL);
      xpc_dictionary_set_int64(v26, XPC_ACTIVITY_INTERVAL, 86400LL);
      xpc_dictionary_set_string(v26, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
      xpc_dictionary_set_BOOL(v26, XPC_ACTIVITY_ALLOW_BATTERY, 1);
      xpc_activity_set_criteria(a2, v26);
      xpc_release(v26);
      int v17 = @"set activity criteria";
    }

    sub_100012238("data_analytics_init_block_invoke", v17, v11, v12, v13, v14, v15, v16, v45);
  }

void sub_100015720(id a1)
{
  int v1 = 0;
}

void sub_100015758(id a1, _xpc_activity_s *a2)
{
  if (!xpc_activity_get_state(a2))
  {
    sub_100012238("space_repetition_kick_block_invoke", @"space_repetition Check in", v3, v4, v5, v6, v7, v8, v18);
    xpc_object_t v9 = xpc_activity_copy_criteria(a2);
    if (v9)
    {
      xpc_release(v9);
      uint64_t v16 = @"space_repetition activity criteria already set";
    }

    else
    {
      xpc_object_t v17 = xpc_dictionary_create(0LL, 0LL, 0LL);
      xpc_dictionary_set_int64(v17, XPC_ACTIVITY_INTERVAL, 3600LL);
      xpc_dictionary_set_string(v17, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
      xpc_dictionary_set_BOOL(v17, XPC_ACTIVITY_ALLOW_BATTERY, 1);
      xpc_activity_set_criteria(a2, v17);
      xpc_release(v17);
      uint64_t v16 = @"space_repetition set activity criteria";
    }

    sub_100012238("space_repetition_kick_block_invoke", v16, v10, v11, v12, v13, v14, v15, v19);
  }

void sub_10001583C(id a1)
{
  if (bootstrap_check_in(bootstrap_port, "com.apple.mobile.keybagd.mach", (mach_port_t *)&dword_100029330))
  {
    sub_100012238("serverPort_block_invoke", @"failed to create notification port", v1, v2, v3, v4, v5, v6, v9);
  }

  else
  {
    uintptr_t v7 = dword_100029330;
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    qword_100029338 = (uint64_t)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_mach_recv,  v7,  0LL,  global_queue);
    dispatch_source_set_event_handler((dispatch_source_t)qword_100029338, &stru_100021258);
    dispatch_resume((dispatch_object_t)qword_100029338);
  }

void sub_1000158D8(id a1)
{
  mach_msg_return_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE msg[32];
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  int v13;
  uint64_t v13 = 0;
  uint64_t v11 = 0u;
  uint64_t v12 = 0u;
  char v9 = 0u;
  uint64_t v10 = 0u;
  memset(msg, 0, sizeof(msg));
  uint64_t v1 = mach_msg((mach_msg_header_t *)msg, 2, 0, 0x64u, dword_100029330, 0, 0);
  if (v1)
  {
LABEL_2:
    sub_100012238("serverPort_block_invoke_2", @"mach_msg error: %x", v2, v3, v4, v5, v6, v7, v1);
    return;
  }

  if (*(_DWORD *)&msg[20] == 44)
  {
    sub_100012238( "serverPort_block_invoke_2",  @"aks notification for recovery completion %d",  v2,  v3,  v4,  v5,  v6,  v7,  msg[28]);
    sub_1000131A0(*(int *)&msg[28]);
    return;
  }

  if (*(_DWORD *)&msg[20] != 43)
  {
    if (*(_DWORD *)&msg[20] == 42)
    {
      sub_10001329C();
      return;
    }

    goto LABEL_2;
  }

  if (!*(_DWORD *)&msg[24]) {
    sub_1000130C8(0, *(_DWORD *)&msg[28] == 0);
  }
}

uint64_t sub_1000159DC()
{
  if (qword_100029328 != -1) {
    dispatch_once(&qword_100029328, &stru_100021218);
  }
  uint64_t result = aks_register_for_notifications(dword_100029330, 42LL);
  if (!(_DWORD)result)
  {
    if (qword_100029328 != -1) {
      dispatch_once(&qword_100029328, &stru_100021218);
    }
    return aks_register_for_notifications(dword_100029330, 43LL);
  }

  return result;
}

void sub_100015A68()
{
}

void sub_100015ACC(void *a1)
{
}

void sub_100015B30()
{
}

void sub_100015B94(void *a1)
{
  id v1 = -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInFunction:file:lineNumber:description:",  +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "void *MobileActivationLibrary(void)"),  @"misc.m",  17LL,  @"%s",  *a1);
  __break(1u);
  ADClientAddValueForScalarKey(v1, v2);
}

id objc_msgSend_writeToFile_atomically_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToFile:atomically:");
}