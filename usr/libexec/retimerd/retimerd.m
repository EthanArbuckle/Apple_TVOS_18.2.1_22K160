void *sub_100001750(void *a1, const char *a2)
{
  CFStringRef v3;
  v3 = CFStringCreateWithCString(kCFAllocatorDefault, a2, 0x8000100u);
  *a1 = &off_100008400;
  a1[1] = v3;
  a1[2] = 0LL;
  return a1;
}

void *sub_100001798(void *result, uint64_t a2)
{
  *result = &off_100008400;
  result[1] = a2;
  result[2] = 0LL;
  return result;
}

uint64_t sub_1000017AC(uint64_t a1, io_object_t object)
{
  *(void *)a1 = &off_100008400;
  IOObjectRetain(object);
  *(void *)(a1 + 8) = 0LL;
  *(_DWORD *)(a1 + 16) = object;
  *(_DWORD *)(a1 + 20) = 0;
  return a1;
}

void *sub_1000017EC(void *a1)
{
  *a1 = &off_100008400;
  sub_100001830((uint64_t)a1);
  v2 = (const void *)a1[1];
  if (v2) {
    CFRelease(v2);
  }
  a1[1] = 0LL;
  return a1;
}

uint64_t sub_100001830(uint64_t a1)
{
  io_connect_t v2 = *(_DWORD *)(a1 + 20);
  if (v2)
  {
    IOConnectRelease(v2);
    *(_DWORD *)(a1 + 20) = 0;
  }

  uint64_t result = *(unsigned int *)(a1 + 16);
  if ((_DWORD)result)
  {
    uint64_t result = IOObjectRelease(result);
    *(_DWORD *)(a1 + 16) = 0;
  }

  return result;
}

void sub_10000186C(void *a1)
{
}

uint64_t sub_100001880(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = &off_100008400;
  *(void *)(a1 + 8) = CFStringCreateCopy(kCFAllocatorDefault, *(CFStringRef *)(a2 + 8));
  io_object_t v4 = *(_DWORD *)(a2 + 16);
  *(_DWORD *)(a1 + 16) = v4;
  IOObjectRetain(v4);
  io_connect_t v5 = *(_DWORD *)(a2 + 20);
  *(_DWORD *)(a1 + 20) = v5;
  IOConnectAddRef(v5);
  return a1;
}

uint64_t sub_1000018E4(uint64_t a1)
{
  io_service_t MatchingService = *(_DWORD *)(a1 + 16);
  if (MatchingService) {
    return IOServiceOpen(MatchingService, mach_task_self_, 0, (io_connect_t *)(a1 + 20));
  }
  v3 = IOServiceMatching("AppleTypeCRetimer");
  Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(Mutable, @"atcrt-name", *(const void **)(a1 + 8));
  CFDictionaryAddValue(v3, @"IOPropertyMatch", Mutable);
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v3);
  *(_DWORD *)(a1 + 16) = MatchingService;
  if (MatchingService) {
    return IOServiceOpen(MatchingService, mach_task_self_, 0, (io_connect_t *)(a1 + 20));
  }
  else {
    return 56LL;
  }
}

uint64_t sub_1000019B0(uint64_t a1, unsigned int a2)
{
  uint64_t v4 = a2;
  mach_port_t v2 = *(_DWORD *)(a1 + 20);
  if (v2) {
    return IOConnectCallScalarMethod(v2, 0, &v4, 1u, 0LL, 0LL);
  }
  else {
    return 5LL;
  }
}

uint64_t sub_100001A24(uint64_t a1, BOOL *a2)
{
  uint32_t outputCnt = 1;
  mach_port_t v2 = *(_DWORD *)(a1 + 20);
  if (!v2) {
    return 5LL;
  }
  uint64_t result = IOConnectCallScalarMethod(v2, 1u, 0LL, 0, &output, &outputCnt);
  *a2 = output == 1;
  return result;
}

uint64_t sub_100001AB4(uint64_t a1, unsigned int a2)
{
  uint64_t v4 = a2;
  mach_port_t v2 = *(_DWORD *)(a1 + 20);
  if (v2) {
    return IOConnectCallScalarMethod(v2, 3u, &v4, 1u, 0LL, 0LL);
  }
  else {
    return 5LL;
  }
}

uint64_t sub_100001B28(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a2;
  mach_port_t v2 = *(_DWORD *)(a1 + 20);
  if (v2) {
    return IOConnectCallScalarMethod(v2, 2u, &v4, 1u, 0LL, 0LL);
  }
  else {
    return 5LL;
  }
}

__CFArray *sub_100001B98()
{
  v0 = IOServiceMatching("AppleTypeCRetimer");
  mach_error_t MatchingServices = IOServiceGetMatchingServices(kIOMainPortDefault, v0, &existing);
  if (MatchingServices)
  {
    mach_port_t v2 = __stderrp;
    v3 = mach_error_string(MatchingServices);
    fprintf(v2, "ERROR: failed to get matching services: %s\n", v3);
    return 0LL;
  }

  else
  {
    Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeArrayCallBacks);
    if (Mutable)
    {
      io_object_t v5 = IOIteratorNext(existing);
      if (v5)
      {
        io_registry_entry_t v6 = v5;
        do
        {
          CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(v6, @"atcrt-name", kCFAllocatorDefault, 0);
          if (CFProperty)
          {
            v8 = CFProperty;
            CFArrayAppendValue(Mutable, CFProperty);
            CFRelease(v8);
            IOObjectRelease(v6);
          }

          else
          {
            fprintf(__stderrp, "ERROR: failed to get %s property from a %s node\n", "atcrt-name", "AppleTypeCRetimer");
          }

          io_registry_entry_t v6 = IOIteratorNext(existing);
        }

        while (v6);
      }

      IOObjectRelease(existing);
      v11.length = CFArrayGetCount(Mutable);
      v11.location = 0LL;
      CFArraySortValues(Mutable, v11, (CFComparatorFunction)&_CFStringCompare, 0LL);
    }

    else
    {
      fwrite("ERROR: failed to allocate an array\n", 0x23uLL, 1uLL, __stderrp);
    }
  }

  return Mutable;
}

uint64_t sub_100001D3C(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4)
{
  input[0] = a2;
  input[1] = a4;
  uint32_t outputCnt = 1;
  mach_port_t v4 = *(_DWORD *)(a1 + 20);
  if (!v4) {
    return 5LL;
  }
  uint64_t result = IOConnectCallScalarMethod(v4, 4u, input, 2u, &output, &outputCnt);
  if (!(_DWORD)result) {
    *a3 = output;
  }
  return result;
}

uint64_t sub_100001DCC(uint64_t a1, uint64_t a2, void *outputStruct, size_t a4, uint64_t a5)
{
  input[0] = a2;
  input[1] = a5;
  size_t v7 = a4;
  mach_port_t v5 = *(_DWORD *)(a1 + 20);
  if (v5) {
    return IOConnectCallMethod(v5, 5u, input, 2u, 0LL, 0LL, 0LL, 0LL, outputStruct, &v7);
  }
  else {
    return 5LL;
  }
}

uint64_t sub_100001E50(uint64_t a1, void *outputStruct, size_t a3)
{
  size_t v4 = a3;
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 6u, 0LL, 0, 0LL, 0LL, 0LL, 0LL, outputStruct, &v4);
}

uint64_t sub_100001E98(uint64_t a1, uint64_t *a2)
{
  uint32_t outputCnt = 1;
  mach_port_t v2 = *(_DWORD *)(a1 + 20);
  if (!v2) {
    return 5LL;
  }
  uint64_t result = IOConnectCallScalarMethod(v2, 7u, 0LL, 0, &output, &outputCnt);
  *a2 = output;
  return result;
}

char *sub_100001F20(const __CFDictionary *a1)
{
  mach_port_t v2 = (char *)operator new(0x80uLL);
  *(void *)mach_port_t v2 = 0LL;
  *((void *)v2 + 1) = 0LL;
  *((void *)v2 + 2) = 0LL;
  *((void *)v2 + 3) = @"AP";
  *((_OWORD *)v2 + 2) = 0u;
  *((_OWORD *)v2 + 3) = 0u;
  *((_OWORD *)v2 + 4) = 0u;
  *((void *)v2 + 10) = @"Faulting task stack frame is not available.";
  *(_OWORD *)(v2 + 88) = 0u;
  *(_OWORD *)(v2 + 104) = 0u;
  *((void *)v2 + 15) = 0LL;
  if ((sub_100001FD4((uint64_t)v2, a1) & 1) == 0)
  {
    v3 = (void *)sub_100003128((uint64_t)v2);
    operator delete(v3);
    return 0LL;
  }

  return v2;
}

double sub_100001F9C(uint64_t a1)
{
  *(void *)a1 = 0LL;
  *(void *)(a1 + 8) = 0LL;
  *(void *)(a1 + 16) = 0LL;
  *(void *)(a1 + 24) = @"AP";
  double result = 0.0;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(void *)(a1 + 80) = @"Faulting task stack frame is not available.";
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(void *)(a1 + 120) = 0LL;
  return result;
}

uint64_t sub_100001FD4(uint64_t a1, const __CFDictionary *a2)
{
  CFTypeID TypeID = CFNumberGetTypeID();
  *(void *)a1 = sub_1000025BC(a2, @"assert_id", TypeID);
  CFTypeID v5 = CFNumberGetTypeID();
  *(void *)(a1 + 8) = sub_1000025BC(a2, @"retimer_version", v5);
  CFTypeID v6 = CFStringGetTypeID();
  *(void *)(a1 + 16) = sub_1000025BC(a2, @"instance_name", v6);
  CFTypeID v7 = CFDictionaryGetTypeID();
  uint64_t result = (uint64_t)sub_1000025BC(a2, @"crashlog", v7);
  if (result)
  {
    v9 = (const __CFDictionary *)result;
    CFTypeID v10 = CFArrayGetTypeID();
    uint64_t result = (uint64_t)sub_1000025BC(a2, @"memory_sections", v10);
    if (result)
    {
      uint64_t result = sub_1000025F8((void *)(a1 + 24), v9, (const __CFArray *)result);
      if ((_DWORD)result)
      {
        CFNumberGetValue(*(CFNumberRef *)(a1 + 8), kCFNumberCharType, &valuePtr);
        if (valuePtr != 1) {
          return 1LL;
        }
        CFTypeID v11 = CFDictionaryGetTypeID();
        v12 = (const __CFDictionary *)sub_1000025BC(a2, @"phy_crashlog", v11);
        if (!v12) {
          return 1LL;
        }
        v13 = v12;
        v14 = (char *)operator new(0x60uLL);
        *(void *)v14 = @"PHY";
        *(_OWORD *)(v14 + 8) = 0u;
        *(_OWORD *)(v14 + 24) = 0u;
        *(_OWORD *)(v14 + 40) = 0u;
        *((void *)v14 + 7) = @"Faulting task stack frame is not available.";
        *((_OWORD *)v14 + 4) = 0u;
        *((_OWORD *)v14 + 5) = 0u;
        *(void *)(a1 + 120) = v14;
        CFTypeID v15 = CFArrayGetTypeID();
        v16 = (const __CFArray *)sub_1000025BC(a2, @"phy_memory_sections", v15);
        if (!v16) {
          return 1LL;
        }
        uint64_t result = sub_1000025F8(*(void **)(a1 + 120), v13, v16);
        if ((_DWORD)result) {
          return 1LL;
        }
      }
    }
  }

  return result;
}

double sub_100002154(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = a2;
  double result = 0.0;
  *(_OWORD *)(a1 + 8) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  *(void *)(a1 + 56) = @"Faulting task stack frame is not available.";
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  return result;
}

