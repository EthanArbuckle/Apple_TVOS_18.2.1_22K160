MTSessionFilter *MTSessionFilterFactory(const __CFAllocator *a1, const void *a2)
{
  CFUUIDRef v4;
  MTSessionFilter *v5;
  CFUUIDRef v6;
  v4 = CFUUIDGetConstantUUIDWithBytes( kCFAllocatorSystemDefault,  0x7Fu,  0x1Au,  0x3Au,  0xE6u,  0x3Eu,  0x3Du,  0x47u,  0xAu,  0xBDu,  0x15u,  0xA2u,  0xDDu,  0x7Eu,  0x1Bu,  0xB7u,  0x19u);
  if (!CFEqual(a2, v4)) {
    return 0LL;
  }
  v5 = (MTSessionFilter *)CFAllocatorAllocate(a1, 64LL, 0LL);
  v6 = CFUUIDGetConstantUUIDWithBytes( kCFAllocatorSystemDefault,  0xCFu,  0xBBu,  0x2Du,  0xEBu,  0x98u,  0x13u,  0x40u,  0x6Du,  0xA8u,  0x8Fu,  0x61u,  0x7Du,  0x1Bu,  0x25u,  0xF7u,  0x7Du);
  MTSessionFilter::MTSessionFilter(v5, v6);
  return v5;
}

uint64_t MTSessionFilter::_addRef(MTSessionFilter *this, void *a2)
{
  uint64_t v2 = (*((_DWORD *)this + 4) + 1);
  *((_DWORD *)this + 4) = v2;
  return v2;
}

uint64_t MTSessionFilter::_filter(void *a1, uint64_t a2, uint64_t a3)
{
  if (a1[3])
  {
    v3 = (uint64_t *)a1[5];
    for (i = (uint64_t *)a1[6]; v3 != i; a3 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v6 + 48LL))( v6,  a2))
      uint64_t v6 = *v3++;
  }

  return a3;
}

uint64_t MTSessionFilter::_copyEvent()
{
  return 0LL;
}

void *MTSessionFilter::_registerService(void *result, uint64_t a2)
{
  if (result[3])
  {
    uint64_t v2 = (uint64_t *)result[5];
    for (i = (uint64_t *)result[6];
          v2 != i;
          result = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v5 + 16LL))(v5, a2))
    {
      uint64_t v5 = *v2++;
    }
  }

  return result;
}

void *MTSessionFilter::_unregisterService(void *result, uint64_t a2)
{
  if (result[3])
  {
    uint64_t v2 = (uint64_t *)result[5];
    for (i = (uint64_t *)result[6];
          v2 != i;
          result = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v5 + 24LL))(v5, a2))
    {
      uint64_t v5 = *v2++;
    }
  }

  return result;
}

void MTSessionFilter::MTSessionFilter(MTSessionFilter *this, CFTypeRef cf)
{
  *(void *)this = &MTSessionFilter::sMTSessionFilterFtbl;
  *((void *)this + 1) = CFRetain(cf);
  *((_DWORD *)this + 4) = 1;
  *((void *)this + 3) = 0LL;
  *((_DWORD *)this + 8) = 5;
  *((void *)this + 5) = 0LL;
  *((void *)this + 6) = 0LL;
  *((void *)this + 7) = 0LL;
  __MTSessionFilter = (uint64_t)this;
  CFPlugInAddInstanceForFactory((CFUUIDRef)cf);
}

void sub_47F4(_Unwind_Exception *exception_object)
{
  v4 = *v2;
  if (*v2)
  {
    *(void *)(v1 + 48) = v4;
    operator delete(v4);
  }

  _Unwind_Resume(exception_object);
}

void MTSessionFilter::~MTSessionFilter(CFUUIDRef *this)
{
  uint64_t v2 = this[5];
  if (v2)
  {
    this[6] = v2;
    operator delete(v2);
  }
}

void MTSessionFilter::close(uint64_t a1)
{
  if (*(void *)(a1 + 24))
  {
    *(void *)(a1 + 24) = 0LL;
    uint64_t v2 = *(void **)(a1 + 40);
    v3 = *(void **)(a1 + 48);
    if (v2 != v3)
    {
      do
      {
        if (*v2) {
          (*(void (**)(void))(*(void *)*v2 + 8LL))(*v2);
        }
        ++v2;
      }

      while (v2 != v3);
      uint64_t v2 = *(void **)(a1 + 40);
    }

    *(void *)(a1 + 48) = v2;
    syslog(*(_DWORD *)(a1 + 32), "MTSessionFilter: Session closed");
  }

void __clang_call_terminate(void *a1)
{
}

uint64_t MTSessionFilter::queryInterface(MTSessionFilter *this, CFUUIDBytes a2, void **a3)
{
  CFUUIDRef v5 = CFUUIDCreateFromUUIDBytes(0LL, a2);
  CFUUIDRef v6 = CFUUIDGetConstantUUIDWithBytes( kCFAllocatorSystemDefault,  0x19u,  0xD7u,  0x74u,  0x41u,  0xBBu,  0xC4u,  0x45u,  0x11u,  0x91u,  0x49u,  0x60u,  0x57u,  0x2Au,  0xBu,  1u,  0x5Cu);
  if (CFEqual(v5, v6)
    || (CFUUIDRef v7 = CFUUIDGetConstantUUIDWithBytes( kCFAllocatorSystemDefault,  0x3Du,  0xC3u,  0x5Au,  0xA6u,  0xD3u,  0x5Cu,  0x44u,  0x5Bu,  0x9Au,  0x59u,  0xCAu,  3u,  0xDAu,  0x40u,  0x8Bu,  0x97u),  CFEqual(v5, v7))
    || (CFUUIDRef v8 = CFUUIDGetConstantUUIDWithBytes( kCFAllocatorSystemDefault,  0,  0,  0,  0,  0,  0,  0,  0,  0xC0u,  0,  0,  0,  0,  0,  0,  0x46u),  CFEqual(v5, v8)))
  {
    uint64_t v9 = 0LL;
    ++*((_DWORD *)this + 4);
  }

  else
  {
    this = 0LL;
    uint64_t v9 = 2147483652LL;
  }

  *a3 = this;
  CFRelease(v5);
  return v9;
}

uint64_t MTSessionFilter::addRef(MTSessionFilter *this)
{
  uint64_t v1 = (*((_DWORD *)this + 4) + 1);
  *((_DWORD *)this + 4) = v1;
  return v1;
}

uint64_t MTSessionFilter::release(MTSessionFilter *this)
{
  int v1 = *((_DWORD *)this + 4);
  uint64_t v2 = (v1 - 1);
  *((_DWORD *)this + 4) = v2;
  if (v1 == 1)
  {
    MTSessionFilter::~MTSessionFilter((CFUUIDRef *)this);
    operator delete(v3);
  }

  return v2;
}

BOOL MTSessionFilter::open(uint64_t a1, uint64_t a2)
{
  BOOL result = 0LL;
  if (a2 && !*(void *)(a1 + 24))
  {
    syslog(*(_DWORD *)(a1 + 32), "MTSessionFilter: Session opened");
    *(void *)(a1 + 24) = a2;
    CFUUIDRef v5 = (MTRemoteFilterManager *)operator new(0x58uLL);
    MTRemoteFilterManager::MTRemoteFilterManager(v5);
    unint64_t v6 = *(void *)(a1 + 56);
    CFUUIDRef v7 = *(MTRemoteFilterManager ***)(a1 + 48);
    if ((unint64_t)v7 >= v6)
    {
      uint64_t v9 = *(void *)(a1 + 40);
      uint64_t v10 = ((uint64_t)v7 - v9) >> 3;
      uint64_t v11 = v6 - v9;
      uint64_t v12 = v11 >> 2;
      else {
        unint64_t v13 = v12;
      }
      if (v13) {
        v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<MTSessionFilterManager *>>(a1 + 56, v13);
      }
      else {
        v14 = 0LL;
      }
      v15 = (MTRemoteFilterManager **)&v14[8 * v10];
      v16 = &v14[8 * v13];
      *v15 = v5;
      CFUUIDRef v8 = v15 + 1;
      v18 = *(char **)(a1 + 40);
      v17 = *(char **)(a1 + 48);
      if (v17 != v18)
      {
        do
        {
          v19 = (MTRemoteFilterManager *)*((void *)v17 - 1);
          v17 -= 8;
          *--v15 = v19;
        }

        while (v17 != v18);
        v17 = *(char **)(a1 + 40);
      }

      *(void *)(a1 + 40) = v15;
      *(void *)(a1 + 48) = v8;
      *(void *)(a1 + 56) = v16;
      if (v17) {
        operator delete(v17);
      }
    }

    else
    {
      *CFUUIDRef v7 = v5;
      CFUUIDRef v8 = v7 + 1;
    }

    *(void *)(a1 + 48) = v8;
    return *(void *)(a1 + 40) != (void)v8;
  }

  return result;
}

void sub_4BA0(_Unwind_Exception *a1)
{
}

void *MTSessionFilter::registerService(void *result, uint64_t a2)
{
  if (result[3])
  {
    uint64_t v2 = (uint64_t *)result[5];
    for (i = (uint64_t *)result[6];
          v2 != i;
          BOOL result = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v5 + 16LL))(v5, a2))
    {
      uint64_t v5 = *v2++;
    }
  }

  return result;
}

