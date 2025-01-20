IOHIDEventProcessor *IOHIDEventProcessorFactory(uint64_t a1, const void *a2)
{
  CFAllocatorRef v3;
  CFUUIDRef v4;
  IOHIDEventProcessor *v5;
  CFUUIDRef v6;
  v3 = (const __CFAllocator *)*MEMORY[0x189604DD0];
  v4 = CFUUIDGetConstantUUIDWithBytes( (CFAllocatorRef)*MEMORY[0x189604DD0],  0x6Bu,  3u,  0x40u,  0xD3u,  0x57u,  0x98u,  0x40u,  0x64u,  0xAAu,  0x17u,  0x92u,  4u,  0xC7u,  0xB0u,  0x6Fu,  0xFDu);
  if (!CFEqual(a2, v4)) {
    return 0LL;
  }
  v5 = (IOHIDEventProcessor *)MEMORY[0x1895DED80](*MEMORY[0x189604DB0], 168LL, 0LL);
  v6 = CFUUIDGetConstantUUIDWithBytes( v3,  0x7Du,  0xCFu,  0x18u,  0xB5u,  7u,  0xBEu,  0x4Fu,  0xF5u,  0x87u,  0xCFu,  0x44u,  0xB3u,  0xC1u,  0x7Cu,  0x92u,  0x16u);
  IOHIDEventProcessor::IOHIDEventProcessor(v5, v6);
  return v5;
}

uint64_t IOHIDEventProcessor::AddRef(IOHIDEventProcessor *this, void *a2)
{
  uint64_t v2 = (*((_DWORD *)this + 4) + 1);
  *((_DWORD *)this + 4) = v2;
  return v2;
}

uint64_t IOHIDEventProcessor::filterCopyEvent(uint64_t a1, uint64_t a2)
{
  return a2;
}

{
  return a2;
}

void IOHIDEventProcessor::scheduleWithDispatchQueue( IOHIDEventProcessor *this, dispatch_queue_s *a2, dispatch_queue_s *a3)
{
  *((void *)this + 3) = a2;
  Timer::init(*((Timer **)this + 20), a2);
}

void IOHIDEventProcessor::unscheduleFromDispatchQueue( IOHIDEventProcessor *this, void *a2, dispatch_queue_s *a3)
{
  if (*((void **)this + 3) == a2)
  {
    uint64_t v4 = *((void *)this + 20);
    if (*(void *)v4) {
      dispatch_source_cancel(*(dispatch_source_t *)v4);
    }
    *(void *)(v4 + 8) = 0LL;
    *((void *)this + 3) = 0LL;
  }
}

void *IOHIDEventProcessor::setEventCallback(void *result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  result[5] = a2;
  result[6] = a3;
  result[7] = a4;
  return result;
}

{
  result[5] = a2;
  result[6] = a3;
  result[7] = a4;
  return result;
}

void IOHIDEventProcessor::IOHIDEventProcessor(IOHIDEventProcessor *this, CFTypeRef cf)
{
  *(void *)this = &IOHIDEventProcessor::sIOHIDEventProcessorFtbl;
  *((void *)this + 1) = CFRetain(cf);
  *((_DWORD *)this + 4) = 1;
  *(_OWORD *)((char *)this + 20) = 0u;
  *(_OWORD *)((char *)this + 36) = 0u;
  *(_OWORD *)((char *)this + 49) = 0u;
  *((void *)this + 10) = 0LL;
  *((void *)this + 11) = 0LL;
  *((void *)this + 9) = 0LL;
  *((_BYTE *)this + 96) = 0;
  *((void *)this + 13) = 0LL;
  *((void *)this + 14) = 0LL;
  *((_BYTE *)this + 120) = 0;
  *((_OWORD *)this + 8) = 0u;
  *((_OWORD *)this + 9) = 0u;
  uint64_t v4 = operator new(0x18uLL);
  v4[1] = 0LL;
  v4[2] = 0LL;
  *uint64_t v4 = 0LL;
  *((void *)this + 20) = v4;
  CFPlugInAddInstanceForFactory((CFUUIDRef)cf);
  if (!dword_18C4FE9FC) {
    mach_timebase_info((mach_timebase_info_t)&dword_18C4FE9F8);
  }
}

void Timer::Timer(Timer *this)
{
  *(void *)this = 0LL;
  *((void *)this + 1) = 0LL;
  *((void *)this + 2) = 0LL;
}

{
  *(void *)this = 0LL;
  *((void *)this + 1) = 0LL;
  *((void *)this + 2) = 0LL;
}

void IOHIDEventProcessor::~IOHIDEventProcessor(IOHIDEventProcessor *this)
{
  uint64_t v2 = (const void *)*((void *)this + 9);
  if (v2) {
    CFRelease(v2);
  }
  v3 = (void *)*((void *)this + 18);
  if (v3)
  {
    do
    {
      uint64_t v4 = (void *)v3[2];
      (*(void (**)(void *))(*v3 + 8LL))(v3);
      v3 = v4;
    }

    while (v4);
  }

  v5 = (void *)*((void *)this + 19);
  if (v5)
  {
    do
    {
      v6 = (void *)v5[2];
      (*(void (**)(void *))(*v5 + 8LL))(v5);
      v5 = v6;
    }

    while (v6);
  }

  v7 = (void *)*((void *)this + 17);
  if (v7)
  {
    do
    {
      v8 = (void *)v7[2];
      (*(void (**)(void *))(*v7 + 8LL))(v7);
      v7 = v8;
    }

    while (v8);
  }

  v9 = (void *)*((void *)this + 20);
  if (v9) {
    operator delete(v9);
  }
  CFPlugInRemoveInstanceForFactory(*((CFUUIDRef *)this + 1));
  CFRelease(*((CFTypeRef *)this + 1));
}

void sub_1890B33D4(void *a1)
{
}

uint64_t IOHIDEventProcessor::QueryInterface(IOHIDEventProcessor *this, CFUUIDBytes a2, void **a3)
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

uint64_t IOHIDEventProcessor::AddRef(IOHIDEventProcessor *this)
{
  uint64_t v1 = (*((_DWORD *)this + 4) + 1);
  *((_DWORD *)this + 4) = v1;
  return v1;
}

uint64_t IOHIDEventProcessor::Release(IOHIDEventProcessor *this)
{
  int v1 = *((_DWORD *)this + 4);
  uint64_t v2 = (v1 - 1);
  *((_DWORD *)this + 4) = v2;
  if (v1 == 1)
  {
    IOHIDEventProcessor::~IOHIDEventProcessor(this);
    operator delete(v3);
  }

  return v2;
}