size_t sub_10000217C(const void *a1, void *a2)
{
  if (!a1 || (CFTypeID v4 = CFGetTypeID(a1), v4 != CFDictionaryGetTypeID()))
  {
    v12 = __stderrp;
    v13 = "Invalid crash log section\n";
    size_t v14 = 26LL;
    return fwrite(v13, v14, 1uLL, v12);
  }

  Value = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)a1, @"section-name");
  if (!Value || (CFTypeID v6 = Value, v7 = CFGetTypeID(Value), v7 != CFStringGetTypeID()))
  {
    v12 = __stderrp;
    v13 = "Invalid crash log section name\n";
    size_t v14 = 31LL;
    return fwrite(v13, v14, 1uLL, v12);
  }

  v8 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)a1, @"section-signature");
  if (!v8 || (v9 = v8, CFTypeID v10 = CFGetTypeID(v8), v10 != CFStringGetTypeID()))
  {
    v12 = __stderrp;
    v13 = "Invalid crash log section signature\n";
    size_t v14 = 36LL;
    return fwrite(v13, v14, 1uLL, v12);
  }

  if (CFStringCompare(v9, @"Cver", 0LL) || CFStringCompare(v6, @"Version Section", 0LL))
  {
    if (CFStringCompare(v9, @"Ctim", 0LL) || CFStringCompare(v6, @"Time Section", 0LL))
    {
      if (CFStringCompare(v9, @"CrgM", 0LL) || CFStringCompare(v6, @"Register Frame Section", 0LL))
      {
        if (CFStringCompare(v9, @"Ccst", 0LL) || CFStringCompare(v6, @"Callstack Section", 0LL))
        {
          size_t result = CFStringCompare(v9, @"Crtk", 0LL);
          if (!result)
          {
            size_t result = CFStringCompare(v6, @"Task List Section", 0LL);
            if (!result)
            {
              size_t result = (size_t)sub_100002464((const __CFDictionary *)a1, @"tasks");
              a2[10] = result;
            }
          }
        }

        else
        {
          a2[9] = sub_100002464((const __CFDictionary *)a1, @"stack");
          size_t result = (size_t)sub_100002410((const __CFDictionary *)a1, @"stack-description");
          a2[8] = result;
        }
      }

      else
      {
        size_t result = (size_t)sub_100002410((const __CFDictionary *)a1, @"registers");
        a2[7] = result;
      }
    }

    else
    {
      size_t result = (size_t)sub_100002410((const __CFDictionary *)a1, @"time");
      a2[6] = result;
    }
  }

  else
  {
    a2[5] = sub_100002410((const __CFDictionary *)a1, @"uuid");
    size_t result = (size_t)sub_100002410((const __CFDictionary *)a1, @"version");
    a2[4] = result;
  }

  return result;
}

CFStringRef sub_100002410(const __CFDictionary *a1, const void *a2)
{
  CFTypeID TypeID = CFStringGetTypeID();
  size_t result = (const __CFString *)sub_1000025BC(a1, a2, TypeID);
  if (result) {
    return CFStringCreateCopy(kCFAllocatorDefault, result);
  }
  return result;
}

CFArrayRef sub_100002464(const __CFDictionary *a1, const void *a2)
{
  CFTypeID TypeID = CFArrayGetTypeID();
  size_t result = (const __CFArray *)sub_1000025BC(a1, a2, TypeID);
  if (result) {
    return CFArrayCreateCopy(kCFAllocatorDefault, result);
  }
  return result;
}

void sub_1000024B8(const __CFDictionary *a1, uint64_t a2)
{
  CFIndex Count = CFDictionaryGetCount(a1);
  MutableCopy = CFDictionaryCreateMutableCopy(kCFAllocatorDefault, Count, a1);
  Value = (const __CFData *)CFDictionaryGetValue(a1, @"data");
  BytePtr = CFDataGetBytePtr(Value);
  Mutable = CFStringCreateMutable(kCFAllocatorDefault, 0LL);
  if (CFDataGetLength(Value) >= 1)
  {
    CFIndex v9 = 0LL;
    do
      CFStringAppendFormat(Mutable, 0LL, @"%02x", BytePtr[v9++]);
    while (v9 < CFDataGetLength(Value));
  }

  CFDictionaryReplaceValue(MutableCopy, @"data", Mutable);
  CFArrayAppendValue(*(CFMutableArrayRef *)(a2 + 88), MutableCopy);
  CFRelease(MutableCopy);
  CFRelease(Mutable);
}

const void *sub_1000025BC(const __CFDictionary *a1, const void *a2, uint64_t a3)
{
  Value = CFDictionaryGetValue(a1, a2);
  if (!Value) {
    return 0LL;
  }
  CFTypeID v5 = Value;
  if (CFGetTypeID(Value) != a3) {
    return 0LL;
  }
  return v5;
}

BOOL sub_1000025F8(void *a1, const __CFDictionary *a2, const __CFArray *a3)
{
  CFTypeID TypeID = CFDataGetTypeID();
  CFTypeID v7 = sub_1000025BC(a2, @"data", TypeID);
  v8 = v7;
  if (v7)
  {
    CFIndex v9 = (const __CFDictionary *)RTBuddyCrashlogDecode(v7);
    if (v9)
    {
      CFTypeID v10 = v9;
      a1[1] = sub_100002410(v9, @"crashlog-version");
      a1[2] = sub_100002410(v10, @"panic");
      a1[3] = sub_100002410(v10, @"exception");
      CFTypeID v11 = CFArrayGetTypeID();
      v12 = (const __CFArray *)sub_1000025BC(v10, @"sections", v11);
      if (v12)
      {
        v13 = v12;
        v17.length = CFArrayGetCount(v12);
        v17.location = 0LL;
        CFArrayApplyFunction(v13, v17, (CFArrayApplierFunction)sub_10000217C, a1);
      }

      CFIndex Count = CFArrayGetCount(a3);
      a1[11] = CFArrayCreateMutable(kCFAllocatorDefault, Count, &kCFTypeArrayCallBacks);
      v18.length = CFArrayGetCount(a3);
      v18.location = 0LL;
      CFArrayApplyFunction(a3, v18, (CFArrayApplierFunction)sub_1000024B8, a1);
      CFRelease(v10);
    }

    else
    {
      CFIndex v15 = CFArrayGetCount(a3);
      a1[11] = CFArrayCreateMutable(kCFAllocatorDefault, v15, &kCFTypeArrayCallBacks);
      v19.length = CFArrayGetCount(a3);
      v19.location = 0LL;
      CFArrayApplyFunction(a3, v19, (CFArrayApplierFunction)sub_1000024B8, a1);
    }
  }

  return v8 != 0LL;
}

CFStringRef sub_100002788(uint64_t a1)
{
  Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 2LL, &kCFTypeArrayCallBacks);
  v3 = sub_100002B14(a1 + 24, *(const void **)(a1 + 16));
  CFArrayAppendValue(Mutable, v3);
  if (v3) {
    CFRelease(v3);
  }
  if (valuePtr == 1)
  {
    uint64_t v4 = *(void *)(a1 + 120);
    if (v4)
    {
      CFTypeID v5 = sub_100002B14(v4, *(const void **)(a1 + 16));
      CFArrayAppendValue(Mutable, v5);
      if (v5) {
        CFRelease(v5);
      }
    }
  }

  sub_10000615C(v19, "log-version", "1.0");
  sub_10000629C(&v20, "accessory_type", "rtm");
  if (valuePtr == 1) {
    CFTypeID v6 = "rtm2,1";
  }
  else {
    CFTypeID v6 = "rtm1,1";
  }
  sub_1000062E4(&v22, "accessory_machine_config", v6);
  if (Mutable) {
    CFRetain(Mutable);
  }
  sub_100003218(cf, Mutable);
  sub_10000632C((uint64_t)v23, "crashlogs", cf);
  __p.__r_.__value_.__r.__words[0] = (std::string::size_type)v19;
  __p.__r_.__value_.__l.__size_ = 4LL;
  CFDictionaryRef v7 = sub_1000032D4((uint64_t)&__p);
  uint64_t v8 = 0LL;
  cf[1] = v7;
  do
  {
    CFIndex v9 = *(const void **)&v23[v8 + 8];
    if (v9) {
      CFRelease(v9);
    }
    CFTypeID v10 = *(const void **)&v23[v8];
    if (v10) {
      CFRelease(v10);
    }
    v8 -= 16LL;
  }

  while (v8 != -64);
  if (cf[0]) {
    CFRelease(cf[0]);
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
  v21 = 0LL;
  sub_10000375C(v7, 0LL, 0LL, (uint64_t)v19, &__p);
  CFTypeID v11 = v21;
  if (v21 == v19)
  {
    uint64_t v12 = 4LL;
    CFTypeID v11 = v19;
  }

  else
  {
    if (!v21) {
      goto LABEL_27;
    }
    uint64_t v12 = 5LL;
  }

  (*((void (**)(void))&(*v11)->isa + v12))();
LABEL_27:
  if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    p_p = &__p;
  }
  else {
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  CFStringRef v14 = CFStringCreateWithCString(kCFAllocatorDefault, (const char *)p_p, 0x8000100u);
  if (((char)__p.__r_.__value_.__s.__size_ & 0x80000000) == 0)
  {
    if (!v7) {
      return v14;
    }
    goto LABEL_34;
  }

  operator delete(__p.__r_.__value_.__l.__data_);
  if (v7) {
LABEL_34:
  }
    CFRelease(v7);
  return v14;
}

void sub_100002A14( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16, int a17, __int16 a18, char a19, char a20, uint64_t a21, char a22, uint64_t a23, uint64_t a24, uint64_t a25)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  sub_10000186C(exception_object);
}

__CFDictionary *sub_100002B14(uint64_t a1, const void *a2)
{
  Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  CFTypeID v5 = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  CFTypeID v6 = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  CFDictionaryRef v7 = v6;
  uint64_t v8 = *(const void **)(a1 + 72);
  if (v8) {
    CFDictionaryAddValue(v6, @"stack", v8);
  }
  CFIndex v9 = *(const void **)(a1 + 64);
  if (v9) {
    CFDictionaryAddValue(v7, @"stack-description", v9);
  }
  if (a2) {
    CFDictionaryAddValue(v5, @"instance_name", a2);
  }
  CFTypeID v10 = *(const void **)(a1 + 16);
  if (v10) {
    CFDictionaryAddValue(v5, @"panic", v10);
  }
  CFTypeID v11 = *(const void **)(a1 + 8);
  if (v11) {
    CFDictionaryAddValue(v5, @"crashlog-version", v11);
  }
  uint64_t v12 = *(const void **)(a1 + 24);
  if (v12) {
    CFDictionaryAddValue(v5, @"exception", v12);
  }
  v13 = *(const void **)(a1 + 32);
  if (v13) {
    CFDictionaryAddValue(v5, @"version", v13);
  }
  CFStringRef v14 = *(const void **)(a1 + 40);
  if (v14) {
    CFDictionaryAddValue(v5, @"uuid", v14);
  }
  if (v7) {
    CFDictionaryAddValue(v5, @"call-stack", v7);
  }
  CFIndex v15 = *(const void **)(a1 + 56);
  if (v15) {
    CFDictionaryAddValue(v5, @"registers", v15);
  }
  v16 = *(const void **)(a1 + 80);
  if (v16) {
    CFDictionaryAddValue(v5, @"tasks", v16);
  }
  if (*(void *)a1) {
    CFDictionaryAddValue(Mutable, @"core", *(const void **)a1);
  }
  if (v5) {
    CFDictionaryAddValue(Mutable, @"crashlog", v5);
  }
  CFRange v17 = *(const void **)(a1 + 88);
  if (v17) {
    CFDictionaryAddValue(Mutable, @"memory-sections", v17);
  }
  if (v5) {
    CFRelease(v5);
  }
  if (v7) {
    CFRelease(v7);
  }
  return Mutable;
}

uint64_t sub_100002D1C(uint64_t a1)
{
  mach_port_t v2 = *(const void **)(a1 + 8);
  if (v2) {
    CFRelease(v2);
  }
  if (*(void *)a1) {
    CFRelease(*(CFTypeRef *)a1);
  }
  return a1;
}

