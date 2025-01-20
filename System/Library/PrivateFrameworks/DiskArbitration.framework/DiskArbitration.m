uint64_t _DAAuthorize()
{
  return 0LL;
}

void _DADispatchCallback( void *cf, int a2, uint64_t a3, unsigned int a4, const __CFData *a5, const __CFNumber *a6)
{
  v7 = a5;
  if (a5)
  {
    int v11 = CFGetAllocator(cf);
    v7 = (const __CFData *)_DADiskCreateFromSerialization(v11, cf, v7);
  }

  v12 = DAGetCallbackFromSession((char *)cf, a2);
  if (v12
    && (v13 = (const __CFDictionary *)v12,
        v14 = ___CFDictionaryGetIntegerValue((const __CFDictionary *)v12, @"DACallbackAddress"),
        v15 = ___CFDictionaryGetIntegerValue(v13, @"DACallbackContext"),
        unsigned int v16 = ___CFDictionaryGetIntegerValue(v13, @"DACallbackBlock"),
        v14))
  {
    switch(a4)
    {
      case 0u:
      case 4u:
        if (v16) {
          (*((void (**)(const __CFNumber *, const __CFData *))v14 + 2))(v14, v7);
        }
        else {
          ((void (*)(const __CFData *, const __CFNumber *))v14)(v7, v15);
        }
        break;
      case 1u:
      case 5u:
      case 7u:
      case 0xCu:
      case 0xDu:
        if (v16) {
          (*((void (**)(const __CFNumber *, const __CFData *, const __CFNumber *))v14 + 2))(v14, v7, a6);
        }
        else {
          ((void (*)(const __CFData *, const __CFNumber *, const __CFNumber *))v14)(v7, a6, v15);
        }
        goto LABEL_44;
      case 2u:
      case 6u:
      case 8u:
      case 0xEu:
        if (v16) {
          uint64_t v17 = (*((uint64_t (**)(const __CFNumber *, const __CFData *))v14 + 2))(v14, v7);
        }
        else {
          uint64_t v17 = ((uint64_t (*)(const __CFData *, const __CFNumber *))v14)(v7, v15);
        }
        v18 = (const void *)*MEMORY[0x189605018];
        if (v17) {
          v19 = (const void *)v17;
        }
        else {
          v19 = (const void *)*MEMORY[0x189605018];
        }
        if (!v19) {
          goto LABEL_42;
        }
        goto LABEL_30;
      case 3u:
        if (v16) {
          (*((void (**)(const __CFNumber *, const __CFData *, const __CFNumber *))v14 + 2))(v14, v7, a6);
        }
        else {
          ((void (*)(const __CFData *, const __CFNumber *, const __CFNumber *))v14)(v7, a6, v15);
        }
        break;
      case 9u:
        if (v16) {
          (*((void (**)(const __CFNumber *, const __CFData *))v14 + 2))(v14, v7);
        }
        else {
          ((void (*)(const __CFData *, const __CFNumber *))v14)(v7, v15);
        }
        v18 = (const void *)*MEMORY[0x189605018];
        v19 = (const void *)*MEMORY[0x189605018];
        if (!*MEMORY[0x189605018]) {
          goto LABEL_42;
        }
LABEL_30:
        int IntegerValue = ___CFNumberGetIntegerValue(a6);
        if (_DASessionGetID((uint64_t)cf)
          || !_DASessionIsKeepAlive((uint64_t)cf)
          || !_DASessionRecreate(cf))
        {
          v27 = v18;
          if (v19 == v18) {
            v21 = 0LL;
          }
          else {
            v21 = _DASerialize((const __CFAllocator *)*MEMORY[0x189604DB0]);
          }
          mach_port_t ID = _DASessionGetID((uint64_t)cf);
          v23 = (char *)_DADiskGetID((uint64_t)v7);
          if (v21)
          {
            int v26 = IntegerValue;
            BytePtr = CFDataGetBytePtr(v21);
            int Length = CFDataGetLength(v21);
            _DAServerSessionQueueResponse(ID, a2, a2, a4, v23, (uint64_t)BytePtr, Length, v26);
            CFRelease(v21);
          }

          else
          {
            _DAServerSessionQueueResponse(ID, a2, a2, a4, v23, 0LL, 0, IntegerValue);
          }

          v18 = v27;
        }

        if (v19 != v18) {
          CFRelease(v19);
        }
        goto LABEL_42;
      case 0xAu:
      case 0x11u:
        goto LABEL_44;
      case 0xFu:
        if (!v16) {
          goto LABEL_25;
        }
        (*((void (**)(const __CFNumber *))v14 + 2))(v14);
        break;
      case 0x10u:
LABEL_25:
        ((void (*)(const __CFNumber *))v14)(v15);
        break;
      default:
        break;
    }
  }

  else
  {
LABEL_42:
    if (a4 <= 0x11 && ((1 << a4) & 0x234A2) != 0) {
LABEL_44:
    }
      DARemoveCallbackFromSessionWithKey((uint64_t)cf, a2);
  }

  if (v7) {
    CFRelease(v7);
  }
}

uint64_t _DAInitialize()
{
  return pthread_once(&_DAInitialize_initialize, __DAInitialize);
}

void __DAInitialize()
{
  v0 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
  if (!Mutable) {
    __DAInitialize_cold_1();
  }
  v2 = Mutable;
  ___CFDictionarySetIntegerValue(Mutable, @"DAMediaSize", 0LL);
  kDADiskDescriptionMatchMediaUnformatted = v2;
  v3 = CFDictionaryCreateMutable(v0, 0LL, MEMORY[0x189605240], MEMORY[0x189605250]);
  if (!v3) {
    __DAInitialize_cold_2();
  }
  v4 = v3;
  v5 = (const void *)*MEMORY[0x189604DE8];
  CFDictionarySetValue(v3, @"DAMediaWhole", (const void *)*MEMORY[0x189604DE8]);
  kDADiskDescriptionMatchMediaWhole = v4;
  v6 = CFDictionaryCreateMutable(v0, 0LL, MEMORY[0x189605240], MEMORY[0x189605250]);
  if (!v6) {
    __DAInitialize_cold_3();
  }
  v7 = v6;
  CFDictionarySetValue(v6, @"DAVolumeMountable", v5);
  kDADiskDescriptionMatchVolumeMountable = v7;
  v8 = CFDictionaryCreateMutable(v0, 0LL, MEMORY[0x189605240], MEMORY[0x189605250]);
  if (!v8) {
    __DAInitialize_cold_4();
  }
  v9 = v8;
  CFDictionarySetValue(v8, @"DAVolumeMountable", (const void *)*MEMORY[0x189604DE0]);
  kDADiskDescriptionMatchVolumeUnrecognized = v9;
  v10 = CFArrayCreateMutable(v0, 0LL, MEMORY[0x189605228]);
  if (!v10) {
    __DAInitialize_cold_5();
  }
  int v11 = v10;
  CFArrayAppendValue(v10, @"DAVolumeName");
  kDADiskDescriptionWatchVolumeName = v11;
  v12 = CFArrayCreateMutable(v0, 0LL, MEMORY[0x189605228]);
  if (!v12) {
    __DAInitialize_cold_6();
  }
  v13 = v12;
  CFArrayAppendValue(v12, @"DAVolumePath");
  kDADiskDescriptionWatchVolumePath = v13;
}

void _DARegisterCallback( uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, uint64_t a5, const __CFDictionary *a6, CFMutableDataRef a7, unsigned int a8)
{
  if (!a1
    || !_DASessionGetID(a1)
    && _DASessionIsKeepAlive(a1)
    && _DASessionRecreate(a1))
  {
    return;
  }

  unsigned int v16 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  if (a6) {
    a6 = _DASerializeDiskDescription((const __CFAllocator *)*MEMORY[0x189604DB0], a6);
  }
  if (a7) {
    a7 = _DASerialize(v16);
  }
  CFMutableDictionaryRef v17 = DACallbackCreate(v16, a2, a3, a4, a5, a6, a7, a8);
  int v18 = DAAddCallbackToSession(a1, v17);
  CFRelease(v17);
  mach_port_t ID = _DASessionGetID(a1);
  uint64_t v20 = v18;
  if (!a6)
  {
    BytePtr = 0LL;
    int Length = 0;
    if (a7) {
      goto LABEL_11;
    }
LABEL_13:
    v23 = 0LL;
    int v24 = 0;
    goto LABEL_14;
  }

  BytePtr = CFDataGetBytePtr(a6);
  int Length = CFDataGetLength(a6);
  if (!a7) {
    goto LABEL_13;
  }
LABEL_11:
  v23 = CFDataGetBytePtr(a7);
  int v24 = CFDataGetLength(a7);
LABEL_14:
  _DAServerSessionRegisterCallback(ID, v20, v20, a4, a5, (uint64_t)BytePtr, Length, (uint64_t)v23, v24);
  if (a6) {
    CFRelease(a6);
  }
  if (a7) {
    CFRelease(a7);
  }
}

uint64_t _DAUnregisterCallback(uint64_t result, const __CFNumber *a2, const __CFNumber *a3)
{
  if (result)
  {
    uint64_t v5 = result;
    if (_DASessionGetID(result)
      || !_DASessionIsKeepAlive(v5)
      || (result = _DASessionRecreate(v5), !(_DWORD)result))
    {
      int v6 = DARemoveCallbackFromSession(v5, a2, a3);
      mach_port_t ID = _DASessionGetID(v5);
      return _DAServerSessionUnregisterCallback(ID, v6, v6);
    }
  }

  return result;
}

void DADiskClaimCommon( uint64_t a1, int a2, uint64_t a3, uint64_t a4, void (**a5)(void, void, void), uint64_t a6, unsigned int a7)
{
  int v11 = (CFAllocatorRef *)MEMORY[0x189604DB0];
  if (!a1)
  {
    DAReturn v20 = -119930877;
    if (!a5) {
      return;
    }
    goto LABEL_9;
  }

  v13 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  CFMutableDictionaryRef v14 = DACallbackCreate((const __CFAllocator *)*MEMORY[0x189604DB0], a3, a4, 0xFFFFFFFF, 0LL, 0LL, 0LL, a7);
  uint64_t Session = _DADiskGetSession(a1);
  int v16 = DAAddCallbackToSession(Session, v14);
  CFRelease(v14);
  CFMutableDictionaryRef v17 = ___CFNumberCreateWithIntegerValue(v13, v16);
  int v18 = ___CFNumberCreateWithIntegerValue(v13, v16);
  uint64_t v19 = _DADiskGetSession(a1);
  DAReturn v20 = __DAQueueRequest(v19, 1, a1, a2, v17, v18, (uint64_t)a5, a6, a7);
  if (v17) {
    CFRelease(v17);
  }
  if (v18) {
    CFRelease(v18);
  }
  if (a5)
  {
LABEL_9:
    if (v20)
    {
      DADissenterRef v21 = DADissenterCreate(*v11, v20, 0LL);
      if (a7)
      {
        ((void (**)(void, uint64_t, DADissenterRef))a5)[2](a5, a1, v21);
        _Block_release(a5);
      }

      else
      {
        ((void (*)(uint64_t, DADissenterRef, uint64_t))a5)(a1, v21, a6);
      }

      CFRelease(v21);
    }
  }
}

uint64_t __DAQueueRequest( uint64_t a1, int a2, uint64_t a3, int a4, const __CFData *a5, const __CFData *a6, uint64_t a7, uint64_t a8, unsigned __int8 a9)
{
  uint64_t v9 = 4175036419LL;
  if (!a1
    || !_DASessionGetID(a1)
    && _DASessionIsKeepAlive(a1)
    && _DASessionRecreate(a1))
  {
    return v9;
  }

  int v18 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  if (a5) {
    a5 = _DASerialize((const __CFAllocator *)*MEMORY[0x189604DB0]);
  }
  if (a6) {
    a6 = _DASerialize(v18);
  }
  CFMutableDictionaryRef v19 = DACallbackCreate(v18, a7, a8, 0xFFFFFFFF, 0LL, 0LL, 0LL, a9);
  int v20 = DAAddCallbackToSession(a1, v19);
  CFRelease(v19);
  mach_port_t ID = _DASessionGetID(a1);
  v22 = (char *)_DADiskGetID(a3);
  if (!a5)
  {
    BytePtr = 0LL;
    int Length = 0;
    if (a6) {
      goto LABEL_11;
    }
LABEL_13:
    v25 = 0LL;
    int v26 = 0;
    goto LABEL_14;
  }

  BytePtr = CFDataGetBytePtr(a5);
  int Length = CFDataGetLength(a5);
  if (!a6) {
    goto LABEL_13;
  }
LABEL_11:
  v25 = CFDataGetBytePtr(a6);
  int v26 = CFDataGetLength(a6);
LABEL_14:
  uint64_t v9 = _DAServerSessionQueueRequest(ID, a2, v22, a4, (uint64_t)BytePtr, Length, (uint64_t)v25, v26, v20, v20);
  if (a5) {
    CFRelease(a5);
  }
  if (a6) {
    CFRelease(a6);
  }
  return v9;
}

void DADiskClaim( DADiskRef disk, DADiskClaimOptions options, DADiskClaimReleaseCallback release, void *releaseContext, DADiskClaimCallback callback, void *callbackContext)
{
}

