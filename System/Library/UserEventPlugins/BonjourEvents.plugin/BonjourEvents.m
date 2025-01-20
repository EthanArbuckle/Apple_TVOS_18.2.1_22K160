void *UserEventAgentFactory(uint64_t a1, void *a2)
{
  void *v2;
  CFUUIDRef v3;
  CFUUIDRef v4;
  v2 = a2;
  if (a2)
  {
    v3 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0xFCu,  0x86u,  0x41u,  0x6Du,  0x61u,  0x64u,  0x20u,  0x70u,  0x72u,  0x6Fu,  0x70u,  0x73u,  0x5Cu,  0x21u,  0x6Eu,  0xC0u);
    if (CFEqual(v2, v3))
    {
      v4 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0xFBu,  0x86u,  0x41u,  0x6Du,  0x61u,  0x64u,  0x20u,  0x70u,  0x72u,  0x6Fu,  0x70u,  0x73u,  0x5Cu,  0x21u,  0x6Eu,  0xC0u);
      v2 = malloc(0x40uLL);
      *v2 = &UserEventAgentInterfaceFtbl;
      v2[3] = 0LL;
      if (v4)
      {
        v2[1] = CFRetain(v4);
        CFPlugInAddInstanceForFactory(v4);
      }

      *((_DWORD *)v2 + 4) = 1;
      v2[4] = CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  (const CFDictionaryValueCallBacks *)&kNetBrowserInfoDictionaryValueCallbacks);
      v2[5] = CFDictionaryCreateMutable( 0LL,  0LL,  (const CFDictionaryKeyCallBacks *)&kNetBrowserInfoDictionaryKeyCallbacks,  &kCFTypeDictionaryValueCallBacks);
      v2[6] = CFDictionaryCreateMutable( 0LL,  0LL,  (const CFDictionaryKeyCallBacks *)&kNetBrowserInfoDictionaryKeyCallbacks,  &kCFTypeDictionaryValueCallBacks);
      v2[7] = CFDictionaryCreateMutable( 0LL,  0LL,  (const CFDictionaryKeyCallBacks *)&kNetBrowserInfoDictionaryKeyCallbacks,  &kCFTypeDictionaryValueCallBacks);
    }

    else
    {
      return 0LL;
    }
  }

  return v2;
}

uint64_t *NetBrowserInfoRetain(uint64_t a1, uint64_t *a2)
{
  if (a2)
  {
    uint64_t v3 = *a2 + 1;
    *a2 = v3;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = a2[1];
      int v6 = 136315906;
      v7 = "com.apple.bonjour.events";
      __int16 v8 = 2080;
      v9 = "NetBrowserInfoRetain";
      __int16 v10 = 2048;
      uint64_t v11 = v4;
      __int16 v12 = 1024;
      int v13 = v3;
      _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "%s:%s: Incremented ref count on %p, count %d",  (uint8_t *)&v6,  0x26u);
    }
  }

  return a2;
}

void NetBrowserInfoRelease(uint64_t a1, uint64_t *a2)
{
  if (a2)
  {
    uint64_t v3 = *a2 - 1;
    if (*a2 == 1)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        uint64_t v4 = a2[1];
        int v6 = 136315650;
        v7 = "com.apple.bonjour.events";
        __int16 v8 = 2080;
        v9 = "NetBrowserInfoRelease";
        __int16 v10 = 2048;
        uint64_t v11 = v4;
        _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "%s:%s: DNSServiceRefDeallocate %p",  (uint8_t *)&v6,  0x20u);
      }

      DNSServiceRefDeallocate((DNSServiceRef)a2[1]);
      free(a2);
    }

    else
    {
      *a2 = v3;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        uint64_t v5 = a2[1];
        int v6 = 136315906;
        v7 = "com.apple.bonjour.events";
        __int16 v8 = 2080;
        v9 = "NetBrowserInfoRelease";
        __int16 v10 = 2048;
        uint64_t v11 = v5;
        __int16 v12 = 1024;
        int v13 = v3;
        _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "%s:%s: Decremented ref count on %p, count %d",  (uint8_t *)&v6,  0x26u);
      }
    }
  }
}