const void **sub_100002D5C(const void **a1)
{
  mach_port_t v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

const void **sub_100002D8C(const void **a1)
{
  mach_port_t v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

__CFString *sub_100002DBC(void *a1)
{
  Mutable = CFStringCreateMutable(kCFAllocatorDefault, 0LL);
  CFStringAppendFormat(Mutable, 0LL, @"%@\n%@\n!UUID: %@\nTime: %@\n\n", a1[5], a1[7], a1[8], a1[9]);
  CFStringAppend(Mutable, @"Faulting task stack frame:\n\n");
  CFStringAppendFormat(Mutable, 0LL, @"%@\n\n", a1[10]);
  CFStringAppendFormat(Mutable, 0LL, @"%@\n", a1[11]);
  CFStringAppend(Mutable, @"    ");
  v3 = (const __CFArray *)a1[12];
  v7.length = CFArrayGetCount(v3);
  v7.location = 0LL;
  CFArrayApplyFunction(v3, v7, (CFArrayApplierFunction)sub_100002F28, Mutable);
  CFStringAppend(Mutable, @"\n\n");
  CFStringAppend(Mutable, @"RTKit Task List:\n\n");
  uint64_t v4 = (const __CFArray *)a1[13];
  v8.length = CFArrayGetCount(v4);
  v8.location = 0LL;
  CFArrayApplyFunction(v4, v8, (CFArrayApplierFunction)sub_100002F58, Mutable);
  CFStringAppend(Mutable, @"Other memory sections:\n\n");
  CFTypeID v5 = (const __CFArray *)a1[14];
  v9.length = CFArrayGetCount(v5);
  v9.location = 0LL;
  CFArrayApplyFunction(v5, v9, (CFArrayApplierFunction)sub_100003018, Mutable);
  return Mutable;
}

void sub_100002F28(uint64_t a1, CFMutableStringRef theString)
{
}

void sub_100002F58(const __CFDictionary *a1, __CFString *a2)
{
  Value = CFDictionaryGetValue(a1, @"description");
  CFTypeID v5 = (const __CFArray *)CFDictionaryGetValue(a1, @"stack");
  CFStringAppendFormat(a2, 0LL, @"%@\n", Value);
  if (v5)
  {
    CFStringAppend(a2, @"    ");
    v6.length = CFArrayGetCount(v5);
    v6.location = 0LL;
    CFArrayApplyFunction(v5, v6, (CFArrayApplierFunction)sub_100002F28, a2);
    CFStringAppend(a2, @"\n");
  }

  CFStringAppend(a2, @"\n");
}

void sub_100003018(const __CFDictionary *a1, __CFString *a2)
{
  Value = (const __CFNumber *)CFDictionaryGetValue(a1, @"id");
  CFTypeID v5 = (const __CFNumber *)CFDictionaryGetValue(a1, @"address");
  CFRange v6 = (const __CFNumber *)CFDictionaryGetValue(a1, @"size");
  CFRange v7 = CFDictionaryGetValue(a1, @"data");
  if (CFNumberGetValue(Value, kCFNumberIntType, &valuePtr))
  {
    if (CFNumberGetValue(v5, kCFNumberIntType, &v9))
    {
      if (CFNumberGetValue(v6, kCFNumberIntType, &v8))
      {
        CFStringAppendFormat(a2, 0LL, @"Section %d: %d bytes at 0x%x\n\n", valuePtr, v8, v9);
        if (v7) {
          CFStringAppendFormat(a2, 0LL, @"%@\n", v7);
        }
      }
    }
  }

  CFStringAppend(a2, @"\n");
}

uint64_t sub_100003128(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 120);
  if (v2)
  {
    v3 = (void *)sub_100003164(v2);
    operator delete(v3);
  }

  sub_100003164(a1 + 24);
  return a1;
}

uint64_t sub_100003164(uint64_t a1)
{
  uint64_t v2 = *(const void **)a1;
  if (v2) {
    CFRelease(v2);
  }
  v3 = *(const void **)(a1 + 8);
  if (v3) {
    CFRelease(v3);
  }
  uint64_t v4 = *(const void **)(a1 + 16);
  if (v4) {
    CFRelease(v4);
  }
  CFTypeID v5 = *(const void **)(a1 + 24);
  if (v5) {
    CFRelease(v5);
  }
  CFRange v6 = *(const void **)(a1 + 32);
  if (v6) {
    CFRelease(v6);
  }
  CFRange v7 = *(const void **)(a1 + 40);
  if (v7) {
    CFRelease(v7);
  }
  unsigned int v8 = *(const void **)(a1 + 48);
  if (v8) {
    CFRelease(v8);
  }
  unsigned int v9 = *(const void **)(a1 + 56);
  if (v9) {
    CFRelease(v9);
  }
  CFTypeID v10 = *(const void **)(a1 + 64);
  if (v10) {
    CFRelease(v10);
  }
  CFTypeID v11 = *(const void **)(a1 + 72);
  if (v11) {
    CFRelease(v11);
  }
  uint64_t v12 = *(const void **)(a1 + 80);
  if (v12) {
    CFRelease(v12);
  }
  v13 = *(const void **)(a1 + 88);
  if (v13) {
    CFRelease(v13);
  }
  return a1;
}

void *sub_100003218(void *a1, CFTypeRef cf)
{
  *a1 = cf;
  if (cf)
  {
    CFTypeID v3 = CFGetTypeID(cf);
    if (v3 != CFArrayGetTypeID())
    {
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(exception, "Could not construct");
    }
  }

  return a1;
}

void sub_100003294(_Unwind_Exception *a1)
{
  if (*v1) {
    CFRelease(*v1);
  }
  _Unwind_Resume(a1);
}

std::runtime_error *sub_1000032C4@<X0>(std::runtime_error *a1@<X8>)
{
  return std::runtime_error::runtime_error(a1, "Could not construct");
}

CFDictionaryRef sub_1000032D4(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 8);
  keys = 0LL;
  v35 = 0LL;
  v36 = 0LL;
  sub_1000035B4((void **)&keys, v2);
  values = 0LL;
  v32 = 0LL;
  v33 = 0LL;
  sub_1000035B4((void **)&values, v2);
  uint64_t v3 = *(void *)(a1 + 8);
  if (v3)
  {
    uint64_t v4 = *(void ***)a1;
    uint64_t v5 = *(void *)a1 + 16 * v3;
    do
    {
      CFRange v6 = *v4;
      CFRange v7 = v35;
      if (v35 >= v36)
      {
        uint64_t v9 = v35 - keys;
        unint64_t v10 = ((char *)v36 - (char *)keys) >> 2;
        if (v10 <= v9 + 1) {
          unint64_t v10 = v9 + 1;
        }
        else {
          unint64_t v11 = v10;
        }
        if (v11) {
          uint64_t v12 = (char *)sub_1000036D0((uint64_t)&v36, v11);
        }
        else {
          uint64_t v12 = 0LL;
        }
        v13 = (void **)&v12[8 * v9];
        const void *v13 = v6;
        unsigned int v8 = v13 + 1;
        CFIndex v15 = keys;
        CFStringRef v14 = v35;
        if (v35 != keys)
        {
          do
          {
            v16 = *--v14;
            *--v13 = v16;
          }

          while (v14 != v15);
          CFStringRef v14 = keys;
        }

        keys = v13;
        v35 = v8;
        v36 = (void **)&v12[8 * v11];
        if (v14) {
          operator delete(v14);
        }
      }

      else
      {
        *v35 = v6;
        unsigned int v8 = v7 + 1;
      }

      v35 = v8;
      CFRange v17 = v4[1];
      CFRange v18 = v32;
      if (v32 >= v33)
      {
        uint64_t v20 = v32 - values;
        unint64_t v21 = ((char *)v33 - (char *)values) >> 2;
        if (v21 <= v20 + 1) {
          unint64_t v21 = v20 + 1;
        }
        else {
          unint64_t v22 = v21;
        }
        if (v22) {
          v23 = (char *)sub_1000036D0((uint64_t)&v33, v22);
        }
        else {
          v23 = 0LL;
        }
        v24 = (void **)&v23[8 * v20];
        *v24 = v17;
        CFRange v19 = v24 + 1;
        v26 = values;
        v25 = v32;
        if (v32 != values)
        {
          do
          {
            v27 = *--v25;
            *--v24 = v27;
          }

          while (v25 != v26);
          v25 = values;
        }

        values = v24;
        v32 = v19;
        v33 = (void **)&v23[8 * v22];
        if (v25) {
          operator delete(v25);
        }
      }

      else
      {
        *v32 = v17;
        CFRange v19 = v18 + 1;
      }

      v32 = v19;
      v4 += 2;
    }

    while (v4 != (void **)v5);
  }

  CFDictionaryRef v28 = CFDictionaryCreate( 0LL,  (const void **)keys,  (const void **)values,  v2,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  if (!v28)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Could not construct");
  }

  if (values)
  {
    v32 = values;
    operator delete(values);
  }

  if (keys)
  {
    v35 = keys;
    operator delete(keys);
  }

  return v28;
}

void sub_10000355C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, void *a12, uint64_t a13)
{
  if (__p) {
    operator delete(__p);
  }
  if (a12) {
    operator delete(a12);
  }
  _Unwind_Resume(a1);
}

void sub_1000035B4(void **a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (_BYTE *)*a1) >> 3)
  {
    if (a2 >> 61) {
      sub_100003648();
    }
    int64_t v5 = (_BYTE *)a1[1] - (_BYTE *)*a1;
    CFRange v6 = (char *)sub_1000036D0(v3, a2);
    CFRange v7 = &v6[v5 & 0xFFFFFFFFFFFFFFF8LL];
    uint64_t v9 = &v6[8 * v8];
    unint64_t v11 = (char *)*a1;
    unint64_t v10 = (char *)a1[1];
    uint64_t v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        uint64_t v13 = *((void *)v10 - 1);
        v10 -= 8;
        *((void *)v12 - 1) = v13;
        v12 -= 8;
      }

      while (v10 != v11);
      unint64_t v10 = (char *)*a1;
    }

    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10) {
      operator delete(v10);
    }
  }
}

void sub_100003648()
{
}

void sub_10000365C(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_1000036AC(exception, a1);
}

void sub_100003698(_Unwind_Exception *a1)
{
}

std::logic_error *sub_1000036AC(std::logic_error *a1, const char *a2)
{
  size_t result = std::logic_error::logic_error(a1, a2);
  return result;
}

void *sub_1000036D0(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    sub_100003704();
  }
  return operator new(8 * a2);
}

void sub_100003704()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

