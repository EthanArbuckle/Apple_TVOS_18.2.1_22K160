uint64_t sub_1890A7114(uint64_t a1)
{
  uint64_t v1;
  v1 = (*(_DWORD *)(a1 + 16) + 1);
  *(_DWORD *)(a1 + 16) = v1;
  return v1;
}

uint64_t sub_1890A712C(uint64_t a1)
{
  return 1LL;
}

uint64_t sub_1890A714C(uint64_t a1, dispatch_queue_t queue)
{
  *(void *)(a1 + 624) = queue;
  return notify_register_dispatch("com.apple.applespuhidstatistics.fault", &out_token, queue, &unk_18A342898);
}

uint64_t sub_1890A7184(uint64_t result)
{
  *(void *)(result + 624) = 0LL;
  return result;
}

void AppleSPUHIDStatistics::alloc(AppleSPUHIDStatistics *this, const __CFAllocator *a2)
{
  v3 = (AppleSPUHIDStatistics *)MEMORY[0x1895DE938](this, 632LL, 0LL);
  AppleSPUHIDStatistics::AppleSPUHIDStatistics(v3, this);
}

void AppleSPUHIDStatistics::operator delete(CFAllocatorRef *ptr)
{
}

void sub_1890A71DC(void *a1)
{
}

void AppleSPUHIDStatistics::AppleSPUHIDStatistics(AppleSPUHIDStatistics *this, const __CFAllocator *a2)
{
  *(void *)this = &AppleSPUHIDStatistics::vtbl;
  *((void *)this + 1) = a2;
  *((_DWORD *)this + 4) = 1;
  v3 = CFUUIDGetConstantUUIDWithBytes( (CFAllocatorRef)*MEMORY[0x189604DD0],  0x75u,  0xF0u,  0x71u,  0x27u,  0xBBu,  6u,  0x49u,  0xAu,  0xB1u,  0xB9u,  0x81u,  0xAEu,  0x65u,  0xDFu,  6u,  0x46u);
  CFPlugInAddInstanceForFactory(v3);
  *((void *)this + 3) = CFArrayCreateMutable(*((CFAllocatorRef *)this + 1), 0LL, 0LL);
}

void AppleSPUHIDStatistics::~AppleSPUHIDStatistics(AppleSPUHIDStatistics *this)
{
  v1 = CFUUIDGetConstantUUIDWithBytes( (CFAllocatorRef)*MEMORY[0x189604DD0],  0x75u,  0xF0u,  0x71u,  0x27u,  0xBBu,  6u,  0x49u,  0xAu,  0xB1u,  0xB9u,  0x81u,  0xAEu,  0x65u,  0xDFu,  6u,  0x46u);
  CFPlugInRemoveInstanceForFactory(v1);
  os_release((void *)qword_18C4FE9F0);
}

uint64_t AppleSPUHIDStatistics::QueryInterface(AppleSPUHIDStatistics *this, CFUUIDBytes a2, void **a3)
{
  CFUUIDRef v5 = CFUUIDCreateFromUUIDBytes(0LL, a2);
  v6 = (const __CFAllocator *)*MEMORY[0x189604DD0];
  CFUUIDRef v7 = CFUUIDGetConstantUUIDWithBytes( (CFAllocatorRef)*MEMORY[0x189604DD0],  0x19u,  0xD7u,  0x74u,  0x41u,  0xBBu,  0xC4u,  0x45u,  0x11u,  0x91u,  0x49u,  0x60u,  0x57u,  0x2Au,  0xBu,  1u,  0x5Cu);
  if (CFEqual(v5, v7)
    || (CFUUIDRef v8 = CFUUIDGetConstantUUIDWithBytes( v6,  0x3Du,  0xC3u,  0x5Au,  0xA6u,  0xD3u,  0x5Cu,  0x44u,  0x5Bu,  0x9Au,  0x59u,  0xCAu,  3u,  0xDAu,  0x40u,  0x8Bu,  0x97u),  CFEqual(v5, v8))
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

uint64_t AppleSPUHIDStatistics::AddRef(AppleSPUHIDStatistics *this)
{
  uint64_t v1 = (*((_DWORD *)this + 4) + 1);
  *((_DWORD *)this + 4) = v1;
  return v1;
}

uint64_t AppleSPUHIDStatistics::Release(AppleSPUHIDStatistics *this)
{
  int v1 = *((_DWORD *)this + 4);
  uint64_t v2 = (v1 - 1);
  *((_DWORD *)this + 4) = v2;
  if (v1 == 1)
  {
    AppleSPUHIDStatistics::~AppleSPUHIDStatistics(this);
    AppleSPUHIDStatistics::operator delete(v3);
  }

  return v2;
}

uint64_t AppleSPUHIDStatistics::open(uint64_t a1)
{
  if (qword_18C4FE9E8 != -1) {
    dispatch_once(&qword_18C4FE9E8, &unk_18A342608);
  }
  uint64_t v2 = 0LL;
  v3 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  uint64_t v4 = a1 + 32;
  do
  {
    if (off_18A342628[v2]) {
      CFUUIDRef v5 = off_18A342628[v2];
    }
    else {
      CFUUIDRef v5 = "com.apple.aop.unknown";
    }
    *(void *)(v4 + v2 * 8) = CFStringCreateWithCString(v3, v5, 0);
    ++v2;
  }

  while (v2 != 74);
  return 1LL;
}

os_log_t sub_1890A7558()
{
  os_log_t result = os_log_create("AOP", "AppleSPUHIDStatistics");
  qword_18C4FE9F0 = (uint64_t)result;
  return result;
}

const __CFBoolean *AppleSPUHIDStatistics::IOHIDServiceSupportsAggregateDictionary()
{
  os_log_t result = (const __CFBoolean *)IOHIDServiceGetProperty();
  if (result)
  {
    int v1 = result;
    CFTypeID v2 = CFGetTypeID(result);
    if (v2 == CFBooleanGetTypeID()) {
      return (const __CFBoolean *)(CFBooleanGetValue(v1) != 0);
    }
    else {
      return 0LL;
    }
  }

  return result;
}

const __CFNumber *AppleSPUHIDStatistics::getIOHIDServiceRegistryID()
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

void AppleSPUHIDStatistics::registerService(uint64_t a1)
{
  uint64_t v51 = *MEMORY[0x1895F89C0];
  io_registry_entry_t parent = 0;
  theInterface = 0LL;
  CFTypeID v2 = (const void *)IOHIDServiceCopyProperty();
  if (!v2)
  {
    CFUUIDRef v9 = 0LL;
    goto LABEL_28;
  }

  v3 = v2;
  CFTypeID v4 = CFGetTypeID(v2);
  if (v4 == CFStringGetTypeID()
    && CFEqual(v3, @"SPU")
    && AppleSPUHIDStatistics::IOHIDServiceSupportsAggregateDictionary())
  {
    IOHIDServiceRegistryID = AppleSPUHIDStatistics::getIOHIDServiceRegistryID();
    mach_port_t v6 = *MEMORY[0x1896086B0];
    CFUUIDRef v7 = IORegistryEntryIDMatching((uint64_t)IOHIDServiceRegistryID);
    uint64_t MatchingService = IOServiceGetMatchingService(v6, v7);
    CFUUIDRef v9 = (char *)operator new(0x30uLL);
    *(_OWORD *)(v9 + 8) = 0u;
    uint64_t v10 = (uint64_t *)(v9 + 8);
    *(_OWORD *)(v9 + 24) = 0u;
    *((void *)v9 + 5) = 0LL;
    *(_DWORD *)CFUUIDRef v9 = MatchingService;
    if (!(_DWORD)MatchingService) {
      goto LABEL_26;
    }
    MEMORY[0x1895DEA70](MatchingService, v50);
    v11 = (os_log_s *)qword_18C4FE9F0;
    if (os_log_type_enabled((os_log_t)qword_18C4FE9F0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v39 = "registerService";
      __int16 v40 = 2080;
      v41 = v50;
      _os_log_impl(&dword_1890A6000, v11, OS_LOG_TYPE_DEFAULT, "%s: name=%s", buf, 0x16u);
    }

    if (IORegistryEntryGetParentEntry(*(_DWORD *)v9, "IOService", &parent)) {
      goto LABEL_26;
    }
    if (!parent) {
      goto LABEL_26;
    }
    v12 = (io_service_t *)(v9 + 36);
    if (IORegistryEntryGetParentEntry(parent, "IOService", (io_registry_entry_t *)v9 + 9) || !*v12) {
      goto LABEL_26;
    }
    io_service_t v13 = *(_DWORD *)v9;
    v14 = (const __CFAllocator *)*MEMORY[0x189604DD0];
    v15 = CFUUIDGetConstantUUIDWithBytes( (CFAllocatorRef)*MEMORY[0x189604DD0],  0x3Bu,  0xC5u,  0xCCu,  0x87u,  0x84u,  0x5Eu,  0x48u,  0xABu,  0xA9u,  0xC2u,  0x94u,  0x36u,  0,  0x1Bu,  0xA6u,  0x8Au);
    v16 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0xC2u,  0x44u,  0xE8u,  0x58u,  0x10u,  0x9Cu,  0x11u,  0xD4u,  0x91u,  0xD4u,  0,  0x50u,  0xE4u,  0xC6u,  0x42u,  0x6Fu);
    if (!IOCreatePlugInInterfaceForService(v13, v15, v16, &theInterface, &theScore))
    {
      v17 = theInterface;
      if (theInterface)
      {
        QueryInterface = (*theInterface)->QueryInterface;
        v19 = CFUUIDGetConstantUUIDWithBytes( v14,  0x59u,  0x79u,  0x99u,  0x3Cu,  0x85u,  0xF5u,  0x4Du,  0x59u,  0x85u,  0x93u,  0xFFu,  0x92u,  0x15u,  0xDAu,  0x47u,  0xADu);
        CFUUIDBytes v20 = CFUUIDGetUUIDBytes(v19);
        if ((((uint64_t (*)(IOCFPlugInInterface **, void, void, uint64_t *))QueryInterface)( v17,  *(void *)&v20.byte0,  *(void *)&v20.byte8,  v10) & 0x80000000) != 0)
        {
          v31 = (os_log_s *)qword_18C4FE9F0;
          if (os_log_type_enabled((os_log_t)qword_18C4FE9F0, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316418;
            v39 = "";
            __int16 v40 = 2080;
            v41 = "((HRESULT)(Status) >= 0)";
            __int16 v42 = 2080;
            v43 = "";
            __int16 v44 = 2080;
            v45 = "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPUHIDPlugins/AppleSPUHIDStatistics/AppleSPUHIDStatistics.cpp";
            __int16 v46 = 1024;
            int v47 = 252;
            __int16 v48 = 1024;
            int v49 = 0;
            _os_log_impl( &dword_1890A6000,  v31,  OS_LOG_TYPE_DEFAULT,  "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n",  buf,  0x36u);
          }
        }

        uint64_t v21 = *v10;
        if (*v10) {
          goto LABEL_46;
        }
        v32 = (os_log_s *)qword_18C4FE9F0;
        if (os_log_type_enabled((os_log_t)qword_18C4FE9F0, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316418;
          v39 = "";
          __int16 v40 = 2080;
          v41 = "context->_driver._interface";
          __int16 v42 = 2080;
          v43 = "";
          __int16 v44 = 2080;
          v45 = "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPUHIDPlugins/AppleSPUHIDStatistics/AppleSPUHIDStatistics.cpp";
          __int16 v46 = 1024;
          int v47 = 253;
          __int16 v48 = 1024;
          int v49 = 0;
          _os_log_impl( &dword_1890A6000,  v32,  OS_LOG_TYPE_DEFAULT,  "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n",  buf,  0x36u);
          uint64_t v21 = *v10;
          if (*v10)
          {
LABEL_46:
            ((void (*)(IOCFPlugInInterface **))(*theInterface)->Release)(theInterface);
            theInterface = 0LL;
          }
        }
      }
    }

    io_service_t v22 = *v12;
    v23 = CFUUIDGetConstantUUIDWithBytes( v14,  0x7Au,  0xCFu,  0x53u,  0x32u,  0x1Au,  0x35u,  0x48u,  0x93u,  0x87u,  0xCBu,  0xBAu,  0x64u,  0xE1u,  0x88u,  0x7Fu,  0xAEu);
    v24 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0xC2u,  0x44u,  0xE8u,  0x58u,  0x10u,  0x9Cu,  0x11u,  0xD4u,  0x91u,  0xD4u,  0,  0x50u,  0xE4u,  0xC6u,  0x42u,  0x6Fu);
    if (!IOCreatePlugInInterfaceForService(v22, v23, v24, &theInterface, &theScore))
    {
      v25 = theInterface;
      if (theInterface)
      {
        v26 = (*theInterface)->QueryInterface;
        v27 = CFUUIDGetConstantUUIDWithBytes( v14,  1u,  0x64u,  0x69u,  0xD8u,  0x77u,  0x3Bu,  0x46u,  0xACu,  0x90u,  0x9Eu,  0xF9u,  0xCu,  0x4Au,  0x6Eu,  0x75u,  0x77u);
        CFUUIDBytes v28 = CFUUIDGetUUIDBytes(v27);
        v29 = v9 + 40;
        if ((((uint64_t (*)(IOCFPlugInInterface **, void, void, char *))v26)( v25,  *(void *)&v28.byte0,  *(void *)&v28.byte8,  v9 + 40) & 0x80000000) != 0)
        {
          v33 = (os_log_s *)qword_18C4FE9F0;
          if (os_log_type_enabled((os_log_t)qword_18C4FE9F0, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316418;
            v39 = "";
            __int16 v40 = 2080;
            v41 = "((HRESULT)(Status) >= 0)";
            __int16 v42 = 2080;
            v43 = "";
            __int16 v44 = 2080;
            v45 = "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPUHIDPlugins/AppleSPUHIDStatistics/AppleSPUHIDStatistics.cpp";
            __int16 v46 = 1024;
            int v47 = 269;
            __int16 v48 = 1024;
            int v49 = 0;
            _os_log_impl( &dword_1890A6000,  v33,  OS_LOG_TYPE_DEFAULT,  "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n",  buf,  0x36u);
          }
        }

        uint64_t v30 = *v29;
        if (*v29) {
          goto LABEL_22;
        }
        v34 = (os_log_s *)qword_18C4FE9F0;
        if (os_log_type_enabled((os_log_t)qword_18C4FE9F0, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316418;
          v39 = "";
          __int16 v40 = 2080;
          v41 = "context->_device._interface";
          __int16 v42 = 2080;
          v43 = "";
          __int16 v44 = 2080;
          v45 = "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPUHIDPlugins/AppleSPUHIDStatistics/AppleSPUHIDStatistics.cpp";
          __int16 v46 = 1024;
          int v47 = 270;
          __int16 v48 = 1024;
          int v49 = 0;
          _os_log_impl( &dword_1890A6000,  v34,  OS_LOG_TYPE_DEFAULT,  "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n",  buf,  0x36u);
          uint64_t v30 = *v29;
          if (*v29)
          {
LABEL_22:
            (*(void (**)(uint64_t, void))(*(void *)v30 + 64LL))(v30, 0LL);
            (*(void (**)(void, void))(*(void *)*v29 + 144LL))(*v29, *(void *)(a1 + 624));
            (*(void (**)(void, uint64_t (*)(AppleSPUHIDStatistics *__hidden, void *, void *, unint64_t), uint64_t))(*(void *)*v29 + 136LL))( *v29,  AppleSPUHIDStatistics::publishADData,  a1);
          }
        }

        ((void (*)(IOCFPlugInInterface **))(*theInterface)->Release)(theInterface);
        theInterface = 0LL;
      }
    }

    CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 24), v9);
  }

  CFUUIDRef v9 = 0LL;
LABEL_26:
  CFRelease(v3);
  if (theInterface) {
    ((void (*)(IOCFPlugInInterface **))(*theInterface)->Release)(theInterface);
  }
LABEL_28:
  if (parent) {
    IOObjectRelease(parent);
  }
  if (v9) {
    operator delete(v9);
  }
}

uint64_t AppleSPUHIDStatistics::scheduleWithDispatchQueue( AppleSPUHIDStatistics *this, dispatch_queue_t queue)
{
  *((void *)this + 78) = queue;
  return notify_register_dispatch("com.apple.applespuhidstatistics.fault", &out_token, queue, &unk_18A342898);
}

void sub_1890A7DB0()
{
  v0 = (os_log_s *)qword_18C4FE9F0;
  if (os_log_type_enabled((os_log_t)qword_18C4FE9F0, OS_LOG_TYPE_FAULT)) {
    sub_1890AF628(v0);
  }
}

uint64_t AppleSPUHIDStatistics::unscheduleFromDispatchQueue(uint64_t this, dispatch_queue_s *a2)
{
  *(void *)(this + 624) = 0LL;
  return this;
}

const __CFString *AppleSPUHIDStatistics::keyForIndex(uint64_t a1, int a2)
{
  if (a2 > 73) {
    return @"com.apple.aop.unknown";
  }
  else {
    return *(const __CFString **)(a1 + 8LL * a2 + 32);
  }
}

void AppleSPUHIDStatistics::publishADData(uint64_t a1, unint64_t a2, unint64_t a3)
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  if (a3)
  {
    unint64_t v4 = a2;
    uint64_t v5 = 0LL;
    unsigned int v6 = 0;
    unint64_t v7 = 0x18C4FE000uLL;
    do
    {
      int v8 = *(unsigned __int8 *)(v4 - v5 + 8 * v5);
      if (v8 == 74)
      {
        uint64_t v9 = v4 - v5 + 8 * v5;
        unsigned int v12 = *(unsigned __int16 *)(v9 + 1);
        v11 = (__int16 *)(v9 + 1);
        LOBYTE(v10) = v12;
        unint64_t v13 = (unint64_t)v12 >> 8;
        if (v12 >> 9 > 0x24) {
          v14 = @"com.apple.aop.unknown";
        }
        else {
          v14 = *(const __CFString **)(a1 + 8 * v13 + 32);
        }
        unint64_t v15 = v7;
        v16 = *(os_log_s **)(v7 + 2544);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315906;
          v25 = "publishADData";
          __int16 v26 = 1024;
          int v27 = v10;
          __int16 v28 = 2112;
          v29 = v14;
          __int16 v30 = 1024;
          int v31 = v13;
          _os_log_debug_impl(&dword_1890A6000, v16, OS_LOG_TYPE_DEBUG, "%s op=%#x '%@' (%#x)", buf, 0x22u);
          __int16 v10 = *v11;
        }

        uint64_t v17 = v10;
        unint64_t v7 = v15;
        unint64_t v4 = a2;
        switch((char)v10)
        {
          case 0:
            break;
          case 1:
            ADClientClearScalarKey();
            break;
          case 2:
            ADClientSetValueForScalarKey();
            break;
          case 3:
            ADClientAddValueForScalarKey();
            break;
          case 4:
            ADClientClearDistributionKey();
            break;
          case 5:
            ADClientSetValueForDistributionKey();
            break;
          default:
            unint64_t v19 = v10 - 5LL;
            unint64_t v7 = a2;
            unint64_t v4 = a2;
            if (v17 != 5)
            {
              unsigned int v20 = 1;
              do
                ADClientPushValueForDistributionKey();
              while (v19 > v20++);
            }

            break;
        }
      }

      else
      {
        v18 = *(os_log_s **)(v7 + 2544);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v25 = "publishADData";
          __int16 v26 = 1024;
          int v27 = v8;
          __int16 v28 = 1024;
          LODWORD(v29) = 74;
          _os_log_error_impl( &dword_1890A6000,  v18,  OS_LOG_TYPE_ERROR,  "%s spuaggdkeys version mismatch (%#x/%#x)",  buf,  0x18u);
        }
      }

      uint64_t v5 = ++v6;
    }

    while (v6 < a3);
  }
}