void *MTSessionFilter::unregisterService(void *result, uint64_t a2)
{
  if (result[3])
  {
    uint64_t v2 = (uint64_t *)result[5];
    for (i = (uint64_t *)result[6];
          v2 != i;
          BOOL result = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v5 + 24LL))(v5, a2))
    {
      uint64_t v5 = *v2++;
    }
  }

  return result;
}

void MTSessionFilter::scheduleWithDispatchQueue(void *a1, void *a2)
{
  id v5 = a2;
  if (a1[3])
  {
    v4 = (void *)a1[5];
    v3 = (void *)a1[6];
    while (v4 != v3)
    {
      (*(void (**)(void, id))(*(void *)*v4 + 32LL))(*v4, v5);
      ++v4;
    }
  }
}

void sub_4CC4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void MTSessionFilter::unscheduleFromDispatchQueue(void *a1, void *a2)
{
  id v5 = a2;
  if (a1[3])
  {
    v4 = (void *)a1[5];
    v3 = (void *)a1[6];
    while (v4 != v3)
    {
      (*(void (**)(void, id))(*(void *)*v4 + 40LL))(*v4, v5);
      ++v4;
    }
  }
}

void sub_4D38( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

CFNumberRef MTSessionFilter::getPropertyForClient(MTSessionFilter *this, CFTypeRef cf1, const void *a3)
{
  if (*((void *)this + 3) && CFEqual(cf1, @"LogLevel")) {
    return CFNumberCreate(0LL, kCFNumberIntType, (char *)this + 32);
  }
  else {
    return 0LL;
  }
}

uint64_t MTSessionFilter::setPropertyForClient(uint64_t this, CFTypeRef cf1, const void *a3, const void *a4)
{
  if (*(void *)(this + 24))
  {
    uint64_t v5 = this;
    this = CFEqual(cf1, @"LogLevel");
    if ((_DWORD)this)
    {
      CFTypeID v6 = CFGetTypeID(a3);
      this = CFNumberGetTypeID();
      if (v6 == this) {
        return CFNumberGetValue((CFNumberRef)a3, kCFNumberIntType, (void *)(v5 + 32));
      }
    }
  }

  return this;
}

uint64_t MTSessionFilter::filter(void *a1, uint64_t a2, uint64_t a3)
{
  if (a1[3])
  {
    v3 = (uint64_t *)a1[5];
    for (i = (uint64_t *)a1[6]; v3 != i; a3 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v6 + 48LL))( v6,  a2))
      uint64_t v6 = *v3++;
  }

  return a3;
}

uint64_t MTSessionFilter::copyEvent()
{
  return 0LL;
}

void std::vector<MTSessionFilterManager *>::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
}

void sub_4ED4(_Unwind_Exception *a1)
{
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  BOOL result = std::logic_error::logic_error(a1, a2);
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<MTSessionFilterManager *>>( uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(8 * a2);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  int v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

id MTLoggingContinuousRecordingFilterManager()
{
  if (MTLoggingContinuousRecordingFilterManager::onceToken != -1) {
    dispatch_once(&MTLoggingContinuousRecordingFilterManager::onceToken, &__block_literal_global);
  }
  return (id)MTLoggingContinuousRecordingFilterManager::__logObj;
}

id MTLoggingCrownFilterManager()
{
  if (MTLoggingCrownFilterManager::onceToken != -1) {
    dispatch_once(&MTLoggingCrownFilterManager::onceToken, &__block_literal_global_3);
  }
  return (id)MTLoggingCrownFilterManager::__logObj;
}

id MTLoggingRemoteFilterManager()
{
  if (MTLoggingRemoteFilterManager::onceToken != -1) {
    dispatch_once(&MTLoggingRemoteFilterManager::onceToken, &__block_literal_global_5);
  }
  return (id)MTLoggingRemoteFilterManager::__logObj;
}

id MTLoggingAnalyticsFilterManager()
{
  if (MTLoggingAnalyticsFilterManager::onceToken != -1) {
    dispatch_once(&MTLoggingAnalyticsFilterManager::onceToken, &__block_literal_global_7);
  }
  return (id)MTLoggingAnalyticsFilterManager::__logObj;
}

void sub_5484(_Unwind_Exception *a1)
{
}

void sub_5600(_Unwind_Exception *a1)
{
}

void sub_57B4(_Unwind_Exception *a1)
{
}

void sub_5A28(_Unwind_Exception *a1)
{
}

void sub_5F64(_Unwind_Exception *a1)
{
}

void sub_621C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, char a22)
{
}

void sub_647C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, char a22)
{
}

void sub_6660(_Unwind_Exception *a1)
{
}

void sub_68A0(_Unwind_Exception *a1)
{
}

LABEL_6:
  [v3 appendString:@".lp5"];
  CFUUIDRef v8 = (void *)objc_claimAutoreleasedReturnValue(-[HIDContinuousRecorder directoryURL](self, "directoryURL"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:isDirectory:relativeToURL:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:isDirectory:relativeToURL:",  v3,  0LL,  v8));

  return v9;
}

void sub_77FC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, id location, char a25)
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