void IOHIDEventProcessor::setPropertyForClient( IOHIDEventProcessor *this, CFStringRef theString1, const void *a3, const void *a4)
{
  uint64_t valuePtr = 0LL;
  if (theString1 && a3)
  {
    CFUUIDRef v7 = 0LL;
    if (CFStringCompare(theString1, @"PressCountTrackingEnabled", 0LL) == kCFCompareEqualTo)
    {
      *((_BYTE *)this + 64) = *MEMORY[0x189604DE8] == (void)a3;
      CFUUIDRef v8 = (os_log_s *)_IOHIDLogCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        sub_1890B6064();
      }
      if (*((_BYTE *)this + 64) && !*((void *)this + 18))
      {
        CFUUIDRef v7 = 0LL;
        int v9 = 11;
        do
        {
          uint64_t v10 = v7;
          v11 = (char *)operator new(0x70uLL);
          CFUUIDRef v7 = v11;
          *(_OWORD *)(v11 + 8) = 0u;
          *(_OWORD *)(v11 + 24) = 0u;
          v11[40] = 1;
          *(_OWORD *)(v11 + 44) = 0u;
          *(_OWORD *)(v11 + 60) = 0u;
          *(_DWORD *)(v11 + 75) = 0;
          *((_OWORD *)v11 + 5) = 0u;
          *((_OWORD *)v11 + 6) = 0u;
          *(void *)v11 = &off_18A343930;
          *((void *)v11 + 2) = v10;
          --v9;
        }

        while (v9);
        *((void *)this + 18) = v11;
      }

      else
      {
        CFUUIDRef v7 = 0LL;
      }
    }

    if (CFStringCompare(theString1, @"PressCountUsagePairs", 0LL) == kCFCompareEqualTo)
    {
      v12 = (const void *)*((void *)this + 9);
      if (v12) {
        CFRelease(v12);
      }
      *((void *)this + 9) = a3;
      CFRetain(a3);
      v13 = (os_log_s *)_IOHIDLogCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        sub_1890B6004();
      }
    }

    if (CFStringCompare(theString1, @"PressCountDoublePressTimeout", 0LL) == kCFCompareEqualTo)
    {
      CFNumberGetValue((CFNumberRef)a3, kCFNumberLongLongType, &valuePtr);
      *((void *)this + 10) = valuePtr;
      v14 = (os_log_s *)_IOHIDLogCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        sub_1890B5FA4();
      }
    }

    if (CFStringCompare(theString1, @"PressCountTriplePressTimeout", 0LL) == kCFCompareEqualTo)
    {
      CFNumberGetValue((CFNumberRef)a3, kCFNumberLongLongType, &valuePtr);
      *((void *)this + 11) = valuePtr;
      v15 = (os_log_s *)_IOHIDLogCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        sub_1890B5F44();
      }
    }

    if (CFStringCompare(theString1, @"LongPressTimeout", 0LL) == kCFCompareEqualTo)
    {
      CFNumberGetValue((CFNumberRef)a3, kCFNumberLongLongType, &valuePtr);
      *((void *)this + 16) = valuePtr;
      v16 = (os_log_s *)_IOHIDLogCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        sub_1890B5EE4();
      }
    }

    if (CFStringCompare(theString1, @"AlternateLongPressHandling", 0LL) == kCFCompareEqualTo)
    {
      *((_BYTE *)this + 120) = *MEMORY[0x189604DE8] == (void)a3;
      v17 = (os_log_s *)_IOHIDLogCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        sub_1890B5E68();
      }
    }

    if (CFStringCompare(theString1, @"TapTrackingEnabled", 0LL) == kCFCompareEqualTo)
    {
      *((_BYTE *)this + 96) = *MEMORY[0x189604DE8] == (void)a3;
      v20 = (os_log_s *)_IOHIDLogCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        sub_1890B5DEC();
      }
      if (*((_BYTE *)this + 96) && !*((void *)this + 19))
      {
        v21 = (char *)operator new(0x70uLL);
        *(_OWORD *)(v21 + 8) = 0u;
        *(_OWORD *)(v21 + 24) = 0u;
        v21[40] = 1;
        *(_OWORD *)(v21 + 44) = 0u;
        *(_OWORD *)(v21 + 60) = 0u;
        *(_DWORD *)(v21 + 75) = 0;
        *((_OWORD *)v21 + 5) = 0u;
        *((_OWORD *)v21 + 6) = 0u;
        *(void *)v21 = &off_18A3439D8;
        *((void *)v21 + 2) = v7;
        *((void *)this + 19) = v21;
      }
    }

    if (CFStringCompare(theString1, @"DoubleTapTimeout", 0LL) == kCFCompareEqualTo)
    {
      CFNumberGetValue((CFNumberRef)a3, kCFNumberLongLongType, &valuePtr);
      *((void *)this + 13) = valuePtr;
      v18 = (os_log_s *)_IOHIDLogCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        sub_1890B5D8C();
      }
    }

    if (CFStringCompare(theString1, @"TripleTapTimeout", 0LL) == kCFCompareEqualTo)
    {
      CFNumberGetValue((CFNumberRef)a3, kCFNumberLongLongType, &valuePtr);
      *((void *)this + 14) = valuePtr;
      v19 = (os_log_s *)_IOHIDLogCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        sub_1890B5D2C();
      }
    }
  }

CFTypeRef IOHIDEventProcessor::copyPropertyForClient( IOHIDEventProcessor *this, CFTypeRef cf1, const void *a3)
{
  if (!CFEqual(cf1, @"ServiceFilterDebug")) {
    return 0LL;
  }
  unint64_t v6 = 0xAAAAAAAAAAAAAAAALL;
  CFTypeRef cf = (CFTypeRef)0xAAAAAAAAAAAAAAAALL;
  sub_1890B5A08(&v6, 0);
  if (cf)
  {
    IOHIDEventProcessor::serialize(this, (__CFDictionary *)cf);
    CFTypeRef v4 = CFRetain(cf);
  }

  else
  {
    CFTypeRef v4 = 0LL;
  }

  sub_1890B5AB0(&v6);
  return v4;
}

void sub_1890B3A58( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void *IOHIDEventProcessor::serialize(IOHIDEventProcessor *this, __CFDictionary *a2)
{
  CFUUIDRef v5 = (void *)0xAAAAAAAAAAAAAAAALL;
  CFMutableDictionaryRef theDict = (CFMutableDictionaryRef)0xAAAAAAAAAAAAAAAALL;
  sub_1890B5AF0(&v5, a2, 0);
  CFUUIDRef v5 = &unk_18A343A70;
  CFDictionarySetValue(theDict, @"Class", @"IOHIDEventProcessor");
  sub_1890B4644((uint64_t)&v5, @"PressCountTrackingEnabled", *((_BYTE *)this + 64));
  v3 = (const void *)*((void *)this + 9);
  if (v3) {
    CFDictionarySetValue(theDict, @"PressCountUsagePairs", v3);
  }
  sub_1890B46B0((uint64_t)&v5, @"PressCountDoublePressTimeout", *((void *)this + 10));
  sub_1890B46B0((uint64_t)&v5, @"PressCountTriplePressTimeout", *((void *)this + 11));
  sub_1890B46B0((uint64_t)&v5, @"LongPressTimeout", *((void *)this + 16));
  sub_1890B4644((uint64_t)&v5, @"AlternateLongPressHandling", *((_BYTE *)this + 120));
  sub_1890B46B0((uint64_t)&v5, @"TapTrackingEnabled", *((void *)this + 11));
  sub_1890B46B0((uint64_t)&v5, @"DoubleTapTimeout", *((void *)this + 13));
  sub_1890B46B0((uint64_t)&v5, @"TripleTapTimeout", *((void *)this + 14));
  sub_1890B46B0((uint64_t)&v5, @"MatchScore", *((int *)this + 5));
  return sub_1890B5AB0(&v5);
}

void sub_1890B3BC4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t IOHIDEventProcessor::match(uint64_t a1, uint64_t a2)
{
  CFTypeRef v4 = (const __CFNumber *)IOHIDServiceCopyProperty();
  if (v4)
  {
    CFUUIDRef v5 = v4;
    int valuePtr = 0;
    CFNumberGetValue(v4, kCFNumberSInt32Type, &valuePtr);
    if (valuePtr)
    {
      *(_DWORD *)(a1 + 20) = 200;
      *(void *)(a1 + 32) = a2;
    }

    CFRelease(v5);
  }

  else
  {
    *(_DWORD *)(a1 + 20) = 200;
    *(void *)(a1 + 32) = a2;
  }

  unint64_t v6 = (os_log_s *)_IOHIDLogCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_1890B60E0(a1, a2, v6);
  }
  return *(unsigned int *)(a1 + 20);
}

