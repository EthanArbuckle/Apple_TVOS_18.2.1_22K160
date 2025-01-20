LABEL_16:
  return v9;
}

  self->_configSeed = BonjourDevice_GetInt64();
  if (v26)
  {
    self->_configSeed = BonjourDevice_GetInt64();
    if (v26)
    {
      self->_configSeed = BonjourDevice_GetInt64();
      if (v26)
      {
        if (gLogCategory_EasyConfigDevice <= 50
          && (gLogCategory_EasyConfigDevice != -1 || _LogCategory_Initialize()))
        {
          v21 = self->_deviceIdentifier;
          LogPrintF();
        }

        self->_configSeed = 1;
      }
    }
  }

  self->_supportsTLV = 0;
  CFStringGetTypeID();
  TypedValue = (const __CFString *)CFDictionaryGetTypedValue();
  if (!TypedValue) {
    goto LABEL_53;
  }
  v10 = TypedValue;
  if (CFStringCompare(TypedValue, @"_airplay._tcp.", 1uLL) == kCFCompareEqualTo
    || CFStringCompare(v10, @"_raop._tcp.", 1uLL) == kCFCompareEqualTo)
  {
    Value = (const __CFData *)CFDictionaryGetValue(v4, @"txt");
    if (Value)
    {
      v13 = Value;
      BytePtr = CFDataGetBytePtr(Value);
      Length = CFDataGetLength(v13);
      if (TXTRecordGetValuePtr(Length, BytePtr, "srcvers", &valueLen)
        || TXTRecordGetValuePtr(Length, BytePtr, "vs", &valueLen))
      {
        LOBYTE(v11) = TextToSourceVersion() > 0x1B903F;
LABEL_34:
        self->_supportsTLV = v11;
        goto LABEL_35;
      }

      v16 = 4294960581LL;
LABEL_55:
      v26 = v16;
      goto LABEL_46;
    }

LABEL_10:
  v7 = !self->_airplayBonjourInfo
    && !self->_raopBonjourInfo
    && !self->_mfiConfigBonjourInfo
    && self->_hapBonjourInfo == 0LL;

  return v7;
}

  if (v13) {
    CFRelease(v13);
  }
  if (v16) {
    free(v16);
  }
  if ((_DWORD)var21)
  {
    if (gLogCategory_EasyConfigDevice <= 60
      && (gLogCategory_EasyConfigDevice != -1 || _LogCategory_Initialize()))
    {
      deviceIdentifier = self->_deviceIdentifier;
      LogPrintF();
      -[EasyConfigDevice _handleError:](self, "_handleError:", var21, deviceIdentifier, var21);
    }

    else
    {
      -[EasyConfigDevice _handleError:](self, "_handleError:", var21, v9, v11);
    }
  }

  return var21;
}

LABEL_36:
    v13 = v8;
    goto LABEL_23;
  }

  if (gLogCategory_EasyConfigDevice <= 60
    && (gLogCategory_EasyConfigDevice != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

  v6 = 0LL;
LABEL_28:
}

LABEL_53:
    v16 = 4294960534LL;
    goto LABEL_55;
  }

  if (CFStringCompare(v10, @"_mfi-config._tcp.", 1uLL) == kCFCompareEqualTo)
  {
    v11 = (BonjourDevice_GetInt64() >> 2) & 1;
    goto LABEL_34;
  }

  LOBYTE(v11) = 1;
  if (CFStringCompare(v10, @"_hap._tcp.", 1uLL) == kCFCompareEqualTo) {
    goto LABEL_34;
  }
