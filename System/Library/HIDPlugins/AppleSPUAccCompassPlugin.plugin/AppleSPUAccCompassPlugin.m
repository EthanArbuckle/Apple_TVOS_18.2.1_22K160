uint64_t sub_1890A2114(uint64_t a1)
{
  uint64_t v1;
  v1 = (*(_DWORD *)(a1 + 16) + 1);
  *(_DWORD *)(a1 + 16) = v1;
  return v1;
}

uint64_t sub_1890A212C()
{
  return 1000LL;
}

uint64_t sub_1890A2134(uint64_t a1, uint64_t a2)
{
  return a2;
}

void AppleSPUAccCompassPlugin::alloc(AppleSPUAccCompassPlugin *this, const __CFAllocator *a2)
{
  v3 = (AppleSPUAccCompassPlugin *)MEMORY[0x1895DE550](this, 48LL, 0LL);
  AppleSPUAccCompassPlugin::AppleSPUAccCompassPlugin(v3, this);
}

void AppleSPUAccCompassPlugin::operator delete(CFAllocatorRef *ptr)
{
}

void sub_1890A2198(void *a1)
{
}

void AppleSPUAccCompassPlugin::AppleSPUAccCompassPlugin( AppleSPUAccCompassPlugin *this, const __CFAllocator *a2)
{
  *(void *)this = &AppleSPUAccCompassPlugin::vtbl;
  *((void *)this + 1) = a2;
  *((_DWORD *)this + 4) = 1;
  *((void *)this + 4) = 0LL;
  *((void *)this + 5) = 0LL;
  *((void *)this + 3) = 0LL;
  v2 = CFUUIDGetConstantUUIDWithBytes( (CFAllocatorRef)*MEMORY[0x189604DD0],  0xEu,  0xB5u,  0xD7u,  0x69u,  0x3Du,  0x30u,  0x4Fu,  0x50u,  0x90u,  0xBBu,  0xCDu,  0xF5u,  0x27u,  0xA9u,  0xADu,  0xF3u);
  CFPlugInAddInstanceForFactory(v2);
}

void AppleSPUAccCompassPlugin::~AppleSPUAccCompassPlugin(AppleSPUAccCompassPlugin *this)
{
  v1 = CFUUIDGetConstantUUIDWithBytes( (CFAllocatorRef)*MEMORY[0x189604DD0],  0xEu,  0xB5u,  0xD7u,  0x69u,  0x3Du,  0x30u,  0x4Fu,  0x50u,  0x90u,  0xBBu,  0xCDu,  0xF5u,  0x27u,  0xA9u,  0xADu,  0xF3u);
  CFPlugInRemoveInstanceForFactory(v1);
}

uint64_t AppleSPUAccCompassPlugin::QueryInterface(AppleSPUAccCompassPlugin *this, CFUUIDBytes a2, void **a3)
{
  CFUUIDRef v5 = CFUUIDCreateFromUUIDBytes(0LL, a2);
  v6 = (const __CFAllocator *)*MEMORY[0x189604DD0];
  CFUUIDRef v7 = CFUUIDGetConstantUUIDWithBytes( (CFAllocatorRef)*MEMORY[0x189604DD0],  5u,  5u,  0xD7u,  0x8Du,  0x4Fu,  0x4Eu,  0x4Cu,  0x41u,  0xA3u,  0xA6u,  0xC7u,  0xA7u,  0x7Bu,  0x41u,  0xBDu,  0xACu);
  if (CFEqual(v5, v7)
    || (CFUUIDRef v8 = CFUUIDGetConstantUUIDWithBytes( v6,  0xC7u,  0x10u,  0x95u,  0x1Du,  0x18u,  0x40u,  0x45u,  0x6Eu,  0x82u,  0xE7u,  0xFCu,  0xA1u,  0xA0u,  0xFAu,  0x7Fu,  0xE4u),  CFEqual(v5, v8))
    || (CFUUIDRef v9 = CFUUIDGetConstantUUIDWithBytes(v6, 0, 0, 0, 0, 0, 0, 0, 0, 0xC0u, 0, 0, 0, 0, 0, 0, 0x46u), CFEqual(v5, v9)))
  {
    uint64_t v10 = 0LL;
    ++*((_DWORD *)this + 4);
  }

  else
  {
    this = 0LL;
    uint64_t v10 = 2147483652LL;
  }

  *a3 = this;
  CFRelease(v5);
  return v10;
}

uint64_t AppleSPUAccCompassPlugin::AddRef(AppleSPUAccCompassPlugin *this)
{
  uint64_t v1 = (*((_DWORD *)this + 4) + 1);
  *((_DWORD *)this + 4) = v1;
  return v1;
}

uint64_t AppleSPUAccCompassPlugin::Release(AppleSPUAccCompassPlugin *this)
{
  int v1 = *((_DWORD *)this + 4);
  uint64_t v2 = (v1 - 1);
  *((_DWORD *)this + 4) = v2;
  if (v1 == 1)
  {
    AppleSPUAccCompassPlugin::~AppleSPUAccCompassPlugin(this);
    AppleSPUAccCompassPlugin::operator delete(v3);
  }

  return v2;
}