CFStringRef NetBrowserInfoCopyDescription()
{
  return CFStringCreateWithCString(0LL, "NetBrowserInfo: No useful description", 0x8000100u);
}

BOOL NetBrowserInfoEqual(uint64_t a1, uint64_t a2)
{
  return *(void *)(a1 + 8) == *(void *)(a2 + 8);
}

uint64_t NetBrowserInfoHash(uint64_t a1)
{
  return *(void *)(a1 + 8);
}

uint64_t QueryInterface(uint64_t a1, CFUUIDBytes a2, void *a3)
{
  CFUUIDRef v5 = CFUUIDCreateFromUUIDBytes(0LL, a2);
  CFUUIDRef v6 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0xFDu,  0x86u,  0x41u,  0x6Du,  0x61u,  0x64u,  0x20u,  0x70u,  0x72u,  0x6Fu,  0x70u,  0x73u,  0x5Cu,  0x21u,  0x6Eu,  0xC0u);
  if (CFEqual(v5, v6)
    || (CFUUIDRef v7 = CFUUIDGetConstantUUIDWithBytes( kCFAllocatorSystemDefault,  0,  0,  0,  0,  0,  0,  0,  0,  0xC0u,  0,  0,  0,  0,  0,  0,  0x46u),  CFEqual(v5, v7)))
  {
    (*(void (**)(uint64_t))(*(void *)a1 + 16LL))(a1);
    uint64_t v8 = 0LL;
  }

  else
  {
    a1 = 0LL;
    uint64_t v8 = 2147483652LL;
  }

  *a3 = a1;
  CFRelease(v5);
  return v8;
}

uint64_t AddRef(uint64_t a1)
{
  uint64_t v1 = (*(_DWORD *)(a1 + 16) + 1);
  *(_DWORD *)(a1 + 16) = v1;
  return v1;
}

uint64_t Release(void *a1)
{
  int v2 = *((_DWORD *)a1 + 4);
  if (!v2 || (uint64_t result = (v2 - 1), *((_DWORD *)a1 + 4) = result, v2 == 1))
  {
    uint64_t v4 = (const void *)*((void *)a1 + 1);
    if (v4)
    {
      CFPlugInRemoveInstanceForFactory(*((CFUUIDRef *)a1 + 1));
      CFRelease(v4);
    }

    CFUUIDRef v5 = (const void *)*((void *)a1 + 4);
    if (v5) {
      CFRelease(v5);
    }
    CFUUIDRef v6 = (const void *)*((void *)a1 + 5);
    if (v6) {
      CFRelease(v6);
    }
    CFUUIDRef v7 = (const void *)*((void *)a1 + 6);
    if (v7) {
      CFRelease(v7);
    }
    uint64_t v8 = (const void *)*((void *)a1 + 7);
    if (v8) {
      CFRelease(v8);
    }
    free(a1);
    return 0LL;
  }

  return result;
}

void Install()
{
}

void ManageEventsCallback(int a1, CFTypeRef cf, CFTypeRef a3, uint64_t a4)
{
  if (cf) {
    CFRetain(cf);
  }
  if (a3) {
    CFRetain(a3);
  }
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 0x40000000LL;
  v8[2] = __ManageEventsCallback_block_invoke;
  v8[3] = &__block_descriptor_tmp;
  int v9 = a1;
  v8[4] = cf;
  v8[5] = a3;
  v8[6] = a4;
  dispatch_async(&_dispatch_main_q, v8);
}