LABEL_35:
  v16 = -[EasyConfigDevice _setupClient:](self, "_setupClient:", v4, v21, v22, v23, v24);
  v26 = v16;
  if (!(_DWORD)v16)
  {
    if (CFDictionaryGetInt64() && (self->_supportsHAP2 || self->_supportsPairSetup || !self->_supportsMFi)) {
      v17 = self->_skipPairSetup
    }
          ? -[EasyConfigDevice _pairVerifyStart](self, "_pairVerifyStart")
          : -[EasyConfigDevice _pairSetupStart](self, "_pairSetupStart");
    else {
      v17 = -[EasyConfigDevice _mfiSAPStart](self, "_mfiSAPStart");
    }
    v16 = v17;
    v26 = v17;
    if (!(_DWORD)v17)
    {
      v19 = 0;
      goto LABEL_51;
    }
  }

LABEL_46:
  if (gLogCategory_EasyConfigDevice <= 60)
  {
    if (gLogCategory_EasyConfigDevice != -1 || (v18 = _LogCategory_Initialize(), v16 = v26, v18))
    {
      v21 = self->_deviceIdentifier;
      v22 = v16;
      LogPrintF();
      v16 = v26;
    }
  }

  -[EasyConfigDevice _handleError:](self, "_handleError:", v16, v21, v22);
  v19 = v26;
LABEL_51:

  return v19;
}

LABEL_8:
  if ((_DWORD)var21)
  {
    if (gLogCategory_EasyConfigDevice <= 60
      && (gLogCategory_EasyConfigDevice != -1 || _LogCategory_Initialize()))
    {
      deviceIdentifier = self->_deviceIdentifier;
      LogPrintF();
      -[EasyConfigDevice _handleError:](self, "_handleError:", var21, deviceIdentifier, var21);
    }

    else
    {
      -[EasyConfigDevice _handleError:](self, "_handleError:", var21, v7, v9);
    }
  }

  return var21;
}

  if (v5) {
    free(v5);
  }
LABEL_10:
  if (v18) {
    CFRelease(v18);
  }
  v8 = v19;
  if (v19)
  {
    if (gLogCategory_EasyConfigDevice <= 60)
    {
      if (gLogCategory_EasyConfigDevice != -1 || (v11 = _LogCategory_Initialize(), v8 = v19, v11))
      {
        deviceIdentifier = self->_deviceIdentifier;
        v15 = v8;
        LogPrintF();
        v8 = v19;
      }
    }

    -[EasyConfigDevice _handleError:](self, "_handleError:", v8, deviceIdentifier, v15);
    v9 = v19;
  }

  else
  {
    v9 = 0;
  }

  return v9;
}

LABEL_5:
  if ((_DWORD)var21)
  {
    if (gLogCategory_EasyConfigDevice <= 60
      && (gLogCategory_EasyConfigDevice != -1 || _LogCategory_Initialize()))
    {
      deviceIdentifier = self->_deviceIdentifier;
      LogPrintF();
      -[EasyConfigDevice _handleError:](self, "_handleError:", var21, deviceIdentifier, var21);
    }

    else
    {
      -[EasyConfigDevice _handleError:](self, "_handleError:", var21, v7, v9);
    }
  }

  return var21;
}

LABEL_20:
        var21 = v18;
        if (!v18) {
          return;
        }
        goto LABEL_21;
      }

      var21 = -[EasyConfigDevice _findDevicePostConfigStart](self, "_findDevicePostConfigStart");
      v18 = var21;
      if (!(_DWORD)var21) {
        return;
      }
    }
  }

LABEL_21:
  if (gLogCategory_EasyConfigDevice <= 60
    && (gLogCategory_EasyConfigDevice != -1 || (v12 = _LogCategory_Initialize(), var21 = v18, v12)))
  {
    v15 = self->_deviceIdentifier;
    v17 = var21;
    LogPrintF();
    -[EasyConfigDevice _handleError:](self, "_handleError:", v18, v15, v17);
  }

  else
  {
    -[EasyConfigDevice _handleError:](self, "_handleError:", var21, deviceIdentifier, v16);
  }
}