const void **sub_10000372C(const void **a1)
{
  unint64_t v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

void sub_10000375C( CFDictionaryRef theDict@<X0>, size_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, std::string *a5@<X8>)
{
  char v9 = 1;
  a5->__r_.__value_.__s.__size_ = 1;
  LOWORD(a5->__r_.__value_.__l.__data_) = 123;
  size_t v10 = a2 + 2;
  sub_100004D44((uint64_t)&v79, theDict);
  sub_100004D44((uint64_t)&v73, theDict);
  uint64_t v74 = (v76 - (_BYTE *)v75) >> 3;
  while (1)
  {
    if (v79 && v80 != (v82 - v81) >> 3)
    {
      uint64_t v11 = v73;
      goto LABEL_8;
    }

    uint64_t v11 = v73;
    if (!v73 || v74 == (v76 - (_BYTE *)v75) >> 3) {
      break;
    }
LABEL_8:
    if (v79 == v11 && v80 == v74) {
      break;
    }
    if ((v9 & 1) != 0)
    {
      if ((a3 & 1) != 0) {
        goto LABEL_25;
      }
    }

    else
    {
      std::string::append(a5, ",");
      if ((_DWORD)a3)
      {
        std::string::append(a5, " ");
        goto LABEL_25;
      }
    }

    sub_100004EF4(&__b, v10, 32);
    uint64_t v12 = std::string::insert(&__b, 0LL, "\n");
    __int128 v13 = *(_OWORD *)&v12->__r_.__value_.__l.__data_;
    __p.__r_.__value_.__l.__cap_ = v12->__r_.__value_.__l.__cap_;
    *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v13;
    v12->__r_.__value_.__l.__size_ = 0LL;
    v12->__r_.__value_.__l.__cap_ = 0LL;
    v12->__r_.__value_.__r.__words[0] = 0LL;
    if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      p_p = &__p;
    }
    else {
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      std::string::size_type size = __p.__r_.__value_.__s.__size_;
    }
    else {
      std::string::size_type size = __p.__r_.__value_.__l.__size_;
    }
    std::string::append(a5, (const std::string::value_type *)p_p, size);
LABEL_25:
    sub_100004224(&v79, &__p);
    BOOL v17 = 0;
    if (__p.__r_.__value_.__r.__words[0])
    {
      CFTypeID v16 = CFGetTypeID(__p.__r_.__value_.__l.__data_);
      if (v16 == CFStringGetTypeID()) {
        BOOL v17 = 1;
      }
    }

    if (__p.__r_.__value_.__l.__size_) {
      CFRelease((CFTypeRef)__p.__r_.__value_.__l.__size_);
    }
    if (__p.__r_.__value_.__r.__words[0]) {
      CFRelease(__p.__r_.__value_.__l.__data_);
    }
    if (v17)
    {
      sub_100004224(&v79, &cf);
      if (!cf.__r_.__value_.__r.__words[0])
      {
        exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
        std::runtime_error::runtime_error(exception, "Could not construct");
      }

      sub_1000050D4((const __CFString *)cf.__r_.__value_.__l.__data_, (uint64_t)&v70);
      if ((v70.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        CFRange v18 = &v70;
      }
      else {
        CFRange v18 = (std::string *)v70.__r_.__value_.__r.__words[0];
      }
      if ((v70.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        std::string::size_type v19 = v70.__r_.__value_.__s.__size_;
      }
      else {
        std::string::size_type v19 = v70.__r_.__value_.__l.__size_;
      }
      memset(&v71, 0, sizeof(v71));
      for (; v19; --v19)
      {
        int v20 = v18->__r_.__value_.__s.__data_[0];
        if (v20 == 92 || v20 == 34)
        {
          std::string::push_back(&v71, 92);
          LOBYTE(v20) = v18->__r_.__value_.__s.__data_[0];
        }

        std::string::push_back(&v71, v20);
        CFRange v18 = (std::string *)((char *)v18 + 1);
      }

      unint64_t v21 = std::string::insert(&v71, 0LL, "");
      __int128 v22 = *(_OWORD *)&v21->__r_.__value_.__l.__data_;
      __b.__r_.__value_.__l.__cap_ = v21->__r_.__value_.__l.__cap_;
      *(_OWORD *)&__b.__r_.__value_.__l.__data_ = v22;
      v21->__r_.__value_.__l.__size_ = 0LL;
      v21->__r_.__value_.__l.__cap_ = 0LL;
      v21->__r_.__value_.__r.__words[0] = 0LL;
      v23 = std::string::append(&__b, " : ");
      __int128 v24 = *(_OWORD *)&v23->__r_.__value_.__l.__data_;
      __p.__r_.__value_.__l.__cap_ = v23->__r_.__value_.__l.__cap_;
      *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v24;
      v23->__r_.__value_.__l.__size_ = 0LL;
      v23->__r_.__value_.__l.__cap_ = 0LL;
      v23->__r_.__value_.__r.__words[0] = 0LL;
      if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        v25 = &__p;
      }
      else {
        v25 = (std::string *)__p.__r_.__value_.__r.__words[0];
      }
      if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        std::string::size_type v26 = __p.__r_.__value_.__s.__size_;
      }
      else {
        std::string::size_type v26 = __p.__r_.__value_.__l.__size_;
      }
      std::string::append(a5, (const std::string::value_type *)v25, v26);
      if (cf.__r_.__value_.__l.__size_) {
        CFRelease((CFTypeRef)cf.__r_.__value_.__l.__size_);
      }
      if (cf.__r_.__value_.__r.__words[0]) {
        CFRelease(cf.__r_.__value_.__l.__data_);
      }
      sub_100004224(&v79, &__b);
      sub_1000060AC((uint64_t)v85, a4);
      sub_10000434C((const __CFNumber **)&__b.__r_.__value_.__l.__size_, v10, a3, (uint64_t)v85, &__p);
      if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        v27 = &__p;
      }
      else {
        v27 = (std::string *)__p.__r_.__value_.__r.__words[0];
      }
      if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        std::string::size_type v28 = __p.__r_.__value_.__s.__size_;
      }
      else {
        std::string::size_type v28 = __p.__r_.__value_.__l.__size_;
      }
      std::string::append(a5, (const std::string::value_type *)v27, v28);
      v29 = v86;
      if (v86 == v85)
      {
        v29 = v85;
        uint64_t v30 = 4LL;
LABEL_110:
        (*(void (**)(void))(*v29 + 8 * v30))();
      }

      else if (v86)
      {
        uint64_t v30 = 5LL;
        goto LABEL_110;
      }

      if (__b.__r_.__value_.__l.__size_) {
        CFRelease((CFTypeRef)__b.__r_.__value_.__l.__size_);
      }
      if (__b.__r_.__value_.__r.__words[0]) {
        CFRelease(__b.__r_.__value_.__l.__data_);
      }
      goto LABEL_144;
    }

    if (!*(void *)(a4 + 24))
    {
      v59 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(v59, "Error, not a json style CFDictionary");
    }

    sub_100004224(&v79, &__b);
    v31 = (const void *)__b.__r_.__value_.__r.__words[0];
    if (__b.__r_.__value_.__r.__words[0]) {
      CFRetain(__b.__r_.__value_.__l.__data_);
    }
    CFTypeRef v65 = 0LL;
    CFTypeRef v66 = v31;
    uint64_t v32 = *(void *)(a4 + 24);
    if (!v32) {
      sub_100006110();
    }
    (*(void (**)(std::string *__return_ptr, uint64_t, CFTypeRef *, CFTypeRef *))(*(void *)v32 + 48LL))( &__p,  v32,  &v66,  &v65);
    if (v65) {
      CFRelease(v65);
    }
    if (v66) {
      CFRelease(v66);
    }
    if (__b.__r_.__value_.__l.__size_) {
      CFRelease((CFTypeRef)__b.__r_.__value_.__l.__size_);
    }
    if (__b.__r_.__value_.__r.__words[0]) {
      CFRelease(__b.__r_.__value_.__l.__data_);
    }
    if ((char)__p.__r_.__value_.__s.__size_ < 0)
    {
      std::string::size_type v33 = __p.__r_.__value_.__l.__size_;
      if (!__p.__r_.__value_.__l.__size_)
      {
LABEL_167:
        v60 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
        std::runtime_error::runtime_error(v60, "Error, not a json style CFDictionary");
      }

      v34 = (std::string *)__p.__r_.__value_.__r.__words[0];
    }

    else
    {
      std::string::size_type v33 = __p.__r_.__value_.__s.__size_;
      if (!__p.__r_.__value_.__s.__size_) {
        goto LABEL_167;
      }
      v34 = &__p;
    }

    memset(&v63, 0, sizeof(v63));
    do
    {
      int v35 = v34->__r_.__value_.__s.__data_[0];
      if (v35 == 92 || v35 == 34)
      {
        std::string::push_back(&v63, 92);
        LOBYTE(v35) = v34->__r_.__value_.__s.__data_[0];
      }

      std::string::push_back(&v63, v35);
      v34 = (std::string *)((char *)v34 + 1);
      --v33;
    }

    while (v33);
    v36 = std::string::insert(&v63, 0LL, "");
    __int128 v37 = *(_OWORD *)&v36->__r_.__value_.__l.__data_;
    cf.__r_.__value_.__l.__cap_ = v36->__r_.__value_.__l.__cap_;
    *(_OWORD *)&cf.__r_.__value_.__l.__data_ = v37;
    v36->__r_.__value_.__l.__size_ = 0LL;
    v36->__r_.__value_.__l.__cap_ = 0LL;
    v36->__r_.__value_.__r.__words[0] = 0LL;
    v38 = std::string::append(&cf, " : ");
    __int128 v39 = *(_OWORD *)&v38->__r_.__value_.__l.__data_;
    v70.__r_.__value_.__l.__cap_ = v38->__r_.__value_.__l.__cap_;
    *(_OWORD *)&v70.__r_.__value_.__l.__data_ = v39;
    v38->__r_.__value_.__l.__size_ = 0LL;
    v38->__r_.__value_.__l.__cap_ = 0LL;
    v38->__r_.__value_.__r.__words[0] = 0LL;
    if ((v69 & 0x80u) == 0) {
      v40 = v68;
    }
    else {
      v40 = (void **)v68[0];
    }
    if ((v69 & 0x80u) == 0) {
      unint64_t v41 = v69;
    }
    else {
      unint64_t v41 = (unint64_t)v68[1];
    }
    memset(&v62, 0, sizeof(v62));
    if (v41)
    {
      do
      {
        int v42 = *(unsigned __int8 *)v40;
        if (v42 == 92 || v42 == 34)
        {
          std::string::push_back(&v62, 92);
          LOBYTE(v42) = *(_BYTE *)v40;
        }

        std::string::push_back(&v62, v42);
        v40 = (void **)((char *)v40 + 1);
        --v41;
      }

      while (v41);
      std::string::size_type v43 = v62.__r_.__value_.__s.__size_;
      std::string::size_type v44 = v62.__r_.__value_.__l.__size_;
      std::string::size_type v45 = v62.__r_.__value_.__r.__words[0];
    }

    else
    {
      std::string::size_type v44 = 0LL;
      std::string::size_type v45 = 0LL;
      std::string::size_type v43 = 0LL;
    }

    if ((v43 & 0x80u) == 0LL) {
      v46 = &v62;
    }
    else {
      v46 = (std::string *)v45;
    }
    if ((v43 & 0x80u) == 0LL) {
      std::string::size_type v47 = v43;
    }
    else {
      std::string::size_type v47 = v44;
    }
    v48 = std::string::append(&v70, (const std::string::value_type *)v46, v47);
    __int128 v49 = *(_OWORD *)&v48->__r_.__value_.__l.__data_;
    v71.__r_.__value_.__l.__cap_ = v48->__r_.__value_.__l.__cap_;
    *(_OWORD *)&v71.__r_.__value_.__l.__data_ = v49;
    v48->__r_.__value_.__l.__size_ = 0LL;
    v48->__r_.__value_.__l.__cap_ = 0LL;
    v48->__r_.__value_.__r.__words[0] = 0LL;
    v50 = std::string::append(&v71, "");
    __int128 v51 = *(_OWORD *)&v50->__r_.__value_.__l.__data_;
    __b.__r_.__value_.__l.__cap_ = v50->__r_.__value_.__l.__cap_;
    *(_OWORD *)&__b.__r_.__value_.__l.__data_ = v51;
    v50->__r_.__value_.__l.__size_ = 0LL;
    v50->__r_.__value_.__l.__cap_ = 0LL;
    v50->__r_.__value_.__r.__words[0] = 0LL;
    if ((__b.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      p_b = &__b;
    }
    else {
      p_b = (std::string *)__b.__r_.__value_.__r.__words[0];
    }
    if ((__b.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      std::string::size_type v53 = __b.__r_.__value_.__s.__size_;
    }
    else {
      std::string::size_type v53 = __b.__r_.__value_.__l.__size_;
    }
    std::string::append(a5, (const std::string::value_type *)p_b, v53);
LABEL_144:
    char v9 = 0;
    ++v80;
  }

  if ((a3 & 1) == 0)
  {
    sub_100004EF4(&__b, a2, 32);
    v54 = std::string::insert(&__b, 0LL, "\n");
    __int128 v55 = *(_OWORD *)&v54->__r_.__value_.__l.__data_;
    __p.__r_.__value_.__l.__cap_ = v54->__r_.__value_.__l.__cap_;
    *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v55;
    v54->__r_.__value_.__l.__size_ = 0LL;
    v54->__r_.__value_.__l.__cap_ = 0LL;
    v54->__r_.__value_.__r.__words[0] = 0LL;
    if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      v56 = &__p;
    }
    else {
      v56 = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      std::string::size_type v57 = __p.__r_.__value_.__s.__size_;
    }
    else {
      std::string::size_type v57 = __p.__r_.__value_.__l.__size_;
    }
    std::string::append(a5, (const std::string::value_type *)v56, v57);
  }

  std::string::append(a5, "}");
  if (v77)
  {
    v78 = v77;
    operator delete(v77);
  }

  if (v75)
  {
    v76 = v75;
    operator delete(v75);
  }

  if (v83)
  {
    v84 = v83;
    operator delete(v83);
  }

  if (v81)
  {
    v82 = v81;
    operator delete(v81);
  }

void sub_100003FAC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, void *__p, uint64_t a24, int a25, __int16 a26, char a27, char a28, uint64_t a29, uint64_t a30, uint64_t a31, void *a32, uint64_t a33, uint64_t a34, uint64_t a35, void *a36, uint64_t a37, uint64_t a38, uint64_t a39, void *a40, uint64_t a41, int a42, __int16 a43, char a44, char a45, uint64_t a46, uint64_t a47)
{
  if (a28 < 0) {
    operator delete(__p);
  }
  if (a45 < 0) {
    operator delete(a40);
  }
  sub_100004CF0(&a47);
  sub_100004CF0((void *)(v48 - 192));
  _Unwind_Resume(a1);
}

void sub_100004224(void *a1@<X0>, void *a2@<X8>)
{
  if (cf) {
    CFRelease(cf);
  }
  if (v3) {
    CFRelease(v3);
  }
}

uint64_t sub_10000427C(uint64_t a1)
{
  unint64_t v2 = *(const void **)(a1 + 8);
  if (v2) {
    CFRelease(v2);
  }
  if (*(void *)a1) {
    CFRelease(*(CFTypeRef *)a1);
  }
  return a1;
}