uint64_t IOHIDEventProcessor::filter(uint64_t a1, uint64_t a2)
{
  uint64_t v38 = *MEMORY[0x1895F89C0];
  if (!*(void *)(a1 + 24)) {
    return a2;
  }
  int Type = IOHIDEventGetType();
  int v5 = Type;
  if (Type == 3)
  {
    if (!*(_BYTE *)(a1 + 64)) {
      return a2;
    }
    unint64_t v6 = (unint64_t *)(a1 + 80);
    CFUUIDRef v7 = (unint64_t *)(a1 + 88);
    CFUUIDRef v8 = (uint64_t *)(a1 + 144);
  }

  else
  {
    if (Type != 29 || !*(_BYTE *)(a1 + 96)) {
      return a2;
    }
    unint64_t v6 = (unint64_t *)(a1 + 104);
    CFUUIDRef v7 = (unint64_t *)(a1 + 112);
    CFUUIDRef v8 = (uint64_t *)(a1 + 152);
  }

  v32 = v8;
  unint64_t v9 = *v7;
  unint64_t v10 = *v6;
  int IntegerValue = IOHIDEventGetIntegerValue();
  int v12 = IOHIDEventGetIntegerValue();
  v13 = (os_log_s *)_IOHIDLogCategory();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(valuePtr) = 67109632;
    HIDWORD(valuePtr) = v5;
    __int16 v34 = 1024;
    int v35 = IntegerValue;
    __int16 v36 = 1024;
    int v37 = v12;
    _os_log_debug_impl( &dword_1890B2000,  v13,  OS_LOG_TYPE_DEBUG,  "filter: type = %d p = %d u = %d\n",  (uint8_t *)&valuePtr,  0x14u);
  }

  if (v5 != 3) {
    goto LABEL_16;
  }
  v14 = *(const __CFArray **)(a1 + 72);
  if (!v14) {
    goto LABEL_16;
  }
  CFIndex Count = CFArrayGetCount(v14);
  if (Count < 1) {
    goto LABEL_22;
  }
  CFIndex v16 = Count;
  unint64_t v31 = v9;
  CFIndex v17 = 0LL;
  char v18 = 0;
  do
  {
    ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 72), v17);
    unint64_t valuePtr = 0xAAAAAAAAAAAAAAAALL;
    CFNumberGetValue(ValueAtIndex, kCFNumberLongLongType, &valuePtr);
    v18 |= (v12 | (IntegerValue << 16)) == valuePtr;
    ++v17;
  }

  while (v16 != v17);
  unint64_t v9 = v31;
  if ((v18 & 1) == 0)
  {
LABEL_22:
    v22 = (os_log_s *)_IOHIDLogCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      sub_1890B621C();
    }
  }

  else
  {
LABEL_16:
    if ((IOHIDEventGetPhase() & 4) != 0)
    {
      v21 = (os_log_s *)_IOHIDLogCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        sub_1890B61F0();
      }
    }

    else
    {
      if (IOHIDEventGetIntegerValue())
      {
        v20 = (os_log_s *)_IOHIDLogCategory();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
          sub_1890B61C4();
        }
        return a2;
      }

      uint64_t v23 = *(void *)(a1 + 136);
      if (v23)
      {
        while (*(_DWORD *)(v23 + 44) != v5 || *(_DWORD *)(v23 + 52) != v12 || *(_DWORD *)(v23 + 48) != IntegerValue)
        {
          uint64_t v23 = *(void *)(v23 + 16);
          if (!v23) {
            goto LABEL_29;
          }
        }

LABEL_36:
        int v26 = IOHIDEventGetType();
        if (v26 == 29)
        {
          IOHIDEventGetFloatValue();
          BOOL v27 = v28 == 1.0;
        }

        else
        {
          if (v26 != 3)
          {
            int v29 = 0;
LABEL_44:
            Event::stateHandler(v23, v29 ^ 1, a2);
            return a2;
          }

          BOOL v27 = IOHIDEventGetIntegerValue() == 1;
        }

        int v29 = v27;
        goto LABEL_44;
      }

LABEL_29:
      uint64_t v23 = *v32;
      if (*v32)
      {
        uint64_t *v32 = *(void *)(v23 + 16);
        if (v5 == 3) {
          unint64_t v24 = *(void *)(a1 + 128);
        }
        else {
          unint64_t v24 = 0LL;
        }
        Event::init( (Event *)v23,  (IOHIDEventProcessor *)a1,  *(Timer **)(a1 + 160),  v5,  IntegerValue,  v12,  v10,  v9,  v24,  *(_BYTE *)(a1 + 120));
        *(void *)(v23 + 16) = *(void *)(a1 + 136);
        *(void *)(a1 + 136) = v23;
        goto LABEL_36;
      }

      v25 = (os_log_s *)_IOHIDLogCategory();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        sub_1890B618C();
      }
    }
  }

  return a2;
}

BOOL Event::conformsTo(Event *this, int a2, int a3, int a4)
{
  return *((_DWORD *)this + 11) == a2 && *((_DWORD *)this + 13) == a4 && *((_DWORD *)this + 12) == a3;
}

void Event::init( Event *this, IOHIDEventProcessor *a2, Timer *a3, int a4, int a5, int a6, unint64_t a7, unint64_t a8, unint64_t a9, BOOL a10)
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  *((_DWORD *)this + 11) = a4;
  *((_DWORD *)this + 12) = a5;
  *((_DWORD *)this + 13) = a6;
  *((void *)this + 10) = a7;
  *((void *)this + 11) = a8;
  *((void *)this + 12) = 0LL;
  *((void *)this + 13) = a9;
  *((_BYTE *)this + 40) = 0;
  *((void *)this + 3) = 0LL;
  *((void *)this + 4) = a2;
  *((void *)this + 1) = 0LL;
  *((void *)this + 2) = 0LL;
  *((void *)this + 7) = a3;
  *((void *)this + 8) = 0LL;
  *(void *)((char *)this + 70) = 0LL;
  *((_BYTE *)this + 78) = a10;
  if (a9)
  {
    if (a9 == a7)
    {
      a7 = a9 + 1;
      *((void *)this + 10) = a9 + 1;
    }

    if (a9 == a8)
    {
      a8 = a9 + 1;
      *((void *)this + 11) = a9 + 1;
    }
  }

  if (a7 > a9 || a8 > a9)
  {
    v11 = (os_log_s *)_IOHIDLogCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v12 = *((void *)this + 13);
      uint64_t v13 = *((void *)this + 10);
      uint64_t v14 = *((void *)this + 11);
      int v15 = 134218496;
      uint64_t v16 = v12;
      __int16 v17 = 2048;
      uint64_t v18 = v13;
      __int16 v19 = 2048;
      uint64_t v20 = v14;
      _os_log_debug_impl( &dword_1890B2000,  v11,  OS_LOG_TYPE_DEBUG,  "long %llu second %llu third %llu\n\n",  (uint8_t *)&v15,  0x20u);
    }
  }