void AppleSPUHIDStatisticsFactory(const __CFAllocator *a1, const void *a2)
{
  CFUUIDRef v4 = CFUUIDGetConstantUUIDWithBytes( (CFAllocatorRef)*MEMORY[0x189604DD0],  0x7Fu,  0x1Au,  0x3Au,  0xE6u,  0x3Eu,  0x3Du,  0x47u,  0xAu,  0xBDu,  0x15u,  0xA2u,  0xDDu,  0x7Eu,  0x1Bu,  0xB7u,  0x19u);
  if (CFEqual(a2, v4))
  {
    uint64_t v5 = (AppleSPUHIDStatistics *)MEMORY[0x1895DE938](a1, 632LL, 0LL);
    AppleSPUHIDStatistics::AppleSPUHIDStatistics(v5, a1);
  }

void spu_profile_print(int *a1)
{
  int v1 = CopyProfileDescription(a1);
  if (v1)
  {
    CFTypeID v2 = v1;
    CStringPtr = CFStringGetCStringPtr(v1, 0);
    puts(CStringPtr);
    CFRelease(v2);
  }

CFStringRef CopyProfileDescription(int *a1)
{
  std::stringbuf::string_type __p = v4;
  if ((v4.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    p_p = &__p;
  }
  else {
    p_p = (std::stringbuf::string_type *)__p.__r_.__value_.__r.__words[0];
  }
  CFStringRef v2 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x189604DB0], (const char *)p_p, 0x8000100u);
  return v2;
}

void sub_1890A8240(void *a1)
{
}

void sub_1890A824C( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  if (a18 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

std::string *profile_decoder::find_in_table@<X0>( const entry *a1@<X1>, unsigned int __val@<W3>, unsigned int a3@<W2>, std::string *a4@<X8>)
{
  if (!a3) {
    return std::to_string(a4, __val);
  }
  uint64_t v5 = a3;
  for (i = &a1->data; *((_DWORD *)i - 2) != __val; i += 2)
  {
    if (!--v5) {
      return std::to_string(a4, __val);
    }
  }

  return (std::string *)sub_1890AE7B4(a4, (char *)*i);
}

uint64_t profile_decoder::dump@<X0>(int a1@<W2>, std::stringbuf::string_type *a2@<X8>)
{
  if (a1)
  {
    uint64_t v6 = 0LL;
    do
    {
      if (v6) {
        sub_1890AE8EC(&v10, (uint64_t)",", 1LL);
      }
      std::ostream::operator<<();
      ++v6;
    }

    while (a1 != v6);
  }

  sub_1890AE8EC(&v10, (uint64_t)"]", 1LL);
  std::stringbuf::str(a2, &v11);
  v9[0] = *MEMORY[0x189614728];
  uint64_t v7 = *(void *)(MEMORY[0x189614728] + 72LL);
  *(void *)((char *)v9 + *(void *)(v9[0] - 24LL)) = *(void *)(MEMORY[0x189614728] + 64LL);
  uint64_t v10 = v7;
  v11.__vftable = (std::stringbuf_vtbl *)(MEMORY[0x189614750] + 16LL);
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  return MEMORY[0x1895DEBD8](&v12);
}

void sub_1890A83CC(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

uint64_t sub_1890A83E4(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x189614758];
  uint64_t v3 = MEMORY[0x189614758] + 104LL;
  *(void *)(a1 + 128) = MEMORY[0x189614758] + 104LL;
  *(void *)(a1 + 16) = v2 + 64;
  uint64_t v4 = a1 + 16;
  uint64_t v5 = (void *)MEMORY[0x189614728];
  uint64_t v6 = *(void *)(MEMORY[0x189614728] + 16LL);
  uint64_t v7 = *(void *)(MEMORY[0x189614728] + 24LL);
  *(void *)a1 = v6;
  *(void *)(a1 + *(void *)(v6 - 24)) = v7;
  *(void *)(a1 + 8) = 0LL;
  int v8 = (std::ios_base *)(a1 + *(void *)(*(void *)a1 - 24LL));
  std::ios_base::init(v8, (void *)(a1 + 24));
  v8[1].__vftable = 0LL;
  v8[1].__fmtflags_ = -1;
  uint64_t v9 = v5[4];
  uint64_t v10 = v5[5];
  *(void *)(a1 + 16) = v9;
  *(void *)(v4 + *(void *)(v9 - 24)) = v10;
  uint64_t v11 = v5[1];
  *(void *)a1 = v11;
  *(void *)(a1 + *(void *)(v11 - 24)) = v5[6];
  *(void *)a1 = v2 + 24;
  *(void *)(a1 + 128) = v3;
  *(void *)(a1 + 16) = v2 + 64;
  std::streambuf::basic_streambuf();
  *(void *)(a1 + 24) = MEMORY[0x189614750] + 16LL;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_DWORD *)(a1 + 120) = 24;
  return a1;
}

void sub_1890A84E8(_Unwind_Exception *a1)
{
}

uint64_t sub_1890A8510(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x189614728];
  uint64_t v3 = *MEMORY[0x189614728];
  *(void *)a1 = *MEMORY[0x189614728];
  uint64_t v4 = *(void *)(v2 + 72);
  *(void *)(a1 + *(void *)(v3 - 24)) = *(void *)(v2 + 64);
  *(void *)(a1 + 24) = MEMORY[0x189614750] + 16LL;
  *(void *)(a1 + 16) = v4;
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x1895DEBD8](a1 + 128);
  return a1;
}

std::string *profile_decoder::category_name@<X0>(unsigned int __val@<W1>, std::string *a2@<X8>)
{
  return profile_decoder::find_in_table((const entry *)&unk_18A3428B8, __val, 0xDu, a2);
}

std::string *profile_decoder::component_name@<X0>(unsigned int __val@<W1>, std::string *a2@<X8>)
{
  return std::to_string(a2, __val);
}

std::string *profile_decoder::event_name@<X0>(unsigned int __val@<W2>, std::string *a2@<X8>)
{
  return std::to_string(a2, __val);
}