void sub_1000042BC(_BYTE *a1@<X0>, uint64_t a2@<X1>, std::string *a3@<X8>)
{
  a3->__r_.__value_.__r.__words[0] = 0LL;
  a3->__r_.__value_.__l.__size_ = 0LL;
  a3->__r_.__value_.__l.__cap_ = 0LL;
  if (a2)
  {
    uint64_t v3 = a2;
    do
    {
      int v6 = *a1;
      if (v6 == 92 || v6 == 34)
      {
        std::string::push_back(a3, 92);
        LOBYTE(v6) = *a1;
      }

      std::string::push_back(a3, v6);
      ++a1;
      --v3;
    }

    while (v3);
  }

void sub_100004330(_Unwind_Exception *exception_object)
{
}

void sub_10000434C( const __CFNumber **a1@<X0>, size_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, std::string *a5@<X8>)
{
  uint64_t v8 = *a1;
  if (!v8) {
    goto LABEL_30;
  }
  CFTypeID v11 = CFGetTypeID(v8);
  CFTypeID TypeID = CFBooleanGetTypeID();
  __int128 v13 = *a1;
  if (v11 == TypeID)
  {
    if (v13)
    {
      if (!sub_1000056C4(v13))
      {
        a5->__r_.__value_.__s.__size_ = 5;
        strcpy((char *)a5, "false");
        return;
      }

      a5->__r_.__value_.__s.__size_ = 4;
      int v14 = 1702195828;
      goto LABEL_39;
    }

    goto LABEL_110;
  }

  if (!v13) {
    goto LABEL_30;
  }
  CFTypeID v15 = CFGetTypeID(v13);
  CFTypeID v16 = CFNumberGetTypeID();
  BOOL v17 = *a1;
  if (v15 == v16)
  {
    if (v17)
    {
      float v18 = sub_10000597C(v17);
      if (vabds_f32(floorf(v18), v18) >= 0.00000011921)
      {
        std::to_string(a5, v18);
        return;
      }

      if (*a1)
      {
        std::string::size_type v19 = sub_100005C98(*a1);
        std::to_string(a5, (uint64_t)v19);
        return;
      }
    }

LABEL_110:
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    sub_1000032C4(exception);
LABEL_111:
  }

  if (!v17) {
    goto LABEL_30;
  }
  CFTypeID v20 = CFGetTypeID(v17);
  if (v20 != CFStringGetTypeID())
  {
    if (*a1)
    {
      CFTypeID v28 = CFGetTypeID(*a1);
      CFTypeID v29 = CFArrayGetTypeID();
      uint64_t v30 = *a1;
      if (v28 == v29)
      {
        sub_1000060AC((uint64_t)v81, a4);
        sub_10000531C(v30, a2, a3, (uint64_t)v81, a5);
        v31 = v82;
        if (v82 == v81)
        {
          uint64_t v32 = 4LL;
          v31 = v81;
          goto LABEL_105;
        }

LABEL_103:
        if (!v31) {
          return;
        }
        uint64_t v32 = 5LL;
LABEL_105:
        (*(void (**)(void))(*(void *)v31 + 8 * v32))();
        return;
      }

      if (v30)
      {
        CFTypeID v64 = CFGetTypeID(*a1);
        CFTypeID v65 = CFDictionaryGetTypeID();
        uint64_t v30 = *a1;
        if (v64 == v65)
        {
          sub_1000060AC((uint64_t)v79, a4);
          sub_10000375C(v30);
          v31 = v80;
          if (v80 == v79)
          {
            uint64_t v32 = 4LL;
            v31 = v79;
            goto LABEL_105;
          }

          goto LABEL_103;
        }
      }

LABEL_31:
      CFTypeID v33 = CFGetTypeID(v30);
      if (v33 == CFNullGetTypeID() || !*a1)
      {
        a5->__r_.__value_.__s.__size_ = 4;
        int v14 = 1819047278;
LABEL_39:
        LODWORD(a5->__r_.__value_.__l.__data_) = v14;
        a5->__r_.__value_.__s.__data_[4] = 0;
        return;
      }

      if (!*(void *)(a4 + 24))
      {
        exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
        std::runtime_error::runtime_error(exception, "Error, not a json style CFDictionary");
        goto LABEL_111;
      }

      std::string v71 = 0LL;
      sub_100004C78(&v70, (CFTypeRef *)a1);
      uint64_t v34 = *(void *)(a4 + 24);
      if (!v34) {
        sub_100006110();
      }
      (*(void (**)(std::string *__return_ptr, uint64_t, const void **, const void **))(*(void *)v34 + 48LL))( &v72,  v34,  &v71,  &v70);
      sub_10000372C(&v70);
      sub_10000372C(&v71);
      if ((char)v72.__r_.__value_.__s.__size_ < 0)
      {
        uint64_t size = v72.__r_.__value_.__l.__size_;
        if (v72.__r_.__value_.__l.__size_)
        {
          v36 = (std::string *)v72.__r_.__value_.__r.__words[0];
          goto LABEL_42;
        }
      }

      else
      {
        uint64_t size = v72.__r_.__value_.__s.__size_;
        if (v72.__r_.__value_.__s.__size_)
        {
          v36 = &v72;
LABEL_42:
          sub_1000042BC(v36, size, &v69);
          __int128 v37 = std::string::insert(&v69, 0LL, "{ ");
          __int128 v38 = *(_OWORD *)&v37->__r_.__value_.__l.__data_;
          v76.__r_.__value_.__l.__cap_ = v37->__r_.__value_.__l.__cap_;
          *(_OWORD *)&v76.__r_.__value_.__l.__data_ = v38;
          v37->__r_.__value_.__l.__size_ = 0LL;
          v37->__r_.__value_.__l.__cap_ = 0LL;
          v37->__r_.__value_.__r.__words[0] = 0LL;
          __int128 v39 = std::string::append(&v76, " : ");
          __int128 v40 = *(_OWORD *)&v39->__r_.__value_.__l.__data_;
          v77.__r_.__value_.__l.__cap_ = v39->__r_.__value_.__l.__cap_;
          *(_OWORD *)&v77.__r_.__value_.__l.__data_ = v40;
          v39->__r_.__value_.__l.__size_ = 0LL;
          v39->__r_.__value_.__l.__cap_ = 0LL;
          v39->__r_.__value_.__r.__words[0] = 0LL;
          if ((v75 & 0x80u) == 0) {
            unint64_t v41 = &v73;
          }
          else {
            unint64_t v41 = v73;
          }
          if ((v75 & 0x80u) == 0) {
            uint64_t v42 = v75;
          }
          else {
            uint64_t v42 = v74;
          }
          sub_1000042BC(v41, v42, &__p);
          if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
            p_p = &__p;
          }
          else {
            p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
          }
          if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
            std::string::size_type v44 = __p.__r_.__value_.__s.__size_;
          }
          else {
            std::string::size_type v44 = __p.__r_.__value_.__l.__size_;
          }
          std::string::size_type v45 = std::string::append(&v77, (const std::string::value_type *)p_p, v44);
          __int128 v46 = *(_OWORD *)&v45->__r_.__value_.__l.__data_;
          v78.__r_.__value_.__l.__cap_ = v45->__r_.__value_.__l.__cap_;
          *(_OWORD *)&v78.__r_.__value_.__l.__data_ = v46;
          v45->__r_.__value_.__l.__size_ = 0LL;
          v45->__r_.__value_.__l.__cap_ = 0LL;
          v45->__r_.__value_.__r.__words[0] = 0LL;
          uint64_t v47 = std::string::append(&v78, " }");
          __int128 v48 = *(_OWORD *)&v47->__r_.__value_.__l.__data_;
          a5->__r_.__value_.__l.__cap_ = v47->__r_.__value_.__l.__cap_;
          *(_OWORD *)&a5->__r_.__value_.__l.__data_ = v48;
          v47->__r_.__value_.__l.__size_ = 0LL;
          v47->__r_.__value_.__l.__cap_ = 0LL;
          v47->__r_.__value_.__r.__words[0] = 0LL;
          __int128 v49 = (void *)v69.__r_.__value_.__r.__words[0];
LABEL_82:
          operator delete(v49);
LABEL_83:
          sub_100004CB0((uint64_t)&v72);
          return;
        }
      }

      v77.__r_.__value_.__s.__size_ = 1;
      LOWORD(v77.__r_.__value_.__l.__data_) = 34;
      if ((v75 & 0x80u) == 0) {
        v50 = &v73;
      }
      else {
        v50 = v73;
      }
      if ((v75 & 0x80u) == 0) {
        uint64_t v51 = v75;
      }
      else {
        uint64_t v51 = v74;
      }
      sub_1000042BC(v50, v51, &v76);
      if ((v76.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        v52 = &v76;
      }
      else {
        v52 = (std::string *)v76.__r_.__value_.__r.__words[0];
      }
      if ((v76.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        std::string::size_type v53 = v76.__r_.__value_.__s.__size_;
      }
      else {
        std::string::size_type v53 = v76.__r_.__value_.__l.__size_;
      }
      v54 = std::string::append(&v77, (const std::string::value_type *)v52, v53);
      __int128 v55 = *(_OWORD *)&v54->__r_.__value_.__l.__data_;
      v78.__r_.__value_.__l.__cap_ = v54->__r_.__value_.__l.__cap_;
      *(_OWORD *)&v78.__r_.__value_.__l.__data_ = v55;
      v54->__r_.__value_.__l.__size_ = 0LL;
      v54->__r_.__value_.__l.__cap_ = 0LL;
      v54->__r_.__value_.__r.__words[0] = 0LL;
      v56 = std::string::append(&v78, "");
      __int128 v57 = *(_OWORD *)&v56->__r_.__value_.__l.__data_;
      a5->__r_.__value_.__l.__cap_ = v56->__r_.__value_.__l.__cap_;
      *(_OWORD *)&a5->__r_.__value_.__l.__data_ = v57;
      v56->__r_.__value_.__l.__size_ = 0LL;
      v56->__r_.__value_.__l.__cap_ = 0LL;
      v56->__r_.__value_.__r.__words[0] = 0LL;
      __int128 v49 = (void *)v77.__r_.__value_.__r.__words[0];
      goto LABEL_82;
    }

LABEL_30:
    uint64_t v30 = 0LL;
    goto LABEL_31;
  }

  v78.__r_.__value_.__s.__size_ = 1;
  LOWORD(v78.__r_.__value_.__l.__data_) = 34;
  unint64_t v21 = *a1;
  if (!*a1)
  {
    v67 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(v67, "Could not construct");
  }

  __int128 v22 = &v76;
  sub_1000050D4((const __CFString *)v21, (uint64_t)&v76);
  if ((v76.__r_.__value_.__s.__size_ & 0x80u) == 0)
  {
    std::string::size_type v23 = v76.__r_.__value_.__s.__size_;
  }

  else
  {
    std::string::size_type v23 = v76.__r_.__value_.__l.__size_;
    __int128 v22 = (std::string *)v76.__r_.__value_.__r.__words[0];
  }

  memset(&v77, 0, sizeof(v77));
  if (v23)
  {
    do
    {
      int v24 = v22->__r_.__value_.__s.__data_[0];
      if (v24 == 92 || v24 == 34)
      {
        std::string::push_back(&v77, 92);
        LOBYTE(v24) = v22->__r_.__value_.__s.__data_[0];
      }

      std::string::push_back(&v77, v24);
      __int128 v22 = (std::string *)((char *)v22 + 1);
      --v23;
    }

    while (v23);
    unsigned int v25 = v77.__r_.__value_.__s.__size_;
    std::string::size_type v26 = v77.__r_.__value_.__l.__size_;
    std::string::size_type v27 = v77.__r_.__value_.__r.__words[0];
  }

  else
  {
    std::string::size_type v26 = 0LL;
    std::string::size_type v27 = 0LL;
    unsigned int v25 = 0;
  }

  if ((v25 & 0x80u) == 0) {
    v58 = &v77;
  }
  else {
    v58 = (std::string *)v27;
  }
  if ((v25 & 0x80u) == 0) {
    std::string::size_type v59 = v25;
  }
  else {
    std::string::size_type v59 = v26;
  }
  v60 = std::string::append(&v78, (const std::string::value_type *)v58, v59);
  __int128 v61 = *(_OWORD *)&v60->__r_.__value_.__l.__data_;
  v72.__r_.__value_.__l.__cap_ = v60->__r_.__value_.__l.__cap_;
  *(_OWORD *)&v72.__r_.__value_.__l.__data_ = v61;
  v60->__r_.__value_.__l.__size_ = 0LL;
  v60->__r_.__value_.__l.__cap_ = 0LL;
  v60->__r_.__value_.__r.__words[0] = 0LL;
  std::string v62 = std::string::append(&v72, "");
  __int128 v63 = *(_OWORD *)&v62->__r_.__value_.__l.__data_;
  a5->__r_.__value_.__l.__cap_ = v62->__r_.__value_.__l.__cap_;
  *(_OWORD *)&a5->__r_.__value_.__l.__data_ = v63;
  v62->__r_.__value_.__l.__size_ = 0LL;
  v62->__r_.__value_.__l.__cap_ = 0LL;
  v62->__r_.__value_.__r.__words[0] = 0LL;
}

void sub_100004A7C( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, int a17, __int16 a18, char a19, char a20, char a21, int a22, __int16 a23, char a24, char a25, void *__p, uint64_t a27, int a28, __int16 a29, char a30, char a31, uint64_t a32, uint64_t a33, uint64_t a34, void *a35, uint64_t a36, int a37, __int16 a38, char a39, char a40, uint64_t a41, void *a42, uint64_t a43, int a44, __int16 a45, char a46, char a47)
{
  v50 = *(void **)(v48 - 112);
  if (v50 == v47)
  {
    uint64_t v51 = 4LL;
    v50 = (void *)(v48 - 136);
  }

  else
  {
    if (!v50) {
      goto LABEL_6;
    }
    uint64_t v51 = 5LL;
  }

  (*(void (**)(void))(*v50 + 8 * v51))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

void *sub_100004C78(void *a1, CFTypeRef *a2)
{
  CFTypeRef v3 = *a2;
  if (*a2) {
    CFRetain(*a2);
  }
  *a1 = v3;
  return a1;
}

uint64_t sub_100004CB0(uint64_t a1)
{
  return a1;
}

void *sub_100004CF0(void *a1)
{
  unint64_t v2 = (void *)a1[5];
  if (v2)
  {
    a1[6] = v2;
    operator delete(v2);
  }

  CFTypeRef v3 = (void *)a1[2];
  if (v3)
  {
    a1[3] = v3;
    operator delete(v3);
  }

  return a1;
}

void sub_100004D30()
{
}

uint64_t sub_100004D44(uint64_t a1, CFDictionaryRef theDict)
{
  *(void *)a1 = theDict;
  *(_OWORD *)(a1 + 40) = 0u;
  uint64_t v3 = a1 + 40;
  *(_OWORD *)(a1 + 8) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  *(void *)(a1 + 56) = 0LL;
  if (theDict)
  {
    CFIndex Count = CFDictionaryGetCount(theDict);
    sub_100004DC4(a1 + 16, Count);
    sub_100004DC4(v3, Count);
    CFDictionaryGetKeysAndValues(*(CFDictionaryRef *)a1, *(const void ***)(a1 + 16), *(const void ***)(a1 + 40));
  }

  return a1;
}

void sub_100004DC4(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = (uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 3;
  if (a2 <= v2)
  {
    if (a2 < v2) {
      *(void *)(a1 + 8) = *(void *)a1 + 8 * a2;
    }
  }

  else
  {
    sub_100004DF4((void **)a1, a2 - v2);
  }

void sub_100004DF4(void **a1, unint64_t a2)
{
  int v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  int64_t v5 = v6;
  CFRange v7 = *(char **)(v4 - 8);
  if (a2 <= (v6 - v7) >> 3)
  {
    if (a2)
    {
      bzero(*(void **)(v4 - 8), 8 * a2);
      v7 += 8 * a2;
    }

    a1[1] = v7;
  }

  else
  {
    uint64_t v8 = v7 - (_BYTE *)*a1;
    unint64_t v9 = a2 + (v8 >> 3);
    if (v9 >> 61) {
      sub_100003648();
    }
    uint64_t v10 = v8 >> 3;
    uint64_t v11 = v5 - (_BYTE *)*a1;
    if (v11 >> 2 > v9) {
      unint64_t v9 = v11 >> 2;
    }
    else {
      unint64_t v12 = v9;
    }
    if (v12) {
      __int128 v13 = (char *)sub_1000036D0(v4, v12);
    }
    else {
      __int128 v13 = 0LL;
    }
    int v14 = &v13[8 * v10];
    CFTypeID v15 = &v13[8 * v12];
    bzero(v14, 8 * a2);
    CFTypeID v16 = &v14[8 * a2];
    float v18 = (char *)*a1;
    BOOL v17 = (char *)a1[1];
    if (v17 != *a1)
    {
      do
      {
        uint64_t v19 = *((void *)v17 - 1);
        v17 -= 8;
        *((void *)v14 - 1) = v19;
        v14 -= 8;
      }

      while (v17 != v18);
      BOOL v17 = (char *)*a1;
    }

    *a1 = v14;
    a1[1] = v16;
    a1[2] = v15;
    if (v17) {
      operator delete(v17);
    }
  }

void *sub_100004EF4(void *__b, size_t __len, int __c)
{
  if (__len >= 0x7FFFFFFFFFFFFFF8LL) {
    sub_100004D30();
  }
  if (__len >= 0x17)
  {
    size_t v7 = (__len & 0xFFFFFFFFFFFFFFF8LL) + 8;
    if ((__len | 7) != 0x17) {
      size_t v7 = __len | 7;
    }
    size_t v8 = v7 + 1;
    int v6 = operator new(v7 + 1);
    __b[1] = __len;
    __b[2] = v8 | 0x8000000000000000LL;
    *std::string __b = v6;
  }

  else
  {
    *((_BYTE *)__b + 23) = __len;
    int v6 = __b;
    if (!__len) {
      goto LABEL_9;
    }
  }

  memset(v6, __c, __len);
LABEL_9:
  *((_BYTE *)v6 + __len) = 0;
  return __b;
}

void *sub_100004F9C@<X0>(void *result@<X0>, void *a2@<X8>)
{
  unint64_t v3 = result[1];
  if ((v3 & 0x8000000000000000LL) != 0 || (uint64_t v4 = result, v5 = result[2], v3 >= (result[3] - v5) >> 3))
  {
    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    sub_100005054(exception, "DictionaryRef_iterator iterator out of range.");
  }

  uint64_t v6 = *(void *)(v5 + 8 * v3);
  if (v6)
  {
    size_t result = CFRetain(*(CFTypeRef *)(v5 + 8 * v3));
    unint64_t v3 = v4[1];
  }

  uint64_t v7 = v4[5];
  uint64_t v8 = *(void *)(v7 + 8 * v3);
  if (v8) {
    size_t result = CFRetain(*(CFTypeRef *)(v7 + 8 * v3));
  }
  *a2 = v6;
  a2[1] = v8;
  return result;
}

void sub_100005040(_Unwind_Exception *a1)
{
}

std::logic_error *sub_100005054(std::logic_error *a1, const char *a2)
{
  size_t result = std::logic_error::logic_error(a1, a2);
  return result;
}

void *sub_100005078(void *a1, uint64_t a2)
{
  CFTypeRef v4 = *(CFTypeRef *)a2;
  if (*(void *)a2) {
    CFRetain(*(CFTypeRef *)a2);
  }
  *a1 = v4;
  uint64_t v5 = *(const void **)(a2 + 8);
  if (v5) {
    CFRetain(v5);
  }
  a1[1] = v5;
  return a1;
}

void *sub_1000050D4@<X0>(const __CFString *a1@<X0>, uint64_t a2@<X8>)
{
  if (!a1 || (CFTypeID TypeID = CFStringGetTypeID(), TypeID != CFGetTypeID(a1)))
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    sub_100005160(exception);
  }

  return sub_100005170(a1, a2);
}

void sub_10000514C(_Unwind_Exception *a1)
{
}

std::runtime_error *sub_100005160@<X0>(std::runtime_error *a1@<X8>)
{
  return std::runtime_error::runtime_error(a1, "Could not convert");
}

void *sub_100005170@<X0>(const __CFString *a1@<X0>, uint64_t a2@<X8>)
{
  CStringPtr = (char *)CFStringGetCStringPtr(a1, 0x8000100u);
  if (CStringPtr) {
    return sub_10000526C((void *)a2, CStringPtr);
  }
  CFIndex Length = CFStringGetLength(a1);
  CFIndex maxBufLen = 0LL;
  v9.location = 0LL;
  v9.length = Length;
  CFStringGetBytes(a1, v9, 0x8000100u, 0, 0, 0LL, 0LL, &maxBufLen);
  sub_100004EF4((void *)a2, maxBufLen, 0);
  else {
    uint64_t v7 = *(UInt8 **)a2;
  }
  v10.location = 0LL;
  v10.length = Length;
  return (void *)CFStringGetBytes(a1, v10, 0x8000100u, 0, 0, v7, maxBufLen, &maxBufLen);
}

void sub_100005250(_Unwind_Exception *exception_object)
{
}

void *sub_10000526C(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8LL) {
    sub_100004D30();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8LL) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    uint64_t v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000LL;
    *a1 = v6;
  }

  else
  {
    *((_BYTE *)a1 + 23) = v4;
    uint64_t v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }

  memmove(v6, __s, v5);
LABEL_9:
  *((_BYTE *)v6 + v5) = 0;
  return a1;
}

std::string *sub_10000531C@<X0>( const __CFArray *a1@<X0>, size_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, std::string *a5@<X8>)
{
  a5->__r_.__value_.__s.__size_ = 1;
  LOWORD(a5->__r_.__value_.__l.__data_) = 91;
  if (a1)
  {
    CFIndex Count = CFArrayGetCount(a1);
    CFIndex v10 = CFArrayGetCount(a1);
    if (Count)
    {
      if (v10)
      {
        unint64_t v11 = 0LL;
        size_t v12 = a2 + 2;
        CFIndex v13 = v10 - 1;
        char v14 = 1;
        while (1)
        {
          if ((v14 & 1) != 0)
          {
            if ((a3 & 1) != 0) {
              goto LABEL_20;
            }
          }

          else
          {
            std::string::append(a5, ",");
            if ((_DWORD)a3)
            {
              std::string::append(a5, " ");
              goto LABEL_20;
            }
          }

          sub_100004EF4(&__b, v12, 32);
          CFTypeID v15 = std::string::insert(&__b, 0LL, "\n");
          __int128 v16 = *(_OWORD *)&v15->__r_.__value_.__l.__data_;
          int64_t cap = v15->__r_.__value_.__l.__cap_;
          *(_OWORD *)std::string __p = v16;
          v15->__r_.__value_.__l.__size_ = 0LL;
          v15->__r_.__value_.__l.__cap_ = 0LL;
          v15->__r_.__value_.__r.__words[0] = 0LL;
          if (cap >= 0) {
            BOOL v17 = __p;
          }
          else {
            BOOL v17 = (void **)__p[0];
          }
          if (cap >= 0) {
            std::string::size_type v18 = HIBYTE(cap);
          }
          else {
            std::string::size_type v18 = (std::string::size_type)__p[1];
          }
          std::string::append(a5, (const std::string::value_type *)v17, v18);
          if (SHIBYTE(cap) < 0) {
            operator delete(__p[0]);
          }
LABEL_20:
          sub_100005FF4(a1, v11, &__b);
          sub_1000060AC((uint64_t)v33, a4);
          sub_10000434C(__p, &__b, v12, a3, v33);
          if (cap >= 0) {
            uint64_t v19 = __p;
          }
          else {
            uint64_t v19 = (void **)__p[0];
          }
          if (cap >= 0) {
            std::string::size_type v20 = HIBYTE(cap);
          }
          else {
            std::string::size_type v20 = (std::string::size_type)__p[1];
          }
          std::string::append(a5, (const std::string::value_type *)v19, v20);
          if (SHIBYTE(cap) < 0) {
            operator delete(__p[0]);
          }
          unint64_t v21 = v34;
          if (v34 == v33)
          {
            unint64_t v21 = v33;
            uint64_t v22 = 4LL;
            goto LABEL_32;
          }

          if (v34)
          {
            uint64_t v22 = 5LL;
LABEL_32:
            (*(void (**)(void))(*v21 + 8 * v22))();
          }

          if (__b.__r_.__value_.__r.__words[0]) {
            CFRelease(__b.__r_.__value_.__l.__data_);
          }
          if (Count - 1 != v11)
          {
            char v14 = 0;
            if (v13 != v11++) {
              continue;
            }
          }

          break;
        }
      }
    }
  }

  if ((a3 & 1) == 0)
  {
    sub_100004EF4(&__b, a2, 32);
    int v24 = std::string::insert(&__b, 0LL, "\n");
    __int128 v25 = *(_OWORD *)&v24->__r_.__value_.__l.__data_;
    int64_t cap = v24->__r_.__value_.__l.__cap_;
    *(_OWORD *)std::string __p = v25;
    v24->__r_.__value_.__l.__size_ = 0LL;
    v24->__r_.__value_.__l.__cap_ = 0LL;
    v24->__r_.__value_.__r.__words[0] = 0LL;
    if (cap >= 0) {
      std::string::size_type v26 = __p;
    }
    else {
      std::string::size_type v26 = (void **)__p[0];
    }
    if (cap >= 0) {
      std::string::size_type v27 = HIBYTE(cap);
    }
    else {
      std::string::size_type v27 = (std::string::size_type)__p[1];
    }
    std::string::append(a5, (const std::string::value_type *)v26, v27);
    if (SHIBYTE(cap) < 0) {
      operator delete(__p[0]);
    }
  }

  return std::string::append(a5, "]");
}

void sub_1000055E8( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20, char a21, char a22, uint64_t a23, uint64_t a24, uint64_t a25)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  if (a15 < 0) {
    operator delete(a10);
  }
  _Unwind_Resume(exception_object);
}

BOOL sub_1000056C4(const __CFNumber *a1)
{
  if (!a1) {
    goto LABEL_8;
  }
  CFTypeID TypeID = CFBooleanGetTypeID();
  if (TypeID != CFGetTypeID(a1))
  {
    CFTypeID v4 = CFNumberGetTypeID();
    if (v4 == CFGetTypeID(a1))
    {
      LOWORD(Value) = sub_100005780(a1);
      if ((unsigned __int16)Value > 0xFFu)
      {
        int Value = Value;
        return Value != 0;
      }
    }

LABEL_8:
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    sub_100005160(exception);
  }

  int Value = CFBooleanGetValue(a1);
  return Value != 0;
}

void sub_10000576C(_Unwind_Exception *a1)
{
}

uint64_t sub_100005780(const __CFNumber *a1)
{
  switch(CFNumberGetType(a1))
  {
    case kCFNumberSInt8Type:
      LOBYTE(valuePtr) = 0;
      unint64_t v2 = a1;
      CFNumberType v3 = kCFNumberSInt8Type;
      goto LABEL_10;
    case kCFNumberSInt16Type:
      LOWORD(valuePtr) = 0;
      size_t v5 = a1;
      CFNumberType v6 = kCFNumberSInt16Type;
      goto LABEL_12;
    case kCFNumberSInt32Type:
      LODWORD(valuePtr) = 0;
      uint64_t v7 = a1;
      CFNumberType v8 = kCFNumberSInt32Type;
      goto LABEL_14;
    case kCFNumberSInt64Type:
      double valuePtr = 0.0;
      CFRange v9 = a1;
      CFNumberType v10 = kCFNumberSInt64Type;
      goto LABEL_25;
    case kCFNumberFloat32Type:
      LODWORD(valuePtr) = 0;
      unint64_t v11 = a1;
      CFNumberType v12 = kCFNumberFloat32Type;
      goto LABEL_21;
    case kCFNumberFloat64Type:
      double valuePtr = 0.0;
      CFIndex v13 = a1;
      CFNumberType v14 = kCFNumberFloat64Type;
      goto LABEL_29;
    case kCFNumberCharType:
      LOBYTE(valuePtr) = 0;
      unint64_t v2 = a1;
      CFNumberType v3 = kCFNumberCharType;
LABEL_10:
      int Value = CFNumberGetValue(v2, v3, &valuePtr);
      BOOL v16 = Value == 0;
      int v17 = LOBYTE(valuePtr);
      goto LABEL_15;
    case kCFNumberShortType:
      LOWORD(valuePtr) = 0;
      size_t v5 = a1;
      CFNumberType v6 = kCFNumberShortType;
LABEL_12:
      int Value = CFNumberGetValue(v5, v6, &valuePtr);
      BOOL v16 = Value == 0;
      int v17 = LOWORD(valuePtr);
      goto LABEL_15;
    case kCFNumberIntType:
      LODWORD(valuePtr) = 0;
      uint64_t v7 = a1;
      CFNumberType v8 = kCFNumberIntType;
LABEL_14:
      int Value = CFNumberGetValue(v7, v8, &valuePtr);
      BOOL v16 = Value == 0;
      int v17 = LODWORD(valuePtr);
LABEL_15:
      BOOL v18 = v16 || v17 == 0;
      goto LABEL_33;
    case kCFNumberLongType:
      double valuePtr = 0.0;
      CFRange v9 = a1;
      CFNumberType v10 = kCFNumberLongType;
      goto LABEL_25;
    case kCFNumberLongLongType:
      double valuePtr = 0.0;
      CFRange v9 = a1;
      CFNumberType v10 = kCFNumberLongLongType;
      goto LABEL_25;
    case kCFNumberFloatType:
      LODWORD(valuePtr) = 0;
      unint64_t v11 = a1;
      CFNumberType v12 = kCFNumberFloatType;
LABEL_21:
      int Value = CFNumberGetValue(v11, v12, &valuePtr);
      BOOL v19 = *(float *)&valuePtr == 0.0;
      goto LABEL_30;
    case kCFNumberDoubleType:
      double valuePtr = 0.0;
      CFIndex v13 = a1;
      CFNumberType v14 = kCFNumberDoubleType;
      goto LABEL_29;
    case kCFNumberCFIndexType:
      double valuePtr = 0.0;
      CFRange v9 = a1;
      CFNumberType v10 = kCFNumberCFIndexType;
      goto LABEL_25;
    case kCFNumberNSIntegerType:
      double valuePtr = 0.0;
      CFRange v9 = a1;
      CFNumberType v10 = kCFNumberNSIntegerType;
LABEL_25:
      int Value = CFNumberGetValue(v9, v10, &valuePtr);
      if (Value) {
        BOOL v18 = *(void *)&valuePtr == 0LL;
      }
      else {
        BOOL v18 = 1;
      }
      goto LABEL_33;
    case kCFNumberCGFloatType:
      double valuePtr = 0.0;
      CFIndex v13 = a1;
      CFNumberType v14 = kCFNumberCGFloatType;
LABEL_29:
      int Value = CFNumberGetValue(v13, v14, &valuePtr);
      BOOL v19 = valuePtr == 0.0;
LABEL_30:
      BOOL v18 = v19 || Value == 0;
LABEL_33:
      int v4 = !v18;
      if (!Value) {
        goto LABEL_38;
      }
      int v20 = 256;
      break;
    default:
      int v4 = 0;
LABEL_38:
      int v20 = 0;
      break;
  }

  return v20 | v4;
}

float sub_10000597C(const __CFNumber *a1)
{
  unint64_t v1 = sub_1000059E4(a1);
  if ((v1 & 0xFF00000000LL) == 0)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    sub_100005160(exception);
  }

  return *(float *)&v1;
}