void AppleSPUAccCompassPlugin::open(AppleSPUAccCompassPlugin *a1)
{
  if (qword_18C4FE9E0 != -1) {
    dispatch_once(&qword_18C4FE9E0, &unk_18A341FC8);
  }
  uint64_t v2 = (char *)operator new(0x30uLL);
  *(_DWORD *)uint64_t v2 = 0;
  *(_OWORD *)(v2 + 8) = 0u;
  *(_OWORD *)(v2 + 24) = 0u;
  *((void *)v2 + 5) = 0LL;
  *((void *)a1 + 3) = v2;
  if (AppleSPUAccCompassPlugin::openInterface((uint64_t)a1, (uint64_t)v2))
  {
    if (os_log_type_enabled((os_log_t)qword_18C4FE9D8, OS_LOG_TYPE_ERROR)) {
      sub_1890A38E4();
    }
  }

  else
  {
    uint64_t v3 = 0LL;
    for (char i = 1; ; char i = 0)
    {
      char v5 = i;
      uint64_t v6 = *((void *)a1 + 3);
      int v8 = *((_DWORD *)&AppleSPUAccCompassPlugin::accCompassCompensationTable + 4 * v3 + 3);
      char v9 = 0;
      uint64_t v7 = *(void *)(v6 + 8);
      if (!v7
        || (*(unsigned int (**)(uint64_t, uint64_t, int *, uint64_t, void, void))(*(void *)v7 + 80LL))( v7,  4LL,  &v8,  5LL,  0LL,  0LL))
      {
        break;
      }

      uint64_t v3 = 1LL;
      if ((v5 & 1) == 0)
      {
        if (AppleSPUAccCompassPlugin::addAccMatchingNotification(a1))
        {
          if (os_log_type_enabled((os_log_t)qword_18C4FE9D8, OS_LOG_TYPE_ERROR)) {
            sub_1890A38B8();
          }
        }

        return;
      }
    }

    if (os_log_type_enabled((os_log_t)qword_18C4FE9D8, OS_LOG_TYPE_ERROR)) {
      sub_1890A388C();
    }
  }
}

os_log_t sub_1890A25D4()
{
  os_log_t result = os_log_create("AOP", "AppleSPUAccCompassPlugin");
  qword_18C4FE9D8 = (uint64_t)result;
  return result;
}

uint64_t AppleSPUAccCompassPlugin::openInterface(uint64_t a1, uint64_t a2)
{
  kern_return_t v11;
  IOCFPlugInInterface **v12;
  BOOL v13;
  uint64_t v14;
  HRESULT (__cdecl *QueryInterface)(void *, REFIID, LPVOID *);
  CFUUIDRef v16;
  CFUUIDBytes v17;
  uint64_t v18;
  int v19;
  IOCFPlugInInterface **theInterface;
  SInt32 theScore;
  theInterface = 0LL;
  IOHIDServiceRegistryID = AppleSPUAccCompassPlugin::getIOHIDServiceRegistryID();
  mach_port_t v4 = *MEMORY[0x1896086B0];
  char v5 = IORegistryEntryIDMatching((uint64_t)IOHIDServiceRegistryID);
  io_service_t MatchingService = IOServiceGetMatchingService(v4, v5);
  if (!a2) {
    return 3758097090LL;
  }
  io_service_t v7 = MatchingService;
  *(_DWORD *)a2 = MatchingService;
  if (!MatchingService) {
    return 3758097136LL;
  }
  int v8 = (const __CFAllocator *)*MEMORY[0x189604DD0];
  char v9 = CFUUIDGetConstantUUIDWithBytes( (CFAllocatorRef)*MEMORY[0x189604DD0],  0x3Bu,  0xC5u,  0xCCu,  0x87u,  0x84u,  0x5Eu,  0x48u,  0xABu,  0xA9u,  0xC2u,  0x94u,  0x36u,  0,  0x1Bu,  0xA6u,  0x8Au);
  uint64_t v10 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0xC2u,  0x44u,  0xE8u,  0x58u,  0x10u,  0x9Cu,  0x11u,  0xD4u,  0x91u,  0xD4u,  0,  0x50u,  0xE4u,  0xC6u,  0x42u,  0x6Fu);
  v11 = IOCreatePlugInInterfaceForService(v7, v9, v10, &theInterface, &theScore);
  v12 = theInterface;
  if (v11) {
    v13 = 1;
  }
  else {
    v13 = theInterface == 0LL;
  }
  if (v13)
  {
    v14 = 0LL;
    if (!theInterface) {
      return v14;
    }
    goto LABEL_14;
  }

  QueryInterface = (*theInterface)->QueryInterface;
  v16 = CFUUIDGetConstantUUIDWithBytes( v8,  0x59u,  0x79u,  0x99u,  0x3Cu,  0x85u,  0xF5u,  0x4Du,  0x59u,  0x85u,  0x93u,  0xFFu,  0x92u,  0x15u,  0xDAu,  0x47u,  0xADu);
  v17 = CFUUIDGetUUIDBytes(v16);
  ((void (*)(IOCFPlugInInterface **, void, void, uint64_t))QueryInterface)( v12,  *(void *)&v17.byte0,  *(void *)&v17.byte8,  a2 + 8);
  v18 = *(void *)(a2 + 8);
  if (v18)
  {
    v19 = (*(uint64_t (**)(uint64_t, void))(*(void *)v18 + 64LL))(v18, 0LL);
    v12 = theInterface;
    if (v19)
    {
      v14 = 3758097101LL;
      if (!theInterface) {
        return v14;
      }
    }

    else
    {
      v14 = 0LL;
    }

    goto LABEL_14;
  }

  v14 = 0LL;
  v12 = theInterface;
  if (theInterface) {
LABEL_14:
  }
    ((void (*)(IOCFPlugInInterface **))(*v12)->Release)(v12);
  return v14;
}