void __ManageEventsCallback_block_invoke(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 56);
  uint64_t v3 = *(const void **)(a1 + 32);
  uint64_t v4 = *(CFDictionaryRef **)(a1 + 48);
  if (v2 == 2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v10 = "com.apple.bonjour.events";
      __int16 v11 = 2080;
      __int16 v12 = "LaunchdActionHandler";
      _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "%s:%s calling RemoveEventToPlugin",  buf,  0x16u);
    }

    RemoveEventFromPlugin(v4, v3);
  }

  else if (v2 == 1)
  {
    CFUUIDRef v5 = *(const __CFDictionary **)(a1 + 40);
    if (v5)
    {
      CFTypeID v6 = CFGetTypeID(*(CFTypeRef *)(a1 + 40));
      if (v6 == CFDictionaryGetTypeID())
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          __int16 v10 = "com.apple.bonjour.events";
          __int16 v11 = 2080;
          __int16 v12 = "LaunchdActionHandler";
          _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "%s:%s calling AddEventToPlugin",  buf,  0x16u);
        }

        AddEventToPlugin(v4, v3, v5);
      }

      else
      {
        fprintf(__stderrp, "%s:%s given non-dict for event dictionary, action %d\n");
      }
    }

    else
    {
      fprintf(__stderrp, "%s:%s empty dictionary\n");
    }
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v10 = "com.apple.bonjour.events";
    __int16 v11 = 2080;
    __int16 v12 = "LaunchdActionHandler";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s:%s unknown callback event\n", buf, 0x16u);
  }

  CFUUIDRef v7 = *(const void **)(a1 + 32);
  if (v7) {
    CFRelease(v7);
  }
  uint64_t v8 = *(const void **)(a1 + 40);
  if (v8) {
    CFRelease(v8);
  }
}

void AddEventToPlugin(CFDictionaryRef *a1, const void *a2, CFDictionaryRef theDict)
{
  Value = (__CFString *)CFDictionaryGetValue(theDict, @"ServiceDomain");
  CFUUIDRef v7 = (const __CFString *)CFDictionaryGetValue(theDict, @"ServiceType");
  uint64_t v8 = CFDictionaryGetValue(theDict, @"ServiceName");
  int v9 = (const __CFBoolean *)CFDictionaryGetValue(theDict, @"OnServiceAdd");
  __int16 v10 = CFDictionaryGetValue(theDict, @"OnServiceRemove");
  if (v9 && (CFTypeID v11 = CFGetTypeID(v9), v11 == CFBooleanGetTypeID()))
  {
    BOOL v12 = CFBooleanGetValue(v9) != 0;
    if (!v10) {
      goto LABEL_9;
    }
  }

  else
  {
    BOOL v12 = 0;
    if (!v10) {
      goto LABEL_9;
    }
  }

  CFTypeID v13 = CFGetTypeID(v10);
  if (v13 == CFBooleanGetTypeID())
  {
    BOOL v14 = CFBooleanGetValue((CFBooleanRef)v10) != 0;
    if (!v7) {
      goto LABEL_16;
    }
    goto LABEL_10;
  }

LABEL_9:
  BOOL v14 = 0;
  if (!v7)
  {
LABEL_16:
    fprintf(__stderrp, "%s:%s: a LaunchEvent is missing a service type.\n");
    return;
  }

LABEL_10:
  CFTypeID v15 = CFGetTypeID(v7);
  if (v15 != CFStringGetTypeID()) {
    goto LABEL_16;
  }
  if (!v12 && !v14)
  {
    fprintf(__stderrp, "%s:%s a LaunchEvent is missing both onAdd and onRemove events\n");
    return;
  }

  if (!Value)
  {
    Value = @"local";
    if (!v8) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }

  CFTypeID v16 = CFGetTypeID(Value);
  if (v16 != CFStringGetTypeID()) {
    goto LABEL_32;
  }
  if (v8)
  {
LABEL_19:
    CFTypeID v17 = CFGetTypeID(v8);
    if (v17 == CFStringGetTypeID()) {
      goto LABEL_20;
    }
LABEL_32:
    fprintf(__stderrp, "%s:%s a LaunchEvent has a domain that is not a string.\n");
    return;
  }

LABEL_20:
  Browser = CreateBrowser(a1, v7, Value);
  if (Browser)
  {
    v19 = Browser;
    Mutable = CFDictionaryCreateMutable(0LL, 4LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFDictionarySetValue(Mutable, @"LaunchdToken", a2);
    CFDictionarySetValue(Mutable, @"LaunchdDict", theDict);
    if (v8) {
      CFDictionarySetValue(Mutable, @"ServiceName", v8);
    }
    if (v12)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v22 = "com.apple.bonjour.events";
        __int16 v23 = 2080;
        v24 = "AddEventToPlugin";
        _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "%s:%s: Adding browser to AddEvents",  buf,  0x16u);
      }

      AddEventDictionary(Mutable, a1[6], v19);
    }

    if (v14)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v22 = "com.apple.bonjour.events";
        __int16 v23 = 2080;
        v24 = "AddEventToPlugin";
        _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "%s:%s: Adding browser to RemoveEvents",  buf,  0x16u);
      }

      AddEventDictionary(Mutable, a1[7], v19);
    }

    CFDictionarySetValue(a1[4], a2, v19);
    CFRelease(Mutable);
  }

  else
  {
    fprintf(__stderrp, "%s:%s cannot create browser\n");
  }