BOOL Event::stateHandler(uint64_t a1, int a2, uint64_t a3)
{
  unint64_t v6 = (void (*)(uint64_t, uint64_t))*(&_stateMap[3 * *(unsigned int *)(a1 + 64)] + a2);
  CFUUIDRef v7 = (os_log_s *)_IOHIDLogCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    sub_1890B633C();
    if (v6)
    {
LABEL_3:
      v6(a1, a3);
      CFUUIDRef v8 = (os_log_s *)_IOHIDLogCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        sub_1890B6248();
      }
      return v6 != 0LL;
    }
  }

  else if (v6)
  {
    goto LABEL_3;
  }

  unint64_t v9 = (os_log_s *)_IOHIDLogCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_1890B62B8((int *)(a1 + 64), a2, v9);
  }
  return v6 != 0LL;
}

void IOHIDEventProcessor::scheduleWithDispatchQueue(IOHIDEventProcessor *this, dispatch_queue_s *a2)
{
  *((void *)this + 3) = a2;
  Timer::init(*((Timer **)this + 20), a2);
}

void Timer::init(Timer *this, dispatch_queue_t queue)
{
  *((void *)this + 1) = queue;
  if (!*(void *)this)
  {
    v3 = dispatch_source_create(MEMORY[0x1895F8B78], 0LL, 1uLL, queue);
    uint64_t v4 = MEMORY[0x1895F87A8];
    handler[0] = MEMORY[0x1895F87A8];
    handler[1] = 0x40000000LL;
    handler[2] = sub_1890B5834;
    handler[3] = &unk_18A3438E0;
    handler[4] = this;
    dispatch_source_set_event_handler(v3, handler);
    v5[0] = v4;
    v5[1] = 0x40000000LL;
    v5[2] = sub_1890B5888;
    v5[3] = &unk_18A343900;
    v5[4] = v3;
    dispatch_source_set_cancel_handler(v3, v5);
    dispatch_source_set_timer(v3, 0xFFFFFFFFFFFFFFFFLL, 0LL, 0LL);
    *(void *)this = v3;
    dispatch_resume(v3);
  }

void IOHIDEventProcessor::unscheduleFromDispatchQueue(IOHIDEventProcessor *this, dispatch_queue_s *a2)
{
  if (*((dispatch_queue_s **)this + 3) == a2)
  {
    uint64_t v3 = *((void *)this + 20);
    if (*(void *)v3) {
      dispatch_source_cancel(*(dispatch_source_t *)v3);
    }
    *(void *)(v3 + 8) = 0LL;
    *((void *)this + 3) = 0LL;
  }

void Timer::cancel(dispatch_source_s **this, dispatch_queue_s *a2)
{
  uint64_t v3 = *this;
  if (v3) {
    dispatch_source_cancel(v3);
  }
  this[1] = 0LL;
}

void IOHIDEventProcessor::open(IOHIDEventProcessor *a1)
{
  for (uint64_t i = 0LL; i != 9; ++i)
  {
    uint64_t v3 = off_18A343798[i];
    uint64_t v4 = (const void *)IOHIDServiceCopyProperty();
    if (v4)
    {
      unint64_t v6 = v4;
      IOHIDEventProcessor::setPropertyForClient(a1, v3, v4, v5);
      CFRelease(v6);
    }
  }

void IOHIDEventProcessor::dispatchEvent(uint64_t a1, CFTypeRef cf, int a3)
{
  if (*(void *)(a1 + 24))
  {
    if (a3)
    {
      CFRetain(cf);
      int v5 = *(dispatch_queue_s **)(a1 + 24);
      v7[0] = MEMORY[0x1895F87A8];
      v7[1] = 0x40000000LL;
      v7[2] = sub_1890B44F4;
      v7[3] = &unk_18A3437E0;
      v7[4] = a1;
      v7[5] = cf;
      dispatch_async(v5, v7);
    }

    else
    {
      unint64_t v6 = (os_log_s *)_IOHIDLogCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        sub_1890B63C4();
      }
      (*(void (**)(void, void, void, CFTypeRef, void))(a1 + 40))( *(void *)(a1 + 48),  *(void *)(a1 + 56),  *(void *)(a1 + 32),  cf,  0LL);
    }
  }

void sub_1890B44F4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = (os_log_s *)_IOHIDLogCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_1890B6424();
  }
  (*(void (**)(void, void, void, void, void))(v2 + 40))( *(void *)(v2 + 48),  *(void *)(v2 + 56),  *(void *)(v2 + 32),  *(void *)(a1 + 40),  0LL);
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

void IOHIDEventProcessor::returnToFreePool(IOHIDEventProcessor *this, Event *a2)
{
  uint64_t v4 = *((void *)this + 17);
  int v5 = (os_log_s *)_IOHIDLogCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_1890B6488();
  }
  int v6 = *((_DWORD *)a2 + 11);
  CFUUIDRef v7 = (void *)((char *)this + 144);
  CFUUIDRef v8 = (char *)this + 152;
  if (v6 != 29) {
    CFUUIDRef v8 = 0LL;
  }
  if (v6 != 3) {
    CFUUIDRef v7 = v8;
  }
  if (v4)
  {
    uint64_t v9 = 0LL;
    while (1)
    {
      uint64_t v10 = v9;
      uint64_t v9 = v4;
      if (*((_DWORD *)a2 + 12) == *(_DWORD *)(v4 + 48)
        && *((_DWORD *)a2 + 13) == *(_DWORD *)(v4 + 52)
        && v6 == *(_DWORD *)(v4 + 44))
      {
        break;
      }

      uint64_t v4 = *(void *)(v4 + 16);
      if (!v4) {
        goto LABEL_13;
      }
    }

    if (v10) {
      *(void *)(v10 + 16) = *((void *)a2 + 2);
    }
    else {
      *((void *)this + 17) = *(void *)(*((void *)this + 17) + 16LL);
    }
  }

LABEL_13:
  if (v7)
  {
    *((void *)a2 + 2) = *v7;
    void *v7 = a2;
  }

void *sub_1890B4644(uint64_t a1, const void *a2, char a3)
{
  if (a2 && value) {
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 8), a2, value);
  }
  return sub_1890B5BE0(&v6);
}

void sub_1890B469C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void *sub_1890B46B0(uint64_t a1, const void *a2, uint64_t a3)
{
  if (a2 && value) {
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 8), a2, value);
  }
  return sub_1890B5BE0(&v6);
}

void sub_1890B4708( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void Event::Event(Event *this)
{
  *(void *)this = off_18A343810;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *((_BYTE *)this + 40) = 1;
  *(_OWORD *)((char *)this + 44) = 0u;
  *(_OWORD *)((char *)this + 60) = 0u;
  *(_DWORD *)((char *)this + 75) = 0;
  *((_OWORD *)this + 5) = 0u;
  *((_OWORD *)this + 6) = 0u;
}

void Event::dispatchEvent(uint64_t a1, const void *a2, int a3)
{
}

void Event::completed(Event *this)
{
  *((_BYTE *)this + 40) = 1;
  IOHIDEventProcessor::returnToFreePool(*((IOHIDEventProcessor **)this + 4), this);
}

uint64_t sub_1890B4778(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 40LL))(a1);
}

uint64_t sub_1890B4784(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 48LL))(a1);
}

uint64_t sub_1890B4790(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 88LL))(a1);
}

uint64_t sub_1890B479C(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 56LL))(a1);
}

uint64_t sub_1890B47A8(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 64LL))(a1);
}

uint64_t sub_1890B47B4(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 72LL))(a1);
}

uint64_t sub_1890B47C0(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 80LL))(a1);
}

uint64_t sub_1890B47CC(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 32LL))(a1);
}