void DADiskEjectCommon( uint64_t a1, int a2, void (**a3)(void, void, void), uint64_t a4, int a5)
{
  if (a1)
  {
    _DADiskGetSession(a1);
    uint64_t Session = _DADiskGetSession(a1);
    DAReturn v11 = __DAQueueRequest(Session, 5, a1, a2, 0LL, 0LL, (uint64_t)a3, a4, a5);
    if (!a3) {
      return;
    }
  }

  else
  {
    DAReturn v11 = -119930877;
    if (!a3) {
      return;
    }
  }

  if (v11)
  {
    DADissenterRef v12 = DADissenterCreate((CFAllocatorRef)*MEMORY[0x189604DB0], v11, 0LL);
    if (a5)
    {
      ((void (**)(void, uint64_t, DADissenterRef))a3)[2](a3, a1, v12);
      _Block_release(a3);
    }

    else
    {
      ((void (*)(uint64_t, DADissenterRef, uint64_t))a3)(a1, v12, a4);
    }

    CFRelease(v12);
  }

void DADiskEject(DADiskRef disk, DADiskEjectOptions options, DADiskEjectCallback callback, void *context)
{
}

Boolean DADiskIsClaimed(DADiskRef disk)
{
  int v7 = 0;
  if (!disk) {
    return 0;
  }
  uint64_t Session = _DADiskGetSession((uint64_t)disk);
  if (!_DADiskGetSessionID((uint64_t)disk)
    && _DASessionIsKeepAlive(Session)
    && _DASessionRecreate(Session))
  {
    return 0;
  }

  Sessionmach_port_t ID = _DADiskGetSessionID((uint64_t)disk);
  mach_port_t ID = (const char *)_DADiskGetID((uint64_t)disk);
  _DAServerDiskIsClaimed(SessionID, ID, &v7);
  return v7;
}

void DADiskMount( DADiskRef disk, CFURLRef path, DADiskMountOptions options, DADiskMountCallback callback, void *context)
{
}

void DADiskMountWithArguments( DADiskRef disk, CFURLRef path, DADiskMountOptions options, DADiskMountCallback callback, void *context, CFStringRef *arguments)
{
}

void DADiskMountWithArgumentsCommon( uint64_t a1, const __CFURL *a2, int a3, void (**a4)(void, void, void), uint64_t a5, uint64_t a6, int a7)
{
  if (!a6 || !*(void *)a6)
  {
    MutableCopy = 0LL;
    goto LABEL_10;
  }

  if (*(void *)(a6 + 8))
  {
    MutableCopy = CFStringCreateMutableCopy((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, *(CFStringRef *)a6);
    if (MutableCopy && *(void *)(a6 + 8))
    {
      v15 = (void *)(a6 + 16);
      do
      {
        CFStringAppend(MutableCopy, @",");
        CFStringAppend(MutableCopy, (CFStringRef)*(v15 - 1));
      }

      while (*v15++);
    }

LABEL_10:
    if (a2) {
      goto LABEL_11;
    }
LABEL_29:
    CFMutableDictionaryRef v17 = 0LL;
    if (a1) {
      goto LABEL_14;
    }
    goto LABEL_30;
  }

  MutableCopy = (__CFString *)CFRetain(*(CFTypeRef *)a6);
  if (!a2) {
    goto LABEL_29;
  }
LABEL_11:
  CFMutableDictionaryRef v17 = CFURLCopyAbsoluteURL(a2);
  if (!v17)
  {
    CFRetain(a2);
    CFMutableDictionaryRef v17 = a2;
  }

  if (a1)
  {
LABEL_14:
    _DADiskGetSession(a1);
    uint64_t Session = _DADiskGetSession(a1);
    if (v17) {
      CFMutableDictionaryRef v19 = (const __CFData *)CFURLGetString(v17);
    }
    else {
      CFMutableDictionaryRef v19 = 0LL;
    }
    DAReturn v20 = __DAQueueRequest(Session, 7, a1, a3, v19, (const __CFData *)MutableCopy, (uint64_t)a4, a5, a7);
    if (MutableCopy) {
      goto LABEL_18;
    }
    goto LABEL_19;
  }

LABEL_30:
  DAReturn v20 = -119930877;
  if (MutableCopy) {
LABEL_18:
  }
    CFRelease(MutableCopy);
LABEL_19:
  if (v17) {
    CFRelease(v17);
  }
  if (a4 && v20)
  {
    DADissenterRef v21 = DADissenterCreate((CFAllocatorRef)*MEMORY[0x189604DB0], v20, 0LL);
    if (a7)
    {
      ((void (**)(void, uint64_t, DADissenterRef))a4)[2](a4, a1, v21);
      _Block_release(a4);
    }

    else
    {
      ((void (*)(uint64_t, DADissenterRef, uint64_t))a4)(a1, v21, a5);
    }

    CFRelease(v21);
  }

void DADiskRenameCommon( uint64_t a1, CFTypeRef cf, int a3, void (**a4)(void, void, void), uint64_t a5, int a6)
{
  DAReturn v10 = -119930877;
  if (a1)
  {
    if (cf)
    {
      CFTypeID v13 = CFGetTypeID(cf);
      if (v13 == CFStringGetTypeID())
      {
        _DADiskGetSession(a1);
        uint64_t Session = _DADiskGetSession(a1);
        DAReturn v10 = __DAQueueRequest(Session, 12, a1, a3, (const __CFData *)cf, 0LL, (uint64_t)a4, a5, a6);
      }
    }
  }

  if (a4 && v10)
  {
    DADissenterRef v15 = DADissenterCreate((CFAllocatorRef)*MEMORY[0x189604DB0], v10, 0LL);
    if (a6)
    {
      ((void (**)(void, uint64_t, DADissenterRef))a4)[2](a4, a1, v15);
      _Block_release(a4);
    }

    else
    {
      ((void (*)(uint64_t, DADissenterRef, uint64_t))a4)(a1, v15, a5);
    }

    CFRelease(v15);
  }

void DADiskRename( DADiskRef disk, CFStringRef name, DADiskRenameOptions options, DADiskRenameCallback callback, void *context)
{
}

void DADiskUnmountCommon( uint64_t a1, int a2, void (**a3)(void, void, void), uint64_t a4, int a5)
{
  if (a1)
  {
    _DADiskGetSession(a1);
    uint64_t Session = _DADiskGetSession(a1);
    DAReturn v11 = __DAQueueRequest(Session, 13, a1, a2, 0LL, 0LL, (uint64_t)a3, a4, a5);
    if (!a3) {
      return;
    }
  }

  else
  {
    DAReturn v11 = -119930877;
    if (!a3) {
      return;
    }
  }

  if (v11)
  {
    DADissenterRef v12 = DADissenterCreate((CFAllocatorRef)*MEMORY[0x189604DB0], v11, 0LL);
    if (a5)
    {
      ((void (**)(void, uint64_t, DADissenterRef))a3)[2](a3, a1, v12);
      _Block_release(a3);
    }

    else
    {
      ((void (*)(uint64_t, DADissenterRef, uint64_t))a3)(a1, v12, a4);
    }

    CFRelease(v12);
  }

void DADiskUnmount(DADiskRef disk, DADiskUnmountOptions options, DADiskUnmountCallback callback, void *context)
{
}

void DARegisterDiskAppearedCallback( DASessionRef session, CFDictionaryRef match, DADiskAppearedCallback callback, void *context)
{
}

void DARegisterDiskDescriptionChangedCallback( DASessionRef session, CFDictionaryRef match, CFArrayRef watch, DADiskDescriptionChangedCallback callback, void *context)
{
}

void DARegisterDiskDisappearedCallback( DASessionRef session, CFDictionaryRef match, DADiskDisappearedCallback callback, void *context)
{
}

void DARegisterDiskEjectApprovalCallback( DASessionRef session, CFDictionaryRef match, DADiskEjectApprovalCallback callback, void *context)
{
}

void DARegisterDiskPeekCallback( DASessionRef session, CFDictionaryRef match, CFIndex order, DADiskPeekCallback callback, void *context)
{
}

void DARegisterDiskMountApprovalCallback( DASessionRef session, CFDictionaryRef match, DADiskMountApprovalCallback callback, void *context)
{
}

void DARegisterDiskUnmountApprovalCallback( DASessionRef session, CFDictionaryRef match, DADiskUnmountApprovalCallback callback, void *context)
{
}

void DADiskUnclaim(DADiskRef disk)
{
  if (disk)
  {
    uint64_t Session = _DADiskGetSession((uint64_t)disk);
    if (_DADiskGetSessionID((uint64_t)disk)
      || !_DASessionIsKeepAlive(Session)
      || !_DASessionRecreate(Session))
    {
      Sessionmach_port_t ID = _DADiskGetSessionID((uint64_t)disk);
      mach_port_t ID = (const char *)_DADiskGetID((uint64_t)disk);
      _DAServerDiskUnclaim(SessionID, ID);
    }
  }

uint64_t _DADiskSetAdoption(uint64_t a1, int a2)
{
  uint64_t result = _DAAuthorize();
  if (!(_DWORD)result)
  {
    Sessionmach_port_t ID = _DADiskGetSessionID(a1);
    mach_port_t ID = (const char *)_DADiskGetID(a1);
    return _DAServerDiskSetAdoption(SessionID, ID, a2);
  }

  return result;
}

uint64_t _DADiskSetEncoding(uint64_t a1, int a2)
{
  uint64_t result = _DAAuthorize();
  if (!(_DWORD)result)
  {
    Sessionmach_port_t ID = _DADiskGetSessionID(a1);
    mach_port_t ID = (const char *)_DADiskGetID(a1);
    return _DAServerDiskSetEncoding(SessionID, ID, a2);
  }

  return result;
}

void DARegisterIdleCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

void DARegisterDiskListCompleteCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

void DARegisterIdleCallbackWithBlock(uint64_t a1, void *aBlock)
{
  v3 = _Block_copy(aBlock);
  _DARegisterCallback(a1, (uint64_t)v3, 0LL, 0xFu, 0LL, 0LL, 0LL, 1u);
}

void DARegisterDiskAppearedCallbackBlock(uint64_t a1, const __CFDictionary *a2, void *aBlock)
{
  uint64_t v5 = _Block_copy(aBlock);
  _DARegisterCallback(a1, (uint64_t)v5, 0LL, 0, 0LL, a2, 0LL, 1u);
}

void DARegisterDiskDescriptionChangedCallbackBlock( uint64_t a1, const __CFDictionary *a2, __CFData *a3, void *aBlock)
{
  int v7 = _Block_copy(aBlock);
  _DARegisterCallback(a1, (uint64_t)v7, 0LL, 3u, 0LL, a2, a3, 1u);
}

void DARegisterDiskDisappearedCallbackBlock(uint64_t a1, const __CFDictionary *a2, void *aBlock)
{
  uint64_t v5 = _Block_copy(aBlock);
  _DARegisterCallback(a1, (uint64_t)v5, 0LL, 4u, 0LL, a2, 0LL, 1u);
}

void DARegisterDiskEjectApprovalCallbackBlock(uint64_t a1, const __CFDictionary *a2, void *aBlock)
{
  uint64_t v5 = _Block_copy(aBlock);
  _DARegisterCallback(a1, (uint64_t)v5, 0LL, 6u, 0LL, a2, 0LL, 1u);
}

void DARegisterDiskPeekCallbackBlock(uint64_t a1, const __CFDictionary *a2, uint64_t a3, void *aBlock)
{
  int v7 = _Block_copy(aBlock);
  _DARegisterCallback(a1, (uint64_t)v7, 0LL, 9u, a3, a2, 0LL, 1u);
}

void DARegisterDiskMountApprovalCallbackBlock(uint64_t a1, const __CFDictionary *a2, void *aBlock)
{
  uint64_t v5 = _Block_copy(aBlock);
  _DARegisterCallback(a1, (uint64_t)v5, 0LL, 8u, 0LL, a2, 0LL, 1u);
}

void DARegisterDiskUnmountApprovalCallbackBlock(uint64_t a1, const __CFDictionary *a2, void *aBlock)
{
  uint64_t v5 = _Block_copy(aBlock);
  _DARegisterCallback(a1, (uint64_t)v5, 0LL, 0xEu, 0LL, a2, 0LL, 1u);
}

void DADiskMountWithBlock(uint64_t a1, const __CFURL *a2, int a3, void *aBlock)
{
  int v7 = _Block_copy(aBlock);
  DADiskMountWithArgumentsCommon(a1, a2, a3, (void (**)(void, void, void))v7, 0LL, 0LL, 1);
}

void DADiskMountWithArgumentsAndBlock(uint64_t a1, const __CFURL *a2, int a3, void *aBlock, uint64_t a5)
{
  uint64_t v9 = _Block_copy(aBlock);
  DADiskMountWithArgumentsCommon(a1, a2, a3, (void (**)(void, void, void))v9, 0LL, a5, 1);
}

void DADiskRenameWithBlock(uint64_t a1, const void *a2, int a3, void *aBlock)
{
  int v7 = _Block_copy(aBlock);
  DADiskRenameCommon(a1, a2, a3, (void (**)(void, void, void))v7, 0LL, 1);
}

void DADiskUnmountWithBlock(uint64_t a1, int a2, void *aBlock)
{
  uint64_t v5 = _Block_copy(aBlock);
  DADiskUnmountCommon(a1, a2, (void (**)(void, void, void))v5, 0LL, 1);
}

void DADiskEjectWithBlock(uint64_t a1, int a2, void *aBlock)
{
  uint64_t v5 = _Block_copy(aBlock);
  DADiskEjectCommon(a1, a2, (void (**)(void, void, void))v5, 0LL, 1);
}

void DADiskClaimWithBlock(uint64_t a1, int a2, void *aBlock, const void *a4)
{
  int v7 = _Block_copy(aBlock);
  v8 = _Block_copy(a4);
  DADiskClaimCommon(a1, a2, (uint64_t)v7, 0LL, (void (**)(void, void, void))v8, 0LL, 1u);
}

void *_DADiskCreate(uint64_t a1, const void *a2, const char *a3)
{
  if (!a2) {
    return 0LL;
  }
  Instance = (void *)_CFRuntimeCreateInstance();
  if (Instance)
  {
    CFRetain(a2);
    Instance[2] = 0LL;
    Instance[3] = 0LL;
    Instance[4] = strdup(a3);
    Instance[5] = a2;
    if (!strncmp(a3, "/dev/", 5uLL)) {
      Instance[3] = strdup(a3 + 5);
    }
  }

  return Instance;
}

void *_DADiskCreateFromSerialization(int a1, CFTypeRef cf, const __CFData *a3)
{
  if (!a3) {
    return 0LL;
  }
  uint64_t v5 = CFGetAllocator(cf);
  int v6 = _DAUnserializeDiskDescription(v5, a3);
  if (!v6) {
    return 0LL;
  }
  int v7 = v6;
  Value = (const __CFData *)CFDictionaryGetValue(v6, @"DADiskID");
  if (Value && (BytePtr = CFDataGetBytePtr(Value)) != 0LL)
  {
    DAReturn v10 = (const char *)BytePtr;
    CFAllocatorRef v11 = CFGetAllocator(cf);
    DADissenterRef v12 = _DADiskCreate((uint64_t)v11, cf, v10);
    if (v12)
    {
      CFDictionaryRemoveValue(v7, @"DADiskID");
      v12[2] = CFRetain(v7);
    }
  }

  else
  {
    DADissenterRef v12 = 0LL;
  }

  CFRelease(v7);
  return v12;
}

uint64_t _DADiskGetID(uint64_t a1)
{
  return *(void *)(a1 + 32);
}

uint64_t _DADiskGetSession(uint64_t a1)
{
  return *(void *)(a1 + 40);
}

uint64_t _DADiskGetSessionID(uint64_t a1)
{
  return _DASessionGetID(*(void *)(a1 + 40));
}

uint64_t _DADiskInitialize()
{
  uint64_t result = _CFRuntimeRegisterClass();
  __kDADiskTypemach_port_t ID = result;
  return result;
}

void _DADiskSetDescription(uint64_t a1, CFTypeRef cf)
{
  v4 = *(const void **)(a1 + 16);
  if (v4)
  {
    CFRelease(v4);
    *(void *)(a1 + 16) = 0LL;
  }

  if (cf)
  {
    CFRetain(cf);
    *(void *)(a1 + 16) = cf;
  }

CFDictionaryRef DADiskCopyDescription(DADiskRef disk)
{
  DADiskRef v1 = disk;
  if (disk)
  {
    v2 = (const void *)*((void *)disk + 2);
    if (v2)
    {
      CFRetain(v2);
      return (CFDictionaryRef)*((void *)v1 + 2);
    }

    else
    {
      mach_port_t ID = _DASessionGetID(*((void *)v1 + 5));
      if (_DAServerDiskCopyDescription(ID, *((const char **)v1 + 4), &v7, &v6))
      {
        return 0LL;
      }

      else
      {
        v4 = CFGetAllocator(v1);
        DADiskRef v1 = _DAUnserializeDiskDescriptionWithBytes(v4, v7, v6);
        CFDictionaryRemoveValue(v1, @"DADiskID");
        MEMORY[0x1895BF194](*MEMORY[0x1895FBBE0], v7, v6);
      }
    }
  }

  return v1;
}

io_service_t DADiskCopyIOMedia(DADiskRef disk)
{
  if (!disk) {
    return 0;
  }
  DADiskRef v1 = (const char *)*((void *)disk + 3);
  if (!v1) {
    return 0;
  }
  mach_port_t v2 = *MEMORY[0x1896086B0];
  v3 = IOBSDNameMatching(*MEMORY[0x1896086B0], 0, v1);
  return IOServiceGetMatchingService(v2, v3);
}

DADiskRef DADiskCopyWholeDisk(DADiskRef disk)
{
  DADiskRef v1 = (DASessionRef *)disk;
  if (disk)
  {
    io_service_t v2 = DADiskCopyIOMedia(disk);
    if (v2)
    {
      io_registry_entry_t v3 = v2;
      CFTypeRef v4 = (CFTypeRef)*MEMORY[0x189604DE8];
      do
      {
        io_registry_entry_t parent = 0;
        if (IOObjectConformsTo(v3, "IOMedia"))
        {
          uint64_t v5 = CFGetAllocator(v1);
          CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(v3, @"Whole", v5, 0);
          if (CFProperty)
          {
            if (CFProperty == v4)
            {
              v8 = CFGetAllocator(v1);
              DADiskRef v1 = (DASessionRef *)DADiskCreateFromIOMedia(v8, v1[5], v3);
              IOObjectRelease(v3);
              CFRelease(v4);
              return (DADiskRef)v1;
            }

            CFRelease(CFProperty);
          }
        }

        IORegistryEntryGetParentEntry(v3, "IOService", &parent);
        IOObjectRelease(v3);
        io_registry_entry_t v3 = parent;
      }

      while (parent);
    }

    return 0LL;
  }

  return (DADiskRef)v1;
}

DADiskRef DADiskCreateFromIOMedia(CFAllocatorRef allocator, DASessionRef session, io_service_t media)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  if (!media) {
    return 0LL;
  }
  CFTypeRef CFProperty = (const __CFString *)IORegistryEntryCreateCFProperty(media, @"BSD Name", allocator, 0);
  if (!CFProperty) {
    return 0LL;
  }
  unsigned int v6 = CFProperty;
  CFStringGetCString(CFProperty, buffer, 1024LL, 0x8000100u);
  int v7 = DADiskCreateFromBSDName(allocator, session, buffer);
  CFRelease(v6);
  return v7;
}

DADiskRef DADiskCreateFromBSDName(CFAllocatorRef allocator, DASessionRef session, const char *name)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  if (!name) {
    return 0LL;
  }
  unsigned int v6 = strstr(name, "://disk");
  if (!v6)
  {
    if (!strncmp(name, "/dev/", 5uLL))
    {
      __strlcpy_chk();
      return (DADiskRef)_DADiskCreate((uint64_t)allocator, session, __s);
    }

    __strlcpy_chk();
    goto LABEL_8;
  }

  if (strchr(v6 + 3, 47))
  {
    __strlcpy_chk();
    strlen(__s);
LABEL_8:
    __strlcat_chk();
  }

  return (DADiskRef)_DADiskCreate((uint64_t)allocator, session, __s);
}

DADiskRef DADiskCreateFromVolumePath(CFAllocatorRef allocator, DASessionRef session, CFURLRef path)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  if (!path) {
    return 0LL;
  }
  uint64_t v5 = ___CFURLCopyFileSystemRepresentation(path);
  if (!v5) {
    return 0LL;
  }
  unsigned int v6 = (char *)v5;
  if (___statfs((const char *)v5, v12, 2)
    && (!realpath_DARWIN_EXTSN(v6, v11) || ___statfs(v11, v12, 2))
    || (int v7 = _DAVolumeCopyID((uint64_t)v12)) == 0LL)
  {
    uint64_t v9 = 0LL;
  }

  else
  {
    v8 = v7;
    uint64_t v9 = (__DADisk *)_DADiskCreate((uint64_t)allocator, session, v7);
    free(v8);
  }

  free(v6);
  return v9;
}

const char *__cdecl DADiskGetBSDName(const char *disk)
{
  if (disk) {
    return (const char *)*((void *)disk + 3);
  }
  return disk;
}

CFTypeID DADiskGetTypeID(void)
{
  return __kDADiskTypeID;
}

void __DADiskDeallocate(void *a1)
{
  io_service_t v2 = (const void *)a1[2];
  if (v2) {
    CFRelease(v2);
  }
  io_registry_entry_t v3 = (void *)a1[3];
  if (v3) {
    free(v3);
  }
  CFTypeRef v4 = (void *)a1[4];
  if (v4) {
    free(v4);
  }
  uint64_t v5 = (const void *)a1[5];
  if (v5) {
    CFRelease(v5);
  }
}

BOOL __DADiskEqual(uint64_t a1, uint64_t a2)
{
  return strcmp(*(const char **)(a1 + 32), *(const char **)(a2 + 32)) == 0;
}

uint64_t __DADiskHash(uint64_t a1)
{
  return CFHashBytes();
}

CFStringRef __DADiskCopyFormattingDescription(void *a1)
{
  io_service_t v2 = CFGetAllocator(a1);
  return CFStringCreateWithFormat(v2, 0LL, @"%s", a1[4]);
}

CFStringRef __DADiskCopyDescription(void *a1)
{
  io_service_t v2 = CFGetAllocator(a1);
  CFAllocatorRef v3 = CFGetAllocator(a1);
  return CFStringCreateWithFormat(v2, 0LL, @"<DADisk %p [%p]>{id = %s}", a1, v3, a1[4]);
}

DADissenterRef DADissenterCreate(CFAllocatorRef allocator, DAReturn status, CFStringRef string)
{
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(allocator, 0LL, MEMORY[0x189605240], MEMORY[0x189605250]);
  if (Mutable)
  {
    pid_t v6 = getpid();
    ___CFDictionarySetIntegerValue(Mutable, @"DAProcessID", v6);
    ___CFDictionarySetIntegerValue(Mutable, @"DAStatus", status);
    if (string) {
      CFDictionarySetValue(Mutable, @"DAStatusString", string);
    }
  }

  return Mutable;
}

CFNumberRef DADissenterGetProcessID(const __CFDictionary *a1)
{
  return ___CFDictionaryGetIntegerValue(a1, @"DAProcessID");
}

DAReturn DADissenterGetStatus(DADissenterRef dissenter)
{
  return ___CFDictionaryGetIntegerValue(dissenter, @"DAStatus");
}

CFStringRef DADissenterGetStatusString(DADissenterRef dissenter)
{
  return (CFStringRef)CFDictionaryGetValue(dissenter, @"DAStatusString");
}

uint64_t ___statfs(const char *a1, void *a2, int a3)
{
  int v6 = getfsstat(0LL, 0, 2);
  if (v6 < 1) {
    return 0xFFFFFFFFLL;
  }
  int v7 = 2168 * v6;
  v8 = (statfs *)malloc(2168LL * v6);
  if (!v8) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v9 = v8;
  int v10 = getfsstat(v8, v7, a3);
  if (v10 < 1)
  {
    uint64_t v13 = 0xFFFFFFFFLL;
  }

  else
  {
    uint64_t v11 = v10;
    f_mntonname = v9->f_mntonname;
    uint64_t v13 = 0xFFFFFFFFLL;
    do
    {
      if (!strcmp(f_mntonname, a1))
      {
        memcpy(a2, f_mntonname - 88, 0x878uLL);
        int v14 = *((_DWORD *)f_mntonname - 8);
        uint64_t v13 = 0LL;
        if (v14 == geteuid()) {
          break;
        }
      }

      f_mntonname += 2168;
      --v11;
    }

    while (v11);
  }

  free(v9);
  return v13;
}

uint64_t ___CFArrayContainsValue(const __CFArray *a1, const void *a2)
{
  v5.length = CFArrayGetCount(a1);
  v5.location = 0LL;
  return CFArrayContainsValue(a1, v5, a2);
}

BOOL ___CFArrayContainsString(const __CFArray *a1, const __CFString *a2)
{
  CFIndex Count = CFArrayGetCount(a1);
  if (Count < 1)
  {
    return 0;
  }

  else
  {
    CFIndex v5 = Count;
    CFIndex v6 = 0LL;
    BOOL v7 = 1;
    do
    {
      ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(a1, v6);
      CFTypeID v9 = CFGetTypeID(ValueAtIndex);
      if (v9 == CFStringGetTypeID() && CFStringCompare(ValueAtIndex, a2, 1uLL) == kCFCompareEqualTo) {
        break;
      }
      BOOL v7 = v5 > ++v6;
    }

    while (v5 != v6);
  }

  return v7;
}

void ___CFArrayRemoveValue(const __CFArray *a1, const void *a2)
{
  v5.length = CFArrayGetCount(a1);
  v5.location = 0LL;
  CFIndex FirstIndexOfValue = CFArrayGetFirstIndexOfValue(a1, v5, a2);
  if (FirstIndexOfValue != -1) {
    CFArrayRemoveValueAtIndex(a1, FirstIndexOfValue);
  }
}

vm_address_t ___CFDataCopyBytes(const __CFData *a1, unsigned int *a2)
{
  vm_address_t address = 0LL;
  unsigned int Length = CFDataGetLength(a1);
  *a2 = Length;
  vm_allocate(*MEMORY[0x1895FBBE0], &address, Length, 1);
  CFRange v5 = (void *)address;
  if (!address) {
    return 0LL;
  }
  BytePtr = CFDataGetBytePtr(a1);
  memmove(v5, BytePtr, *a2);
  return address;
}

CFNumberRef ___CFDictionaryGetIntegerValue(const __CFDictionary *a1, const void *a2)
{
  uint64_t valuePtr = 0LL;
  uint64_t result = (const __CFNumber *)CFDictionaryGetValue(a1, a2);
  if (result)
  {
    CFNumberGetValue(result, kCFNumberSInt64Type, &valuePtr);
    return (const __CFNumber *)valuePtr;
  }

  return result;
}

void ___CFDictionarySetIntegerValue(void *a1, const void *a2, uint64_t a3)
{
  uint64_t valuePtr = a3;
  CFRange v5 = CFGetAllocator(a1);
  CFNumberRef v6 = CFNumberCreate(v5, kCFNumberSInt64Type, &valuePtr);
  if (v6)
  {
    CFNumberRef v7 = v6;
    CFDictionarySetValue((CFMutableDictionaryRef)a1, a2, v6);
    CFRelease(v7);
  }

CFNumberRef ___CFNumberCreateWithIntegerValue(const __CFAllocator *a1, uint64_t a2)
{
  uint64_t valuePtr = a2;
  return CFNumberCreate(a1, kCFNumberSInt64Type, &valuePtr);
}

CFNumberRef ___CFNumberGetIntegerValue(const __CFNumber *result)
{
  uint64_t valuePtr = 0LL;
  if (result)
  {
    DADiskRef v1 = result;
    CFTypeID v2 = CFGetTypeID(result);
    if (v2 == CFNumberGetTypeID())
    {
      CFNumberGetValue(v1, kCFNumberSInt64Type, &valuePtr);
      return (const __CFNumber *)valuePtr;
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

UInt8 *___CFStringCopyCString(const __CFString *a1)
{
  if (!a1) {
    return 0LL;
  }
  CFIndex Length = CFStringGetLength(a1);
  v7.location = 0LL;
  v7.length = Length;
  if (!CFStringGetBytes(a1, v7, 0x8000100u, 0, 0, 0LL, 0LL, &usedBufLen)) {
    return 0LL;
  }
  CFIndex v3 = usedBufLen;
  CFTypeRef v4 = (UInt8 *)malloc(usedBufLen + 1);
  if (v4)
  {
    v8.location = 0LL;
    v8.length = Length;
    CFStringGetBytes(a1, v8, 0x8000100u, 0, 0, v4, v3, 0LL);
    v4[usedBufLen] = 0;
  }

  return v4;
}

UInt8 *___CFURLCopyFileSystemRepresentation(const __CFURL *a1)
{
  if (!a1) {
    return 0LL;
  }
  DADiskRef v1 = CFURLCopyFileSystemPath(a1, kCFURLPOSIXPathStyle);
  if (!v1) {
    return 0LL;
  }
  CFTypeID v2 = v1;
  CFIndex v3 = ___CFStringCopyCString(v1);
  CFRelease(v2);
  return v3;
}

const char *_DACallbackKindGetName(unsigned int a1)
{
  if (a1 > 0x11) {
    return "Unknown Kind";
  }
  else {
    return __kDAKindNameList[a1];
  }
}

CFMutableDataRef _DASerialize(const __CFAllocator *a1)
{
  CFMutableDataRef Mutable = CFDataCreateMutable(a1, 0LL);
  if (Mutable && !__CFBinaryPlistWriteToStream())
  {
    CFRelease(Mutable);
    return 0LL;
  }

  return Mutable;
}

CFMutableDataRef _DASerializeDiskDescription(const __CFAllocator *a1, CFDictionaryRef theDict)
{
  if (!theDict) {
    return 0LL;
  }
  CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(a1, 0LL, theDict);
  if (!MutableCopy) {
    return 0LL;
  }
  CFRange v5 = MutableCopy;
  Value = (const __CFUUID *)CFDictionaryGetValue(theDict, @"DAMediaUUID");
  if (Value)
  {
    CFStringRef v7 = CFUUIDCreateString(a1, Value);
    if (v7)
    {
      CFStringRef v8 = v7;
      CFDictionarySetValue(v5, @"DAMediaUUID", v7);
      CFRelease(v8);
    }
  }

  CFTypeID v9 = (const __CFURL *)CFDictionaryGetValue(theDict, @"DAVolumePath");
  if (v9)
  {
    CFStringRef v10 = CFURLCopyFileSystemPath(v9, kCFURLPOSIXPathStyle);
    if (v10)
    {
      CFStringRef v11 = v10;
      CFDictionarySetValue(v5, @"DAVolumePath", v10);
      CFRelease(v11);
    }
  }

  DADissenterRef v12 = (const __CFUUID *)CFDictionaryGetValue(theDict, @"DAVolumeUUID");
  if (v12)
  {
    CFStringRef v13 = CFUUIDCreateString(a1, v12);
    if (v13)
    {
      CFStringRef v14 = v13;
      CFDictionarySetValue(v5, @"DAVolumeUUID", v13);
      CFRelease(v14);
    }
  }

  CFMutableDataRef v15 = _DASerialize(a1);
  CFRelease(v5);
  return v15;
}

CFPropertyListRef _DAUnserialize(const __CFAllocator *a1, const __CFData *a2)
{
  return CFPropertyListCreateWithData(a1, a2, 0LL, 0LL, 0LL);
}

__CFDictionary *_DAUnserializeDiskDescription(const __CFAllocator *a1, const __CFData *a2)
{
  CFIndex v3 = (const __CFDictionary *)CFPropertyListCreateWithData(a1, a2, 1uLL, 0LL, 0LL);
  CFTypeRef v4 = v3;
  if (v3)
  {
    Value = (const __CFString *)CFDictionaryGetValue(v3, @"DAMediaUUID");
    if (Value)
    {
      CFUUIDRef v6 = CFUUIDCreateFromString(a1, Value);
      if (v6)
      {
        CFUUIDRef v7 = v6;
        CFDictionarySetValue(v4, @"DAMediaUUID", v6);
        CFRelease(v7);
      }
    }

    CFStringRef v8 = (const __CFString *)CFDictionaryGetValue(v4, @"DAVolumePath");
    if (v8)
    {
      CFURLRef v9 = CFURLCreateWithFileSystemPath(a1, v8, kCFURLPOSIXPathStyle, 1u);
      if (v9)
      {
        CFURLRef v10 = v9;
        CFDictionarySetValue(v4, @"DAVolumePath", v9);
        CFRelease(v10);
      }
    }

    CFStringRef v11 = (const __CFString *)CFDictionaryGetValue(v4, @"DAVolumeUUID");
    if (v11)
    {
      CFUUIDRef v12 = CFUUIDCreateFromString(a1, v11);
      if (v12)
      {
        CFUUIDRef v13 = v12;
        CFDictionarySetValue(v4, @"DAVolumeUUID", v12);
        CFRelease(v13);
      }
    }
  }

  return v4;
}

__CFDictionary *_DAUnserializeDiskDescriptionWithBytes(const __CFAllocator *a1, const UInt8 *a2, CFIndex a3)
{
  if (!a2) {
    return 0LL;
  }
  CFTypeRef v4 = CFDataCreateWithBytesNoCopy(a1, a2, a3, (CFAllocatorRef)*MEMORY[0x189604DC8]);
  if (!v4) {
    return 0LL;
  }
  CFRange v5 = v4;
  CFUUIDRef v6 = _DAUnserializeDiskDescription(a1, v4);
  CFRelease(v5);
  return v6;
}

CFPropertyListRef _DAUnserializeWithBytes(const __CFAllocator *a1, const UInt8 *a2, CFIndex a3)
{
  if (!a2) {
    return 0LL;
  }
  CFTypeRef v4 = CFDataCreateWithBytesNoCopy(a1, a2, a3, (CFAllocatorRef)*MEMORY[0x189604DC8]);
  if (!v4) {
    return 0LL;
  }
  CFRange v5 = v4;
  CFPropertyListRef v6 = CFPropertyListCreateWithData(a1, v4, 0LL, 0LL, 0LL);
  CFRelease(v5);
  return v6;
}

char *_DAVolumeCopyID(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  if (!strcmp((const char *)(a1 + 72), "lifs")
    && (__strlcpy_chk(), !__DAVolumeGetDeviceIDForLifsMount(v5, v4, 1024)))
  {
    asprintf(&v3, "/dev/%s");
  }

  else if (!strncmp((const char *)(a1 + 1112), "/dev/", 5uLL))
  {
    asprintf(&v3, "%s");
  }

  else
  {
    asprintf(&v3, "%s?owner=%u");
  }

  return v3;
}

uint64_t __DAVolumeGetDeviceIDForLifsMount(const char *a1, char *a2, int a3)
{
  CFRange v5 = strstr(a1, "://");
  if (!v5) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v6 = v5 + 3;
  CFUUIDRef v7 = strrchr(v5 + 3, 47);
  if (!v7) {
    return 0xFFFFFFFFLL;
  }
  char *v7 = 0;
  strlcpy(a2, v6, a3);
  return 0LL;
}

char *_DAVolumeGetID(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  if (!strcmp((const char *)(a1 + 72), "lifs")
    && (__strlcpy_chk(), !__DAVolumeGetDeviceIDForLifsMount(v4, v3, 1024)))
  {
    snprintf(_DAVolumeGetID_id, 0x411uLL, "/dev/%s");
  }

  else if (!strncmp((const char *)(a1 + 1112), "/dev/", 5uLL))
  {
    snprintf(_DAVolumeGetID_id, 0x411uLL, "%s");
  }

  else
  {
    snprintf(_DAVolumeGetID_id, 0x411uLL, "%s?owner=%u");
  }

  return _DAVolumeGetID_id;
}

uint64_t _DAVolumeGetDevicePathForLifsMount(uint64_t a1, char *a2, int a3)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  __strlcpy_chk();
  uint64_t v5 = strstr(__big, "://");
  if (!v5) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v6 = v5 + 3;
  CFUUIDRef v7 = strrchr(v5 + 3, 47);
  if (!v7) {
    return 0xFFFFFFFFLL;
  }
  char *v7 = 0;
  strlcpy(a2, "/dev/", a3);
  strlcat(a2, v6, a3);
  return 0LL;
}

uint64_t _DASessionCallback(uint64_t a1, uint64_t a2, uint64_t a3, mach_port_t *a4)
{
  uint64_t result = _DAServerSessionCopyCallbackQueue(a4[9], &v20, &v19);
  if (!(_DWORD)result)
  {
    uint64_t v6 = CFGetAllocator(a4);
    CFUUIDRef v7 = (const __CFArray *)_DAUnserializeWithBytes(v6, v20, v19);
    if (v7)
    {
      CFStringRef v8 = v7;
      CFIndex Count = CFArrayGetCount(v7);
      if (Count >= 1)
      {
        CFIndex v10 = Count;
        for (CFIndex i = 0LL; i != v10; ++i)
        {
          ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v8, i);
          if (ValueAtIndex)
          {
            CFUUIDRef v13 = ValueAtIndex;
            int IntegerValue = ___CFDictionaryGetIntegerValue(ValueAtIndex, @"DACallbackAddress");
            CFMutableDataRef v15 = ___CFDictionaryGetIntegerValue(v13, @"DACallbackContext");
            Value = (const __CFData *)CFDictionaryGetValue(v13, @"DACallbackArgument0");
            CFMutableDictionaryRef v17 = (const __CFNumber *)CFDictionaryGetValue(v13, @"DACallbackArgument1");
            unsigned int v18 = ___CFDictionaryGetIntegerValue(v13, @"DACallbackKind");
            _DADispatchCallback(a4, IntegerValue, (uint64_t)v15, v18, Value, v17);
          }
        }
      }

      CFRelease(v8);
    }

    return MEMORY[0x1895BF194](*MEMORY[0x1895FBBE0], v20, v19);
  }

  return result;
}

uint64_t _DASessionGetID(uint64_t a1)
{
  return *(unsigned int *)(a1 + 36);
}

uint64_t _DASessionIsKeepAlive(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 144);
}

uint64_t _DASessionInitialize()
{
  uint64_t result = _CFRuntimeRegisterClass();
  __kDASessionTypemach_port_t ID = result;
  return result;
}

uint64_t _DASessionScheduleWithRunLoop(uint64_t result)
{
  int v1 = *(_DWORD *)(result + 56);
  *(_DWORD *)(result + 56) = v1 + 1;
  if (!v1)
  {
    uint64_t v2 = result;
    CFIndex v3 = (ipc_space_t *)MEMORY[0x1895FBBE0];
    uint64_t result = mach_port_allocate(*MEMORY[0x1895FBBE0], 1u, &name);
    if (!(_DWORD)result)
    {
      int v12 = 1;
      if (!MEMORY[0x1895BF038](*v3, name, 1LL, &v12, 1LL))
      {
        v11.version = 0LL;
        v11.info = (void *)v2;
        v11.retain = (const void *(__cdecl *)(const void *))MEMORY[0x1896030F0];
        v11.release = (void (__cdecl *)(const void *))MEMORY[0x1896030E0];
        v11.copyDescription = 0LL;
        CFTypeRef v4 = CFGetAllocator((CFTypeRef)v2);
        CFMachPortRef v5 = CFMachPortCreateWithPort(v4, name, (CFMachPortCallBack)_DASessionCallback, &v11, 0LL);
        if (v5)
        {
          uint64_t v6 = v5;
          CFUUIDRef v7 = CFGetAllocator((CFTypeRef)v2);
          CFRunLoopSourceRef RunLoopSource = CFMachPortCreateRunLoopSource(v7, v6, 0LL);
          if (RunLoopSource)
          {
            *(void *)(v2 + 16) = v6;
            *(void *)(v2 + 4_DARegisterCallback((uint64_t)session, (uint64_t)callback, (uint64_t)context, 0xEu, 0LL, match, 0LL, 0) = RunLoopSource;
            int v9 = *(_DWORD *)(v2 + 36);
            mach_port_t Port = CFMachPortGetPort(v6);
            return _DAServerSessionSetClientPort(v9, Port);
          }

          CFMachPortInvalidate(v6);
          CFRelease(v6);
        }
      }

      return mach_port_mod_refs(*v3, name, 1u, -1);
    }
  }

  return result;
}

uint64_t _DASessionUnscheduleFromRunLoop(uint64_t result)
{
  uint64_t v1 = result;
  int v2 = *(_DWORD *)(result + 56);
  if (v2 == 1)
  {
    CFIndex v3 = *(__CFRunLoopSource **)(result + 40);
    if (v3)
    {
      CFRunLoopSourceInvalidate(v3);
      CFRelease(*(CFTypeRef *)(v1 + 40));
      *(void *)(v1 + 4_DARegisterCallback((uint64_t)session, (uint64_t)callback, (uint64_t)context, 0xEu, 0LL, match, 0LL, 0) = 0LL;
    }

    uint64_t result = *(void *)(v1 + 16);
    if (result)
    {
      mach_port_name_t Port = CFMachPortGetPort((CFMachPortRef)result);
      CFMachPortInvalidate(*(CFMachPortRef *)(v1 + 16));
      CFRelease(*(CFTypeRef *)(v1 + 16));
      uint64_t result = mach_port_mod_refs(*MEMORY[0x1895FBBE0], Port, 1u, -1);
      *(void *)(v1 + 16) = 0LL;
    }

    int v2 = *(_DWORD *)(v1 + 56);
  }

  if (v2) {
    *(_DWORD *)(v1 + 56) = v2 - 1;
  }
  return result;
}

CFTypeID DAApprovalSessionGetTypeID(void)
{
  return __kDASessionTypeID;
}

CFTypeID DASessionGetTypeID(void)
{
  return __kDASessionTypeID;
}

DASessionRef DASessionCreate(CFAllocatorRef allocator)
{
  uint64_t Instance = _CFRuntimeCreateInstance();
  uint64_t v2 = Instance;
  if (Instance)
  {
    *(_OWORD *)(Instance + 44) = 0u;
    *(_OWORD *)(Instance + 16) = 0u;
    *(_OWORD *)(Instance + 32) = 0u;
    *(void *)(Instance + 64) = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
    *(_DWORD *)(v2 + 72) = 0;
    *(_BYTE *)(v2 + 144) = 0;
    *(_DWORD *)(v2 + 148) = -1;
    pthread_mutex_init((pthread_mutex_t *)(v2 + 80), 0LL);
    if (!*(void *)(v2 + 64)) {
      DASessionCreate_cold_1();
    }
    do
    {
      unsigned int v3 = __ldxr(&sessionCount);
      int v4 = v3 + 1;
    }

    while (__stxr(v3 + 1, &sessionCount));
    HIDWORD(v5) = 652835029 * v4;
    LODWORD(v5) = 652835029 * v4;
    uint64_t v6 = (ipc_space_t *)MEMORY[0x1895FBBE0];
    if (task_get_special_port(*MEMORY[0x1895FBBE0], 4, &special_port)
      || (int v7 = bootstrap_look_up2(), mach_port_deallocate(*v6, special_port), v7)
      || (CFStringRef v8 = (char *)_dyld_get_image_name(0),
          int v9 = basename(v8),
          int v10 = _DAServerSessionCreate(name, v9, &v16),
          mach_port_deallocate(*v6, name),
          v10))
    {
      CFRelease((CFTypeRef)v2);
      return 0LL;
    }

    else
    {
      image_mach_port_name_t name = (char *)_dyld_get_image_name(0);
      CFUUIDRef v13 = basename(image_name);
      *(void *)(v2 + 24) = strdup(v13);
      pid_t v14 = getpid();
      int v15 = v16;
      *(_DWORD *)(v2 + 32) = v14;
      *(_DWORD *)(v2 + 36) = v15;
    }
  }

  return (DASessionRef)v2;
}

void DASessionScheduleWithRunLoop(DASessionRef session, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
  if (session)
  {
    _DASessionScheduleWithRunLoop((uint64_t)session);
    uint64_t v6 = (__CFRunLoopSource *)*((void *)session + 5);
    if (v6) {
      CFRunLoopAddSource(runLoop, v6, runLoopMode);
    }
  }

void DASessionSetDispatchQueue(DASessionRef session, dispatch_queue_t queue)
{
  if (session)
  {
    int v4 = (dispatch_source_s *)*((void *)session + 6);
    if (v4)
    {
      dispatch_source_cancel(v4);
      dispatch_release(*((dispatch_object_t *)session + 6));
      *((void *)session + 6) = 0LL;
    }

    if (queue)
    {
      unint64_t v5 = (ipc_space_t *)MEMORY[0x1895FBBE0];
      if (!mach_port_allocate(*MEMORY[0x1895FBBE0], 1u, &name))
      {
        int v15 = 1;
        if (MEMORY[0x1895BF038](*v5, name, 1LL, &v15, 1LL)
          || (dispatch_source_t v6 = dispatch_source_create(MEMORY[0x1895F8B40], name, 0LL, queue)) == 0LL
          || (*((void *)session + 6) = v6,
              CFRetain(session),
              mach_port_request_notification(*v5, name, 70, 1u, name, 0x15u, &previous)))
        {
          mach_port_mod_refs(*v5, name, 1u, -1);
        }

        else
        {
          int v7 = (dispatch_source_s *)*((void *)session + 6);
          uint64_t v8 = MEMORY[0x1895F87A8];
          handler[0] = MEMORY[0x1895F87A8];
          handler[1] = 0x40000000LL;
          handler[2] = __DASessionSetDispatchQueue_block_invoke;
          handler[3] = &__block_descriptor_tmp;
          mach_port_name_t v13 = name;
          handler[4] = session;
          dispatch_source_set_cancel_handler(v7, handler);
          int v9 = (dispatch_source_s *)*((void *)session + 6);
          v10[0] = v8;
          v10[1] = 0x40000000LL;
          v10[2] = __DASessionSetDispatchQueue_block_invoke_2;
          v10[3] = &__block_descriptor_tmp_2;
          mach_port_name_t v11 = name;
          v10[4] = session;
          dispatch_source_set_event_handler(v9, v10);
          dispatch_resume(*((dispatch_object_t *)session + 6));
          _DAServerSessionSetClientPort(*((_DWORD *)session + 9), name);
        }
      }
    }
  }

void __DASessionSetDispatchQueue_block_invoke(uint64_t a1)
{
}

void __DASessionSetDispatchQueue_block_invoke_2(uint64_t a1)
{
  uint64_t v2 = mach_msg(&msg, 258, 0, 0x20u, *(_DWORD *)(a1 + 40), 0, 0);
  if (msg.msgh_id == 70)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v9 = 0;
      _os_log_impl(&dword_18822F000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "diskarbitrationd exited.", v9, 2u);
    }

    uint64_t v5 = *(void *)(a1 + 32);
    dispatch_source_t v6 = *(void **)(v5 + 24);
    if (v6)
    {
      free(v6);
      uint64_t v5 = *(void *)(a1 + 32);
    }

    *(void *)(v5 + 24) = 0LL;
    uint64_t v7 = *(void *)(a1 + 32);
    mach_port_name_t v8 = *(_DWORD *)(v7 + 36);
    if (v8)
    {
      mach_port_deallocate(*MEMORY[0x1895FBBE0], v8);
      uint64_t v7 = *(void *)(a1 + 32);
    }

    *(_DWORD *)(v7 + 36) = 0;
  }

  else
  {
    _DASessionCallback(v2, v3, v4, *(mach_port_t **)(a1 + 32));
  }

void DASessionUnscheduleFromRunLoop(DASessionRef session, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
  if (session)
  {
    uint64_t v4 = (__CFRunLoopSource *)*((void *)session + 5);
    if (v4) {
      CFRunLoopRemoveSource(runLoop, v4, runLoopMode);
    }
    _DASessionUnscheduleFromRunLoop((uint64_t)session);
  }

CFMutableDictionaryRef DACallbackCreate( const __CFAllocator *a1, uint64_t a2, uint64_t a3, unsigned int a4, uint64_t a5, const void *a6, const void *a7, unsigned int a8)
{
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(a1, 0LL, MEMORY[0x189605240], MEMORY[0x189605250]);
  CFMutableDictionaryRef v16 = Mutable;
  if (Mutable)
  {
    ___CFDictionarySetIntegerValue(Mutable, @"DACallbackAddress", a2);
    ___CFDictionarySetIntegerValue(v16, @"DACallbackContext", a3);
    ___CFDictionarySetIntegerValue(v16, @"DACallbackKind", a4);
    ___CFDictionarySetIntegerValue(v16, @"DACallbackOrder", a5);
    ___CFDictionarySetIntegerValue(v16, @"DACallbackBlock", a8);
    if (a6) {
      CFDictionarySetValue(v16, @"DACallbackMatch", a6);
    }
    if (a7) {
      CFDictionarySetValue(v16, @"DACallbackWatch", a7);
    }
  }

  return v16;
}

uint64_t DAAddCallbackToSession(uint64_t result, const void *a2)
{
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = (pthread_mutex_t *)(result + 80);
    pthread_mutex_lock((pthread_mutex_t *)(result + 80));
    int v5 = *(_DWORD *)(v3 + 72) + 1;
    *(_DWORD *)(v3 + 72) = v5;
    unsigned int valuePtr = v5;
    while (1)
    {
      CFNumberRef v6 = CFNumberCreate(0LL, kCFNumberSInt32Type, &valuePtr);
      if (!CFDictionaryContainsKey(*(CFDictionaryRef *)(v3 + 64), v6)) {
        break;
      }
      int v7 = *(_DWORD *)(v3 + 72);
      *(_DWORD *)(v3 + 72) = v7 + 1;
      unsigned int valuePtr = v7 + 1;
      if (v7 == -1)
      {
        *(_DWORD *)(v3 + 72) = 1;
        unsigned int valuePtr = 1;
      }

      CFRelease(v6);
    }

    CFDictionarySetValue(*(CFMutableDictionaryRef *)(v3 + 64), v6, a2);
    CFRelease(v6);
    pthread_mutex_unlock(v4);
    return valuePtr;
  }

  return result;
}

void DARemoveCallbackFromSessionWithKey(uint64_t a1, int a2)
{
  int v7 = 0;
  int valuePtr = a2;
  if (a1)
  {
    CFNumberRef v3 = CFNumberCreate(0LL, kCFNumberSInt32Type, &valuePtr);
    pthread_mutex_lock((pthread_mutex_t *)(a1 + 80));
    Value = (const __CFDictionary *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 64), v3);
    unsigned int IntegerValue = ___CFDictionaryGetIntegerValue(Value, @"DACallbackBlock");
    CFNumberRef v6 = ___CFDictionaryGetIntegerValue(Value, @"DACallbackAddress");
    if (IntegerValue) {
      _Block_release(v6);
    }
    CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 64), v3);
    CFNumberGetValue(v3, kCFNumberSInt32Type, &v7);
    *(_DWORD *)(a1 + 72) = v7 - 1;
    pthread_mutex_unlock((pthread_mutex_t *)(a1 + 80));
    CFRelease(v3);
  }

uint64_t DARemoveCallbackFromSession(uint64_t a1, const __CFNumber *a2, const __CFNumber *a3)
{
  uint64_t v3 = a1;
  unsigned int valuePtr = 0;
  if (a1)
  {
    pthread_mutex_lock((pthread_mutex_t *)(a1 + 80));
    CFIndex Count = CFDictionaryGetCount(*(CFDictionaryRef *)(v3 + 64));
    int v7 = (const void **)malloc(8 * Count);
    mach_port_name_t v8 = (const void **)malloc(8 * Count);
    CFDictionaryGetKeysAndValues(*(CFDictionaryRef *)(v3 + 64), v7, v8);
    pthread_mutex_unlock((pthread_mutex_t *)(v3 + 80));
    if (Count < 1)
    {
      uint64_t v3 = 0LL;
    }

    else
    {
      unsigned int v19 = (pthread_mutex_t *)(v3 + 80);
      uint64_t v20 = v3;
      DADissenterRef v21 = v8;
      int v9 = (const __CFDictionary **)v8;
      int v10 = (CFNumberRef *)v7;
      while (1)
      {
        mach_port_name_t v11 = *v9;
        unsigned int IntegerValue = ___CFDictionaryGetIntegerValue(*v9, @"DACallbackAddress");
        mach_port_name_t v13 = ___CFDictionaryGetIntegerValue(v11, @"DACallbackContext");
        unsigned int v14 = ___CFDictionaryGetIntegerValue(v11, @"DACallbackBlock");
        if (IntegerValue == a2 && v13 == a3) {
          break;
        }
        ++v10;
        ++v9;
        if (!--Count)
        {
          uint64_t v3 = 0LL;
          goto LABEL_14;
        }
      }

      unsigned int v16 = v14;
      CFNumberRef v17 = *v10;
      CFNumberGetValue(*v10, kCFNumberSInt32Type, &valuePtr);
      if (v16) {
        _Block_release(a2);
      }
      pthread_mutex_lock(v19);
      CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(v20 + 64), v17);
      *(_DWORD *)(v20 + 72) = valuePtr - 1;
      pthread_mutex_unlock(v19);
      uint64_t v3 = valuePtr;
LABEL_14:
      mach_port_name_t v8 = v21;
    }

    free(v7);
    free(v8);
  }

  return v3;
}

char *DAGetCallbackFromSession(char *a1, int a2)
{
  Value = a1;
  int valuePtr = a2;
  if (a1)
  {
    CFNumberRef v3 = CFNumberCreate(0LL, kCFNumberSInt32Type, &valuePtr);
    uint64_t v4 = (pthread_mutex_t *)(Value + 80);
    pthread_mutex_lock((pthread_mutex_t *)(Value + 80));
    Value = (char *)CFDictionaryGetValue(*((CFDictionaryRef *)Value + 8), v3);
    pthread_mutex_unlock(v4);
    CFRelease(v3);
  }

  return Value;
}

uint64_t _DASessionRecreate(uint64_t a1)
{
  int valuePtr = 1;
  if (a1)
  {
    uint64_t v2 = (ipc_space_t *)MEMORY[0x1895FBBE0];
    if (!task_get_special_port(*MEMORY[0x1895FBBE0], 4, special_port))
    {
      int v3 = bootstrap_look_up2();
      mach_port_deallocate(*v2, special_port[0]);
      if (!v3)
      {
        image_mach_port_name_t name = (char *)_dyld_get_image_name(0);
        int v5 = basename(image_name);
        int v6 = _DAServerSessionCreate(name, v5, &v31);
        mach_port_deallocate(*v2, name);
        if (!v6)
        {
          int v9 = (char *)_dyld_get_image_name(0);
          int v10 = basename(v9);
          *(void *)(a1 + 24) = strdup(v10);
          pid_t v11 = getpid();
          int v12 = v31;
          *(_DWORD *)(a1 + 32) = v11;
          *(_DWORD *)(a1 + 36) = v12;
          DASessionSetDispatchQueue((DASessionRef)a1, *(dispatch_queue_t *)(a1 + 152));
          pthread_mutex_lock((pthread_mutex_t *)(a1 + 80));
          CFIndex Count = CFDictionaryGetCount(*(CFDictionaryRef *)(a1 + 64));
          v28 = (pthread_mutex_t *)(a1 + 80);
          pthread_mutex_unlock((pthread_mutex_t *)(a1 + 80));
          if (Count < 1) {
            return _DAServerSessionSetKeepAlive(*(_DWORD *)(a1 + 36));
          }
          int v14 = 0;
          CFIndex v27 = Count;
          while (1)
          {
            CFNumberRef v15 = CFNumberCreate(0LL, kCFNumberSInt32Type, &valuePtr);
            if (v15) {
              break;
            }
LABEL_19:
            ++valuePtr;
            if (Count <= v14) {
              return _DAServerSessionSetKeepAlive(*(_DWORD *)(a1 + 36));
            }
          }

          CFNumberRef v16 = v15;
          pthread_mutex_lock(v28);
          Value = (const __CFDictionary *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 64), v16);
          pthread_mutex_unlock(v28);
          if (!Value)
          {
LABEL_18:
            CFRelease(v16);
            goto LABEL_19;
          }

          int IntegerValue = ___CFDictionaryGetIntegerValue(Value, @"DACallbackKind");
          int v18 = ___CFDictionaryGetIntegerValue(Value, @"DACallbackOrder");
          unsigned int v19 = (const __CFData *)CFDictionaryGetValue(Value, @"DACallbackMatch");
          uint64_t v20 = (const __CFData *)CFDictionaryGetValue(Value, @"DACallbackWatch");
          DADissenterRef v21 = v20;
          mach_port_t v22 = *(_DWORD *)(a1 + 36);
          uint64_t v23 = valuePtr;
          if (v19)
          {
            BytePtr = CFDataGetBytePtr(v19);
            LODWORD(v19) = CFDataGetLength(v19);
            if (v21)
            {
LABEL_14:
              v25 = CFDataGetBytePtr(v21);
              int Length = CFDataGetLength(v21);
LABEL_17:
              _DAServerSessionRegisterCallback( v22,  v23,  v23,  IntegerValue,  v18,  (uint64_t)BytePtr,  (int)v19,  (uint64_t)v25,  Length);
              ++v14;
              CFIndex Count = v27;
              goto LABEL_18;
            }
          }

          else
          {
            BytePtr = 0LL;
            if (v20) {
              goto LABEL_14;
            }
          }

          v25 = 0LL;
          int Length = 0;
          goto LABEL_17;
        }
      }
    }
  }

  uint64_t v7 = 4175036419LL;
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(special_port[0]) = 0;
    _os_log_impl( &dword_18822F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "failed to establish session with diskarbitrationd",  (uint8_t *)special_port,  2u);
  }

  return v7;
}

uint64_t DASessionKeepAlive(uint64_t a1, dispatch_queue_t queue)
{
  if (!a1) {
    return 4175036419LL;
  }
  *(_BYTE *)(a1 + 144) = 1;
  *(void *)(a1 + 152) = queue;
  handler[0] = MEMORY[0x1895F87A8];
  handler[1] = 0x40000000LL;
  handler[2] = __DASessionKeepAlive_block_invoke;
  handler[3] = &__block_descriptor_tmp_5;
  handler[4] = a1;
  *(_DWORD *)(a1 + 148) = notify_register_dispatch( "com.apple.diskarbitrationd.launched",  (int *)(a1 + 148),  queue,  handler);
  return _DAServerSessionSetKeepAlive(*(_DWORD *)(a1 + 36));
}

uint64_t __DASessionKeepAlive_block_invoke(uint64_t a1)
{
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v3 = 0;
    _os_log_impl(&dword_18822F000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "diskarbitrationd relaunched", v3, 2u);
  }

  uint64_t result = *(void *)(a1 + 32);
  if (!*(_DWORD *)(result + 36)) {
    return _DASessionRecreate(result);
  }
  return result;
}

uint64_t __DASessionDeallocate(uint64_t a1)
{
  if (*(void *)(a1 + 16)) {
    __DASessionDeallocate_cold_3();
  }
  if (*(void *)(a1 + 40)) {
    __DASessionDeallocate_cold_2();
  }
  if (*(void *)(a1 + 48)) {
    __DASessionDeallocate_cold_1();
  }
  uint64_t v2 = *(void **)(a1 + 24);
  if (v2) {
    free(v2);
  }
  int v3 = *(_DWORD *)(a1 + 148);
  if (v3 != -1) {
    notify_cancel(v3);
  }
  mach_port_name_t v4 = *(_DWORD *)(a1 + 36);
  if (v4) {
    mach_port_deallocate(*MEMORY[0x1895FBBE0], v4);
  }
  int v5 = *(const __CFDictionary **)(a1 + 64);
  if (v5)
  {
    CFIndex Count = CFDictionaryGetCount(v5);
    uint64_t v7 = (const void **)malloc(8 * Count);
    mach_port_name_t v8 = (const void **)malloc(8 * Count);
    CFDictionaryGetKeysAndValues(*(CFDictionaryRef *)(a1 + 64), v7, v8);
    if (Count >= 1)
    {
      int v9 = (const __CFDictionary **)v8;
      do
      {
        int v10 = *v9;
        int IntegerValue = ___CFDictionaryGetIntegerValue(*v9, @"DACallbackAddress");
        ++v9;
        --Count;
      }

      while (Count);
    }

    free(v7);
    free(v8);
    CFRelease(*(CFTypeRef *)(a1 + 64));
  }

  do
    unsigned int v12 = __ldxr(&sessionCount);
  while (__stxr(v12 - 1, &sessionCount));
  return pthread_mutex_destroy((pthread_mutex_t *)(a1 + 80));
}

BOOL __DASessionEqual(uint64_t a1, uint64_t a2)
{
  return *(_DWORD *)(a1 + 36) == *(_DWORD *)(a2 + 36);
}

uint64_t __DASessionHash(uint64_t a1)
{
  return *(unsigned int *)(a1 + 36);
}

CFStringRef __DASessionCopyFormattingDescription(uint64_t a1)
{
  uint64_t v2 = CFGetAllocator((CFTypeRef)a1);
  return CFStringCreateWithFormat( v2,  0LL,  @"%s [%d]:%d",  *(void *)(a1 + 24),  *(unsigned int *)(a1 + 32),  *(unsigned int *)(a1 + 36));
}

CFStringRef __DASessionCopyDescription(uint64_t a1)
{
  uint64_t v2 = CFGetAllocator((CFTypeRef)a1);
  CFAllocatorRef v3 = CFGetAllocator((CFTypeRef)a1);
  return CFStringCreateWithFormat( v2,  0LL,  @"<DASession %p [%p]>{id = %s [%d]:%d}",  a1,  v3,  *(void *)(a1 + 24),  *(unsigned int *)(a1 + 32),  *(unsigned int *)(a1 + 36));
}

uint64_t _DAServerDiskCopyDescription(mach_port_t a1, const char *a2, void *a3, _DWORD *a4)
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  *(void *)CFNumberRef v16 = *MEMORY[0x1895F8468];
  if (MEMORY[0x1895FBEC0]) {
    int v7 = mig_strncpy_zerofill((char *)v18, a2, 1024);
  }
  else {
    int v7 = mig_strncpy((char *)v18, a2, 1024);
  }
  *(_DWORD *)&v16[8] = 0;
  int v17 = v7;
  mach_msg_size_t v8 = ((v7 + 3) & 0xFFFFFFFC) + 40;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  v15.msgh_bits = 5395;
  v15.msgh_remote_port = a1;
  v15.msgh_local_port = special_reply_port;
  *(void *)&v15.msgh_voucher_port = 0LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&v15);
    mach_port_t special_reply_port = v15.msgh_local_port;
  }

  uint64_t v10 = mach_msg(&v15, 3162115, v8, 0x40u, special_reply_port, 0, 0);
  uint64_t v11 = v10;
  if ((v10 - 268435458) > 0xE || ((1 << (v10 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v10)
    {
      if (v15.msgh_id == 71)
      {
        uint64_t v11 = 4294966988LL;
      }

      else if (v15.msgh_id == 100)
      {
        if ((v15.msgh_bits & 0x80000000) != 0)
        {
          uint64_t v11 = 4294966996LL;
          if (*(_DWORD *)v16 == 1 && v15.msgh_size == 56 && !v15.msgh_remote_port && HIBYTE(v17) == 1)
          {
            int v13 = v18[0];
            if (v18[0] == v18[3])
            {
              uint64_t v11 = 0LL;
              *a3 = *(void *)&v16[4];
              *a4 = v13;
              return v11;
            }
          }
        }

        else if (v15.msgh_size == 36)
        {
          uint64_t v11 = 4294966996LL;
          if (*(_DWORD *)&v16[8])
          {
            if (v15.msgh_remote_port) {
              uint64_t v11 = 4294966996LL;
            }
            else {
              uint64_t v11 = *(unsigned int *)&v16[8];
            }
          }
        }

        else
        {
          uint64_t v11 = 4294966996LL;
        }
      }

      else
      {
        uint64_t v11 = 4294966995LL;
      }

      mach_msg_destroy(&v15);
      return v11;
    }

    mig_dealloc_special_reply_port();
  }

  return v11;
}

uint64_t _DAServerDiskGetOptions(mach_port_t a1, const char *a2, int *a3)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  uint64_t v14 = *MEMORY[0x1895F8468];
  if (MEMORY[0x1895FBEC0]) {
    int v5 = mig_strncpy_zerofill(v17, a2, 1024);
  }
  else {
    int v5 = mig_strncpy(v17, a2, 1024);
  }
  unsigned int v15 = 0;
  int v16 = v5;
  mach_msg_size_t v6 = ((v5 + 3) & 0xFFFFFFFC) + 40;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  v13.msgh_remote_port = a1;
  v13.msgh_local_port = special_reply_port;
  v13.msgh_bits = 5395;
  *(void *)&v13.msgh_voucher_port = 0x100000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&v13);
    mach_port_t special_reply_port = v13.msgh_local_port;
  }

  uint64_t v8 = mach_msg(&v13, 3162115, v6, 0x30u, special_reply_port, 0, 0);
  uint64_t v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v8)
    {
      mig_dealloc_special_reply_port();
      return v9;
    }

    if (v13.msgh_id == 71)
    {
      uint64_t v9 = 4294966988LL;
    }

    else if (v13.msgh_id == 101)
    {
      if ((v13.msgh_bits & 0x80000000) == 0)
      {
        if (v13.msgh_size == 40)
        {
          if (!v13.msgh_remote_port)
          {
            uint64_t v9 = v15;
            if (!v15)
            {
              *a3 = v16;
              return v9;
            }

            goto LABEL_28;
          }
        }

        else if (v13.msgh_size == 36)
        {
          if (v13.msgh_remote_port) {
            BOOL v11 = 1;
          }
          else {
            BOOL v11 = v15 == 0;
          }
          if (v11) {
            uint64_t v9 = 4294966996LL;
          }
          else {
            uint64_t v9 = v15;
          }
          goto LABEL_28;
        }
      }

      uint64_t v9 = 4294966996LL;
    }

    else
    {
      uint64_t v9 = 4294966995LL;
    }