uint64_t AppleSPUAccCompassPlugin::setProperty(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v13[1] = *MEMORY[0x1895F89C0];
  uint64_t v6 = a5 + 4;
  MEMORY[0x1895F8858]();
  int v8 = (_DWORD *)((char *)v13 - ((v7 + 19) & 0xFFFFFFFFFFFFFFF0LL));
  *int v8 = v9;
  memcpy(v8 + 1, v10, v7);
  uint64_t v11 = *(void *)(a2 + 8);
  if (v11) {
    return (*(uint64_t (**)(uint64_t, uint64_t, _DWORD *, uint64_t, void, void))(*(void *)v11 + 80LL))( v11,  4LL,  v8,  v6,  0LL,  0LL);
  }
  else {
    return 3758097112LL;
  }
}

uint64_t AppleSPUAccCompassPlugin::addAccMatchingNotification(AppleSPUAccCompassPlugin *this)
{
  uint64_t v2 = 3758097115LL;
  int v21 = 11;
  int valuePtr = 65280;
  int v19 = 1452;
  int v20 = 5016;
  uint64_t v3 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  *((void *)this + 4) = IOHIDManagerCreate((CFAllocatorRef)*MEMORY[0x189604DB0], 0);
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(v3, 4LL, MEMORY[0x189605240], MEMORY[0x189605250]);
  if (!Mutable)
  {
LABEL_15:
    v17 = (const void *)*((void *)this + 4);
    if (v17) {
      CFRelease(v17);
    }
    return v2;
  }

  CFMutableDictionaryRef v5 = Mutable;
  CFNumberRef v6 = CFNumberCreate(v3, kCFNumberIntType, &valuePtr);
  if (!v6)
  {
LABEL_19:
    CFRelease(v5);
    goto LABEL_15;
  }

  CFNumberRef v7 = v6;
  CFNumberRef v8 = CFNumberCreate(v3, kCFNumberIntType, &v21);
  if (!v8)
  {
    CFRelease(v7);
    goto LABEL_19;
  }

  CFNumberRef v9 = v8;
  CFNumberRef v10 = CFNumberCreate(v3, kCFNumberIntType, &v20);
  if (!v10)
  {
    CFNumberRef v11 = 0LL;
    goto LABEL_21;
  }

  CFNumberRef v11 = CFNumberCreate(v3, kCFNumberIntType, &v19);
  if (!v11)
  {
LABEL_21:
    v13 = 0LL;
    goto LABEL_22;
  }

  v12 = CFDictionaryCreateMutable(v3, 2LL, MEMORY[0x189605240], MEMORY[0x189605250]);
  v13 = v12;
  if (v12)
  {
    CFDictionarySetValue(v12, @"DeviceUsagePage", v7);
    CFDictionarySetValue(v13, @"DeviceUsage", v9);
    CFDictionarySetValue(v5, @"DeviceUsagePairs", v13);
    CFDictionarySetValue(v5, @"ProductID", v10);
    CFDictionarySetValue(v5, @"VendorID", v11);
    IOHIDManagerSetDeviceMatching(*((IOHIDManagerRef *)this + 4), v5);
    IOHIDManagerRegisterDeviceMatchingCallback( *((IOHIDManagerRef *)this + 4),  (IOHIDDeviceCallback)AppleSPUAccCompassPlugin::accAddedNotification,  this);
    IOHIDManagerRegisterDeviceRemovalCallback( *((IOHIDManagerRef *)this + 4),  (IOHIDDeviceCallback)AppleSPUAccCompassPlugin::accRemovalNotification,  this);
    v14 = (__IOHIDManager *)*((void *)this + 4);
    Main = CFRunLoopGetMain();
    IOHIDManagerScheduleWithRunLoop(v14, Main, (CFStringRef)*MEMORY[0x1896051B0]);
    uint64_t v2 = 0LL;
    char v16 = 1;
    goto LABEL_8;
  }

LABEL_22:
  char v16 = 0;
LABEL_8:
  CFRelease(v7);
  CFRelease(v9);
  if (v10) {
    CFRelease(v10);
  }
  if (v11) {
    CFRelease(v11);
  }
  if (v13) {
    CFRelease(v13);
  }
  CFRelease(v5);
  if ((v16 & 1) == 0) {
    goto LABEL_15;
  }
  return v2;
}