void Timer::checkEventTimeouts(Timer *this)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  uint64_t v2 = *((void *)this + 2);
  uint64_t v3 = mach_absolute_time();
  if (v2)
  {
    uint64_t v4 = v3;
    do
    {
      uint64_t v5 = v2;
      uint64_t v2 = *(void *)(v2 + 24);
      if (*(void *)(v5 + 8) && !*(_BYTE *)(v5 + 40))
      {
        if (*(void *)(v5 + 8) < (v4 - *(void *)(v5 + 96))
                                 * dword_18C4FE9F8
                                 / dword_18C4FE9FC
                                 / 0x3E8)
        {
          uint64_t v6 = (os_log_s *)_IOHIDLogCategory();
          if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v7 = *(void *)(v5 + 8);
            unint64_t v8 = (v4 - *(void *)(v5 + 96)) * dword_18C4FE9F8 / dword_18C4FE9FC / 0x3E8;
            *(_DWORD *)buf = 134218240;
            uint64_t v10 = v5;
            __int16 v11 = 2048;
            uint64_t v12 = v8 - v7;
            _os_log_debug_impl(&dword_1890B2000, v6, OS_LOG_TYPE_DEBUG, "%p past deadline %lld us\n", buf, 0x16u);
          }

          Timer::removeEvent((uint64_t)this, (Event *)v5);
          Event::stateHandler(v5, 2, 0LL);
        }
      }

      else
      {
        Timer::removeEvent((uint64_t)this, (Event *)v5);
      }
    }

    while (v2);
  }

  Timer::updateTimeout(this);
}

uint64_t ButtonEvent::setMultiEventCount(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  uint64_t v6 = (os_log_s *)_IOHIDLogCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 134218496;
    uint64_t v9 = a1;
    __int16 v10 = 2048;
    uint64_t v11 = a2;
    __int16 v12 = 1024;
    int v13 = a3;
    _os_log_debug_impl( &dword_1890B2000,  v6,  OS_LOG_TYPE_DEBUG,  "%p %p setting multi count = %d\n",  (uint8_t *)&v8,  0x1Cu);
  }

  uint64_t result = IOHIDEventSetIntegerValue();
  if (!a3) {
    LODWORD(a3) = *(_DWORD *)(a1 + 72);
  }
  *(_DWORD *)(a1 + 72) = a3;
  return result;
}

uint64_t ButtonEvent::createSyntheticEvent(ButtonEvent *this, int a2)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  mach_absolute_time();
  uint64_t KeyboardEvent = IOHIDEventCreateKeyboardEvent();
  if (KeyboardEvent) {
    BOOL v5 = a2 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    (*(void (**)(ButtonEvent *, uint64_t, void))(*(void *)this + 24LL))( this,  KeyboardEvent,  *((int *)this + 18));
    IOHIDEventGetPhase();
    IOHIDEventSetPhase();
    if (*((_BYTE *)this + 78)) {
      IOHIDEventSetIntegerValue();
    }
    *((_BYTE *)this + 76) = 1;
  }

  uint64_t v6 = (os_log_s *)_IOHIDLogCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v8 = *((_DWORD *)this + 11);
    v9[0] = 67109632;
    v9[1] = a2;
    __int16 v10 = 2048;
    uint64_t v11 = KeyboardEvent;
    __int16 v12 = 1024;
    int v13 = v8;
    _os_log_debug_impl( &dword_1890B2000,  v6,  OS_LOG_TYPE_DEBUG,  "created terminal(%d) event %p type %d\n",  (uint8_t *)v9,  0x18u);
  }

  return KeyboardEvent;
}

void ButtonEvent::NoneEnter(Timer **a1, uint64_t a2)
{
  if (a2)
  {
    Timer::registerEventTimeout(a1[7], (Event *)a1, 0LL);
    (*((void (**)(Timer **, uint64_t, void))*a1 + 3))(a1, a2, *((int *)a1 + 18));
  }

  *((_BYTE *)a1 + 40) = 1;
  IOHIDEventProcessor::returnToFreePool(a1[4], (Event *)a1);
  *((_DWORD *)a1 + 16) = 0;
}

void Timer::registerEventTimeout(Timer *this, Event *a2, uint64_t a3)
{
  uint64_t v6 = (os_log_s *)_IOHIDLogCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_1890B64E8();
  }
  *((void *)a2 + 1) = a3;
  Timer::removeEvent((uint64_t)this, a2);
  if (a3)
  {
    *((void *)a2 + 3) = *((void *)this + 2);
    *((void *)this + 2) = a2;
  }

  Timer::updateTimeout(this);
}

void ButtonEvent::FDEnter(Event *a1, uint64_t a2)
{
  *((void *)a1 + 12) = IOHIDEventGetTimeStamp();
  IOHIDEventGetPhase();
  IOHIDEventSetPhase();
  (*(void (**)(Event *, uint64_t, uint64_t))(*(void *)a1 + 24LL))(a1, a2, 1LL);
  *((_BYTE *)a1 + 77) = 0;
  *((_DWORD *)a1 + 16) = 1;
  unint64_t v4 = *((void *)a1 + 10);
  if (!v4)
  {
    (*(void (**)(Event *, uint64_t))(*(void *)a1 + 96LL))(a1, a2);
    unint64_t v4 = *((void *)a1 + 10);
  }

  uint64_t v5 = *((void *)a1 + 13);
  if (v5 - 1 >= v4) {
    int v6 = 7;
  }
  else {
    int v6 = 8;
  }
  if (v5 - 1 >= v4) {
    uint64_t v7 = v4;
  }
  else {
    uint64_t v7 = *((void *)a1 + 13);
  }
  *((_DWORD *)a1 + 17) = v6;
  Timer::registerEventTimeout(*((Timer **)a1 + 7), a1, v7);
}

uint64_t ButtonEvent::FUEnter(_DWORD *a1, uint64_t a2)
{
  uint64_t result = (*(uint64_t (**)(_DWORD *, uint64_t, uint64_t))(*(void *)a1 + 24LL))(a1, a2, 1LL);
  a1[16] = 2;
  return result;
}

void ButtonEvent::SDEnter(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 96) = IOHIDEventGetTimeStamp();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)a1 + 24LL))(a1, a2, 2LL);
  *(_DWORD *)(a1 + 64) = 3;
  *(_BYTE *)(a1 + 77) = 0;
  unint64_t v4 = *(void *)(a1 + 88);
  if (v4)
  {
    unint64_t v5 = *(void *)(a1 + 104);
    if (v5 - 1 >= v4)
    {
      *(_DWORD *)(a1 + 68) = 7;
      int v6 = *(Timer **)(a1 + 56);
      uint64_t v7 = (Event *)a1;
    }

    else
    {
      *(_DWORD *)(a1 + 68) = 8;
      int v6 = *(Timer **)(a1 + 56);
      uint64_t v7 = (Event *)a1;
      unint64_t v4 = v5;
    }

    Timer::registerEventTimeout(v6, v7, v4);
  }

  else
  {
    (*(void (**)(uint64_t, uint64_t))(*(void *)a1 + 96LL))(a1, a2);
  }

uint64_t ButtonEvent::SUEnter(_DWORD *a1, uint64_t a2)
{
  uint64_t result = (*(uint64_t (**)(_DWORD *, uint64_t, uint64_t))(*(void *)a1 + 24LL))(a1, a2, 2LL);
  a1[16] = 4;
  return result;
}

uint64_t ButtonEvent::TDEnter(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 96) = IOHIDEventGetTimeStamp();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)a1 + 24LL))(a1, a2, 3LL);
  *(_DWORD *)(a1 + 64) = 5;
  *(_BYTE *)(a1 + 77) = 0;
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 96LL))(a1, a2);
}