void sub_7BC8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, id location)
{
}

void sub_8830( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_8A70(_Unwind_Exception *a1)
{
}

void sub_913C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location)
{
}

void sub_91B8()
{
}

void sub_91C4()
{
}

void sub_91CC()
{
}

void sub_9790(_Unwind_Exception *a1)
{
}

void sub_9A64( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16)
{
}

void sub_9E40(_Unwind_Exception *a1)
{
}

LABEL_18:
}

void OUTLINED_FUNCTION_0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void OUTLINED_FUNCTION_1( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

  ;
}

  ;
}

void OUTLINED_FUNCTION_6( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

void OUTLINED_FUNCTION_9( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void OUTLINED_FUNCTION_11( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

int *OUTLINED_FUNCTION_13()
{
  return __error();
}

uint64_t OUTLINED_FUNCTION_14(uint64_t a1)
{
  return *(void *)(a1 + 32);
}

char *OUTLINED_FUNCTION_15(int *a1)
{
  return strerror(*a1);
}

int *OUTLINED_FUNCTION_16()
{
  return __error();
}

void MTRemoteFilterManager::MTRemoteFilterManager(MTRemoteFilterManager *this)
{
  *(void *)this = off_14858;
  *((void *)this + 1) = 0LL;
  uint64_t v2 = (void **)((char *)this + 8);
  *((void *)this + 2) = 0LL;
  *((void *)this + 3) = 0LL;
  *(void *)((char *)this + 29) = 0LL;
  *((_BYTE *)this + 37) = 1;
  *(_OWORD *)((char *)this + 40) = 0u;
  uint64_t v3 = (void **)((char *)this + 40);
  *((void *)this + 10) = 0LL;
  *(_OWORD *)((char *)this + 56) = 0u;
  *((_DWORD *)this + 1_Block_object_dispose((const void *)(v3 - 104), 8) = 0;
  id v4 = MTLoggingRemoteFilterManager();
  uint64_t v5 = objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = *v2;
  *uint64_t v2 = (void *)v5;

  CFUUIDRef v7 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  CFUUIDRef v8 = *v3;
  uint64_t *v3 = v7;

  uint64_t v9 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  uint64_t v10 = (void *)*((void *)this + 6);
  *((void *)this + 6) = v9;

  uint64_t v11 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  uint64_t v12 = (void *)*((void *)this + 7);
  *((void *)this + 7) = v11;

  *((_DWORD *)this + 1_Block_object_dispose((const void *)(v3 - 104), 8) = -1;
}

void sub_A3EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void MTRemoteFilterManager::~MTRemoteFilterManager(MTRemoteFilterManager *this)
{
  *(void *)this = off_14858;
  uint64_t v2 = (void *)*((void *)this + 8);
  if (v2)
  {
    [v2 suspend];
    [*((id *)this + 8) invalidate];
    uint64_t v3 = (void *)*((void *)this + 8);
    *((void *)this + _Block_object_dispose((const void *)(v3 - 104), 8) = 0LL;
  }
}

{
  void *v1;
  MTRemoteFilterManager::~MTRemoteFilterManager(this);
  operator delete(v1);
}

id MTRemoteFilterManager::isSiriRemoteButtonService(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void *)IOHIDServiceCopyProperty(a2, @"AppleBluetoothRemote");
  id v4 = [v3 BOOLValue];

  return v4;
}

void sub_A540(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id MTRemoteFilterManager::isSiriRemoteCircularTouchService(uint64_t a1, uint64_t a2)
{
  if (IOHIDServiceConformsTo(a2, 13LL, 5LL))
  {
    RegistryID = (void *)IOHIDServiceGetRegistryID(a2);
    uint64_t v5 = IORegistryEntryIDMatching((uint64_t)[RegistryID unsignedLongLongValue]);
    io_service_t MatchingService = IOServiceGetMatchingService(0, v5);
    io_object_t v7 = MatchingService;
    if (!MatchingService)
    {
      id v12 = 0LL;
LABEL_13:

      return v12;
    }

    CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(MatchingService, @"CircularSensor", kCFAllocatorDefault, 0);
    uint64_t v9 = (void *)CFProperty;
    if (CFProperty)
    {
      CFTypeID v10 = CFGetTypeID(CFProperty);
      if (v10 == CFBooleanGetTypeID())
      {
        uint64_t v11 = *(os_log_s **)(a1 + 8);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
          MTRemoteFilterManager::isSiriRemoteCircularTouchService((uint64_t)v9, v11);
        }
        id v12 = [v9 BOOLValue];

        goto LABEL_12;
      }

      CFRelease(v9);
    }

    id v12 = 0LL;
LABEL_12:
    IOObjectRelease(v7);
    goto LABEL_13;
  }

  return 0LL;
}

void sub_A660(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void MTRemoteFilterManager::registerService(uint64_t a1, void *a2)
{
  id v4 = MTRemoteFilterManager::isSiriRemoteCircularTouchService(a1, (uint64_t)a2);
  if ((_DWORD)v4)
  {
    uint64_t v5 = *(os_log_s **)(a1 + 8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      uint64_t v9 = a2;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Added circular touch service %@", (uint8_t *)&v8, 0xCu);
    }

    uint64_t v6 = (id *)(a1 + 16);
  }

  else
  {
    io_object_t v7 = *(os_log_s **)(a1 + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      uint64_t v9 = a2;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Added button service %@", (uint8_t *)&v8, 0xCu);
    }

    uint64_t v6 = (id *)(a1 + 24);
  }

  objc_storeStrong(v6, a2);
}

void MTRemoteFilterManager::unregisterService(void *a1, uint64_t a2)
{
  uint64_t v2 = (void **)(a1 + 2);
  if (a1[2] == a2)
  {
    uint64_t v3 = (os_log_s *)a1[1];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v4 = "Removed circular touch service";
      uint64_t v5 = buf;
      goto LABEL_7;
    }
  }

  else
  {
    uint64_t v2 = (void **)(a1 + 3);
    if (a1[3] != a2) {
      return;
    }
    uint64_t v3 = (os_log_s *)a1[1];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v7 = 0;
      id v4 = "Removed button service";
      uint64_t v5 = (uint8_t *)&v7;
LABEL_7:
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, v4, v5, 2u);
    }
  }

  uint64_t v6 = *v2;
  *uint64_t v2 = 0LL;
}

NSXPCConnection *MTRemoteFilterManager::createXpcServiceConnection(MTRemoteFilterManager *this)
{
  uint64_t v2 = -[NSXPCConnection initWithServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCConnection),  "initWithServiceName:",  @"com.apple.SessionFilterPreferenceProvider");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___SessionFilterPreferenceProviderProtocol));
  -[NSXPCConnection setRemoteObjectInterface:](v2, "setRemoteObjectInterface:", v3);

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = ___ZN21MTRemoteFilterManager26createXpcServiceConnectionEv_block_invoke;
  v5[3] = &__block_descriptor_40_e5_v8__0l;
  v5[4] = this;
  -[NSXPCConnection setInvalidationHandler:](v2, "setInvalidationHandler:", v5);
  return v2;
}