void RemoveEventFromPlugin(CFDictionaryRef *a1, const void *a2)
{
  Value = CFDictionaryGetValue(a1[4], a2);
  if (Value)
  {
    CFUUIDRef v5 = Value;
    CFTypeID v6 = (const __CFArray *)CFDictionaryGetValue(a1[6], Value);
    CFUUIDRef v7 = (const __CFArray *)CFDictionaryGetValue(a1[7], v5);
    if (v6)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = "com.apple.bonjour.events";
        __int16 v13 = 2080;
        BOOL v14 = "RemoveEventFromPlugin";
        _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "%s:%s: Calling RemoveEventFromArray for OnAddEvents",  buf,  0x16u);
      }

      RemoveEventFromArray(v6, a2);
      if (!CFArrayGetCount(v6))
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          *(void *)&uint8_t buf[4] = "com.apple.bonjour.events";
          __int16 v13 = 2080;
          BOOL v14 = "RemoveEventFromPlugin";
          _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "%s:%s: Removing the browser from AddEvents",  buf,  0x16u);
        }

        CFDictionaryRemoveValue(a1[6], v5);
      }
    }

    if (v7)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = "com.apple.bonjour.events";
        __int16 v13 = 2080;
        BOOL v14 = "RemoveEventFromPlugin";
        _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "%s:%s: Calling RemoveEventFromArray for OnRemoveEvents",  buf,  0x16u);
      }

      RemoveEventFromArray(v7, a2);
      if (!CFArrayGetCount(v7))
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          *(void *)&uint8_t buf[4] = "com.apple.bonjour.events";
          __int16 v13 = 2080;
          BOOL v14 = "RemoveEventFromPlugin";
          _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "%s:%s: Removing the browser from RemoveEvents",  buf,  0x16u);
        }

        CFDictionaryRemoveValue(a1[7], v5);
      }
    }

    CFDictionaryRemoveValue(a1[4], a2);
    CFIndex Count = CFDictionaryGetCount(a1[4]);
    int v9 = (const void **)malloc(8 * Count);
    CFDictionaryGetKeysAndValues(a1[4], 0LL, v9);
    if (Count < 1)
    {
LABEL_20:
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        *(void *)&uint8_t buf[4] = "com.apple.bonjour.events";
        __int16 v13 = 2080;
        BOOL v14 = "RemoveEventFromPlugin";
        __int16 v15 = 2048;
        CFTypeID v16 = v5;
        _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "%s:%s: Removing browser %p from _browsers",  buf,  0x20u);
      }

      CFDictionaryRemoveValue(a1[5], v5);
    }

    else
    {
      __int16 v10 = v9;
      while (*((void *)*v10 + 1) != v5[1])
      {
        ++v10;
        if (!--Count) {
          goto LABEL_20;
        }
      }
    }

    BOOL v11 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO);
    if (v11)
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "com.apple.bonjour.events";
      __int16 v13 = 2080;
      BOOL v14 = "RemoveEventFromPlugin";
      __int16 v15 = 2048;
      CFTypeID v16 = v5;
      _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "%s:%s: Decrementing browser %p count",  buf,  0x20u);
    }

    NetBrowserInfoRelease(v11, v5);
    free(v9);
  }

  else
  {
    *(void *)buf = 0LL;
    CFNumberGetValue((CFNumberRef)a2, kCFNumberLongLongType, buf);
    fprintf( __stderrp,  "%s:%s Launchd asked us to remove a token we did not register! ==Token:%lld== \n",  "com.apple.bonjour.events",  "RemoveEventFromPlugin",  *(void *)buf);
  }