uint64_t _pairSetupPromptForSetupCode(int a1, int a2, void *a3)
{
  id v5 = a3;
  v6 = (void *)*((void *)v5 + 15);
  if (v6)
  {
    v7 = v6;
    dispatch_source_cancel(v7);
    v8 = (void *)*((void *)v5 + 15);
    *((void *)v5 + 15) = 0LL;
  }

  if (*((void *)v5 + 21))
  {
    *((CFAbsoluteTime *)v5 + 51) = CFAbsoluteTimeGetCurrent();
    v9 = (dispatch_queue_s *)*((void *)v5 + 2);
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 3221225472LL;
    v12[2] = ___pairSetupPromptForSetupCode_block_invoke;
    v12[3] = &unk_18A2F45F0;
    v12[4] = v5;
    int v13 = a1;
    int v14 = a2;
    dispatch_async(v9, v12);
    uint64_t v10 = 0LL;
  }

  else
  {
    uint64_t v10 = 4294960551LL;
  }

  return v10;
}

uint64_t ___pairSetupPromptForSetupCode_block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 168LL);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))( result,  *(unsigned int *)(a1 + 40),  *(unsigned int *)(a1 + 44));
  }
  return result;
}

__CFDictionary *EasyConfigCreateDictionaryFromTLV(uint64_t a1, uint64_t a2, int *a3)
{
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0LL, 0LL, MEMORY[0x189605240], MEMORY[0x189605250]);
  if (!Mutable)
  {
    v16 = 0LL;
    int v21 = -6728;
    goto LABEL_43;
  }

  id v5 = Mutable;
  CFMutableArrayRef v6 = 0LL;
  while (2)
  {
    if (TLV8GetNext())
    {
      if (v6) {
        CFDictionarySetValue(v5, @"mfiProtocols", v6);
      }
      v15 = 0LL;
      int v21 = 0;
LABEL_39:
      v16 = v5;
      id v5 = v15;
      if (!v6)
      {
LABEL_41:
        if (v5) {
          goto LABEL_42;
        }
        goto LABEL_43;
      }

LABEL_40:
      CFRelease(v6);
      goto LABEL_41;
    }

    v7 = @"adminPassword";
    v8 = @"wifiEAPTLSCert";
    switch(v20)
    {
      case 0:
        goto LABEL_29;
      case 1:
        v7 = @"bundleSeedID";
        goto LABEL_29;
      case 2:
        v7 = @"firmwareRevision";
        goto LABEL_29;
      case 3:
        v7 = @"hardwareRevision";
        goto LABEL_29;
      case 4:
        v7 = @"language";
        goto LABEL_29;
      case 5:
        v7 = @"manufacturer";
        goto LABEL_29;
      case 6:
        if (v6 || (CFMutableArrayRef v6 = CFArrayCreateMutable(0LL, 0LL, MEMORY[0x189605228])) != 0LL)
        {
          CFStringRef v9 = CFStringCreateWithBytes(0LL, v19, v18, 0x8000100u, 0);
          if (!v9)
          {
            v16 = 0LL;
            int v21 = -6742;
            goto LABEL_40;
          }

          uint64_t v10 = v9;
          CFArrayAppendValue(v6, v9);
LABEL_32:
          CFRelease(v10);
          continue;
        }

        v16 = 0LL;
        int v21 = -6728;
LABEL_42:
        CFRelease(v5);
LABEL_43:
        if (a3) {
          *a3 = v21;
        }
        return v16;
      case 7:
        v7 = @"model";
        goto LABEL_29;
      case 8:
        v7 = @"name";
        goto LABEL_29;
      case 9:
        v7 = @"playPassword";
        goto LABEL_29;
      case 10:
        v7 = @"serialNumber";
        goto LABEL_29;
      case 11:
        v8 = @"wifiPSK";
        goto LABEL_24;
      case 12:
        v7 = @"wifiSSID";
        goto LABEL_29;
      case 13:
        goto LABEL_24;
      case 14:
        v8 = @"wifiRouterCert";
LABEL_24:
        CFDataRef v11 = CFDataCreate(0LL, v19, v18);
        if (!v11) {
          goto LABEL_46;
        }
        uint64_t v10 = v11;
        v12 = v5;
        int v13 = v8;
        goto LABEL_31;
      case 15:
      case 17:
        TLVParseSInt64();
        if (v21) {
          goto LABEL_47;
        }
        CFDictionarySetInt64();
        continue;
      case 16:
        v7 = @"countryCode";
LABEL_29:
        CFStringRef v14 = CFStringCreateWithBytes(0LL, v19, v18, 0x8000100u, 0);
        if (!v14)
        {
LABEL_46:
          int v21 = -6742;
LABEL_47:
          v15 = v5;
          id v5 = 0LL;
          goto LABEL_39;
        }

        uint64_t v10 = v14;
        v12 = v5;
        int v13 = v7;
LABEL_31:
        CFDictionarySetValue(v12, v13, v10);
        goto LABEL_32;
      default:
        continue;
    }
  }