void sub_1000059D0(_Unwind_Exception *a1)
{
}

unint64_t sub_1000059E4(const __CFNumber *a1)
{
  if (a1 && (CFTypeID TypeID = CFNumberGetTypeID(), TypeID == CFGetTypeID(a1))) {
    return sub_100005A98(a1);
  }
  else {
    return sub_100005A38(a1);
  }
}

unint64_t sub_100005A38(const __CFBoolean *a1)
{
  if (a1 && (CFTypeID TypeID = CFBooleanGetTypeID(), TypeID == CFGetTypeID(a1)))
  {
    uint64_t v3 = COERCE_UNSIGNED_INT((float)CFBooleanGetValue(a1));
    int v4 = &_mh_execute_header;
  }

  else
  {
    int v4 = 0LL;
    uint64_t v3 = 0LL;
  }

  return v3 | (unint64_t)v4;
}

unint64_t sub_100005A98(const __CFNumber *a1)
{
  switch(CFNumberGetType(a1))
  {
    case kCFNumberSInt8Type:
      LOBYTE(valuePtr) = 0;
      unint64_t v2 = a1;
      CFNumberType v3 = kCFNumberSInt8Type;
      goto LABEL_10;
    case kCFNumberSInt16Type:
      LOWORD(valuePtr) = 0;
      uint64_t v7 = a1;
      CFNumberType v8 = kCFNumberSInt16Type;
      goto LABEL_12;
    case kCFNumberSInt32Type:
      LODWORD(valuePtr) = 0;
      CFRange v9 = a1;
      CFNumberType v10 = kCFNumberSInt32Type;
      goto LABEL_15;
    case kCFNumberSInt64Type:
      double valuePtr = 0.0;
      unint64_t v11 = a1;
      CFNumberType v12 = kCFNumberSInt64Type;
      goto LABEL_23;
    case kCFNumberFloat32Type:
      LODWORD(valuePtr) = 0;
      CFIndex v13 = a1;
      CFNumberType v14 = kCFNumberFloat32Type;
      goto LABEL_19;
    case kCFNumberFloat64Type:
      double valuePtr = 0.0;
      CFTypeID v15 = a1;
      CFNumberType v16 = kCFNumberFloat64Type;
      goto LABEL_25;
    case kCFNumberCharType:
      LOBYTE(valuePtr) = 0;
      unint64_t v2 = a1;
      CFNumberType v3 = kCFNumberCharType;
LABEL_10:
      int Value = CFNumberGetValue(v2, v3, &valuePtr);
      int v18 = SLOBYTE(valuePtr);
      goto LABEL_13;
    case kCFNumberShortType:
      LOWORD(valuePtr) = 0;
      uint64_t v7 = a1;
      CFNumberType v8 = kCFNumberShortType;
LABEL_12:
      int Value = CFNumberGetValue(v7, v8, &valuePtr);
      int v18 = SLOWORD(valuePtr);
LABEL_13:
      float v19 = (float)v18;
      goto LABEL_26;
    case kCFNumberIntType:
      LODWORD(valuePtr) = 0;
      CFRange v9 = a1;
      CFNumberType v10 = kCFNumberIntType;
LABEL_15:
      int Value = CFNumberGetValue(v9, v10, &valuePtr);
      float v19 = (float)SLODWORD(valuePtr);
      goto LABEL_26;
    case kCFNumberLongType:
      double valuePtr = 0.0;
      unint64_t v11 = a1;
      CFNumberType v12 = kCFNumberLongType;
      goto LABEL_23;
    case kCFNumberLongLongType:
      double valuePtr = 0.0;
      unint64_t v11 = a1;
      CFNumberType v12 = kCFNumberLongLongType;
      goto LABEL_23;
    case kCFNumberFloatType:
      LODWORD(valuePtr) = 0;
      CFIndex v13 = a1;
      CFNumberType v14 = kCFNumberFloatType;
LABEL_19:
      int Value = CFNumberGetValue(v13, v14, &valuePtr);
      uint64_t v20 = LODWORD(valuePtr);
      goto LABEL_27;
    case kCFNumberDoubleType:
      double valuePtr = 0.0;
      CFTypeID v15 = a1;
      CFNumberType v16 = kCFNumberDoubleType;
      goto LABEL_25;
    case kCFNumberCFIndexType:
      double valuePtr = 0.0;
      unint64_t v11 = a1;
      CFNumberType v12 = kCFNumberCFIndexType;
      goto LABEL_23;
    case kCFNumberNSIntegerType:
      double valuePtr = 0.0;
      unint64_t v11 = a1;
      CFNumberType v12 = kCFNumberNSIntegerType;
LABEL_23:
      int Value = CFNumberGetValue(v11, v12, &valuePtr);
      float v19 = (float)*(uint64_t *)&valuePtr;
      goto LABEL_26;
    case kCFNumberCGFloatType:
      double valuePtr = 0.0;
      CFTypeID v15 = a1;
      CFNumberType v16 = kCFNumberCGFloatType;
LABEL_25:
      int Value = CFNumberGetValue(v15, v16, &valuePtr);
      float v19 = valuePtr;
LABEL_26:
      uint64_t v20 = LODWORD(v19);
LABEL_27:
      unint64_t v6 = v20 | (unint64_t)&_mh_execute_header;
      if (!Value) {
        unint64_t v6 = 0LL;
      }
      int v4 = v6 & 0xFFFFFF00;
      unint64_t v5 = v6 & (unint64_t)&_mh_execute_header;
      break;
    default:
      int v4 = 0;
      unint64_t v5 = 0LL;
      LOBYTE(v6) = 0;
      break;
  }

  return v5 | v4 & 0xFFFFFF00 | v6;
}

