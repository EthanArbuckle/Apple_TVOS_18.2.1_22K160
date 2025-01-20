}

id sub_1EE0(void *a1, const char *a2)
{
  return [a1 _servicePublishedNotification:a2];
}

void *sub_2018(void *a1, const char *a2, int a3)
{
  if (a3 == -535736305) {
    return [a1 _updatePhysicalAddressFromIOAVService:a2];
  }
  return a1;
}

LABEL_12:
  objc_msgSend(-[AppleTVMCUCECInterface delegate](self, "delegate"), "interfacePropertiesChanged:", self);
LABEL_15:
  *p_pendingPhysicalAddress = -1;
  self->_pendingHasLink = 0;
}

id sub_2E3C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setHasLink:*(unsigned __int8 *)(a1 + 40)];
}

id sub_34B4(uint64_t a1)
{
  return [*(id *)(a1 + 32) hibernationChanged:1];
}

id sub_34C0(uint64_t a1)
{
  return [*(id *)(a1 + 32) mcuExitedStandby:*(unsigned __int16 *)(a1 + 40)];
}

uint64_t sub_3834(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  if (a4)
  {
    [*(id *)(a1 + 56) lock];
    int v8 = *(_DWORD *)(a1 + 20);
    if (v8 < 0)
    {
      uint64_t v13 = 4294960578LL;
LABEL_18:
      objc_msgSend(*(id *)(a1 + 56), "unlock", v15, v16, v17, v18);
      return v13;
    }

    uint64_t v15 = a1;
    uint64_t v16 = a2;
    uint64_t v17 = a3;
    uint64_t v9 = *(void *)(a1 + 24);
  }

  else
  {
    int v8 = *(_DWORD *)(a1 + 20);
    if (v8 < 0) {
      return 4294960578LL;
    }
    uint64_t v9 = 0LL;
    uint64_t v15 = a1;
    uint64_t v16 = a2;
    uint64_t v17 = a3;
  }

  uint64_t v18 = v9;
  v10 = &v15;
  size_t v11 = 32LL;
  do
  {
    while (1)
    {
      ssize_t v12 = write(v8, v10, v11);
      if (v12 >= 1) {
        break;
      }
      if (!*__error())
      {
        uint64_t v13 = 4294960596LL;
        goto LABEL_17;
      }

      uint64_t v13 = *__error();
      if ((_DWORD)v13 != 4) {
        goto LABEL_13;
      }
    }

    v10 = (uint64_t *)((char *)v10 + v12);
    v11 -= v12;
  }

  while (v11);
  uint64_t v13 = 0LL;
LABEL_13:
  if (a4 && !(_DWORD)v13)
  {
    dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 24), 0xFFFFFFFFFFFFFFFFLL);
    goto LABEL_18;
  }

LABEL_17:
  if (a4) {
    goto LABEL_18;
  }
  return v13;
}