void AppleSPUAccCompassPlugin::close(uint64_t a1)
{
  uint64_t v2 = *(const void **)(a1 + 32);
  if (v2) {
    CFRelease(v2);
  }
  uint64_t v3 = *(void **)(a1 + 24);
  if (v3)
  {
    operator delete(v3);
    *(void *)(a1 + 24) = 0LL;
  }

const __CFNumber *AppleSPUAccCompassPlugin::getIOHIDServiceRegistryID()
{
  os_log_t result = (const __CFNumber *)IOHIDServiceGetRegistryID();
  if (result)
  {
    if (CFNumberGetValue(result, kCFNumberSInt64Type, &valuePtr)) {
      return (const __CFNumber *)valuePtr;
    }
    else {
      return 0LL;
    }
  }

  return result;
}

uint64_t AppleSPUAccCompassPlugin::match()
{
  return 1000LL;
}

__CFDictionary *AppleSPUAccCompassPlugin::copyPropertyForClient( AppleSPUAccCompassPlugin *this, CFTypeRef cf1, const void *a3)
{
  if (!CFEqual(cf1, @"ServiceFilterDebug")) {
    return 0LL;
  }
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
  CFDictionarySetValue(Mutable, @"Class", @"AppleSPUAccCompassPlugin");
  return Mutable;
}

uint64_t AppleSPUAccCompassPlugin::filter(uint64_t a1, uint64_t a2)
{
  return a2;
}

void AppleSPUAccCompassPlugin::accAddedNotification( AppleSPUAccCompassPlugin *this, void *a2, int a3, __IOHIDDevice *a4, __IOHIDDevice *a5)
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  unint64_t v17 = 0LL;
  if (this)
  {
    CFNumberRef v7 = (os_log_s *)qword_18C4FE9D8;
    if (os_log_type_enabled((os_log_t)qword_18C4FE9D8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      int v21 = a4;
      _os_log_impl(&dword_1890A1000, v7, OS_LOG_TYPE_DEFAULT, "Accessory added %p\n", buf, 0xCu);
    }

    CFNumberRef v8 = (AppleSPUAccCompassPlugin *)AppleSPUAccCompassPlugin::verifyAccMatchedDevice(this, a4);
    if (!(_DWORD)v8)
    {
      uint64_t v9 = 0LL;
      for (char i = 1; ; char i = 0)
      {
        char v11 = i;
        v12 = (char *)&AppleSPUAccCompassPlugin::accCompassCompensationTable + 16 * v9;
        uint64_t AccCompassCompensationElementData = AppleSPUAccCompassPlugin::getAccCompassCompensationElementData( v8,  a4,  65302,  *((_DWORD *)v12 + 1),  buf,  &v17);
        if ((_DWORD)AccCompassCompensationElementData) {
          return;
        }
        if (AppleSPUAccCompassPlugin::setProperty( AccCompassCompensationElementData,  *((void *)this + 3),  *((unsigned int *)v12 + 2),  (uint64_t)buf,  v17))
        {
          if (!os_log_type_enabled((os_log_t)qword_18C4FE9D8, OS_LOG_TYPE_ERROR)) {
            return;
          }
          goto LABEL_15;
        }

        buf[0] = 1;
        unint64_t v17 = 1LL;
        uint64_t v14 = *((void *)this + 3);
        *(_DWORD *)v18 = *((_DWORD *)&AppleSPUAccCompassPlugin::accCompassCompensationTable + 4 * v9 + 3);
        char v19 = 1;
        uint64_t v15 = *(void *)(v14 + 8);
        if (!v15
          || (*(unsigned int (**)(uint64_t, uint64_t, uint8_t *, uint64_t, void, void))(*(void *)v15 + 80LL))( v15,  4LL,  v18,  5LL,  0LL,  0LL))
        {
          break;
        }

        char v16 = (os_log_s *)qword_18C4FE9D8;
        CFNumberRef v8 = (AppleSPUAccCompassPlugin *)os_log_type_enabled((os_log_t)qword_18C4FE9D8, OS_LOG_TYPE_DEFAULT);
        if ((_DWORD)v8)
        {
          *(_WORD *)v18 = 0;
          _os_log_impl(&dword_1890A1000, v16, OS_LOG_TYPE_DEFAULT, "Accessory Compass Compensation enabled \n", v18, 2u);
        }

        uint64_t v9 = 1LL;
        if ((v11 & 1) == 0) {
          return;
        }
      }

      if (os_log_type_enabled((os_log_t)qword_18C4FE9D8, OS_LOG_TYPE_ERROR)) {
LABEL_15:
      }
        sub_1890A3910();
    }
  }

void AppleSPUAccCompassPlugin::accRemovalNotification( AppleSPUAccCompassPlugin *this, void *a2, int a3, void *a4, __IOHIDDevice *a5)
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  if (this)
  {
    CFNumberRef v7 = (void *)*((void *)this + 5);
    CFNumberRef v8 = (os_log_s *)qword_18C4FE9D8;
    BOOL v9 = os_log_type_enabled((os_log_t)qword_18C4FE9D8, OS_LOG_TYPE_DEFAULT);
    if (v7 == a4)
    {
      if (v9)
      {
        int v19 = 134217984;
        int v20 = a4;
        _os_log_impl(&dword_1890A1000, v8, OS_LOG_TYPE_DEFAULT, "Accessory detached %p\n", (uint8_t *)&v19, 0xCu);
      }

      uint64_t v10 = 0LL;
      *((void *)this + 5) = 0LL;
      char v11 = 1;
      do
      {
        char v12 = v11;
        uint64_t v13 = *((void *)this + 3);
        int v19 = *((_DWORD *)&AppleSPUAccCompassPlugin::accCompassCompensationTable + 4 * v10 + 3);
        LOBYTE(v20) = 0;
        uint64_t v14 = *(void *)(v13 + 8);
        if (!v14
          || (*(unsigned int (**)(uint64_t, uint64_t, int *, uint64_t, void, void))(*(void *)v14 + 80LL))( v14,  4LL,  &v19,  5LL,  0LL,  0LL))
        {
          if (os_log_type_enabled((os_log_t)qword_18C4FE9D8, OS_LOG_TYPE_ERROR)) {
            sub_1890A388C();
          }
          return;
        }

        char v11 = 0;
        uint64_t v10 = 1LL;
      }

      while ((v12 & 1) != 0);
      uint64_t v15 = qword_18C4FE9D8;
      if (!os_log_type_enabled((os_log_t)qword_18C4FE9D8, OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      LOWORD(v19) = 0;
      char v16 = "Accessory Compass compensation Disabled \n";
      unint64_t v17 = (os_log_s *)v15;
      uint32_t v18 = 2;
      goto LABEL_11;
    }

    if (v9)
    {
      int v19 = 134217984;
      int v20 = a4;
      char v16 = "Unexpected Accessory removed %p\n";
      unint64_t v17 = v8;
      uint32_t v18 = 12;
LABEL_11:
      _os_log_impl(&dword_1890A1000, v17, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v19, v18);
    }
  }

uint64_t AppleSPUAccCompassPlugin::verifyAccMatchedDevice( AppleSPUAccCompassPlugin *this, IOHIDDeviceRef device)
{
  uint64_t v3 = this;
  uint64_t v14 = *MEMORY[0x1895F89C0];
  uint64_t v4 = 3758097109LL;
  if (!*((void *)this + 5)
    || (CFMutableDictionaryRef v5 = (os_log_s *)qword_18C4FE9D8, os_log_type_enabled((os_log_t)qword_18C4FE9D8, OS_LOG_TYPE_DEFAULT))
    && (int v12 = 134217984,
        IOHIDDeviceRef v13 = device,
        _os_log_impl( &dword_1890A1000,  v5,  OS_LOG_TYPE_DEFAULT,  "Unexpected Second Accessory Verified %p",  (uint8_t *)&v12,  0xCu),  !*((void *)v3 + 5)))
  {
    uint64_t v6 = 0LL;
    char v7 = 1;
    char v8 = 1;
    do
    {
      char v9 = v7;
      this = (AppleSPUAccCompassPlugin *)AppleSPUAccCompassPlugin::checkForAccCompassCompensationElements( this,  device,  65302,  *((_DWORD *)&AppleSPUAccCompassPlugin::accCompassCompensationTable + 4 * v6 + 1));
      char v7 = 0;
      v8 &= (_DWORD)this == 0;
      uint64_t v6 = 1LL;
    }

    while ((v9 & 1) != 0);
    if ((v8 & 1) != 0)
    {
      *((void *)v3 + 5) = device;
      uint64_t v10 = (os_log_s *)qword_18C4FE9D8;
      uint64_t v4 = 0LL;
      if (os_log_type_enabled((os_log_t)qword_18C4FE9D8, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 134217984;
        IOHIDDeviceRef v13 = device;
        _os_log_impl( &dword_1890A1000,  v10,  OS_LOG_TYPE_DEFAULT,  "Accessory verified and attached %p\n",  (uint8_t *)&v12,  0xCu);
        return 0LL;
      }
    }

    else
    {
      return 3758097136LL;
    }
  }

  return v4;
}

uint64_t AppleSPUAccCompassPlugin::checkForAccCompassCompensationElements( AppleSPUAccCompassPlugin *this, IOHIDDeviceRef device, int a3, int a4)
{
  uint64_t v7 = 3758097136LL;
  if (IOHIDDeviceOpen(device, 0)) {
    return 3758097101LL;
  }
  char v8 = IOHIDDeviceCopyMatchingElements(device, 0LL, 0);
  if (v8)
  {
    char v9 = v8;
    if (CFArrayGetCount(v8) >= 1)
    {
      CFIndex v10 = 0LL;
      while (1)
      {
        ValueAtIndex = (__IOHIDElement *)CFArrayGetValueAtIndex(v9, v10);
        if (ValueAtIndex)
        {
          int v12 = ValueAtIndex;
          if (IOHIDElementGetUsage(ValueAtIndex) == a4
            && IOHIDElementGetUsagePage(v12) == a3
            && IOHIDElementGetType(v12) == kIOHIDElementTypeFeature)
          {
            break;
          }
        }

        if (CFArrayGetCount(v9) <= ++v10) {
          goto LABEL_10;
        }
      }

      uint64_t v7 = 0LL;
    }

LABEL_10:
    CFRelease(v9);
  }

  else
  {
    uint64_t v7 = 0LL;
  }

  IOHIDDeviceClose(device, 0);
  return v7;
}

    CFRelease(v12);
  }

  IOHIDDeviceClose(device, 0);
  return 0LL;
}

uint64_t AppleSPUAccCompassPlugin::getAccCompassCompensationElementData( AppleSPUAccCompassPlugin *this, IOHIDDeviceRef device, int a3, int a4, unsigned __int8 *a5, unint64_t *a6)
{
  IOHIDValueRef pValue = 0LL;
  if (IOHIDDeviceOpen(device, 0)) {
    return 3758097101LL;
  }
  char v11 = IOHIDDeviceCopyMatchingElements(device, 0LL, 0);
  if (v11)
  {
    int v12 = v11;
    if (CFArrayGetCount(v11) >= 1)
    {
      CFIndex v13 = 0LL;
      while (1)
      {
        ValueAtIndex = (__IOHIDElement *)CFArrayGetValueAtIndex(v12, v13);
        if (ValueAtIndex)
        {
          uint64_t v15 = ValueAtIndex;
          if (IOHIDElementGetUsage(ValueAtIndex) == a4
            && IOHIDElementGetUsagePage(v15) == a3
            && IOHIDElementGetType(v15) == kIOHIDElementTypeFeature)
          {
            break;
          }
        }

        if (CFArrayGetCount(v12) <= ++v13) {
          goto LABEL_10;
        }
      }

      IOHIDDeviceGetValue(device, v15, &pValue);
      if (pValue)
      {
        size_t Length = IOHIDValueGetLength(pValue);
        BytePtr = IOHIDValueGetBytePtr(pValue);
      }

      else
      {
        BytePtr = 0LL;
        size_t Length = 0LL;
      }

      *a6 = Length;
      memcpy(a5, BytePtr, Length);
    }

uint64_t AppleSPUAccCompassPlugin::checkForBatteryRepair(uint64_t a1, uint64_t a2)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  int v3 = _hadHadAuthorizedBatteryRepair();
  uint64_t v4 = (os_log_s *)qword_18C4FE9D8;
  BOOL v5 = os_log_type_enabled((os_log_t)qword_18C4FE9D8, OS_LOG_TYPE_DEFAULT);
  if (!v3)
  {
    if (!v5) {
      return 0LL;
    }
    LOWORD(v16) = 0;
    char v9 = "Authorized battery repair check returned False!";
LABEL_11:
    _os_log_impl(&dword_1890A1000, v4, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v16, 2u);
    return 0LL;
  }

  if (v5)
  {
    LOWORD(v16) = 0;
    _os_log_impl( &dword_1890A1000,  v4,  OS_LOG_TYPE_DEFAULT,  "Authorized battery repair check returned True!",  (uint8_t *)&v16,  2u);
  }

  int BatteryChemID = _getBatteryChemID();
  uint64_t v7 = (os_log_s *)qword_18C4FE9D8;
  if (os_log_type_enabled((os_log_t)qword_18C4FE9D8, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 67109120;
    LODWORD(v17[0]) = BatteryChemID;
    _os_log_impl(&dword_1890A1000, v7, OS_LOG_TYPE_DEFAULT, "Got chemID 0x%x", (uint8_t *)&v16, 8u);
  }

  if (BatteryChemID > 6257)
  {
    if ((BatteryChemID - 6258) >= 2)
    {
      int v8 = 14357;
      goto LABEL_20;
    }
  }

  else if ((BatteryChemID - 6176) >= 2)
  {
    int v8 = 6249;
LABEL_20:
    if (BatteryChemID == v8)
    {
      CFIndex v13 = (os_log_s *)qword_18C4FE9D8;
      if (os_log_type_enabled((os_log_t)qword_18C4FE9D8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v16) = 0;
        _os_log_impl(&dword_1890A1000, v13, OS_LOG_TYPE_DEFAULT, "Murata batteries detected", (uint8_t *)&v16, 2u);
      }

      int v16 = 217;
      v17[0] = xmmword_1890A3BE0;
      *(_OWORD *)((char *)v17 + 12) = *(__int128 *)((char *)&xmmword_1890A3BE0 + 12);
      uint64_t v14 = *(void *)(a2 + 8);
      if (v14)
      {
        uint64_t v10 = (*(uint64_t (**)(uint64_t, uint64_t, int *, uint64_t, void, void))(*(void *)v14 + 80LL))( v14,  4LL,  &v16,  32LL,  0LL,  0LL);
        if (!(_DWORD)v10) {
          return v10;
        }
      }

      else
      {
        uint64_t v10 = 3758097112LL;
      }

      if (os_log_type_enabled((os_log_t)qword_18C4FE9D8, OS_LOG_TYPE_ERROR))
      {
LABEL_33:
        sub_1890A393C();
        return v10;
      }

      return v10;
    }

    uint64_t v4 = (os_log_s *)qword_18C4FE9D8;
    uint64_t v10 = 0LL;
    if (!os_log_type_enabled((os_log_t)qword_18C4FE9D8, OS_LOG_TYPE_DEFAULT)) {
      return v10;
    }
    LOWORD(v16) = 0;
    char v9 = "Neither Murata nor ATL/SDI batteries found, ignoring...";
    goto LABEL_11;
  }

  char v11 = (os_log_s *)qword_18C4FE9D8;
  if (os_log_type_enabled((os_log_t)qword_18C4FE9D8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v16) = 0;
    _os_log_impl(&dword_1890A1000, v11, OS_LOG_TYPE_DEFAULT, "SDI/ATL batteries detected", (uint8_t *)&v16, 2u);
  }

  int v16 = 217;
  v17[0] = xmmword_1890A3BFC;
  *(_OWORD *)((char *)v17 + 12) = *(__int128 *)((char *)&xmmword_1890A3BFC + 12);
  uint64_t v12 = *(void *)(a2 + 8);
  if (v12)
  {
    uint64_t v10 = (*(uint64_t (**)(uint64_t, uint64_t, int *, uint64_t, void, void))(*(void *)v12 + 80LL))( v12,  4LL,  &v16,  32LL,  0LL,  0LL);
    if (!(_DWORD)v10) {
      return v10;
    }
  }

  else
  {
    uint64_t v10 = 3758097112LL;
  }

  if (os_log_type_enabled((os_log_t)qword_18C4FE9D8, OS_LOG_TYPE_ERROR)) {
    goto LABEL_33;
  }
  return v10;
}

void AppleSPUAccCompassServicePluginFactory(const __CFAllocator *a1, const void *a2)
{
  CFUUIDRef v4 = CFUUIDGetConstantUUIDWithBytes( (CFAllocatorRef)*MEMORY[0x189604DD0],  0x6Bu,  3u,  0x40u,  0xD3u,  0x57u,  0x98u,  0x40u,  0x64u,  0xAAu,  0x17u,  0x92u,  4u,  0xC7u,  0xB0u,  0x6Fu,  0xFDu);
  if (CFEqual(a2, v4))
  {
    BOOL v5 = (AppleSPUAccCompassPlugin *)MEMORY[0x1895DE550](a1, 48LL, 0LL);
    AppleSPUAccCompassPlugin::AppleSPUAccCompassPlugin(v5, a1);
  }

uint64_t AppleSPUAccCompassPlugin::performCommand( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  uint64_t v7 = *(void *)(a2 + 8);
  if (!v7) {
    return 3758097112LL;
  }
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void *))(*(void *)v7 + 80LL))( v7,  a3,  a4,  a5,  a6,  a7);
  if ((_DWORD)result) {
    *a7 = 0LL;
  }
  return result;
}

uint64_t AppleSPUAccCompassPlugin::getProperty( uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, void *a6)
{
  uint64_t result = 3758097090LL;
  int v11 = a3;
  uint64_t v10 = a5;
  if (a6)
  {
    uint64_t v7 = *(void *)(a2 + 8);
    if (v7)
    {
      uint64_t result = (*(uint64_t (**)(void, uint64_t, int *, uint64_t, uint64_t, uint64_t *))(*(void *)v7 + 80LL))( *(void *)(a2 + 8),  10LL,  &v11,  4LL,  a4,  &v10);
      uint64_t v9 = v10;
      if ((_DWORD)result) {
        uint64_t v9 = 0LL;
      }
      *a6 = v9;
    }

    else
    {
      return 3758097112LL;
    }
  }

  return result;
}

void sub_1890A3858( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

uint64_t _hadHadAuthorizedBatteryRepair()
{
  return 0LL;
}

uint64_t _getBatteryChemID()
{
  return 0xFFFFFFFFLL;
}

void sub_1890A388C()
{
}

void sub_1890A38B8()
{
}

void sub_1890A38E4()
{
}

void sub_1890A3910()
{
}

void sub_1890A393C()
{
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return (void *)MEMORY[0x1896025D8](allocator, size, hint);
}

void CFAllocatorDeallocate(CFAllocatorRef allocator, void *ptr)
{
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x189602660](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x189602698](theArray, idx);
}

CFMutableDictionaryRef CFDictionaryCreateMutable( CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x189602BB8](allocator, capacity, keyCallBacks, valueCallBacks);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x189602C38](cf1, cf2);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x189602EA0](allocator, theType, valuePtr);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x189602F10](number, theType, valuePtr);
}