uint64_t ButtonEvent::TUEnter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 32LL))(a1, a2);
}

uint64_t ButtonEvent::TOEnter(uint64_t result)
{
  int v1 = *(_DWORD *)(result + 68);
  if (v1 == 7)
  {
    uint64_t v2 = 12LL;
  }

  else
  {
    if (v1 != 8) {
      return result;
    }
    uint64_t v2 = 13LL;
  }

  return (*(uint64_t (**)(void))(*(void *)result + 8 * v2))();
}

void ButtonEvent::TEEnter(_DWORD *a1, uint64_t a2)
{
  unsigned int v4 = a1[16];
  if (v4 > 8 || ((1 << v4) & 0x12A) == 0)
  {
    int v8 = 0;
    unint64_t v6 = 0LL;
    goto LABEL_18;
  }

  unint64_t v6 = *((void *)a1 + 13);
  if (v6)
  {
    if (v4 != 5)
    {
      if (v4 == 3)
      {
        unint64_t v7 = *((void *)a1 + 11);
LABEL_12:
        BOOL v9 = v6 >= v7;
        unint64_t v10 = v6 - v7;
        if (v9) {
          unint64_t v6 = v10;
        }
        else {
          unint64_t v6 = 0LL;
        }
        goto LABEL_16;
      }

      if (v4 == 1)
      {
        unint64_t v7 = *((void *)a1 + 10);
        goto LABEL_12;
      }

      unint64_t v6 = 0LL;
    }

LABEL_16:
    a1[17] = 8;
  }

  int v8 = 1;
LABEL_18:
  uint64_t v11 = (const void *)(*(uint64_t (**)(_DWORD *, uint64_t))(*(void *)a1 + 16LL))(a1, 1LL);
  IOHIDEventProcessor::dispatchEvent(*((void *)a1 + 4), v11, a2 != 0);
  *((void *)a1 + 12) = IOHIDEventGetTimeStamp();
  CFRelease(v11);
  Timer::registerEventTimeout(*((Timer **)a1 + 7), (Event *)a1, v6);
  if (v8) {
    a1[16] = 7;
  }
  else {
    (*(void (**)(_DWORD *, void))(*(void *)a1 + 32LL))(a1, 0LL);
  }
}

void ButtonEvent::LPEnter(uint64_t a1, uint64_t a2)
{
  unsigned int v3 = *(_DWORD *)(a1 + 64);
  switch(v3)
  {
    case 2u:
      unint64_t v5 = (unint64_t *)(a1 + 80);
      goto LABEL_7;
    case 4u:
      unint64_t v5 = (unint64_t *)(a1 + 88);
LABEL_7:
      unint64_t v6 = *v5;
      unint64_t v7 = *(void *)(a1 + 104);
      BOOL v8 = v6 >= v7;
      uint64_t v9 = v6 - v7;
      if (v8) {
        uint64_t v4 = v9;
      }
      else {
        uint64_t v4 = 0LL;
      }
      goto LABEL_10;
    case 6u:
      uint64_t v4 = 0LL;
LABEL_10:
      *(_DWORD *)(a1 + 68) = 7;
      *(void *)(a1 + 96) = mach_absolute_time();
      Timer::registerEventTimeout(*(Timer **)(a1 + 56), (Event *)a1, v4);
      return;
  }

  uint64_t v11 = (const void *)(*(uint64_t (**)(uint64_t, void))(*(void *)a1 + 16LL))(a1, 0LL);
  IOHIDEventSetIntegerValue();
  IOHIDEventSetIntegerValue();
  (*(void (**)(uint64_t, const void *, void))(*(void *)a1 + 24LL))(a1, v11, *(int *)(a1 + 72));
  IOHIDEventProcessor::dispatchEvent(*(void *)(a1 + 32), v11, a2 != 0);
  *(_BYTE *)(a1 + 77) = 1;
  if (!*(_BYTE *)(a1 + 78))
  {
    if (((v3 < 6) & v3) != 0)
    {
      *(_DWORD *)(a1 + 64) = 8;
      (*(void (**)(uint64_t, const void *))(*(void *)a1 + 96LL))(a1, v11);
    }

    goto LABEL_21;
  }

  int v12 = *(_DWORD *)(a1 + 64);
  if (v12 == 3)
  {
    unint64_t v13 = *(void *)(a1 + 88);
  }

  else
  {
    if (v12 != 1)
    {
LABEL_19:
      *(_DWORD *)(a1 + 64) = 8;
      (*(void (**)(uint64_t, const void *))(*(void *)a1 + 96LL))(a1, v11);
      uint64_t v15 = 0LL;
      goto LABEL_20;
    }

    unint64_t v13 = *(void *)(a1 + 80);
  }

  unint64_t v14 = *(void *)(a1 + 104);
  uint64_t v15 = v13 - v14;
  if (v13 <= v14) {
    goto LABEL_19;
  }
LABEL_20:
  *(_DWORD *)(a1 + 68) = 7;
  *(void *)(a1 + 96) = mach_absolute_time();
  Timer::registerEventTimeout(*(Timer **)(a1 + 56), (Event *)a1, v15);
LABEL_21:
  CFRelease(v11);
}

uint64_t TapEvent::setMultiEventCount(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  unint64_t v6 = (os_log_s *)_IOHIDLogCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 134218496;
    uint64_t v9 = a1;
    __int16 v10 = 2048;
    uint64_t v11 = a2;
    __int16 v12 = 1024;
    int v13 = a3;
    _os_log_debug_impl( &dword_1890B2000,  v6,  OS_LOG_TYPE_DEBUG,  "%p %p setting multi count = %d\n",  (uint8_t *)&v8,  0x1Cu);
  }

  uint64_t result = IOHIDEventSetIntegerValue();
  if (!a3) {
    LODWORD(a3) = *(_DWORD *)(a1 + 72);
  }
  *(_DWORD *)(a1 + 72) = a3;
  return result;
}

uint64_t TapEvent::createSyntheticEvent(TapEvent *this, int a2)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  mach_absolute_time();
  uint64_t BiometricEvent = IOHIDEventCreateBiometricEvent();
  if (BiometricEvent)
  {
    IOHIDEventSetIntegerValue();
    IOHIDEventSetIntegerValue();
    if (a2)
    {
      (*(void (**)(TapEvent *, uint64_t, void))(*(void *)this + 24LL))( this,  BiometricEvent,  *((int *)this + 18));
      IOHIDEventGetPhase();
      IOHIDEventSetPhase();
      if (*((_BYTE *)this + 78)) {
        IOHIDEventSetIntegerValue();
      }
      *((_BYTE *)this + 76) = 1;
    }
  }

  unint64_t v5 = (os_log_s *)_IOHIDLogCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v7 = *((_DWORD *)this + 11);
    v8[0] = 67109632;
    v8[1] = a2;
    __int16 v9 = 2048;
    uint64_t v10 = BiometricEvent;
    __int16 v11 = 1024;
    int v12 = v7;
    _os_log_debug_impl( &dword_1890B2000,  v5,  OS_LOG_TYPE_DEBUG,  "created terminal(%d) event %p type %d\n",  (uint8_t *)v8,  0x18u);
  }

  return BiometricEvent;
}

void TapEvent::NoneEnter(Timer **a1, uint64_t a2)
{
  if (a2)
  {
    Timer::registerEventTimeout(a1[7], (Event *)a1, 0LL);
    (*((void (**)(Timer **, uint64_t, void))*a1 + 3))(a1, a2, *((int *)a1 + 18));
  }

  *((_BYTE *)a1 + 40) = 1;
  IOHIDEventProcessor::returnToFreePool(a1[4], (Event *)a1);
  *((_DWORD *)a1 + 16) = 0;
}