uint64_t sub_393C(uint64_t a1)
{
  uint64_t v2 = *(void *)a1;
  CFTypeID v3 = CFGetTypeID(*(CFTypeRef *)(a1 + 16));
  if (v3 != CFStringGetTypeID())
  {
    uint64_t result = 4294960540LL;
    goto LABEL_8;
  }

  if (CFEqual(*(CFTypeRef *)(a1 + 16), @"com.apple.AppleTVHID.isPaired"))
  {
    if (*(_BYTE *)(v2 + 97)) {
      v4 = &kCFBooleanTrue;
    }
    else {
      v4 = &kCFBooleanFalse;
    }
    CFBooleanRef v5 = *v4;
    *(CFBooleanRef *)(a1 + 24) = *v4;
    CFRetain(v5);
    goto LABEL_7;
  }

  if (CFEqual(*(CFTypeRef *)(a1 + 16), @"com.apple.AppleTVHID.MCUVersion"))
  {
    if (!*(void *)(v2 + 80))
    {
      uint64_t result = 4294960578LL;
      goto LABEL_8;
    }

    if ([(id)v2 mcuSystemState] != 1)
    {
      uint64_t result = sub_7460(*(void *)(v2 + 80), cStr, 0x20uLL, 0LL);
      if ((_DWORD)result) {
        goto LABEL_8;
      }
      CFStringRef v7 = CFStringCreateWithCString(0LL, cStr, 0x8000100u);
      *(void *)(a1 + 24) = v7;
      if (!v7)
      {
        uint64_t result = 4294960554LL;
        goto LABEL_8;
      }

      goto LABEL_7;
    }
  }

  else
  {
    if (CFEqual(*(CFTypeRef *)(a1 + 16), @"com.apple.AppleTVHID.logging"))
    {
      uint64_t result = LogShow(cStr);
      if ((_DWORD)result) {
        goto LABEL_8;
      }
      CFStringRef v8 = CFStringCreateWithCString(0LL, *(const char **)cStr, 0x8000100u);
      free(*(void **)cStr);
      if (!v8)
      {
        uint64_t result = 4294960568LL;
        goto LABEL_8;
      }

      *(void *)(a1 + 24) = v8;
      goto LABEL_7;
    }

    if (CFEqual(*(CFTypeRef *)(a1 + 16), @"com.apple.AppleTVHID.isRunning"))
    {
      else {
        uint64_t v9 = &kCFBooleanFalse;
      }
      *(CFBooleanRef *)(a1 + 24) = *v9;
      goto LABEL_7;
    }

    if (!CFEqual(*(CFTypeRef *)(a1 + 16), @"com.apple.AppleTVHID.show"))
    {
LABEL_7:
      uint64_t result = 0LL;
      goto LABEL_8;
    }

    if ([(id)v2 mcuSystemState] != 1)
    {
      uint64_t result = sub_64E8(*(void *)a1, (CFStringRef *)(a1 + 24));
      if ((_DWORD)result) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }
  }

  if (dword_10CF8 <= 90 && (dword_10CF8 != -1 || _LogCategory_Initialize(&dword_10CF8, 90LL))) {
    LogPrintF( &dword_10CF8,  "void _IRServer_CopyProperty(void *)",  90LL,  "MCUClient_GetMCUVersion while MCU is in Standby.\n");
  }
  uint64_t result = 4294960587LL;
LABEL_8:
  *(_DWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_3D44(_BYTE *a1)
{
  uint64_t Int64 = CFPrefs_GetInt64(@"com.apple.AppleTVIR", @"irEnabled", &v10);
  if (v10) {
    BOOL v3 = 0;
  }
  else {
    BOOL v3 = Int64 == 0;
  }
  char v4 = !v3;
  a1[95] = v4;
  uint64_t v5 = CFPrefs_GetInt64(@"com.apple.AppleTVIR", @"cecEnabled", &v10);
  if (v10) {
    BOOL v6 = 0;
  }
  else {
    BOOL v6 = v5 == 0;
  }
  char v7 = !v6;
  a1[99] = v7;
  uint64_t result = CFPrefs_GetInt64(@"com.apple.AppleTVIR", @"softwareRetries", &v10);
  int v9 = result != 0;
  a1[94] = v9;
  if (dword_10CF8 <= 40)
  {
    if (dword_10CF8 != -1) {
      return LogPrintF( &dword_10CF8,  "void _IRPlugin_UpdatePrefs(AppleTVMCUPlugin *)",  40LL,  "MCU FW transmit retries: %d\n",  v9);
    }
    uint64_t result = _LogCategory_Initialize(&dword_10CF8, 40LL);
    if ((_DWORD)result)
    {
      int v9 = a1[94];
      return LogPrintF( &dword_10CF8,  "void _IRPlugin_UpdatePrefs(AppleTVMCUPlugin *)",  40LL,  "MCU FW transmit retries: %d\n",  v9);
    }
  }

  return result;
}

CFStringRef *sub_3E48(uint64_t a1)
{
  __int128 v2 = *(_OWORD *)(a1 + 32);
  if ((*(_DWORD *)(v2 + 20) & 0x80000000) != 0) {
    return sub_3E94((CFStringRef *)&v2);
  }
  else {
    return (CFStringRef *)sub_3834(v2, (uint64_t)sub_3E94, (uint64_t)&v2, 1);
  }
}

CFStringRef *sub_3E94(CFStringRef *result)
{
  uint64_t v1 = (uint64_t)*result;
  if ((*result)[2].data)
  {
    uint64_t result = (CFStringRef *)CFStringGetCString(result[1], buffer, 128LL, 0x8000100u);
    if ((_DWORD)result)
    {
      uint64_t result = (CFStringRef *)sub_7718(buffer, &v2);
      if (!(_DWORD)result)
      {
        uint64_t result = (CFStringRef *)sub_76E4(*(void *)(v1 + 80), v2);
        if (!(_DWORD)result) {
          *(_BYTE *)(v1 + 88) = v2;
        }
      }
    }
  }

  return result;
}

void sub_3F30(uint64_t a1)
{
  char v2 = *(void **)a1;
  char v4 = *(const void **)(a1 + 16);
  BOOL v3 = *(__CFString **)(a1 + 24);
  if ([*(id *)a1 mcuSystemState] == 1)
  {
    if (dword_10CF8 <= 100 && (dword_10CF8 != -1 || _LogCategory_Initialize(&dword_10CF8, 100LL))) {
      LogPrintF( &dword_10CF8,  "void _IRServer_SetProperty(void *)",  100LL,  "_IRServer_SetProperty while MCU is in Standby: key %@\n",  v4);
    }
    int v11 = -6709;
    goto LABEL_83;
  }

  CFTypeID v5 = CFGetTypeID(v4);
  if (v5 != CFStringGetTypeID())
  {
LABEL_71:
    int v11 = -6756;
    goto LABEL_83;
  }

  if (!CFEqual(v4, @"com.apple.AppleTVHID.logging"))
  {
    if (CFEqual(v4, @"com.apple.AppleTVHID.sendRawMCUCommand"))
    {
      CFTypeID v12 = CFGetTypeID(v3);
      if (v12 != CFDataGetTypeID()) {
        goto LABEL_71;
      }
      if (v2[10])
      {
        BytePtr = CFDataGetBytePtr((CFDataRef)v3);
        CFIndex Length = CFDataGetLength((CFDataRef)v3);
        if (Length)
        {
          CFIndex v15 = Length;
          if (dword_10CF8 <= 40 && (dword_10CF8 != -1 || _LogCategory_Initialize(&dword_10CF8, 40LL))) {
            LogPrintF( &dword_10CF8,  "OSStatus _IRServer_SendRawMCUCommand(AppleTVMCUPlugin *, CFDataRef)",  40LL,  "Sending raw MCU command opcode 0x%02x, payload %H\n",  *BytePtr,  BytePtr + 1,  (v15 - 1),  (v15 - 1));
          }
          int v33 = sub_763C(v2[10], *BytePtr, (char *)BytePtr + 1, v15 - 1);
LABEL_33:
          int v11 = v33;
          if (!v33) {
            goto LABEL_82;
          }
          goto LABEL_83;
        }

LABEL_85:
        int v11 = -6743;
        goto LABEL_83;
      }

LABEL_84:
      int v11 = -6718;
      goto LABEL_83;
    }

    if (CFEqual(v4, @"com.apple.AppleTVHID.pairControl"))
    {
      CFTypeID v16 = CFGetTypeID(v3);
      if (v16 != CFDictionaryGetTypeID()) {
        goto LABEL_71;
      }
      id v17 = -[__CFString objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", @"action");
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSString);
        if ((objc_opt_isKindOfClass(v18, v19) & 1) == 0) {
          goto LABEL_71;
        }
        unsigned int v20 = [v18 isEqualToString:@"pair"];
        char v21 = v20;
        if (v20)
        {
          id v22 = -[__CFString objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", @"deviceUID");
          if (!v22) {
            goto LABEL_71;
          }
          v23 = v22;
          uint64_t v24 = objc_opt_class(&OBJC_CLASS___NSNumber);
          if ((objc_opt_isKindOfClass(v23, v24) & 1) == 0) {
            goto LABEL_71;
          }
          unsigned int v25 = [v23 intValue];
          if (v25 > 0xFF)
          {
            int v11 = -6710;
            goto LABEL_83;
          }

          *((_BYTE *)v2 + 97) = 1;
LABEL_37:
          *((_BYTE *)v2 + 98) = v25;
          *((_BYTE *)v2 + 96) = 1;
          if (v2[10])
          {
            int v33 = sub_74E4(v2[10], v21, v25);
            goto LABEL_33;
          }

          goto LABEL_82;
        }

        if (CFEqual(v18, @"unpair"))
        {
          LOBYTE(v25) = 0;
          *((_BYTE *)v2 + 97) = 0;
          goto LABEL_37;
        }
      }

LABEL_44:
      int v11 = -6705;
      goto LABEL_83;
    }

    if (CFEqual(v4, @"com.apple.AppleTVHID.cecSetAddressMask"))
    {
      if (!v3) {
        goto LABEL_44;
      }
      if (!v2[10]) {
        goto LABEL_84;
      }
      unsigned __int16 v26 = CFGetInt64Ranged(v3, 0LL, 0xFFFFLL, 0LL);
      int v11 = sub_6F14(v2[10], 1, v27, v28, v29, v30, v31, v32, v26, v51);
      if (v11) {
        goto LABEL_83;
      }
      *((_WORD *)v2 + 45) = v26;
    }

    else if (CFEqual(v4, @"com.apple.AppleTVHID.cecSetSnoopinguousMode"))
    {
      if (!v3) {
        goto LABEL_44;
      }
      if (!v2[10]) {
        goto LABEL_84;
      }
      uint64_t v34 = CFGetInt64(v3, 0LL);
      int v11 = sub_6F14(v2[10], 2, v35, v36, v37, v38, v39, v40, v34 != 0, v51);
      if (v11) {
        goto LABEL_83;
      }
      *((_BYTE *)v2 + 92) = v34 != 0;
    }

    else if (CFEqual(v4, @"com.apple.AppleTVHID.CEC.TransmitFrame"))
    {
      BOOL v53 = 0;
      if (!v3) {
        goto LABEL_71;
      }
      CFTypeID v41 = CFGetTypeID(v3);
      if (v41 != CFDataGetTypeID()) {
        goto LABEL_71;
      }
      if (!v2[10]) {
        goto LABEL_84;
      }
      v42 = CFDataGetBytePtr((CFDataRef)v3);
      unint64_t v43 = CFDataGetLength((CFDataRef)v3);
      if (v43 < 2) {
        goto LABEL_85;
      }
      unsigned __int8 v46 = *v42;
      v44 = (char *)(v42 + 1);
      unsigned __int8 v45 = v46;
      unsigned __int8 v52 = v46;
      uint64_t v47 = v43 - 1;
      if (*((_BYTE *)v2 + 94))
      {
        while (1)
        {
          if (dword_10CF8 <= 40 && (dword_10CF8 != -1 || _LogCategory_Initialize(&dword_10CF8, 40LL))) {
            LogPrintF( &dword_10CF8,  "void _IRServer_SetProperty(void *)",  40LL,  "Trying MCU message send, tries left: %d\n",  v45);
          }
          int v11 = sub_71F0(v2[10], v44, v47, &v53);
          if (dword_10E48 <= 40 && (dword_10E48 != -1 || _LogCategory_Initialize(&dword_10E48, 40LL)))
          {
            v48 = "ACK";
            if (!v53) {
              v48 = "NAK";
            }
            LogPrintF( &dword_10E48,  "void _IRServer_SetProperty(void *)",  40LL,  "CEC Tx: %{cec} %s; software retries remaining=%u\n",
              v44,
              v47,
              v48,
              v45);
          }

          if (v11) {
            goto LABEL_83;
          }
          if (v53) {
            goto LABEL_82;
          }
          if (v45-- == 0) {
            goto LABEL_65;
          }
        }
      }

      int v11 = sub_72D0(v2[10], v44, v47, &v53, (char *)&v52);
      if (dword_10E48 <= 40 && (dword_10E48 != -1 || _LogCategory_Initialize(&dword_10E48, 40LL)))
      {
        v50 = "ACK";
        if (!v53) {
          v50 = "NAK";
        }
        LogPrintF( &dword_10E48,  "void _IRServer_SetProperty(void *)",  40LL,  "CEC Tx: %{cec} %s; automatic retries used=%u\n",
          v44,
          v47,
          v50,
          v52);
      }

      if (v11) {
        goto LABEL_83;
      }
      if (!v53)
      {
LABEL_65:
        int v11 = -6758;
        goto LABEL_83;
      }
    }

LABEL_82:
    int v11 = 0;
    goto LABEL_83;
  }

  CFTypeID v6 = CFGetTypeID(v3);
  if (v6 != CFStringGetTypeID()) {
    goto LABEL_71;
  }
  CFIndex v7 = CFStringGetLength(v3);
  CFIndex MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(v7, 0x8000100u);
  CFIndex usedBufLen = MaximumSizeForEncoding;
  int v9 = (UInt8 *)malloc(MaximumSizeForEncoding + 1);
  if (!v9)
  {
    int v11 = -6728;
    goto LABEL_83;
  }

  int v10 = v9;
  v55.location = 0LL;
  v55.length = v7;
  if (CFStringGetBytes(v3, v55, 0x8000100u, 0, 0, v9, MaximumSizeForEncoding, &usedBufLen) != v7)
  {
    free(v10);
    int v11 = -6700;
    goto LABEL_83;
  }

  if (usedBufLen <= 0)
  {
    free(v10);
    goto LABEL_82;
  }

  v10[usedBufLen] = 0;
  int v11 = LogControl(v10);
  free(v10);
  if (!v11) {
    goto LABEL_82;
  }
LABEL_83:
  *(_DWORD *)(a1 + 8) = v11;
}

LABEL_30:
  -[AppleTVMCUPlugin _ensureStopped](self, "_ensureStopped");
  return v4;
}

void sub_484C(uint64_t a1, uint64_t a2, unsigned int *a3, unint64_t a4, void *a5)
{
  uint64_t v6 = a4;
  if ((int)a2 > 17)
  {
    unsigned int v9 = a2 - 33;
    switch((int)a2)
    {
      case '!':
      case '""':
      case '#':
      case '$':
      case ')':
        if (dword_10EB8 <= 40 && (dword_10EB8 != -1 || _LogCategory_Initialize(&dword_10EB8, 40LL)))
        {
          if (v9 > 8) {
            int v10 = "???";
          }
          else {
            int v10 = (&off_C4D8)[(char)v9];
          }
          LogPrintF( &dword_10EB8,  "void _IRServer_ProcessMCUEvent(MCUClientRef, uint8_t, uint8_t *, size_t, void *)",  40LL,  "%s: %H\n",  v10,  a3,  v6,  v6);
        }

        if (dword_10E48 <= 40 && (dword_10E48 != -1 || _LogCategory_Initialize(&dword_10E48, 40LL)))
        {
          if (v9 > 8) {
            uint64_t v24 = "???";
          }
          else {
            uint64_t v24 = (&off_C4D8)[(char)v9];
          }
          LogPrintF( &dword_10E48,  "void _IRServer_ProcessMCUEvent(MCUClientRef, uint8_t, uint8_t *, size_t, void *)",  40LL,  "%s: %{cec}\n",  v24,  &v48,  v45);
        }

        if ((_DWORD)a2 == 41 || v9 > 2) {
          return;
        }
        unsigned int v25 = (void *)a5[15];
        if ([v25 serialQueue])
        {
          LOBYTE(v49) = v45 & 0x1F;
          __int128 v46 = v48;
          int v47 = v49;
          [v25 _receivedFrame:&v46 snooping:(_DWORD)a2 == 35];
          return;
        }

        id v17 = &dword_10CF8;
        uint64_t v18 = "void _IRServer_ProcessMCUEvent(MCUClientRef, uint8_t, uint8_t *, size_t, void *)";
        uint64_t v19 = "CEC frame dropped because CEC interface is not ready.\n";
        goto LABEL_144;
      case '%':
      case '&':
      case '\'':
      case '(':
      case '*':
      case ',':
      case '-':
      case '.':
      case '/':
      case '0':
        goto LABEL_41;
      case '+':
        return;
      case '1':
        if (a4) {
          [a5 _hpdStateChanged:*(unsigned __int8 *)a3 >> 7 transitions:*(_BYTE *)a3 & 0x7F];
        }
        return;
      default:
        if ((_DWORD)a2 == 18)
        {
          unint64_t v22 = a4 - 2;
          if (a4 < 2) {
            return;
          }
          int v23 = *(unsigned __int16 *)a3;
          if (v22 > 1)
          {
            uint64_t v42 = *(void *)(a1 + 1040);
            if (dword_10DD8 <= 40)
            {
              if (dword_10DD8 != -1 || _LogCategory_Initialize(&dword_10DD8, 524328LL)) {
                LogPrintF( &dword_10DD8,  "OSStatus _IRServer_Process3rdPartyIRData(AppleTVMCUPlugin *, uint64_t, const uint8_t *, size_t)",  524328LL,  "\n");
              }
              if (dword_10DD8 <= 40 && (dword_10DD8 != -1 || _LogCategory_Initialize(&dword_10DD8, 40LL))) {
                LogPrintF( &dword_10DD8,  "OSStatus _IRServer_Process3rdPartyIRData(AppleTVMCUPlugin *, uint64_t, const uint8_t *, size_t)",  40LL,  "3rd Party IR +%'u MCU mics, %zu timing(s)\n",  v23,  v22 >> 1);
              }
            }

            if (v22 <= 0x201)
            {
              unint64_t v29 = 0LL;
              if (v22 >> 1 <= 1) {
                uint64_t v30 = 1LL;
              }
              else {
                uint64_t v30 = v22 >> 1;
              }
              uint64_t v31 = (char *)a3 + 3;
              do
              {
                int v32 = *(unsigned __int16 *)(v31 - 1);
                *((_DWORD *)&v48 + v29) = v32;
                if (dword_10DD8 <= 40
                  && (dword_10DD8 != -1 || _LogCategory_Initialize(&dword_10DD8, 524328LL)))
                {
                  if (v29)
                  {
                    int v33 = (const char *)&unk_A65F;
                    if (10 * (v29 / 0xA) == v29) {
                      int v33 = "\n    ";
                    }
                  }

                  else
                  {
                    int v33 = "    ";
                  }

                  uint64_t v34 = "      ";
                  if ((v29 & 1) == 0) {
                    uint64_t v34 = " ";
                  }
                  LogPrintF( &dword_10DD8,  "OSStatus _IRServer_Process3rdPartyIRData(AppleTVMCUPlugin *, uint64_t, const uint8_t *, size_t)",  524328LL,  "%s%4u%s",  v33,  v32,  v34);
                }

                v31 += 2;
                ++v29;
              }

              while (v30 != v29);
              if (dword_10DD8 <= 40
                && (dword_10DD8 != -1 || _LogCategory_Initialize(&dword_10DD8, 524328LL)))
              {
                LogPrintF( &dword_10DD8,  "OSStatus _IRServer_Process3rdPartyIRData(AppleTVMCUPlugin *, uint64_t, const uint8_t *, size_t)",  524328LL,  "\n");
              }

              uint64_t v35 = (void *)a5[16];
              if ([v35 serialQueue])
              {
                id v36 = [[IRFrame alloc] initWithTimings:&v48 count:v22 >> 1 timestamp:v42];
                if (v36)
                {
                  uint64_t v37 = v36;
                  [v35 receivedFrame:v36];
                }
              }

              else if (dword_10CF8 <= 60 {
                     && (dword_10CF8 != -1 || _LogCategory_Initialize(&dword_10CF8, 60LL)))
              }
              {
                id v17 = &dword_10CF8;
                uint64_t v18 = "OSStatus _IRServer_Process3rdPartyIRData(AppleTVMCUPlugin *, uint64_t, const uint8_t *, size_t)";
                uint64_t v19 = "_IRServer_Process3rdPartyIRData: IR frame dropped because IR interface is not ready.\n";
                goto LABEL_144;
              }
            }
          }

          else if (dword_10DD8 <= 10 {
                 && (dword_10DD8 != -1 || _LogCategory_Initialize(&dword_10DD8, 10LL)))
          }
          {
            LogPrintF( &dword_10DD8,  "OSStatus _IRServer_Process3rdPartyIRData(AppleTVMCUPlugin *, uint64_t, const uint8_t *, size_t)",  10LL,  "Empty 3rd Party IR @ +%'u MCU mics\n");
          }
        }

        else
        {
          if ((_DWORD)a2 != 255) {
            goto LABEL_41;
          }
          if (a4)
          {
            do
            {
              int v15 = *((unsigned __int8 *)a3 + v6 - 1);
              if (v15 != 10 && v15 != 0) {
                break;
              }
              --v6;
            }

            while (v6);
          }

          if (dword_10EB8 <= 40 && (dword_10EB8 != -1 || _LogCategory_Initialize(&dword_10EB8, 40LL)))
          {
            uint64_t v38 = v6;
            uint64_t v39 = (uint64_t)a3;
            id v17 = &dword_10EB8;
            uint64_t v18 = "void _IRServer_ProcessMCUEvent(MCUClientRef, uint8_t, uint8_t *, size_t, void *)";
            uint64_t v19 = "MCU Debug: %.*s\n";
            goto LABEL_40;
          }
        }

        break;
    }

    return;
  }

  if ((int)a2 <= 4)
  {
    if ((_DWORD)a2)
    {
      if ((_DWORD)a2 == 1)
      {
        if (dword_10EB8 <= 40 && (dword_10EB8 != -1 || _LogCategory_Initialize(&dword_10EB8, 40LL))) {
          LogPrintF( &dword_10EB8,  "void _IRServer_ProcessMCUEvent(MCUClientRef, uint8_t, uint8_t *, size_t, void *)",  40LL,  "MCU PowerOnReset %1.2H",  a3,  v6,  v6);
        }
        sub_3834((uint64_t)a5, (uint64_t)sub_5F14, (uint64_t)a5, 0);
        return;
      }

LABEL_41:
      uint64_t v40 = v6;
      uint64_t v41 = v6;
      uint64_t v38 = a2;
      uint64_t v39 = (uint64_t)a3;
      id v17 = &dword_10EB8;
      uint64_t v18 = "void _IRServer_ProcessMCUEvent(MCUClientRef, uint8_t, uint8_t *, size_t, void *)";
      uint64_t v19 = "### MCU Unexpected Opcode 0x%02x Body %H\n";
LABEL_144:
      uint64_t v21 = 60LL;
LABEL_145:
      LogPrintF(v17, v18, v21, v19, v38, v39, v40, v41);
      return;
    }

    uint64_t v39 = v6;
    uint64_t v40 = v6;
    uint64_t v38 = (uint64_t)a3;
    id v17 = &dword_10EB8;
    uint64_t v18 = "void _IRServer_ProcessMCUEvent(MCUClientRef, uint8_t, uint8_t *, size_t, void *)";
    uint64_t v19 = "MCU NoOp %1.2H";
LABEL_40:
    uint64_t v21 = 40LL;
    goto LABEL_145;
  }

  if ((_DWORD)a2 == 5)
  {
    uint64_t v39 = v6;
    uint64_t v40 = v6;
    uint64_t v38 = (uint64_t)a3;
    id v17 = &dword_10EB8;
    uint64_t v18 = "void _IRServer_ProcessMCUEvent(MCUClientRef, uint8_t, uint8_t *, size_t, void *)";
    uint64_t v19 = "MCU Pair Event: %H\n";
    goto LABEL_40;
  }

  if ((_DWORD)a2 != 16)
  {
    if ((_DWORD)a2 == 17)
    {
      int v11 = (void *)a5[16];
      if ([v11 serialQueue])
      {
        id v12 = objc_alloc(&OBJC_CLASS___AppleIRCommand);
        uint64_t v13 = 0LL;
        uint64_t v14 = 1LL;
        goto LABEL_97;
      }

      if (dword_10CF8 <= 60 && (dword_10CF8 != -1 || _LogCategory_Initialize(&dword_10CF8, 60LL))) {
        LogPrintF( &dword_10CF8,  "OSStatus _IRServer_ProcessAppleIRRepeat(AppleTVMCUPlugin *)",  60LL,  "_IRServer_ProcessAppleIRRepeat: IR repeat dropped because IR interface is not ready.\n");
      }
      return;
    }

    goto LABEL_41;
  }

  if (a4 != 4) {
    return;
  }
  int v11 = (void *)a5[16];
  uint64_t v20 = bswap32(*a3);
  if (dword_10D68 <= 40)
  {
    if (dword_10D68 != -1 || _LogCategory_Initialize(&dword_10D68, 524328LL)) {
      LogPrintF( &dword_10D68,  "OSStatus _IRServer_ProcessAppleIRData(AppleTVMCUPlugin *, const uint8_t *, size_t)",  524328LL,  "\n");
    }
    if (dword_10D68 <= 40 && (dword_10D68 != -1 || _LogCategory_Initialize(&dword_10D68, 40LL)))
    {
      int v26 = Parity32(v20);
      uint64_t v27 = " (BAD PARITY)";
      if (v26 == 1) {
        uint64_t v27 = (const char *)&unk_A65F;
      }
      LogPrintF( &dword_10D68,  "OSStatus _IRServer_ProcessAppleIRData(AppleTVMCUPlugin *, const uint8_t *, size_t)",  40LL,  "Apple IR: Raw %.3H %s\n",  a3,  4LL,  4LL,  v27);
    }
  }

  if ([v11 serialQueue])
  {
    id v12 = objc_alloc(&OBJC_CLASS___AppleIRCommand);
    uint64_t v13 = v20;
    uint64_t v14 = 0LL;
LABEL_97:
    id v28 = [v12 initWithPayload:v13 repeat:v14];
    if (v28)
    {
      id v43 = v28;
      [v11 receivedCommand:v28];
    }

    return;
  }

  if (dword_10CF8 <= 60 && (dword_10CF8 != -1 || _LogCategory_Initialize(&dword_10CF8, 60LL))) {
    LogPrintF( &dword_10CF8,  "OSStatus _IRServer_ProcessAppleIRData(AppleTVMCUPlugin *, const uint8_t *, size_t)",  60LL,  "_IRServer_ProcessAppleIRData: IR command dropped because IR interface is not ready.\n");
  }
}

uint64_t sub_52DC(uint64_t result, int a2, int a3, intptr_t notificationID)
{
  uint64_t v6 = result;
  if (a3 > -536870273)
  {
    if (a3 > -536870129)
    {
      if (a3 == -536870128)
      {
        if (dword_10CF8 <= 30)
        {
          if (dword_10CF8 != -1 || (uint64_t result = _LogCategory_Initialize(&dword_10CF8, 30LL), (_DWORD)result))
          {
            CFIndex v7 = "Power: SystemWillRestart\n";
            return LogPrintF( &dword_10CF8,  "void _IRPlugin_PowerCallBack(void *, io_service_t, natural_t, void *)",  30LL,  v7);
          }
        }

        return result;
      }

      if (a3 == -536870112)
      {
        if (dword_10CF8 <= 50 && (dword_10CF8 != -1 || _LogCategory_Initialize(&dword_10CF8, 50LL))) {
          LogPrintF( &dword_10CF8,  "void _IRPlugin_PowerCallBack(void *, io_service_t, natural_t, void *)",  50LL,  "Power: SystemWillPowerOn\n");
        }
        return sub_3834(v6, (uint64_t)sub_5EEC, v6, 1);
      }

      goto LABEL_32;
    }

    if (a3 != -536870272)
    {
      if (a3 == -536870144)
      {
        if (dword_10CF8 <= 30)
        {
          if (dword_10CF8 != -1 || (uint64_t result = _LogCategory_Initialize(&dword_10CF8, 30LL), (_DWORD)result))
          {
            CFIndex v7 = "Power: SystemHasPoweredOn\n";
            return LogPrintF( &dword_10CF8,  "void _IRPlugin_PowerCallBack(void *, io_service_t, natural_t, void *)",  30LL,  v7);
          }
        }

        return result;
      }

LABEL_32:
      if (dword_10CF8 <= 30)
      {
        if (dword_10CF8 != -1) {
          return LogPrintF( &dword_10CF8,  "void _IRPlugin_PowerCallBack(void *, io_service_t, natural_t, void *)",  30LL,  "Power: type 0x%08x\n",  a3);
        }
        uint64_t result = _LogCategory_Initialize(&dword_10CF8, 30LL);
        if ((_DWORD)result) {
          return LogPrintF( &dword_10CF8,  "void _IRPlugin_PowerCallBack(void *, io_service_t, natural_t, void *)",  30LL,  "Power: type 0x%08x\n",  a3);
        }
      }

      return result;
    }

    if (dword_10CF8 <= 50 && (dword_10CF8 != -1 || _LogCategory_Initialize(&dword_10CF8, 50LL))) {
      LogPrintF( &dword_10CF8,  "void _IRPlugin_PowerCallBack(void *, io_service_t, natural_t, void *)",  50LL,  "Power: SystemWillSleep\n");
    }
    sub_3834(v6, (uint64_t)sub_5EDC, v6, 1);
    return IOAllowPowerChange(*(_DWORD *)(v6 + 64), notificationID);
  }

  if (a3 == -536870400)
  {
    if (dword_10CF8 <= 30 && (dword_10CF8 != -1 || _LogCategory_Initialize(&dword_10CF8, 30LL))) {
      LogPrintF( &dword_10CF8,  "void _IRPlugin_PowerCallBack(void *, io_service_t, natural_t, void *)",  30LL,  "Power: CanDevicePowerOff\n");
    }
    return IOAllowPowerChange(*(_DWORD *)(v6 + 64), notificationID);
  }

  if (a3 != -536870320)
  {
    if (a3 != -536870288) {
      goto LABEL_32;
    }
    if (dword_10CF8 <= 30 && (dword_10CF8 != -1 || _LogCategory_Initialize(&dword_10CF8, 30LL))) {
      LogPrintF( &dword_10CF8,  "void _IRPlugin_PowerCallBack(void *, io_service_t, natural_t, void *)",  30LL,  "Power: CanSystemSleep\n");
    }
    return IOAllowPowerChange(*(_DWORD *)(v6 + 64), notificationID);
  }

  if (dword_10CF8 <= 30)
  {
    if (dword_10CF8 != -1 || (uint64_t result = _LogCategory_Initialize(&dword_10CF8, 30LL), (_DWORD)result))
    {
      CFIndex v7 = "Power: SystemWillPowerOff\n";
      return LogPrintF(&dword_10CF8, "void _IRPlugin_PowerCallBack(void *, io_service_t, natural_t, void *)", 30LL, v7);
    }
  }

  return result;
}

uint64_t sub_5688(uint64_t a1)
{
  *(_BYTE *)(a1 + 48) = 1;
  int v2 = **(_DWORD **)(a1 + 80);
  int v3 = *(_DWORD *)(a1 + 16);
  if (v2 > v3) {
    int v3 = **(_DWORD **)(a1 + 80);
  }
  if (v3 < 0) {
    int v3 = -1;
  }
  int v4 = v3 + 1;
  memset(&v20, 0, sizeof(v20));
  int v5 = 1 << v2;
  unint64_t v6 = (unint64_t)v2 >> 5;
  while (1)
  {
    while (1)
    {
      while (1)
      {
LABEL_10:
        if (__darwin_check_fd_set_overflow(v2, &v20, 0)) {
          v20.fds_bits[v6] |= v5;
        }
        int v7 = *(_DWORD *)(a1 + 16);
        if (__darwin_check_fd_set_overflow(v7, &v20, 0)) {
          *(__int32_t *)((char *)v20.fds_bits + (((unint64_t)v7 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) |= 1 << v7;
        }
        int v8 = select(v4, &v20, 0LL, 0LL, 0LL);
        if (v8 > 0) {
          goto LABEL_15;
        }
        if (v8)
        {
          if (!*__error()) {
            goto LABEL_37;
          }
          int v16 = *__error();
          if (v16 != -6722 && v16 != 4) {
            break;
          }
        }
      }

      if (v16) {
        goto LABEL_37;
      }
LABEL_15:
      int v9 = *(_DWORD *)(a1 + 16);
      if (__darwin_check_fd_set_overflow(v9, &v20, 0))
      {
      }

      if (__darwin_check_fd_set_overflow(v2, &v20, 0) && (v20.fds_bits[v6] & v5) != 0)
      {
        do
          int v15 = sub_7CF4(*(void *)(a1 + 80), v23, &v22, v18, (uint64_t *)&v21);
        while (v15 == -6757);
        if (v15 != -6723)
        {
          if (v15) {
            usleep(0x186A0u);
          }
          else {
            sub_484C(*(void *)(a1 + 80), v23[0], v18[0], v21, (void *)a1);
          }
        }
      }

      else
      {
LABEL_37:
        sleep(1u);
      }
    }

    int v10 = *(_DWORD *)(a1 + 16);
    if ((v10 & 0x80000000) == 0) {
      break;
    }
LABEL_42:
    sleep(1u);
  }

  int v11 = v18;
  size_t v12 = 32LL;
  do
  {
    while (1)
    {
      ssize_t v13 = read(v10, v11, v12);
      if (v13 < 1) {
        break;
      }
      int v11 = (unsigned int **)((char *)v11 + v13);
      v12 -= v13;
      if (!v12) {
        goto LABEL_40;
      }
    }

    if (!v13) {
      goto LABEL_45;
    }
    if (!*__error()) {
      goto LABEL_42;
    }
    int v14 = *__error();
  }

  while (v14 == 4);
  if (v14 != -6753)
  {
    if (v14) {
      goto LABEL_42;
    }
LABEL_40:
    ((void (*)(unsigned int *))v18[1])(v18[2]);
    if (dsema) {
      dispatch_semaphore_signal(dsema);
    }
    goto LABEL_10;
  }

LABEL_45:
  *(_BYTE *)(a1 + 48) = 0;
  [(id)a1 _removeInterfaces];
  return 0LL;
}

void *sub_5D0C(void *result)
{
  uint64_t v1 = result;
  if (*((_BYTE *)result + 40)) {
    uint64_t result = [*(id *)(result[4] + 112) addInterface:*(void *)(result[4] + 128)];
  }
  if (*((_BYTE *)v1 + 41)) {
    return [*(id *)(v1[4] + 112) addInterface:*(void *)(v1[4] + 120)];
  }
  return result;
}

void *sub_5E38(void *result)
{
  uint64_t v1 = result[4];
  if (*(void *)(v1 + 120))
  {
    int v2 = result;
    uint64_t result = objc_msgSend(*(id *)(v1 + 112), "removeInterface:");
    uint64_t v1 = v2[4];
  }

  if (*(void *)(v1 + 128)) {
    return objc_msgSend(*(id *)(v1 + 112), "removeInterface:");
  }
  return result;
}

id sub_5EDC(void *a1, const char *a2)
{
  *((_BYTE *)a1 + 103) = 1;
  return [a1 setMcuSystemState:1];
}

id sub_5EEC(_BYTE *a1)
{
  id result = [a1 setMcuSystemState:2];
  a1[103] = 0;
  return result;
}

const char *sub_5F14(uint64_t a1)
{
  v37[0] = 0;
  uint64_t v36 = 0LL;
  if (!sub_7460(*(void *)(a1 + 80), v37, 0x20uLL, 0LL))
  {
    sscanf(v37, "%d.%d", (char *)&v36 + 4, &v36);
  }

  [(id)a1 setMcuSystemState:0];
  int v2 = *(unsigned __int8 *)(a1 + 88);
  if (v2 != 255)
  {
    if (dword_10CF8 <= 50)
    {
      if (dword_10CF8 != -1
        || (v3 = _LogCategory_Initialize(&dword_10CF8, 50LL), int v2 = *(unsigned __int8 *)(a1 + 88), v3))
      {
        LogPrintF(&dword_10CF8, "void _IRServer_InitMCU(void *)", 50LL, "Configuring MCU for SIL action 0x%02x\n", v2);
        LOBYTE(v2) = *(_BYTE *)(a1 + 88);
      }
    }

    sub_76E4(*(void *)(a1 + 80), v2);
  }

  if (dword_10CF8 <= 50 && (dword_10CF8 != -1 || _LogCategory_Initialize(&dword_10CF8, 50LL)))
  {
    if (*(_BYTE *)(a1 + 95)) {
      int v4 = "Enabled";
    }
    else {
      int v4 = "Disabled";
    }
    LogPrintF(&dword_10CF8, "void _IRServer_InitMCU(void *)", 50LL, "%s IR on MCU\n", v4);
  }

  sub_7600(*(void *)(a1 + 80), *(unsigned __int8 *)(a1 + 95));
  if (*(_BYTE *)(a1 + 96))
  {
    if (dword_10CF8 <= 50 && (dword_10CF8 != -1 || _LogCategory_Initialize(&dword_10CF8, 50LL)))
    {
      int v11 = "pair";
      if (!*(_BYTE *)(a1 + 97)) {
        int v11 = "unpair";
      }
      LogPrintF( &dword_10CF8,  "void _IRServer_InitMCU(void *)",  50LL,  "Configuring MCU to %s remote 0x%02x\n",  v11,  *(unsigned __int8 *)(a1 + 98));
    }

    sub_74E4(*(void *)(a1 + 80), *(_BYTE *)(a1 + 97) != 0, *(_BYTE *)(a1 + 98));
  }

  int v12 = sub_6F14(*(void *)(a1 + 80), 0, v5, v6, v7, v8, v9, v10, *(unsigned __int8 *)(a1 + 99), v33);
  *(_BYTE *)(a1 + 89) = v12 == 0;
  if (v12)
  {
    *(_BYTE *)(a1 + 99) = 0;
  }

  else if (dword_10CF8 <= 50 && (dword_10CF8 != -1 || _LogCategory_Initialize(&dword_10CF8, 50LL)))
  {
    LogPrintF(&dword_10CF8, "void _IRServer_InitMCU(void *)", 50LL, "%s CEC on MCU\n");
  }

  id result = (const char *)[(id)a1 _addInterfaces];
  if (!*(_BYTE *)(a1 + 99)) {
    goto LABEL_61;
  }
  if (dword_10CF8 <= 50 && (dword_10CF8 != -1 || _LogCategory_Initialize(&dword_10CF8, 50LL)))
  {
    if (*(_BYTE *)(a1 + 92)) {
      int v14 = "ON";
    }
    else {
      int v14 = "OFF";
    }
    LogPrintF( &dword_10CF8,  "void _IRServer_InitMCU(void *)",  50LL,  "Configuring MCU with wake bitmask: 0x%02x; CEC address mask: 0x%04x; snooping mode: %s\n",
      115,
      *(unsigned __int16 *)(a1 + 90),
      v14);
  }

  int v15 = sub_751C(*(void *)(a1 + 80), 115);
  if (dword_10CF8 <= 30)
  {
    int v22 = v15;
    if (dword_10CF8 != -1 || _LogCategory_Initialize(&dword_10CF8, 30LL))
    {
      uint64_t v34 = 115LL;
      LogPrintF( &dword_10CF8,  "void _IRServer_InitMCU(void *)",  30LL,  "MCUClient_SetWakeBitmask err=%#m wakeBitmask=0x%x\n",  v22);
    }
  }

  int v23 = sub_6F14(*(void *)(a1 + 80), 1, v16, v17, v18, v19, v20, v21, *(unsigned __int16 *)(a1 + 90), v34);
  if (dword_10CF8 <= 30)
  {
    int v30 = v23;
    if (dword_10CF8 != -1 || _LogCategory_Initialize(&dword_10CF8, 30LL))
    {
      uint64_t v35 = *(unsigned __int16 *)(a1 + 90);
      LogPrintF( &dword_10CF8,  "void _IRServer_InitMCU(void *)",  30LL,  "MCUClient_CECControl err=%#m addressMask=0x%x\n",  v30);
    }
  }

  id result = (const char *)sub_6F14( *(void *)(a1 + 80),  2,  v24,  v25,  v26,  v27,  v28,  v29,  *(unsigned __int8 *)(a1 + 92),  v35);
  int v31 = dword_10CF8;
  if (dword_10CF8 <= 30)
  {
    int v32 = result;
    if (dword_10CF8 != -1 || (id result = (const char *)_LogCategory_Initialize(&dword_10CF8, 30LL), (_DWORD)result)) {
      id result = (const char *)LogPrintF( &dword_10CF8,  "void _IRServer_InitMCU(void *)",  30LL,  "MCUClient_CECControl err=%#m snoopingMode=%s\n",  v32);
    }
LABEL_61:
    int v31 = dword_10CF8;
  }

  *(_BYTE *)(a1 + 93) = 1;
  if (v31 <= 50)
  {
    if (v31 != -1) {
      return (const char *)LogPrintF(&dword_10CF8, "void _IRServer_InitMCU(void *)", 50LL, "MCU initialized\n");
    }
    id result = (const char *)_LogCategory_Initialize(&dword_10CF8, 50LL);
    if ((_DWORD)result) {
      return (const char *)LogPrintF(&dword_10CF8, "void _IRServer_InitMCU(void *)", 50LL, "MCU initialized\n");
    }
  }

  return result;
}

uint64_t sub_64E8(uint64_t a1, CFStringRef *a2)
{
  v12[0] = 0;
  sub_7460(*(void *)(a1 + 80), v12, 0x20uLL, 0LL);
  cStr = 0LL;
  if (*(_BYTE *)(a1 + 48)) {
    int v4 = "Started";
  }
  else {
    int v4 = "Stopped";
  }
  uint64_t v5 = "Yes";
  if (!*(_BYTE *)(a1 + 97)) {
    uint64_t v5 = "No";
  }
  uint64_t v6 = "enabled";
  if (!*(_BYTE *)(a1 + 99)) {
    uint64_t v6 = "disabled";
  }
  if (*(_BYTE *)(a1 + 89)) {
    uint64_t v7 = "supported";
  }
  else {
    uint64_t v7 = "not supported";
  }
  ASPrintF( &cStr,  "Server:          %s\nMCU:             %s\nPaired:          %s (%d)\nCEC:             %s, %s\n",  v4,  v12,  v5,  *(unsigned __int8 *)(a1 + 98),  v6,  v7);
  uint64_t v8 = cStr;
  if (!cStr) {
    return 4294960596LL;
  }
  if (a2)
  {
    CFStringRef v9 = CFStringCreateWithCString(0LL, cStr, 0x8000100u);
    if (!v9) {
      return 4294960568LL;
    }
    *a2 = v9;
  }

  else if (dword_10CF8 <= 254)
  {
    if (dword_10CF8 == -1)
    {
      uint64_t v8 = cStr;
    }

    LogPrintF(&dword_10CF8, "OSStatus _IRServer_Show(AppleTVMCUPlugin *, CFTypeRef *)", 254LL, "%s\n", v8);
  }

LABEL_19:
  free(cStr);
  return 0LL;
}

uint64_t sub_6694(int **a1, char *a2)
{
  int v4 = (int *)calloc(1uLL, 0x440uLL);
  if (!v4) {
    return 4294960568LL;
  }
  uint64_t v5 = v4;
  *(void *)int v4 = -1LL;
  v4[2] = -1;
  *((_BYTE *)v4 + 12) = 1;
  v4[264] = -1;
  if (strncmp(a2, "/dev", 4uLL))
  {
    __str[0] = 0;
    uint64_t v6 = IOServiceNameMatching("mcu0");
    if (!v6) {
      goto LABEL_21;
    }
    io_service_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v6);
    if (MatchingService)
    {
      uint64_t v8 = CFStringCreateWithCString(0LL, a2, 0x8000100u);
      if (!v8)
      {
LABEL_20:
        IOObjectRelease(MatchingService);
        goto LABEL_21;
      }

      CFStringRef v9 = v8;
      CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(MatchingService, v8, 0LL, 0);
      CFRelease(v9);
      if (CFProperty)
      {
        CFTypeID v11 = CFGetTypeID(CFProperty);
        if (v11 == CFDataGetTypeID())
        {
          int Length = CFDataGetLength((CFDataRef)CFProperty);
          BytePtr = (const char *)CFDataGetBytePtr((CFDataRef)CFProperty);
          snprintf(__str, 0x400uLL, "/dev/cu.%.*s", Length, BytePtr);
          CFRelease(CFProperty);
          goto LABEL_20;
        }

        CFRelease(CFProperty);
      }
    }

    if (dword_10EB8 <= 60 && (dword_10EB8 != -1 || _LogCategory_Initialize(&dword_10EB8, 60LL))) {
      LogPrintF( &dword_10EB8,  "OSStatus _MCUClient_GetSerialPortPath(const char *, char *)",  60LL,  "### couldn't find MCU UART properties...fallbacking to hard-coded /dev paths\n");
    }
    if (!strcmp(a2, "uart-comm"))
    {
      int v14 = "/dev/cu.builtin-serial4";
    }

    else
    {
      if (strcmp(a2, "uart-bsl")) {
        goto LABEL_19;
      }
      int v14 = "/dev/cu.builtin-serial6";
    }

    __strlcpy_chk(__str, v14, 1025LL, 1025LL);
LABEL_19:
    if (MatchingService) {
      goto LABEL_20;
    }
LABEL_21:
    a2 = __str;
  }

  if (dword_10EB8 <= 20 && (dword_10EB8 != -1 || _LogCategory_Initialize(&dword_10EB8, 20LL))) {
    LogPrintF( &dword_10EB8,  "OSStatus MCUClient_Open(MCUClientRef *, const char *)",  20LL,  "Opening serial port '%s'\n",  a2);
  }
  int v15 = open(a2, 131078);
  *uint64_t v5 = v15;
  if (v15 < 0)
  {
    if (!*__error()) {
      goto LABEL_50;
    }
    uint64_t v16 = *__error();
    if ((_DWORD)v16) {
      goto LABEL_51;
    }
    int v15 = *v5;
  }

  if (ioctl(v15, 0x2000740DuLL))
  {
    if (!*__error()) {
      goto LABEL_50;
    }
    uint64_t v16 = *__error();
    if ((_DWORD)v16) {
      goto LABEL_51;
    }
  }

  int v17 = *v5;
  int v18 = fcntl(*v5, 3, 0LL);
  if (fcntl(v17, 4, v18 | 4u) == -1)
  {
    if (!*__error()) {
      goto LABEL_50;
    }
    uint64_t v16 = *__error();
    if ((_DWORD)v16) {
      goto LABEL_51;
    }
  }

  memset(&v23, 0, sizeof(v23));
  if (tcgetattr(*v5, &v23))
  {
    if (!*__error()) {
      goto LABEL_50;
    }
    uint64_t v16 = *__error();
    if ((_DWORD)v16) {
      goto LABEL_51;
    }
  }

  *(int8x16_t *)&v23.c_iflag = vandq_s8(*(int8x16_t *)&v23.c_iflag, (int8x16_t)xmmword_9370);
  v23.c_cflag = v23.c_cflag & 0xFFFFFFFFFFFC00FFLL | 0xCB00;
  v23.c_lflag &= 0xFFFFFFFFFFFFFE75LL;
  *(_WORD *)&v23.c_cc[16] = 0;
  if (tcsetattr(*v5, 0, &v23))
  {
    if (!*__error()) {
      goto LABEL_50;
    }
    uint64_t v16 = *__error();
    if ((_DWORD)v16) {
      goto LABEL_51;
    }
  }

  uint64_t v20 = 250000LL;
  if (ioctl(*v5, 0x80085402uLL, &v20))
  {
    if (!*__error()) {
      goto LABEL_50;
    }
    uint64_t v16 = *__error();
    if ((_DWORD)v16) {
      goto LABEL_51;
    }
  }

  if (pipe(v22))
  {
    if (*__error())
    {
      uint64_t v16 = *__error();
      if (!(_DWORD)v16) {
        goto LABEL_43;
      }
LABEL_51:
      sub_6AE4(v5);
      return v16;
    }

LABEL_50:
    uint64_t v16 = 4294960596LL;
    goto LABEL_51;
  }

LABEL_43:
  uint64_t v16 = 0LL;
  *(int32x2_t *)(v5 + 1) = vrev64_s32(*(int32x2_t *)v22);
  *a1 = v5;
  return v16;
}

void sub_6AE4(int *a1)
{
  int v2 = a1[1];
  if ((v2 & 0x80000000) == 0)
  {
    if (close(v2) && *__error()) {
      __error();
    }
    a1[1] = -1;
  }

  int v3 = a1[2];
  if ((v3 & 0x80000000) == 0)
  {
    if (close(v3) && *__error()) {
      __error();
    }
    a1[2] = -1;
  }

  if ((*a1 & 0x80000000) == 0)
  {
    if (close(*a1) && *__error()) {
      __error();
    }
    *a1 = -1;
  }

  io_object_t v4 = a1[270];
  if (v4) {
    IOObjectRelease(v4);
  }
  free(a1);
}

uint64_t sub_6B88(uint64_t a1)
{
  if (write(*(_DWORD *)(a1 + 4), "c", 1uLL) == 1) {
    return 0LL;
  }
  if (*__error()) {
    return *__error();
  }
  return 4294960596LL;
}

uint64_t sub_6BD8(uint64_t a1, int a2, char *a3, uint64_t a4, char **a5, unint64_t *a6)
{
  int v12 = "???";
  if (a2 == 255) {
    int v12 = "Debug";
  }
  uint64_t v16 = v12;
  for (unsigned int i = 1; i != 6; ++i)
  {
    if (i >= 2 && dword_10EB8 <= 90 && (dword_10EB8 != -1 || _LogCategory_Initialize(&dword_10EB8, 90LL)))
    {
      if (a2 > 64)
      {
        switch(a2)
        {
          case 128:
            int v14 = "ACK";
            break;
          case 129:
            int v14 = "NAKUnknown";
            break;
          case 130:
            int v14 = "NAKUnsupported";
            break;
          case 131:
            int v14 = "NAKBadCRC";
            break;
          case 132:
            int v14 = "NAKNotNow";
            break;
          case 133:
            int v14 = "MessageTooLong";
            break;
          case 134:
            int v14 = "MessageTooShort";
            break;
          default:
            if (a2 == 65)
            {
              int v14 = "WakeReason";
            }

            else
            {
              int v14 = v16;
              if (a2 == 159) {
                int v14 = "Other";
              }
            }

            break;
        }
      }

      else
      {
        int v14 = "NoOp";
        switch(a2)
        {
          case 0:
            break;
          case 1:
            int v14 = "POR";
            break;
          case 2:
            int v14 = "GetVersion";
            break;
          case 3:
          case 8:
          case 9:
          case 10:
          case 11:
          case 12:
          case 13:
          case 14:
          case 15:
          case 19:
          case 20:
          case 21:
          case 22:
          case 23:
          case 24:
          case 25:
          case 26:
          case 27:
          case 28:
          case 29:
          case 30:
          case 31:
          case 37:
          case 38:
          case 39:
          case 44:
          case 45:
          case 46:
          case 47:
          case 48:
            int v14 = v16;
            break;
          case 4:
            int v14 = "SILControl";
            break;
          case 5:
            int v14 = "PairControl";
            break;
          case 6:
            int v14 = "BlueSteelControl";
            break;
          case 7:
            int v14 = "SystemState";
            break;
          case 16:
            int v14 = "AppleIRCommand";
            break;
          case 17:
            int v14 = "AppleIRRepeat";
            break;
          case 18:
            int v14 = "3rdPartyIR";
            break;
          case 32:
            int v14 = "CECControl";
            break;
          case 33:
            int v14 = "CECBroadcastReceived";
            break;
          case 34:
            int v14 = "CECDirectedReceived";
            break;
          case 35:
            int v14 = "CECSnoopACKedReceived";
            break;
          case 36:
            int v14 = "CECSnoopNAKedReceived";
            break;
          case 40:
            int v14 = "CECTxRequest";
            break;
          case 41:
            int v14 = "CECTxReport";
            break;
          case 42:
            int v14 = "CECTxRequestExtended";
            break;
          case 43:
            int v14 = "CECTxReportExtended";
            break;
          case 49:
            int v14 = "HPDStateChanged";
            break;
          default:
            int v14 = v16;
            if (a2 == 64) {
              int v14 = "WakeBitmask";
            }
            break;
        }
      }

      LogPrintF( &dword_10EB8,  "OSStatus MCUClient_DoTransaction(MCUClientRef, uint8_t, const void *, size_t, uint8_t **, size_t *)",  90LL,  "Retrying opcode 0x%02x [%s] (%d)\n",  a2,  v14,  i);
    }

    uint64_t result = sub_7820(a1, a2, a3, a4);
    if (!(_DWORD)result)
    {
      uint64_t result = sub_7980(a1, a2, a5, a6);
      if ((_DWORD)result == -6745)
      {
        timespec __rmtp = (timespec)xmmword_9380;
        while (nanosleep(&__rmtp, &__rmtp) == -1 && *__error() == 4)
          ;
        uint64_t result = 4294960551LL;
      }

      else if (!(_DWORD)result)
      {
        return result;
      }
    }
  }

  return result;
}

uint64_t sub_6F14( uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned int a9, uint64_t a10)
{
  char v18 = a2;
  uint64_t result = 4294960561LL;
  if (a2 <= 1)
  {
    if (a2)
    {
      if (a2 != 1) {
        return result;
      }
      __int16 v16 = a9;
      if (dword_10EB8 <= 30 && (dword_10EB8 != -1 || _LogCategory_Initialize(&dword_10EB8, 30LL))) {
        LogPrintF( &dword_10EB8,  "OSStatus MCUClient_CECControl(MCUClientRef, int, ...)",  30LL,  "MCUClient_CECControl kMCUCECSubOpcode_AddressMask x=0x%04x\n");
      }
      goto LABEL_25;
    }

LABEL_16:
    int v15 = (char *)&v19 + 1;
    LOBYTE(v19) = a9;
    return sub_6BD8(a1, 32, &v18, v15 - &v18, 0LL, 0LL);
  }

  if (a2 == 2) {
    goto LABEL_16;
  }
  if (a2 == 16)
  {
    __int16 v16 = a9;
    if (dword_10EB8 <= 30 && (dword_10EB8 != -1 || _LogCategory_Initialize(&dword_10EB8, 30LL))) {
      LogPrintF( &dword_10EB8,  "OSStatus MCUClient_CECControl(MCUClientRef, int, ...)",  30LL,  "MCUClient_CECControl kMCUCECSubOpcode_CurrentStreamPath x=0x%04x\n");
    }
LABEL_25:
    __int16 v19 = v16;
    int v15 = v20;
    return sub_6BD8(a1, 32, &v18, v15 - &v18, 0LL, 0LL);
  }

  if (a2 != 32) {
    return result;
  }
  int v17 = (unsigned int *)&a10;
  unsigned int v12 = a9;
  if ((a9 & 0x80000000) != 0)
  {
    int v15 = (char *)&v19;
    return sub_6BD8(a1, 32, &v18, v15 - &v18, 0LL, 0LL);
  }

  uint64_t v13 = 1LL;
  while (1)
  {
    if ((_DWORD)v13 == 16) {
      return 4294960532LL;
    }
    if (v12 > 0xF) {
      break;
    }
    *(&v18 + v13) = v12;
    int v14 = v17;
    v17 += 2;
    unsigned int v12 = *v14;
    ++v13;
    if ((v12 & 0x80000000) != 0)
    {
      int v15 = &v18 + v13;
      return sub_6BD8(a1, 32, &v18, v15 - &v18, 0LL, 0LL);
    }
  }

  return 4294960586LL;
}

uint64_t sub_7120(uint64_t a1, int a2, int *a3)
{
  char v9 = a2;
  uint64_t result = sub_6BD8(a1, 32, &v9, 1LL, &v8, &v7);
  if (!(_DWORD)result)
  {
    if (a2 == 16)
    {
      if (v7 == 2)
      {
        int v6 = *(unsigned __int16 *)v8;
        if (dword_10EB8 <= 30 && (dword_10EB8 != -1 || _LogCategory_Initialize(&dword_10EB8, 30LL))) {
          LogPrintF( &dword_10EB8,  "OSStatus MCUClient_CECStatus(MCUClientRef, uint8_t, int *)",  30LL,  "MCUClient_CECStatus kMCUCECSubOpcode_CurrentStreamPath x=0x%04x\n",  v6);
        }
        uint64_t result = 0LL;
        *a3 = v6;
      }

      else
      {
        return 4294960553LL;
      }
    }

    else
    {
      return 4294960561LL;
    }
  }

  return result;
}

uint64_t sub_71F0(uint64_t a1, char *a2, uint64_t a3, BOOL *a4)
{
  if (a3)
  {
    uint64_t v5 = v11;
    do
    {
      --a3;
      char v6 = *a2++;
      *uint64_t v5 = v6;
      unint64_t v7 = v5 + 2;
      v5[1] = 2 * (a3 == 0);
      v5 += 2;
    }

    while (a3);
  }

  else
  {
    unint64_t v7 = v11;
  }

  uint64_t result = sub_6BD8(a1, 40, v11, v7 - v11, &v10, &v9);
  if (!(_DWORD)result)
  {
    if (v9 == 1)
    {
      uint64_t result = 0LL;
      if (a4) {
        *a4 = *v10 != 0;
      }
      return result;
    }

    return 4294960553LL;
  }

  return result;
}

uint64_t sub_72D0(uint64_t a1, char *a2, uint64_t a3, BOOL *a4, char *a5)
{
  v13[0] = *a5;
  v13[1] = 0;
  for (unsigned int i = v14; a3; i += 2)
  {
    char v8 = *a2++;
    --a3;
    *unsigned int i = v8;
    i[1] = 2 * (a3 == 0);
  }

  uint64_t result = sub_6BD8(a1, 42, v13, i - v13, &v12, &v11);
  if (!(_DWORD)result)
  {
    if (v11 == 2)
    {
      uint64_t v10 = v12;
      if (a4) {
        *a4 = *v12 != 0;
      }
      uint64_t result = 0LL;
      *a5 = v10[1];
      return result;
    }

    return 4294960553LL;
  }

  return result;
}

uint64_t sub_73C0(uint64_t a1, uint64_t a2, _BYTE *a3, uint64_t a4, void *a5, char *a6)
{
  if (a2 < 2)
  {
    uint64_t result = 4294960546LL;
    char v9 = 1;
    unint64_t v7 = a3;
    goto LABEL_12;
  }

  char v6 = (_BYTE *)(a1 + 1);
  unint64_t v7 = a3;
  while (1)
  {
    if (a2 < 2)
    {
      uint64_t result = 4294960546LL;
      goto LABEL_19;
    }

    if (a3) {
      break;
    }
LABEL_7:
    if ((*v6 & 1) == 0)
    {
      char v9 = 0;
      uint64_t result = 0LL;
      goto LABEL_12;
    }

    uint64_t result = 0LL;
    char v9 = 1;
    if ((*v6 & 2) == 0)
    {
      v6 += 2;
      a2 -= 2LL;
      if (a2) {
        continue;
      }
    }

    goto LABEL_12;
  }

  if (&a3[a4] - v7 >= 1)
  {
    *v7++ = *(v6 - 1);
    goto LABEL_7;
  }

  uint64_t result = 4294960545LL;
LABEL_19:
  char v9 = 1;
LABEL_12:
  if (a5) {
    *a5 = v7 - a3;
  }
  if (a6) {
    *a6 = v9;
  }
  return result;
}

uint64_t sub_7460(uint64_t a1, void *a2, size_t a3, size_t *a4)
{
  uint64_t result = sub_6BD8(a1, 2, 0LL, 0LL, (char **)&__src, &__n);
  if (!(_DWORD)result)
  {
    size_t v8 = __n;
    if (__n >= a3)
    {
      return 4294960553LL;
    }

    else
    {
      memcpy(a2, __src, __n);
      *((_BYTE *)a2 + v8) = 0;
      uint64_t result = 0LL;
      if (a4) {
        *a4 = v8;
      }
    }
  }

  return result;
}

uint64_t sub_74E4(uint64_t a1, char a2, char a3)
{
  v4[0] = a2;
  v4[1] = a3;
  return sub_6BD8(a1, 5, v4, 2LL, 0LL, 0LL);
}

uint64_t sub_751C(uint64_t a1, char a2)
{
  char v3 = a2;
  return sub_6BD8(a1, 64, &v3, 1LL, 0LL, 0LL);
}

uint64_t sub_7550(uint64_t a1, char a2)
{
  char v3 = a2;
  return sub_6BD8(a1, 65, &v3, 1LL, 0LL, 0LL);
}

uint64_t sub_7584(uint64_t a1, _DWORD *a2, _BYTE *a3)
{
  uint64_t result = sub_6BD8(a1, 65, 0LL, 0LL, &v7, &v6);
  if (!(_DWORD)result)
  {
    if (v6 < 2)
    {
      return 4294960553LL;
    }

    else
    {
      if (a2) {
        *a2 = *v7;
      }
      uint64_t result = 0LL;
      if (a3) {
        *a3 = v7[1];
      }
    }
  }

  return result;
}

uint64_t sub_7600(uint64_t a1, int a2)
{
  BOOL v3 = a2 != 0;
  return sub_6BD8(a1, 8, (char *)&v3, 1LL, 0LL, 0LL);
}

uint64_t sub_763C(uint64_t a1, int a2, char *a3, uint64_t a4)
{
  return sub_6BD8(a1, a2, a3, a4, 0LL, 0LL);
}

uint64_t sub_7648(uint64_t a1, unsigned __int8 a2)
{
  unsigned __int8 v4 = a2;
  uint64_t v2 = sub_6BD8(a1, 7, (char *)&v4, 1LL, 0LL, 0LL);
  if (dword_10EB8 <= 30 && (dword_10EB8 != -1 || _LogCategory_Initialize(&dword_10EB8, 30LL))) {
    LogPrintF( &dword_10EB8,  "OSStatus MCUClient_SetSystemState(MCUClientRef, uint8_t)",  30LL,  "MCUClient_SetSystemState inState=%d err=%#m\n",  v4);
  }
  return v2;
}

uint64_t sub_76E4(uint64_t a1, char a2)
{
  char v3 = a2;
  return sub_6BD8(a1, 4, &v3, 1LL, 0LL, 0LL);
}

uint64_t sub_7718(const char *a1, _BYTE *a2)
{
  LODWORD(v4) = strcmp(a1, "off");
  if (!(_DWORD)v4) {
    goto LABEL_16;
  }
  if (!strcmp(a1, "on"))
  {
    LOBYTE(v4) = 1;
LABEL_16:
    uint64_t v5 = 0LL;
    *a2 = v4;
    return v5;
  }

  if (!strcmp(a1, "slow"))
  {
    LOBYTE(v4) = 2;
    goto LABEL_16;
  }

  if (!strcmp(a1, "fast"))
  {
    LOBYTE(v4) = 3;
    goto LABEL_16;
  }

  if (!strcmp(a1, "1blink"))
  {
    LOBYTE(v4) = 4;
    goto LABEL_16;
  }

  if (!strcmp(a1, "3blinks"))
  {
    LOBYTE(v4) = 5;
    goto LABEL_16;
  }

  __endptr = (char *)&unk_A65F;
  uint64_t v4 = strtol(a1, &__endptr, 0);
  uint64_t v5 = 4294960591LL;
  if (!*__endptr && (v4 & 0x8000000000000000LL) == 0 && v4 <= 255) {
    goto LABEL_16;
  }
  return v5;
}

uint64_t sub_7820(uint64_t a1, char a2, char *a3, uint64_t a4)
{
  __int16 __buf = 29779;
  char v10 = a2;
  char v11 = *(_BYTE *)(a1 + 12);
  *(_BYTE *)(a1 + 12) = v11 + 2;
  char v12 = BYTE1(a4);
  char v13 = a4;
  uint64_t result = sub_81A4(a1, (char *)&__buf, 6LL);
  if (!(_DWORD)result)
  {
    uint64_t result = sub_81A4(a1, a3, a4);
    if (!(_DWORD)result)
    {
      uint64_t v8 = CRC16_CCITT(0xFFFFLL, &__buf, 6LL);
      __int16 v14 = __rev16(CRC16_CCITT(v8, a3, a4));
      uint64_t result = sub_81A4(a1, (char *)&v14, 2LL);
      if (!(_DWORD)result)
      {
        if (dword_10F28 > 30) {
          return 0LL;
        }
        if (dword_10F28 != -1 || (uint64_t result = _LogCategory_Initialize(&dword_10F28, 30LL), (_DWORD)result))
        {
          LogPrintF( &dword_10F28,  "OSStatus MCUClient_WritePacket(MCUClientRef, MCUOpCode, const void *, size_t)",  30LL,  "AP --> MCU: %H - %H - %H\n",  &__buf,  6LL,  6LL,  a3,  a4,  a4,  &v14,  2LL,  2LL);
          return 0LL;
        }
      }
    }
  }

  return result;
}

uint64_t sub_7980(uint64_t a1, int a2, char **a3, unint64_t *a4)
{
  BOOL v7 = a2 == 40;
  BOOL v8 = a2 == 42;
  uint64_t v9 = mach_absolute_time();
  uint64_t v10 = UpTicksPerSecond();
  char v11 = 0;
  uint64_t v12 = 0LL;
  uint64_t v13 = v9 + 30 * v10;
  while (1)
  {
LABEL_2:
    uint64_t v14 = v12;
    do
    {
      if (mach_absolute_time() >= v13)
      {
        syslog(2, "MCU LIVELOCK DETECTED. Please report this.");
        return 4294960574LL;
      }

      uint64_t result = sub_7CF4(a1, (char *)&v31, &v30, &v29, (uint64_t *)&v28);
    }

    while ((_DWORD)result == -6757);
    if ((_DWORD)result) {
      return result;
    }
    int v16 = v31;
    if (v31 == 128)
    {
      uint64_t v12 = 1LL;
      if (v7 || v8) {
        continue;
      }
      if ((a2 | 2) == 0x2A)
      {
LABEL_53:
        *(_BYTE *)(a1 + 13) = v11;
        uint64_t v29 = (char *)(a1 + 13);
        uint64_t v26 = 1LL;
LABEL_54:
        unint64_t v28 = v26;
      }

LABEL_55:
      if (a3) {
        *a3 = v29;
      }
      unint64_t v23 = v28;
      if (a4)
      {
        uint64_t result = 0LL;
        *a4 = v28;
        return result;
      }

      if (v28 && dword_10EB8 <= 90)
      {
        if (dword_10EB8 == -1)
        {
          uint64_t result = _LogCategory_Initialize(&dword_10EB8, 90LL);
          if (!(_DWORD)result) {
            return result;
          }
        }

        LogPrintF( &dword_10EB8,  "OSStatus MCUClient_ReadResponse(MCUClientRef, uint8_t, uint8_t **, size_t *)",  90LL,  "### Unexpected non-empty body received: %H",  v29,  v23,  v23);
      }

      return 0LL;
    }

    if (v7 && v31 == 41)
    {
      uint64_t v17 = v28;
      if ((uint64_t)v28 >= 2)
      {
        char v18 = v29 + 1;
        while (v17 >= 2)
        {
          if ((*v18 & 1) == 0)
          {
            char v11 = 0;
LABEL_31:
            BOOL v7 = 0;
            uint64_t v12 = 0LL;
            if (!(_DWORD)v14) {
              goto LABEL_2;
            }
            goto LABEL_53;
          }

          char v11 = 1;
          if ((*v18 & 2) == 0)
          {
            v18 += 2;
            v17 -= 2LL;
            if (v17) {
              continue;
            }
          }

          goto LABEL_31;
        }
      }

      return 4294960546LL;
    }

    if (v8 && v31 == 43)
    {
      uint64_t v19 = v28 - 2;
      if (v28 < 2) {
        return 4294960553LL;
      }
      if (v19 >= 2)
      {
        uint64_t v20 = 3LL;
        while (v19 >= 2)
        {
          if ((v29[v20] & 1) == 0)
          {
            char v11 = 0;
LABEL_36:
            BOOL v8 = 0;
            uint64_t v12 = 0LL;
            if (!(_DWORD)v14) {
              goto LABEL_2;
            }
            char v24 = *v29;
            *(_BYTE *)(a1 + 13) = v11;
            uint64_t v25 = (char *)(a1 + 13);
            v25[1] = v24;
            uint64_t v29 = v25;
            uint64_t v26 = 2LL;
            goto LABEL_54;
          }

          char v11 = 1;
          if ((v29[v20] & 2) == 0)
          {
            v20 += 2LL;
            v19 -= 2LL;
            if (v19) {
              continue;
            }
          }

          goto LABEL_36;
        }
      }

      return 4294960546LL;
    }

    uint64_t v21 = *(void (**)(uint64_t, void, char *, unint64_t, void))(a1 + 1064);
    if (v21)
    {
      v21(a1, v31, v29, v28, *(void *)(a1 + 1072));
      uint64_t v12 = v14;
    }

    else
    {
      uint64_t v12 = v14;
      if (v31 != 255)
      {
        uint64_t v12 = v14;
        if (dword_10EB8 <= 90)
        {
          if (dword_10EB8 != -1 || (v22 = _LogCategory_Initialize(&dword_10EB8, 90LL), uint64_t v12 = v14, v22))
          {
            LogPrintF( &dword_10EB8,  "OSStatus MCUClient_ReadResponse(MCUClientRef, uint8_t, uint8_t **, size_t *)",  90LL,  "Ignoring opcode 0x%02x when expecting ack\n",  v16);
            uint64_t v12 = v14;
          }
        }
      }
    }
  }

  if (a2 == 7 && v31 == 132) {
    goto LABEL_55;
  }
  if (v31 == 159) {
    return 4294960560LL;
  }
  return 4294960596LL;
}

uint64_t sub_7CF4(uint64_t a1, char *a2, char *a3, void *a4, uint64_t *a5)
{
  *(void *)(a1 + 1040) = mach_absolute_time();
  uint64_t result = sub_80F4(a1, (char *)&v17, 1LL);
  if ((_DWORD)result) {
    return result;
  }
  if (v17 != 83)
  {
    if (dword_10F28 <= 30 && (dword_10F28 != -1 || _LogCategory_Initialize(&dword_10F28, 30LL))) {
      LogPrintF( &dword_10F28,  "OSStatus MCUClient_ReadPacket(MCUClientRef, MCUOpCode *, uint8_t *, uint8_t **, size_t *)",  30LL,  "MCU <-: %H (!S)\n",  &v17,  1LL,  1LL);
    }
    if (dword_10EB8 <= 90 && (dword_10EB8 != -1 || _LogCategory_Initialize(&dword_10EB8, 90LL)))
    {
      LogPrintF( &dword_10EB8,  "OSStatus MCUClient_ReadPacket(MCUClientRef, MCUOpCode *, uint8_t *, uint8_t **, size_t *)",  90LL,  "### resync: got 0x%02x '%.1s' instead of 'S'\n");
    }

    return 4294960539LL;
  }

  uint64_t result = sub_80F4(a1, &v18, 1LL);
  if ((_DWORD)result) {
    return result;
  }
  if (v18 != 116)
  {
    if (dword_10F28 <= 30 && (dword_10F28 != -1 || _LogCategory_Initialize(&dword_10F28, 30LL))) {
      LogPrintF( &dword_10F28,  "OSStatus MCUClient_ReadPacket(MCUClientRef, MCUOpCode *, uint8_t *, uint8_t **, size_t *)",  30LL,  "MCU <-: %H (!t)\n",  &v17,  2LL,  2LL);
    }
    if (dword_10EB8 <= 90 && (dword_10EB8 != -1 || _LogCategory_Initialize(&dword_10EB8, 90LL)))
    {
      LogPrintF( &dword_10EB8,  "OSStatus MCUClient_ReadPacket(MCUClientRef, MCUOpCode *, uint8_t *, uint8_t **, size_t *)",  90LL,  "### resync: got 0x%02x '%.1s' instead of 't'\n");
    }

    return 4294960539LL;
  }

  uint64_t result = sub_80F4(a1, v19, 4LL);
  if (!(_DWORD)result)
  {
    uint64_t v11 = __rev16(v20);
    if (v11 > 0x400)
    {
      return 4294960553LL;
    }

    else
    {
      char v12 = v19[0];
      char v13 = v19[1];
      uint64_t result = sub_80F4(a1, (char *)(a1 + 13), v11);
      if (!(_DWORD)result)
      {
        uint64_t v14 = CRC16_CCITT(0xFFFFLL, &v17, 6LL);
        int v16 = CRC16_CCITT(v14, a1 + 13, v11);
        uint64_t result = sub_80F4(a1, (char *)&v21, 2LL);
        if (!(_DWORD)result)
        {
          if (dword_10F28 <= 30 && (dword_10F28 != -1 || _LogCategory_Initialize(&dword_10F28, 30LL))) {
            LogPrintF( &dword_10F28,  "OSStatus MCUClient_ReadPacket(MCUClientRef, MCUOpCode *, uint8_t *, uint8_t **, size_t *)",  30LL,  "AP <-- MCU: %H - %H - %H\n",  &v17,  6LL,  6LL,  a1 + 13,  v11,  v11,  &v21,  2LL,  2LL);
          }
          if (v16 == bswap32(v21) >> 16)
          {
            uint64_t v15 = mach_absolute_time();
            uint64_t result = 0LL;
            *(void *)(a1 + 1048) = v15 - *(void *)(a1 + 1040);
            *a2 = v12;
            *a3 = v13;
            *a4 = a1 + 13;
            *a5 = v11;
          }

          else
          {
            return 4294960583LL;
          }
        }
      }
    }
  }

  return result;
}

uint64_t sub_80F4(uint64_t a1, char *a2, uint64_t a3)
{
  if (a3 < 1) {
    return 0LL;
  }
  size_t v3 = a3;
  uint64_t v4 = a2;
  unint64_t v6 = &a2[a3];
  while (1)
  {
    while (1)
    {
      ssize_t v7 = read(*(_DWORD *)a1, v4, v3);
      if (v7 < 1) {
        break;
      }
      v4 += v7;
LABEL_11:
      size_t v3 = v6 - v4;
      if (v6 <= v4) {
        return 0LL;
      }
    }

    if (!v7) {
      goto LABEL_8;
    }
    if (!*__error()) {
      return 4294960596LL;
    }
    uint64_t result = *__error();
    if ((_DWORD)result != 4)
    {
      if ((_DWORD)result != 35) {
        return result;
      }
LABEL_8:
      uint64_t result = sub_8250((int *)a1, 1, *(_DWORD *)(a1 + 1056));
      if ((_DWORD)result) {
        return result;
      }
      goto LABEL_11;
    }
  }

uint64_t sub_81A4(uint64_t a1, char *__buf, uint64_t __nbyte)
{
  if (__nbyte < 1) {
    return 0LL;
  }
  size_t v3 = __nbyte;
  uint64_t v4 = __buf;
  unint64_t v6 = &__buf[__nbyte];
  while (1)
  {
    while (1)
    {
      ssize_t v7 = write(*(_DWORD *)a1, v4, v3);
      if (v7 < 1) {
        break;
      }
      v4 += v7;
LABEL_10:
      size_t v3 = v6 - v4;
      if (v6 <= v4) {
        return 0LL;
      }
    }

    if (!*__error()) {
      return 4294960596LL;
    }
    uint64_t result = *__error();
    if ((_DWORD)result != 4)
    {
      if ((_DWORD)result != 35) {
        return result;
      }
      uint64_t result = sub_8250((int *)a1, 0, *(_DWORD *)(a1 + 1056));
      if ((_DWORD)result) {
        return result;
      }
      goto LABEL_10;
    }
  }

uint64_t sub_8250(int *a1, int a2, unsigned int a3)
{
  int v6 = a1[2];
  if (__darwin_check_fd_set_overflow(v6, &v20, 0)) {
    *(__int32_t *)((char *)v20.fds_bits + (((unint64_t)v6 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) |= 1 << v6;
  }
  int v7 = *a1;
  int v8 = __darwin_check_fd_set_overflow(*a1, &v20, 0);
  if (!a2)
  {
    if (v8) {
      *(__int32_t *)((char *)v20.fds_bits + (((unint64_t)v7 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) &= ~(1 << v7);
    }
    memset(v19, 0, sizeof(v19));
    int v7 = *a1;
    uint64_t v10 = (fd_set *)v19;
    uint64_t v9 = (fd_set *)v19;
    if (!__darwin_check_fd_set_overflow(*a1, v19, 0)) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }

  uint64_t v9 = 0LL;
  if (v8)
  {
    uint64_t v10 = &v20;
LABEL_9:
    *(__int32_t *)((char *)v10->fds_bits + (((unint64_t)v7 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) |= 1 << v7;
  }

LABEL_10:
  if ((a3 & 0x80000000) != 0)
  {
    uint64_t v11 = 0LL;
  }

  else
  {
    unint64_t v17 = a3 / 0x3E8uLL;
    unsigned int v18 = 1000 * (a3 % 0x3E8);
    uint64_t v11 = (timeval *)&v17;
  }

  int v12 = *a1;
  if (*a1 <= a1[2]) {
    int v12 = a1[2];
  }
  if (v12 < 0) {
    int v12 = -1;
  }
  int v13 = v12 + 1;
  while (1)
  {
    int v14 = select(v13, &v20, v9, 0LL, v11);
    if ((v14 & 0x80000000) == 0) {
      break;
    }
    if (!*__error()) {
      return 4294960596LL;
    }
    uint64_t result = *__error();
    if ((_DWORD)result != 4) {
      return result;
    }
  }

  if (!v14) {
    return 4294960574LL;
  }
  int v16 = a1[2];
  if (__darwin_check_fd_set_overflow(v16, &v20, 0)
    && ((*(unsigned int *)((char *)v20.fds_bits + (((unint64_t)v16 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) >> v16) & 1) != 0)
  {
    return 4294960573LL;
  }

  else
  {
    return 0LL;
  }

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return [a1 unlock];
}