CFBooleanRef sub_100005C98(const __CFNumber *a1)
{
  size_t result = sub_100005CFC(a1);
  if (!v2)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    sub_100005160(exception);
  }

  return result;
}

void sub_100005CE8(_Unwind_Exception *a1)
{
}

CFBooleanRef sub_100005CFC(const __CFNumber *a1)
{
  if (a1 && (CFTypeID TypeID = CFNumberGetTypeID(), TypeID == CFGetTypeID(a1))) {
    return (const __CFBoolean *)sub_100005DB0(a1);
  }
  else {
    return sub_100005D50(a1);
  }
}

CFBooleanRef sub_100005D50(const __CFBoolean *result)
{
  if (result)
  {
    unint64_t v1 = result;
    CFTypeID TypeID = CFBooleanGetTypeID();
    if (TypeID == CFGetTypeID(v1)) {
      return (const __CFBoolean *)CFBooleanGetValue(v1);
    }
    else {
      return 0LL;
    }
  }

  return result;
}

unint64_t sub_100005DB0(const __CFNumber *a1)
{
  switch(CFNumberGetType(a1))
  {
    case kCFNumberSInt8Type:
      LOBYTE(valuePtr) = 0;
      char v2 = a1;
      CFNumberType v3 = kCFNumberSInt8Type;
      goto LABEL_10;
    case kCFNumberSInt16Type:
      LOWORD(valuePtr) = 0;
      unint64_t v6 = a1;
      CFNumberType v7 = kCFNumberSInt16Type;
      goto LABEL_18;
    case kCFNumberSInt32Type:
      LODWORD(valuePtr) = 0;
      CFNumberType v8 = a1;
      CFNumberType v9 = kCFNumberSInt32Type;
      goto LABEL_20;
    case kCFNumberSInt64Type:
      double valuePtr = 0.0;
      CFNumberType v10 = a1;
      CFNumberType v11 = kCFNumberSInt64Type;
      goto LABEL_31;
    case kCFNumberFloat32Type:
      LODWORD(valuePtr) = 0;
      CFNumberType v12 = a1;
      CFNumberType v13 = kCFNumberFloat32Type;
      goto LABEL_27;
    case kCFNumberFloat64Type:
      double valuePtr = 0.0;
      CFNumberType v14 = a1;
      CFNumberType v15 = kCFNumberFloat64Type;
      goto LABEL_33;
    case kCFNumberCharType:
      LOBYTE(valuePtr) = 0;
      char v2 = a1;
      CFNumberType v3 = kCFNumberCharType;
LABEL_10:
      int Value = CFNumberGetValue(v2, v3, &valuePtr);
      if (Value) {
        char v17 = LOBYTE(valuePtr);
      }
      else {
        char v17 = 0;
      }
      if (Value != 0 && SLOBYTE(valuePtr) < 0) {
        unint64_t v4 = -256LL;
      }
      else {
        unint64_t v4 = 0LL;
      }
      LOBYTE(v5) = v17;
      return v5 | v4;
    case kCFNumberShortType:
      LOWORD(valuePtr) = 0;
      unint64_t v6 = a1;
      CFNumberType v7 = kCFNumberShortType;
LABEL_18:
      BOOL v18 = CFNumberGetValue(v6, v7, &valuePtr) == 0;
      unsigned __int8 v19 = LOBYTE(valuePtr);
      uint64_t v20 = SLOWORD(valuePtr);
      goto LABEL_21;
    case kCFNumberIntType:
      LODWORD(valuePtr) = 0;
      CFNumberType v8 = a1;
      CFNumberType v9 = kCFNumberIntType;
LABEL_20:
      BOOL v18 = CFNumberGetValue(v8, v9, &valuePtr) == 0;
      unsigned __int8 v19 = LOBYTE(valuePtr);
      uint64_t v20 = SLODWORD(valuePtr);
LABEL_21:
      unint64_t v21 = v20 & 0xFFFFFFFFFFFFFF00LL | v19;
      if (v18) {
        uint64_t v5 = 0LL;
      }
      else {
        uint64_t v5 = v21;
      }
      goto LABEL_37;
    case kCFNumberLongType:
      double valuePtr = 0.0;
      CFNumberType v10 = a1;
      CFNumberType v11 = kCFNumberLongType;
      goto LABEL_31;
    case kCFNumberLongLongType:
      double valuePtr = 0.0;
      CFNumberType v10 = a1;
      CFNumberType v11 = kCFNumberLongLongType;
      goto LABEL_31;
    case kCFNumberFloatType:
      LODWORD(valuePtr) = 0;
      CFNumberType v12 = a1;
      CFNumberType v13 = kCFNumberFloatType;
LABEL_27:
      BOOL v22 = CFNumberGetValue(v12, v13, &valuePtr) == 0;
      uint64_t v5 = (uint64_t)*(float *)&valuePtr;
      goto LABEL_34;
    case kCFNumberDoubleType:
      double valuePtr = 0.0;
      CFNumberType v14 = a1;
      CFNumberType v15 = kCFNumberDoubleType;
      goto LABEL_33;
    case kCFNumberCFIndexType:
      double valuePtr = 0.0;
      CFNumberType v10 = a1;
      CFNumberType v11 = kCFNumberCFIndexType;
      goto LABEL_31;
    case kCFNumberNSIntegerType:
      double valuePtr = 0.0;
      CFNumberType v10 = a1;
      CFNumberType v11 = kCFNumberNSIntegerType;
LABEL_31:
      BOOL v22 = CFNumberGetValue(v10, v11, &valuePtr) == 0;
      uint64_t v5 = *(void *)&valuePtr;
      goto LABEL_34;
    case kCFNumberCGFloatType:
      double valuePtr = 0.0;
      CFNumberType v14 = a1;
      CFNumberType v15 = kCFNumberCGFloatType;
LABEL_33:
      BOOL v22 = CFNumberGetValue(v14, v15, &valuePtr) == 0;
      uint64_t v5 = (uint64_t)valuePtr;
LABEL_34:
      if (v22) {
        uint64_t v5 = 0LL;
      }
LABEL_37:
      unint64_t v4 = v5 & 0xFFFFFFFFFFFFFF00LL;
      break;
    default:
      unint64_t v4 = 0LL;
      LOBYTE(v5) = 0;
      break;
  }

  return v5 | v4;
}