uint64_t EasyConfigCreateTLVfromDictionary(const __CFDictionary *a1, uint64_t a2, _DWORD *a3)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  DataBuffer_Init();
  int v7 = 0;
  CFDictionaryApplyFunction(a1, (CFDictionaryApplierFunction)_EasyConfigCreateTLVfromDictionaryApplier, context);
  if (!v7) {
    int v7 = DataBuffer_Detach();
  }
  DataBuffer_Free();
  if (a3) {
    *a3 = v7;
  }
  return 0LL;
}

uint64_t _EasyConfigCreateTLVfromDictionaryApplier(uint64_t result, const __CFString *cf, uint64_t a3)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  if (!*(_DWORD *)(a3 + 568))
  {
    id v5 = (const void *)result;
    CFTypeID v6 = CFGetTypeID(cf);
    if (CFEqual(v5, @"adminPassword")
      || CFEqual(v5, @"bundleSeedID")
      || CFEqual(v5, @"countryCode")
      || CFEqual(v5, @"firmwareRevision")
      || CFEqual(v5, @"hardwareRevision")
      || CFEqual(v5, @"indoorOutdoorMode")
      || CFEqual(v5, @"language")
      || CFEqual(v5, @"manufacturer")
      || CFEqual(v5, @"model")
      || CFEqual(v5, @"name")
      || CFEqual(v5, @"operationType")
      || CFEqual(v5, @"playPassword")
      || CFEqual(v5, @"serialNumber")
      || CFEqual(v5, @"wifiEAPTLSCert")
      || CFEqual(v5, @"wifiPSK")
      || CFEqual(v5, @"wifiRouterCert")
      || CFEqual(v5, @"wifiSSID"))
    {
      if (v6 == CFStringGetTypeID())
      {
        buffer[0] = 0;
        if (!CFStringGetCString(cf, buffer, 256LL, 0x8000100u))
        {
LABEL_44:
          uint64_t result = 4294960559LL;
          goto LABEL_27;
        }

        goto LABEL_26;
      }

      if (v6 == CFDataGetTypeID())
      {
        CFDataGetBytePtr((CFDataRef)cf);
        CFDataGetLength((CFDataRef)cf);
LABEL_26:
        uint64_t result = DataBuffer_AppendIE();
LABEL_27:
        *(_DWORD *)(a3 + 568) = result;
        return result;
      }

      if (v6 == CFNumberGetTypeID())
      {
        *(void *)buffer = 0LL;
        CFNumberGetValue((CFNumberRef)cf, kCFNumberSInt64Type, buffer);
        if (*(void *)buffer > 0xFFuLL)
        {
          uint64_t result = 4294960586LL;
          goto LABEL_27;
        }

        goto LABEL_26;
      }

LABEL_33:
      uint64_t result = 4294960540LL;
      goto LABEL_27;
    }

    if (CFEqual(v5, @"mfiProtocols"))
    {
      if (v6 != CFArrayGetTypeID()) {
        goto LABEL_33;
      }
      CFIndex Count = CFArrayGetCount((CFArrayRef)cf);
      if (Count >= 1)
      {
        CFIndex v8 = Count;
        CFIndex v9 = 0LL;
        while (1)
        {
          ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex((CFArrayRef)cf, v9);
          CFTypeID v11 = CFGetTypeID(ValueAtIndex);
          if (v11 != CFStringGetTypeID()) {
            goto LABEL_33;
          }
          buffer[0] = 0;
          if (!CFStringGetCString(ValueAtIndex, buffer, 256LL, 0x8000100u)) {
            goto LABEL_44;
          }
          uint64_t result = DataBuffer_AppendIE();
          if (!(_DWORD)result && v8 != ++v9) {
            continue;
          }
          goto LABEL_27;
        }
      }
    }

    else if ((int)*MEMORY[0x18960EFC0] <= 50)
    {
      if (*MEMORY[0x18960EFC0] == -1)
      {
        uint64_t result = _LogCategory_Initialize();
        if (!(_DWORD)result) {
          goto LABEL_27;
        }
      }

      LogPrintF();
    }

    uint64_t result = 0LL;
    goto LABEL_27;
  }

  return result;
}