void sub_A900(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZN21MTRemoteFilterManager26createXpcServiceConnectionEv_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (os_log_type_enabled(*(os_log_t *)(v1 + 8), OS_LOG_TYPE_ERROR)) {
    ___ZN21MTRemoteFilterManager26createXpcServiceConnectionEv_block_invoke_cold_1();
  }
  uint64_t v2 = *(void **)(v1 + 64);
  *(void *)(v1 + 64) = 0LL;
}

void MTRemoteFilterManager::updateTouchDisabledPreference(MTRemoteFilterManager *this)
{
  uint64_t v2 = (void *)*((void *)this + 8);
  if (!v2)
  {
    XpcServiceConnection = MTRemoteFilterManager::createXpcServiceConnection(this);
    uint64_t v4 = objc_claimAutoreleasedReturnValue(XpcServiceConnection);
    uint64_t v5 = (void *)*((void *)this + 8);
    *((void *)this + _Block_object_dispose((const void *)(v3 - 104), 8) = v4;

    [*((id *)this + 8) resume];
    uint64_t v2 = (void *)*((void *)this + 8);
  }

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = ___ZN21MTRemoteFilterManager29updateTouchDisabledPreferenceEv_block_invoke;
  v8[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v8[4] = this;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v2 remoteObjectProxyWithErrorHandler:v8]);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = ___ZN21MTRemoteFilterManager29updateTouchDisabledPreferenceEv_block_invoke_14;
  v7[3] = &__block_descriptor_40_e8_v12__0B8l;
  v7[4] = this;
  [v6 siriRemoteTouchDisabledWithReply:v7];
}

void sub_AA30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZN21MTRemoteFilterManager29updateTouchDisabledPreferenceEv_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(os_log_s **)(v4 + 8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    ___ZN21MTRemoteFilterManager29updateTouchDisabledPreferenceEv_block_invoke_cold_1((uint64_t)v3, v5);
  }
  if (*(_BYTE *)(v4 + 37))
  {
    *(_BYTE *)(v4 + 37) = 0;
    MTRemoteFilterManager::updateTouchDisabledPreference((MTRemoteFilterManager *)v4);
  }
}

void sub_AAAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZN21MTRemoteFilterManager29updateTouchDisabledPreferenceEv_block_invoke_14(uint64_t a1, char a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(dispatch_queue_s **)(v2 + 80);
  if (v3)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472LL;
    v4[2] = ___ZN21MTRemoteFilterManager29updateTouchDisabledPreferenceEv_block_invoke_2;
    v4[3] = &__block_descriptor_41_e5_v8__0l;
    v4[4] = v2;
    char v5 = a2;
    dispatch_async(v3, v4);
  }

uint64_t ___ZN21MTRemoteFilterManager29updateTouchDisabledPreferenceEv_block_invoke_2(uint64_t result)
{
  *(_BYTE *)(*(void *)(result + 32) + 36LL) = *(_BYTE *)(result + 40);
  return result;
}

void MTRemoteFilterManager::scheduleWithDispatchQueue(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_storeStrong((id *)(a1 + 80), a2);
  *(_BYTE *)(a1 + 37) = 1;
  MTRemoteFilterManager::updateTouchDisabledPreference((MTRemoteFilterManager *)a1);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = ___ZN21MTRemoteFilterManager25scheduleWithDispatchQueueEPU28objcproto17OS_dispatch_queue8NSObject_block_invoke;
  v6[3] = &__block_descriptor_40_e8_v12__0i8l;
  v6[4] = a1;
  char v5 = objc_retainBlock(v6);
  notify_register_dispatch( "com.apple.TVPeripheralAgent.RemoteClickpadModeDidChange",  (int *)(a1 + 72),  *(dispatch_queue_t *)(a1 + 80),  v5);
}

void sub_ABDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZN21MTRemoteFilterManager25scheduleWithDispatchQueueEPU28objcproto17OS_dispatch_queue8NSObject_block_invoke( uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (os_log_type_enabled(*(os_log_t *)(v1 + 8), OS_LOG_TYPE_DEBUG)) {
    ___ZN21MTRemoteFilterManager25scheduleWithDispatchQueueEPU28objcproto17OS_dispatch_queue8NSObject_block_invoke_cold_1();
  }
  *(_BYTE *)(v1 + 37) = 1;
  MTRemoteFilterManager::updateTouchDisabledPreference((MTRemoteFilterManager *)v1);
}

uint64_t MTRemoteFilterManager::unscheduleWithDispatchQueue(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 80);
  *(void *)(a1 + 80) = 0LL;

  uint64_t result = notify_cancel(*(_DWORD *)(a1 + 72));
  *(_DWORD *)(a1 + 72) = -1;
  return result;
}

const void *MTRemoteFilterManager::filterEvent(uint64_t a1, uint64_t a2, const void *a3)
{
  int Type = IOHIDEventGetType(a3);
  if (Type == 11) {
    return MTRemoteFilterManager::filterDigitizerEvent(a1, a2, a3);
  }
  if (Type == 3) {
    return MTRemoteFilterManager::filterButtonEvent(a1, a2, (uint64_t)a3);
  }
  return a3;
}

const void *MTRemoteFilterManager::filterButtonEvent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v3 = (const void *)a3;
  if (*(void *)(a1 + 24) == a2)
  {
    BOOL v5 = *(_BYTE *)(a1 + 32) || *(_BYTE *)(a1 + 33) || *(_BYTE *)(a1 + 34) || *(_BYTE *)(a1 + 35) != 0;
    MTRemoteFilterManager::updateDPadButtonStates(a1, a2, a3);
    BOOL v6 = *(_BYTE *)(a1 + 32) || *(_BYTE *)(a1 + 33) || *(_BYTE *)(a1 + 34) || *(_BYTE *)(a1 + 35) != 0;
    if (!v5 && v6)
    {
      [*(id *)(a1 + 48) unionSet:*(void *)(a1 + 40)];
      [*(id *)(a1 + 40) removeAllObjects];
      __int16 v7 = (os_log_s *)*(id *)(a1 + 8);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) allObjects]);
        id v9 = (id)objc_claimAutoreleasedReturnValue([v14 componentsJoinedByString:@" "]);
        CFTypeID v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) allObjects]);
        id v11 = (id)objc_claimAutoreleasedReturnValue([v10 componentsJoinedByString:@" "]);
        id v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 56) allObjects]);
        unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 componentsJoinedByString:@" "]);
        *(_DWORD *)buf = 138412802;
        id v16 = v9;
        __int16 v17 = 2112;
        id v18 = v11;
        __int16 v19 = 2112;
        v20 = v13;
        _os_log_debug_impl( &dword_0,  v7,  OS_LOG_TYPE_DEBUG,  "active path IDs [%@] cancel path IDs [%@] consume path IDs [%@]",  buf,  0x20u);
      }
    }

    if (v6 && IOHIDEventGetIntegerValue(v3, 196608LL) == 12 && IOHIDEventGetIntegerValue(v3, 196609LL) == 128)
    {
      if (os_log_type_enabled(*(os_log_t *)(a1 + 8), OS_LOG_TYPE_DEBUG)) {
        MTRemoteFilterManager::filterButtonEvent();
      }
      CFRelease(v3);
      return 0LL;
    }
  }

  return v3;
}