void CFPlugInAddInstanceForFactory(CFUUIDRef factoryID)
{
}

void CFPlugInRemoveInstanceForFactory(CFUUIDRef factoryID)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x189603140]();
}

CFUUIDRef CFUUIDCreateFromUUIDBytes(CFAllocatorRef alloc, CFUUIDBytes bytes)
{
  return (CFUUIDRef)MEMORY[0x189603880](alloc, *(void *)&bytes.byte0, *(void *)&bytes.byte8);
}

CFUUIDRef CFUUIDGetConstantUUIDWithBytes( CFAllocatorRef alloc, UInt8 byte0, UInt8 byte1, UInt8 byte2, UInt8 byte3, UInt8 byte4, UInt8 byte5, UInt8 byte6, UInt8 byte7, UInt8 byte8, UInt8 byte9, UInt8 byte10, UInt8 byte11, UInt8 byte12, UInt8 byte13, UInt8 byte14, UInt8 byte15)
{
  return (CFUUIDRef)MEMORY[0x189603898](alloc, byte0, byte1, byte2, byte3, byte4, byte5, byte6);
}

CFUUIDBytes CFUUIDGetUUIDBytes(CFUUIDRef uuid)
{
  uint64_t v1 = MEMORY[0x1896038B0](uuid);
  result.byte8 = v2;
  result.byte9 = BYTE1(v2);
  result.byte10 = BYTE2(v2);
  result.byte11 = BYTE3(v2);
  result.byte12 = BYTE4(v2);
  result.byte13 = BYTE5(v2);
  result.byte14 = BYTE6(v2);
  result.byte15 = HIBYTE(v2);
  result.byte0 = v1;
  result.byte1 = BYTE1(v1);
  result.byte2 = BYTE2(v1);
  result.byte3 = BYTE3(v1);
  result.byte4 = BYTE4(v1);
  result.byte5 = BYTE5(v1);
  result.byte6 = BYTE6(v1);
  result.byte7 = HIBYTE(v1);
  return result;
}