uint64_t TapEvent::FDEnter(_DWORD *a1, uint64_t a2)
{
  uint64_t result = (*(uint64_t (**)(_DWORD *, uint64_t, void))(*(void *)a1 + 24LL))(a1, a2, 0LL);
  a1[16] = 1;
  return result;
}

void TapEvent::FUEnter(Event *a1, uint64_t a2)
{
  *((void *)a1 + 12) = IOHIDEventGetTimeStamp();
  IOHIDEventGetPhase();
  IOHIDEventSetPhase();
  (*(void (**)(Event *, uint64_t, uint64_t))(*(void *)a1 + 24LL))(a1, a2, 1LL);
  *((_DWORD *)a1 + 16) = 2;
  uint64_t v4 = *((void *)a1 + 10);
  if (v4) {
    Timer::registerEventTimeout(*((Timer **)a1 + 7), a1, v4);
  }
  else {
    (*(void (**)(Event *, uint64_t))(*(void *)a1 + 96LL))(a1, a2);
  }
}

uint64_t TapEvent::SDEnter(_DWORD *a1, uint64_t a2)
{
  uint64_t result = (*(uint64_t (**)(_DWORD *, uint64_t, uint64_t))(*(void *)a1 + 24LL))(a1, a2, 1LL);
  a1[16] = 3;
  return result;
}

void TapEvent::SUEnter(Event *a1, uint64_t a2)
{
  *((void *)a1 + 12) = IOHIDEventGetTimeStamp();
  (*(void (**)(Event *, uint64_t, uint64_t))(*(void *)a1 + 24LL))(a1, a2, 2LL);
  *((_DWORD *)a1 + 16) = 4;
  uint64_t v4 = *((void *)a1 + 11);
  if (v4) {
    Timer::registerEventTimeout(*((Timer **)a1 + 7), a1, v4);
  }
  else {
    (*(void (**)(Event *, uint64_t))(*(void *)a1 + 96LL))(a1, a2);
  }
}

uint64_t TapEvent::TDEnter(_DWORD *a1, uint64_t a2)
{
  uint64_t result = (*(uint64_t (**)(_DWORD *, uint64_t, uint64_t))(*(void *)a1 + 24LL))(a1, a2, 2LL);
  a1[16] = 5;
  return result;
}

uint64_t TapEvent::TUEnter(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 96) = IOHIDEventGetTimeStamp();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)a1 + 24LL))(a1, a2, 3LL);
  *(_DWORD *)(a1 + 64) = 6;
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 96LL))(a1, a2);
}

uint64_t TapEvent::TOEnter(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 96LL))(a1);
}

void TapEvent::TEEnter(uint64_t a1, uint64_t a2)
{
  unsigned int v4 = *(_DWORD *)(a1 + 64);
  BOOL v5 = v4 > 5;
  int v6 = (1 << v4) & 0x2A;
  if (v5 || v6 == 0)
  {
    __int16 v9 = (const void *)(*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 16LL))(a1, 1LL);
    IOHIDEventProcessor::dispatchEvent(*(void *)(a1 + 32), v9, a2 != 0);
    CFRelease(v9);
    Timer::registerEventTimeout(*(Timer **)(a1 + 56), (Event *)a1, 0LL);
    (*(void (**)(uint64_t, void))(*(void *)a1 + 32LL))(a1, 0LL);
  }

  else
  {
    int v8 = (const void *)(*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 16LL))(a1, 1LL);
    IOHIDEventProcessor::dispatchEvent(*(void *)(a1 + 32), v8, a2 != 0);
    CFRelease(v8);
    Timer::registerEventTimeout(*(Timer **)(a1 + 56), (Event *)a1, 0LL);
    *(_DWORD *)(a1 + 64) = 1;
  }

uint64_t TapEvent::LPEnter(uint64_t result)
{
  *(_DWORD *)(result + 64) = 8;
  return result;
}

void sub_1890B5834(uint64_t a1)
{
}

void Timer::timeoutHandler(Timer *this)
{
  uint64_t v2 = (os_log_s *)_IOHIDLogCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_1890B6554();
  }
  Timer::checkEventTimeouts(this);
}

void sub_1890B5888(uint64_t a1)
{
}

uint64_t Timer::removeEvent(uint64_t this, Event *a2)
{
  uint64_t v2 = *(void *)(this + 16);
  if (v2)
  {
    uint64_t v3 = 0LL;
    uint64_t v4 = *(void *)(this + 16);
    while (*((_DWORD *)a2 + 12) != *(_DWORD *)(v4 + 48)
         || *((_DWORD *)a2 + 13) != *(_DWORD *)(v4 + 52)
         || *((_DWORD *)a2 + 11) != *(_DWORD *)(v4 + 44))
    {
      uint64_t v3 = v4;
      uint64_t v4 = *(void *)(v4 + 24);
      if (!v4) {
        goto LABEL_7;
      }
    }

    if (v3) {
      *(void *)(v3 + 24) = *((void *)a2 + 3);
    }
    else {
      *(void *)(this + 16) = *(void *)(v2 + 24);
    }
  }

LABEL_7:
  *((void *)a2 + 3) = 0LL;
  return this;
}

uint64_t Timer::insertEvent(Timer *this, Event *a2)
{
  uint64_t result = Timer::removeEvent((uint64_t)this, a2);
  *((void *)a2 + 3) = *((void *)this + 2);
  *((void *)this + 2) = a2;
  return result;
}

void Timer::updateTimeout(Timer *this)
{
  uint64_t v2 = mach_absolute_time();
  uint64_t v3 = (void *)*((void *)this + 2);
  if (v3)
  {
    int64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      uint64_t v3 = (void *)v3[3];
    }

    while (v3);
  }

  else
  {
    int64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  }

  uint64_t v5 = v4 & ~(v4 >> 63);
  int v6 = *(dispatch_source_s **)this;
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    int v7 = v6;
    dispatch_time_t v8 = -1LL;
    uint64_t v9 = 0LL;
  }

  else
  {
    dispatch_time_t v8 = dispatch_time(0LL, 1000 * v5);
    int v7 = v6;
    uint64_t v9 = -1LL;
  }

  dispatch_source_set_timer(v7, v8, v9, 0LL);
}

void *sub_1890B5A08(void *a1, int a2)
{
  *a1 = &unk_18A343A70;
  a1[1] = CFDictionaryCreateMutable(0LL, a2, MEMORY[0x189605240], MEMORY[0x189605250]);
  return a1;
}

void sub_1890B5A58(_Unwind_Exception *a1)
{
}

void sub_1890B5A6C(void *a1)
{
  int v1 = sub_1890B5AB0(a1);
  operator delete(v1);
}

void sub_1890B5A84(void *a1)
{
  int v1 = sub_1890B5AB0(a1);
  operator delete(v1);
}

void sub_1890B5A9C(void *a1)
{
  int v1 = sub_1890B5AB0(a1);
  operator delete(v1);
}