LABEL_28:
    mach_msg_destroy(&v13);
  }

  return v9;
}

    mach_msg_destroy(&v13);
  }

  return v9;
}

    mach_msg_destroy(&v13);
  }

  return v9;
}

uint64_t _DAServerDiskGetUserUID(mach_port_t a1, const char *a2, int *a3)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  uint64_t v14 = *MEMORY[0x1895F8468];
  if (MEMORY[0x1895FBEC0]) {
    int v5 = mig_strncpy_zerofill(v17, a2, 1024);
  }
  else {
    int v5 = mig_strncpy(v17, a2, 1024);
  }
  unsigned int v15 = 0;
  int v16 = v5;
  mach_msg_size_t v6 = ((v5 + 3) & 0xFFFFFFFC) + 40;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  v13.msgh_remote_port = a1;
  v13.msgh_local_port = special_reply_port;
  v13.msgh_bits = 5395;
  *(void *)&v13.msgh_voucher_port = 0x200000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&v13);
    mach_port_t special_reply_port = v13.msgh_local_port;
  }

  uint64_t v8 = mach_msg(&v13, 3162115, v6, 0x30u, special_reply_port, 0, 0);
  uint64_t v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v8)
    {
      mig_dealloc_special_reply_port();
      return v9;
    }

    if (v13.msgh_id == 71)
    {
      uint64_t v9 = 4294966988LL;
    }

    else if (v13.msgh_id == 102)
    {
      if ((v13.msgh_bits & 0x80000000) == 0)
      {
        if (v13.msgh_size == 40)
        {
          if (!v13.msgh_remote_port)
          {
            uint64_t v9 = v15;
            if (!v15)
            {
              *a3 = v16;
              return v9;
            }

            goto LABEL_28;
          }
        }

        else if (v13.msgh_size == 36)
        {
          if (v13.msgh_remote_port) {
            BOOL v11 = 1;
          }
          else {
            BOOL v11 = v15 == 0;
          }
          if (v11) {
            uint64_t v9 = 4294966996LL;
          }
          else {
            uint64_t v9 = v15;
          }
          goto LABEL_28;
        }
      }

      uint64_t v9 = 4294966996LL;
    }

    else
    {
      uint64_t v9 = 4294966995LL;
    }