kern_return_t IOCreatePlugInInterfaceForService( io_service_t service, CFUUIDRef pluginType, CFUUIDRef interfaceType, IOCFPlugInInterface ***theInterface, SInt32 *theScore)
{
  return MEMORY[0x189607D30](*(void *)&service, pluginType, interfaceType, theInterface, theScore);
}

IOReturn IOHIDDeviceClose(IOHIDDeviceRef device, IOOptionBits options)
{
  return MEMORY[0x189607DE0](device, *(void *)&options);
}

CFArrayRef IOHIDDeviceCopyMatchingElements( IOHIDDeviceRef device, CFDictionaryRef matching, IOOptionBits options)
{
  return (CFArrayRef)MEMORY[0x189607DF0](device, matching, *(void *)&options);
}

IOReturn IOHIDDeviceGetValue(IOHIDDeviceRef device, IOHIDElementRef element, IOHIDValueRef *pValue)
{
  return MEMORY[0x189607E28](device, element, pValue);
}

IOReturn IOHIDDeviceOpen(IOHIDDeviceRef device, IOOptionBits options)
{
  return MEMORY[0x189607E30](device, *(void *)&options);
}

IOHIDElementType IOHIDElementGetType(IOHIDElementRef element)
{
  return MEMORY[0x189607F00](element);
}