CFTypeRef sub_100005FF4@<X0>(const __CFArray *a1@<X0>, unint64_t a2@<X1>, void *a3@<X8>)
{
  if (!a1 || CFArrayGetCount(a1) <= a2 || (ValueAtIndex = CFArrayGetValueAtIndex(a1, a2), (CFNumberType v7 = ValueAtIndex) == 0LL))
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    sub_10000609C(exception);
  }

  CFTypeRef result = CFRetain(ValueAtIndex);
  *a3 = v7;
  return result;
}

void sub_100006088(_Unwind_Exception *a1)
{
}

std::runtime_error *sub_10000609C@<X0>(std::runtime_error *a1@<X8>)
{
  return std::runtime_error::runtime_error(a1, "Could not find item");
}

uint64_t sub_1000060AC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 24);
  if (v3)
  {
    if (v3 == a2)
    {
      *(void *)(a1 + 24) = a1;
      (*(void (**)(void, uint64_t))(**(void **)(a2 + 24) + 24LL))(*(void *)(a2 + 24), a1);
    }

    else
    {
      *(void *)(a1 + 24) = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 16LL))(v3);
    }
  }

  else
  {
    *(void *)(a1 + 24) = 0LL;
  }

  return a1;
}

void sub_100006110()
{
  exception = __cxa_allocate_exception(8uLL);
  void *exception = &off_100008440;
}

void sub_100006148(std::exception *a1)
{
}

CFStringRef *sub_10000615C(CFStringRef *a1, char *a2, char *a3)
{
  uint64_t v5 = sub_1000061A4(a1, a2);
  sub_1000061A4(v5 + 1, a3);
  return a1;
}

void sub_100006190(_Unwind_Exception *a1)
{
}

CFStringRef *sub_1000061A4(CFStringRef *a1, char *a2)
{
  if ((v9 & 0x80u) == 0) {
    uint64_t v3 = __p;
  }
  else {
    uint64_t v3 = (void **)__p[0];
  }
  if ((v9 & 0x80u) == 0) {
    CFIndex v4 = v9;
  }
  else {
    CFIndex v4 = (CFIndex)__p[1];
  }
  CFStringRef v5 = CFStringCreateWithBytes(0LL, (const UInt8 *)v3, v4, 0x8000100u, 0);
  *a1 = v5;
  if (!v5)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Could not construct");
  }

  return a1;
}

void sub_100006258( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (*v15) {
    CFRelease(*v15);
  }
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

CFStringRef *sub_10000629C(CFStringRef *a1, char *a2, char *a3)
{
  CFStringRef v5 = sub_1000061A4(a1, a2);
  sub_1000061A4(v5 + 1, a3);
  return a1;
}

void sub_1000062D0(_Unwind_Exception *a1)
{
}

CFStringRef *sub_1000062E4(CFStringRef *a1, char *a2, char *a3)
{
  CFStringRef v5 = sub_1000061A4(a1, a2);
  sub_1000061A4(v5 + 1, a3);
  return a1;
}

void sub_100006318(_Unwind_Exception *a1)
{
}

uint64_t sub_10000632C(uint64_t a1, char *a2, const void **a3)
{
  CFStringRef v5 = *a3;
  if (v5) {
    CFRetain(v5);
  }
  *(void *)(a1 + 8) = v5;
  return a1;
}

uint64_t sub_10000636C(uint64_t a1, int a2)
{
  io_registry_entry_t v3 = sub_1000063E0(a1);
  io_object_t v4 = v3;
  if (v3)
  {
    CFStringRef v5 = sub_100006444(v3, 0LL);
    if (v5)
    {
      uint64_t v6 = (uint64_t)v5;
      if (a2) {
        CFStringRef v7 = sub_100002788((uint64_t)v5);
      }
      else {
        CFStringRef v7 = sub_100002DBC(v5);
      }
      CFStringRef v8 = v7;
      CFShow(v7);
      CFRelease(v8);
      unsigned __int8 v9 = (void *)sub_100002150(v6);
      operator delete(v9);
    }
  }

  return IOObjectRelease(v4);
}

uint64_t sub_1000063E0(uint64_t a1)
{
  unint64_t v1 = IORegistryEntryIDMatching(a1);
  uint64_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v1);
  uint64_t v3 = MatchingService;
  if (!(_DWORD)MatchingService || !IOObjectConformsTo(MatchingService, "AppleTypeCRetimerReporter"))
  {
    IOObjectRelease(v3);
    return 0LL;
  }

  return v3;
}

char *sub_100006444(io_registry_entry_t a1, void *a2)
{
  CFTypeRef CFProperty = (const __CFDictionary *)IORegistryEntryCreateCFProperty(a1, @"report", kCFAllocatorDefault, 0);
  if (!CFProperty) {
    return 0LL;
  }
  CFStringRef v5 = CFProperty;
  CFTypeID v6 = CFGetTypeID(CFProperty);
  if (v6 == CFDictionaryGetTypeID())
  {
    CFStringRef v7 = sub_100001F20(v5);
    CFStringRef v8 = v7;
    if (a2)
    {
      if (v7)
      {
        unsigned __int8 v9 = (const __CFNumber *)IORegistryEntryCreateCFProperty(a1, @"flags", kCFAllocatorDefault, 0);
        if (v9)
        {
          CFNumberType v10 = v9;
          CFTypeID v11 = CFGetTypeID(v9);
          if (v11 == CFNumberGetTypeID())
          {
            CFNumberGetValue(v10, kCFNumberLongType, a2);
            CFRelease(v10);
          }
        }
      }
    }
  }

  else
  {
    CFStringRef v8 = 0LL;
  }

  CFRelease(v5);
  return v8;
}

uint64_t start(int a1, const char **a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "start\n", buf, 2u);
  }

  if (a1 == 3)
  {
    io_object_t v4 = a2[1];
    if (!strcmp(v4, "handle"))
    {
      uint64_t v5 = atoll(a2[2]);
      sub_100006760(v5);
      goto LABEL_16;
    }
  }

  else
  {
    if (a1 == 2)
    {
      if (!strcmp(a2[1], "report"))
      {
        xpc_set_event_stream_handler("com.apple.iokit.matching", &_dispatch_main_q, &stru_100008478);
        CFRunLoopRun();
      }

      goto LABEL_16;
    }

    io_object_t v4 = a2[1];
  }

  if (!strcmp(v4, "show"))
  {
    uint64_t v6 = atoll(a2[2]);
    int v7 = a1 == 4 && strcmp(a2[3], "json") == 0;
    sub_10000636C(v6, v7);
  }

LABEL_16:
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned __int8 v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "done\n", v9, 2u);
  }

  return 0LL;
}

void sub_1000066AC(id a1, void *a2)
{
  uint64_t uint64 = xpc_dictionary_get_uint64(a2, "IOMatchLaunchServiceID");
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 134217984;
    uint64_t v4 = uint64;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "entry_id = 0x%llx\n",  (uint8_t *)&v3,  0xCu);
  }

  sub_100006760(uint64);
}

uint64_t sub_100006760(uint64_t a1)
{
  io_registry_entry_t parent = 0;
  io_registry_entry_t v2 = sub_1000063E0(a1);
  io_registry_entry_t v3 = v2;
  if (v2)
  {
    uint64_t v4 = sub_100006444(v2, v14);
    uint64_t v5 = (uint64_t)v4;
    if (v4)
    {
      if ((v14[0] & 1) == 0
        || (uint64_t v6 = sub_100002DBC(v4), !IORegistryEntrySetCFProperty(v3, @"processed-report", v6)))
      {
        int v7 = (__CFString *)sub_100002788(v5);
        int v8 = sub_100006930(v7);
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          unsigned __int8 v9 = "failed";
          if (v8) {
            unsigned __int8 v9 = "succeeded";
          }
          *(_DWORD *)buf = 136315138;
          char v17 = v9;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "writing log for submission %s\n",  buf,  0xCu);
        }

        if (!IORegistryEntryGetParentEntry(v3, "IOService", &parent) && IOObjectConformsTo(parent, "AppleTypeCRetimer"))
        {
          CFNumberType v10 = operator new(0x18uLL);
          sub_1000017AC((uint64_t)v10, parent);
          CFTypeID v11 = sub_10000187C(v10);
          operator delete(v11);
        }
      }

      CFNumberType v12 = (void *)sub_100002150(v5);
      operator delete(v12);
      io_registry_entry_t v2 = parent;
    }

    else
    {
      io_registry_entry_t v2 = 0;
    }
  }

  IOObjectRelease(v2);
  return IOObjectRelease(v3);
}

void sub_100006914(_Unwind_Exception *a1)
{
}

uint64_t sub_100006930(void *a1)
{
  unint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 dataUsingEncoding:4 allowLossyConversion:1]);
  uint64_t v12 = kOSALogOptionOverrideFilePrefix;
  CFNumberType v13 = @"RetimerCrash";
  io_registry_entry_t v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v13,  &v12,  1LL));
  id v11 = 0LL;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100006AA4;
  v9[3] = &unk_1000084A0;
  id v3 = v1;
  id v10 = v3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[OSALog createForSubmission:metadata:options:error:writing:]( &OBJC_CLASS___OSALog,  "createForSubmission:metadata:options:error:writing:",  @"305",  0LL,  v2,  &v11,  v9));
  id v5 = v11;

  if (v4) {
    BOOL v6 = v5 == 0LL;
  }
  else {
    BOOL v6 = 0;
  }
  uint64_t v7 = v6;

  return v7;
}

void sub_100006A78( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

id sub_100006AA4(uint64_t a1, void *a2)
{
  return [a2 writeData:*(void *)(a1 + 32)];
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

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}