void sub_AF64( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

const void *MTRemoteFilterManager::filterDigitizerEvent(uint64_t a1, uint64_t a2, const void *a3)
{
  if (*(void *)(a1 + 16) == a2)
  {
    v43 = a3;
    uint64_t Children = IOHIDEventGetChildren(a3);
    v40 = (void *)objc_claimAutoreleasedReturnValue(Children);
    v41 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v52 = 0u;
    __int128 v53 = 0u;
    __int128 v50 = 0u;
    __int128 v51 = 0u;
    id obj = v40;
    id v5 = [obj countByEnumeratingWithState:&v50 objects:v61 count:16];
    if (v5)
    {
      v45 = 0LL;
      uint64_t v42 = 0LL;
      uint64_t v6 = *(void *)v51;
      do
      {
        __int16 v7 = 0LL;
        do
        {
          if (*(void *)v51 != v6) {
            objc_enumerationMutation(obj);
          }
          uint64_t v8 = *(void *)(*((void *)&v50 + 1) + 8LL * (void)v7);
          if (IOHIDEventGetType(v8) == 11)
          {
            id v9 = +[NSNumber numberWithLong:]( &OBJC_CLASS___NSNumber,  "numberWithLong:",  IOHIDEventGetIntegerValue(v8, 720901LL));
            CFTypeID v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
            uint64_t IntegerValue = IOHIDEventGetIntegerValue(v8, 720903LL);
            uint64_t v12 = IOHIDEventGetIntegerValue(v8, 720905LL);
            if ([*(id *)(a1 + 48) count]) {
              BOOL v13 = 1;
            }
            else {
              BOOL v13 = [*(id *)(a1 + 56) count] != 0;
            }
            unsigned int v14 = [*(id *)(a1 + 48) containsObject:v10];
            if (([*(id *)(a1 + 56) containsObject:v10] & 1) != 0
              || *(_BYTE *)(a1 + 32)
              || *(_BYTE *)(a1 + 33)
              || *(_BYTE *)(a1 + 34))
            {
              BOOL v15 = 1;
            }

            else
            {
              if (*(_BYTE *)(a1 + 35)) {
                BOOL v15 = 1;
              }
              else {
                BOOL v15 = v13;
              }
              if (!v15 && (IntegerValue & 2) != 0) {
                BOOL v15 = *(_BYTE *)(a1 + 36) != 0;
              }
            }

            if (v14)
            {
              [*(id *)(a1 + 56) addObject:v10];
              [*(id *)(a1 + 40) removeObject:v10];
              [*(id *)(a1 + 48) removeObject:v10];
              IOHIDEventSetIntegerValue(v8, 720905LL, 0LL);
              IOHIDEventSetIntegerValue(v8, 720904LL, 0LL);
              IOHIDEventSetIntegerValue(v8, 720903LL, IntegerValue | 0x83);
              id v16 = (os_log_s *)*(id *)(a1 + 8);
              if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
              {
                double FloatValue = IOHIDEventGetFloatValue(v8, 720896LL);
                double v18 = IOHIDEventGetFloatValue(v8, 720897LL);
                *(_DWORD *)buf = 138412802;
                uint64_t v56 = (uint64_t)v10;
                __int16 v57 = 2048;
                double v58 = FloatValue;
                __int16 v59 = 2048;
                double v60 = v18;
                _os_log_debug_impl(&dword_0, v16, OS_LOG_TYPE_DEBUG, "Cancel path ID %@ at (%f, %f)", buf, 0x20u);
              }

              ++v42;
            }

            else if (v15)
            {
              [*(id *)(a1 + 56) addObject:v10];
              [*(id *)(a1 + 40) removeObject:v10];
              -[NSMutableArray addObject:](v41, "addObject:", v8);
            }

            if (v12 == 1)
            {
            }

            else
            {
              [*(id *)(a1 + 40) removeObject:v10];
              [*(id *)(a1 + 48) removeObject:v10];
              [*(id *)(a1 + 56) removeObject:v10];
            }

            ++v45;
          }

          __int16 v7 = (char *)v7 + 1;
        }

        while (v5 != v7);
        id v19 = [obj countByEnumeratingWithState:&v50 objects:v61 count:16];
        id v5 = v19;
      }

      while (v19);
    }

    else
    {
      v45 = 0LL;
      uint64_t v42 = 0LL;
    }

    v20 = v43;
    if (-[NSMutableArray count](v41, "count") == v45)
    {
      if (os_log_type_enabled(*(os_log_t *)(a1 + 8), OS_LOG_TYPE_DEBUG))
      {
        MTRemoteFilterManager::filterDigitizerEvent();
        v20 = v43;
      }

      CFRelease(v20);
      v21 = 0LL;
    }

    else
    {
      __int128 v48 = 0u;
      __int128 v49 = 0u;
      __int128 v46 = 0u;
      __int128 v47 = 0u;
      v22 = v41;
      id v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v22,  "countByEnumeratingWithState:objects:count:",  &v46,  v54,  16LL);
      if (v23)
      {
        uint64_t v24 = *(void *)v47;
        do
        {
          for (i = 0LL; i != v23; i = (char *)i + 1)
          {
            if (*(void *)v47 != v24) {
              objc_enumerationMutation(v22);
            }
            uint64_t v26 = *(void *)(*((void *)&v46 + 1) + 8LL * (void)i);
            v27 = (os_log_s *)*(id *)(a1 + 8);
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v28 = IOHIDEventGetIntegerValue(v26, 720901LL);
              double v29 = IOHIDEventGetFloatValue(v26, 720896LL);
              double v30 = IOHIDEventGetFloatValue(v26, 720897LL);
              *(_DWORD *)buf = 134218496;
              uint64_t v56 = v28;
              __int16 v57 = 2048;
              double v58 = v29;
              __int16 v59 = 2048;
              double v60 = v30;
              _os_log_debug_impl(&dword_0, v27, OS_LOG_TYPE_DEBUG, "Remove path ID %ld at (%f, %f)", buf, 0x20u);
            }

            IOHIDEventRemoveEvent(v43, v26, 0LL);
          }

          id v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v22,  "countByEnumeratingWithState:objects:count:",  &v46,  v54,  16LL);
        }

        while (v23);
      }

      v21 = v43;
      if (v42 == v45 - (_BYTE *)-[NSMutableArray count](v22, "count"))
      {
        uint64_t v31 = IOHIDEventGetIntegerValue(v43, 720903LL);
        IOHIDEventSetIntegerValue(v43, 720905LL, 0LL);
        IOHIDEventSetIntegerValue(v43, 720904LL, 0LL);
        IOHIDEventSetIntegerValue(v43, 720903LL, v31 | 0x83);
        if (os_log_type_enabled(*(os_log_t *)(a1 + 8), OS_LOG_TYPE_DEBUG))
        {
          MTRemoteFilterManager::filterDigitizerEvent();
          v21 = v43;
        }
      }
    }

    v32 = (os_log_s *)*(id *)(a1 + 8);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) allObjects]);
      id v35 = (id)objc_claimAutoreleasedReturnValue([v34 componentsJoinedByString:@" "]);
      v36 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) allObjects]);
      id v37 = (id)objc_claimAutoreleasedReturnValue([v36 componentsJoinedByString:@" "]);
      v38 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 56) allObjects]);
      double v39 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue([v38 componentsJoinedByString:@" "]));
      *(_DWORD *)buf = 138412802;
      uint64_t v56 = (uint64_t)v35;
      __int16 v57 = 2112;
      double v58 = *(double *)&v37;
      __int16 v59 = 2112;
      double v60 = v39;
      _os_log_debug_impl( &dword_0,  v32,  OS_LOG_TYPE_DEBUG,  "active path IDs [%@] cancel path IDs [%@] consume path IDs [%@]",  buf,  0x20u);
    }

    return v21;
  }

  return a3;
}