void profile_decoder::parse_datatype(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v408 = *MEMORY[0x1895F89C0];
  switch(*(_BYTE *)a3)
  {
    case 1:
      sub_1890AE7B4(&v322, "subtype");
      profile_decoder::key(&v405);
      if ((v405.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        uint64_t v5 = &v405;
      }
      else {
        uint64_t v5 = (std::string *)v405.__r_.__value_.__r.__words[0];
      }
      if ((v405.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        uint64_t size = v405.__r_.__value_.__s.__size_;
      }
      else {
        uint64_t size = v405.__r_.__value_.__l.__size_;
      }
      uint64_t v7 = sub_1890AE8EC((void *)(a2 + 16), (uint64_t)v5, size);
      *(void *)((char *)v7 + *(void *)(*v7 - 24LL) + 24) = 10LL;
      int v8 = (void *)std::ostream::operator<<();
      uint64_t v9 = sub_1890AE8EC(v8, (uint64_t)",", 1LL);
      sub_1890AE7B4(&v320, "packet-size");
      profile_decoder::key(&v402);
      if ((v402.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        uint64_t v10 = &v402;
      }
      else {
        uint64_t v10 = (std::string *)v402.__r_.__value_.__r.__words[0];
      }
      if ((v402.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        uint64_t v11 = v402.__r_.__value_.__s.__size_;
      }
      else {
        uint64_t v11 = v402.__r_.__value_.__l.__size_;
      }
      uint64_t v12 = sub_1890AE8EC(v9, (uint64_t)v10, v11);
      *(void *)((char *)v12 + *(void *)(*v12 - 24LL) + 24) = 10LL;
      unint64_t v13 = (void *)std::ostream::operator<<();
      v14 = sub_1890AE8EC(v13, (uint64_t)",", 1LL);
      sub_1890AE7B4(&v318, "data-length");
      profile_decoder::key(&v399);
      if ((v399.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        unint64_t v15 = &v399;
      }
      else {
        unint64_t v15 = (std::string *)v399.__r_.__value_.__r.__words[0];
      }
      if ((v399.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        uint64_t v16 = v399.__r_.__value_.__s.__size_;
      }
      else {
        uint64_t v16 = v399.__r_.__value_.__l.__size_;
      }
      uint64_t v17 = sub_1890AE8EC(v14, (uint64_t)v15, v16);
      *(void *)((char *)v17 + *(void *)(*v17 - 24LL) + 24) = 10LL;
      v18 = (void *)std::ostream::operator<<();
      unint64_t v19 = sub_1890AE8EC(v18, (uint64_t)",", 1LL);
      sub_1890AE7B4(&v316, "data-offset");
      profile_decoder::key(&v396);
      if ((v396.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        unsigned int v20 = &v396;
      }
      else {
        unsigned int v20 = (std::string *)v396.__r_.__value_.__r.__words[0];
      }
      if ((v396.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        uint64_t v21 = v396.__r_.__value_.__s.__size_;
      }
      else {
        uint64_t v21 = v396.__r_.__value_.__l.__size_;
      }
      io_service_t v22 = sub_1890AE8EC(v19, (uint64_t)v20, v21);
      *(void *)((char *)v22 + *(void *)(*v22 - 24LL) + 24) = 10LL;
      v23 = (void *)std::ostream::operator<<();
      v24 = sub_1890AE8EC(v23, (uint64_t)",", 1LL);
      sub_1890AE7B4(&v314, "raw-data");
      profile_decoder::key(&v393);
      if ((v393.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        v25 = &v393;
      }
      else {
        v25 = (std::string *)v393.__r_.__value_.__r.__words[0];
      }
      if ((v393.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        uint64_t v26 = v393.__r_.__value_.__s.__size_;
      }
      else {
        uint64_t v26 = v393.__r_.__value_.__l.__size_;
      }
      int v27 = sub_1890AE8EC(v24, (uint64_t)v25, v26);
      *(void *)((char *)v27 + *(void *)(*v27 - 24LL) + 24) = 10LL;
      else {
        int v28 = *(unsigned __int16 *)(a3 + 20);
      }
      profile_decoder::dump(v28, &__p);
      if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        p_p = &__p;
      }
      else {
        p_p = (std::stringbuf::string_type *)__p.__r_.__value_.__r.__words[0];
      }
      if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        uint64_t v30 = __p.__r_.__value_.__s.__size_;
      }
      else {
        uint64_t v30 = __p.__r_.__value_.__l.__size_;
      }
      int v31 = sub_1890AE8EC(v27, (uint64_t)p_p, v30);
      sub_1890AE8EC(v31, (uint64_t)",", 1LL);
      if (v315 < 0) {
        operator delete(v314);
      }
      if (v317 < 0) {
        operator delete(v316);
      }
      if (v319 < 0) {
        operator delete(v318);
      }
      if (v321 < 0) {
        operator delete(v320);
      }
      if (v323 < 0)
      {
        uint64_t v32 = v322;
        goto LABEL_601;
      }

      break;
    case 2:
      sub_1890AE7B4(&v312, "subtype");
      profile_decoder::key(&v405);
      if ((v405.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        v33 = &v405;
      }
      else {
        v33 = (std::string *)v405.__r_.__value_.__r.__words[0];
      }
      if ((v405.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        uint64_t v34 = v405.__r_.__value_.__s.__size_;
      }
      else {
        uint64_t v34 = v405.__r_.__value_.__l.__size_;
      }
      v35 = sub_1890AE8EC((void *)(a2 + 16), (uint64_t)v33, v34);
      *(void *)((char *)v35 + *(void *)(*v35 - 24LL) + 24) = 10LL;
      v36 = (void *)std::ostream::operator<<();
      v37 = sub_1890AE8EC(v36, (uint64_t)",", 1LL);
      sub_1890AE7B4(&v310, "packet-size");
      profile_decoder::key(&v402);
      if ((v402.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        v38 = &v402;
      }
      else {
        v38 = (std::string *)v402.__r_.__value_.__r.__words[0];
      }
      if ((v402.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        uint64_t v39 = v402.__r_.__value_.__s.__size_;
      }
      else {
        uint64_t v39 = v402.__r_.__value_.__l.__size_;
      }
      __int16 v40 = sub_1890AE8EC(v37, (uint64_t)v38, v39);
      *(void *)((char *)v40 + *(void *)(*v40 - 24LL) + 24) = 10LL;
      v41 = (void *)std::ostream::operator<<();
      __int16 v42 = sub_1890AE8EC(v41, (uint64_t)",", 1LL);
      sub_1890AE7B4(&v308, "data-length");
      profile_decoder::key(&v399);
      if ((v399.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        v43 = &v399;
      }
      else {
        v43 = (std::string *)v399.__r_.__value_.__r.__words[0];
      }
      if ((v399.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        uint64_t v44 = v399.__r_.__value_.__s.__size_;
      }
      else {
        uint64_t v44 = v399.__r_.__value_.__l.__size_;
      }
      v45 = sub_1890AE8EC(v42, (uint64_t)v43, v44);
      *(void *)((char *)v45 + *(void *)(*v45 - 24LL) + 24) = 10LL;
      __int16 v46 = (void *)std::ostream::operator<<();
      int v47 = sub_1890AE8EC(v46, (uint64_t)",", 1LL);
      sub_1890AE7B4(&v306, "data-offset");
      profile_decoder::key(&v396);
      if ((v396.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        __int16 v48 = &v396;
      }
      else {
        __int16 v48 = (std::string *)v396.__r_.__value_.__r.__words[0];
      }
      if ((v396.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        uint64_t v49 = v396.__r_.__value_.__s.__size_;
      }
      else {
        uint64_t v49 = v396.__r_.__value_.__l.__size_;
      }
      v50 = sub_1890AE8EC(v47, (uint64_t)v48, v49);
      *(void *)((char *)v50 + *(void *)(*v50 - 24LL) + 24) = 10LL;
      uint64_t v51 = (void *)std::ostream::operator<<();
      v52 = sub_1890AE8EC(v51, (uint64_t)",", 1LL);
      sub_1890AE7B4(&v304, "raw-data");
      profile_decoder::key(&v393);
      if ((v393.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        v53 = &v393;
      }
      else {
        v53 = (std::string *)v393.__r_.__value_.__r.__words[0];
      }
      if ((v393.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        uint64_t v54 = v393.__r_.__value_.__s.__size_;
      }
      else {
        uint64_t v54 = v393.__r_.__value_.__l.__size_;
      }
      v55 = sub_1890AE8EC(v52, (uint64_t)v53, v54);
      *(void *)((char *)v55 + *(void *)(*v55 - 24LL) + 24) = 10LL;
      profile_decoder::dump(30, &__p);
      if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        v56 = &__p;
      }
      else {
        v56 = (std::stringbuf::string_type *)__p.__r_.__value_.__r.__words[0];
      }
      if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        uint64_t v57 = __p.__r_.__value_.__s.__size_;
      }
      else {
        uint64_t v57 = __p.__r_.__value_.__l.__size_;
      }
      v58 = sub_1890AE8EC(v55, (uint64_t)v56, v57);
      sub_1890AE8EC(v58, (uint64_t)",", 1LL);
      if (v305 < 0) {
        operator delete(v304);
      }
      if (v307 < 0) {
        operator delete(v306);
      }
      if (v309 < 0) {
        operator delete(v308);
      }
      if (v311 < 0) {
        operator delete(v310);
      }
      if (v313 < 0)
      {
        uint64_t v32 = v312;
        goto LABEL_601;
      }

      break;
    case 3:
      sub_1890AE7B4(&v403, "arg1");
      profile_decoder::key(&v405);
      if ((v405.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        v59 = &v405;
      }
      else {
        v59 = (std::string *)v405.__r_.__value_.__r.__words[0];
      }
      if ((v405.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        uint64_t v60 = v405.__r_.__value_.__s.__size_;
      }
      else {
        uint64_t v60 = v405.__r_.__value_.__l.__size_;
      }
      v61 = sub_1890AE8EC((void *)(a2 + 16), (uint64_t)v59, v60);
      *(void *)((char *)v61 + *(void *)(*v61 - 24LL) + 24) = 10LL;
      v62 = (void *)std::ostream::operator<<();
      v63 = sub_1890AE8EC(v62, (uint64_t)",", 1LL);
      sub_1890AE7B4(&v400, "arg2");
      profile_decoder::key(&v402);
      if ((v402.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        v64 = &v402;
      }
      else {
        v64 = (std::string *)v402.__r_.__value_.__r.__words[0];
      }
      if ((v402.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        uint64_t v65 = v402.__r_.__value_.__s.__size_;
      }
      else {
        uint64_t v65 = v402.__r_.__value_.__l.__size_;
      }
      v66 = sub_1890AE8EC(v63, (uint64_t)v64, v65);
      *(void *)((char *)v66 + *(void *)(*v66 - 24LL) + 24) = 10LL;
      v67 = (void *)std::ostream::operator<<();
      v68 = sub_1890AE8EC(v67, (uint64_t)",", 1LL);
      sub_1890AE7B4(&v397, "arg3");
      profile_decoder::key(&v399);
      if ((v399.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        v69 = &v399;
      }
      else {
        v69 = (std::string *)v399.__r_.__value_.__r.__words[0];
      }
      if ((v399.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        uint64_t v70 = v399.__r_.__value_.__s.__size_;
      }
      else {
        uint64_t v70 = v399.__r_.__value_.__l.__size_;
      }
      v71 = sub_1890AE8EC(v68, (uint64_t)v69, v70);
      *(void *)((char *)v71 + *(void *)(*v71 - 24LL) + 24) = 10LL;
      v72 = (void *)std::ostream::operator<<();
      v73 = sub_1890AE8EC(v72, (uint64_t)",", 1LL);
      sub_1890AE7B4(&v394, "arg4");
      profile_decoder::key(&v396);
      if ((v396.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        v74 = &v396;
      }
      else {
        v74 = (std::string *)v396.__r_.__value_.__r.__words[0];
      }
      if ((v396.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        uint64_t v75 = v396.__r_.__value_.__s.__size_;
      }
      else {
        uint64_t v75 = v396.__r_.__value_.__l.__size_;
      }
      v76 = sub_1890AE8EC(v73, (uint64_t)v74, v75);
      *(void *)((char *)v76 + *(void *)(*v76 - 24LL) + 24) = 10LL;
      v77 = (void *)std::ostream::operator<<();
      v78 = sub_1890AE8EC(v77, (uint64_t)",", 1LL);
      sub_1890AE7B4(&v391, "arg5");
      profile_decoder::key(&v393);
      if ((v393.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        v79 = &v393;
      }
      else {
        v79 = (std::string *)v393.__r_.__value_.__r.__words[0];
      }
      if ((v393.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        uint64_t v80 = v393.__r_.__value_.__s.__size_;
      }
      else {
        uint64_t v80 = v393.__r_.__value_.__l.__size_;
      }
      v81 = sub_1890AE8EC(v78, (uint64_t)v79, v80);
      *(void *)((char *)v81 + *(void *)(*v81 - 24LL) + 24) = 10LL;
      v82 = (void *)std::ostream::operator<<();
      v83 = sub_1890AE8EC(v82, (uint64_t)",", 1LL);
      sub_1890AE7B4(&v388, "arg6");
      profile_decoder::key(&__p);
      if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        v84 = &__p;
      }
      else {
        v84 = (std::stringbuf::string_type *)__p.__r_.__value_.__r.__words[0];
      }
      if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        uint64_t v85 = __p.__r_.__value_.__s.__size_;
      }
      else {
        uint64_t v85 = __p.__r_.__value_.__l.__size_;
      }
      v86 = sub_1890AE8EC(v83, (uint64_t)v84, v85);
      *(void *)((char *)v86 + *(void *)(*v86 - 24LL) + 24) = 10LL;
      v87 = (void *)std::ostream::operator<<();
      v88 = sub_1890AE8EC(v87, (uint64_t)",", 1LL);
      *(_DWORD *)((char *)v88 + *(void *)(*v88 - 24LL) + 8) = *(_DWORD *)((_BYTE *)v88 + *(void *)(*v88 - 24LL) + 8) & 0xFFFFFFB5 | 8;
      sub_1890AE7B4(&v386, "xarg1");
      profile_decoder::key(&v407);
      if ((v407.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        v89 = &v407;
      }
      else {
        v89 = (std::string *)v407.__r_.__value_.__r.__words[0];
      }
      if ((v407.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        uint64_t v90 = v407.__r_.__value_.__s.__size_;
      }
      else {
        uint64_t v90 = v407.__r_.__value_.__l.__size_;
      }
      v91 = sub_1890AE8EC(v88, (uint64_t)v89, v90);
      *(void *)((char *)v91 + *(void *)(*v91 - 24LL) + 24) = 10LL;
      sub_1890AE8EC(v91, (uint64_t)"'", 1LL);
      v92 = (void *)std::ostream::operator<<();
      v93 = sub_1890AE8EC(v92, (uint64_t)"',", 2LL);
      sub_1890AE7B4(&v383, "xarg2");
      profile_decoder::key(&v385);
      if ((v385.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        v94 = &v385;
      }
      else {
        v94 = (std::string *)v385.__r_.__value_.__r.__words[0];
      }
      if ((v385.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        uint64_t v95 = v385.__r_.__value_.__s.__size_;
      }
      else {
        uint64_t v95 = v385.__r_.__value_.__l.__size_;
      }
      v96 = sub_1890AE8EC(v93, (uint64_t)v94, v95);
      *(void *)((char *)v96 + *(void *)(*v96 - 24LL) + 24) = 10LL;
      sub_1890AE8EC(v96, (uint64_t)"'", 1LL);
      v97 = (void *)std::ostream::operator<<();
      v98 = sub_1890AE8EC(v97, (uint64_t)"',", 2LL);
      sub_1890AE7B4(&v380, "xarg3");
      profile_decoder::key(&v382);
      if ((v382.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        v99 = &v382;
      }
      else {
        v99 = (std::string *)v382.__r_.__value_.__r.__words[0];
      }
      if ((v382.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        uint64_t v100 = v382.__r_.__value_.__s.__size_;
      }
      else {
        uint64_t v100 = v382.__r_.__value_.__l.__size_;
      }
      v101 = sub_1890AE8EC(v98, (uint64_t)v99, v100);
      *(void *)((char *)v101 + *(void *)(*v101 - 24LL) + 24) = 10LL;
      sub_1890AE8EC(v101, (uint64_t)"'", 1LL);
      v102 = (void *)std::ostream::operator<<();
      v103 = sub_1890AE8EC(v102, (uint64_t)"',", 2LL);
      sub_1890AE7B4(&v378, "xarg4");
      profile_decoder::key(&__s);
      if ((__s.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        p_s = &__s;
      }
      else {
        p_s = (std::string *)__s.__r_.__value_.__r.__words[0];
      }
      if ((__s.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        uint64_t v105 = __s.__r_.__value_.__s.__size_;
      }
      else {
        uint64_t v105 = __s.__r_.__value_.__l.__size_;
      }
      v106 = sub_1890AE8EC(v103, (uint64_t)p_s, v105);
      *(void *)((char *)v106 + *(void *)(*v106 - 24LL) + 24) = 10LL;
      sub_1890AE8EC(v106, (uint64_t)"'", 1LL);
      v107 = (void *)std::ostream::operator<<();
      v108 = sub_1890AE8EC(v107, (uint64_t)"',", 2LL);
      sub_1890AE7B4(&v375, "xarg5");
      profile_decoder::key(&v377);
      if ((v377.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        v109 = &v377;
      }
      else {
        v109 = (std::string *)v377.__r_.__value_.__r.__words[0];
      }
      if ((v377.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        uint64_t v110 = v377.__r_.__value_.__s.__size_;
      }
      else {
        uint64_t v110 = v377.__r_.__value_.__l.__size_;
      }
      v111 = sub_1890AE8EC(v108, (uint64_t)v109, v110);
      *(void *)((char *)v111 + *(void *)(*v111 - 24LL) + 24) = 10LL;
      sub_1890AE8EC(v111, (uint64_t)"'", 1LL);
      v112 = (void *)std::ostream::operator<<();
      v113 = sub_1890AE8EC(v112, (uint64_t)"',", 2LL);
      sub_1890AE7B4(&v372, "xarg6");
      profile_decoder::key(&v374);
      if ((v374.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        v114 = &v374;
      }
      else {
        v114 = (std::string *)v374.__r_.__value_.__r.__words[0];
      }
      if ((v374.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        uint64_t v115 = v374.__r_.__value_.__s.__size_;
      }
      else {
        uint64_t v115 = v374.__r_.__value_.__l.__size_;
      }
      v116 = sub_1890AE8EC(v113, (uint64_t)v114, v115);
      *(void *)((char *)v116 + *(void *)(*v116 - 24LL) + 24) = 10LL;
      sub_1890AE8EC(v116, (uint64_t)"'", 1LL);
      v117 = (void *)std::ostream::operator<<();
      v118 = sub_1890AE8EC(v117, (uint64_t)"',", 2LL);
      *(_DWORD *)((char *)v118 + *(void *)(*v118 - 24LL) + 8) = *(_DWORD *)((_BYTE *)v118
                                                                            + *(void *)(*v118 - 24LL)
                                                                            + 8) & 0xFFFFFFB5 | 2;
      if (v373 < 0) {
        operator delete(v372);
      }
      if (v376 < 0) {
        operator delete(v375);
      }
      if (v379 < 0) {
        operator delete(v378);
      }
      if (v381 < 0) {
        operator delete(v380);
      }
      if (v384 < 0) {
        operator delete(v383);
      }
      if (v387 < 0) {
        operator delete(v386);
      }
      if (v389 < 0) {
        operator delete(v388);
      }
      if (v392 < 0) {
        operator delete(v391);
      }
      if (v395 < 0) {
        operator delete(v394);
      }
      if (v398 < 0) {
        operator delete(v397);
      }
      if (v401 < 0) {
        operator delete(v400);
      }
      if (v404 < 0)
      {
        uint64_t v32 = v403;
        goto LABEL_601;
      }

      break;
    case 4:
      sub_1890AE7B4(&v370, "trigger");
      profile_decoder::key(&v405);
      if ((v405.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        v212 = &v405;
      }
      else {
        v212 = (std::string *)v405.__r_.__value_.__r.__words[0];
      }
      if ((v405.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        uint64_t v213 = v405.__r_.__value_.__s.__size_;
      }
      else {
        uint64_t v213 = v405.__r_.__value_.__l.__size_;
      }
      sub_1890AE8EC((void *)(a2 + 16), (uint64_t)v212, v213);
      v214 = (void *)std::ostream::operator<<();
      v215 = sub_1890AE8EC(v214, (uint64_t)",", 1LL);
      sub_1890AE7B4(&v368, "thread-id");
      profile_decoder::key(&v402);
      if ((v402.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        v216 = &v402;
      }
      else {
        v216 = (std::string *)v402.__r_.__value_.__r.__words[0];
      }
      if ((v402.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        uint64_t v217 = v402.__r_.__value_.__s.__size_;
      }
      else {
        uint64_t v217 = v402.__r_.__value_.__l.__size_;
      }
      v218 = sub_1890AE8EC(v215, (uint64_t)v216, v217);
      *(void *)((char *)v218 + *(void *)(*v218 - 24LL) + 24) = 10LL;
      v219 = (void *)std::ostream::operator<<();
      v220 = sub_1890AE8EC(v219, (uint64_t)",", 1LL);
      sub_1890AE7B4(&v366, "arg");
      profile_decoder::key(&v399);
      if ((v399.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        v221 = &v399;
      }
      else {
        v221 = (std::string *)v399.__r_.__value_.__r.__words[0];
      }
      if ((v399.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        uint64_t v222 = v399.__r_.__value_.__s.__size_;
      }
      else {
        uint64_t v222 = v399.__r_.__value_.__l.__size_;
      }
      v223 = sub_1890AE8EC(v220, (uint64_t)v221, v222);
      *(void *)((char *)v223 + *(void *)(*v223 - 24LL) + 24) = 10LL;
      v224 = (void *)std::ostream::operator<<();
      sub_1890AE8EC(v224, (uint64_t)",", 1LL);
      if (v367 < 0) {
        operator delete(v366);
      }
      if (v369 < 0) {
        operator delete(v368);
      }
      if (v371 < 0)
      {
        uint64_t v32 = v370;
        goto LABEL_601;
      }

      break;
    case 5:
      sub_1890AE7B4(&v334, "function-id");
      profile_decoder::key(&v405);
      if ((v405.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        v225 = &v405;
      }
      else {
        v225 = (std::string *)v405.__r_.__value_.__r.__words[0];
      }
      if ((v405.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        uint64_t v226 = v405.__r_.__value_.__s.__size_;
      }
      else {
        uint64_t v226 = v405.__r_.__value_.__l.__size_;
      }
      v227 = sub_1890AE8EC((void *)(a2 + 16), (uint64_t)v225, v226);
      *(void *)((char *)v227 + *(void *)(*v227 - 24LL) + 24) = 10LL;
      v228 = (void *)std::ostream::operator<<();
      v229 = sub_1890AE8EC(v228, (uint64_t)",", 1LL);
      sub_1890AE7B4(&v332, "extra-id");
      profile_decoder::key(&v402);
      if ((v402.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        v230 = &v402;
      }
      else {
        v230 = (std::string *)v402.__r_.__value_.__r.__words[0];
      }
      if ((v402.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        uint64_t v231 = v402.__r_.__value_.__s.__size_;
      }
      else {
        uint64_t v231 = v402.__r_.__value_.__l.__size_;
      }
      v232 = sub_1890AE8EC(v229, (uint64_t)v230, v231);
      *(void *)((char *)v232 + *(void *)(*v232 - 24LL) + 24) = 10LL;
      v233 = (void *)std::ostream::operator<<();
      v234 = sub_1890AE8EC(v233, (uint64_t)",", 1LL);
      sub_1890AE7B4(&v330, "thread-id");
      profile_decoder::key(&v399);
      if ((v399.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        v235 = &v399;
      }
      else {
        v235 = (std::string *)v399.__r_.__value_.__r.__words[0];
      }
      if ((v399.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        uint64_t v236 = v399.__r_.__value_.__s.__size_;
      }
      else {
        uint64_t v236 = v399.__r_.__value_.__l.__size_;
      }
      v237 = sub_1890AE8EC(v234, (uint64_t)v235, v236);
      *(void *)((char *)v237 + *(void *)(*v237 - 24LL) + 24) = 10LL;
      v238 = (void *)std::ostream::operator<<();
      v239 = sub_1890AE8EC(v238, (uint64_t)",", 1LL);
      sub_1890AE7B4(&v328, "duration");
      profile_decoder::key(&v396);
      if ((v396.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        v240 = &v396;
      }
      else {
        v240 = (std::string *)v396.__r_.__value_.__r.__words[0];
      }
      if ((v396.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        uint64_t v241 = v396.__r_.__value_.__s.__size_;
      }
      else {
        uint64_t v241 = v396.__r_.__value_.__l.__size_;
      }
      v242 = sub_1890AE8EC(v239, (uint64_t)v240, v241);
      *(void *)((char *)v242 + *(void *)(*v242 - 24LL) + 24) = 10LL;
      v243 = (void *)std::ostream::operator<<();
      v244 = sub_1890AE8EC(v243, (uint64_t)",", 1LL);
      sub_1890AE7B4(&v326, "depth");
      profile_decoder::key(&v393);
      if ((v393.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        v245 = &v393;
      }
      else {
        v245 = (std::string *)v393.__r_.__value_.__r.__words[0];
      }
      if ((v393.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        uint64_t v246 = v393.__r_.__value_.__s.__size_;
      }
      else {
        uint64_t v246 = v393.__r_.__value_.__l.__size_;
      }
      v247 = sub_1890AE8EC(v244, (uint64_t)v245, v246);
      *(void *)((char *)v247 + *(void *)(*v247 - 24LL) + 24) = 10LL;
      v248 = (void *)std::ostream::operator<<();
      v249 = sub_1890AE8EC(v248, (uint64_t)",", 1LL);
      sub_1890AE7B4(&v324, "thread_duration");
      profile_decoder::key(&__p);
      if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        v250 = &__p;
      }
      else {
        v250 = (std::stringbuf::string_type *)__p.__r_.__value_.__r.__words[0];
      }
      if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        uint64_t v251 = __p.__r_.__value_.__s.__size_;
      }
      else {
        uint64_t v251 = __p.__r_.__value_.__l.__size_;
      }
      v252 = sub_1890AE8EC(v249, (uint64_t)v250, v251);
      *(void *)((char *)v252 + *(void *)(*v252 - 24LL) + 24) = 10LL;
      v253 = (void *)std::ostream::operator<<();
      sub_1890AE8EC(v253, (uint64_t)",", 1LL);
      if (v325 < 0) {
        operator delete(v324);
      }
      if (v327 < 0) {
        operator delete(v326);
      }
      if (v329 < 0) {
        operator delete(v328);
      }
      if (v331 < 0) {
        operator delete(v330);
      }
      if (v333 < 0) {
        operator delete(v332);
      }
      if (v335 < 0)
      {
        uint64_t v32 = v334;
        goto LABEL_601;
      }

      break;
    case 8:
      __s.__r_.__value_.__s.__data_[12] = 0;
      __s.__r_.__value_.__r.__words[0] = *(void *)(a3 + 35);
      LODWORD(__s.__r_.__value_.__r.__words[1]) = *(_DWORD *)(a3 + 43);
      sub_1890AE7B4(&v364, "name");
      profile_decoder::key(&v405);
      if ((v405.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        v119 = &v405;
      }
      else {
        v119 = (std::string *)v405.__r_.__value_.__r.__words[0];
      }
      if ((v405.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        uint64_t v120 = v405.__r_.__value_.__s.__size_;
      }
      else {
        uint64_t v120 = v405.__r_.__value_.__l.__size_;
      }
      v121 = sub_1890AE8EC((void *)(a2 + 16), (uint64_t)v119, v120);
      *(void *)((char *)v121 + *(void *)(*v121 - 24LL) + 24) = 16LL;
      sub_1890AE7B4(&v362, (char *)&__s);
      profile_decoder::str(&v402);
      if ((v402.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        v122 = &v402;
      }
      else {
        v122 = (std::string *)v402.__r_.__value_.__r.__words[0];
      }
      if ((v402.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        uint64_t v123 = v402.__r_.__value_.__s.__size_;
      }
      else {
        uint64_t v123 = v402.__r_.__value_.__l.__size_;
      }
      v124 = sub_1890AE8EC(v121, (uint64_t)v122, v123);
      v125 = sub_1890AE8EC(v124, (uint64_t)",", 1LL);
      sub_1890AE7B4(&v360, "report-interval");
      profile_decoder::key(&v399);
      if ((v399.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        v126 = &v399;
      }
      else {
        v126 = (std::string *)v399.__r_.__value_.__r.__words[0];
      }
      if ((v399.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        uint64_t v127 = v399.__r_.__value_.__s.__size_;
      }
      else {
        uint64_t v127 = v399.__r_.__value_.__l.__size_;
      }
      v128 = sub_1890AE8EC(v125, (uint64_t)v126, v127);
      *(void *)((char *)v128 + *(void *)(*v128 - 24LL) + 24) = 10LL;
      v129 = (void *)std::ostream::operator<<();
      v130 = sub_1890AE8EC(v129, (uint64_t)",", 1LL);
      sub_1890AE7B4(&v358, "batch-interval");
      profile_decoder::key(&v396);
      if ((v396.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        v131 = &v396;
      }
      else {
        v131 = (std::string *)v396.__r_.__value_.__r.__words[0];
      }
      if ((v396.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        uint64_t v132 = v396.__r_.__value_.__s.__size_;
      }
      else {
        uint64_t v132 = v396.__r_.__value_.__l.__size_;
      }
      v133 = sub_1890AE8EC(v130, (uint64_t)v131, v132);
      *(void *)((char *)v133 + *(void *)(*v133 - 24LL) + 24) = 10LL;
      v134 = (void *)std::ostream::operator<<();
      v135 = sub_1890AE8EC(v134, (uint64_t)",", 1LL);
      sub_1890AE7B4(&v356, "threshold");
      profile_decoder::key(&v393);
      if ((v393.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        v136 = &v393;
      }
      else {
        v136 = (std::string *)v393.__r_.__value_.__r.__words[0];
      }
      if ((v393.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        uint64_t v137 = v393.__r_.__value_.__s.__size_;
      }
      else {
        uint64_t v137 = v393.__r_.__value_.__l.__size_;
      }
      v138 = sub_1890AE8EC(v135, (uint64_t)v136, v137);
      *(void *)((char *)v138 + *(void *)(*v138 - 24LL) + 24) = 10LL;
      v139 = (void *)std::ostream::operator<<();
      v140 = sub_1890AE8EC(v139, (uint64_t)",", 1LL);
      sub_1890AE7B4(&v354, "time-limit");
      profile_decoder::key(&__p);
      if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        v141 = &__p;
      }
      else {
        v141 = (std::stringbuf::string_type *)__p.__r_.__value_.__r.__words[0];
      }
      if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        uint64_t v142 = __p.__r_.__value_.__s.__size_;
      }
      else {
        uint64_t v142 = __p.__r_.__value_.__l.__size_;
      }
      v143 = sub_1890AE8EC(v140, (uint64_t)v141, v142);
      *(void *)((char *)v143 + *(void *)(*v143 - 24LL) + 24) = 10LL;
      v144 = (void *)std::ostream::operator<<();
      v145 = sub_1890AE8EC(v144, (uint64_t)",", 1LL);
      sub_1890AE7B4(&v352, "connected");
      profile_decoder::key(&v407);
      if ((v407.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        v146 = &v407;
      }
      else {
        v146 = (std::string *)v407.__r_.__value_.__r.__words[0];
      }
      if ((v407.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        uint64_t v147 = v407.__r_.__value_.__s.__size_;
      }
      else {
        uint64_t v147 = v407.__r_.__value_.__l.__size_;
      }
      v148 = sub_1890AE8EC(v145, (uint64_t)v146, v147);
      *(void *)((char *)v148 + *(void *)(*v148 - 24LL) + 24) = 10LL;
      v149 = (void *)std::ostream::operator<<();
      v150 = sub_1890AE8EC(v149, (uint64_t)",", 1LL);
      sub_1890AE7B4(&v350, "decimation");
      profile_decoder::key(&v385);
      if ((v385.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        v151 = &v385;
      }
      else {
        v151 = (std::string *)v385.__r_.__value_.__r.__words[0];
      }
      if ((v385.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        uint64_t v152 = v385.__r_.__value_.__s.__size_;
      }
      else {
        uint64_t v152 = v385.__r_.__value_.__l.__size_;
      }
      v153 = sub_1890AE8EC(v150, (uint64_t)v151, v152);
      *(void *)((char *)v153 + *(void *)(*v153 - 24LL) + 24) = 10LL;
      v154 = (void *)std::ostream::operator<<();
      v155 = sub_1890AE8EC(v154, (uint64_t)",", 1LL);
      sub_1890AE7B4(&v348, "gyroPowerMode");
      profile_decoder::key(&v382);
      if ((v382.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        v156 = &v382;
      }
      else {
        v156 = (std::string *)v382.__r_.__value_.__r.__words[0];
      }
      if ((v382.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        uint64_t v157 = v382.__r_.__value_.__s.__size_;
      }
      else {
        uint64_t v157 = v382.__r_.__value_.__l.__size_;
      }
      v158 = sub_1890AE8EC(v155, (uint64_t)v156, v157);
      *(void *)((char *)v158 + *(void *)(*v158 - 24LL) + 24) = 10LL;
      v159 = (void *)std::ostream::operator<<();
      sub_1890AE8EC(v159, (uint64_t)",", 1LL);
      if (v349 < 0) {
        operator delete(v348);
      }
      if (v351 < 0) {
        operator delete(v350);
      }
      if (v353 < 0) {
        operator delete(v352);
      }
      if (v355 < 0) {
        operator delete(v354);
      }
      if (v357 < 0) {
        operator delete(v356);
      }
      if (v359 < 0) {
        operator delete(v358);
      }
      if (v361 < 0) {
        operator delete(v360);
      }
      if (v363 < 0) {
        operator delete(v362);
      }
      if (v365 < 0)
      {
        uint64_t v32 = v364;
        goto LABEL_601;
      }

      break;
    case 9:
      v407.__r_.__value_.__s.__data_[16] = 0;
      *(_OWORD *)&v407.__r_.__value_.__l.__data_ = *(_OWORD *)(a3 + 32);
      sub_1890AE7B4(&v302, "function");
      profile_decoder::key(&v405);
      if ((v405.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        v160 = &v405;
      }
      else {
        v160 = (std::string *)v405.__r_.__value_.__r.__words[0];
      }
      if ((v405.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        uint64_t v161 = v405.__r_.__value_.__s.__size_;
      }
      else {
        uint64_t v161 = v405.__r_.__value_.__l.__size_;
      }
      v162 = sub_1890AE8EC((void *)(a2 + 16), (uint64_t)v160, v161);
      *(void *)((char *)v162 + *(void *)(*v162 - 24LL) + 24) = 10LL;
      sub_1890AE7B4(&v300, (char *)&v407);
      profile_decoder::str(&v402);
      if ((v402.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        v163 = &v402;
      }
      else {
        v163 = (std::string *)v402.__r_.__value_.__r.__words[0];
      }
      if ((v402.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        uint64_t v164 = v402.__r_.__value_.__s.__size_;
      }
      else {
        uint64_t v164 = v402.__r_.__value_.__l.__size_;
      }
      v165 = sub_1890AE8EC(v162, (uint64_t)v163, v164);
      v166 = sub_1890AE8EC(v165, (uint64_t)",", 1LL);
      sub_1890AE7B4(&v298, "arg");
      profile_decoder::key(&v399);
      if ((v399.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        v167 = &v399;
      }
      else {
        v167 = (std::string *)v399.__r_.__value_.__r.__words[0];
      }
      if ((v399.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        uint64_t v168 = v399.__r_.__value_.__s.__size_;
      }
      else {
        uint64_t v168 = v399.__r_.__value_.__l.__size_;
      }
      v169 = sub_1890AE8EC(v166, (uint64_t)v167, v168);
      *(void *)((char *)v169 + *(void *)(*v169 - 24LL) + 24) = 10LL;
      v170 = (void *)std::ostream::operator<<();
      v171 = sub_1890AE8EC(v170, (uint64_t)",", 1LL);
      sub_1890AE7B4(&v296, "task");
      profile_decoder::key(&v396);
      if ((v396.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        v172 = &v396;
      }
      else {
        v172 = (std::string *)v396.__r_.__value_.__r.__words[0];
      }
      if ((v396.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        uint64_t v173 = v396.__r_.__value_.__s.__size_;
      }
      else {
        uint64_t v173 = v396.__r_.__value_.__l.__size_;
      }
      v174 = sub_1890AE8EC(v171, (uint64_t)v172, v173);
      *(void *)((char *)v174 + *(void *)(*v174 - 24LL) + 24) = 10LL;
      v175 = (void *)std::ostream::operator<<();
      v176 = sub_1890AE8EC(v175, (uint64_t)",", 1LL);
      sub_1890AE7B4(&v294, "thread");
      profile_decoder::key(&v393);
      if ((v393.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        v177 = &v393;
      }
      else {
        v177 = (std::string *)v393.__r_.__value_.__r.__words[0];
      }
      if ((v393.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        uint64_t v178 = v393.__r_.__value_.__s.__size_;
      }
      else {
        uint64_t v178 = v393.__r_.__value_.__l.__size_;
      }
      v179 = sub_1890AE8EC(v176, (uint64_t)v177, v178);
      *(void *)((char *)v179 + *(void *)(*v179 - 24LL) + 24) = 10LL;
      v180 = (void *)std::ostream::operator<<();
      v181 = sub_1890AE8EC(v180, (uint64_t)",", 1LL);
      sub_1890AE7B4(&v292, "duration");
      profile_decoder::key(&__p);
      if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        v182 = &__p;
      }
      else {
        v182 = (std::stringbuf::string_type *)__p.__r_.__value_.__r.__words[0];
      }
      if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        uint64_t v183 = __p.__r_.__value_.__s.__size_;
      }
      else {
        uint64_t v183 = __p.__r_.__value_.__l.__size_;
      }
      v184 = sub_1890AE8EC(v181, (uint64_t)v182, v183);
      *(void *)((char *)v184 + *(void *)(*v184 - 24LL) + 24) = 10LL;
      v185 = (void *)std::ostream::operator<<();
      sub_1890AE8EC(v185, (uint64_t)",", 1LL);
      if (v293 < 0) {
        operator delete(v292);
      }
      if (v295 < 0) {
        operator delete(v294);
      }
      if (v297 < 0) {
        operator delete(v296);
      }
      if (v299 < 0) {
        operator delete(v298);
      }
      if (v301 < 0) {
        operator delete(v300);
      }
      if (v303 < 0)
      {
        uint64_t v32 = v302;
        goto LABEL_601;
      }

      break;
    case 0xB:
      v405.__r_.__value_.__r.__words[0] = *(void *)(a3 + 24);
      sub_1890AE7B4(&v290, "global-id");
      profile_decoder::key(&v402);
      if ((v402.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        v186 = &v402;
      }
      else {
        v186 = (std::string *)v402.__r_.__value_.__r.__words[0];
      }
      if ((v402.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        uint64_t v187 = v402.__r_.__value_.__s.__size_;
      }
      else {
        uint64_t v187 = v402.__r_.__value_.__l.__size_;
      }
      v188 = sub_1890AE8EC((void *)(a2 + 16), (uint64_t)v186, v187);
      *(void *)((char *)v188 + *(void *)(*v188 - 24LL) + 24) = 10LL;
      v189 = (void *)std::ostream::operator<<();
      v190 = sub_1890AE8EC(v189, (uint64_t)",", 1LL);
      sub_1890AE7B4(&v288, "entry-id");
      profile_decoder::key(&v399);
      if ((v399.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        v191 = &v399;
      }
      else {
        v191 = (std::string *)v399.__r_.__value_.__r.__words[0];
      }
      if ((v399.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        uint64_t v192 = v399.__r_.__value_.__s.__size_;
      }
      else {
        uint64_t v192 = v399.__r_.__value_.__l.__size_;
      }
      v193 = sub_1890AE8EC(v190, (uint64_t)v191, v192);
      *(void *)((char *)v193 + *(void *)(*v193 - 24LL) + 24) = 10LL;
      v194 = (void *)std::ostream::operator<<();
      v195 = sub_1890AE8EC(v194, (uint64_t)",", 1LL);
      sub_1890AE7B4(&v286, "entry");
      profile_decoder::key(&v396);
      if ((v396.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        v196 = &v396;
      }
      else {
        v196 = (std::string *)v396.__r_.__value_.__r.__words[0];
      }
      if ((v396.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        uint64_t v197 = v396.__r_.__value_.__s.__size_;
      }
      else {
        uint64_t v197 = v396.__r_.__value_.__l.__size_;
      }
      v198 = sub_1890AE8EC(v195, (uint64_t)v196, v197);
      *(void *)((char *)v198 + *(void *)(*v198 - 24LL) + 24) = 10LL;
      sub_1890AE7B4(&v284, (char *)&v405);
      profile_decoder::str(&v393);
      if ((v393.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        v199 = &v393;
      }
      else {
        v199 = (std::string *)v393.__r_.__value_.__r.__words[0];
      }
      if ((v393.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        uint64_t v200 = v393.__r_.__value_.__s.__size_;
      }
      else {
        uint64_t v200 = v393.__r_.__value_.__l.__size_;
      }
      v201 = sub_1890AE8EC(v198, (uint64_t)v199, v200);
      v202 = sub_1890AE8EC(v201, (uint64_t)",", 1LL);
      sub_1890AE7B4(&v282, "arg1");
      profile_decoder::key(&__p);
      if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        v203 = &__p;
      }
      else {
        v203 = (std::stringbuf::string_type *)__p.__r_.__value_.__r.__words[0];
      }
      if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        uint64_t v204 = __p.__r_.__value_.__s.__size_;
      }
      else {
        uint64_t v204 = __p.__r_.__value_.__l.__size_;
      }
      v205 = sub_1890AE8EC(v202, (uint64_t)v203, v204);
      *(void *)((char *)v205 + *(void *)(*v205 - 24LL) + 24) = 10LL;
      v206 = (void *)std::ostream::operator<<();
      v207 = sub_1890AE8EC(v206, (uint64_t)",", 1LL);
      sub_1890AE7B4(&v280, "arg2");
      profile_decoder::key(&v407);
      if ((v407.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        v208 = &v407;
      }
      else {
        v208 = (std::string *)v407.__r_.__value_.__r.__words[0];
      }
      if ((v407.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        uint64_t v209 = v407.__r_.__value_.__s.__size_;
      }
      else {
        uint64_t v209 = v407.__r_.__value_.__l.__size_;
      }
      v210 = sub_1890AE8EC(v207, (uint64_t)v208, v209);
      *(void *)((char *)v210 + *(void *)(*v210 - 24LL) + 24) = 10LL;
      v211 = (void *)std::ostream::operator<<();
      sub_1890AE8EC(v211, (uint64_t)",", 1LL);
      if (v281 < 0) {
        operator delete(v280);
      }
      if (v283 < 0) {
        operator delete(v282);
      }
      if (v285 < 0) {
        operator delete(v284);
      }
      if (v287 < 0) {
        operator delete(v286);
      }
      if (v289 < 0) {
        operator delete(v288);
      }
      if (v291 < 0)
      {
        uint64_t v32 = v290;
        goto LABEL_601;
      }

      break;
    case 0xC:
      v407.__r_.__value_.__s.__data_[12] = 0;
      v407.__r_.__value_.__r.__words[0] = *(void *)(a3 + 36);
      LODWORD(v407.__r_.__value_.__r.__words[1]) = *(_DWORD *)(a3 + 44);
      sub_1890AE7B4(&v346, "name");
      profile_decoder::key(&v405);
      if ((v405.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        v254 = &v405;
      }
      else {
        v254 = (std::string *)v405.__r_.__value_.__r.__words[0];
      }
      if ((v405.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        uint64_t v255 = v405.__r_.__value_.__s.__size_;
      }
      else {
        uint64_t v255 = v405.__r_.__value_.__l.__size_;
      }
      v256 = sub_1890AE8EC((void *)(a2 + 16), (uint64_t)v254, v255);
      *(void *)((char *)v256 + *(void *)(*v256 - 24LL) + 24) = 16LL;
      sub_1890AE7B4(&v344, (char *)&v407);
      profile_decoder::str(&v402);
      if ((v402.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        v257 = &v402;
      }
      else {
        v257 = (std::string *)v402.__r_.__value_.__r.__words[0];
      }
      if ((v402.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        uint64_t v258 = v402.__r_.__value_.__s.__size_;
      }
      else {
        uint64_t v258 = v402.__r_.__value_.__l.__size_;
      }
      v259 = sub_1890AE8EC(v256, (uint64_t)v257, v258);
      v260 = sub_1890AE8EC(v259, (uint64_t)",", 1LL);
      sub_1890AE7B4(&v342, "sample-interval");
      profile_decoder::key(&v399);
      if ((v399.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        v261 = &v399;
      }
      else {
        v261 = (std::string *)v399.__r_.__value_.__r.__words[0];
      }
      if ((v399.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        uint64_t v262 = v399.__r_.__value_.__s.__size_;
      }
      else {
        uint64_t v262 = v399.__r_.__value_.__l.__size_;
      }
      v263 = sub_1890AE8EC(v260, (uint64_t)v261, v262);
      *(void *)((char *)v263 + *(void *)(*v263 - 24LL) + 24) = 10LL;
      v264 = (void *)std::ostream::operator<<();
      v265 = sub_1890AE8EC(v264, (uint64_t)",", 1LL);
      sub_1890AE7B4(&v340, "report-interval");
      profile_decoder::key(&v396);
      if ((v396.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        v266 = &v396;
      }
      else {
        v266 = (std::string *)v396.__r_.__value_.__r.__words[0];
      }
      if ((v396.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        uint64_t v267 = v396.__r_.__value_.__s.__size_;
      }
      else {
        uint64_t v267 = v396.__r_.__value_.__l.__size_;
      }
      v268 = sub_1890AE8EC(v265, (uint64_t)v266, v267);
      *(void *)((char *)v268 + *(void *)(*v268 - 24LL) + 24) = 10LL;
      v269 = (void *)std::ostream::operator<<();
      v270 = sub_1890AE8EC(v269, (uint64_t)",", 1LL);
      sub_1890AE7B4(&v338, "batch-interval");
      profile_decoder::key(&v393);
      if ((v393.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        v271 = &v393;
      }
      else {
        v271 = (std::string *)v393.__r_.__value_.__r.__words[0];
      }
      if ((v393.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        uint64_t v272 = v393.__r_.__value_.__s.__size_;
      }
      else {
        uint64_t v272 = v393.__r_.__value_.__l.__size_;
      }
      v273 = sub_1890AE8EC(v270, (uint64_t)v271, v272);
      *(void *)((char *)v273 + *(void *)(*v273 - 24LL) + 24) = 10LL;
      v274 = (void *)std::ostream::operator<<();
      v275 = sub_1890AE8EC(v274, (uint64_t)",", 1LL);
      sub_1890AE7B4(&v336, "next-dispatch");
      profile_decoder::key(&__p);
      if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        v276 = &__p;
      }
      else {
        v276 = (std::stringbuf::string_type *)__p.__r_.__value_.__r.__words[0];
      }
      if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        uint64_t v277 = __p.__r_.__value_.__s.__size_;
      }
      else {
        uint64_t v277 = __p.__r_.__value_.__l.__size_;
      }
      v278 = sub_1890AE8EC(v275, (uint64_t)v276, v277);
      *(void *)((char *)v278 + *(void *)(*v278 - 24LL) + 24) = 10LL;
      v279 = (void *)std::ostream::operator<<();
      sub_1890AE8EC(v279, (uint64_t)",", 1LL);
      if (v337 < 0) {
        operator delete(v336);
      }
      if (v339 < 0) {
        operator delete(v338);
      }
      if (v341 < 0) {
        operator delete(v340);
      }
      if (v343 < 0) {
        operator delete(v342);
      }
      if (v345 < 0) {
        operator delete(v344);
      }
      if (v347 < 0)
      {
        uint64_t v32 = v346;
LABEL_601:
        operator delete(v32);
      }

      break;
    default:
      return;
  }

void sub_1890AA7A8(_Unwind_Exception *a1)
{
  if (SLOBYTE(STACK[0x56F]) < 0) {
    operator delete((void *)STACK[0x558]);
  }
  if (SLOBYTE(STACK[0x2B7]) < 0) {
    operator delete((void *)STACK[0x2A0]);
  }
  if (SLOBYTE(STACK[0x59F]) < 0) {
    operator delete((void *)STACK[0x588]);
  }
  if (SLOBYTE(STACK[0x2CF]) < 0) {
    operator delete((void *)STACK[0x2B8]);
  }
  if (SLOBYTE(STACK[0x5CF]) < 0) {
    operator delete((void *)STACK[0x5B8]);
  }
  if (SLOBYTE(STACK[0x2E7]) < 0) {
    operator delete((void *)STACK[0x2D0]);
  }
  if (SLOBYTE(STACK[0x2FF]) < 0) {
    operator delete((void *)STACK[0x2E8]);
  }
  if (SLOBYTE(STACK[0x317]) < 0) {
    operator delete((void *)STACK[0x300]);
  }
  if (SLOBYTE(STACK[0x32F]) < 0) {
    operator delete((void *)STACK[0x318]);
  }
  _Unwind_Resume(a1);
}

void sub_1890AB424()
{
}

void profile_decoder::key(std::string *a1@<X8>)
{
  uint64_t v2 = std::string::append(&v3, "':");
  *a1 = *v2;
  v2->__r_.__value_.__l.__size_ = 0LL;
  v2->__r_.__value_.__l.__cap_ = 0LL;
  v2->__r_.__value_.__r.__words[0] = 0LL;
}

void sub_1890AB498( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void profile_decoder::str(std::string *a1@<X8>)
{
  uint64_t v2 = std::string::append(&v3, "'");
  *a1 = *v2;
  v2->__r_.__value_.__l.__size_ = 0LL;
  v2->__r_.__value_.__l.__cap_ = 0LL;
  v2->__r_.__value_.__r.__words[0] = 0LL;
}

void sub_1890AB520( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t profile_decoder::spu_time_to_wall_time(uint64_t a1, uint64_t a2, uint64_t a3)
{
  valuePtr[4] = *MEMORY[0x1895F89C0];
  mach_port_t v5 = *MEMORY[0x1896086B0];
  uint64_t v6 = IOServiceMatching("AppleSPUTimesync");
  uint64_t result = IOServiceGetMatchingService(v5, v6);
  if ((_DWORD)result)
  {
    io_object_t v8 = result;
    CFProperty = (const __CFDictionary *)IORegistryEntryCreateCFProperty( result,  @"timesync",  (CFAllocatorRef)*MEMORY[0x189604DB0],  0);
    if (CFProperty)
    {
      uint64_t v10 = CFProperty;
      Value = (const __CFNumber *)CFDictionaryGetValue(CFProperty, @"spu");
      CFNumberGetValue(Value, kCFNumberLongLongType, valuePtr);
      uint64_t v12 = (const __CFNumber *)CFDictionaryGetValue(v10, @"calendar");
      CFNumberGetValue(v12, kCFNumberLongLongType, __str);
      unint64_t v13 = *(void *)__str + 1000 * a2 - valuePtr[0];
      CFRelease(v10);
      IOObjectRelease(v8);
      time_t v15 = v13 / 0x3B9ACA00;
      v14 = localtime(&v15);
      strftime((char *)valuePtr, 0x1EuLL, "%b %d %T", v14);
      snprintf( __str,  0x1EuLL,  "%s.%06lld",  (const char *)valuePtr,  v13 / 0x3E8 - 1000000 * ((unint64_t)((v13 / 0x3E8 * (unsigned __int128)0x431BDE82D7B635uLL) >> 64) >> 10));
      MEMORY[0x1895DEB18](a3, __str);
      return 1LL;
    }

    else
    {
      IOObjectRelease(v8);
      return 0LL;
    }
  }

  return result;
}

BOOL profile_decoder::get_boot_time(profile_decoder *this, unint64_t *a2)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  size_t v5 = 16LL;
  *(void *)io_object_t v8 = 0x1500000001LL;
  int v3 = sysctl(v8, 2u, &v6, &v5, 0LL, 0LL);
  if ((v3 & 0x80000000) == 0) {
    *a2 = v7 + 1000000 * v6;
  }
  return v3 >= 0;
}

std::string *profile_decoder::type_name@<X0>(unsigned int __val@<W1>, std::string *a2@<X8>)
{
  return profile_decoder::find_in_table((const entry *)&unk_18A342988, __val, 0xDu, a2);
}

void profile_decoder::to_string(uint64_t a1@<X0>, int *a2@<X1>, std::stringbuf::string_type *a3@<X8>)
{
  unsigned int v6 = *a2;
  (*(void (**)(__int128 *__return_ptr, uint64_t, void))(*(void *)a1 + 8LL))(&v137, a1, HIBYTE(*a2));
  (*(void (**)(__int128 *__return_ptr, uint64_t, void))(*(void *)a1 + 16LL))(&v135, a1, BYTE2(v6));
  (*(void (**)(__int128 *__return_ptr, uint64_t, void, void))(*(void *)a1 + 24LL))( &v133,  a1,  BYTE2(v6),  BYTE1(v6));
  int v7 = profile_decoder::find_in_table((const entry *)&unk_18A342988, v6, 0xDu, &v132);
  __int128 v130 = 0uLL;
  uint64_t v131 = 0LL;
  io_object_t v8 = (profile_decoder *)profile_decoder::spu_time_to_wall_time((uint64_t)v7, *((void *)a2 + 1), (uint64_t)&v130);
  int v79 = (int)v8;
  BOOL boot_time = profile_decoder::get_boot_time(v8, &v129);
  sub_1890A83E4((uint64_t)v125);
  uint64_t v9 = sub_1890AE8EC(&v126, (uint64_t)"{ ", 2LL);
  sub_1890AE7B4(&v122, "category");
  profile_decoder::key(&v124);
  if ((v124.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    uint64_t v10 = &v124;
  }
  else {
    uint64_t v10 = (std::string *)v124.__r_.__value_.__r.__words[0];
  }
  if ((v124.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    uint64_t size = v124.__r_.__value_.__s.__size_;
  }
  else {
    uint64_t size = v124.__r_.__value_.__l.__size_;
  }
  uint64_t v12 = sub_1890AE8EC(v9, (uint64_t)v10, size);
  *(void *)((char *)v12 + *(void *)(*v12 - 24LL) + 24) = 8LL;
  if (SHIBYTE(v138) < 0)
  {
    sub_1890AEC34(&__dst, (void *)v137, *((unint64_t *)&v137 + 1));
  }

  else
  {
    __int128 __dst = v137;
    uint64_t v120 = v138;
  }

  profile_decoder::str(&v121);
  if ((v121.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    unint64_t v13 = &v121;
  }
  else {
    unint64_t v13 = (std::string *)v121.__r_.__value_.__r.__words[0];
  }
  if ((v121.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    uint64_t v14 = v121.__r_.__value_.__s.__size_;
  }
  else {
    uint64_t v14 = v121.__r_.__value_.__l.__size_;
  }
  time_t v15 = sub_1890AE8EC(v12, (uint64_t)v13, v14);
  uint64_t v16 = sub_1890AE8EC(v15, (uint64_t)",", 1LL);
  sub_1890AE7B4(&v116, "component");
  profile_decoder::key(&v118);
  if ((v118.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    uint64_t v17 = &v118;
  }
  else {
    uint64_t v17 = (std::string *)v118.__r_.__value_.__r.__words[0];
  }
  if ((v118.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    uint64_t v18 = v118.__r_.__value_.__s.__size_;
  }
  else {
    uint64_t v18 = v118.__r_.__value_.__l.__size_;
  }
  unint64_t v19 = sub_1890AE8EC(v16, (uint64_t)v17, v18);
  *(void *)((char *)v19 + *(void *)(*v19 - 24LL) + 24) = 8LL;
  if (SHIBYTE(v136) < 0)
  {
    sub_1890AEC34(&v113, (void *)v135, *((unint64_t *)&v135 + 1));
  }

  else
  {
    __int128 v113 = v135;
    uint64_t v114 = v136;
  }

  profile_decoder::str(&v115);
  if ((v115.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    unsigned int v20 = &v115;
  }
  else {
    unsigned int v20 = (std::string *)v115.__r_.__value_.__r.__words[0];
  }
  if ((v115.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    uint64_t v21 = v115.__r_.__value_.__s.__size_;
  }
  else {
    uint64_t v21 = v115.__r_.__value_.__l.__size_;
  }
  io_service_t v22 = sub_1890AE8EC(v19, (uint64_t)v20, v21);
  v23 = sub_1890AE8EC(v22, (uint64_t)",", 1LL);
  sub_1890AE7B4(&v110, "event");
  profile_decoder::key(&v112);
  if ((v112.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    v24 = &v112;
  }
  else {
    v24 = (std::string *)v112.__r_.__value_.__r.__words[0];
  }
  if ((v112.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    uint64_t v25 = v112.__r_.__value_.__s.__size_;
  }
  else {
    uint64_t v25 = v112.__r_.__value_.__l.__size_;
  }
  uint64_t v26 = sub_1890AE8EC(v23, (uint64_t)v24, v25);
  *(void *)((char *)v26 + *(void *)(*v26 - 24LL) + 24) = 12LL;
  if (SHIBYTE(v134) < 0)
  {
    sub_1890AEC34(&v107, (void *)v133, *((unint64_t *)&v133 + 1));
  }

  else
  {
    __int128 v107 = v133;
    uint64_t v108 = v134;
  }

  profile_decoder::str(&v109);
  if ((v109.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    int v27 = &v109;
  }
  else {
    int v27 = (std::stringbuf::string_type *)v109.__r_.__value_.__r.__words[0];
  }
  if ((v109.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    uint64_t v28 = v109.__r_.__value_.__s.__size_;
  }
  else {
    uint64_t v28 = v109.__r_.__value_.__l.__size_;
  }
  v29 = sub_1890AE8EC(v26, (uint64_t)v27, v28);
  uint64_t v30 = sub_1890AE8EC(v29, (uint64_t)",", 1LL);
  sub_1890AE7B4(&v104, "type");
  profile_decoder::key(&v106);
  if ((v106.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    int v31 = &v106;
  }
  else {
    int v31 = (std::string *)v106.__r_.__value_.__r.__words[0];
  }
  if ((v106.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    uint64_t v32 = v106.__r_.__value_.__s.__size_;
  }
  else {
    uint64_t v32 = v106.__r_.__value_.__l.__size_;
  }
  v33 = sub_1890AE8EC(v30, (uint64_t)v31, v32);
  *(void *)((char *)v33 + *(void *)(*v33 - 24LL) + 24) = 12LL;
  else {
    std::string v102 = v132;
  }
  profile_decoder::str(&v103);
  if ((v103.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    uint64_t v34 = &v103;
  }
  else {
    uint64_t v34 = (std::string *)v103.__r_.__value_.__r.__words[0];
  }
  if ((v103.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    uint64_t v35 = v103.__r_.__value_.__s.__size_;
  }
  else {
    uint64_t v35 = v103.__r_.__value_.__l.__size_;
  }
  v36 = sub_1890AE8EC(v33, (uint64_t)v34, v35);
  v37 = sub_1890AE8EC(v36, (uint64_t)",", 1LL);
  sub_1890AE7B4(&v99, "timestamp");
  profile_decoder::key(&v101);
  if ((v101.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    v38 = &v101;
  }
  else {
    v38 = (std::string *)v101.__r_.__value_.__r.__words[0];
  }
  if ((v101.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    uint64_t v39 = v101.__r_.__value_.__s.__size_;
  }
  else {
    uint64_t v39 = v101.__r_.__value_.__l.__size_;
  }
  __int16 v40 = sub_1890AE8EC(v37, (uint64_t)v38, v39);
  *(void *)((char *)v40 + *(void *)(*v40 - 24LL) + 24) = 10LL;
  v41 = (void *)std::ostream::operator<<();
  __int16 v42 = sub_1890AE8EC(v41, (uint64_t)",", 1LL);
  sub_1890AE7B4(&v96, "sequence_num");
  profile_decoder::key(&__p);
  if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    p_p = &__p;
  }
  else {
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    uint64_t v44 = __p.__r_.__value_.__s.__size_;
  }
  else {
    uint64_t v44 = __p.__r_.__value_.__l.__size_;
  }
  v45 = sub_1890AE8EC(v42, (uint64_t)p_p, v44);
  *(void *)((char *)v45 + *(void *)(*v45 - 24LL) + 24) = 10LL;
  __int16 v46 = (void *)std::ostream::operator<<();
  sub_1890AE8EC(v46, (uint64_t)",", 1LL);
  if (v97 < 0) {
    operator delete(v96);
  }
  if (v100 < 0) {
    operator delete(v99);
  }
  if (v105 < 0) {
    operator delete(v104);
  }
  if (SHIBYTE(v108) < 0) {
    operator delete((void *)v107);
  }
  if (v111 < 0) {
    operator delete(v110);
  }
  if (SHIBYTE(v114) < 0) {
    operator delete((void *)v113);
  }
  if (v117 < 0) {
    operator delete(v116);
  }
  if (SHIBYTE(v120) < 0) {
    operator delete((void *)__dst);
  }
  if (v123 < 0) {
    operator delete(v122);
  }
  (*(void (**)(uint64_t, void *, int *))(*(void *)a1 + 32LL))(a1, v125, a2);
  sub_1890AE7B4(&v94, "type-id");
  profile_decoder::key(&v124);
  if ((v124.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    int v47 = &v124;
  }
  else {
    int v47 = (std::string *)v124.__r_.__value_.__r.__words[0];
  }
  if ((v124.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    uint64_t v48 = v124.__r_.__value_.__s.__size_;
  }
  else {
    uint64_t v48 = v124.__r_.__value_.__l.__size_;
  }
  sub_1890AE8EC(&v126, (uint64_t)v47, v48);
  uint64_t v49 = (void *)std::ostream::operator<<();
  v50 = sub_1890AE8EC(v49, (uint64_t)",", 1LL);
  sub_1890AE7B4(&v92, "category-id");
  profile_decoder::key(&v121);
  if ((v121.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    uint64_t v51 = &v121;
  }
  else {
    uint64_t v51 = (std::string *)v121.__r_.__value_.__r.__words[0];
  }
  if ((v121.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    uint64_t v52 = v121.__r_.__value_.__s.__size_;
  }
  else {
    uint64_t v52 = v121.__r_.__value_.__l.__size_;
  }
  sub_1890AE8EC(v50, (uint64_t)v51, v52);
  v53 = (void *)std::ostream::operator<<();
  uint64_t v54 = sub_1890AE8EC(v53, (uint64_t)",", 1LL);
  sub_1890AE7B4(&v90, "component-id");
  profile_decoder::key(&v118);
  if ((v118.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    v55 = &v118;
  }
  else {
    v55 = (std::string *)v118.__r_.__value_.__r.__words[0];
  }
  if ((v118.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    uint64_t v56 = v118.__r_.__value_.__s.__size_;
  }
  else {
    uint64_t v56 = v118.__r_.__value_.__l.__size_;
  }
  sub_1890AE8EC(v54, (uint64_t)v55, v56);
  uint64_t v57 = (void *)std::ostream::operator<<();
  v58 = sub_1890AE8EC(v57, (uint64_t)",", 1LL);
  sub_1890AE7B4(&v88, "event-id");
  profile_decoder::key(&v115);
  if ((v115.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    v59 = &v115;
  }
  else {
    v59 = (std::string *)v115.__r_.__value_.__r.__words[0];
  }
  if ((v115.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    uint64_t v60 = v115.__r_.__value_.__s.__size_;
  }
  else {
    uint64_t v60 = v115.__r_.__value_.__l.__size_;
  }
  sub_1890AE8EC(v58, (uint64_t)v59, v60);
  v61 = (void *)std::ostream::operator<<();
  v62 = sub_1890AE8EC(v61, (uint64_t)",", 1LL);
  sub_1890AE7B4(&v86, "binary-data");
  profile_decoder::key(&v112);
  if ((v112.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    v63 = &v112;
  }
  else {
    v63 = (std::string *)v112.__r_.__value_.__r.__words[0];
  }
  if ((v112.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    uint64_t v64 = v112.__r_.__value_.__s.__size_;
  }
  else {
    uint64_t v64 = v112.__r_.__value_.__l.__size_;
  }
  uint64_t v65 = sub_1890AE8EC(v62, (uint64_t)v63, v64);
  profile_decoder::dump(48, &v109);
  if ((v109.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    v66 = &v109;
  }
  else {
    v66 = (std::stringbuf::string_type *)v109.__r_.__value_.__r.__words[0];
  }
  if ((v109.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    uint64_t v67 = v109.__r_.__value_.__s.__size_;
  }
  else {
    uint64_t v67 = v109.__r_.__value_.__l.__size_;
  }
  sub_1890AE8EC(v65, (uint64_t)v66, v67);
  if (v87 < 0) {
    operator delete(v86);
  }
  if (v89 < 0) {
    operator delete(v88);
  }
  if (v91 < 0) {
    operator delete(v90);
  }
  if (v93 < 0) {
    operator delete(v92);
  }
  if (v95 < 0) {
    operator delete(v94);
  }
  if (v79)
  {
    v68 = sub_1890AE8EC(&v126, (uint64_t)",", 1LL);
    sub_1890AE7B4(&v84, "calendar-time");
    profile_decoder::key(&v124);
    if ((v124.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      v69 = &v124;
    }
    else {
      v69 = (std::string *)v124.__r_.__value_.__r.__words[0];
    }
    if ((v124.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      uint64_t v70 = v124.__r_.__value_.__s.__size_;
    }
    else {
      uint64_t v70 = v124.__r_.__value_.__l.__size_;
    }
    v71 = sub_1890AE8EC(v68, (uint64_t)v69, v70);
    if (SHIBYTE(v131) < 0)
    {
      sub_1890AEC34(v82, (void *)v130, *((unint64_t *)&v130 + 1));
    }

    else
    {
      *(_OWORD *)v82 = v130;
      uint64_t v83 = v131;
    }

    profile_decoder::str(&v121);
    if ((v121.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      v72 = &v121;
    }
    else {
      v72 = (std::string *)v121.__r_.__value_.__r.__words[0];
    }
    if ((v121.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      uint64_t v73 = v121.__r_.__value_.__s.__size_;
    }
    else {
      uint64_t v73 = v121.__r_.__value_.__l.__size_;
    }
    sub_1890AE8EC(v71, (uint64_t)v72, v73);
    if (SHIBYTE(v83) < 0) {
      operator delete(v82[0]);
    }
    if (v85 < 0) {
      operator delete(v84);
    }
  }

  if (boot_time)
  {
    v74 = sub_1890AE8EC(&v126, (uint64_t)",", 1LL);
    sub_1890AE7B4(&v80, "boot-timestamp");
    profile_decoder::key(&v124);
    if ((v124.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      uint64_t v75 = &v124;
    }
    else {
      uint64_t v75 = (std::string *)v124.__r_.__value_.__r.__words[0];
    }
    if ((v124.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      uint64_t v76 = v124.__r_.__value_.__s.__size_;
    }
    else {
      uint64_t v76 = v124.__r_.__value_.__l.__size_;
    }
    sub_1890AE8EC(v74, (uint64_t)v75, v76);
    std::ostream::operator<<();
    if (v81 < 0) {
      operator delete(v80);
    }
  }

  sub_1890AE8EC(&v126, (uint64_t)"}", 1LL);
  std::stringbuf::str(a3, &v127);
  v125[0] = *MEMORY[0x189614728];
  uint64_t v77 = *(void *)(MEMORY[0x189614728] + 72LL);
  *(void *)((char *)v125 + *(void *)(v125[0] - 24LL)) = *(void *)(MEMORY[0x189614728] + 64LL);
  uint64_t v126 = v77;
  v127.__vftable = (std::stringbuf_vtbl *)(MEMORY[0x189614750] + 16LL);
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x1895DEBD8](&v128);
  if (SHIBYTE(v131) < 0) {
    operator delete((void *)v130);
  }
  if (SHIBYTE(v134) < 0) {
    operator delete((void *)v133);
  }
  if (SHIBYTE(v136) < 0) {
    operator delete((void *)v135);
  }
  if (SHIBYTE(v138) < 0) {
    operator delete((void *)v137);
  }
}

void sub_1890AC334( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20, int a21, __int16 a22, char a23, char a24)
{
  if (SLOBYTE(STACK[0x2C7]) < 0) {
    operator delete((void *)STACK[0x2B0]);
  }
  if (a24 < 0) {
    operator delete(a19);
  }
  sub_1890A8510((uint64_t)&STACK[0x2C8]);
  _Unwind_Resume(a1);
}

std::string *execution_decoder::component_name@<X0>(unsigned int __val@<W1>, std::string *a2@<X8>)
{
  return profile_decoder::find_in_table((const entry *)&unk_18A342A58, __val, 6u, a2);
}

std::string *execution_decoder::event_name@<X0>(profile_decoder *a1@<X2>, int a2@<W1>, std::string *a3@<X8>)
{
  unsigned int v4 = a1;
  switch(a2)
  {
    case 0:
      size_t v5 = (const entry *)&unk_18A342AB8;
      unsigned int v6 = 3;
      goto LABEL_3;
    case 1:
      size_t v5 = (const entry *)&unk_18A342AE8;
      goto LABEL_9;
    case 2:
      size_t v5 = (const entry *)&unk_18A342AF8;
      unsigned int v6 = 2;
      goto LABEL_3;
    case 3:
      size_t v5 = (const entry *)&unk_18A342B18;
      unsigned int v6 = 8;
      goto LABEL_3;
    case 4:
      size_t v5 = (const entry *)&unk_18A342B98;
LABEL_9:
      unsigned int v6 = 1;
LABEL_3:
      uint64_t result = profile_decoder::find_in_table(v5, v4, v6, a3);
      break;
    default:
      uint64_t result = std::to_string(a3, a1);
      break;
  }

  return result;
}

std::string *trace_decoder::component_name@<X0>(unsigned int __val@<W1>, std::string *a2@<X8>)
{
  return profile_decoder::find_in_table((const entry *)&unk_18A342BA8, __val, 4u, a2);
}

std::string *trace_decoder::event_name@<X0>(unsigned int __val@<W2>, std::string *a2@<X8>)
{
  return std::to_string(a2, __val);
}

std::string *sensor_decoder::component_name@<X0>(unsigned int __val@<W1>, std::string *a2@<X8>)
{
  return profile_decoder::find_in_table((const entry *)&unk_18A342BE8, __val, 7u, a2);
}

std::string *sensor_decoder::event_name@<X0>(unsigned int __val@<W2>, std::string *a2@<X8>)
{
  return profile_decoder::find_in_table((const entry *)&unk_18A342C58, __val, 0xDu, a2);
}

std::string *sphere_decoder::component_name@<X0>(unsigned int __val@<W1>, std::string *a2@<X8>)
{
  return profile_decoder::find_in_table(&stru_18A342D28, __val, 1u, a2);
}

std::string *sphere_decoder::event_name@<X0>(unsigned int __val@<W2>, std::string *a2@<X8>)
{
  return profile_decoder::find_in_table((const entry *)&unk_18A342D38, __val, 3u, a2);
}

std::string *cumulus_decoder::component_name@<X0>(unsigned int __val@<W1>, std::string *a2@<X8>)
{
  return profile_decoder::find_in_table(&stru_18A342D68, __val, 1u, a2);
}

std::string *cumulus_decoder::event_name@<X0>(unsigned int __val@<W2>, std::string *a2@<X8>)
{
  return profile_decoder::find_in_table((const entry *)&unk_18A342D78, __val, 2u, a2);
}

void cumulus_decoder::parse_datatype(uint64_t a1, uint64_t a2, int *a3)
{
  int v6 = *a3;
  if (*a3 == 67108867)
  {
    sub_1890AE7B4(&v137, "arg1");
    profile_decoder::key(&v139);
    if ((v139.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      int v7 = &v139;
    }
    else {
      int v7 = (std::string *)v139.__r_.__value_.__r.__words[0];
    }
    if ((v139.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      uint64_t size = v139.__r_.__value_.__s.__size_;
    }
    else {
      uint64_t size = v139.__r_.__value_.__l.__size_;
    }
    uint64_t v9 = sub_1890AE8EC((void *)(a2 + 16), (uint64_t)v7, size);
    *(void *)((char *)v9 + *(void *)(*v9 - 24LL) + 24) = 10LL;
    uint64_t v10 = (void *)std::ostream::operator<<();
    uint64_t v11 = sub_1890AE8EC(v10, (uint64_t)",", 1LL);
    sub_1890AE7B4(&v134, "arg2");
    profile_decoder::key(&v136);
    if ((v136.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      uint64_t v12 = &v136;
    }
    else {
      uint64_t v12 = (std::string *)v136.__r_.__value_.__r.__words[0];
    }
    if ((v136.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      uint64_t v13 = v136.__r_.__value_.__s.__size_;
    }
    else {
      uint64_t v13 = v136.__r_.__value_.__l.__size_;
    }
    uint64_t v14 = sub_1890AE8EC(v11, (uint64_t)v12, v13);
    *(void *)((char *)v14 + *(void *)(*v14 - 24LL) + 24) = 10LL;
    time_t v15 = (void *)std::ostream::operator<<();
    uint64_t v16 = sub_1890AE8EC(v15, (uint64_t)",", 1LL);
    sub_1890AE7B4(&v131, "arg3");
    profile_decoder::key(&v133);
    if ((v133.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      uint64_t v17 = &v133;
    }
    else {
      uint64_t v17 = (std::string *)v133.__r_.__value_.__r.__words[0];
    }
    if ((v133.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      uint64_t v18 = v133.__r_.__value_.__s.__size_;
    }
    else {
      uint64_t v18 = v133.__r_.__value_.__l.__size_;
    }
    unint64_t v19 = sub_1890AE8EC(v16, (uint64_t)v17, v18);
    *(void *)((char *)v19 + *(void *)(*v19 - 24LL) + 24) = 10LL;
    unsigned int v20 = (void *)std::ostream::operator<<();
    uint64_t v21 = sub_1890AE8EC(v20, (uint64_t)",", 1LL);
    sub_1890AE7B4(&v128, "arg4");
    profile_decoder::key(&v130);
    if ((v130.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      io_service_t v22 = &v130;
    }
    else {
      io_service_t v22 = (std::string *)v130.__r_.__value_.__r.__words[0];
    }
    if ((v130.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      uint64_t v23 = v130.__r_.__value_.__s.__size_;
    }
    else {
      uint64_t v23 = v130.__r_.__value_.__l.__size_;
    }
    uint64_t v24 = sub_1890AE8EC(v21, (uint64_t)v22, v23);
    *(void *)((char *)v24 + *(void *)(*v24 - 24LL) + 24) = 10LL;
    uint64_t v25 = (void *)std::ostream::operator<<();
    uint64_t v26 = sub_1890AE8EC(v25, (uint64_t)",", 1LL);
    sub_1890AE7B4(&v125, "arg5");
    profile_decoder::key(&v127);
    if ((v127.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      int v27 = &v127;
    }
    else {
      int v27 = (std::string *)v127.__r_.__value_.__r.__words[0];
    }
    if ((v127.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      uint64_t v28 = v127.__r_.__value_.__s.__size_;
    }
    else {
      uint64_t v28 = v127.__r_.__value_.__l.__size_;
    }
    v29 = sub_1890AE8EC(v26, (uint64_t)v27, v28);
    *(void *)((char *)v29 + *(void *)(*v29 - 24LL) + 24) = 10LL;
    uint64_t v30 = (void *)std::ostream::operator<<();
    int v31 = sub_1890AE8EC(v30, (uint64_t)",", 1LL);
    sub_1890AE7B4(&v122, "arg6");
    profile_decoder::key(&v124);
    if ((v124.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      uint64_t v32 = &v124;
    }
    else {
      uint64_t v32 = (std::string *)v124.__r_.__value_.__r.__words[0];
    }
    if ((v124.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      uint64_t v33 = v124.__r_.__value_.__s.__size_;
    }
    else {
      uint64_t v33 = v124.__r_.__value_.__l.__size_;
    }
    uint64_t v34 = sub_1890AE8EC(v31, (uint64_t)v32, v33);
    *(void *)((char *)v34 + *(void *)(*v34 - 24LL) + 24) = 10LL;
    uint64_t v35 = (void *)std::ostream::operator<<();
    v36 = sub_1890AE8EC(v35, (uint64_t)",", 1LL);
    sub_1890AE7B4(&v119, "x");
    profile_decoder::key(&v121);
    if ((v121.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      v37 = &v121;
    }
    else {
      v37 = (std::string *)v121.__r_.__value_.__r.__words[0];
    }
    if ((v121.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      uint64_t v38 = v121.__r_.__value_.__s.__size_;
    }
    else {
      uint64_t v38 = v121.__r_.__value_.__l.__size_;
    }
    uint64_t v39 = sub_1890AE8EC(v36, (uint64_t)v37, v38);
    *(void *)((char *)v39 + *(void *)(*v39 - 24LL) + 24) = 10LL;
    __int16 v40 = (void *)std::ostream::operator<<();
    v41 = sub_1890AE8EC(v40, (uint64_t)",", 1LL);
    sub_1890AE7B4(&v116, "y");
    profile_decoder::key(&v118);
    if ((v118.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      __int16 v42 = &v118;
    }
    else {
      __int16 v42 = (std::string *)v118.__r_.__value_.__r.__words[0];
    }
    if ((v118.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      uint64_t v43 = v118.__r_.__value_.__s.__size_;
    }
    else {
      uint64_t v43 = v118.__r_.__value_.__l.__size_;
    }
    uint64_t v44 = sub_1890AE8EC(v41, (uint64_t)v42, v43);
    *(void *)((char *)v44 + *(void *)(*v44 - 24LL) + 24) = 10LL;
    v45 = (void *)std::ostream::operator<<();
    __int16 v46 = sub_1890AE8EC(v45, (uint64_t)",", 1LL);
    sub_1890AE7B4(&v113, "z");
    profile_decoder::key(&__p);
    if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      p_p = &__p;
    }
    else {
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      uint64_t v48 = __p.__r_.__value_.__s.__size_;
    }
    else {
      uint64_t v48 = __p.__r_.__value_.__l.__size_;
    }
    uint64_t v49 = sub_1890AE8EC(v46, (uint64_t)p_p, v48);
    *(void *)((char *)v49 + *(void *)(*v49 - 24LL) + 24) = 10LL;
    v50 = (void *)std::ostream::operator<<();
    sub_1890AE8EC(v50, (uint64_t)",", 1LL);
    if (v114 < 0) {
      operator delete(v113);
    }
    if (v117 < 0) {
      operator delete(v116);
    }
    if (v120 < 0) {
      operator delete(v119);
    }
    if (v123 < 0) {
      operator delete(v122);
    }
    if (v126 < 0) {
      operator delete(v125);
    }
    if (v129 < 0) {
      operator delete(v128);
    }
    if (v132 < 0) {
      operator delete(v131);
    }
    if (v135 < 0) {
      operator delete(v134);
    }
    if (v138 < 0) {
      operator delete(v137);
    }
    int v6 = *a3;
  }

  if (v6 == 67109123)
  {
    sub_1890AE7B4(&v111, "arg1");
    profile_decoder::key(&v139);
    if ((v139.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      uint64_t v51 = &v139;
    }
    else {
      uint64_t v51 = (std::string *)v139.__r_.__value_.__r.__words[0];
    }
    if ((v139.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      uint64_t v52 = v139.__r_.__value_.__s.__size_;
    }
    else {
      uint64_t v52 = v139.__r_.__value_.__l.__size_;
    }
    v53 = sub_1890AE8EC((void *)(a2 + 16), (uint64_t)v51, v52);
    *(void *)((char *)v53 + *(void *)(*v53 - 24LL) + 24) = 10LL;
    uint64_t v54 = (void *)std::ostream::operator<<();
    v55 = sub_1890AE8EC(v54, (uint64_t)",", 1LL);
    sub_1890AE7B4(&v109, "arg2");
    profile_decoder::key(&v136);
    if ((v136.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      uint64_t v56 = &v136;
    }
    else {
      uint64_t v56 = (std::string *)v136.__r_.__value_.__r.__words[0];
    }
    if ((v136.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      uint64_t v57 = v136.__r_.__value_.__s.__size_;
    }
    else {
      uint64_t v57 = v136.__r_.__value_.__l.__size_;
    }
    v58 = sub_1890AE8EC(v55, (uint64_t)v56, v57);
    *(void *)((char *)v58 + *(void *)(*v58 - 24LL) + 24) = 10LL;
    v59 = (void *)std::ostream::operator<<();
    uint64_t v60 = sub_1890AE8EC(v59, (uint64_t)",", 1LL);
    sub_1890AE7B4(&v107, "arg3");
    profile_decoder::key(&v133);
    if ((v133.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      v61 = &v133;
    }
    else {
      v61 = (std::string *)v133.__r_.__value_.__r.__words[0];
    }
    if ((v133.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      uint64_t v62 = v133.__r_.__value_.__s.__size_;
    }
    else {
      uint64_t v62 = v133.__r_.__value_.__l.__size_;
    }
    v63 = sub_1890AE8EC(v60, (uint64_t)v61, v62);
    *(void *)((char *)v63 + *(void *)(*v63 - 24LL) + 24) = 10LL;
    uint64_t v64 = (void *)std::ostream::operator<<();
    uint64_t v65 = sub_1890AE8EC(v64, (uint64_t)",", 1LL);
    sub_1890AE7B4(&v105, "arg4");
    profile_decoder::key(&v130);
    if ((v130.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      v66 = &v130;
    }
    else {
      v66 = (std::string *)v130.__r_.__value_.__r.__words[0];
    }
    if ((v130.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      uint64_t v67 = v130.__r_.__value_.__s.__size_;
    }
    else {
      uint64_t v67 = v130.__r_.__value_.__l.__size_;
    }
    v68 = sub_1890AE8EC(v65, (uint64_t)v66, v67);
    *(void *)((char *)v68 + *(void *)(*v68 - 24LL) + 24) = 10LL;
    v69 = (void *)std::ostream::operator<<();
    uint64_t v70 = sub_1890AE8EC(v69, (uint64_t)",", 1LL);
    sub_1890AE7B4(&v103, "arg5");
    profile_decoder::key(&v127);
    if ((v127.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      v71 = &v127;
    }
    else {
      v71 = (std::string *)v127.__r_.__value_.__r.__words[0];
    }
    if ((v127.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      uint64_t v72 = v127.__r_.__value_.__s.__size_;
    }
    else {
      uint64_t v72 = v127.__r_.__value_.__l.__size_;
    }
    uint64_t v73 = sub_1890AE8EC(v70, (uint64_t)v71, v72);
    *(void *)((char *)v73 + *(void *)(*v73 - 24LL) + 24) = 10LL;
    v74 = (void *)std::ostream::operator<<();
    uint64_t v75 = sub_1890AE8EC(v74, (uint64_t)",", 1LL);
    sub_1890AE7B4(&v101, "arg6");
    profile_decoder::key(&v124);
    if ((v124.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      uint64_t v76 = &v124;
    }
    else {
      uint64_t v76 = (std::string *)v124.__r_.__value_.__r.__words[0];
    }
    if ((v124.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      uint64_t v77 = v124.__r_.__value_.__s.__size_;
    }
    else {
      uint64_t v77 = v124.__r_.__value_.__l.__size_;
    }
    v78 = sub_1890AE8EC(v75, (uint64_t)v76, v77);
    *(void *)((char *)v78 + *(void *)(*v78 - 24LL) + 24) = 10LL;
    int v79 = (void *)std::ostream::operator<<();
    uint64_t v80 = sub_1890AE8EC(v79, (uint64_t)",", 1LL);
    sub_1890AE7B4(&v99, "x");
    profile_decoder::key(&v121);
    if ((v121.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      char v81 = &v121;
    }
    else {
      char v81 = (std::string *)v121.__r_.__value_.__r.__words[0];
    }
    if ((v121.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      uint64_t v82 = v121.__r_.__value_.__s.__size_;
    }
    else {
      uint64_t v82 = v121.__r_.__value_.__l.__size_;
    }
    uint64_t v83 = sub_1890AE8EC(v80, (uint64_t)v81, v82);
    *(void *)((char *)v83 + *(void *)(*v83 - 24LL) + 24) = 10LL;
    v84 = (void *)std::ostream::operator<<();
    char v85 = sub_1890AE8EC(v84, (uint64_t)",", 1LL);
    sub_1890AE7B4(&v97, "y");
    profile_decoder::key(&v118);
    if ((v118.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      v86 = &v118;
    }
    else {
      v86 = (std::string *)v118.__r_.__value_.__r.__words[0];
    }
    if ((v118.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      uint64_t v87 = v118.__r_.__value_.__s.__size_;
    }
    else {
      uint64_t v87 = v118.__r_.__value_.__l.__size_;
    }
    v88 = sub_1890AE8EC(v85, (uint64_t)v86, v87);
    *(void *)((char *)v88 + *(void *)(*v88 - 24LL) + 24) = 10LL;
    char v89 = (void *)std::ostream::operator<<();
    uint64_t v90 = sub_1890AE8EC(v89, (uint64_t)",", 1LL);
    sub_1890AE7B4(&v95, "z");
    profile_decoder::key(&__p);
    if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      char v91 = &__p;
    }
    else {
      char v91 = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      uint64_t v92 = __p.__r_.__value_.__s.__size_;
    }
    else {
      uint64_t v92 = __p.__r_.__value_.__l.__size_;
    }
    char v93 = sub_1890AE8EC(v90, (uint64_t)v91, v92);
    *(void *)((char *)v93 + *(void *)(*v93 - 24LL) + 24) = 10LL;
    v94 = (void *)std::ostream::operator<<();
    sub_1890AE8EC(v94, (uint64_t)",", 1LL);
    if (v96 < 0) {
      operator delete(v95);
    }
    if (v98 < 0) {
      operator delete(v97);
    }
    if (v100 < 0) {
      operator delete(v99);
    }
    if (v102 < 0) {
      operator delete(v101);
    }
    if (v104 < 0) {
      operator delete(v103);
    }
    if (v106 < 0) {
      operator delete(v105);
    }
    if (v108 < 0) {
      operator delete(v107);
    }
    if (v110 < 0) {
      operator delete(v109);
    }
    if (v112 < 0) {
      operator delete(v111);
    }
  }

  else
  {
    profile_decoder::parse_datatype(a1, a2, (uint64_t)a3);
  }

void sub_1890AD398( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20, char a21, void *a22, uint64_t a23, int a24, __int16 a25, char a26, char a27, void *a28, uint64_t a29, int a30, __int16 a31, char a32, char a33, void *a34, uint64_t a35, int a36, __int16 a37, char a38, char a39, void *a40, uint64_t a41, int a42, __int16 a43, char a44, char a45, void *a46, uint64_t a47, int a48, __int16 a49, char a50,char a51,void *a52,uint64_t a53,int a54,__int16 a55,char a56,char a57,void *a58,uint64_t a59,int a60,__int16 a61,char a62,char a63)
{
  if (a72 < 0) {
    operator delete(__p);
  }
  if (a15 < 0) {
    operator delete(a10);
  }
  if (a74 < 0) {
    operator delete(a73);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (a76 < 0) {
    operator delete(a75);
  }
  if (a27 < 0) {
    operator delete(a22);
  }
  if (a78 < 0) {
    operator delete(a77);
  }
  if (a33 < 0) {
    operator delete(a28);
  }
  if (a80 < 0) {
    operator delete(a79);
  }
  if (a39 < 0) {
    operator delete(a34);
  }
  if (a45 < 0) {
    operator delete(a40);
  }
  if (a51 < 0) {
    operator delete(a46);
  }
  if (a57 < 0) {
    operator delete(a52);
  }
  if (a63 < 0) {
    operator delete(a58);
  }
  _Unwind_Resume(a1);
}

std::string *interrupt_decoder::component_name@<X0>(unsigned int __val@<W1>, std::string *a2@<X8>)
{
  return profile_decoder::find_in_table(&stru_18A342D98, __val, 1u, a2);
}

std::string *interrupt_decoder::event_name@<X0>(unsigned int __val@<W2>, std::string *a2@<X8>)
{
  return profile_decoder::find_in_table(&stru_18A342DA8, __val, 1u, a2);
}

std::string *uart_decoder::component_name@<X0>(unsigned int __val@<W1>, std::string *a2@<X8>)
{
  return profile_decoder::find_in_table((const entry *)&unk_18A342DB8, __val, 3u, a2);
}

std::string *uart_decoder::event_name@<X0>(unsigned int __val@<W2>, std::string *a2@<X8>)
{
  return profile_decoder::find_in_table((const entry *)&unk_18A342DE8, __val, 8u, a2);
}

std::string *haptics_decoder::component_name@<X0>(unsigned int __val@<W1>, std::string *a2@<X8>)
{
  return profile_decoder::find_in_table((const entry *)&unk_18A342E68, __val, 4u, a2);
}

std::string *haptics_decoder::event_name@<X0>(unsigned int __val@<W2>, std::string *a2@<X8>)
{
  return profile_decoder::find_in_table((const entry *)&unk_18A342EA8, __val, 3u, a2);
}

void haptics_decoder::parse_datatype(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  int v5 = BYTE2(*a3);
  if (*a3 != 2)
  {
    if (*a3 == 3)
    {
      sub_1890AE7B4(&v103, "trace");
      profile_decoder::key(&v105);
      if ((v105.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        int v6 = &v105;
      }
      else {
        int v6 = (std::string *)v105.__r_.__value_.__r.__words[0];
      }
      if ((v105.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        uint64_t size = v105.__r_.__value_.__s.__size_;
      }
      else {
        uint64_t size = v105.__r_.__value_.__l.__size_;
      }
      io_object_t v8 = sub_1890AE8EC((void *)(a2 + 16), (uint64_t)v6, size);
      *(void *)((char *)v8 + *(void *)(*v8 - 24LL) + 24) = 25LL;
      haptics_decoder::subtype_name((profile_decoder *)a3[4], v5, &v101);
      profile_decoder::str(&v102);
      if ((v102.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        uint64_t v9 = &v102;
      }
      else {
        uint64_t v9 = (std::string *)v102.__r_.__value_.__r.__words[0];
      }
      if ((v102.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        uint64_t v10 = v102.__r_.__value_.__s.__size_;
      }
      else {
        uint64_t v10 = v102.__r_.__value_.__l.__size_;
      }
      uint64_t v11 = sub_1890AE8EC(v8, (uint64_t)v9, v10);
      uint64_t v12 = sub_1890AE8EC(v11, (uint64_t)",", 1LL);
      sub_1890AE7B4(&v98, "thread");
      profile_decoder::key(&v100);
      if ((v100.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        uint64_t v13 = &v100;
      }
      else {
        uint64_t v13 = (std::string *)v100.__r_.__value_.__r.__words[0];
      }
      if ((v100.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        uint64_t v14 = v100.__r_.__value_.__s.__size_;
      }
      else {
        uint64_t v14 = v100.__r_.__value_.__l.__size_;
      }
      time_t v15 = sub_1890AE8EC(v12, (uint64_t)v13, v14);
      *(void *)((char *)v15 + *(void *)(*v15 - 24LL) + 24) = 10LL;
      uint64_t v16 = (void *)std::ostream::operator<<();
      uint64_t v17 = sub_1890AE8EC(v16, (uint64_t)",", 1LL);
      sub_1890AE7B4(&v95, "arg1");
      profile_decoder::key(&v97);
      if ((v97.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        uint64_t v18 = &v97;
      }
      else {
        uint64_t v18 = (std::string *)v97.__r_.__value_.__r.__words[0];
      }
      if ((v97.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        uint64_t v19 = v97.__r_.__value_.__s.__size_;
      }
      else {
        uint64_t v19 = v97.__r_.__value_.__l.__size_;
      }
      unsigned int v20 = sub_1890AE8EC(v17, (uint64_t)v18, v19);
      *(void *)((char *)v20 + *(void *)(*v20 - 24LL) + 24) = 10LL;
      uint64_t v21 = (void *)std::ostream::operator<<();
      io_service_t v22 = sub_1890AE8EC(v21, (uint64_t)",", 1LL);
      sub_1890AE7B4(&v92, "arg2");
      profile_decoder::key(&v94);
      if ((v94.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        uint64_t v23 = &v94;
      }
      else {
        uint64_t v23 = (std::string *)v94.__r_.__value_.__r.__words[0];
      }
      if ((v94.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        uint64_t v24 = v94.__r_.__value_.__s.__size_;
      }
      else {
        uint64_t v24 = v94.__r_.__value_.__l.__size_;
      }
      uint64_t v25 = sub_1890AE8EC(v22, (uint64_t)v23, v24);
      *(void *)((char *)v25 + *(void *)(*v25 - 24LL) + 24) = 10LL;
      uint64_t v26 = (void *)std::ostream::operator<<();
      int v27 = sub_1890AE8EC(v26, (uint64_t)",", 1LL);
      sub_1890AE7B4(&v89, "arg3");
      profile_decoder::key(&v91);
      if ((v91.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        uint64_t v28 = &v91;
      }
      else {
        uint64_t v28 = (std::string *)v91.__r_.__value_.__r.__words[0];
      }
      if ((v91.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        uint64_t v29 = v91.__r_.__value_.__s.__size_;
      }
      else {
        uint64_t v29 = v91.__r_.__value_.__l.__size_;
      }
      uint64_t v30 = sub_1890AE8EC(v27, (uint64_t)v28, v29);
      *(void *)((char *)v30 + *(void *)(*v30 - 24LL) + 24) = 10LL;
      int v31 = (void *)std::ostream::operator<<();
      uint64_t v32 = sub_1890AE8EC(v31, (uint64_t)",", 1LL);
      sub_1890AE7B4(&v86, "arg4");
      profile_decoder::key(&__p);
      if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        p_p = &__p;
      }
      else {
        p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
      }
      if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        uint64_t v34 = __p.__r_.__value_.__s.__size_;
      }
      else {
        uint64_t v34 = __p.__r_.__value_.__l.__size_;
      }
      uint64_t v35 = sub_1890AE8EC(v32, (uint64_t)p_p, v34);
      *(void *)((char *)v35 + *(void *)(*v35 - 24LL) + 24) = 10LL;
      v36 = (void *)std::ostream::operator<<();
      sub_1890AE8EC(v36, (uint64_t)",", 1LL);
      if (v87 < 0) {
        operator delete(v86);
      }
      if (v90 < 0) {
        operator delete(v89);
      }
      if (v93 < 0) {
        operator delete(v92);
      }
      if (v96 < 0) {
        operator delete(v95);
      }
      if (v99 < 0) {
        operator delete(v98);
      }
      if (v104 < 0)
      {
        v37 = v103;
LABEL_147:
        operator delete(v37);
        return;
      }

      return;
    }

LABEL_106:
    profile_decoder::parse_datatype(a1, a2, (uint64_t)a3);
    return;
  }

  int v38 = BYTE1(*a3);
  if (v38 == 2)
  {
    sub_1890AE7B4(&v78, "ampType");
    profile_decoder::key(&v105);
    if ((v105.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      v53 = &v105;
    }
    else {
      v53 = (std::string *)v105.__r_.__value_.__r.__words[0];
    }
    if ((v105.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      uint64_t v54 = v105.__r_.__value_.__s.__size_;
    }
    else {
      uint64_t v54 = v105.__r_.__value_.__l.__size_;
    }
    v55 = sub_1890AE8EC((void *)(a2 + 16), (uint64_t)v53, v54);
    *(void *)((char *)v55 + *(void *)(*v55 - 24LL) + 24) = 10LL;
    uint64_t v56 = (void *)std::ostream::operator<<();
    uint64_t v57 = sub_1890AE8EC(v56, (uint64_t)",", 1LL);
    sub_1890AE7B4(&v76, "index");
    profile_decoder::key(&v102);
    if ((v102.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      v58 = &v102;
    }
    else {
      v58 = (std::string *)v102.__r_.__value_.__r.__words[0];
    }
    if ((v102.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      uint64_t v59 = v102.__r_.__value_.__s.__size_;
    }
    else {
      uint64_t v59 = v102.__r_.__value_.__l.__size_;
    }
    uint64_t v60 = sub_1890AE8EC(v57, (uint64_t)v58, v59);
    *(void *)((char *)v60 + *(void *)(*v60 - 24LL) + 24) = 10LL;
    v61 = (void *)std::ostream::operator<<();
    uint64_t v62 = sub_1890AE8EC(v61, (uint64_t)",", 1LL);
    sub_1890AE7B4(&v74, "presilence");
    profile_decoder::key(&v100);
    if ((v100.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      v63 = &v100;
    }
    else {
      v63 = (std::string *)v100.__r_.__value_.__r.__words[0];
    }
    if ((v100.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      uint64_t v64 = v100.__r_.__value_.__s.__size_;
    }
    else {
      uint64_t v64 = v100.__r_.__value_.__l.__size_;
    }
    uint64_t v65 = sub_1890AE8EC(v62, (uint64_t)v63, v64);
    *(void *)((char *)v65 + *(void *)(*v65 - 24LL) + 24) = 10LL;
    v66 = (void *)std::ostream::operator<<();
    uint64_t v67 = sub_1890AE8EC(v66, (uint64_t)",", 1LL);
    sub_1890AE7B4(&v72, "gain");
    profile_decoder::key(&v97);
    if ((v97.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      v68 = &v97;
    }
    else {
      v68 = (std::string *)v97.__r_.__value_.__r.__words[0];
    }
    if ((v97.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      uint64_t v69 = v97.__r_.__value_.__s.__size_;
    }
    else {
      uint64_t v69 = v97.__r_.__value_.__l.__size_;
    }
    uint64_t v70 = sub_1890AE8EC(v67, (uint64_t)v68, v69);
    *(void *)((char *)v70 + *(void *)(*v70 - 24LL) + 24) = 10LL;
    v71 = (void *)std::ostream::operator<<();
    sub_1890AE8EC(v71, (uint64_t)",", 1LL);
    if (v73 < 0) {
      operator delete(v72);
    }
    if (v75 < 0) {
      operator delete(v74);
    }
    if (v77 < 0) {
      operator delete(v76);
    }
    if (v79 < 0)
    {
      v37 = v78;
      goto LABEL_147;
    }

    return;
  }

  if (v38 != 1) {
    goto LABEL_106;
  }
  sub_1890AE7B4(&v84, "ampType");
  profile_decoder::key(&v105);
  if ((v105.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    uint64_t v39 = &v105;
  }
  else {
    uint64_t v39 = (std::string *)v105.__r_.__value_.__r.__words[0];
  }
  if ((v105.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    uint64_t v40 = v105.__r_.__value_.__s.__size_;
  }
  else {
    uint64_t v40 = v105.__r_.__value_.__l.__size_;
  }
  v41 = sub_1890AE8EC((void *)(a2 + 16), (uint64_t)v39, v40);
  *(void *)((char *)v41 + *(void *)(*v41 - 24LL) + 24) = 10LL;
  __int16 v42 = (void *)std::ostream::operator<<();
  uint64_t v43 = sub_1890AE8EC(v42, (uint64_t)",", 1LL);
  sub_1890AE7B4(&v82, "state");
  profile_decoder::key(&v102);
  if ((v102.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    uint64_t v44 = &v102;
  }
  else {
    uint64_t v44 = (std::string *)v102.__r_.__value_.__r.__words[0];
  }
  if ((v102.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    uint64_t v45 = v102.__r_.__value_.__s.__size_;
  }
  else {
    uint64_t v45 = v102.__r_.__value_.__l.__size_;
  }
  __int16 v46 = sub_1890AE8EC(v43, (uint64_t)v44, v45);
  *(void *)((char *)v46 + *(void *)(*v46 - 24LL) + 24) = 10LL;
  int v47 = (void *)std::ostream::operator<<();
  uint64_t v48 = sub_1890AE8EC(v47, (uint64_t)",", 1LL);
  sub_1890AE7B4(&v80, "refCount");
  profile_decoder::key(&v100);
  if ((v100.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    uint64_t v49 = &v100;
  }
  else {
    uint64_t v49 = (std::string *)v100.__r_.__value_.__r.__words[0];
  }
  if ((v100.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    uint64_t v50 = v100.__r_.__value_.__s.__size_;
  }
  else {
    uint64_t v50 = v100.__r_.__value_.__l.__size_;
  }
  uint64_t v51 = sub_1890AE8EC(v48, (uint64_t)v49, v50);
  *(void *)((char *)v51 + *(void *)(*v51 - 24LL) + 24) = 10LL;
  uint64_t v52 = (void *)std::ostream::operator<<();
  sub_1890AE8EC(v52, (uint64_t)",", 1LL);
  if (v81 < 0) {
    operator delete(v80);
  }
  if (v83 < 0) {
    operator delete(v82);
  }
  if (v85 < 0)
  {
    v37 = v84;
    goto LABEL_147;
  }

void sub_1890AE02C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20, char a21, void *a22, uint64_t a23, int a24, __int16 a25, char a26, char a27, void *a28, uint64_t a29, int a30, __int16 a31, char a32, char a33)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (a27 < 0) {
    operator delete(a22);
  }
  if (a33 < 0) {
    operator delete(a28);
  }
  _Unwind_Resume(a1);
}

std::string *haptics_decoder::subtype_name@<X0>(profile_decoder *a1@<X2>, int a2@<W1>, std::string *a3@<X8>)
{
  else {
    return profile_decoder::find_in_table((const entry *)&unk_18A342ED8, a1, 0x18u, a3);
  }
}

std::string *scm_decoder::component_name@<X0>(unsigned int __val@<W1>, std::string *a2@<X8>)
{
  return profile_decoder::find_in_table((const entry *)&unk_18A343058, __val, 6u, a2);
}

std::string *scm_decoder::event_name@<X0>(unsigned int __val@<W2>, std::string *a2@<X8>)
{
  return std::to_string(a2, __val);
}

std::string *wake_decoder::component_name@<X0>(unsigned int __val@<W1>, std::string *a2@<X8>)
{
  return profile_decoder::find_in_table(&stru_18A3430B8, __val, 1u, a2);
}

std::string *wake_decoder::event_name@<X0>(unsigned int __val@<W2>, std::string *a2@<X8>)
{
  return profile_decoder::find_in_table((const entry *)&unk_18A3430C8, __val, 3u, a2);
}

void wake_decoder::parse_datatype(uint64_t a1, uint64_t a2, int *a3)
{
  int v6 = *a3;
  if (*a3 == 167772429)
  {
    sub_1890AE7B4(&v32, "wake_reason");
    profile_decoder::key(&v34);
    if ((v34.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      int v7 = &v34;
    }
    else {
      int v7 = (std::string *)v34.__r_.__value_.__r.__words[0];
    }
    if ((v34.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      uint64_t size = v34.__r_.__value_.__s.__size_;
    }
    else {
      uint64_t size = v34.__r_.__value_.__l.__size_;
    }
    uint64_t v9 = sub_1890AE8EC((void *)(a2 + 16), (uint64_t)v7, size);
    *(void *)((char *)v9 + *(void *)(*v9 - 24LL) + 24) = 10LL;
    uint64_t v10 = (void *)std::ostream::operator<<();
    uint64_t v11 = sub_1890AE8EC(v10, (uint64_t)",", 1LL);
    sub_1890AE7B4(&v29, "endpoint_ref");
    profile_decoder::key(&__p);
    if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      p_p = &__p;
    }
    else {
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      uint64_t v13 = __p.__r_.__value_.__s.__size_;
    }
    else {
      uint64_t v13 = __p.__r_.__value_.__l.__size_;
    }
    uint64_t v14 = sub_1890AE8EC(v11, (uint64_t)p_p, v13);
    *(void *)((char *)v14 + *(void *)(*v14 - 24LL) + 24) = 10LL;
    time_t v15 = (void *)std::ostream::operator<<();
    sub_1890AE8EC(v15, (uint64_t)",", 1LL);
    if (v30 < 0) {
      operator delete(v29);
    }
    if (v33 < 0) {
      operator delete(v32);
    }
    int v6 = *a3;
  }

  if (v6 == 167772675)
  {
    sub_1890AE7B4(&v27, "wake_reason");
    profile_decoder::key(&v34);
    if ((v34.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      uint64_t v16 = &v34;
    }
    else {
      uint64_t v16 = (std::string *)v34.__r_.__value_.__r.__words[0];
    }
    if ((v34.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      uint64_t v17 = v34.__r_.__value_.__s.__size_;
    }
    else {
      uint64_t v17 = v34.__r_.__value_.__l.__size_;
    }
    uint64_t v18 = sub_1890AE8EC((void *)(a2 + 16), (uint64_t)v16, v17);
    *(void *)((char *)v18 + *(void *)(*v18 - 24LL) + 24) = 10LL;
    uint64_t v19 = (void *)std::ostream::operator<<();
    unsigned int v20 = sub_1890AE8EC(v19, (uint64_t)",", 1LL);
    sub_1890AE7B4(&v25, "service_id");
    profile_decoder::key(&__p);
    if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      uint64_t v21 = &__p;
    }
    else {
      uint64_t v21 = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      uint64_t v22 = __p.__r_.__value_.__s.__size_;
    }
    else {
      uint64_t v22 = __p.__r_.__value_.__l.__size_;
    }
    uint64_t v23 = sub_1890AE8EC(v20, (uint64_t)v21, v22);
    *(void *)((char *)v23 + *(void *)(*v23 - 24LL) + 24) = 10LL;
    uint64_t v24 = (void *)std::ostream::operator<<();
    sub_1890AE8EC(v24, (uint64_t)",", 1LL);
    if (v26 < 0) {
      operator delete(v25);
    }
    if (v28 < 0) {
      operator delete(v27);
    }
  }

  else
  {
    profile_decoder::parse_datatype(a1, a2, (uint64_t)a3);
  }

void sub_1890AE63C( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20, void *a21, uint64_t a22, int a23, __int16 a24, char a25, char a26, void *__p, uint64_t a28, int a29, __int16 a30, char a31, char a32, uint64_t a33, uint64_t a34, int a35, __int16 a36, char a37, char a38)
{
  if (a32 < 0) {
    operator delete(__p);
  }
  if (a14 < 0) {
    operator delete(a9);
  }
  if (a20 < 0) {
    operator delete(a15);
  }
  _Unwind_Resume(exception_object);
}

void AOPLogDecoder::to_string(int *a1@<X0>, std::stringbuf::string_type *a2@<X8>)
{
  unint64_t v3 = *a1;
  if (v3 >> 25 <= 6
    && (unsigned int v4 = *(void (****)(void, int *))((char *)AOPLogDecoder::_decoders + ((v3 >> 21) & 0x7F8))) != 0LL)
  {
    (**v4)(v4, a1);
  }

  else
  {
    profile_decoder::to_string((uint64_t)&AOPLogDecoder::_default, a1, a2);
  }

std::string *AOPLogDecoder::category_to_string@<X0>(AOPLogDecoder *this@<X0>, std::string *a2@<X8>)
{
  else {
    return std::to_string(a2, this);
  }
}

std::string *AOPLogDecoder::component_to_string@<X0>( AOPLogDecoder *this@<X0>, uint64_t __val@<X1>, std::string *a3@<X8>)
{
  else {
    return std::to_string(a3, __val);
  }
}

void *sub_1890AE7B4(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8LL) {
    sub_1890AE864();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8LL) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    int v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000LL;
    *a1 = v6;
  }

  else
  {
    *((_BYTE *)a1 + 23) = v4;
    int v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }

  memmove(v6, __s, v5);
LABEL_9:
  *((_BYTE *)v6 + v5) = 0;
  return a1;
}

void sub_1890AE864()
{
}

void sub_1890AE878(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_1890AE8C8(exception, a1);
  __cxa_throw(exception, (struct type_info *)off_18A342490, MEMORY[0x1896141F8]);
}

void sub_1890AE8B4(_Unwind_Exception *a1)
{
}

std::logic_error *sub_1890AE8C8(std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x189614778] + 16LL);
  return result;
}

void *sub_1890AE8EC(void *a1, uint64_t a2, uint64_t a3)
{
  if (v13[0])
  {
    uint64_t v6 = (uint64_t)a1 + *(void *)(*a1 - 24LL);
    uint64_t v7 = *(void *)(v6 + 40);
    int v8 = *(_DWORD *)(v6 + 8);
    int v9 = *(_DWORD *)(v6 + 144);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24LL)));
      uint64_t v10 = std::locale::use_facet(&v14, MEMORY[0x189614558]);
      int v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 32LL);
      std::locale::~locale(&v14);
      *(_DWORD *)(v6 + 144) = v9;
    }

    if ((v8 & 0xB0) == 0x20) {
      uint64_t v11 = a2 + a3;
    }
    else {
      uint64_t v11 = a2;
    }
    if (!sub_1890AEA50(v7, a2, v11, a2 + a3, v6, (char)v9)) {
      std::ios_base::clear( (std::ios_base *)((char *)a1 + *(void *)(*a1 - 24LL)),  *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24LL) + 32) | 5);
    }
  }

  MEMORY[0x1895DEB30](v13);
  return a1;
}

void sub_1890AE9F4( void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
}

void sub_1890AEA3C(_Unwind_Exception *a1)
{
}

uint64_t sub_1890AEA50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
{
  uint64_t v6 = a1;
  if (a1)
  {
    uint64_t v11 = *(void *)(a5 + 24);
    if (v11 <= a4 - a2) {
      int64_t v12 = 0LL;
    }
    else {
      int64_t v12 = v11 - (a4 - a2);
    }
    if (v12 >= 1)
    {
      sub_1890AEB8C(__p, v12, __c);
      uint64_t v13 = v18 >= 0 ? __p : (void **)__p[0];
      uint64_t v14 = (*(uint64_t (**)(uint64_t, void **, int64_t))(*(void *)v6 + 96LL))(v6, v13, v12);
      if (v18 < 0) {
        operator delete(__p[0]);
      }
      if (v14 != v12) {
        return 0LL;
      }
    }

    uint64_t v15 = a4 - a3;
    else {
      return 0LL;
    }
  }

  return v6;
}

void sub_1890AEB70( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *sub_1890AEB8C(void *__b, size_t __len, int __c)
{
  if (__len >= 0x7FFFFFFFFFFFFFF8LL) {
    sub_1890AE864();
  }
  if (__len >= 0x17)
  {
    size_t v7 = (__len & 0xFFFFFFFFFFFFFFF8LL) + 8;
    if ((__len | 7) != 0x17) {
      size_t v7 = __len | 7;
    }
    size_t v8 = v7 + 1;
    uint64_t v6 = operator new(v7 + 1);
    __b[1] = __len;
    __b[2] = v8 | 0x8000000000000000LL;
    *__b = v6;
  }

  else
  {
    *((_BYTE *)__b + 23) = __len;
    uint64_t v6 = __b;
    if (!__len) {
      goto LABEL_9;
    }
  }

  memset(v6, __c, __len);
LABEL_9:
  *((_BYTE *)v6 + __len) = 0;
  return __b;
}

void *sub_1890AEC34(_BYTE *__dst, void *__src, unint64_t a3)
{
  size_t v5 = __dst;
  if (a3 > 0x16)
  {
    if (a3 >= 0x7FFFFFFFFFFFFFF8LL) {
      sub_1890AE864();
    }
    uint64_t v6 = (a3 & 0xFFFFFFFFFFFFFFF8LL) + 8;
    if ((a3 | 7) != 0x17) {
      uint64_t v6 = a3 | 7;
    }
    uint64_t v7 = v6 + 1;
    size_t v8 = operator new(v6 + 1);
    v5[1] = a3;
    v5[2] = v7 | 0x8000000000000000LL;
    *size_t v5 = v8;
    size_t v5 = v8;
  }

  else
  {
    __dst[23] = a3;
  }

  return memmove(v5, __src, a3 + 1);
}

uint64_t SPU_log_get_report_size(uint64_t a1)
{
  return ((*(void *)(a1 + 8) >> 2) & 0xF0LL) + 16;
}

uint64_t SPU_log_next_report(uint64_t a1)
{
  uint64_t v1 = a1 + ((*(void *)(a1 + 8) >> 2) & 0xF0LL);
  int v3 = *(_DWORD *)(v1 + 16);
  uint64_t v2 = v1 + 16;
  if (v3) {
    return v2;
  }
  else {
    return 0LL;
  }
}

uint64_t SPU_log_end_iterator(uint64_t a1)
{
  return a1 + 256;
}

uint64_t SPU_log_get_num_reports(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t result = 0LL;
    uint64_t v2 = v1 + 256;
    do
    {
      if (!*(_DWORD *)v1) {
        break;
      }
      ++result;
      uint64_t v3 = v1 + ((*(void *)(v1 + 8) >> 2) & 0xF0LL);
      int v4 = *(_DWORD *)(v3 + 16);
      uint64_t v1 = v3 + 16;
      uint64_t v5 = v4 ? v1 : 0LL;
    }

    while (v5 && v5 != v2);
  }

  return result;
}

uint64_t spu_log_device_time_to_mach_time( uint64_t a1, unint64_t *a2, unint64_t *a3, unint64_t *a4)
{
  mach_port_t v8 = *MEMORY[0x1896086B0];
  int v9 = IOServiceMatching("AppleSPUTimesync");
  io_service_t MatchingService = IOServiceGetMatchingService(v8, v9);
  if (MatchingService)
  {
    io_object_t v11 = MatchingService;
    CFProperty = (const __CFDictionary *)IORegistryEntryCreateCFProperty( MatchingService,  @"timesync",  (CFAllocatorRef)*MEMORY[0x189604DB0],  0);
    if (CFProperty)
    {
      uint64_t v13 = CFProperty;
      Value = (const __CFNumber *)CFDictionaryGetValue(CFProperty, @"ap");
      Boolean v15 = CFNumberGetValue(Value, kCFNumberLongLongType, &valuePtr);
      uint64_t v16 = (const __CFNumber *)CFDictionaryGetValue(v13, @"ap-cont");
      char v17 = v15 & CFNumberGetValue(v16, kCFNumberLongLongType, &v26);
      char v18 = (const __CFNumber *)CFDictionaryGetValue(v13, @"spu");
      unsigned __int8 v19 = v17 & CFNumberGetValue(v18, kCFNumberLongLongType, &v25);
      unsigned int v20 = (const __CFNumber *)CFDictionaryGetValue(v13, @"calendar");
      Boolean v21 = CFNumberGetValue(v20, kCFNumberLongLongType, &v24);
      if (a2) {
        *a2 = valuePtr + 1000 * a1 - v25;
      }
      if (a3) {
        *a3 = v26 + 1000 * a1 - v25;
      }
      uint64_t v22 = v19 & 1u & v21;
      if (a4) {
        *a4 = v24 + 1000 * a1 - v25;
      }
      CFRelease(v13);
    }

    else
    {
      fprintf( (FILE *)*MEMORY[0x1895F89D0],  "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n",  "timesync != __null",  "",  "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/liblog_aop/liblog_aop.cpp",  32,  0LL);
      uint64_t v22 = 0LL;
    }

    IOObjectRelease(v11);
  }

  else
  {
    fprintf( (FILE *)*MEMORY[0x1895F89D0],  "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n",  "service != 0",  "",  "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/liblog_aop/liblog_aop.cpp",  29,  0LL);
    return 0LL;
  }

  return v22;
}

uint64_t spu_log_calendar_time_to_walltime(unint64_t a1, char *a2, size_t a3)
{
  time_t v7 = a1 / 0x3B9ACA00;
  uint64_t v5 = localtime(&v7);
  strftime(a2, a3, "%b %d %T", v5);
  return 1LL;
}

unint64_t spu_log_ns_to_mach_time(unint64_t a1)
{
  double v2 = *(double *)&qword_18C767C78;
  if (*(double *)&qword_18C767C78 == 0.0)
  {
    mach_timebase_info(&info);
    LODWORD(v3) = info.numer;
    LODWORD(v4) = info.denom;
    double v2 = (double)v3 / (double)v4;
    qword_18C767C78 = *(void *)&v2;
  }

  return (unint64_t)((double)a1 / v2);
}

uint64_t spu_log_report_to_string( uint64_t result, _BYTE *a2, unint64_t a3, int a4, char *a5, size_t a6)
{
  if (result)
  {
    io_object_t v11 = (const char *)result;
    size_t v12 = strlen((const char *)result);
    uint64_t v13 = 2LL;
    if (a4) {
      uint64_t v13 = 3LL;
    }
    if (v12 + v13 * a3 + 2 >= a6)
    {
      return 0LL;
    }

    else
    {
      strlcpy(a5, v11, a6);
      strlcat(a5, " ", a6);
      uint64_t v14 = &a5[strlen(a5)];
      if (a3)
      {
        uint64_t v15 = 0LL;
        do
        {
          char *v14 = a0123456789abcd[(unint64_t)a2[v15] >> 4];
          v14[1] = a0123456789abcd[a2[v15] & 0xF];
          if (a4)
          {
            v14[2] = 32;
            v14 += 3;
          }

          else
          {
            v14 += 2;
          }

          ++v15;
        }

        while (a3 > v15);
      }

      char *v14 = 0;
      return 1LL;
    }
  }

  return result;
}

uint64_t spu_log_print_report(void *a1, const char *a2, _BYTE *a3, unint64_t a4, int a5)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  uint64_t result = spu_log_report_to_string((uint64_t)a2, a3, a4, a5, v6, 0x800uLL);
  if ((_DWORD)result) {
    return puts(v6);
  }
  return result;
}

BOOL spu_log_get_aop_logs( int a1, uint64_t a2, void (*a3)(void *, const char *, const void *, unint64_t, BOOL), void *a4)
{
  kern_return_t v7;
  uint64_t v8;
  size_t v9;
  unsigned __int8 v10;
  char *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  char *v24;
  char *v25;
  int v26;
  char *v27;
  int v28;
  char *v29;
  unint64_t *v31;
  unint64_t v32;
  unint64_t v33;
  char *v34;
  int v35;
  char *v36;
  BOOL v37;
  BOOL v38;
  BOOL v40;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _BYTE v64[184];
  size_t v65;
  void (**v66)(AOPServiceConnect *__hidden);
  uint64_t v67[3];
  uint64_t v68;
  int inputStruct;
  uint64_t input[4];
  input[1] = *MEMORY[0x1895F89C0];
  inputStruct = a1;
  v66 = off_18A343470;
  sub_1890AE7B4(v67, "AOP_log");
  v68 = 0LL;
  input[0] = 35LL;
  uint64_t v65 = a2 << 8;
  uint64_t v5 = (char *)malloc(a2 << 8);
  if (v5)
  {
    outputStruct = v5;
    uint64_t v40 = AOPServiceConnect::connect((AOPServiceConnect *)&v66);
    if (v40)
    {
      uint64_t v7 = IOConnectCallMethod(v68, 3u, input, 1u, &inputStruct, 4uLL, 0LL, 0LL, outputStruct, &v65);
      if (v7)
      {
        fprintf( (FILE *)*MEMORY[0x1895F89D0],  "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n",  "kr == 0 ",  "",  "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/liblog_aop/liblog_aop.cpp",  138,  v7);
      }

      else if (v65 >= 0x100)
      {
        mach_port_t v8 = 0LL;
        int v9 = v65 >> 8;
        do
        {
          uint64_t v10 = 0;
          v63 = 0u;
          memset(v64, 0, 176);
          v61 = 0u;
          uint64_t v62 = 0u;
          uint64_t v59 = 0u;
          uint64_t v60 = 0u;
          uint64_t v57 = 0u;
          v58 = 0u;
          v55 = 0u;
          uint64_t v56 = 0u;
          v53 = 0u;
          uint64_t v54 = 0u;
          uint64_t v51 = 0u;
          uint64_t v52 = 0u;
          uint64_t v49 = 0u;
          uint64_t v50 = 0u;
          int v47 = 0u;
          uint64_t v48 = 0u;
          io_object_t v11 = &outputStruct[256 * v8];
          size_t v12 = *((_OWORD *)v11 + 13);
          uint64_t v13 = *((_OWORD *)v11 + 14);
          uint64_t v14 = *((_OWORD *)v11 + 11);
          uint64_t v59 = *((_OWORD *)v11 + 12);
          uint64_t v60 = v12;
          uint64_t v15 = *((_OWORD *)v11 + 15);
          v61 = v13;
          uint64_t v62 = v15;
          uint64_t v16 = *((_OWORD *)v11 + 9);
          char v17 = *((_OWORD *)v11 + 10);
          char v18 = *((_OWORD *)v11 + 7);
          v55 = *((_OWORD *)v11 + 8);
          uint64_t v56 = v16;
          uint64_t v57 = v17;
          v58 = v14;
          unsigned __int8 v19 = *((_OWORD *)v11 + 5);
          unsigned int v20 = *((_OWORD *)v11 + 6);
          Boolean v21 = *((_OWORD *)v11 + 3);
          uint64_t v51 = *((_OWORD *)v11 + 4);
          uint64_t v52 = v19;
          v53 = v20;
          uint64_t v54 = v18;
          uint64_t v22 = *((_OWORD *)v11 + 1);
          uint64_t v23 = *((_OWORD *)v11 + 2);
          int v47 = *(_OWORD *)v11;
          uint64_t v48 = v22;
          __int16 v46 = 0u;
          uint64_t v49 = v23;
          uint64_t v50 = v21;
          uint64_t v24 = v11 + 256;
          uint64_t v25 = v11;
          uint64_t v26 = *(_DWORD *)v11;
          do
          {
            if (!v26) {
              break;
            }
            ++v10;
            int v27 = &v25[(*((void *)v25 + 1) >> 2) & 0xF0LL];
            char v28 = *((_DWORD *)v27 + 4);
            uint64_t v25 = v27 + 16;
            uint64_t v26 = v28;
            uint64_t v29 = v28 ? v25 : 0LL;
          }

          while (v29 && v29 != v24);
          BYTE3(v46) = v10;
          LOWORD(v46) = 24 * v10 + 272;
          int v31 = (unint64_t *)v64;
          do
          {
            spu_log_device_time_to_mach_time(*((void *)v11 + 1) >> 10, &v45, &v44, &v43);
            *((_DWORD *)v31 - 4) = *((_DWORD *)v11 + 1);
            uint64_t v32 = spu_log_ns_to_mach_time(v44);
            char v33 = v43;
            *(v31 - 1) = v32;
            void *v31 = v33;
            std::string v34 = &v11[(*((void *)v11 + 1) >> 2) & 0xF0LL];
            uint64_t v35 = *((_DWORD *)v34 + 4);
            io_object_t v11 = v34 + 16;
            if (v35) {
              v36 = v11;
            }
            else {
              v36 = 0LL;
            }
            v31 += 3;
            if (v36) {
              v37 = v36 == v24;
            }
            else {
              v37 = 1;
            }
          }

          while (!v37);
          a3(a4, "AOPLOG", &v46, (unsigned __int16)v46, 0);
          ++v8;
        }

        while (v8 != v9);
      }
    }

    else
    {
      fprintf( (FILE *)*MEMORY[0x1895F89D0],  "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n",  "success",  "",  "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/liblog_aop/liblog_aop.cpp",  135,  0LL);
    }

    free(outputStruct);
    uint64_t v38 = v40;
  }

  else
  {
    fprintf( (FILE *)*MEMORY[0x1895F89D0],  "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n",  "aop_reports",  "",  "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/liblog_aop/liblog_aop.cpp",  132,  0LL);
    uint64_t v38 = 0LL;
  }

  AOPServiceConnect::~AOPServiceConnect((AOPServiceConnect *)&v66);
  return v38;
}

void sub_1890AF4F4(_Unwind_Exception *exception_object)
{
}

void AOPServiceConnect::~AOPServiceConnect(void **this)
{
  *this = off_18A343470;
  AOPServiceConnect::disconnect((AOPServiceConnect *)this);
}

{
  void *v1;
  AOPServiceConnect::~AOPServiceConnect(this);
  operator delete(v1);
}

BOOL AOPServiceConnect::connect(AOPServiceConnect *this)
{
  mach_port_t v2 = *MEMORY[0x1896086B0];
  unint64_t v3 = (char *)this + 8;
  unint64_t v4 = IOServiceNameMatching(v3);
  io_service_t MatchingService = IOServiceGetMatchingService(v2, v4);
  *((_DWORD *)this + 9) = MatchingService;
  return MatchingService && !IOServiceOpen(MatchingService, *MEMORY[0x1895FBBE0], 0, (io_connect_t *)this + 8);
}

uint64_t AOPServiceConnect::disconnect(AOPServiceConnect *this)
{
  io_connect_t v2 = *((_DWORD *)this + 8);
  if (v2)
  {
    IOServiceClose(v2);
    *((_DWORD *)this + 8) = 0;
  }

  uint64_t result = *((unsigned int *)this + 9);
  if ((_DWORD)result)
  {
    uint64_t result = IOObjectRelease(result);
    *((_DWORD *)this + 9) = 0;
  }

  return result;
}

void sub_1890AF628(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl(&dword_1890A6000, log, OS_LOG_TYPE_FAULT, "fault!", v1, 2u);
}

uint64_t ADClientAddValueForScalarKey()
{
  return MEMORY[0x18960CE20]();
}

uint64_t ADClientClearDistributionKey()
{
  return MEMORY[0x18960CE30]();
}

uint64_t ADClientClearScalarKey()
{
  return MEMORY[0x18960CE38]();
}

uint64_t ADClientPushValueForDistributionKey()
{
  return MEMORY[0x18960CE40]();
}

uint64_t ADClientSetValueForDistributionKey()
{
  return MEMORY[0x18960CE58]();
}

uint64_t ADClientSetValueForScalarKey()
{
  return MEMORY[0x18960CE68]();
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return (void *)MEMORY[0x1896025D8](allocator, size, hint);
}

void CFAllocatorDeallocate(CFAllocatorRef allocator, void *ptr)
{
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable( CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x189602648](allocator, capacity, callBacks);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1896027C8]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1896027D0](BOOLean);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x189602C00](theDict, key);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x189602C38](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x189602D30](cf);
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

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x189603468](alloc, cStr, *(void *)&encoding);
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

kern_return_t IOConnectCallMethod( mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x189607CB8]( *(void *)&connection,  *(void *)&selector,  input,  *(void *)&inputCnt,  inputStruct,  inputStructCnt,  output,  outputCnt);
}

kern_return_t IOCreatePlugInInterfaceForService( io_service_t service, CFUUIDRef pluginType, CFUUIDRef interfaceType, IOCFPlugInInterface ***theInterface, SInt32 *theScore)
{
  return MEMORY[0x189607D30](*(void *)&service, pluginType, interfaceType, theInterface, theScore);
}

uint64_t IOHIDServiceCopyProperty()
{
  return MEMORY[0x1896081A8]();
}

uint64_t IOHIDServiceGetProperty()
{
  return MEMORY[0x1896081B0]();
}

uint64_t IOHIDServiceGetRegistryID()
{
  return MEMORY[0x1896081B8]();
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x189608398](*(void *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty( io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x189608470](*(void *)&entry, key, allocator, *(void *)&options);
}

kern_return_t IORegistryEntryGetName(io_registry_entry_t entry, io_name_t name)
{
  return MEMORY[0x1896084B0](*(void *)&entry, name);
}

kern_return_t IORegistryEntryGetParentEntry( io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *parent)
{
  return MEMORY[0x1896084D0](*(void *)&entry, plane, parent);
}

CFMutableDictionaryRef IORegistryEntryIDMatching(uint64_t entryID)
{
  return (CFMutableDictionaryRef)MEMORY[0x189608508](entryID);
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

CFMutableDictionaryRef IOServiceNameMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x189608590](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x189608598](*(void *)&service, *(void *)&owningTask, *(void *)&type, connect);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::stringbuf::string_type *__cdecl std::stringbuf::str( std::stringbuf::string_type *__return_ptr retstr, const std::stringbuf *this)
{
  return (std::stringbuf::string_type *)MEMORY[0x189614198](retstr, this);
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x1896141C8](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x1896141D0](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1896141E0](this, a2);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x1896142D0](this, __s);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x1896142F0](this, __s);
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x1896143C8]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x1896143D0]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x1896143F0]();
}

{
  return MEMORY[0x189614400]();
}

{
  return MEMORY[0x189614408]();
}

{
  return MEMORY[0x189614418]();
}

{
  return MEMORY[0x189614428]();
}

{
  return MEMORY[0x189614438]();
}

uint64_t std::iostream::~basic_iostream()
{
  return MEMORY[0x189614448]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x189614470]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x189614478]();
}

void std::locale::~locale(std::locale *this)
{
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x189614638]();
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unsigned int __val)
{
  return (std::string *)MEMORY[0x189614658](retstr, *(void *)&__val);
}

uint64_t std::operator+<char>()
{
  return MEMORY[0x189614680]();
}

void std::terminate(void)
{
}

void operator delete(void *__p)
{
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_18A3424C0(__sz);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1896147A0](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1896147B8](a1);
}

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

void _os_log_debug_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1895FB360](a1, a2);
}

void free(void *a1)
{
}

tm *__cdecl localtime(const time_t *a1)
{
  return (tm *)MEMORY[0x1895FBA18](a1);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1895FBBF8](info);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1895FBC88](__size);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1895FBE30](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1895FBE48](__b, *(void *)&__c, __len);
}

uint32_t notify_register_dispatch( const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1895FC1C0](name, out_token, queue, handler);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1895FC440](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1895FC470](oslog, type);
}

void os_release(void *object)
{
}

int puts(const char *a1)
{
  return MEMORY[0x1895FCB98](a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1895FCF90](__str, __size, __format);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return MEMORY[0x1895FD090](a1, a2, a3, a4);
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