void RemoveEventFromArray(const __CFArray *a1, const void *a2)
{
  CFIndex Count = CFArrayGetCount(a1);
  if (Count < 1)
  {
    CFIndex v5 = 0LL;
  }

  else
  {
    CFIndex v5 = 0LL;
    while (1)
    {
      ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(a1, v5);
      Value = CFDictionaryGetValue(ValueAtIndex, @"LaunchdToken");
      if (CFEqual(Value, a2)) {
        break;
      }
      if (Count == ++v5) {
        goto LABEL_11;
      }
    }

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      int v8 = 136315394;
      int v9 = "com.apple.bonjour.events";
      __int16 v10 = 2080;
      BOOL v11 = "RemoveEventFromArray";
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s:%s found token", (uint8_t *)&v8, 0x16u);
    }

    CFArrayRemoveValueAtIndex(a1, v5);
  }

  if (v5 == Count)
  {
LABEL_11:
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      int v8 = 136315394;
      int v9 = "com.apple.bonjour.events";
      __int16 v10 = 2080;
      BOOL v11 = "RemoveEventFromArray";
      _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "%s:%s did not find token",  (uint8_t *)&v8,  0x16u);
    }
  }

uint64_t *CreateBrowser(CFDictionaryRef *a1, const __CFString *a2, const __CFString *a3)
{
  CFIndex Count = CFDictionaryGetCount(a1[5]);
  CFUUIDRef v7 = (const void **)malloc(8 * Count);
  v22 = (const void **)malloc(8 * Count);
  CFDictionaryGetKeysAndValues(a1[5], v22, v7);
  if (Count < 1) {
    goto LABEL_6;
  }
  uint64_t v8 = 0LL;
  while (1)
  {
    int v9 = (const __CFDictionary *)v7[v8];
    Value = (const __CFString *)CFDictionaryGetValue(v9, @"ServiceType");
    BOOL v11 = (const __CFString *)CFDictionaryGetValue(v9, @"ServiceDomain");
    if (CFStringCompare(Value, a2, 1uLL) == kCFCompareEqualTo && CFStringCompare(v11, a3, 1uLL) == kCFCompareEqualTo) {
      break;
    }
    if (Count == ++v8) {
      goto LABEL_6;
    }
  }

  BOOL v20 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO);
  if (v20)
  {
    *(_DWORD *)buf = 136315394;
    v24 = "com.apple.bonjour.events";
    __int16 v25 = 2080;
    v26 = "CreateBrowser";
    _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "%s:%s: found a duplicate browser\n",  buf,  0x16u);
  }

  __int16 v13 = (uint64_t *)v22[v8];
  NetBrowserInfoRetain(v20, v13);
  if (!v13)
  {
LABEL_6:
    BOOL v12 = NetBrowserInfoCreate(a2, a3, a1);
    if (v12)
    {
      __int16 v13 = v12;
      Mutable = CFDictionaryCreateMutable(0LL, 2LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      CFDictionarySetValue(Mutable, @"ServiceType", a2);
      CFDictionarySetValue(Mutable, @"ServiceDomain", a3);
      CFDictionarySetValue(a1[5], v13, Mutable);
      CFRelease(Mutable);
    }

    else
    {
      __int16 v15 = __stderrp;
      CFTypeID v16 = "??????";
      if (a2)
      {
        CStringPtr = CFStringGetCStringPtr(a2, 0x8000100u);
        if (CStringPtr) {
          CFTypeID v16 = CStringPtr;
        }
      }

      v18 = "??????";
      if (a3)
      {
        v19 = CFStringGetCStringPtr(a3, 0x8000100u);
        if (v19) {
          v18 = v19;
        }
      }

      fprintf(v15, "%s:%s failed to search for %s.%s", "com.apple.bonjour.events", "CreateBrowser", v16, v18);
      __int16 v13 = 0LL;
    }
  }

  free(v7);
  free(v22);
  return v13;
}