void sub_B6C0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

NSMutableSet *MTRemoteFilterManager::getPathIDs(uint64_t a1, uint64_t a2)
{
  id v3 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  uint64_t Children = IOHIDEventGetChildren(a2);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue(Children);
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8LL * (void)i);
        if (IOHIDEventGetType(v9) == 11)
        {
          uint64_t IntegerValue = IOHIDEventGetIntegerValue(v9, 720901LL);
          id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLong:]( &OBJC_CLASS___NSNumber,  "numberWithLong:",  IntegerValue,  (void)v13));
          -[NSMutableSet addObject:](v3, "addObject:", v11);
        }
      }

      id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v6);
  }

  return v3;
}

void sub_B910(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL MTRemoteFilterManager::dpadButtonIsPressed(MTRemoteFilterManager *this)
{
  return *((_BYTE *)this + 32) || *((_BYTE *)this + 33) || *((_BYTE *)this + 34) || *((_BYTE *)this + 35) != 0;
}

void MTRemoteFilterManager::updateDPadButtonStates(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (IOHIDEventGetIntegerValue(a3, 196608LL) == 12)
  {
    uint64_t IntegerValue = IOHIDEventGetIntegerValue(a3, 196610LL);
    switch(IOHIDEventGetIntegerValue(a3, 196609LL))
    {
      case 'B':
        *(_BYTE *)(a1 + 32) = IntegerValue != 0;
        goto LABEL_7;
      case 'C':
        *(_BYTE *)(a1 + 33) = IntegerValue != 0;
        goto LABEL_7;
      case 'D':
        *(_BYTE *)(a1 + 34) = IntegerValue != 0;
        goto LABEL_7;
      case 'E':
        *(_BYTE *)(a1 + 35) = IntegerValue != 0;
LABEL_7:
        if (os_log_type_enabled(*(os_log_t *)(a1 + 8), OS_LOG_TYPE_DEBUG)) {
          MTRemoteFilterManager::updateDPadButtonStates();
        }
        break;
      default:
        return;
    }
  }

double OUTLINED_FUNCTION_0_0()
{
  return 2.0542726e-289;
}

void OUTLINED_FUNCTION_1_0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void OUTLINED_FUNCTION_4_0(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

double MTCrownFilterManager::secondsFromMachTime( MTCrownFilterManager *this, double a2, double a3, double a4)
{
  if (MTCrownFilterManager::secondsFromMachTime(unsigned long long)::once != -1) {
    dispatch_once(&MTCrownFilterManager::secondsFromMachTime(unsigned long long)::once, &__block_literal_global_0);
  }
  LODWORD(a3) = MTCrownFilterManager::secondsFromMachTime(unsigned long long)::timebase;
  LODWORD(a4) = *(_DWORD *)algn_19084;
  return (double)(unint64_t)this
       * (double)*(unint64_t *)&a3
       / (double)*(unint64_t *)&a4
       / 1000000000.0;
}

void ___ZN20MTCrownFilterManager19secondsFromMachTimeEy_block_invoke(id a1)
{
}

void MTCrownFilterManager::MTCrownFilterManager(MTCrownFilterManager *this)
{
  *(void *)this = off_14988;
  *(_OWORD *)((char *)this + _Block_object_dispose((const void *)(v3 - 104), 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 50) = 0u;
  *((void *)this + 9) = 0LL;
  *((void *)this + 10) = 0x3FE0000000000000LL;
  *((void *)this + 11) = 0LL;
  *((void *)this + 12) = 0LL;
  *((void *)this + 13) = 0x4014000000000000LL;
  *((void *)this + 14) = 0LL;
  uint64_t v2 = (void **)((char *)this + 112);
  *((void *)this + 15) = 0LL;
  *((void *)this + 16) = 0LL;
  id v3 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  id v4 = *v2;
  *uint64_t v2 = v3;

  id v5 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  id v6 = (void *)*((void *)this + 15);
  *((void *)this + 15) = v5;

  uint64_t v7 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  uint64_t v8 = (void *)*((void *)this + 16);
  *((void *)this + 16) = v7;
}

void sub_BBE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void MTCrownFilterManager::~MTCrownFilterManager(id *this)
{
}

{
  void *v1;
  MTCrownFilterManager::~MTCrownFilterManager(this);
  operator delete(v1);
}

void MTCrownFilterManager::registerService(uint64_t a1, void *a2)
{
  if (IOHIDServiceConformsTo(a2, 13LL, 4LL))
  {
    id v4 = (void *)IOHIDServiceCopyProperty(a2, @"CrownFilterRect");
    if (v4)
    {
      objc_storeStrong((id *)(a1 + 8), a2);
      id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"X1"]);
      *(double *)(a1 + 32) = (float)((float)(int)[v5 intValue] / 100.0);

      id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"X2"]);
      *(double *)(a1 + 40) = (float)((float)(int)[v6 intValue] / 100.0);

      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"Y1"]);
      *(double *)(a1 + 4_Block_object_dispose((const void *)(v3 - 104), 8) = (float)((float)(int)[v7 intValue] / 100.0);

      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"Y2"]);
      *(double *)(a1 + 56) = (float)((float)(int)[v8 intValue] / 100.0);

      id v9 = MTLoggingCrownFilterManager();
      CFTypeID v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = *(void *)(a1 + 32);
        uint64_t v12 = *(void *)(a1 + 40);
        uint64_t v13 = *(void *)(a1 + 48);
        uint64_t v14 = *(void *)(a1 + 56);
        int v15 = 134218752;
        uint64_t v16 = v11;
        __int16 v17 = 2048;
        uint64_t v18 = v13;
        __int16 v19 = 2048;
        uint64_t v20 = v12;
        __int16 v21 = 2048;
        uint64_t v22 = v14;
        _os_log_impl( &dword_0,  v10,  OS_LOG_TYPE_DEFAULT,  "MTCrownFilterManager: Filter Rect X1=%f Y1=%f X2=%f Y2=%f",  (uint8_t *)&v15,  0x2Au);
      }
    }
  }

  else if (IOHIDServiceConformsTo(a2, 65291LL, 1LL))
  {
    objc_storeStrong((id *)(a1 + 16), a2);
  }

  else if (IOHIDServiceConformsTo(a2, 11LL, 1LL))
  {
    objc_storeStrong((id *)(a1 + 24), a2);
  }

void sub_BEC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void MTCrownFilterManager::unregisterService(void *a1, void *a2)
{
  uint64_t v2 = a1 + 1;
  if ((void *)a1[1] != a2)
  {
    uint64_t v2 = a1 + 2;
    if ((void *)a1[2] != a2)
    {
      id v4 = (void *)a1[3];
      id v3 = a1 + 3;
      if (v4 != a2) {
        return;
      }
      uint64_t v2 = v3;
    }
  }

  *uint64_t v2 = 0LL;
}