void *sub_1890B5AB0(void *a1)
{
  uint64_t v2 = (const void *)a1[1];
  *a1 = &unk_18A343AF0;
  a1[1] = 0LL;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

void *sub_1890B5AF0(void *a1, CFTypeRef cf, char a3)
{
  if (cf)
  {
    CFTypeID v6 = CFGetTypeID(cf);
    if (v6 == CFDictionaryGetTypeID()) {
      CFTypeRef v7 = cf;
    }
    else {
      CFTypeRef v7 = 0LL;
    }
    *a1 = &unk_18A343AF0;
    a1[1] = v7;
    if (v7 && (a3 & 1) == 0) {
      CFRetain(v7);
    }
  }

  else
  {
    a1[1] = 0LL;
  }

  *a1 = &unk_18A343AD0;
  return a1;
}

void *sub_1890B5B74(void *a1, char a2)
{
  char valuePtr = a2;
  *a1 = &unk_18A343B10;
  a1[1] = 0LL;
  a1[1] = CFNumberCreate((CFAllocatorRef)*MEMORY[0x189604DB0], kCFNumberSInt8Type, &valuePtr);
  return a1;
}

void sub_1890B5BCC(_Unwind_Exception *a1)
{
}

void *sub_1890B5BE0(void *a1)
{
  uint64_t v2 = (const void *)a1[1];
  *a1 = &unk_18A343B58;
  a1[1] = 0LL;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

void sub_1890B5C20(void *a1)
{
  int v1 = sub_1890B5BE0(a1);
  operator delete(v1);
}

void sub_1890B5C38(void *a1)
{
  int v1 = sub_1890B5BE0(a1);
  operator delete(v1);
}

void *sub_1890B5C4C(void *a1, uint64_t a2)
{
  uint64_t valuePtr = a2;
  *a1 = &unk_18A343B10;
  a1[1] = 0LL;
  a1[1] = CFNumberCreate((CFAllocatorRef)*MEMORY[0x189604DB0], kCFNumberSInt64Type, &valuePtr);
  return a1;
}

void sub_1890B5CA4(_Unwind_Exception *a1)
{
}

void sub_1890B5CB8( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

void sub_1890B5CDC( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_1890B5CEC(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

void sub_1890B5D00(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

  ;
}

  ;
}

  ;
}

void sub_1890B5D2C()
{
}

void sub_1890B5D8C()
{
}

void sub_1890B5DEC()
{
}

void sub_1890B5E68()
{
}

void sub_1890B5EE4()
{
}

void sub_1890B5F44()
{
}

void sub_1890B5FA4()
{
}

void sub_1890B6004()
{
}

void sub_1890B6064()
{
}

void sub_1890B60E0(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  uint64_t RegistryID = IOHIDServiceGetRegistryID();
  int v6 = *(_DWORD *)(a1 + 20);
  int v7 = 134218498;
  uint64_t v8 = a1;
  __int16 v9 = 2112;
  uint64_t v10 = RegistryID;
  __int16 v11 = 1024;
  int v12 = v6;
  _os_log_debug_impl( &dword_1890B2000,  a3,  OS_LOG_TYPE_DEBUG,  "(%p) for ServiceID %@ with score %d\n",  (uint8_t *)&v7,  0x1Cu);
}

void sub_1890B618C()
{
}

void sub_1890B61C4()
{
}

void sub_1890B61F0()
{
}

void sub_1890B621C()
{
}

void sub_1890B6248()
{
  sub_1890B5CB8(&dword_1890B2000, v0, v1, "new state = %s\n", v2, v3, v4, v5, v6);
  sub_1890B5CC8();
}

void sub_1890B62B8(int *a1, int a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  int v3 = *a1;
  v4[0] = 67109376;
  v4[1] = v3;
  __int16 v5 = 1024;
  int v6 = a2;
  _os_log_debug_impl( &dword_1890B2000,  log,  OS_LOG_TYPE_DEBUG,  "Invalid state transition: [%d][%d]\n",  (uint8_t *)v4,  0xEu);
  sub_1890B5CC8();
}

void sub_1890B633C()
{
  WORD2(v4) = 2080;
  HIWORD(v4) = v0;
  sub_1890B5CEC(&dword_1890B2000, v1, v2, "state = %s transition = %s\n", v3, v4);
  sub_1890B5CC8();
}

void sub_1890B63C4()
{
  sub_1890B5CB8(&dword_1890B2000, v0, v1, "synchronously dispatching event = %p\n", v2, v3, v4, v5, v6);
  sub_1890B5CC8();
}

void sub_1890B6424()
{
  sub_1890B5CB8(&dword_1890B2000, v0, v1, "asynchronously dispatching event = %p\n", v2, v3, v4, v5, v6);
  sub_1890B5CC8();
}

void sub_1890B6488()
{
  sub_1890B5CB8(&dword_1890B2000, v0, v1, "returning event %p to free pool\n", v2, v3, v4, v5, v6);
  sub_1890B5CC8();
}

void sub_1890B64E8()
{
  WORD2(v3) = 2048;
  HIWORD(v3) = v0;
  sub_1890B5CEC(&dword_1890B2000, v0, v1, "registering %p for timeout in %llu uS\n", v2, v3);
  sub_1890B5CC8();
}

void sub_1890B6554()
{
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return (void *)MEMORY[0x1896025D8](allocator, size, hint);
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

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x189602BF0]();
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

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1896030F0](cf);
}

CFComparisonResult CFStringCompare( CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1896033C0](theString1, theString2, compareOptions);
}

CFUUIDRef CFUUIDCreateFromUUIDBytes(CFAllocatorRef alloc, CFUUIDBytes bytes)
{
  return (CFUUIDRef)MEMORY[0x189603880](alloc, *(void *)&bytes.byte0, *(void *)&bytes.byte8);
}

CFUUIDRef CFUUIDGetConstantUUIDWithBytes( CFAllocatorRef alloc, UInt8 byte0, UInt8 byte1, UInt8 byte2, UInt8 byte3, UInt8 byte4, UInt8 byte5, UInt8 byte6, UInt8 byte7, UInt8 byte8, UInt8 byte9, UInt8 byte10, UInt8 byte11, UInt8 byte12, UInt8 byte13, UInt8 byte14, UInt8 byte15)
{
  return (CFUUIDRef)MEMORY[0x189603898](alloc, byte0, byte1, byte2, byte3, byte4, byte5, byte6);
}

uint64_t IOHIDEventCreateBiometricEvent()
{
  return MEMORY[0x189607F50]();
}

uint64_t IOHIDEventCreateKeyboardEvent()
{
  return MEMORY[0x189607F68]();
}

uint64_t IOHIDEventGetFloatValue()
{
  return MEMORY[0x189607FB0]();
}

uint64_t IOHIDEventGetIntegerValue()
{
  return MEMORY[0x189607FB8]();
}

uint64_t IOHIDEventGetPhase()
{
  return MEMORY[0x189607FC8]();
}

uint64_t IOHIDEventGetTimeStamp()
{
  return MEMORY[0x189607FD8]();
}

uint64_t IOHIDEventGetType()
{
  return MEMORY[0x189607FE0]();
}

uint64_t IOHIDEventSetIntegerValue()
{
  return MEMORY[0x189608010]();
}

uint64_t IOHIDEventSetPhase()
{
  return MEMORY[0x189608018]();
}

uint64_t IOHIDServiceCopyProperty()
{
  return MEMORY[0x1896081A8]();
}

uint64_t IOHIDServiceGetRegistryID()
{
  return MEMORY[0x1896081B8]();
}

uint64_t _IOHIDLogCategory()
{
  return MEMORY[0x189608638]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void std::terminate(void)
{
}

void operator delete(void *__p)
{
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_18A3436D0(__sz);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1896147B8](a1);
}

void _os_log_debug_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
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

void dispatch_source_set_timer( dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1895FAEE8](when, delta);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1895FBA98]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1895FBBF8](info);
}