uint64_t _DAServerDiskIsClaimed(mach_port_t a1, const char *a2, int *a3)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  uint64_t v14 = *MEMORY[0x1895F8468];
  if (MEMORY[0x1895FBEC0]) {
    int v5 = mig_strncpy_zerofill(v17, a2, 1024);
  }
  else {
    int v5 = mig_strncpy(v17, a2, 1024);
  }
  unsigned int v15 = 0;
  int v16 = v5;
  mach_msg_size_t v6 = ((v5 + 3) & 0xFFFFFFFC) + 40;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  v13.msgh_remote_port = a1;
  v13.msgh_local_port = special_reply_port;
  v13.msgh_bits = 5395;
  *(void *)&v13.msgh_voucher_port = 0x300000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&v13);
    mach_port_t special_reply_port = v13.msgh_local_port;
  }

  uint64_t v8 = mach_msg(&v13, 3162115, v6, 0x30u, special_reply_port, 0, 0);
  uint64_t v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v8)
    {
      mig_dealloc_special_reply_port();
      return v9;
    }

    if (v13.msgh_id == 71)
    {
      uint64_t v9 = 4294966988LL;
    }

    else if (v13.msgh_id == 103)
    {
      if ((v13.msgh_bits & 0x80000000) == 0)
      {
        if (v13.msgh_size == 40)
        {
          if (!v13.msgh_remote_port)
          {
            uint64_t v9 = v15;
            if (!v15)
            {
              *a3 = v16;
              return v9;
            }

            goto LABEL_28;
          }
        }

        else if (v13.msgh_size == 36)
        {
          if (v13.msgh_remote_port) {
            BOOL v11 = 1;
          }
          else {
            BOOL v11 = v15 == 0;
          }
          if (v11) {
            uint64_t v9 = 4294966996LL;
          }
          else {
            uint64_t v9 = v15;
          }
          goto LABEL_28;
        }
      }

      uint64_t v9 = 4294966996LL;
    }

    else
    {
      uint64_t v9 = 4294966995LL;
    }