void AddEventDictionary(const void *a1, CFDictionaryRef theDict, void *key)
{
  Value = (__CFArray *)CFDictionaryGetValue(theDict, key);
  if (Value)
  {
    CFMutableArrayRef Mutable = Value;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      int v8 = 136315394;
      int v9 = "com.apple.bonjour.events";
      __int16 v10 = 2080;
      BOOL v11 = "AddEventDictionary";
      _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "%s:%s Incrementing refcount",  (uint8_t *)&v8,  0x16u);
    }

    CFRetain(Mutable);
  }

  else
  {
    CFMutableArrayRef Mutable = CFArrayCreateMutable(0LL, 0LL, &kCFTypeArrayCallBacks);
    CFDictionarySetValue(theDict, key, Mutable);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      int v8 = 136315394;
      int v9 = "com.apple.bonjour.events";
      __int16 v10 = 2080;
      BOOL v11 = "AddEventDictionary";
      _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "%s:%s creating a new array",  (uint8_t *)&v8,  0x16u);
    }
  }

  CFArrayAppendValue(Mutable, a1);
  CFRelease(Mutable);
}

void *NetBrowserInfoCreate(const __CFString *a1, const __CFString *a2, void *a3)
{
  DNSServiceRef sdRef = 0LL;
  CFIndex Length = CFStringGetLength(a1);
  CFIndex MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
  int v8 = (char *)calloc(MaximumSizeForEncoding, 1uLL);
  int CString = CFStringGetCString(a1, v8, MaximumSizeForEncoding, 0x8000100u);
  if (!a2 || (CFIndex v10 = CFStringGetLength(a2), (v11 = CFStringGetMaximumSizeForEncoding(v10, 0x8000100u)) == 0))
  {
    __int16 v13 = 0LL;
    if (CString) {
      goto LABEL_6;
    }
LABEL_9:
    fprintf(__stderrp, "%s:%s LaunchEvent has badly encoded service type or domain.\n");
    goto LABEL_10;
  }

  CFIndex v12 = v11;
  __int16 v13 = (char *)calloc(v11, 1uLL);
  if (CString) {
    int CString = CFStringGetCString(a2, v13, v12, 0x8000100u) != 0;
  }
  if (!CString) {
    goto LABEL_9;
  }
LABEL_6:
  if (DNSServiceBrowse(&sdRef, 0, 0, v8, v13, (DNSServiceBrowseReply)ServiceBrowserCallback, a3))
  {
    fprintf(__stderrp, "%s:%s Failed to create browser for %s, %s\n");
LABEL_10:
    free(v8);
    if (v13) {
      free(v13);
    }
    return 0LL;
  }

  DNSServiceSetDispatchQueue(sdRef, &_dispatch_main_q);
  BOOL v14 = malloc(0x10uLL);
  DNSServiceRef v16 = sdRef;
  *BOOL v14 = 1LL;
  v14[1] = v16;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v19 = "com.apple.bonjour.events";
    __int16 v20 = 2080;
    v21 = "NetBrowserInfoCreate";
    __int16 v22 = 2048;
    __int16 v23 = v14;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s:%s: created new object %p", buf, 0x20u);
  }

  free(v8);
  if (v13) {
    free(v13);
  }
  return v14;
}