CFTypeRef MTCrownFilterManager::filterEvent(void *a1, uint64_t a2, const void *a3)
{
  uint64_t v4 = a1[1];
  if (v4)
  {
    uint64_t v6 = a1[2];
    if (v6)
    {
      uint64_t v7 = a1[3];
      if (v7)
      {
        BOOL v9 = v4 == a2 || v6 == a2;
        if (v9 || v7 == a2)
        {
          int Type = IOHIDEventGetType(a3);
          int v12 = Type;
          if ((a1[1] != a2 || Type == 11) && (a1[2] != a2 || Type == 6))
          {
            if (a1[3] == a2)
            {
              MTCrownFilterManager::filterButtonEvent((uint64_t)a1, (uint64_t)a3);
            }

            else
            {
              MTCrownFilterManager::updateScrollMotionAccumulator((uint64_t)a1, (uint64_t)a3);
              if (v12 == 11) {
                return MTCrownFilterManager::filterDigitizerEvent((uint64_t)a1, a3);
              }
            }
          }
        }
      }
    }
  }

  return a3;
}

uint64_t MTCrownFilterManager::filterButtonEvent(uint64_t a1, uint64_t a2)
{
  if (IOHIDEventGetType(a2) == 3)
  {
    uint64_t IntegerValue = IOHIDEventGetIntegerValue(a2, 196608LL);
    uint64_t v5 = IOHIDEventGetIntegerValue(a2, 196609LL);
    uint64_t v6 = IOHIDEventGetIntegerValue(a2, 196610LL);
    BOOL v7 = v6 == 1;
    if (IntegerValue == 12)
    {
      if (v5 == 149)
      {
        *(_BYTE *)(a1 + 65) = v7;
      }

      else
      {
        if (v5 != 64) {
          return a2;
        }
        *(_BYTE *)(a1 + 64) = v7;
      }

      if (v6 == 1)
      {
        [*(id *)(a1 + 120) unionSet:*(void *)(a1 + 112)];
        [*(id *)(a1 + 112) removeAllObjects];
        if (!*(void *)(a1 + 72)) {
          *(void *)(a1 + 72) = mach_continuous_time();
        }
      }

      if (!*(_BYTE *)(a1 + 64) && !*(_BYTE *)(a1 + 65)) {
        *(void *)(a1 + 72) = 0LL;
      }
      id v8 = MTLoggingCrownFilterManager();
      BOOL v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 112) allObjects]);
        id v12 = (id)objc_claimAutoreleasedReturnValue([v11 componentsJoinedByString:@","]);
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 120) allObjects]);
        id v14 = (id)objc_claimAutoreleasedReturnValue([v13 componentsJoinedByString:@","]);
        int v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 128) allObjects]);
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 componentsJoinedByString:@","]);
        int v17 = 138412802;
        id v18 = v12;
        __int16 v19 = 2112;
        id v20 = v14;
        __int16 v21 = 2112;
        uint64_t v22 = v16;
        _os_log_debug_impl( &dword_0,  v9,  OS_LOG_TYPE_DEBUG,  "MTCrownFilterManager: Active = [%@], Cancel = [%@], Consume = [%@]",  (uint8_t *)&v17,  0x20u);
      }
    }
  }

  return a2;
}

void sub_C224(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double MTCrownFilterManager::updateScrollMotionAccumulator(uint64_t a1, uint64_t a2)
{
  uint64_t TimeStamp = IOHIDEventGetTimeStamp(a2);
  double v8 = 0.0;
  double v9 = 0.0;
  if (IOHIDEventGetType(a2) == 6)
  {
    double Position = IOHIDEventGetPosition(a2);
    double v9 = v6;
  }

  uint64_t v10 = *(void *)(a1 + 96);
  if (v10) {
    double v8 = MTCrownFilterManager::secondsFromMachTime((MTCrownFilterManager *)(TimeStamp - v10), Position, v6, v7);
  }
  double v11 = *(double *)(a1 + 88);
  float v12 = pow(0.95, v8 / 0.00800000038);
  double result = fabs(v9) + v11 * v12;
  *(double *)(a1 + 8_Block_object_dispose((const void *)(v3 - 104), 8) = result;
  *(void *)(a1 + 96) = TimeStamp;
  return result;
}

CFTypeRef MTCrownFilterManager::filterDigitizerEvent(uint64_t a1, const void *a2)
{
  CFTypeRef cf = a2;
  uint64_t Children = IOHIDEventGetChildren(a2);
  __int128 v53 = (void *)objc_claimAutoreleasedReturnValue(Children);
  double v58 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v53 count]));
  __int128 v67 = 0u;
  __int128 v68 = 0u;
  __int128 v65 = 0u;
  __int128 v66 = 0u;
  id obj = v53;
  id v4 = [obj countByEnumeratingWithState:&v65 objects:v76 count:16];
  if (!v4)
  {
    double v60 = 0LL;
    uint64_t v55 = 0LL;
    goto LABEL_41;
  }

  uint64_t v55 = 0LL;
  uint64_t v59 = *(void *)v66;
  double v60 = 0LL;
  do
  {
    for (i = 0LL; i != v4; i = (char *)i + 1)
    {
      if (*(void *)v66 != v59) {
        objc_enumerationMutation(obj);
      }
      uint64_t v6 = *(void *)(*((void *)&v65 + 1) + 8LL * (void)i);
      if (IOHIDEventGetType(v6) == 11)
      {
        double v7 = +[NSNumber numberWithLong:]( &OBJC_CLASS___NSNumber,  "numberWithLong:",  IOHIDEventGetIntegerValue(v6, 720901LL));
        double v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
        uint64_t IntegerValue = IOHIDEventGetIntegerValue(v6, 720903LL);
        uint64_t v10 = IOHIDEventGetIntegerValue(v6, 720905LL);
        if (v10 == 1)
        {
          if (([*(id *)(a1 + 120) containsObject:v8] & 1) == 0
            && ([*(id *)(a1 + 128) containsObject:v8] & 1) == 0)
          {
            [*(id *)(a1 + 112) addObject:v8];
          }
        }

        else
        {
          [*(id *)(a1 + 112) removeObject:v8];
          [*(id *)(a1 + 128) removeObject:v8];
        }

        BOOL v11 = MTCrownFilterManager::touchIsNearCrown((double *)a1, v6) && *(double *)(a1 + 88) >= *(double *)(a1 + 104);
        uint64_t v12 = mach_continuous_time();
        double v16 = MTCrownFilterManager::secondsFromMachTime( (MTCrownFilterManager *)(v12 - *(void *)(a1 + 72)),  v13,  v14,  v15);
        uint64_t v17 = *(void *)(a1 + 72);
        if (v17)
        {
          double v18 = v16;
          double v16 = *(double *)(a1 + 80);
          if (v18 >= v16)
          {
            LODWORD(v17) = 0;
          }

          else
          {
            id v19 = MTLoggingCrownFilterManager();
            id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 134217984;
              double v71 = v18;
              _os_log_debug_impl( &dword_0,  v20,  OS_LOG_TYPE_DEBUG,  "MTCrownFilterManager: Cancel touch button timeout = %f s",  buf,  0xCu);
            }

            LODWORD(v17) = 1;
          }
        }

        if (v10 == 1)
        {
          int v21 = (v11 | v17) & (IntegerValue >> 1);
          if ((IntegerValue & 2) == 0 && v11)
          {
            unsigned int v22 = 1;
LABEL_29:
            objc_msgSend(*(id *)(a1 + 128), "addObject:", v8, v16);
            [*(id *)(a1 + 112) removeObject:v8];
            if (((v22 | v21 ^ 1) & 1) != 0)
            {
              unsigned int v23 = [v58 containsObject:v6];
              IOHIDEventSetIntegerValue(v6, 720905LL, 0LL);
              IOHIDEventSetIntegerValue(v6, 720904LL, 0LL);
              IOHIDEventSetIntegerValue(v6, 720903LL, IntegerValue | 0x83);
              [*(id *)(a1 + 120) removeObject:v8];
              double Position = IOHIDEventGetPosition(v6);
              uint64_t v26 = v25;
              id v27 = MTLoggingCrownFilterManager();
              uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
              {
                id v29 = [v8 unsignedIntegerValue];
                *(_DWORD *)buf = 134218496;
                double v71 = *(double *)&v29;
                __int16 v72 = 2048;
                double v73 = Position;
                __int16 v74 = 2048;
                v75 = v26;
                _os_log_impl( &dword_0,  v28,  OS_LOG_TYPE_DEFAULT,  "MTCrownFilterManager: Cancelling path id %lu at (%f, %f)",  buf,  0x20u);
              }

              v55 += v23 ^ 1;
            }

            else
            {
              [v58 addObject:v6];
            }

LABEL_34:
            id v30 = MTLoggingCrownFilterManager();
            uint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
            {
              v32 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 112) allObjects]);
              id v33 = (id)objc_claimAutoreleasedReturnValue([v32 componentsJoinedByString:@","]);
              v54 = v32;
              v34 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 120) allObjects]);
              id v35 = (id)objc_claimAutoreleasedReturnValue([v34 componentsJoinedByString:@","]);
              v36 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 128) allObjects]);
              id v37 = (void *)objc_claimAutoreleasedReturnValue([v36 componentsJoinedByString:@","]);
              *(_DWORD *)buf = 138412802;
              double v71 = *(double *)&v33;
              __int16 v72 = 2112;
              double v73 = *(double *)&v35;
              __int16 v74 = 2112;
              v75 = v37;
              _os_log_debug_impl( &dword_0,  v31,  OS_LOG_TYPE_DEBUG,  "MTCrownFilterManager: Active = [%@], Cancel = [%@], Consume = [%@]",  buf,  0x20u);
            }

            ++v60;
            continue;
          }
        }

        else
        {
          int v21 = 0;
        }

        unsigned int v22 = objc_msgSend(*(id *)(a1 + 120), "containsObject:", v8, v16);
        if ((v22 | v21) == 1) {
          goto LABEL_29;
        }
        goto LABEL_34;
      }
    }

    id v4 = [obj countByEnumeratingWithState:&v65 objects:v76 count:16];
  }

  while (v4);