uint32_t IOHIDElementGetUsage(IOHIDElementRef element)
{
  return MEMORY[0x189607F18](element);
}

uint32_t IOHIDElementGetUsagePage(IOHIDElementRef element)
{
  return MEMORY[0x189607F20](element);
}

IOHIDManagerRef IOHIDManagerCreate(CFAllocatorRef allocator, IOOptionBits options)
{
  return (IOHIDManagerRef)MEMORY[0x1896080E0](allocator, *(void *)&options);
}

void IOHIDManagerRegisterDeviceMatchingCallback( IOHIDManagerRef manager, IOHIDDeviceCallback callback, void *context)
{
}

void IOHIDManagerRegisterDeviceRemovalCallback( IOHIDManagerRef manager, IOHIDDeviceCallback callback, void *context)
{
}

void IOHIDManagerScheduleWithRunLoop(IOHIDManagerRef manager, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
}

void IOHIDManagerSetDeviceMatching(IOHIDManagerRef manager, CFDictionaryRef matching)
{
}

uint64_t IOHIDServiceGetRegistryID()
{
  return MEMORY[0x1896081B8]();
}

const uint8_t *__cdecl IOHIDValueGetBytePtr(IOHIDValueRef value)
{
  return (const uint8_t *)MEMORY[0x1896082A8](value);
}

CFIndex IOHIDValueGetLength(IOHIDValueRef value)
{
  return MEMORY[0x1896082C0](value);
}

CFMutableDictionaryRef IORegistryEntryIDMatching(uint64_t entryID)
{
  return (CFMutableDictionaryRef)MEMORY[0x189608508](entryID);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x189608560](*(void *)&mainPort, matching);
}

void std::terminate(void)
{
}

void operator delete(void *__p)
{
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_18A341F10(__sz);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1896147B8](a1);
}

void _os_log_error_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1895FBE18](__dst, __src, __n);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1895FC440](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1895FC470](oslog, type);
}