uint64_t _DAServerDiskSetAdoption(mach_port_t a1, const char *a2, int a3)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  uint64_t v13 = *MEMORY[0x1895F8468];
  if (MEMORY[0x1895FBEC0]) {
    int v5 = mig_strncpy_zerofill(v16, a2, 1024);
  }
  else {
    int v5 = mig_strncpy(v16, a2, 1024);
  }
  unsigned int v14 = 0;
  int v15 = v5;
  mach_msg_size_t v6 = ((v5 + 3) & 0xFFFFFFFC) + 44;
  *(_DWORD *)&v16[(v5 + 3) & 0xFFFFFFFC] = a3;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  msg.msgh_bits = 5395;
  *(void *)&msg.msgh_voucher_port = 0x400000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }

  uint64_t v8 = mach_msg(&msg, 3162115, v6, 0x2Cu, special_reply_port, 0, 0);
  uint64_t v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v8)
    {
      mig_dealloc_special_reply_port();
      return v9;
    }

    if (msg.msgh_id == 71)
    {
      uint64_t v9 = 4294966988LL;
    }

    else if (msg.msgh_id == 104)
    {
      uint64_t v9 = 4294966996LL;
      if ((msg.msgh_bits & 0x80000000) == 0 && msg.msgh_size == 36 && !msg.msgh_remote_port)
      {
        uint64_t v9 = v14;
        if (!v14) {
          return v9;
        }
      }
    }

    else
    {
      uint64_t v9 = 4294966995LL;
    }

    mach_msg_destroy(&msg);
  }

  return v9;
}