LABEL_41:

  if (v55 == v60 - (_BYTE *)[v58 count])
  {
    uint64_t v38 = IOHIDEventGetIntegerValue(cf, 720903LL);
    IOHIDEventSetIntegerValue(cf, 720905LL, 0LL);
    IOHIDEventSetIntegerValue(cf, 720904LL, 0LL);
    IOHIDEventSetIntegerValue(cf, 720903LL, v38 | 0x83);
  }

  if ([v58 count] == v60)
  {
    id v39 = MTLoggingCrownFilterManager();
    v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG)) {
      MTCrownFilterManager::filterDigitizerEvent(v40);
    }

    CFRelease(cf);
    CFTypeRef cf = 0LL;
  }

  else
  {
    __int128 v63 = 0u;
    __int128 v64 = 0u;
    __int128 v61 = 0u;
    __int128 v62 = 0u;
    id v41 = v58;
    id v42 = [v41 countByEnumeratingWithState:&v61 objects:v69 count:16];
    if (v42)
    {
      uint64_t v43 = *(void *)v62;
      do
      {
        for (j = 0LL; j != v42; j = (char *)j + 1)
        {
          if (*(void *)v62 != v43) {
            objc_enumerationMutation(v41);
          }
          uint64_t v45 = *(void *)(*((void *)&v61 + 1) + 8LL * (void)j);
          uint64_t v46 = IOHIDEventGetIntegerValue(v45, 720901LL);
          double v47 = IOHIDEventGetPosition(v45);
          __int128 v49 = v48;
          id v50 = MTLoggingCrownFilterManager();
          __int128 v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
          if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 134218496;
            double v71 = *(double *)&v46;
            __int16 v72 = 2048;
            double v73 = v47;
            __int16 v74 = 2048;
            v75 = v49;
            _os_log_debug_impl( &dword_0,  v51,  OS_LOG_TYPE_DEBUG,  "MTCrownFilterManager: Consuming path id %ld at (%f, %f)",  buf,  0x20u);
          }

          IOHIDEventRemoveEvent(cf, v45, 0LL);
        }

        id v42 = [v41 countByEnumeratingWithState:&v61 objects:v69 count:16];
      }

      while (v42);
    }
  }

  return cf;
}

void sub_CAA4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, void *a23)
{
  _Unwind_Resume(a1);
}

BOOL MTCrownFilterManager::touchIsNearCrown(double *a1, uint64_t a2)
{
  double Position = IOHIDEventGetPosition(a2);
  return Position >= a1[4] && Position <= a1[5] && v4 >= a1[6] && v4 <= a1[7];
}

BOOL MTCrownFilterManager::crownIsActive(MTCrownFilterManager *this)
{
  return *((double *)this + 11) >= *((double *)this + 13);
}

void MTRemoteFilterManager::isSiriRemoteCircularTouchService(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "CircularSensor %@", (uint8_t *)&v2, 0xCu);
}

void ___ZN21MTRemoteFilterManager26createXpcServiceConnectionEv_block_invoke_cold_1()
{
}

void ___ZN21MTRemoteFilterManager29updateTouchDisabledPreferenceEv_block_invoke_cold_1( uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "remoteObjectProxy error: %@", (uint8_t *)&v2, 0xCu);
}

void ___ZN21MTRemoteFilterManager25scheduleWithDispatchQueueEPU28objcproto17OS_dispatch_queue8NSObject_block_invoke_cold_1()
{
}

void MTRemoteFilterManager::filterButtonEvent()
{
}

void MTRemoteFilterManager::filterDigitizerEvent()
{
}

{
  os_log_s *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_0, v0, v1, "Cancel hand collection", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

void MTRemoteFilterManager::updateDPadButtonStates()
{
}

void MTCrownFilterManager::filterDigitizerEvent(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "MTCrownFilterManager: Consuming hand collection", v1, 2u);
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

id objc_msgSend_xpcRecordingUpdater(void *a1, const char *a2, ...)
{
  return [a1 xpcRecordingUpdater];
}