uint64_t BonjourBrowser_Create()
{
  return MEMORY[0x18960E828]();
}

uint64_t BonjourBrowser_SetDispatchQueue()
{
  return MEMORY[0x18960E830]();
}

uint64_t BonjourBrowser_SetEventHandlerBlock()
{
  return MEMORY[0x18960E838]();
}

uint64_t BonjourBrowser_Start()
{
  return MEMORY[0x18960E840]();
}

uint64_t BonjourBrowser_Stop()
{
  return MEMORY[0x18960E848]();
}

uint64_t BonjourDevice_GetDNSName()
{
  return MEMORY[0x18960E850]();
}

uint64_t BonjourDevice_GetDeviceID()
{
  return MEMORY[0x18960E858]();
}

uint64_t BonjourDevice_GetInt64()
{
  return MEMORY[0x18960E860]();
}

uint64_t BonjourDevice_Reconfirm()
{
  return MEMORY[0x18960E868]();
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

uint64_t CFCreateWithPlistBytes()
{
  return MEMORY[0x18960E870]();
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x189602A58](allocator, bytes, length);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x189602A98](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x189602AB0](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x189602AC8]();
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable( CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x189602BB8](allocator, capacity, keyCallBacks, valueCallBacks);
}

uint64_t CFDictionaryGetHardwareAddress()
{
  return MEMORY[0x18960E898]();
}

uint64_t CFDictionaryGetInt64()
{
  return MEMORY[0x18960E8A0]();
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x189602BF0]();
}

uint64_t CFDictionaryGetTypedValue()
{
  return MEMORY[0x18960E8C0]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x189602C00](theDict, key);
}