uint64_t _DAServerDiskSetEncoding(mach_port_t a1, const char *a2, int a3)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  uint64_t v13 = *MEMORY[0x1895F8468];
  if (MEMORY[0x1895FBEC0]) {
    int v5 = mig_strncpy_zerofill(v16, a2, 1024);
  }
  else {
    int v5 = mig_strncpy(v16, a2, 1024);
  }
  unsigned int v14 = 0;
  int v15 = v5;
  mach_msg_size_t v6 = ((v5 + 3) & 0xFFFFFFFC) + 44;
  *(_DWORD *)&v16[(v5 + 3) & 0xFFFFFFFC] = a3;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  msg.msgh_bits = 5395;
  *(void *)&msg.msgh_voucher_port = 0x500000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }

  uint64_t v8 = mach_msg(&msg, 3162115, v6, 0x2Cu, special_reply_port, 0, 0);
  uint64_t v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v8)
    {
      mig_dealloc_special_reply_port();
      return v9;
    }

    if (msg.msgh_id == 71)
    {
      uint64_t v9 = 4294966988LL;
    }

    else if (msg.msgh_id == 105)
    {
      uint64_t v9 = 4294966996LL;
      if ((msg.msgh_bits & 0x80000000) == 0 && msg.msgh_size == 36 && !msg.msgh_remote_port)
      {
        uint64_t v9 = v14;
        if (!v14) {
          return v9;
        }
      }
    }

    else
    {
      uint64_t v9 = 4294966995LL;
    }

    mach_msg_destroy(&msg);
  }

  return v9;
}