void ServiceBrowserCallback( uint64_t a1, char a2, uint64_t a3, int a4, const char *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  CFIndex v12 = BrowserForSDRef(a8, a1);
  if (v12)
  {
    if (a4)
    {
      fprintf(__stderrp, "%s:%s ServiceBrowserCallback: errcode set %d\n");
    }

    else
    {
      __int16 v13 = v12;
      CFStringRef v14 = CFStringCreateWithCString(0LL, a5, 0x8000100u);
      if (v14)
      {
        CFStringRef v15 = v14;
        BOOL v16 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO);
        if ((a2 & 2) != 0)
        {
          if (v16)
          {
            *(_DWORD *)buf = 136315394;
            __int16 v20 = "com.apple.bonjour.events";
            __int16 v21 = 2080;
            __int16 v22 = "ServiceBrowserCallback";
            _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "%s:%s calling HandleTemporaryEventsForService Add\n",  buf,  0x16u);
          }

          CFTypeID v17 = (CFDictionaryRef *)(a8 + 48);
        }

        else
        {
          if (v16)
          {
            *(_DWORD *)buf = 136315394;
            __int16 v20 = "com.apple.bonjour.events";
            __int16 v21 = 2080;
            __int16 v22 = "ServiceBrowserCallback";
            _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "%s:%s calling HandleTemporaryEventsForService Remove\n",  buf,  0x16u);
          }

          CFTypeID v17 = (CFDictionaryRef *)(a8 + 56);
        }

        HandleTemporaryEventsForService(a8, v13, v15, *v17);
        CFRelease(v15);
      }

      else
      {
        int v18 = ServiceBrowserCallback_msgCount;
        if (ServiceBrowserCallback_msgCount <= 999)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315650;
            __int16 v20 = "com.apple.bonjour.events";
            __int16 v21 = 2080;
            __int16 v22 = "ServiceBrowserCallback";
            __int16 v23 = 2080;
            v24 = a5;
            _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "%s:%s Can not create CFString for serviceName %s",  buf,  0x20u);
            int v18 = ServiceBrowserCallback_msgCount;
          }

          ServiceBrowserCallback_msgCFIndex Count = v18 + 1;
        }
      }
    }
  }

  else
  {
    fprintf(__stderrp, "%s:%s ServiceBrowserCallback: missing browser\n");
  }

const void *BrowserForSDRef(uint64_t a1, uint64_t a2)
{
  CFIndex Count = CFDictionaryGetCount(*(CFDictionaryRef *)(a1 + 40));
  CFIndex v5 = (const void **)malloc(8 * Count);
  CFDictionaryGetKeysAndValues(*(CFDictionaryRef *)(a1 + 40), v5, 0LL);
  if (Count < 1)
  {
LABEL_5:
    CFUUIDRef v7 = 0LL;
  }

  else
  {
    CFTypeID v6 = v5;
    while (1)
    {
      CFUUIDRef v7 = *v6;
      if (*((void *)*v6 + 1) == a2) {
        break;
      }
      ++v6;
      if (!--Count) {
        goto LABEL_5;
      }
    }
  }

  free(v5);
  return v7;
}

uint64_t HandleTemporaryEventsForService(int a1, const void *a2, const void *a3, CFDictionaryRef theDict)
{
  uint64_t result = (uint64_t)CFDictionaryGetValue(theDict, a2);
  if (result)
  {
    CFTypeID v6 = (const __CFArray *)result;
    uint64_t result = CFArrayGetCount((CFArrayRef)result);
    if (result >= 1)
    {
      uint64_t v7 = result;
      for (CFIndex i = 0LL; i != v7; ++i)
      {
        ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v6, i);
        Value = CFDictionaryGetValue(ValueAtIndex, @"ServiceName");
        size_t v11 = (const __CFNumber *)CFDictionaryGetValue(ValueAtIndex, @"LaunchdToken");
        CFIndex v12 = CFDictionaryGetValue(ValueAtIndex, @"LaunchdDict");
        if (Value)
        {
          uint64_t result = CFEqual(a3, Value);
          if (!(_DWORD)result) {
            continue;
          }
        }

        uint64_t valuePtr = 0LL;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          CFStringRef v15 = "com.apple.bonjour.events";
          __int16 v16 = 2080;
          CFTypeID v17 = "HandleTemporaryEventsForService";
          _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "%s:%s HandleTemporaryEventsForService signal\n",  buf,  0x16u);
        }

        CFNumberGetValue(v11, kCFNumberLongLongType, &valuePtr);
        _CFXPCCreateXPCObjectFromCFObject(v12);
        UserEventAgentFireEvent();
      }
    }
  }

  return result;
}

const char *CStringFromCFString(const __CFString *a1)
{
  uint64_t v1 = "??????";
  if (a1)
  {
    CStringPtr = CFStringGetCStringPtr(a1, 0x8000100u);
    if (CStringPtr) {
      return CStringPtr;
    }
  }

  return v1;
}

void UserEventAgentFireEvent()
{
  while (1)
    ;
}

void UserEventAgentRegisterForLaunchEvents()
{
  while (1)
    ;
}