uint64_t CFDictionarySetInt64()
{
  return MEMORY[0x18960E8D0]();
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x189602C38](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x189602D30](cf);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x189602F08]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x189602F10](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFComparisonResult CFStringCompare( CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1896033C0](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateWithBytes( CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x189603450](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1896034F8](theString, buffer, bufferSize, *(void *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x189603590]();
}

uint64_t DataBuffer_AppendIE()
{
  return MEMORY[0x18960EAC8]();
}

uint64_t DataBuffer_Detach()
{
  return MEMORY[0x18960EAD0]();
}

uint64_t DataBuffer_Free()
{
  return MEMORY[0x18960EAD8]();
}

uint64_t DataBuffer_Init()
{
  return MEMORY[0x18960EAE0]();
}

uint64_t DebugGetErrorString()
{
  return MEMORY[0x18960EAE8]();
}

uint64_t HTTPClientCreate()
{
  return MEMORY[0x18960EB28]();
}

uint64_t HTTPClientInvalidate()
{
  return MEMORY[0x18960EB30]();
}

uint64_t HTTPClientSendMessage()
{
  return MEMORY[0x18960EB38]();
}

uint64_t HTTPClientSetDestination()
{
  return MEMORY[0x18960EB40]();
}

uint64_t HTTPClientSetDispatchQueue()
{
  return MEMORY[0x18960EB48]();
}

uint64_t HTTPClientSetFlags()
{
  return MEMORY[0x18960EB50]();
}

uint64_t HTTPClientSetLogging()
{
  return MEMORY[0x18960EB58]();
}

uint64_t HTTPClientSetTransportDelegate()
{
  return MEMORY[0x18960EB60]();
}

uint64_t HTTPHeader_InitRequest()
{
  return MEMORY[0x18960EB68]();
}

uint64_t HTTPHeader_InitRequestF()
{
  return MEMORY[0x18960EB70]();
}

uint64_t HTTPHeader_SetField()
{
  return MEMORY[0x18960EB78]();
}

uint64_t HTTPMessageCreate()
{
  return MEMORY[0x18960EB80]();
}

uint64_t HTTPMessageSetBody()
{
  return MEMORY[0x18960EB88]();
}

uint64_t HTTPMessageSetBodyLength()
{
  return MEMORY[0x18960EB90]();
}

uint64_t HTTPMessageSetCompletionBlock()
{
  return MEMORY[0x18960EB98]();
}

uint64_t IEGetVendorSpecific()
{
  return MEMORY[0x18960EBA8]();
}

uint64_t LogControl()
{
  return MEMORY[0x18960EBE8]();
}

uint64_t LogPrintF()
{
  return MEMORY[0x18960EBF0]();
}

uint64_t MFiSAP_Create()
{
  return MEMORY[0x18960EC10]();
}

uint64_t MFiSAP_Decrypt()
{
  return MEMORY[0x18960EC18]();
}

uint64_t MFiSAP_Delete()
{
  return MEMORY[0x18960EC20]();
}

uint64_t MFiSAP_Encrypt()
{
  return MEMORY[0x18960EC28]();
}

uint64_t MFiSAP_Exchange()
{
  return MEMORY[0x18960EC30]();
}

uint64_t NetTransportChaCha20Poly1305Configure()
{
  return MEMORY[0x18960ED08]();
}

uint64_t PairingSessionCreate()
{
  return MEMORY[0x18960EE10]();
}

uint64_t PairingSessionDeriveKey()
{
  return MEMORY[0x18960EE18]();
}

uint64_t PairingSessionExchange()
{
  return MEMORY[0x18960EE20]();
}

uint64_t PairingSessionSetFlags()
{
  return MEMORY[0x18960EE28]();
}

uint64_t PairingSessionSetKeychainInfo()
{
  return MEMORY[0x18960EE30]();
}

uint64_t PairingSessionSetLogging()
{
  return MEMORY[0x18960EE38]();
}

uint64_t PairingSessionSetSetupCode()
{
  return MEMORY[0x18960EE40]();
}

uint64_t TLV8Get()
{
  return MEMORY[0x18960EEF8]();
}

uint64_t TLV8GetNext()
{
  return MEMORY[0x18960EF00]();
}

uint64_t TLVParseSInt64()
{
  return MEMORY[0x18960EF08]();
}

const void *__cdecl TXTRecordGetValuePtr(uint16_t txtLen, const void *txtRecord, const char *key, uint8_t *valueLen)
{
  return (const void *)MEMORY[0x1895F8660](txtLen, txtRecord, key, valueLen);
}

uint64_t TextToSourceVersion()
{
  return MEMORY[0x18960EF38]();
}

uint64_t _LogCategory_Initialize()
{
  return MEMORY[0x18960EF70]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1895FAD80](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create( dispatch_source_type_t type, uintptr_t handle, unint64_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1895FAE50](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer( dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1895FAEE8](when, delta);
}

void free(void *a1)
{
}

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  return MEMORY[0x1895FBE68](__s, __smax, *(void *)&__c, __n);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1896165C0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1896165F0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x189616600]();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x189616728](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x189616730]();
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x189616838](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}