uint64_t _DAServerDiskSetOptions(mach_port_t a1, const char *a2, int a3, int a4)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  uint64_t v16 = *MEMORY[0x1895F8468];
  if (MEMORY[0x1895FBEC0]) {
    int v7 = mig_strncpy_zerofill(v19, a2, 1024);
  }
  else {
    int v7 = mig_strncpy(v19, a2, 1024);
  }
  unsigned int v17 = 0;
  int v18 = v7;
  mach_msg_size_t v8 = ((v7 + 3) & 0xFFFFFFFC) + 48;
  uint64_t v9 = (char *)&msg + ((v7 + 3) & 0xFFFFFFFC);
  *((_DWORD *)v9 + 1_DARegisterCallback((uint64_t)session, (uint64_t)callback, (uint64_t)context, 0xEu, 0LL, match, 0LL, 0) = a3;
  *((_DWORD *)v9 + 11) = a4;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  msg.msgh_bits = 5395;
  *(void *)&msg.msgh_voucher_port = 0x600000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }

  uint64_t v11 = mach_msg(&msg, 3162115, v8, 0x2Cu, special_reply_port, 0, 0);
  uint64_t v12 = v11;
  if ((v11 - 268435458) > 0xE || ((1 << (v11 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v11)
    {
      mig_dealloc_special_reply_port();
      return v12;
    }

    if (msg.msgh_id == 71)
    {
      uint64_t v12 = 4294966988LL;
    }

    else if (msg.msgh_id == 106)
    {
      uint64_t v12 = 4294966996LL;
      if ((msg.msgh_bits & 0x80000000) == 0 && msg.msgh_size == 36 && !msg.msgh_remote_port)
      {
        uint64_t v12 = v17;
        if (!v17) {
          return v12;
        }
      }
    }

    else
    {
      uint64_t v12 = 4294966995LL;
    }

    mach_msg_destroy(&msg);
  }

  return v12;
}

uint64_t _DAServerDiskUnclaim(mach_port_t a1, const char *a2)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  uint64_t v7 = *MEMORY[0x1895F8468];
  if (MEMORY[0x1895FBEC0]) {
    int v3 = mig_strncpy_zerofill(v10, a2, 1024);
  }
  else {
    int v3 = mig_strncpy(v10, a2, 1024);
  }
  int v4 = v3;
  int v8 = 0;
  int v9 = v3;
  v6.msgh_bits = 19;
  v6.msgh_remote_port = a1;
  v6.msgh_local_port = 0;
  v6.msgh_voucher_port = 0;
  v6.msgh_id = 7;
  if (MEMORY[0x1895FD5F8]) {
    voucher_mach_msg_set(&v6);
  }
  return mach_msg(&v6, 2097153, ((v4 + 3) & 0xFFFFFFFC) + 40, 0, 0, 0, 0);
}

uint64_t _DAServerSessionCopyCallbackQueue(mach_port_t a1, void *a2, _DWORD *a3)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  mach_port_t special_reply_port = mig_get_special_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  msg.msgh_bits = 5395;
  *(void *)&msg.msgh_voucher_port = 0x800000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }

  uint64_t v7 = mach_msg(&msg, 3162115, 0x18u, 0x40u, special_reply_port, 0, 0);
  uint64_t v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v7)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v8 = 4294966988LL;
      }

      else if (msg.msgh_id == 108)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 36)
          {
            uint64_t v8 = 4294966996LL;
            if (HIDWORD(v13))
            {
              if (msg.msgh_remote_port) {
                uint64_t v8 = 4294966996LL;
              }
              else {
                uint64_t v8 = HIDWORD(v13);
              }
            }
          }

          else
          {
            uint64_t v8 = 4294966996LL;
          }

          goto LABEL_24;
        }

        uint64_t v8 = 4294966996LL;
        if (v12 == 1 && msg.msgh_size == 56 && !msg.msgh_remote_port && v14 == 1)
        {
          int v9 = v15;
          if (v15 == v16)
          {
            uint64_t v8 = 0LL;
            *a2 = v13;
            *a3 = v9;
            return v8;
          }
        }
      }

      else
      {
        uint64_t v8 = 4294966995LL;
      }

LABEL_24:
      mach_msg_destroy(&msg);
      return v8;
    }

    mig_dealloc_special_reply_port();
  }

  return v8;
}

uint64_t _DAServerSessionCreate(mach_port_t a1, const char *a2, _DWORD *a3)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  uint64_t v13 = *MEMORY[0x1895F8468];
  if (MEMORY[0x1895FBEC0]) {
    int v5 = mig_strncpy_zerofill(v16, a2, 1024);
  }
  else {
    int v5 = mig_strncpy(v16, a2, 1024);
  }
  unsigned int v14 = 0;
  int v15 = v5;
  mach_msg_size_t v6 = ((v5 + 3) & 0xFFFFFFFC) + 40;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  v12.msgh_remote_port = a1;
  v12.msgh_local_port = special_reply_port;
  v12.msgh_bits = 5395;
  *(void *)&v12.msgh_voucher_port = 0x900000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&v12);
    mach_port_t special_reply_port = v12.msgh_local_port;
  }

  uint64_t v8 = mach_msg(&v12, 3162115, v6, 0x30u, special_reply_port, 0, 0);
  uint64_t v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v8)
    {
      if (v12.msgh_id == 71)
      {
        uint64_t v9 = 4294966988LL;
      }

      else if (v12.msgh_id == 109)
      {
        if ((v12.msgh_bits & 0x80000000) != 0)
        {
          uint64_t v9 = 4294966996LL;
          if ((_DWORD)v13 == 1 && v12.msgh_size == 40 && !v12.msgh_remote_port && HIWORD(v15) << 16 == 1114112)
          {
            uint64_t v9 = 0LL;
            *a3 = HIDWORD(v13);
            return v9;
          }
        }

        else if (v12.msgh_size == 36)
        {
          uint64_t v9 = 4294966996LL;
          if (v14)
          {
            if (v12.msgh_remote_port) {
              uint64_t v9 = 4294966996LL;
            }
            else {
              uint64_t v9 = v14;
            }
          }
        }

        else
        {
          uint64_t v9 = 4294966996LL;
        }
      }

      else
      {
        uint64_t v9 = 4294966995LL;
      }

      mach_msg_destroy(&v12);
      return v9;
    }

    mig_dealloc_special_reply_port();
  }

  return v9;
}

uint64_t _DAServerSessionQueueRequest( mach_port_t a1, int a2, char *src, int a4, uint64_t a5, int a6, uint64_t a7, int a8, uint64_t a9, uint64_t a10)
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  int v22 = 2;
  uint64_t v23 = a5;
  int v24 = 16777472;
  int v25 = a6;
  uint64_t v26 = a7;
  int v27 = 16777472;
  int v28 = a8;
  uint64_t v29 = *MEMORY[0x1895F8468];
  int v30 = a2;
  if (MEMORY[0x1895FBEC0]) {
    int v14 = mig_strncpy_zerofill(v33, src, 1024);
  }
  else {
    int v14 = mig_strncpy(v33, src, 1024);
  }
  int v31 = 0;
  int v32 = v14;
  mach_msg_size_t v15 = ((v14 + 3) & 0xFFFFFFFC) + 108;
  int v16 = (char *)&msg + ((v14 + 3) & 0xFFFFFFFC);
  *((_DWORD *)v16 + 2_DARegisterCallback((uint64_t)session, (uint64_t)callback, (uint64_t)context, 0xEu, 0LL, match, 0LL, 0) = a4;
  *((_DWORD *)v16 + 21) = a6;
  *((_DWORD *)v16 + 22) = a8;
  *(void *)(v16 + 92) = a9;
  *(void *)(v16 + 10_DARegisterCallback((uint64_t)session, (uint64_t)callback, (uint64_t)context, 0xEu, 0LL, match, 0LL, 0) = a10;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  msg.msgh_bits = -2147478253;
  *(void *)&msg.msgh_voucher_port = 0xA00000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }

  uint64_t v18 = mach_msg(&msg, 3162115, v15, 0x2Cu, special_reply_port, 0, 0);
  uint64_t v19 = v18;
  if ((v18 - 268435458) > 0xE || ((1 << (v18 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v18)
    {
      mig_dealloc_special_reply_port();
      return v19;
    }

    if (msg.msgh_id == 71)
    {
      uint64_t v19 = 4294966988LL;
    }

    else if (msg.msgh_id == 110)
    {
      uint64_t v19 = 4294966996LL;
      if ((msg.msgh_bits & 0x80000000) == 0 && msg.msgh_size == 36 && !msg.msgh_remote_port)
      {
        uint64_t v19 = HIDWORD(v23);
        if (!HIDWORD(v23)) {
          return v19;
        }
      }
    }

    else
    {
      uint64_t v19 = 4294966995LL;
    }

    mach_msg_destroy(&msg);
  }

  return v19;
}

uint64_t _DAServerSessionQueueResponse( mach_port_t a1, uint64_t a2, uint64_t a3, int a4, char *src, uint64_t a6, int a7, int a8)
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  int v16 = 1;
  uint64_t v17 = a6;
  int v18 = 16777472;
  int v19 = a7;
  uint64_t v20 = *MEMORY[0x1895F8468];
  uint64_t v21 = a2;
  uint64_t v22 = a3;
  int v23 = a4;
  if (MEMORY[0x1895FBEC0]) {
    int v11 = mig_strncpy_zerofill(v26, src, 1024);
  }
  else {
    int v11 = mig_strncpy(v26, src, 1024);
  }
  int v24 = 0;
  int v25 = v11;
  uint64_t v12 = (v11 + 3) & 0xFFFFFFFC;
  uint64_t v13 = (char *)&v15 + v12;
  *((_DWORD *)v13 + 2_DARegisterCallback((uint64_t)session, (uint64_t)callback, (uint64_t)context, 0xEu, 0LL, match, 0LL, 0) = a7;
  *((_DWORD *)v13 + 21) = a8;
  v15.msgh_bits = -2147483629;
  v15.msgh_remote_port = a1;
  v15.msgh_local_port = 0;
  v15.msgh_voucher_port = 0;
  v15.msgh_id = 11;
  if (MEMORY[0x1895FD5F8]) {
    voucher_mach_msg_set(&v15);
  }
  return mach_msg(&v15, 2097153, v12 + 88, 0, 0, 0, 0);
}

uint64_t _DAServerSessionRegisterCallback( mach_port_t a1, uint64_t a2, uint64_t a3, int a4, int a5, uint64_t a6, int a7, uint64_t a8, int a9)
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  int v15 = 2;
  uint64_t v16 = a6;
  int v17 = 16777472;
  int v18 = a7;
  uint64_t v19 = a8;
  int v20 = 16777472;
  int v21 = a9;
  uint64_t v22 = *MEMORY[0x1895F8468];
  uint64_t v23 = a2;
  uint64_t v24 = a3;
  int v25 = a4;
  int v26 = a5;
  int v27 = a7;
  int v28 = a9;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  msg.msgh_bits = -2147478253;
  *(void *)&msg.msgh_voucher_port = 0xC00000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }

  uint64_t v11 = mach_msg(&msg, 3162115, 0x64u, 0x2Cu, special_reply_port, 0, 0);
  uint64_t v12 = v11;
  if ((v11 - 268435458) > 0xE || ((1 << (v11 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v11)
    {
      mig_dealloc_special_reply_port();
      return v12;
    }

    if (msg.msgh_id == 71)
    {
      uint64_t v12 = 4294966988LL;
    }

    else if (msg.msgh_id == 112)
    {
      uint64_t v12 = 4294966996LL;
      if ((msg.msgh_bits & 0x80000000) == 0 && msg.msgh_size == 36 && !msg.msgh_remote_port)
      {
        uint64_t v12 = HIDWORD(v16);
        if (!HIDWORD(v16)) {
          return v12;
        }
      }
    }

    else
    {
      uint64_t v12 = 4294966995LL;
    }

    mach_msg_destroy(&msg);
  }

  return v12;
}

uint64_t _DAServerSessionRelease(mach_port_t a1)
{
  msg.msgh_bits = 19;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 13;
  if (MEMORY[0x1895FD5F8]) {
    voucher_mach_msg_set(&msg);
  }
  return mach_msg(&msg, 2097153, 0x18u, 0, 0, 0, 0);
}

uint64_t _DAServerSessionSetKeepAlive(mach_port_t a1)
{
  mach_port_t special_reply_port = mig_get_special_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  msg.msgh_bits = 5395;
  *(void *)&msg.msgh_voucher_port = 0xE00000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }

  uint64_t v3 = mach_msg(&msg, 3162115, 0x18u, 0x2Cu, special_reply_port, 0, 0);
  uint64_t v4 = v3;
  if ((v3 - 268435458) > 0xE || ((1 << (v3 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v3)
    {
      mig_dealloc_special_reply_port();
      return v4;
    }

    if (msg.msgh_id == 71)
    {
      uint64_t v4 = 4294966988LL;
    }

    else if (msg.msgh_id == 114)
    {
      uint64_t v4 = 4294966996LL;
      if ((msg.msgh_bits & 0x80000000) == 0 && msg.msgh_size == 36 && !msg.msgh_remote_port)
      {
        uint64_t v4 = v7;
        if (!v7) {
          return v4;
        }
      }
    }

    else
    {
      uint64_t v4 = 4294966995LL;
    }

    mach_msg_destroy(&msg);
  }

  return v4;
}

uint64_t _DAServerSessionSetClientPort(int a1, int a2)
{
  int v4 = a2;
  int v5 = 1310720;
  *(_DWORD *)mach_msg_header_t msg = -2147483629;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_188236650;
  if (MEMORY[0x1895FD5F8]) {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  }
  return mach_msg((mach_msg_header_t *)msg, 2097153, 0x28u, 0, 0, 0, 0);
}

uint64_t _DAServerSessionUnregisterCallback(mach_port_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x1895F8468];
  uint64_t v6 = a2;
  uint64_t v7 = a3;
  v4.msgh_bits = 19;
  v4.msgh_remote_port = a1;
  v4.msgh_local_port = 0;
  v4.msgh_voucher_port = 0;
  v4.msgh_id = 16;
  if (MEMORY[0x1895FD5F8]) {
    voucher_mach_msg_set(&v4);
  }
  return mach_msg(&v4, 2097153, 0x30u, 0, 0, 0, 0);
}

void __DAInitialize_cold_1()
{
}

void __DAInitialize_cold_2()
{
}

void __DAInitialize_cold_3()
{
}

void __DAInitialize_cold_4()
{
}

void __DAInitialize_cold_5()
{
}

void __DAInitialize_cold_6()
{
}

void DASessionCreate_cold_1()
{
}

void DASessionCreate_cold_2(int a1)
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_fault_impl( &dword_18822F000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_FAULT,  "Now using %d DASessionRef objects",  (uint8_t *)v1,  8u);
}

void __DASessionDeallocate_cold_1()
{
  __assert_rtn("__DASessionDeallocate", "DASession.c", 202, "session->_source2 == NULL");
}

void __DASessionDeallocate_cold_2()
{
  __assert_rtn("__DASessionDeallocate", "DASession.c", 201, "session->_source == NULL");
}

void __DASessionDeallocate_cold_3()
{
  __assert_rtn("__DASessionDeallocate", "DASession.c", 200, "session->_client == NULL");
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x189602630](theArray, range.location, range.length, value);
}

CFMutableArrayRef CFArrayCreateMutable( CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x189602648](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x189602660](theArray);
}

CFIndex CFArrayGetFirstIndexOfValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x189602678](theArray, range.location, range.length, value);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x189602698](theArray, idx);
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
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

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x189602AB0](theData);
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

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
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

CFAllocatorRef CFGetAllocator(CFTypeRef cf)
{
  return (CFAllocatorRef)MEMORY[0x189602D18](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x189602D30](cf);
}

uint64_t CFHashBytes()
{
  return MEMORY[0x189602D58]();
}

CFRunLoopSourceRef CFMachPortCreateRunLoopSource(CFAllocatorRef allocator, CFMachPortRef port, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x189602DB8](allocator, port, order);
}

CFMachPortRef CFMachPortCreateWithPort( CFAllocatorRef allocator, mach_port_t portNum, CFMachPortCallBack callout, CFMachPortContext *context, Boolean *shouldFreeInfo)
{
  return (CFMachPortRef)MEMORY[0x189602DC0](allocator, *(void *)&portNum, callout, context, shouldFreeInfo);
}

mach_port_t CFMachPortGetPort(CFMachPortRef port)
{
  return MEMORY[0x189602DD0](port);
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

CFPropertyListRef CFPropertyListCreateWithData( CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x189602FF0](allocator, data, options, format, error);
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

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

void CFRunLoopSourceInvalidate(CFRunLoopSourceRef source)
{
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

CFComparisonResult CFStringCompare( CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1896033C0](theString1, theString2, compareOptions);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x189603438](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x189603490](alloc, formatOptions, format);
}

CFIndex CFStringGetBytes( CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x1896034F0]( theString,  range.location,  range.length,  *(void *)&encoding,  lossByte,  isExternalRepresentation,  buffer,  maxBufLen);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1896034F8](theString, buffer, bufferSize, *(void *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x189603548](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x189603590]();
}

CFURLRef CFURLCopyAbsoluteURL(CFURLRef relativeURL)
{
  return (CFURLRef)MEMORY[0x1896036B0](relativeURL);
}

CFStringRef CFURLCopyFileSystemPath(CFURLRef anURL, CFURLPathStyle pathStyle)
{
  return (CFStringRef)MEMORY[0x1896036B8](anURL, pathStyle);
}

CFURLRef CFURLCreateWithFileSystemPath( CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1896037C0](allocator, filePath, pathStyle, isDirectory);
}

CFStringRef CFURLGetString(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x189603828](anURL);
}

CFUUIDRef CFUUIDCreateFromString(CFAllocatorRef alloc, CFStringRef uuidStr)
{
  return (CFUUIDRef)MEMORY[0x189603878](alloc, uuidStr);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x189603888](alloc, uuid);
}

CFMutableDictionaryRef IOBSDNameMatching(mach_port_t mainPort, uint32_t options, const char *bsdName)
{
  return (CFMutableDictionaryRef)MEMORY[0x189607C80](*(void *)&mainPort, *(void *)&options, bsdName);
}

BOOLean_t IOObjectConformsTo(io_object_t object, const io_name_t className)
{
  return MEMORY[0x189608360](*(void *)&object, className);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x189608398](*(void *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty( io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x189608470](*(void *)&entry, key, allocator, *(void *)&options);
}

kern_return_t IORegistryEntryGetParentEntry( io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *parent)
{
  return MEMORY[0x1896084D0](*(void *)&entry, plane, parent);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x189608560](*(void *)&mainPort, matching);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1895F8720](aBlock);
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

uint64_t __CFBinaryPlistWriteToStream()
{
  return MEMORY[0x189604950]();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

uint64_t __strlcat_chk()
{
  return MEMORY[0x1895F8A00]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1895F8A08]();
}

const char *__cdecl _dyld_get_image_name(uint32_t image_index)
{
  return (const char *)MEMORY[0x1895F8C08](*(void *)&image_index);
}

void _os_log_fault_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x1895F9540](a1, a2);
}

char *__cdecl basename(char *a1)
{
  return (char *)MEMORY[0x1895F95F0](a1);
}

uint64_t bootstrap_look_up2()
{
  return MEMORY[0x1895F9620]();
}

void dispatch_release(dispatch_object_t object)
{
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

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void free(void *a1)
{
}

uid_t geteuid(void)
{
  return MEMORY[0x1895FB540]();
}

int getfsstat(statfs *a1, int a2, int a3)
{
  return MEMORY[0x1895FB548](a1, *(void *)&a2, *(void *)&a3);
}

pid_t getpid(void)
{
  return MEMORY[0x1895FB628]();
}

mach_msg_return_t mach_msg( mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x1895FBAE8]( msg,  *(void *)&option,  *(void *)&send_size,  *(void *)&rcv_size,  *(void *)&rcv_name,  *(void *)&timeout,  *(void *)&notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
}

kern_return_t mach_port_allocate(ipc_space_t task, mach_port_right_t right, mach_port_name_t *name)
{
  return MEMORY[0x1895FBB10](*(void *)&task, *(void *)&right, name);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1895FBB28](*(void *)&task, *(void *)&name);
}

kern_return_t mach_port_mod_refs( ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return MEMORY[0x1895FBB78](*(void *)&task, *(void *)&name, *(void *)&right, *(void *)&delta);
}

kern_return_t mach_port_request_notification( ipc_space_t task, mach_port_name_t name, mach_msg_id_t msgid, mach_port_mscount_t sync, mach_port_t notify, mach_msg_type_name_t notifyPoly, mach_port_t *previous)
{
  return MEMORY[0x1895FBB88]( *(void *)&task,  *(void *)&name,  *(void *)&msgid,  *(void *)&sync,  *(void *)&notify,  *(void *)&notifyPoly,  previous);
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

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1895FBE30](__dst, __src, __len);
}

uint64_t mig_dealloc_special_reply_port()
{
  return MEMORY[0x1895FBE88]();
}

uint64_t mig_get_special_reply_port()
{
  return MEMORY[0x1895FBEA0]();
}

int mig_strncpy(char *dest, const char *src, int len)
{
  return MEMORY[0x1895FBEB8](dest, src, *(void *)&len);
}

int mig_strncpy_zerofill(char *dest, const char *src, int len)
{
  return MEMORY[0x1895FBEC0](dest, src, *(void *)&len);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1895FC188](*(void *)&token);
}

uint32_t notify_register_dispatch( const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1895FC1C0](name, out_token, queue, handler);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1895FC470](oslog, type);
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

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return (char *)MEMORY[0x1895FCC80](a1, a2);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1895FCF90](__str, __size, __format);
}

char *__cdecl strchr(const char *__s, int __c)
{
  return (char *)MEMORY[0x1895FD048](__s, *(void *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1895FD050](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1895FD078](__s1);
}

size_t strlcat(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1895FD0A0](__dst, __source, __size);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1895FD0B0](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1895FD0B8](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1895FD0E8](__s1, __s2, __n);
}

char *__cdecl strrchr(const char *__s, int __c)
{
  return (char *)MEMORY[0x1895FD120](__s, *(void *)&__c);
}

char *__cdecl strstr(const char *__big, const char *__little)
{
  return (char *)MEMORY[0x1895FD148](__big, __little);
}

kern_return_t task_get_special_port(task_inspect_t task, int which_port, mach_port_t *special_port)
{
  return MEMORY[0x1895FD310](*(void *)&task, *(void *)&which_port, special_port);
}

kern_return_t vm_allocate(vm_map_t target_task, vm_address_t *address, vm_size_t size, int flags)
{
  return MEMORY[0x1895FD548](*(void *)&target_task, address, size, *(void *)&flags);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return MEMORY[0x1895FD558](*(void *)&target_task, address, size);
}