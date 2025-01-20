uint64_t WiFiPolicyGetTypeID()
{
  uint64_t result;
  result = __kWiFiPolicyTypeID;
  if (!__kWiFiPolicyTypeID)
  {
    pthread_once(&__gWiFiPolicyTypeInit, (void (*)(void))__WiFiPolicyRegister);
    return __kWiFiPolicyTypeID;
  }

  return result;
}

uint64_t __WiFiPolicyRegister()
{
  uint64_t result = _CFRuntimeRegisterClass();
  __kWiFiPolicyTypeID = result;
  return result;
}

void *WiFiPolicyCreate(const __CFAllocator *a1, CFDictionaryRef theDict)
{
  if (theDict)
  {
    Value = CFDictionaryGetValue(theDict, @"PolicyType");
    if (Value)
    {
      v5 = Value;
      CFTypeID TypeID = CFNumberGetTypeID();
      if (TypeID != CFGetTypeID(v5)) {
        return 0LL;
      }
    }
  }

  if (!__kWiFiPolicyTypeID) {
    pthread_once(&__gWiFiPolicyTypeInit, (void (*)(void))__WiFiPolicyRegister);
  }
  uint64_t Instance = _CFRuntimeCreateInstance();
  v8 = (void *)Instance;
  if (Instance)
  {
    *(void *)(Instance + 16) = 0LL;
    CFMutableDictionaryRef v9 = theDict
       ? CFDictionaryCreateMutableCopy(a1, 0LL, theDict)
       : CFDictionaryCreateMutable(a1, 0LL, MEMORY[0x189605240], MEMORY[0x189605250]);
    v8[2] = v9;
    if (!v9)
    {
      CFRelease(v8);
      return 0LL;
    }
  }

  return v8;
}

void *WiFiPolicyCreateExtended(const __CFAllocator *a1, const void *a2, const void *a3, const void *a4)
{
  if (!a2) {
    return 0LL;
  }
  Mutable = CFDictionaryCreateMutable(a1, 0LL, MEMORY[0x189605240], MEMORY[0x189605250]);
  if (!Mutable) {
    return 0LL;
  }
  CFMutableDictionaryRef v9 = Mutable;
  CFDictionaryAddValue(Mutable, @"PolicyType", a2);
  if (a3)
  {
    CFDictionaryAddValue(v9, @"PolicyUUID", a3);
    v10 = 0LL;
    CFStringRef v11 = 0LL;
    if (!a4)
    {
LABEL_6:
      v12 = WiFiPolicyCreate(a1, v9);
      if (v11) {
        CFRelease(v11);
      }
      if (v10) {
        CFRelease(v10);
      }
      goto LABEL_10;
    }

LABEL_5:
    CFDictionaryAddValue(v9, @"PolicyProperties", a4);
    goto LABEL_6;
  }

  v14 = CFUUIDCreate(a1);
  if (v14)
  {
    v10 = v14;
    CFStringRef v11 = CFUUIDCreateString(a1, v14);
    CFDictionaryAddValue(v9, @"PolicyUUID", v11);
    if (!a4) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }

  v12 = 0LL;
LABEL_10:
  CFRelease(v9);
  return v12;
}

void WiFiPolicySetUUID(uint64_t a1, void *value)
{
  if (a1)
  {
    if (value) {
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 16), @"PolicyUUID", value);
    }
  }
}

const void *WiFiPolicyGetUUID(uint64_t a1)
{
  return CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"PolicyUUID");
}

void WiFiPolicySetType(uint64_t a1, int a2)
{
  int valuePtr = a2;
  CFNumberRef v3 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x189604DB0], kCFNumberIntType, &valuePtr);
  if (v3)
  {
    CFNumberRef v4 = v3;
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 16), @"PolicyType", v3);
    CFRelease(v4);
  }

uint64_t WiFiPolicyGetType(uint64_t a1)
{
  uint64_t v1 = 0xFFFFFFFFLL;
  unsigned int valuePtr = -1;
  Value = (const __CFNumber *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"PolicyType");
  if (Value)
  {
    CFNumberGetValue(Value, kCFNumberIntType, &valuePtr);
    return valuePtr;
  }

  return v1;
}

void WiFiPolicySetProperty(uint64_t a1, const void *a2, const void *a3)
{
  Value = (__CFDictionary *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"PolicyProperties");
  if (Value)
  {
    if (a3) {
      CFDictionarySetValue(Value, a2, a3);
    }
    else {
      CFDictionaryRemoveValue(Value, a2);
    }
  }

CFDictionaryRef WiFiPolicyGetProperty(uint64_t a1, const void *a2)
{
  uint64_t result = (const __CFDictionary *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"PolicyProperties");
  if (result) {
    return (const __CFDictionary *)CFDictionaryGetValue(result, a2);
  }
  return result;
}

CFDictionaryRef WiFiPolicyCopyRecord(uint64_t a1)
{
  return CFDictionaryCreateCopy((CFAllocatorRef)*MEMORY[0x189604DB0], *(CFDictionaryRef *)(a1 + 16));
}

__CFArray *WiFiCreatePoliciesFromRecords(const __CFArray *a1)
{
  v2 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, MEMORY[0x189605228]);
  CFNumberRef v4 = Mutable;
  if (a1)
  {
    if (Mutable)
    {
      CFIndex Count = CFArrayGetCount(a1);
      if (Count >= 1)
      {
        CFIndex v6 = Count;
        for (CFIndex i = 0LL; i != v6; ++i)
        {
          ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(a1, i);
          if (ValueAtIndex)
          {
            CFMutableDictionaryRef v9 = WiFiPolicyCreate(v2, ValueAtIndex);
            if (v9)
            {
              v10 = v9;
              CFArrayAppendValue(v4, v9);
              CFRelease(v10);
            }
          }
        }
      }
    }
  }

  return v4;
}

__CFArray *WiFiCreateRecordsFromPolicies(const __CFArray *a1)
{
  v2 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, MEMORY[0x189605228]);
  CFNumberRef v4 = Mutable;
  if (a1)
  {
    if (Mutable)
    {
      CFIndex Count = CFArrayGetCount(a1);
      if (Count >= 1)
      {
        CFIndex v6 = Count;
        for (CFIndex i = 0LL; i != v6; ++i)
        {
          ValueAtIndex = (CFDictionaryRef *)CFArrayGetValueAtIndex(a1, i);
          if (ValueAtIndex)
          {
            CFDictionaryRef Copy = CFDictionaryCreateCopy(v2, ValueAtIndex[2]);
            if (Copy)
            {
              CFDictionaryRef v10 = Copy;
              CFArrayAppendValue(v4, Copy);
              CFRelease(v10);
            }
          }
        }
      }
    }
  }

  return v4;
}

void __WiFiPolicyRelease(void *a1)
{
  if (!a1) {
    __WiFiPolicyRelease_cold_1();
  }
  CFTypeID v2 = CFGetTypeID(a1);
  uint64_t v3 = __kWiFiPolicyTypeID;
  if (!__kWiFiPolicyTypeID)
  {
    pthread_once(&__gWiFiPolicyTypeInit, (void (*)(void))__WiFiPolicyRegister);
    uint64_t v3 = __kWiFiPolicyTypeID;
  }

  if (v2 != v3) {
    __WiFiPolicyRelease_cold_2();
  }
  CFNumberRef v4 = (const void *)a1[2];
  if (v4)
  {
    CFRelease(v4);
    a1[2] = 0LL;
  }

BOOL __WiFiPolicyEqual(uint64_t a1, uint64_t a2)
{
  Value = (const __CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"PolicyUUID");
  CFNumberRef v4 = (const __CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(a2 + 16), @"PolicyUUID");
  if (Value) {
    BOOL v5 = v4 == 0LL;
  }
  else {
    BOOL v5 = 1;
  }
  return !v5 && CFStringCompare(Value, v4, 0LL) == kCFCompareEqualTo;
}

CFStringRef __WiFiPolicyCopyFormattingDesc(uint64_t a1, const __CFDictionary *a2)
{
  CFNumberRef v4 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  uint64_t Type = WiFiPolicyGetType(a1);
  Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"PolicyUUID");
  return CFStringCreateWithFormat(v4, a2, @"%d %@", Type, Value);
}

CFStringRef __WiFiPolicyCopyDebugDesc(uint64_t a1)
{
  CFTypeID v2 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  uint64_t Type = WiFiPolicyGetType(a1);
  Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"PolicyUUID");
  return CFStringCreateWithFormat(v2, 0LL, @"%d %@", Type, Value);
}

uint64_t _WiFiPreferenceLockSetDispatchQueue(uint64_t result)
{
  _queue = result;
  return result;
}

const __SCPreferences *_WiFiPreferencesLock(const __SCPreferences *prefs)
{
  if (prefs)
  {
    uint64_t v1 = prefs;
    if (_queue) {
      dispatch_assert_queue_V2((dispatch_queue_t)_queue);
    }
    prefs = (const __SCPreferences *)SCPreferencesLock(v1, 1u);
    if (!(_DWORD)prefs)
    {
      SCPreferencesSynchronize(v1);
      prefs = (const __SCPreferences *)SCPreferencesLock(v1, 1u);
      if (!(_DWORD)prefs)
      {
        int v2 = SCError();
        uint64_t v3 = SCErrorString(v2);
        objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C](v3));
        return 0LL;
      }
    }
  }

  return prefs;
}

uint64_t _WiFiPreferencesUnlock(SCPreferencesRef prefs, int a2)
{
  if (_queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)_queue);
  }
  if (a2 && (!SCPreferencesCommitChanges(prefs) || !SCPreferencesApplyChanges(prefs)))
  {
    int v4 = SCError();
    BOOL v5 = SCErrorString(v4);
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C](v5));
  }

  uint64_t v6 = SCPreferencesUnlock(prefs);
  if (!(_DWORD)v6)
  {
    int v7 = SCError();
    v8 = SCErrorString(v7);
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C](v8));
  }

  return v6;
}

__CFArray *_WiFiCreateRecordsFromNetworks(const __CFArray *a1)
{
  return _WiFiCreateRecordsFromNetworksWithType(a1, 0);
}

__CFArray *_WiFiCreateRecordsFromNetworksWithType(const __CFArray *a1, int a2)
{
  CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, MEMORY[0x189605228]);
  BOOL v5 = Mutable;
  if (a1)
  {
    if (Mutable)
    {
      CFIndex Count = CFArrayGetCount(a1);
      if (Count >= 1)
      {
        CFIndex v7 = Count;
        for (CFIndex i = 0LL; v7 != i; ++i)
        {
          ValueAtIndex = CFArrayGetValueAtIndex(a1, i);
          if (ValueAtIndex)
          {
            if (a2 == 1)
            {
              CFDictionaryRef v10 = WiFiNetworkCopyFilteredRecord((uint64_t)ValueAtIndex);
LABEL_10:
              CFStringRef v11 = v10;
              if (v10)
              {
                CFArrayAppendValue(v5, v10);
                CFRelease(v11);
              }

              continue;
            }

            if (!a2)
            {
              CFDictionaryRef v10 = WiFiNetworkCopyRecord((uint64_t)ValueAtIndex);
              goto LABEL_10;
            }
          }
        }
      }
    }
  }

  return v5;
}

__CFArray *_WiFiCreateNetworksFromRecords(const __CFArray *a1)
{
  return _WiFiCreateNetworksFromRecordsWithRSSIBounds(a1, 0, 0);
}

__CFArray *_WiFiCreateNetworksFromRecordsWithRSSIBounds(const __CFArray *a1, int a2, int a3)
{
  uint64_t v6 = *MEMORY[0x189604DB0];
  CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, MEMORY[0x189605228]);
  v8 = Mutable;
  if (a1)
  {
    if (Mutable)
    {
      CFIndex Count = CFArrayGetCount(a1);
      if (Count >= 1)
      {
        CFIndex v10 = Count;
        for (CFIndex i = 0LL; i != v10; ++i)
        {
          ValueAtIndex = CFArrayGetValueAtIndex(a1, i);
          if (ValueAtIndex)
          {
            v13 = WiFiNetworkCreate(v6, ValueAtIndex);
            if (v13)
            {
              v14 = v13;
              if (a2 != a3)
              {
                float v15 = (float)(int)WiFiNetworkGetIntProperty((uint64_t)v13, @"RSSI") + 77.5;
                float v16 = fabsf(sqrtf((float)(v15 * v15) + 450.0));
                double v17 = (float)((float)(v15 / (float)(v16 + v16)) + 0.5);
                WiFiNetworkSetFloatProperty((uint64_t)v14, @"ScaledRSSI", v17);
                WiFiNetworkSetFloatProperty((uint64_t)v14, @"ScaledRate", 1.0);
                WiFiNetworkSetFloatProperty((uint64_t)v14, @"Strength", v17);
              }

              CFArrayAppendValue(v8, v14);
              CFRelease(v14);
            }
          }
        }
      }
    }
  }

  return v8;
}

float _WiFiScaleRSSI(int a1)
{
  float v1 = (float)a1 + 77.5;
  float v2 = fabsf(sqrtf((float)(v1 * v1) + 450.0));
  return (float)(v1 / (float)(v2 + v2)) + 0.5;
}

__CFArray *_WiFiCopyEnabledNetworks(const __CFArray *a1)
{
  if (!a1) {
    return 0LL;
  }
  CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, MEMORY[0x189605228]);
  if (Mutable)
  {
    CFIndex Count = CFArrayGetCount(a1);
    if (Count >= 1)
    {
      CFIndex v4 = Count;
      for (CFIndex i = 0LL; i != v4; ++i)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(a1, i);
        if (ValueAtIndex)
        {
          CFIndex v7 = ValueAtIndex;
        }
      }
    }

    if (!CFArrayGetCount(Mutable))
    {
      CFRelease(Mutable);
      return 0LL;
    }
  }

  return Mutable;
}

CFPropertyListRef _WiFiCopyUnserialized(UInt8 *bytes, CFIndex length)
{
  if (!bytes || !length)
  {
    BOOL v6 = bytes != 0LL;
    if (length)
    {
      BOOL v6 = 0;
      BOOL v7 = bytes == 0LL;
    }

    else
    {
      BOOL v7 = 0;
    }

    if ((v7 || v6) && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
      _WiFiCopyUnserialized_cold_2();
    }
    return 0LL;
  }

  float v2 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  uint64_t v3 = CFDataCreateWithBytesNoCopy( (CFAllocatorRef)*MEMORY[0x189604DB0],  bytes,  length,  (CFAllocatorRef)*MEMORY[0x189604DC8]);
  if (!v3) {
    return 0LL;
  }
  CFIndex v4 = v3;
  CFErrorRef error = 0LL;
  CFPropertyListRef v5 = CFPropertyListCreateWithData(v2, v3, 1uLL, 0LL, &error);
  if (error)
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
      _WiFiCopyUnserialized_cold_1();
    }
    CFRelease(error);
  }

  CFRelease(v4);
  return v5;
}

uint64_t _WiFiVMDealloc(uint64_t result, uint64_t a2)
{
  if (result)
  {
    if (a2) {
      JUMPOUT(0x186E3BC38LL);
    }
  }

  return result;
}

void _WiFiSerialize(const void *a1, vm_offset_t *a2, mach_msg_type_number_t *a3)
{
  kern_return_t v9;
  mach_msg_type_number_t dataCnt;
  BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x189604DB0], a1);
  if (BinaryData)
  {
    BOOL v6 = BinaryData;
    dataCnt = -1431655766;
    *a3 = CFDataGetLength(BinaryData);
    vm_map_t v7 = *MEMORY[0x1895FBBE0];
    BytePtr = CFDataGetBytePtr(v6);
    CFMutableDictionaryRef v9 = vm_read(v7, (vm_address_t)BytePtr, *a3, a2, &dataCnt);
    CFRelease(v6);
    if (v9) {
      *a2 = 0LL;
    }
    *a3 = dataCnt;
  }

CFTypeRef _CFPropertyListCreateBinaryData(CFAllocatorRef bufferAllocator, const void *a2)
{
  uint64_t v3 = CFWriteStreamCreateWithAllocatedBuffers(bufferAllocator, bufferAllocator);
  if (!v3) {
    return 0LL;
  }
  CFIndex v4 = v3;
  if (CFWriteStreamOpen(v3))
  {
    CFErrorRef error = 0LL;
    CFPropertyListWrite(a2, v4, kCFPropertyListBinaryFormat_v1_0, 0LL, &error);
    CFWriteStreamClose(v4);
    if (error)
    {
      objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
        _CFPropertyListCreateBinaryData_cold_1();
      }
      CFRelease(error);
    }

    CFTypeRef v5 = CFWriteStreamCopyProperty(v4, (CFStreamPropertyKey)*MEMORY[0x1896051D0]);
  }

  else
  {
    CFTypeRef v5 = 0LL;
  }

  CFRelease(v4);
  return v5;
}

CFMutableArrayRef _CFArrayCreateMutableCopyOfCFDictionary(const __CFDictionary *a1)
{
  CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, MEMORY[0x189605228]);
  if (Mutable) {
    CFDictionaryApplyFunction(a1, (CFDictionaryApplierFunction)__CFArrayCreateMutableCopyOfCFDictionaryApplier, Mutable);
  }
  return Mutable;
}

void __CFArrayCreateMutableCopyOfCFDictionaryApplier(int a1, const void *a2, CFMutableArrayRef theArray)
{
}

CFMutableArrayRef _CFArrayCreateMutableCopyOfCFSet(const __CFSet *a1)
{
  CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, MEMORY[0x189605228]);
  if (Mutable) {
    CFSetApplyFunction(a1, (CFSetApplierFunction)__CFArrayCreateMutableCopyOfCFSetApplier, Mutable);
  }
  return Mutable;
}

void __CFArrayCreateMutableCopyOfCFSetApplier(void *value, CFMutableArrayRef theArray)
{
}

CFMutableSetRef _CFSetCreateMutableCopyOfCFArray(const __CFArray *a1)
{
  CFMutableSetRef Mutable = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, MEMORY[0x189605258]);
  if (Mutable)
  {
    v4.length = CFArrayGetCount(a1);
    v4.location = 0LL;
    CFArrayApplyFunction(a1, v4, (CFArrayApplierFunction)__CFSetCreateMutableCopyOfCFArrayApplier, Mutable);
  }

  return Mutable;
}

void __CFSetCreateMutableCopyOfCFArrayApplier(void *value, CFMutableSetRef theSet)
{
}

float _WiFiScale(uint64_t a1, uint64_t a2, uint64_t a3)
{
  float result = (float)(a1 - a2) / (float)(a3 - a2);
  if (result > 1.0) {
    float result = 1.0;
  }
  if (result < 0.0) {
    return 0.0;
  }
  return result;
}

double _CFTypeGetFloatValue(const void *a1)
{
  double valuePtr = 0.0;
  double v1 = 0.0;
  if (a1)
  {
    CFTypeID v3 = CFGetTypeID(a1);
    if (v3 == CFNumberGetTypeID())
    {
      CFNumberGetValue((CFNumberRef)a1, kCFNumberDoubleType, &valuePtr);
      return valuePtr;
    }
  }

  return v1;
}

CFNumberRef _CFTypeGetIntValue(const __CFNumber *result)
{
  uint64_t valuePtr = 0LL;
  if (result)
  {
    double v1 = result;
    CFTypeID v2 = CFGetTypeID(result);
    if (v2 == CFNumberGetTypeID())
    {
      CFNumberGetValue(v1, kCFNumberCFIndexType, &valuePtr);
      return (const __CFNumber *)valuePtr;
    }

    else
    {
      CFTypeID v3 = CFGetTypeID(v1);
      if (v3 == CFBooleanGetTypeID()) {
        return (const __CFNumber *)(*MEMORY[0x189604DE8] == (void)v1);
      }
      else {
        return 0LL;
      }
    }
  }

  return result;
}

void _CFDictionarySetIntValue(__CFDictionary *a1, const void *a2, uint64_t a3)
{
  uint64_t valuePtr = a3;
  CFNumberRef v5 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x189604DB0], kCFNumberCFIndexType, &valuePtr);
  if (v5)
  {
    CFNumberRef v6 = v5;
    CFDictionarySetValue(a1, a2, v5);
    CFRelease(v6);
  }

void _CFDictinoarySetFloatValue(__CFDictionary *a1, const void *a2, double a3)
{
  double valuePtr = a3;
  CFNumberRef v5 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x189604DB0], kCFNumberDoubleType, &valuePtr);
  if (v5)
  {
    CFNumberRef v6 = v5;
    CFDictionarySetValue(a1, a2, v5);
    CFRelease(v6);
  }

BOOL _CFValidateType(uint64_t a1, CFTypeRef cf)
{
  return cf && CFGetTypeID(cf) == a1;
}

uint64_t _CFMachPortCreateWithPort()
{
  return _SC_CFMachPortCreateWithPort();
}

const char *powerStateToString(unsigned int a1)
{
  if (a1 > 4) {
    return "UNKNOWN";
  }
  else {
    return off_189E8B6A0[a1];
  }
}

double getEpochTimeInMicroseconds()
{
  v1.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&v1.tv_usec = 0xAAAAAAAAAAAAAAAALL;
  gettimeofday(&v1, 0LL);
  return (double)v1.tv_usec + (double)v1.tv_sec * 1000000.0;
}

uint64_t isAppleOUI(unsigned __int16 *a1)
{
  uint64_t v1 = 0LL;
  while (*(unsigned __int16 *)&algn_1865BCDAB[v1] != *a1 || algn_1865BCDAB[v1 + 2] != *((_BYTE *)a1 + 2))
  {
    v1 += 3LL;
    if (v1 == 33) {
      return 0LL;
    }
  }

  return 1LL;
}

void *WiFiCopyTomorrowDateFromComponents(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v8 = (void *)MEMORY[0x186E3BB0C]();
  id v9 = objc_alloc_init(MEMORY[0x1896077E8]);
  CFIndex v10 = (void *)objc_opt_new();
  [v10 setHour:a2];
  [v10 setMinute:a3];
  [v10 setSecond:a4];
  CFStringRef v11 = (void *)objc_msgSend( (id)objc_msgSend(MEMORY[0x189603F38], "currentCalendar"),  "nextDateAfterDate:matchingComponents:options:",  a1,  v10,  1024);
  v12 = v11;
  if (v11) {
    id v13 = v11;
  }

  [v9 drain];
  objc_autoreleasePoolPop(v8);
  return v12;
}

void *_WiFiReallocArray(void *a1, unint64_t a2, unint64_t a3)
{
  if (is_mul_ok(a2, a3)) {
    return realloc(a1, a2 * a3);
  }
  *__error() = 12;
  return 0LL;
}

uint64_t WiFiCreateOSTransactionWithFunctionName(uint64_t a1)
{
  CFTypeID v2 = (void *)MEMORY[0x186E3BB0C]();
  objc_msgSend( (id)objc_msgSend(NSString, "stringWithFormat:", @"com.apple.wifid.%s", a1),  "UTF8String");
  uint64_t v3 = os_transaction_create();
  objc_autoreleasePoolPop(v2);
  return v3;
}

CFStringRef WiFiGetLinkChangeReasonString(int a1)
{
  switch(a1)
  {
    case 1000:
      float result = @"Trigger Disconnect";
      break;
    case 1001:
      float result = @"Client Disconnect";
      break;
    case 1002:
      float result = @"Temporarily Disabled";
      break;
    case 1003:
      float result = @"Network Changed";
      break;
    case 1004:
      float result = @"Decryption Failure";
      break;
    case 1005:
      float result = @"Not Primary Interface";
      break;
    case 1006:
      float result = @"CLTM";
      break;
    case 1007:
      float result = @"Internet Sharing";
      break;
    case 1008:
      float result = @"User Preference";
      break;
    case 1009:
      float result = @"Misc.";
      break;
    case 1010:
      float result = @"EAP Restart";
      break;
    case 1011:
      float result = @"Control Center/3rd Party Client";
      break;
    case 1012:
      float result = @"802.1X Failure";
      break;
    case 1013:
      float result = @"Network Transition";
      break;
    case 1014:
      float result = @"Auto Unlock";
      break;
    case 1015:
      float result = @"Captive";
      break;
    case 1016:
      float result = @"Banner Association";
      break;
    case 1017:
      float result = @"BSS Steering";
      break;
    case 1018:
      float result = @"Auto Hotspot Association";
      break;
    case 1019:
      float result = @"Auto Hotspot Transition";
      break;
    case 1020:
      float result = @"Perf Roam";
      break;
    case 1021:
      float result = @"CarPlay Disabled";
      break;
    case 1022:
      float result = @"Battery Save Mode Enabled";
      break;
    case 1023:
      float result = @"AirPlay Started";
      break;
    case 1024:
      float result = @"Prefer 6E Off";
      break;
    case 1025:
      float result = @"Prefer 6E On";
      break;
    default:
      int v2 = a1 - 1;
      float result = @"Deauth";
      switch(v2)
      {
        case 0:
          return result;
        case 1:
          float result = @"Beacon Lost";
          break;
        case 2:
          float result = @"Internal Error";
          break;
        case 3:
          float result = @"System Sleep";
          break;
        case 4:
          float result = @"Powered Off";
          break;
        case 5:
          float result = @"Join Failure";
          break;
        case 6:
          float result = @"Colocated scope transition";
          break;
        case 7:
          float result = @"Disassociate";
          break;
        case 8:
          float result = @"Invalid SSID";
          break;
        default:
          float result = @"Unknown";
          break;
      }

      break;
  }

  return result;
}

CFStringRef WiFiGetConcurrencyStateString(unsigned int a1)
{
  if (a1 < 9 && ((0x117u >> a1) & 1) != 0) {
    return off_189E8B6C8[a1];
  }
  uint64_t v1 = @"Unknown";
  if ((~a1 & 3) == 0) {
    uint64_t v1 = @"STA + AWDL";
  }
  if ((~a1 & 5) == 0) {
    uint64_t v1 = @"STA + SoftAP";
  }
  if ((~a1 & 6) == 0) {
    uint64_t v1 = @"AWDL + SoftAP";
  }
  if ((~a1 & 7) == 0) {
    uint64_t v1 = @"STA + AWDL + SoftAP";
  }
  if ((~a1 & 0xC) == 0) {
    uint64_t v1 = @"SoftAp + NanPh";
  }
  if ((~a1 & 0xE) != 0) {
    return v1;
  }
  else {
    return @"AWDL + SoftAp + NanPh";
  }
}

CFStringRef WiFiGetRoamEnvironmentTypeString(unsigned int a1)
{
  if (a1 > 6) {
    return @"Unknown";
  }
  else {
    return off_189E8B710[a1];
  }
}

CFStringRef WiFiGetRoamProfileOffsetString(unsigned int a1)
{
  if (a1 > 3) {
    return @"Unknown";
  }
  else {
    return off_189E8B748[a1];
  }
}

CFStringRef WiFiGetNOIHomeStateString(int a1)
{
  uint64_t v1 = @"Unknown";
  if (a1 == 2) {
    uint64_t v1 = @"Not Home";
  }
  if (a1 == 1) {
    return @"Home";
  }
  else {
    return v1;
  }
}

CFStringRef WiFiGetNOIWorkStateString(int a1)
{
  uint64_t v1 = @"Unknown";
  if (a1 == 2) {
    uint64_t v1 = @"Not Work";
  }
  if (a1 == 1) {
    return @"Work";
  }
  else {
    return v1;
  }
}

CFStringRef WiFiGetLowDataModeString(unsigned int a1)
{
  if (a1 > 2) {
    return @"Unknown";
  }
  else {
    return off_189E8B768[a1];
  }
}

CFStringRef WiFiGetLOITypeString(int a1)
{
  else {
    return off_189E8B780[a1 - 1];
  }
}

CFStringRef WiFiGetAutoInstantHotspotModeString(unsigned int a1)
{
  if (a1 > 2) {
    return @"Unknown";
  }
  else {
    return off_189E8B7A8[a1];
  }
}

CFStringRef WiFiGetClientDisconnectReasonString(int a1)
{
  uint64_t v1 = @"Unknown";
  if (a1 == 2) {
    uint64_t v1 = @"Captive";
  }
  if (a1 == 1) {
    return @"Control Center";
  }
  else {
    return v1;
  }
}

CFStringRef WiFiGetUINotificationTypeString(unsigned int a1)
{
  if (a1 > 0xD) {
    return @"Unknown";
  }
  else {
    return off_189E8B7C0[a1];
  }
}

BOOL WiFiGetRtTrafficType(const __CFString *a1)
{
  return CFStringFind(a1, @"facetime", 1uLL).length != 0;
}

CFStringRef WiFiGetAssocTypeString(unsigned int a1)
{
  if (a1 > 2) {
    return @"Unknown";
  }
  else {
    return off_189E8B830[a1];
  }
}

CFDataRef WiFiIsPrivateMacAddress(const __CFData *result)
{
  if (result)
  {
    uint64_t v1 = result;
    CFTypeID TypeID = CFDataGetTypeID();
    if (TypeID == CFGetTypeID(v1)) {
      return (const __CFData *)((*CFDataGetBytePtr(v1) >> 1) & 1);
    }
    else {
      return 0LL;
    }
  }

  return result;
}

uint64_t WiFiIsInterfaceExpensive()
{
  return 0LL;
}

BOOL WiFiIsSystemWokenByWiFi()
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v6 = 0u;
  __int128 v7 = 0u;
  __int128 v4 = 0u;
  __int128 v5 = 0u;
  *(_OWORD *)__big = 0u;
  __int128 v3 = 0u;
  size_t v1 = 255LL;
  sysctlbyname("kern.wakereason", __big, &v1, 0LL, 0LL);
  if (!__big[0]) {
    return 0LL;
  }
  if (strcasestr(__big, "wlan")) {
    return 1LL;
  }
  return strcasestr(__big, "wifibt") != 0LL;
}

uint64_t WiFiExtractPerCoreValues(const __CFArray *a1, void *a2, void *a3)
{
  if (a1 && CFArrayGetCount(a1) == 2)
  {
    ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(a1, 0LL);
    __int128 v7 = (const __CFNumber *)CFArrayGetValueAtIndex(a1, 1LL);
    if (ValueAtIndex) {
      CFNumberGetValue(ValueAtIndex, kCFNumberNSIntegerType, a2);
    }
    if (v7)
    {
      CFNumberGetValue(v7, kCFNumberNSIntegerType, a3);
      unsigned int v8 = 1;
      goto LABEL_9;
    }
  }

  else
  {
    ValueAtIndex = 0LL;
  }

  unsigned int v8 = 0;
LABEL_9:
  if (ValueAtIndex) {
    return 1LL;
  }
  else {
    return v8;
  }
}

CFNumberRef WiFiPrivateMacAddressType(const __CFNumber *result)
{
  if (result)
  {
    size_t v1 = result;
    unsigned int valuePtr = 0;
    CFTypeID TypeID = CFNumberGetTypeID();
    if (TypeID == CFGetTypeID(v1))
    {
      CFNumberGetValue(v1, kCFNumberIntType, &valuePtr);
      return (const __CFNumber *)valuePtr;
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

CFNumberRef WiFiCreatePrivateMacAddressType(int a1)
{
  int valuePtr = a1;
  return CFNumberCreate((CFAllocatorRef)*MEMORY[0x189604DB0], kCFNumberIntType, &valuePtr);
}

void OUTLINED_FUNCTION_0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

uint64_t WiFiMIGMachPortGetTypeID()
{
  uint64_t result = __WiFiMIGMachPortTypeID;
  if (!__WiFiMIGMachPortTypeID)
  {
    pthread_once(&__WiFiMIGMachPortTypeInit, (void (*)(void))__WiFiMIGMachPortRegister);
    return __WiFiMIGMachPortTypeID;
  }

  return result;
}

CFMutableDictionaryRef __WiFiMIGMachPortRegister()
{
  __WiFiMIGMachPortCFTypeID TypeID = _CFRuntimeRegisterClass();
  CFMutableDictionaryRef result = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, 0LL, 0LL);
  __wifiPortCache = (uint64_t)result;
  return result;
}

void *WiFiMIGMachPortCreate(uint64_t a1, uint64_t a2, int a3, int a4)
{
  if (a2 < 1) {
    return 0LL;
  }
  if (!__WiFiMIGMachPortTypeID) {
    pthread_once(&__WiFiMIGMachPortTypeInit, (void (*)(void))__WiFiMIGMachPortRegister);
  }
  uint64_t Instance = (_OWORD *)_CFRuntimeCreateInstance();
  unsigned int v8 = Instance;
  if (Instance)
  {
    Instance[5] = 0u;
    Instance[6] = 0u;
    Instance[3] = 0u;
    Instance[4] = 0u;
    Instance[1] = 0u;
    Instance[2] = 0u;
    *((_DWORD *)Instance + 4) = a3;
    if (!a4
      || ((v11.version = 0LL, memset(&v11.retain, 0, 24), v11.info = Instance, !a3)
        ? (uint64_t v9 = (uint64_t)CFMachPortCreate( (CFAllocatorRef)*MEMORY[0x189604DB0],  (CFMachPortCallBack)__WiFiMIGMachPortCFPortCallback,  &v11,  0LL))
        : (uint64_t v9 = _CFMachPortCreateWithPort()),
          (v8[7] = v9) != 0LL))
    {
      v8[3] = a2;
      return v8;
    }

    CFRelease(v8);
    return 0LL;
  }

  return v8;
}

void __WiFiMIGMachPortCFPortCallback(int a1, mach_msg_header_t *a2, int a3, CFTypeRef cf)
{
  if (cf)
  {
    CFRetain(cf);
    uint64_t v6 = MEMORY[0x186E3B2B4](0LL, *((void *)cf + 3), 0LL);
    if (!v6)
    {
LABEL_19:
      CFRelease(cf);
      return;
    }

    __int128 v7 = (mach_msg_header_t *)v6;
    mach_port_t msgh_remote_port = a2->msgh_remote_port;
    *(_DWORD *)uint64_t v6 = a2->msgh_bits & 0x1F;
    *(_DWORD *)(v6 + 4) = 36;
    *(void *)(v6 + 8) = msgh_remote_port;
    *(_DWORD *)(v6 + 20) = a2->msgh_id + 100;
    if (a2->msgh_id == 70)
    {
      *(_DWORD *)uint64_t v6 = 0;
      *(_DWORD *)(v6 + 8) = 0;
      *(_DWORD *)(v6 + 32) = 0;
      uint64_t v9 = (_DWORD *)(v6 + 32);
      __int128 v10 = (void (*)(CFTypeRef, void))*((void *)cf + 12);
      if (v10) {
        v10(cf, *((void *)cf + 13));
      }
    }

    else
    {
      uint64_t v11 = *MEMORY[0x1895F8468];
      *(_DWORD *)(v6 + 32) = -303;
      uint64_t v9 = (_DWORD *)(v6 + 32);
      *(void *)(v6 + 24) = v11;
      __int128 v12 = (void (*)(CFTypeRef, mach_msg_header_t *, uint64_t, void))*((void *)cf + 10);
      if (v12) {
        v12(cf, a2, v6, *((void *)cf + 11));
      }
    }

    if ((v7->msgh_bits & 0x80000000) == 0 && *v9)
    {
      if (*v9 == -305) {
        goto LABEL_18;
      }
      a2->mach_port_t msgh_remote_port = 0;
      mach_msg_destroy(a2);
    }

    if (v7->msgh_remote_port)
    {
      if ((v7->msgh_bits & 0x1F) == 0x12) {
        mach_msg_option_t v13 = 1;
      }
      else {
        mach_msg_option_t v13 = 17;
      }
    }

    else if ((v7->msgh_bits & 0x80000000) == 0)
    {
      goto LABEL_18;
    }

    mach_msg_destroy(v7);
LABEL_18:
    CFAllocatorDeallocate(0LL, v7);
    goto LABEL_19;
  }

uint64_t WiFiMIGMachPortScheduleWithQueue(uint64_t a1)
{
  uint64_t result = dispatch_mach_create_f();
  *(void *)(a1 + 72) = result;
  if (result) {
    return dispatch_mach_connect();
  }
  return result;
}

void __WiFiMIGMachPortDispatchPortCallback(uint64_t a1, uint64_t a2)
{
  switch(a2)
  {
    case 8LL:
      dispatch_release(*(dispatch_object_t *)(a1 + 72));
      CFRelease((CFTypeRef)a1);
      break;
    case 7LL:
      uint64_t msg = dispatch_mach_msg_get_msg();
      mach_port_mod_refs(*MEMORY[0x1895FBBE0], *(_DWORD *)(msg + 12), 1u, -1);
      break;
    case 2LL:
      if (*(_DWORD *)(dispatch_mach_msg_get_msg() + 20) == 70)
      {
        __int128 v3 = *(void (**)(uint64_t, void))(a1 + 96);
        if (v3) {
          v3(a1, *(void *)(a1 + 104));
        }
      }

      else if ((dispatch_mach_mig_demux() & 1) == 0)
      {
        __int128 v5 = (mach_msg_header_t *)dispatch_mach_msg_get_msg();
        mach_msg_destroy(v5);
      }

      break;
  }

uint64_t WiFiMIGMachPortUnscheduleFromQueue(uint64_t result)
{
  if (result)
  {
    uint64_t result = *(void *)(result + 72);
    if (result) {
      return dispatch_mach_cancel();
    }
  }

  return result;
}

void WiFiMIGMachPortScheduleWithRunLoop(uint64_t a1, CFRunLoopRef rl, CFRunLoopMode mode)
{
  *(void *)(a1 + 32) = rl;
  *(void *)(a1 + 40) = mode;
  RunLoopSource = *(__CFRunLoopSource **)(a1 + 48);
  if (RunLoopSource
    || (RunLoopSource = CFMachPortCreateRunLoopSource( (CFAllocatorRef)*MEMORY[0x189604DB0],  *(CFMachPortRef *)(a1 + 56),  1LL),  (*(void *)(a1 + 48) = RunLoopSource) != 0LL))
  {
    CFRunLoopAddSource(rl, RunLoopSource, mode);
  }

void WiFiMIGMachPortUnscheduleFromRunLoop(uint64_t a1, __CFRunLoop *cf1, const __CFString *a3)
{
  if (cf1)
  {
    if (a3)
    {
      __int128 v7 = (void *)(a1 + 32);
      uint64_t v6 = *(const void **)(a1 + 32);
      if (v6)
      {
        if (*(void *)(a1 + 40))
        {
          if (CFEqual(cf1, v6))
          {
            if (CFEqual(a3, *(CFTypeRef *)(a1 + 40)))
            {
              *__int128 v7 = 0LL;
              v7[1] = 0LL;
              unsigned int v8 = *(__CFRunLoopSource **)(a1 + 48);
              if (v8)
              {
                CFRunLoopRemoveSource(cf1, v8, a3);
                uint64_t v9 = *(const void **)(a1 + 48);
                if (v9)
                {
                  CFRelease(v9);
                  *(void *)(a1 + 48) = 0LL;
                }
              }
            }
          }
        }
      }
    }
  }

uint64_t WiFiMIGMachPortGetPort(uint64_t a1)
{
  return *(unsigned int *)(a1 + 16);
}

uint64_t WiFiMIGMachPortRegisterDemuxCallback(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(void *)(result + 80) = a2;
  *(void *)(result + 88) = a3;
  return result;
}

uint64_t WiFiMIGMachPortRegisterTerminationCallback(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(void *)(result + 96) = a2;
  *(void *)(result + 104) = a3;
  return result;
}

uint64_t WiFiPortCacheAdd(unsigned int a1, const void *a2)
{
  if (__wifiPortCache) {
    CFDictionarySetValue((CFMutableDictionaryRef)__wifiPortCache, (const void *)a1, a2);
  }
  return pthread_mutex_unlock(&__wifiPortCacheLock);
}

uint64_t WiFiPortCacheRemove(unsigned int a1)
{
  if (__wifiPortCache) {
    CFDictionaryRemoveValue((CFMutableDictionaryRef)__wifiPortCache, (const void *)a1);
  }
  return pthread_mutex_unlock(&__wifiPortCacheLock);
}

const void *WiFiPortCacheCopy(unsigned int a1)
{
  if (__wifiPortCache)
  {
    Value = CFDictionaryGetValue((CFDictionaryRef)__wifiPortCache, (const void *)a1);
    __int128 v3 = Value;
    if (Value) {
      CFRetain(Value);
    }
  }

  else
  {
    __int128 v3 = 0LL;
  }

  pthread_mutex_unlock(&__wifiPortCacheLock);
  return v3;
}

const void *WiFiPortCacheCopyWithType(unsigned int a1, uint64_t a2)
{
  __int128 v3 = WiFiPortCacheCopy(a1);
  __int128 v4 = v3;
  if (v3 && CFGetTypeID(v3) != a2)
  {
    CFRelease(v4);
    return 0LL;
  }

  return v4;
}

void __WiFiMIGMachPortRelease(uint64_t a1)
{
  int v2 = *(__CFMachPort **)(a1 + 56);
  if (v2)
  {
    CFMachPortInvalidate(v2);
    __int128 v3 = *(const void **)(a1 + 56);
    if (v3)
    {
      CFRelease(v3);
      *(void *)(a1 + 56) = 0LL;
    }
  }

  __int128 v4 = *(const void **)(a1 + 48);
  if (v4)
  {
    CFRelease(v4);
    *(void *)(a1 + 48) = 0LL;
  }

uint64_t WiFiManagerClientGetTypeID()
{
  uint64_t result = __wiFiManagerTypeID;
  if (!__wiFiManagerTypeID)
  {
    pthread_once(&__wiFiManagerTypeInit, (void (*)(void))__WiFiManagerClientRegister);
    return __wiFiManagerTypeID;
  }

  return result;
}

uint64_t __WiFiManagerClientRegister()
{
  uint64_t result = _CFRuntimeRegisterClass();
  __wiFiManagerCFTypeID TypeID = result;
  return result;
}

uint64_t WiFiManagerClientCreate(uint64_t a1, int a2)
{
  uint64_t v3 = *MEMORY[0x1895FBBE0];
  mach_msg_type_number_t port_info_outCnt = 1;
  if (!__wiFiManagerTypeID) {
    pthread_once(&__wiFiManagerTypeInit, (void (*)(void))__WiFiManagerClientRegister);
  }
  uint64_t Instance = (_OWORD *)_CFRuntimeCreateInstance();
  uint64_t v5 = (uint64_t)Instance;
  if (!Instance) {
    return v5;
  }
  mach_port_name_t name = -1431655766;
  integer_t port_info_out = -1431655766;
  Instance[1] = 0u;
  Instance[2] = 0u;
  Instance[3] = 0u;
  Instance[4] = 0u;
  Instance[5] = 0u;
  Instance[6] = 0u;
  Instance[7] = 0u;
  Instance[8] = 0u;
  Instance[9] = 0u;
  Instance[10] = 0u;
  Instance[11] = 0u;
  Instance[12] = 0u;
  Instance[13] = 0u;
  Instance[14] = 0u;
  Instance[15] = 0u;
  Instance[16] = 0u;
  Instance[17] = 0u;
  Instance[18] = 0u;
  Instance[19] = 0u;
  Instance[20] = 0u;
  uint64_t v6 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
  *(void *)(v5 + 64) = Mutable;
  if (!Mutable)
  {
    BOOL v18 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    if (v18) {
      WiFiManagerClientCreate_cold_1(v18, v19, v20, v21, v22, v23, v24, v25);
    }
    goto LABEL_21;
  }

  *(_DWORD *)(v5 + 20) = 0;
  *(_DWORD *)(v5 + 24) = 0;
  mach_port_allocate(v3, 1u, &name);
  unsigned int v8 = WiFiMIGMachPortCreate((uint64_t)v6, 36LL, name, 1);
  *(void *)(v5 + 40) = v8;
  if (!v8)
  {
    BOOL v26 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    if (v26) {
      WiFiManagerClientCreate_cold_2(v26, v27, v28, v29, v30, v31, v32, v33);
    }
    goto LABEL_21;
  }

  mach_port_name_t Port = WiFiMIGMachPortGetPort((uint64_t)v8);
  if (mach_port_get_attributes(v3, Port, 1, &port_info_out, &port_info_outCnt))
  {
    BOOL v34 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    if (v34) {
      WiFiManagerClientCreate_cold_4(v34, v35, v36, v37, v38, v39, v40, v41);
    }
    goto LABEL_21;
  }

  integer_t port_info_out = 32;
  uint64_t v10 = WiFiMIGMachPortGetPort(*(void *)(v5 + 40));
  if (MEMORY[0x186E3BA7C](v3, v10, 1LL, &port_info_out, port_info_outCnt))
  {
    BOOL v42 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    if (v42) {
      WiFiManagerClientCreate_cold_3(v42, v43, v44, v45, v46, v47, v48, v49);
    }
LABEL_21:
    CFArrayRef ArrayBySeparatingStrings = (CFArrayRef)v5;
    uint64_t v5 = 0LL;
LABEL_11:
    CFRelease(ArrayBySeparatingStrings);
    return v5;
  }

  WiFiMIGMachPortRegisterDemuxCallback(*(void *)(v5 + 40), (uint64_t)__WiFiManagerClientMIGDemuxCallback, v5);
  WiFiMIGMachPortRegisterTerminationCallback( *(void *)(v5 + 40),  (uint64_t)__WiFiManagerClientServerTerminationCallback,  v5);
  unsigned int v11 = WiFiMIGMachPortGetPort(*(void *)(v5 + 40));
  WiFiPortCacheAdd(v11, (const void *)v5);
  *(_DWORD *)(v5 + 16) = a2;
  __int128 v12 = __WiFiManagerClientGetOrReconnectServerPort(v5, 1);
  WiFiSendRightRelease(v12);
  *(_BYTE *)(v5 + 80) = 0;
  CFArrayRef ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings( v6,  @"Preferences SpringBoard Carousel WiFiPickerExtens Setup budd sharingd demod BundledIntentHandler SiriViewService assistantd assistant_service Siri SettingsIntentExtension NanoSettings PineBoard TVSettings SoundBoard RealityControlCenter MuseBuddyApp mobilewifitool WirelessStress coreautomationd wifiutil NanoWiFiViewService ATKWiFiFramework WiFiViewService hQT XCTestInternalAngel HPSetup AirPlaySenderUIApp TVSetup deviceaccessd AccessorySetupUI",  @" ");
  __int128 v14 = getprogname();
  CFStringEncoding SystemEncoding = CFStringGetSystemEncoding();
  CFStringRef v16 = CFStringCreateWithCString(v6, v14, SystemEncoding);
  v53.length = CFArrayGetCount(ArrayBySeparatingStrings);
  v53.location = 0LL;
  *(_BYTE *)(v5 + 81) = CFArrayContainsValue(ArrayBySeparatingStrings, v53, v16) != 0;
  *(_DWORD *)(v5 + 320) = 0;
  if (v16) {
    CFRelease(v16);
  }
  if (ArrayBySeparatingStrings) {
    goto LABEL_11;
  }
  return v5;
}

uint64_t __WiFiManagerClientMIGDemuxCallback(uint64_t a1, _DWORD *a2, uint64_t a3)
{
  int v3 = a2[5];
  if (v3 >= 96960 && v3 < 96974) {
    LOBYTE(result) = wifi_manager_client_server(a2, a3);
  }
  else {
    LOBYTE(result) = 0;
  }
  return result;
}

void __WiFiManagerClientServerTerminationCallback(uint64_t a1, uint64_t a2)
{
  int v3 = __WiFiManagerClientGetOrReconnectServerPort(a2, 0);
  *(_DWORD *)(a2 + 320) = 1;
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
    __WiFiManagerClientServerTerminationCallback_cold_1();
  }
  WiFiSendRightRelease(v3);
  __int128 v4 = __WiFiManagerClientGetOrReconnectServerPort(a2, 1);
  __int128 v7 = v4;
  if (v4)
  {
    __WiFiManagerClientAvailableCallback((uint64_t)v4, v5, v6, a2);
LABEL_12:
    WiFiSendRightRelease(v7);
    return;
  }

  if (*(void *)(a2 + 104) || !*(void *)(a2 + 48) || !*(void *)(a2 + 56)) {
    goto LABEL_12;
  }
  mach_port_t notify_port = -1431655766;
  if (!notify_register_mach_port("com.apple.wifi.manager.available", &notify_port, 0, (int *)(a2 + 88)))
  {
    unsigned int v8 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    uint64_t v9 = (__CFMachPort *)_CFMachPortCreateWithPort();
    *(void *)(a2 + 96) = v9;
    if (v9)
    {
      RunLoopSource = CFMachPortCreateRunLoopSource(v8, v9, 0LL);
      *(void *)(a2 + 104) = RunLoopSource;
      if (RunLoopSource)
      {
        CFRunLoopAddSource(*(CFRunLoopRef *)(a2 + 48), RunLoopSource, *(CFRunLoopMode *)(a2 + 56));
        goto LABEL_12;
      }
    }
  }

void WiFiSendRightRelease(unsigned int *a1)
{
  if (a1)
  {
    do
    {
      unsigned int v2 = __ldxr(a1);
      unsigned int v3 = v2 - 1;
    }

    while (__stxr(v3, a1));
    if (!v3)
    {
      mach_port_deallocate(*MEMORY[0x1895FBBE0], a1[1]);
      free(a1);
    }
  }

void WiFiManagerClientDispatchNotificationResponse(uint64_t a1, int a2, int a3, const void *a4)
{
  __int128 v7 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v7)
  {
    unsigned int v8 = v7;
    BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x189604DB0], a4);
    if (BinaryData)
    {
      uint64_t v10 = BinaryData;
      BytePtr = CFDataGetBytePtr(BinaryData);
      int Length = CFDataGetLength(v10);
      wifi_manager_dispatch_notification_response(v8[1], a2, a3, (uint64_t)BytePtr, Length);
      WiFiSendRightRelease(v8);
      CFRelease(v10);
    }

    else
    {
      wifi_manager_dispatch_notification_response(v8[1], a2, a3, 0LL, 0);
      WiFiSendRightRelease(v8);
    }
  }

uint64_t WiFiManagerClientIndicateCarPlayHIDEventReceived(uint64_t a1, int a2, int a3, const void *a4)
{
  __int128 v7 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v7)
  {
    unsigned int v8 = v7;
    BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x189604DB0], a4);
    if (BinaryData)
    {
      uint64_t v10 = BinaryData;
      BytePtr = CFDataGetBytePtr(BinaryData);
      int Length = CFDataGetLength(v10);
      wifi_manager_indicate_carplay_hid_event_received(v8[1], a2, a3, (uint64_t)BytePtr, Length);
      WiFiSendRightRelease(v8);
      CFRelease(v10);
    }

    else
    {
      wifi_manager_indicate_carplay_hid_event_received(v8[1], a2, a3, 0LL, 0);
      WiFiSendRightRelease(v8);
    }
  }

  return 0LL;
}

unsigned int *WiFiManagerClientSetProperty(uint64_t a1, const void *a2, const __CFData *a3)
{
  int v15 = -3902;
  uint64_t result = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (!result) {
    return result;
  }
  uint64_t v6 = result;
  __int128 v7 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x189604DB0], a2);
  uint64_t v9 = BinaryData;
  if (BinaryData)
  {
    BytePtr = CFDataGetBytePtr(BinaryData);
    int Length = CFDataGetLength(v9);
    if (!a3) {
      goto LABEL_8;
    }
  }

  else
  {
    BytePtr = 0LL;
    int Length = 0;
    if (!a3)
    {
LABEL_8:
      mach_msg_option_t v13 = 0LL;
      int v14 = 0;
      goto LABEL_9;
    }
  }

  __int128 v12 = (const __CFData *)_CFPropertyListCreateBinaryData(v7, a3);
  a3 = v12;
  if (!v12) {
    goto LABEL_8;
  }
  mach_msg_option_t v13 = CFDataGetBytePtr(v12);
  int v14 = CFDataGetLength(a3);
LABEL_9:
  wifi_manager_set_property(v6[1], (uint64_t)BytePtr, Length, (uint64_t)v13, v14, &v15);
  WiFiSendRightRelease(v6);
  if (a3) {
    CFRelease(a3);
  }
  if (v9) {
    CFRelease(v9);
  }
  return (unsigned int *)(v15 == 0);
}

CFPropertyListRef WiFiManagerClientCopyProperty(uint64_t a1, const void *a2)
{
  __int128 v4 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (!v4) {
    return 0LL;
  }
  uint64_t v5 = v4;
  if (CFEqual(a2, @"SignalStrengthThreshold")
    || CFEqual(a2, @"deviceCapabilities")
    || CFEqual(a2, @"deviceSupportsWoW"))
  {
    uint64_t RootDevice = __WiFiManagerClientGetRootDevice(a1);
    if (RootDevice) {
      CFPropertyListRef v7 = WiFiDeviceClientCopyProperty(RootDevice, a2);
    }
    else {
      CFPropertyListRef v7 = 0LL;
    }
  }

  else
  {
    BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x189604DB0], a2);
    uint64_t v10 = BinaryData;
    if (BinaryData)
    {
      BytePtr = CFDataGetBytePtr(BinaryData);
      int v12 = CFDataGetLength(v10);
    }

    else
    {
      BytePtr = 0LL;
      int v12 = 0;
    }

    wifi_manager_copy_property(v5[1], (uint64_t)BytePtr, v12, &length[1], length);
    CFPropertyListRef v7 = 0LL;
    if (*(void *)&length[1] && length[0]) {
      CFPropertyListRef v7 = _WiFiCopyUnserialized(*(UInt8 **)&length[1], length[0]);
    }
    if (v10) {
      CFRelease(v10);
    }
  }

  _WiFiVMDealloc(*(uint64_t *)&length[1], length[0]);
  WiFiSendRightRelease(v5);
  return v7;
}

uint64_t __WiFiManagerClientGetRootDevice(uint64_t a1)
{
  v7[1] = *MEMORY[0x1895F89C0];
  os_unfair_recursive_lock_lock_with_options();
  unsigned int v2 = *(const __CFDictionary **)(a1 + 64);
  if (v2 && CFDictionaryGetCount(v2))
  {
    MEMORY[0x1895F8858]();
    __int128 v4 = (void *)((char *)v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL));
    memset(v4, 170, v3);
    CFDictionaryGetKeysAndValues(*(CFDictionaryRef *)(a1 + 64), 0LL, (const void **)v4);
    uint64_t v5 = *v4;
  }

  else
  {
    uint64_t v5 = 0LL;
  }

  os_unfair_recursive_lock_unlock();
  return v5;
}

uint64_t _WiFiManagerClientGetRunLoop(uint64_t a1)
{
  return *(void *)(a1 + 48);
}

uint64_t _WiFiManagerClientGetRunLoopMode(uint64_t a1)
{
  return *(void *)(a1 + 56);
}

uint64_t WiFiManagerClientGetType(uint64_t a1)
{
  return *(unsigned int *)(a1 + 16);
}

void WiFiManagerClientSetType(uint64_t a1, int a2)
{
  *(_DWORD *)(a1 + 16) = a2;
  size_t v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v3)
  {
    __int128 v4 = v3;
    wifi_manager_set_client_type(v3[1], a2);
    WiFiSendRightRelease(v4);
  }

void WiFiManagerClientRegisterDeviceAttachmentCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 128) = a2;
  *(void *)(a1 + 136) = a3;
  if (a2) {
    __WiFiManagerClientOrEventMask(a1, 4LL);
  }
  else {
    __WiFiManagerClientAndEventMask(a1, -5LL);
  }
}

void __WiFiManagerClientOrEventMask(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 72) |= a2;
  size_t v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  __int128 v4 = v3;
  if (v3) {
    wifi_manager_set_event_mask(v3[1], *(void *)(a1 + 72));
  }
  WiFiSendRightRelease(v4);
}

void __WiFiManagerClientAndEventMask(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 72) &= a2;
  size_t v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  __int128 v4 = v3;
  if (v3) {
    wifi_manager_set_event_mask(v3[1], *(void *)(a1 + 72));
  }
  WiFiSendRightRelease(v4);
}

uint64_t WiFiManagerClientRegisterVirtInterfaceChangeCallback(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(void *)(result + 144) = a2;
  *(void *)(result + 152) = a3;
  return result;
}

void WiFiManagerClientRegisterWowStateChangedCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 208) = a2;
  *(void *)(a1 + 216) = a3;
  if (a2) {
    __WiFiManagerClientOrEventMask(a1, 0x2000LL);
  }
  else {
    __WiFiManagerClientAndEventMask(a1, -8193LL);
  }
}

void WiFiManagerClientRegisterBackgroundScanCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 160) = a2;
  *(void *)(a1 + 168) = a3;
  if (a2) {
    __WiFiManagerClientOrEventMask(a1, 512LL);
  }
  else {
    __WiFiManagerClientAndEventMask(a1, -513LL);
  }
}

void WiFiManagerClientRegisterBackgroundScanCacheCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 176) = a2;
  *(void *)(a1 + 184) = a3;
  if (a2) {
    __WiFiManagerClientOrEventMask(a1, 0x200000LL);
  }
  else {
    __WiFiManagerClientAndEventMask(a1, -2097153LL);
  }
}

void WiFiManagerClientRegisterScanBackoffReportCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 192) = a2;
  *(void *)(a1 + 200) = a3;
  uint64_t v5 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v5)
  {
    uint64_t v6 = v5;
    if (a2)
    {
      __WiFiManagerClientOrEventMask(a1, 0x2000000LL);
      int v7 = 1;
    }

    else
    {
      __WiFiManagerClientAndEventMask(a1, -33554433LL);
      int v7 = 0;
    }

    wifi_manager_set_scan_backoff_report(v6[1], v7);
    WiFiSendRightRelease(v6);
  }

void WiFiManagerClientSetAssociationMode(uint64_t a1, int a2)
{
  size_t v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v3)
  {
    __int128 v4 = v3;
    wifi_manager_set_association_mode(v3[1], a2);
    WiFiSendRightRelease(v4);
  }

uint64_t WiFiManagerClientGetAssociationMode(uint64_t a1)
{
  unsigned int v4 = 1;
  size_t v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  unsigned int v2 = v1;
  if (v1) {
    wifi_manager_get_association_mode(v1[1], &v4);
  }
  WiFiSendRightRelease(v2);
  return v4;
}

void WiFiManagerClientSetAskToJoinPreference(uint64_t a1, int a2)
{
  size_t v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v3)
  {
    unsigned int v4 = v3;
    wifi_manager_set_asktojoin_preference(v3[1], a2);
    WiFiSendRightRelease(v4);
  }

uint64_t WiFiManagerClientGetAskToJoinPreference(uint64_t a1)
{
  unsigned int v4 = 1;
  size_t v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  unsigned int v2 = v1;
  if (v1) {
    wifi_manager_get_asktojoin_preference(v1[1], &v4);
  }
  WiFiSendRightRelease(v2);
  return v4;
}

void WiFiManagerClientEnable(uint64_t a1)
{
  size_t v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v1)
  {
    unsigned int v2 = v1;
    wifi_manager_set_enable_state(v1[1], 1);
    WiFiSendRightRelease(v2);
  }

void WiFiManagerClientDisable(uint64_t a1)
{
  size_t v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v1)
  {
    unsigned int v2 = v1;
    wifi_manager_set_enable_state(v1[1], 0);
    WiFiSendRightRelease(v2);
  }

void WiFiManagerClientSetPower(uint64_t a1, int a2)
{
  size_t v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v3)
  {
    unsigned int v4 = v3;
    wifi_manager_set_power(v3[1], a2);
    WiFiSendRightRelease(v4);
  }

BOOL WiFiManagerClientGetPower(uint64_t a1)
{
  return WiFiManagerClientGetPowerExt(a1) == 2;
}

unsigned int *WiFiManagerClientGetPowerExt(uint64_t a1)
{
  int v3 = 0;
  uint64_t result = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (result)
  {
    unsigned int v2 = result;
    wifi_manager_get_power(result[1], &v3);
    WiFiSendRightRelease(v2);
    if (v3 == 4) {
      return (unsigned int *)1;
    }
    else {
      return (unsigned int *)(2 * (v3 == 1));
    }
  }

  return result;
}

void WiFiManagerClientSetPowerExt(uint64_t a1, unsigned int a2)
{
  if (a2 > 2) {
    int v2 = 1;
  }
  else {
    int v2 = dword_1865BCE24[a2];
  }
  int v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v3)
  {
    unsigned int v4 = v3;
    wifi_manager_set_power_ext(v3[1], v2);
    WiFiSendRightRelease(v4);
  }

void WiFiManagerClientSetMISState(uint64_t a1, int a2)
{
  int v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v3)
  {
    unsigned int v4 = v3;
    wifi_manager_set_mis_state(v3[1], a2);
    WiFiSendRightRelease(v4);
  }

unsigned int *WiFiManagerClientGetMISState(uint64_t a1)
{
  int v3 = 0;
  uint64_t result = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (result)
  {
    int v2 = result;
    wifi_manager_get_mis_state(result[1], &v3);
    WiFiSendRightRelease(v2);
    return (unsigned int *)(v3 != 0);
  }

  return result;
}

void WiFiManagerClientSetMISDiscoveryState(uint64_t a1, int a2, int a3)
{
  uint64_t v5 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v5)
  {
    uint64_t v6 = v5;
    int v7 = getprogname();
    BOOL v8 = strncmp("sharingd", v7, 8uLL) == 0;
    wifi_manager_set_mis_discovery_state(v6[1], a2, a3, v8, 0, 0LL, 0, 0LL, 0, 0);
    WiFiSendRightRelease(v6);
  }

void WiFiManagerClientSetMISDiscoveryStateExt(uint64_t a1, const __CFDictionary *a2)
{
  unsigned __int16 valuePtr = 0;
  if (!a2) {
    return;
  }
  int v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (!v3) {
    return;
  }
  unsigned int v4 = v3;
  Value = CFDictionaryGetValue(a2, @"SOFTAP_ENABLE");
  uint64_t v6 = (CFTypeRef *)MEMORY[0x189604DE8];
  if (Value) {
    BOOL v27 = CFEqual(Value, (CFTypeRef)*MEMORY[0x189604DE8]) != 0;
  }
  else {
    BOOL v27 = 0;
  }
  int v7 = CFDictionaryGetValue(a2, @"SOFTAP_IMMEDIATE_DISABLE");
  if (v7) {
    BOOL v26 = CFEqual(v7, *v6) != 0;
  }
  else {
    BOOL v26 = 0;
  }
  BOOL v8 = CFDictionaryGetValue(a2, @"SOFTAP_FORCE_2_4G_CHANNEL");
  if (v8) {
    BOOL v9 = CFEqual(v8, *v6) != 0;
  }
  else {
    BOOL v9 = 0;
  }
  uint64_t v10 = CFDictionaryGetValue(a2, @"SOFTAP_SOFTAP_HIDDEN_NETWORK");
  if (v10) {
    BOOL v11 = CFEqual(v10, *v6) != 0;
  }
  else {
    BOOL v11 = 0;
  }
  int v12 = CFDictionaryGetValue(a2, @"SOFTAP_SOFTAP_CAP_MODEL");
  mach_msg_option_t v13 = (CFAllocatorRef *)MEMORY[0x189604DB0];
  if (v12)
  {
    BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x189604DB0], v12);
    int v15 = BinaryData;
    if (BinaryData)
    {
      BytePtr = CFDataGetBytePtr(BinaryData);
      int Length = CFDataGetLength(v15);
      goto LABEL_20;
    }
  }

  else
  {
    int v15 = 0LL;
  }

  BytePtr = 0LL;
  int Length = 0;
LABEL_20:
  BOOL v18 = CFDictionaryGetValue(a2, @"SOFTAP_SOFTAP_OS_VER");
  if (!v18)
  {
    uint64_t v20 = 0LL;
    goto LABEL_24;
  }

  uint64_t v19 = (const __CFData *)_CFPropertyListCreateBinaryData(*v13, v18);
  uint64_t v20 = v19;
  if (!v19)
  {
LABEL_24:
    uint64_t v21 = 0LL;
    int v22 = 0;
    goto LABEL_25;
  }

  uint64_t v21 = CFDataGetBytePtr(v19);
  int v22 = CFDataGetLength(v20);
LABEL_25:
  uint64_t v23 = (const __CFNumber *)CFDictionaryGetValue(a2, @"SOFTAP_BRINGUP_METHOD");
  if (v23) {
    CFNumberGetValue(v23, kCFNumberSInt16Type, &valuePtr);
  }
  uint64_t v24 = getprogname();
  int v25 = !strncmp("sharingd", v24, 8uLL) || v11;
  wifi_manager_set_mis_discovery_state(v4[1], v27, v26, v25, v9, (uint64_t)BytePtr, Length, (uint64_t)v21, v22, valuePtr);
  WiFiSendRightRelease(v4);
  if (v15) {
    CFRelease(v15);
  }
  if (v20) {
    CFRelease(v20);
  }
}

unsigned int *WiFiManagerClientGetMISDiscoveryState(uint64_t a1)
{
  int v3 = 0;
  uint64_t result = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (result)
  {
    int v2 = result;
    wifi_manager_get_mis_discovery_state(result[1], &v3);
    WiFiSendRightRelease(v2);
    return (unsigned int *)(v3 != 0);
  }

  return result;
}

void WiFiManagerClientSetWoWState(uint64_t a1, int a2)
{
  unsigned int v4 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v4)
  {
    uint64_t v5 = v4;
    *(_BYTE *)(a1 + 80) = a2;
    wifi_manager_set_wow_state(v4[1], a2);
    WiFiSendRightRelease(v5);
  }

BOOL WiFiManagerClientGetWoWState(uint64_t a1)
{
  size_t v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  int v2 = v1;
  if (v1
    && ((wifi_manager_copy_wow_state(v1[1], &length[1], length), *(void *)&length[1])
      ? (BOOL v3 = length[0] == 0)
      : (BOOL v3 = 1),
        !v3 && (unsigned int v4 = (const __CFDictionary *)_WiFiCopyUnserialized(*(UInt8 **)&length[1], length[0])) != 0LL))
  {
    uint64_t v5 = v4;
    BOOL v6 = CFDictionaryGetValue(v4, @"WoWEnabled") == (const void *)*MEMORY[0x189604DE8];
    CFRelease(v5);
  }

  else
  {
    BOOL v6 = 0LL;
  }

  _WiFiVMDealloc(*(uint64_t *)&length[1], length[0]);
  WiFiSendRightRelease(v2);
  return v6;
}

CFPropertyListRef WiFiManagerClientCopyWoWState(uint64_t a1)
{
  size_t v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  int v2 = v1;
  if (!v1)
  {
    unsigned int v3 = 0;
LABEL_9:
    CFPropertyListRef v5 = 0LL;
    goto LABEL_7;
  }

  wifi_manager_copy_wow_state(v1[1], &length[1], length);
  size_t v1 = *(unsigned int **)&length[1];
  unsigned int v3 = length[0];
  if (*(void *)&length[1]) {
    BOOL v4 = length[0] == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4) {
    goto LABEL_9;
  }
  CFPropertyListRef v5 = _WiFiCopyUnserialized(*(UInt8 **)&length[1], length[0]);
  size_t v1 = *(unsigned int **)&length[1];
  unsigned int v3 = length[0];
LABEL_7:
  _WiFiVMDealloc((uint64_t)v1, v3);
  WiFiSendRightRelease(v2);
  return v5;
}

uint64_t WiFiManagerClientGetWoWCapability(uint64_t a1)
{
  int v4 = 0;
  size_t v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  int v2 = v1;
  if (v1) {
    wifi_manager_get_wow_capability(v1[1], &v4);
  }
  WiFiSendRightRelease(v2);
  return v4;
}

BOOL WiFiManagerClientQuiesceWiFi(uint64_t a1, int a2)
{
  return WiFiManagerClienSetQuiesceState(a1, a2) == 0;
}

uint64_t WiFiManagerClienSetQuiesceState(uint64_t a1, int a2)
{
  unsigned int v6 = 0;
  unsigned int v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (!v3) {
    return 4294963394LL;
  }
  int v4 = v3;
  wifi_manager_set_quiesce_state(v3[1], a2, &v6);
  WiFiSendRightRelease(v4);
  return v6;
}

BOOL WiFiManagerClientGetQuiesceState(uint64_t a1)
{
  int v4 = 0;
  size_t v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  int v2 = v1;
  if (v1) {
    wifi_manager_get_quiesce_state(v1[1], &v4);
  }
  WiFiSendRightRelease(v2);
  return v4 != 0;
}

BOOL WiFiManagerClientIsTetheringSupported(uint64_t a1)
{
  int v4 = 0;
  size_t v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  int v2 = v1;
  if (v1) {
    wifi_manager_is_tethering_supported(v1[1], &v4);
  }
  WiFiSendRightRelease(v2);
  return v4 != 0;
}

CFPropertyListRef WiFiManagerClientCopyMISStats(uint64_t a1)
{
  size_t v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  int v2 = v1;
  if (!v1)
  {
    unsigned int v3 = 0;
LABEL_9:
    CFPropertyListRef v5 = 0LL;
    goto LABEL_7;
  }

  wifi_manager_copy_mis_stats(v1[1], &length[1], length);
  size_t v1 = *(unsigned int **)&length[1];
  unsigned int v3 = length[0];
  if (*(void *)&length[1]) {
    BOOL v4 = length[0] == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4) {
    goto LABEL_9;
  }
  CFPropertyListRef v5 = _WiFiCopyUnserialized(*(UInt8 **)&length[1], length[0]);
  size_t v1 = *(unsigned int **)&length[1];
  unsigned int v3 = length[0];
LABEL_7:
  _WiFiVMDealloc((uint64_t)v1, v3);
  WiFiSendRightRelease(v2);
  return v5;
}

void WiFiManagerClientResetMISStats(uint64_t a1)
{
  size_t v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  int v2 = v1;
  if (v1) {
    wifi_manager_reset_mis_stats(v1[1]);
  }
  WiFiSendRightRelease(v2);
}

unsigned int *WiFiManagerClientIsNanPhsNetworkAssociated(uint64_t a1)
{
  int v3 = 0;
  uint64_t result = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (result)
  {
    int v2 = result;
    wifi_manager_get_nanclient_assoc_status(result[1], &v3);
    WiFiSendRightRelease(v2);
    return (unsigned int *)(v3 != 0);
  }

  return result;
}

void WiFiManagerClientSetNANOffHeadConnectionExpiry(uint64_t a1, double a2)
{
  int v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v3)
  {
    BOOL v4 = v3;
    wifi_manager_set_nan_off_head_connection_expiry(v3[1], a2);
    WiFiSendRightRelease(v4);
  }

double WiFiManagerClientGetNANOffHeadConnectionExpiry(uint64_t a1)
{
  double v4 = 0.0;
  size_t v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (!v1) {
    return 0.0;
  }
  int v2 = v1;
  wifi_manager_get_nan_off_head_connection_expiry(v1[1], &v4);
  WiFiSendRightRelease(v2);
  return v4;
}

uint64_t WiFiManagerClientIsAlwaysOnWiFiSupported(uint64_t a1)
{
  int v4 = 0;
  size_t v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  int v2 = v1;
  if (v1) {
    wifi_manager_is_always_on_wifi_supported(v1[1], &v4);
  }
  WiFiSendRightRelease(v2);
  return v4;
}

uint64_t WiFiManagerClientIsWiFiAlwaysOnSupported()
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  uint64_t v0 = MGGetProductType();
  uint64_t v1 = 0LL;
  BOOL v5 = v0 == 1302273958 || v0 == 761631964 || v0 == 262180327 || v0 == 2445473385LL;
  if (v0 > 1302273957)
  {
    if (v0 == 1302273958) {
      goto LABEL_20;
    }
    uint64_t v6 = 2445473385LL;
  }

  else
  {
    if (v0 == 262180327) {
      goto LABEL_20;
    }
    uint64_t v6 = 761631964LL;
  }

  if (v0 != v6) {
    uint64_t v1 = 1LL;
  }
LABEL_20:
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
  {
    int v7 = "supported";
    if (v5) {
      int v7 = "not supported";
    }
    int v9 = 136315394;
    uint64_t v10 = "WiFiManagerClientIsWiFiAlwaysOnSupported";
    __int16 v11 = 2080;
    int v12 = v7;
    _os_log_impl( &dword_18658B000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_INFO,  "%s: always on wifi %s",  (uint8_t *)&v9,  0x16u);
  }

  return v1;
}

CFPropertyListRef WiFiManagerClientCopyLocaleStats(uint64_t a1)
{
  uint64_t v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (!v1) {
    return 0LL;
  }
  int v2 = v1;
  wifi_manager_copy_locale_stats(v1[1], &length[1], length);
  if (*(void *)&length[1]) {
    BOOL v3 = length[0] == 0;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3 || (CFPropertyListRef v4 = _WiFiCopyUnserialized(*(UInt8 **)&length[1], length[0])) == 0LL)
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
    CFPropertyListRef v4 = 0LL;
  }

  _WiFiVMDealloc(*(uint64_t *)&length[1], length[0]);
  WiFiSendRightRelease(v2);
  return v4;
}

unsigned int *WiFiManagerClientMergeKnownNetworks(uint64_t a1, const void *a2)
{
  int v9 = 0;
  uint64_t result = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (result)
  {
    CFPropertyListRef v4 = result;
    BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x189604DB0], a2);
    if (BinaryData)
    {
      uint64_t v6 = BinaryData;
      BytePtr = CFDataGetBytePtr(BinaryData);
      int Length = CFDataGetLength(v6);
      wifi_manager_merge_known_networks(v4[1], (uint64_t)BytePtr, Length, &v9);
      CFRelease(v6);
    }

    else
    {
      wifi_manager_merge_known_networks(v4[1], 0LL, 0, &v9);
    }

    WiFiSendRightRelease(v4);
    return (unsigned int *)(v9 != 0);
  }

  return result;
}

unsigned int *WiFiManagerClientSetMisPassword(uint64_t a1, const void *a2)
{
  int v9 = -3902;
  uint64_t result = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (result)
  {
    CFPropertyListRef v4 = result;
    BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x189604DB0], a2);
    if (BinaryData)
    {
      uint64_t v6 = BinaryData;
      BytePtr = CFDataGetBytePtr(BinaryData);
      int Length = CFDataGetLength(v6);
      wifi_manager_mis_set_password(v4[1], (uint64_t)BytePtr, Length, &v9);
      CFRelease(v6);
    }

    else
    {
      wifi_manager_mis_set_password(v4[1], 0LL, 0, &v9);
    }

    WiFiSendRightRelease(v4);
    return (unsigned int *)(v9 == 0);
  }

  return result;
}

CFPropertyListRef WiFiManagerClientCopyMisPassword(uint64_t a1)
{
  uint64_t v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (!v1) {
    return 0LL;
  }
  int v2 = v1;
  wifi_manager_mis_copy_password(v1[1], &length[1], length);
  uint64_t v3 = *(void *)&length[1];
  unsigned int v4 = length[0];
  if (*(void *)&length[1]) {
    BOOL v5 = length[0] == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    CFPropertyListRef v6 = 0LL;
  }

  else
  {
    CFPropertyListRef v6 = _WiFiCopyUnserialized(*(UInt8 **)&length[1], length[0]);
    uint64_t v3 = *(void *)&length[1];
    unsigned int v4 = length[0];
  }

  _WiFiVMDealloc(v3, v4);
  WiFiSendRightRelease(v2);
  return v6;
}

void WiFiManagerClientSetRetryIntervalCap(uint64_t a1, int a2)
{
  uint64_t v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v3)
  {
    unsigned int v4 = v3;
    wifi_manager_set_retry_cap(v3[1], a2);
    WiFiSendRightRelease(v4);
  }

uint64_t WiFiManagerClientGetRetryIntervalCap(uint64_t a1)
{
  unsigned int v4 = 0;
  uint64_t v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  int v2 = v1;
  if (v1) {
    wifi_manager_get_retry_cap(v1[1], &v4);
  }
  WiFiSendRightRelease(v2);
  return v4;
}

void WiFiManagerClientSetBackgroundScanNetworks(uint64_t a1, const __CFArray *a2)
{
  uint64_t v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  unsigned int v4 = v3;
  if (a2)
  {
    if (v3)
    {
      RecordsFromNetworks = _WiFiCreateRecordsFromNetworks(a2);
      if (RecordsFromNetworks)
      {
        CFPropertyListRef v6 = RecordsFromNetworks;
        BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData( (CFAllocatorRef)*MEMORY[0x189604DB0],  RecordsFromNetworks);
        if (BinaryData)
        {
          BOOL v8 = BinaryData;
          int v9 = v4[1];
          BytePtr = CFDataGetBytePtr(BinaryData);
          int Length = CFDataGetLength(v8);
          wifi_manager_set_background_scan_networks(v9, (uint64_t)BytePtr, Length);
          CFRelease(v8);
        }

        CFRelease(v6);
      }
    }
  }

  WiFiSendRightRelease(v4);
}

void WiFiManagerClientSetBGScanCacheState(uint64_t a1, const void *a2)
{
  uint64_t v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v3)
  {
    unsigned int v4 = v3;
    if (a2
      && (BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x189604DB0], a2)) != 0LL)
    {
      CFPropertyListRef v6 = BinaryData;
      BytePtr = CFDataGetBytePtr(BinaryData);
      int Length = CFDataGetLength(v6);
      wifi_manager_set_bgscan_cache_state(v4[1], (uint64_t)BytePtr, Length);
      CFRelease(v6);
    }

    else
    {
      wifi_manager_set_bgscan_cache_state(v4[1], 0LL, 0);
    }

    WiFiSendRightRelease(v4);
  }

void WiFiManagerClientAddNetwork(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v3 && (CFDictionaryRef v4 = WiFiNetworkCopyRecord(a2)) != 0LL)
  {
    CFDictionaryRef v5 = v4;
    BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x189604DB0], v4);
    if (BinaryData)
    {
      int v7 = BinaryData;
      int v8 = v3[1];
      BytePtr = CFDataGetBytePtr(BinaryData);
      int Length = CFDataGetLength(v7);
      wifi_manager_add_network(v8, (uint64_t)BytePtr, Length);
      CFRelease(v7);
    }

    WiFiSendRightRelease(v3);
    CFRelease(v5);
  }

  else
  {
    WiFiSendRightRelease(v3);
  }

uint64_t WiFiManagerClientAddNetworkAsync( uint64_t a1, uint64_t a2, CFTypeRef BinaryData, uint64_t a4, uint64_t a5)
{
  if (!a1)
  {
    uint64_t v10 = 0LL;
    goto LABEL_16;
  }

  uint64_t v10 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (!v10)
  {
LABEL_16:
    uint64_t v21 = 74LL;
    goto LABEL_13;
  }

  CFDictionaryRef v11 = WiFiNetworkCopyRecord(a2);
  if (!v11)
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
    uint64_t v21 = 72LL;
    goto LABEL_13;
  }

  CFDictionaryRef v12 = v11;
  if (*(void *)(a1 + 256) || *(void *)(a1 + 264))
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
    uint64_t v21 = 37LL;
    goto LABEL_12;
  }

  *(void *)(a1 + 256) = a4;
  *(void *)(a1 + 264) = a5;
  uint64_t v13 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  if (BinaryData)
  {
    BinaryData = _CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x189604DB0], BinaryData);
    BytePtr = CFDataGetBytePtr((CFDataRef)BinaryData);
    int Length = CFDataGetLength((CFDataRef)BinaryData);
  }

  else
  {
    BytePtr = 0LL;
    int Length = 0;
  }

  CFStringRef v16 = (const __CFData *)_CFPropertyListCreateBinaryData(v13, v12);
  if (!v16)
  {
    uint64_t v21 = 72LL;
    if (!BinaryData) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }

  __int128 v17 = v16;
  int v18 = v10[1];
  uint64_t v19 = CFDataGetBytePtr(v16);
  int v20 = CFDataGetLength(v17);
  wifi_manager_add_network_async(v18, (uint64_t)v19, v20, (uint64_t)BytePtr, Length);
  CFRelease(v17);
  uint64_t v21 = 0LL;
  if (BinaryData) {
LABEL_11:
  }
    CFRelease(BinaryData);
LABEL_12:
  CFRelease(v12);
LABEL_13:
  WiFiSendRightRelease(v10);
  return v21;
}

void WiFiManagerClientUpdateNetwork(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v3)
  {
    CFDictionaryRef v4 = WiFiNetworkCopyRecord(a2);
    if (v4)
    {
      CFDictionaryRef v5 = v4;
      BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x189604DB0], v4);
      if (BinaryData)
      {
        int v7 = BinaryData;
        int v8 = v3[1];
        BytePtr = CFDataGetBytePtr(BinaryData);
        int Length = CFDataGetLength(v7);
        wifi_manager_update_network(v8, (uint64_t)BytePtr, Length);
        CFRelease(v7);
      }

      CFRelease(v5);
    }
  }

  WiFiSendRightRelease(v3);
}

void WiFiManagerClientRemoveNetwork(uint64_t a1, const void *a2)
{
  CFDictionaryRef v4 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  CFDictionaryRef v5 = getprogname();
  CFStringEncoding SystemEncoding = CFStringGetSystemEncoding();
  CFStringRef v7 = CFStringCreateWithCString(v4, v5, SystemEncoding);
  if (v7)
  {
    CFStringRef v8 = v7;
    if (CFEqual(v7, @"mobilewifitool"))
    {
      uint64_t v9 = a1;
      uint64_t v10 = a2;
      int v11 = 24;
    }

    else
    {
      if (*(_BYTE *)(a1 + 81)) {
        int v11 = 2;
      }
      else {
        int v11 = 22;
      }
      uint64_t v9 = a1;
      uint64_t v10 = a2;
    }

    WiFiManagerClientRemoveNetworkWithReason(v9, v10, v11);
    CFRelease(v8);
  }

  else
  {
    if (*(_BYTE *)(a1 + 81)) {
      int v12 = 2;
    }
    else {
      int v12 = 22;
    }
    WiFiManagerClientRemoveNetworkWithReason(a1, a2, v12);
  }

void WiFiManagerClientRemoveNetworkWithReason(uint64_t a1, const void *a2, int a3)
{
  if (a2)
  {
    CFDictionaryRef v5 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
    if (v5)
    {
      CFDictionaryRef v6 = WiFiNetworkCopyRecord((uint64_t)a2);
      if (v6)
      {
        CFDictionaryRef v7 = v6;
        BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x189604DB0], v6);
        if (BinaryData)
        {
          uint64_t v9 = BinaryData;
          int v10 = v5[1];
          BytePtr = CFDataGetBytePtr(BinaryData);
          int Length = CFDataGetLength(v9);
          wifi_manager_remove_network(v10, (uint64_t)BytePtr, Length, a3);
          CFRelease(v9);
        }

        int Type = WiFiNetworkGetType((uint64_t)a2);
        SSID = WiFiNetworkGetSSID(a2);
        objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C](SSID));
        if (Type != 2)
        {
          if ((a3 & 0xFFFFFFFE) == 0xC)
          {
            objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
            uint64_t v15 = WiFiNetworkSetPasswordSyncable();
          }

          objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C](v15));
          WiFiNetworkRemovePassword(a2);
        }

        if (MEMORY[0x18960F330])
        {
          if (WiFiNetworkIsEAP((uint64_t)a2))
          {
            WiFiNetworkGetSSID(a2);
            EAPTLSRemoveTrustExceptionsBindings();
          }
        }

        CFRelease(v7);
      }
    }

    WiFiSendRightRelease(v5);
  }

void WiFiManagerClientRemoveNetworksWithBundleIdentifier(uint64_t a1, const void *a2)
{
  uint64_t v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v3)
  {
    if (a2)
    {
      BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x189604DB0], a2);
      if (BinaryData)
      {
        CFDictionaryRef v5 = BinaryData;
        BytePtr = CFDataGetBytePtr(BinaryData);
        int Length = CFDataGetLength(v5);
        wifi_manager_remove_networks_with_bundle_identifier(v3[1], (uint64_t)BytePtr, Length);
        CFRelease(v5);
      }
    }

    else
    {
      objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
    }
  }

  WiFiSendRightRelease(v3);
}

void WiFiManagerClientEnableNetwork(uint64_t a1, uint64_t a2)
{
}

void __WiFiManagerClientSetNetworkState(uint64_t a1, uint64_t a2, int a3, int a4)
{
  CFDictionaryRef v7 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v7)
  {
    CFDictionaryRef v8 = WiFiNetworkCopyRecord(a2);
    if (v8)
    {
      CFDictionaryRef v9 = v8;
      BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x189604DB0], v8);
      if (BinaryData)
      {
        int v11 = BinaryData;
        int v12 = v7[1];
        BytePtr = CFDataGetBytePtr(BinaryData);
        int Length = CFDataGetLength(v11);
        wifi_manager_set_network_state(v12, (uint64_t)BytePtr, Length, a3, a4);
        CFRelease(v11);
      }

      CFRelease(v9);
    }
  }

  WiFiSendRightRelease(v7);
}

void WiFiManagerClientDisableNetwork(uint64_t a1, uint64_t a2)
{
}

void WiFiManagerClientEnableNetworksWithBundleIdentifier(uint64_t a1, const void *a2)
{
}

void __WiFiManagerClientSetNetworksStateWithBundleIdentifier(uint64_t a1, const void *a2, int a3)
{
  CFDictionaryRef v5 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v5)
  {
    if (a2)
    {
      BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x189604DB0], a2);
      if (BinaryData)
      {
        CFDictionaryRef v7 = BinaryData;
        BytePtr = CFDataGetBytePtr(BinaryData);
        int Length = CFDataGetLength(v7);
        wifi_manager_set_networks_state_with_bundle_identifier(v5[1], (uint64_t)BytePtr, Length, a3);
        CFRelease(v7);
      }
    }

    else
    {
      objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
    }
  }

  WiFiSendRightRelease(v5);
}

void WiFiManagerClientDisableNetworksWithBundleIdentifier(uint64_t a1, const void *a2)
{
}

void WiFiManagerClientTemporarilyDisableNetwork(uint64_t a1, uint64_t a2)
{
}

unsigned int *WiFiManagerClientIsNetworkEnabled(uint64_t a1, uint64_t a2)
{
  int v12 = 0;
  uint64_t result = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (result)
  {
    CFDictionaryRef v4 = result;
    CFDictionaryRef v5 = WiFiNetworkCopyRecord(a2);
    if (v5)
    {
      CFDictionaryRef v6 = v5;
      BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x189604DB0], v5);
      if (BinaryData)
      {
        CFDictionaryRef v8 = BinaryData;
        mach_port_t v9 = v4[1];
        BytePtr = CFDataGetBytePtr(BinaryData);
        int Length = CFDataGetLength(v8);
        wifi_manager_get_network_state(v9, (uint64_t)BytePtr, Length, &v12);
        CFRelease(v8);
      }

      CFRelease(v6);
    }

    WiFiSendRightRelease(v4);
    return (unsigned int *)(v12 != 0);
  }

  return result;
}

__CFArray *WiFiManagerClientCopyNetworks(uint64_t a1)
{
  return __WiFiManagerClientCopyNetworks(a1, 0);
}

__CFArray *__WiFiManagerClientCopyNetworks(uint64_t a1, int a2)
{
  uint64_t v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  CFDictionaryRef v4 = v3;
  if (v3
    && ((wifi_manager_copy_networks(v3[1], a2, &length[1], length), *(void *)&length[1])
      ? (BOOL v5 = length[0] == 0)
      : (BOOL v5 = 1),
        !v5 && (CFDictionaryRef v6 = (const __CFArray *)_WiFiCopyUnserialized(*(UInt8 **)&length[1], length[0])) != 0LL))
  {
    CFDictionaryRef v7 = v6;
    NetworksFromRecords = _WiFiCreateNetworksFromRecords(v6);
    CFRelease(v7);
  }

  else
  {
    NetworksFromRecords = 0LL;
  }

  _WiFiVMDealloc(*(uint64_t *)&length[1], length[0]);
  WiFiSendRightRelease(v4);
  return NetworksFromRecords;
}

__CFArray *WiFiManagerClientCopyEnabledNetworks(uint64_t a1)
{
  return __WiFiManagerClientCopyNetworks(a1, 1);
}

__CFArray *WiFiManagerClientCopyMutableNetworks(uint64_t a1)
{
  uint64_t v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  int v2 = v1;
  if (v1
    && ((wifi_manager_copy_networks(v1[1], 0, &length[1], length), *(void *)&length[1])
      ? (BOOL v3 = length[0] == 0)
      : (BOOL v3 = 1),
        !v3 && (CFDictionaryRef v4 = (const __CFArray *)_WiFiCopyUnserialized(*(UInt8 **)&length[1], length[0])) != 0LL))
  {
    BOOL v5 = v4;
    NetworksFromRecords = _WiFiCreateNetworksFromRecords(v4);
    CFRelease(v5);
  }

  else
  {
    NetworksFromRecords = 0LL;
  }

  _WiFiVMDealloc(*(uint64_t *)&length[1], length[0]);
  WiFiSendRightRelease(v2);
  return NetworksFromRecords;
}

__CFArray *WiFiManagerClientCopyNetworksWithBundleIdentifier(uint64_t a1, const __CFString *a2)
{
  if (!a2)
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
    return 0LL;
  }

  BOOL v3 = __WiFiManagerClientCopyNetworks(a1, 0);
  if (!v3) {
    return 0LL;
  }
  CFDictionaryRef v4 = v3;
  CFMutableDictionaryRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, MEMORY[0x189605228]);
  if (Mutable)
  {
    CFIndex Count = CFArrayGetCount(v4);
    if (Count >= 1)
    {
      CFIndex v7 = Count;
      for (CFIndex i = 0LL; i != v7; ++i)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v4, i);
        if (ValueAtIndex)
        {
          int v10 = ValueAtIndex;
          BundleIdentifier = (const __CFString *)WiFiNetworkGetBundleIdentifier((uint64_t)ValueAtIndex);
          if (BundleIdentifier)
          {
            if (CFStringCompare(BundleIdentifier, a2, 0LL) == kCFCompareEqualTo) {
              CFArrayAppendValue(Mutable, v10);
            }
          }
        }
      }
    }

    if (!CFArrayGetCount(Mutable))
    {
      CFRelease(Mutable);
      CFMutableDictionaryRef Mutable = 0LL;
    }
  }

  CFRelease(v4);
  return Mutable;
}

uint64_t WiFiManagerClientGetAskToJoinState(uint64_t a1)
{
  unsigned int v5 = 0;
  uint64_t v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  int v2 = v1;
  if (v1)
  {
    wifi_manager_get_ask_to_join_state(v1[1], &v5);
    uint64_t v3 = v5;
  }

  else
  {
    uint64_t v3 = 0LL;
  }

  WiFiSendRightRelease(v2);
  return v3;
}

CFPropertyListRef WiFiManagerClientCopyVersionInfo(uint64_t a1)
{
  uint64_t v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (!v1) {
    return 0LL;
  }
  int v2 = v1;
  wifi_manager_copy_version_info(v1[1], &length[1], length);
  uint64_t v3 = *(void *)&length[1];
  unsigned int v4 = length[0];
  if (*(void *)&length[1]) {
    BOOL v5 = length[0] == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    CFPropertyListRef v6 = 0LL;
  }

  else
  {
    CFPropertyListRef v6 = _WiFiCopyUnserialized(*(UInt8 **)&length[1], length[0]);
    uint64_t v3 = *(void *)&length[1];
    unsigned int v4 = length[0];
  }

  _WiFiVMDealloc(v3, v4);
  WiFiSendRightRelease(v2);
  return v6;
}

CFPropertyListRef WiFiManagerClientCopyClientNames(uint64_t a1)
{
  uint64_t v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (!v1) {
    return 0LL;
  }
  int v2 = v1;
  wifi_manager_copy_client_names(v1[1], &length[1], length);
  uint64_t v3 = *(void *)&length[1];
  unsigned int v4 = length[0];
  if (*(void *)&length[1]) {
    BOOL v5 = length[0] == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    CFPropertyListRef v6 = 0LL;
  }

  else
  {
    CFPropertyListRef v6 = _WiFiCopyUnserialized(*(UInt8 **)&length[1], length[0]);
    uint64_t v3 = *(void *)&length[1];
    unsigned int v4 = length[0];
  }

  _WiFiVMDealloc(v3, v4);
  WiFiSendRightRelease(v2);
  return v6;
}

__CFArray *WiFiManagerClientCopyDevices(uint64_t a1)
{
  v9[1] = *MEMORY[0x1895F89C0];
  os_unfair_recursive_lock_lock_with_options();
  int v2 = *(const __CFDictionary **)(a1 + 64);
  if (v2 && (CFIndex Count = CFDictionaryGetCount(v2)) != 0)
  {
    uint64_t v4 = Count;
    MEMORY[0x1895F8858]();
    CFPropertyListRef v6 = (const void **)((char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL));
    memset(v6, 170, v5);
    CFDictionaryGetKeysAndValues(*(CFDictionaryRef *)(a1 + 64), 0LL, v6);
    CFMutableDictionaryRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, MEMORY[0x189605228]);
    if (v4 >= 1)
    {
      do
      {
        ++v6;
        --v4;
      }

      while (v4);
    }
  }

  else
  {
    CFMutableDictionaryRef Mutable = 0LL;
  }

  os_unfair_recursive_lock_unlock();
  return Mutable;
}

CFArrayRef WiFiManagerClientCopyInterfaces(uint64_t a1)
{
  v9[1] = *MEMORY[0x1895F89C0];
  os_unfair_recursive_lock_lock_with_options();
  int v2 = *(const __CFDictionary **)(a1 + 64);
  if (v2 && (CFIndex Count = CFDictionaryGetCount(v2)) != 0)
  {
    CFIndex v4 = Count;
    MEMORY[0x1895F8858]();
    CFPropertyListRef v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    memset(v6, 170, v5);
    CFDictionaryGetKeysAndValues(*(CFDictionaryRef *)(a1 + 64), 0LL, (const void **)v6);
    CFArrayRef v7 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x189604DB0], (const void **)v6, v4, MEMORY[0x189605228]);
  }

  else
  {
    CFArrayRef v7 = 0LL;
  }

  os_unfair_recursive_lock_unlock();
  return v7;
}

const void *WiFiManagerClientGetDevice(uint64_t a1, const void *a2)
{
  Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 64), a2);
  if (!Value && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
    WiFiManagerClientGetDevice_cold_1();
  }
  os_unfair_recursive_lock_unlock();
  return Value;
}

uint64_t WiFiManagerClientAddDevice(uint64_t a1, const void *a2, uint64_t a3)
{
  return __WiFiManagerClientAddDevice(a1, a2, a3, 0LL);
}

uint64_t __WiFiManagerClientAddDevice(uint64_t a1, const void *a2, uint64_t a3, __CFArray *a4)
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  if (!a2 || !*(void *)(a1 + 64)) {
    return 0LL;
  }
  os_unfair_recursive_lock_lock_with_options();
  uint64_t v8 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0LL);
  if (!v8)
  {
LABEL_10:
    WiFiSendRightRelease((unsigned int *)v8);
    os_unfair_recursive_lock_unlock();
    return 0LL;
  }

  if (CFDictionaryContainsKey(*(CFDictionaryRef *)(a1 + 64), a2))
  {
    Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 64), a2);
    if (Value)
    {
      uint64_t v10 = (uint64_t)Value;
      Servermach_port_name_t Port = _WiFiDeviceClientGetServerPort((uint64_t)Value);
      int v12 = *(_DWORD *)(v8 + 4);
      if (ServerPort != v12)
      {
        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
        {
          int v17 = _WiFiDeviceClientGetServerPort(v10);
          int v18 = *(_DWORD *)(v8 + 4);
          int v19 = 136315906;
          int v20 = "__WiFiManagerClientAddDevice";
          __int16 v21 = 2112;
          int v22 = a2;
          __int16 v23 = 1024;
          int v24 = v17;
          __int16 v25 = 1024;
          int v26 = v18;
          _os_log_error_impl( &dword_18658B000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "%s: for device [%@] updating server port from [%d] to [%d]",  (uint8_t *)&v19,  0x22u);
          int v12 = *(_DWORD *)(v8 + 4);
        }

        _WiFiDeviceClientSetServerPort(v10, v12);
        _WiFiDeviceClientSendEventMaskToServer(v10);
        _WiFiDeviceClientDispatchAssociationResult(v10, 0LL, 0LL, 5LL);
      }
    }

    goto LABEL_10;
  }

  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
    __WiFiManagerClientAddDevice_cold_2();
  }
  int v14 = (const void *)_WiFiDeviceClientCreate(*MEMORY[0x189604DB0], a1, *(_DWORD *)(v8 + 4), a2, a3);
  if (!v14) {
    goto LABEL_10;
  }
  uint64_t v15 = v14;
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 64), a2, v14);
  if ((*(_BYTE *)(a1 + 72) & 4) != 0)
  {
    uint64_t v16 = *(void *)(a1 + 128);
    WiFiSendRightRelease((unsigned int *)v8);
    os_unfair_recursive_lock_unlock();
    if (!a3 && v16)
    {
      if (a4)
      {
        CFArrayAppendValue(a4, v15);
        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG)) {
          __WiFiManagerClientAddDevice_cold_1();
        }
      }

      else
      {
        (*(void (**)(uint64_t, const void *, void))(a1 + 128))(a1, v15, *(void *)(a1 + 136));
      }
    }
  }

  else
  {
    WiFiSendRightRelease((unsigned int *)v8);
    os_unfair_recursive_lock_unlock();
  }

  CFRelease(v15);
  return 1LL;
}

void WiFiManagerClientRemoveDevice(uint64_t a1, const void *a2, int a3, int a4)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
  {
    int v11 = 136315650;
    int v12 = "WiFiManagerClientRemoveDevice";
    __int16 v13 = 2112;
    int v14 = a2;
    __int16 v15 = 2112;
    uint64_t v16 = a1;
    _os_log_impl( &dword_18658B000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_INFO,  "%s: removed %@ (manager %@)",  (uint8_t *)&v11,  0x20u);
  }

  if (a2)
  {
    os_unfair_recursive_lock_lock_with_options();
    if (a3)
    {
      if (*(void *)(a1 + 144))
      {
        Device = WiFiManagerClientGetDevice(a1, a2);
        mach_port_t v9 = Device;
        if (Device) {
          CFRetain(Device);
        }
        if (!a4) {
          CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 64), a2);
        }
      }

      else
      {
        mach_port_t v9 = 0LL;
      }

      os_unfair_recursive_lock_unlock();
      if (!a4)
      {
        uint64_t v10 = *(void (**)(uint64_t, const void *, const void *, void, void))(a1 + 144);
        if (v10) {
          v10(a1, v9, a2, 0LL, *(void *)(a1 + 152));
        }
      }

      if (v9) {
        CFRelease(v9);
      }
    }

    else
    {
      os_unfair_recursive_lock_unlock();
    }
  }

void WiFiManagerClientDispatchAttachmentEvent(void *a1, CFStringRef theString, int a3)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  if (a3) {
    uint64_t v6 = 6LL;
  }
  else {
    uint64_t v6 = 0LL;
  }
  if (theString && a3 && CFStringHasPrefix(theString, @"ap")) {
    uint64_t v6 = 7LL;
  }
  if (__WiFiManagerClientAddDevice((uint64_t)a1, theString, v6, 0LL))
  {
    Device = WiFiManagerClientGetDevice((uint64_t)a1, theString);
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
    {
      int v10 = 136316162;
      int v11 = "WiFiManagerClientDispatchAttachmentEvent";
      __int16 v12 = 2112;
      CFStringRef v13 = theString;
      __int16 v14 = 1024;
      int v15 = a3;
      __int16 v16 = 2112;
      uint64_t v17 = a1;
      __int16 v18 = 2112;
      int v19 = Device;
      _os_log_impl( &dword_18658B000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_INFO,  "%s: attached %@ (isVirtual %d manager %@ deviceClient %@)",  (uint8_t *)&v10,  0x30u);
    }

    if (a3)
    {
      uint64_t v8 = (void (*)(void *, const void *, CFStringRef, uint64_t, void))a1[18];
      if (v8) {
        v8(a1, Device, theString, 1LL, a1[19]);
      }
    }

    else
    {
      mach_port_t v9 = (void (*)(void *, const void *, void))a1[16];
      if (v9) {
        v9(a1, Device, a1[17]);
      }
    }
  }

  else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
  {
    WiFiManagerClientDispatchAttachmentEvent_cold_1();
  }

void *WiFiManagerClientRegisterServerRestartCallback(void *result, uint64_t a2, uint64_t a3)
{
  result[28] = a2;
  result[29] = a3;
  result[9] = result[9] & 0xFFFFFFFFFFFEFFFFLL | ((unint64_t)(a2 != 0) << 16);
  return result;
}

void WiFiManagerClientDumpLogs(uint64_t a1, const void *a2)
{
  uint64_t v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v3)
  {
    CFIndex v4 = v3;
    if (a2
      && (BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x189604DB0], a2)) != 0LL)
    {
      uint64_t v6 = BinaryData;
      BytePtr = CFDataGetBytePtr(BinaryData);
      int Length = CFDataGetLength(v6);
      wifi_manager_dump_logs(v4[1], (uint64_t)BytePtr, Length);
      CFRelease(v6);
    }

    else
    {
      wifi_manager_dump_logs(v4[1], 0LL, 0);
    }

    WiFiSendRightRelease(v4);
  }

BOOL WiFiManagerClientIsUserInteractive(BOOL result)
{
  if (result) {
    return *(_BYTE *)(result + 81) != 0;
  }
  return result;
}

void WiFiManagerClientSetTestParams(uint64_t a1, const void *a2)
{
  uint64_t v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v3)
  {
    CFIndex v4 = v3;
    if (a2
      && (BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x189604DB0], a2)) != 0LL)
    {
      uint64_t v6 = BinaryData;
      BytePtr = CFDataGetBytePtr(BinaryData);
      int Length = CFDataGetLength(v6);
      wifi_manager_set_test_params(v4[1], (uint64_t)BytePtr, Length);
      CFRelease(v6);
    }

    else
    {
      wifi_manager_set_test_params(v4[1], 0LL, 0);
    }

    WiFiSendRightRelease(v4);
  }

CFPropertyListRef WiFiManagerClientSetTestParamsAndCopyResponse(uint64_t a1, const void *a2)
{
  uint64_t v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
  if (!v3) {
    goto LABEL_13;
  }
  if (!a2)
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
LABEL_13:
    CFPropertyListRef v8 = 0LL;
    goto LABEL_11;
  }

  BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x189604DB0], a2);
  size_t v5 = BinaryData;
  if (BinaryData)
  {
    BytePtr = CFDataGetBytePtr(BinaryData);
    int v7 = CFDataGetLength(v5);
  }

  else
  {
    BytePtr = 0LL;
    int v7 = 0;
  }

  wifi_manager_copy_test_params(v3[1], (uint64_t)BytePtr, v7, &length[1], length);
  CFPropertyListRef v8 = 0LL;
  if (*(void *)&length[1] && length[0]) {
    CFPropertyListRef v8 = _WiFiCopyUnserialized(*(UInt8 **)&length[1], length[0]);
  }
  if (v5) {
    CFRelease(v5);
  }
LABEL_11:
  _WiFiVMDealloc(*(uint64_t *)&length[1], length[0]);
  WiFiSendRightRelease(v3);
  return v8;
}

void WiFiManagerClientScheduleWithRunLoop(uint64_t a1, __CFRunLoop *a2, const __CFString *a3)
{
  uint64_t v6 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  *(void *)(a1 + 48) = a2;
  *(void *)(a1 + 56) = a3;
  WiFiMIGMachPortScheduleWithRunLoop(*(void *)(a1 + 40), a2, a3);
  if (!v6)
  {
    mach_port_t notify_port = -1431655766;
    if (!notify_register_mach_port("com.apple.wifi.manager.available", &notify_port, 0, (int *)(a1 + 88)))
    {
      int v7 = (const __CFAllocator *)*MEMORY[0x189604DB0];
      CFPropertyListRef v8 = (__CFMachPort *)_CFMachPortCreateWithPort();
      *(void *)(a1 + 96) = v8;
      if (v8)
      {
        RunLoopSource = CFMachPortCreateRunLoopSource(v7, v8, 0LL);
        *(void *)(a1 + 104) = RunLoopSource;
        if (RunLoopSource) {
          CFRunLoopAddSource(a2, RunLoopSource, a3);
        }
      }
    }
  }

  WiFiSendRightRelease(v6);
}

void __WiFiManagerClientAvailableCallback(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  BOOL v5 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
  if (v5) {
    __WiFiManagerClientAvailableCallback_cold_3(v5, v6, v7, v8, v9, v10, v11, v12);
  }
  CFStringRef v13 = __WiFiManagerClientGetOrReconnectServerPort(a4, 0);
  if (*(_DWORD *)(a4 + 320) >= 2u)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
      __WiFiManagerClientAvailableCallback_cold_2();
    }
    WiFiSendRightRelease(v13);
    CFStringRef v13 = __WiFiManagerClientGetOrReconnectServerPort(a4, 1);
  }

  *(_DWORD *)(a4 + 320) = 2;
  __int16 v14 = *(void (**)(uint64_t, void, uint64_t, void))(a4 + 256);
  if (v14)
  {
    v14(a4, 0LL, 74LL, *(void *)(a4 + 264));
    *(void *)(a4 + 256) = 0LL;
    *(void *)(a4 + 264) = 0LL;
  }

  if (v13)
  {
    wifi_manager_set_wow_state(v13[1], *(unsigned __int8 *)(a4 + 80));
    wifi_manager_set_client_type(v13[1], *(_DWORD *)(a4 + 16));
  }

  else
  {
    BOOL v15 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    if (v15) {
      __WiFiManagerClientAvailableCallback_cold_1(v15, v16, v17, v18, v19, v20, v21, v22);
    }
  }

  if ((*(_BYTE *)(a4 + 74) & 1) != 0)
  {
    __int16 v23 = *(void (**)(uint64_t, void))(a4 + 224);
    if (v23) {
      v23(a4, *(void *)(a4 + 232));
    }
  }

  WiFiSendRightRelease(v13);
}

void WiFiManagerClientUnscheduleFromRunLoop(uint64_t a1)
{
  int v2 = (void *)(a1 + 48);
  uint64_t v1 = *(__CFRunLoop **)(a1 + 48);
  if (v1 && (CFIndex v4 = *(const __CFString **)(a1 + 56)) != 0LL)
  {
    WiFiMIGMachPortUnscheduleFromRunLoop(*(void *)(a1 + 40), v1, v4);
    BOOL v5 = *(__CFRunLoopSource **)(a1 + 104);
    if (v5)
    {
      if (*(void *)(a1 + 96)) {
        CFRunLoopRemoveSource(*(CFRunLoopRef *)(a1 + 48), v5, *(CFRunLoopMode *)(a1 + 56));
      }
    }

    void *v2 = 0LL;
    v2[1] = 0LL;
  }

  else
  {
    BOOL v6 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    if (v6) {
      WiFiManagerClientUnscheduleFromRunLoop_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }

void WiFiManagerClientRegisterNotificationCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 112) = a2;
  *(void *)(a1 + 120) = a3;
  if (a2) {
    __WiFiManagerClientOrEventMask(a1, 32LL);
  }
  else {
    __WiFiManagerClientAndEventMask(a1, -33LL);
  }
}

uint64_t _wifi_manager_client_dispatch_notification( unsigned int a1, UInt8 *a2, unsigned int a3, unsigned int a4, unsigned int a5, UInt8 *a6, unsigned int a7, UInt8 *a8, unsigned int a9)
{
  uint64_t v16 = a9;
  uint64_t v17 = WiFiPortCacheCopy(a1);
  uint64_t v18 = a3;
  if (v17)
  {
    uint64_t v19 = v17;
    unsigned int v34 = a4;
    unsigned int v35 = a5;
    CFPropertyListRef v20 = _WiFiCopyUnserialized(a2, a3);
    if (!v20)
    {
LABEL_19:
      CFRelease(v19);
      goto LABEL_20;
    }

    CFPropertyListRef v21 = v20;
    Device = WiFiManagerClientGetDevice((uint64_t)v19, v20);
    CFPropertyListRef v22 = _WiFiCopyUnserialized(a6, a7);
    __int16 v23 = v22;
    CFTypeRef v36 = v21;
    if (v22)
    {
      CFTypeID v24 = CFGetTypeID(v22);
      if (v24 != CFDictionaryGetTypeID())
      {
        __int16 v25 = 0LL;
        uint64_t v27 = 0LL;
LABEL_13:
        CFRelease(v23);
LABEL_14:
        if (v27) {
          CFRelease(v27);
        }
        if (v25) {
          CFRelease(v25);
        }
        CFRelease(v36);
        goto LABEL_19;
      }

      __int16 v25 = WiFiNetworkCreate(*MEMORY[0x189604DB0], v23);
    }

    else
    {
      __int16 v25 = 0LL;
    }

    CFPropertyListRef v26 = _WiFiCopyUnserialized(a8, a9);
    uint64_t v27 = v26;
    if (!v26 || (v28 = a8, v29 = CFGetTypeID(v26), v30 = v29 == CFDictionaryGetTypeID(), a8 = v28, uint64_t v16 = a9, v30))
    {
      uint64_t v31 = (void (*)(void *, const void *, void, void, _WORD *, const void *, void))v19[14];
      if (v31) {
        v31(v19, Device, v34, v35, v25, v27, v19[15]);
      }
    }

    if (!v23) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }

LABEL_20:
  _WiFiVMDealloc((uint64_t)a2, v18);
  _WiFiVMDealloc((uint64_t)a6, a7);
  _WiFiVMDealloc((uint64_t)a8, v16);
  return 0LL;
}

    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
    return 0LL;
  }

  return result;
}

uint64_t _wifi_manager_client_dispatch_wow_state_change(unsigned int a1, unsigned __int8 a2)
{
  uint64_t v3 = WiFiPortCacheCopy(a1);
  if (v3)
  {
    CFIndex v4 = v3;
    if ((*((_BYTE *)v3 + 73) & 0x20) != 0)
    {
      BOOL v5 = (void (*)(const void *, void, void))*((void *)v3 + 26);
      if (v5) {
        v5(v3, a2, *((void *)v3 + 27));
      }
    }

    CFRelease(v4);
  }

  return 0LL;
}

uint64_t _wifi_manager_client_dispatch_scan_results( unsigned int a1, UInt8 *a2, unsigned int a3, UInt8 *a4, unsigned int a5, uint64_t a6)
{
  uint64_t v11 = WiFiPortCacheCopy(a1);
  if (v11)
  {
    uint64_t v12 = v11;
    CFPropertyListRef v13 = _WiFiCopyUnserialized(a2, a3);
    if (v13)
    {
      __int16 v14 = v13;
      Device = WiFiManagerClientGetDevice((uint64_t)v12, v13);
      if (Device)
      {
        uint64_t v16 = (uint64_t)Device;
        uint64_t v17 = (const __CFArray *)_WiFiCopyUnserialized(a4, a5);
        if (v17)
        {
          uint64_t v18 = v17;
          CFTypeID v19 = CFGetTypeID(v17);
          if (v19 == CFArrayGetTypeID())
          {
            NetworksFromRecords = _WiFiCreateNetworksFromRecords(v18);
            _WiFiDeviceClientDispatchScanResults(v16, (uint64_t)NetworksFromRecords, a6);
            if (NetworksFromRecords) {
              CFRelease(NetworksFromRecords);
            }
          }

          else
          {
            objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
            _WiFiDeviceClientDispatchScanResults(v16, 0LL, a6);
          }

          CFRelease(v18);
        }

        else
        {
          _WiFiDeviceClientDispatchScanResults(v16, 0LL, a6);
        }
      }

      CFRelease(v14);
    }

    CFRelease(v12);
  }

  _WiFiVMDealloc((uint64_t)a2, a3);
  _WiFiVMDealloc((uint64_t)a4, a5);
  return 0LL;
}

uint64_t _wifi_manager_client_dispatch_association_result( unsigned int a1, UInt8 *a2, unsigned int a3, UInt8 *a4, unsigned int a5, UInt8 *a6, unsigned int a7, unsigned int a8)
{
  BOOL v15 = WiFiPortCacheCopy(a1);
  uint64_t v16 = a3;
  if (v15)
  {
    uint64_t v17 = v15;
    CFPropertyListRef v18 = _WiFiCopyUnserialized(a2, a3);
    if (v18)
    {
      CFTypeID v19 = v18;
      Device = WiFiManagerClientGetDevice((uint64_t)v17, v18);
      if (Device)
      {
        uint64_t v21 = (uint64_t)Device;
        unsigned int v37 = a8;
        CFPropertyListRef v22 = _WiFiCopyUnserialized(a4, a5);
        if (v22)
        {
          __int16 v23 = v22;
          CFTypeRef v36 = v19;
          CFTypeID v24 = WiFiNetworkCreate(*MEMORY[0x189604DB0], v22);
          if (v24)
          {
            __int16 v25 = v24;
            unsigned int v35 = v17;
            uint64_t v26 = v16;
            uint64_t v27 = a2;
            unsigned int v28 = a5;
            CFTypeID v29 = a4;
            unsigned int v30 = a7;
            CFIndex v31 = a7;
            uint64_t v32 = a6;
            CFPropertyListRef v33 = _WiFiCopyUnserialized(a6, v31);
            _WiFiDeviceClientDispatchAssociationResult(v21, (uint64_t)v25, (uint64_t)v33, v37);
            if (v33) {
              CFRelease(v33);
            }
            CFRelease(v25);
            a6 = v32;
            a7 = v30;
            a4 = v29;
            a5 = v28;
            a2 = v27;
            uint64_t v16 = v26;
            uint64_t v17 = v35;
          }

          else
          {
            _WiFiDeviceClientDispatchAssociationResult(v21, 0LL, 0LL, v37);
          }

          CFRelease(v23);
          CFTypeID v19 = v36;
        }

        else
        {
          _WiFiDeviceClientDispatchAssociationResult(v21, 0LL, 0LL, a8);
        }
      }

      CFRelease(v19);
    }

    CFRelease(v17);
  }

  _WiFiVMDealloc((uint64_t)a2, v16);
  _WiFiVMDealloc((uint64_t)a4, a5);
  _WiFiVMDealloc((uint64_t)a6, a7);
  return 0LL;
}

uint64_t _wifi_manager_client_dispatch_start_network_result( unsigned int a1, UInt8 *a2, unsigned int a3, unsigned int a4, UInt8 *a5, unsigned int a6, UInt8 *a7, unsigned int a8)
{
  __int16 v14 = WiFiPortCacheCopy(a1);
  uint64_t v15 = a3;
  if (v14)
  {
    uint64_t v16 = v14;
    CFPropertyListRef v17 = _WiFiCopyUnserialized(a2, a3);
    if (!v17)
    {
LABEL_17:
      CFRelease(v16);
      goto LABEL_18;
    }

    CFPropertyListRef v18 = v17;
    CFPropertyListRef v33 = v16;
    Device = WiFiManagerClientGetDevice((uint64_t)v16, v17);
    if (Device)
    {
      uint64_t v20 = (uint64_t)Device;
      uint64_t v21 = 0LL;
      CFPropertyListRef v22 = 0LL;
      if (!a5 || !a6)
      {
LABEL_8:
        uint64_t v32 = v15;
        if (a7 && a8)
        {
          CFTypeID v24 = a5;
          __int16 v25 = a2;
          unsigned int v26 = a6;
          unsigned int v27 = a8;
          CFPropertyListRef v28 = _WiFiCopyUnserialized(a7, a8);
          if (v28)
          {
            CFTypeID v29 = v28;
            _WiFiDeviceClientDispatchStartNetworkResult(v20, a4, (uint64_t)v22, (uint64_t)v28);
            CFRelease(v29);
          }

          if (!v22) {
            goto LABEL_14;
          }
        }

        else
        {
          CFTypeID v24 = a5;
          __int16 v25 = a2;
          unsigned int v26 = a6;
          unsigned int v27 = a8;
          _WiFiDeviceClientDispatchStartNetworkResult(v20, a4, (uint64_t)v22, 0LL);
          if (!v22)
          {
LABEL_14:
            a8 = v27;
            a6 = v26;
            a2 = v25;
            a5 = v24;
            uint64_t v15 = v32;
            if (v21) {
              CFRelease(v21);
            }
            goto LABEL_16;
          }
        }

        CFRelease(v22);
        goto LABEL_14;
      }

      CFPropertyListRef v23 = _WiFiCopyUnserialized(a5, a6);
      if (v23)
      {
        uint64_t v21 = v23;
        CFPropertyListRef v22 = WiFiNetworkCreate(*MEMORY[0x189604DB0], v23);
        goto LABEL_8;
      }
    }

LABEL_16:
    CFRelease(v18);
    uint64_t v16 = v33;
    goto LABEL_17;
  }

LABEL_18:
  _WiFiVMDealloc((uint64_t)a2, v15);
  _WiFiVMDealloc((uint64_t)a5, a6);
  _WiFiVMDealloc((uint64_t)a7, a8);
  return 0LL;
}

uint64_t _wifi_manager_client_dispatch_stop_network_result( unsigned int a1, UInt8 *a2, unsigned int a3, uint64_t a4, UInt8 *a5, unsigned int a6)
{
  uint64_t v11 = WiFiPortCacheCopy(a1);
  if (v11)
  {
    uint64_t v12 = v11;
    CFPropertyListRef v13 = _WiFiCopyUnserialized(a2, a3);
    if (v13)
    {
      __int16 v14 = v13;
      Device = WiFiManagerClientGetDevice((uint64_t)v12, v13);
      if (Device)
      {
        uint64_t v16 = (uint64_t)Device;
        if (a5 && a6)
        {
          CFPropertyListRef v17 = _WiFiCopyUnserialized(a5, a6);
          if (v17)
          {
            CFPropertyListRef v18 = v17;
            _WiFiDeviceClientDispatchStopNetworkResult(v16, a4, (uint64_t)v17);
            CFRelease(v18);
          }
        }

        else
        {
          _WiFiDeviceClientDispatchStopNetworkResult((uint64_t)Device, a4, 0LL);
        }
      }

      CFRelease(v14);
    }

    CFRelease(v12);
  }

  _WiFiVMDealloc((uint64_t)a2, a3);
  _WiFiVMDealloc((uint64_t)a5, a6);
  return 0LL;
}

uint64_t _wifi_manager_client_dispatch_gas_results( unsigned int a1, UInt8 *a2, unsigned int a3, UInt8 *a4, unsigned int a5, uint64_t a6)
{
  uint64_t v11 = WiFiPortCacheCopy(a1);
  if (v11)
  {
    uint64_t v12 = v11;
    CFPropertyListRef v13 = _WiFiCopyUnserialized(a2, a3);
    if (v13)
    {
      __int16 v14 = v13;
      Device = WiFiManagerClientGetDevice((uint64_t)v12, v13);
      if (Device)
      {
        uint64_t v16 = (uint64_t)Device;
        CFPropertyListRef v17 = (const __CFArray *)_WiFiCopyUnserialized(a4, a5);
        if (v17)
        {
          CFPropertyListRef v18 = v17;
          NetworksFromRecords = _WiFiCreateNetworksFromRecords(v17);
          _WiFiDeviceClientDispatchGasResults(v16, (uint64_t)NetworksFromRecords, a6);
          if (NetworksFromRecords) {
            CFRelease(NetworksFromRecords);
          }
          CFRelease(v18);
        }

        else
        {
          _WiFiDeviceClientDispatchGasResults(v16, 0LL, a6);
        }
      }

      CFRelease(v14);
    }

    CFRelease(v12);
  }

  _WiFiVMDealloc((uint64_t)a2, a3);
  _WiFiVMDealloc((uint64_t)a4, a5);
  return 0LL;
}

uint64_t _wifi_manager_client_dispatch_ranging_result( unsigned int a1, UInt8 *a2, unsigned int a3, UInt8 *a4, unsigned int a5, uint64_t a6)
{
  uint64_t v11 = WiFiPortCacheCopy(a1);
  if (v11)
  {
    uint64_t v12 = v11;
    CFPropertyListRef v13 = _WiFiCopyUnserialized(a2, a3);
    if (v13)
    {
      __int16 v14 = v13;
      Device = WiFiManagerClientGetDevice((uint64_t)v12, v13);
      if (Device)
      {
        uint64_t v16 = (uint64_t)Device;
        CFPropertyListRef v17 = _WiFiCopyUnserialized(a4, a5);
        _WiFiDeviceClientDispatchRangingResult(v16, (uint64_t)v17, a6);
        if (v17) {
          CFRelease(v17);
        }
      }

      CFRelease(v14);
    }

    CFRelease(v12);
  }

  _WiFiVMDealloc((uint64_t)a2, a3);
  _WiFiVMDealloc((uint64_t)a4, a5);
  return 0LL;
}

uint64_t _wifi_manager_client_dispatch_event( unsigned int a1, UInt8 *a2, unsigned int a3, uint64_t a4, UInt8 *a5, unsigned int a6)
{
  uint64_t v11 = WiFiPortCacheCopy(a1);
  if (v11)
  {
    uint64_t v12 = v11;
    CFPropertyListRef v13 = (const __CFString *)_WiFiCopyUnserialized(a2, a3);
    if (v13) {
      Device = WiFiManagerClientGetDevice((uint64_t)v12, v13);
    }
    else {
      Device = 0LL;
    }
    uint64_t v15 = (const __CFDictionary *)_WiFiCopyUnserialized(a5, a6);
    uint64_t v16 = v15;
    switch(a4)
    {
      case 0LL:
        if (Device) {
          _WiFiDeviceClientDispatchPowerEvent((uint64_t)Device);
        }
        goto LABEL_78;
      case 1LL:
        if (Device) {
          _WiFiDeviceClientDispatchLinkEvent((uint64_t)Device, v15);
        }
        goto LABEL_78;
      case 2LL:
        CFPropertyListRef v17 = v12;
        CFPropertyListRef v18 = v13;
        int v19 = 0;
        goto LABEL_33;
      case 3LL:
        if (Device) {
          _WiFiDeviceClientDispatchRemovalEvent(Device);
        }
        goto LABEL_78;
      case 4LL:
        goto LABEL_78;
      case 6LL:
        if (Device) {
          _WiFiDeviceClientDispatchScanCacheUpdateEvent(Device, v15);
        }
        goto LABEL_78;
      case 7LL:
      case 8LL:
        if (Device) {
          _WiFiDeviceClientDispatchScanUpdateEvent((uint64_t)Device, v15);
        }
        goto LABEL_78;
      case 9LL:
        uint64_t v20 = WiFiManagerClientGetDevice((uint64_t)v12, v13);
        uint64_t v21 = (void (*)(void *, const void *, void, uint64_t))v12[20];
        if (!v21) {
          goto LABEL_78;
        }
        CFPropertyListRef v22 = v20;
        if (v16)
        {
          NetworksFromRecords = _WiFiCreateNetworksFromRecords(v16);
          ((void (*)(void *, const void *, __CFArray *, void))v12[20])( v12,  v22,  NetworksFromRecords,  v12[21]);
          goto LABEL_42;
        }

        uint64_t v33 = v12[21];
        goto LABEL_86;
      case 10LL:
        if (Device)
        {
          CFTypeID v24 = WiFiNetworkCreate(*MEMORY[0x189604DB0], v15);
          _WiFiDeviceClientDispatchBssidEvent((uint64_t)Device, (uint64_t)v24);
          if (v24) {
            CFRelease(v24);
          }
        }

        goto LABEL_78;
      case 11LL:
        if (Device) {
          _WiFiDeviceClientDispatchResumeScanEvent((uint64_t)Device);
        }
        goto LABEL_78;
      case 12LL:
        if (Device)
        {
          uint64_t valuePtr = 0LL;
          CFNumberGetValue(v15, kCFNumberCFIndexType, &valuePtr);
          _WiFiDeviceClientDispatchBgScanSuspendResumeEvent((uint64_t)Device, valuePtr == 1);
        }

        goto LABEL_78;
      case 14LL:
        if (Device) {
          _WiFiDeviceClientDispatchLQMEvent((uint64_t)Device, (uint64_t)v15);
        }
        goto LABEL_78;
      case 15LL:
        if (Device) {
          _WiFiDeviceClientDispatchDiagnosticsStartEvent((uint64_t)Device, (uint64_t)v15);
        }
        goto LABEL_78;
      case 17LL:
        CFPropertyListRef v17 = v12;
        CFPropertyListRef v18 = (const __CFString *)v16;
        int v19 = 1;
LABEL_33:
        WiFiManagerClientDispatchAttachmentEvent(v17, v18, v19);
        goto LABEL_78;
      case 18LL:
        uint64_t v25 = (uint64_t)v12;
        unsigned int v26 = v16;
        int v27 = 0;
        goto LABEL_73;
      case 19LL:
        if (Device) {
          _WiFiDeviceClientDispatchHostApStateChangedEvent((uint64_t)Device, (uint64_t)v15);
        }
        goto LABEL_78;
      case 20LL:
        if (Device) {
          _WiFiDeviceClientDispatchDeviceAvailableEvent((uint64_t)Device, (uint64_t)v15);
        }
        goto LABEL_78;
      case 21LL:
        CFPropertyListRef v28 = WiFiManagerClientGetDevice((uint64_t)v12, v13);
        uint64_t v21 = (void (*)(void *, const void *, void, uint64_t))v12[22];
        if (!v21) {
          goto LABEL_78;
        }
        CFPropertyListRef v22 = v28;
        if (v16)
        {
          NetworksFromRecords = _WiFiCreateNetworksFromRecords(v16);
          ((void (*)(void *, const void *, __CFArray *, void))v12[22])( v12,  v22,  NetworksFromRecords,  v12[23]);
LABEL_42:
          if (NetworksFromRecords) {
            CFRelease(NetworksFromRecords);
          }
LABEL_79:
          CFRelease(v16);
LABEL_80:
          if (v13) {
LABEL_81:
          }
            CFRelease(v13);
        }

        else
        {
          uint64_t v33 = v12[23];
LABEL_86:
          v21(v12, v22, 0LL, v33);
          if (v13) {
            goto LABEL_81;
          }
        }

        CFRelease(v12);
        break;
      case 22LL:
        if (Device) {
          _WiFiDeviceClientDispatchVirtInterfaceStateChangeEvent((uint64_t)Device, v15);
        }
        goto LABEL_78;
      case 23LL:
        if (Device) {
          _WiFiDeviceClientDispatchAutoJoinNotification((uint64_t)Device, v15);
        }
        goto LABEL_78;
      case 24LL:
        if (Device) {
          _WiFiDeviceClientDispatchRangingReportEvent((uint64_t)Device, (uint64_t)v15);
        }
        goto LABEL_78;
      case 25LL:
        CFTypeID v29 = WiFiManagerClientGetDevice((uint64_t)v12, v13);
        unsigned int v30 = (void (*)(void *, const void *, const __CFArray *, void))v12[24];
        if (v30) {
          v30(v12, v29, v16, v12[25]);
        }
        goto LABEL_78;
      case 30LL:
        if (Device) {
          _WiFiDeviceClientDispatchRoamStatusEvent((uint64_t)Device, (uint64_t)v15);
        }
        goto LABEL_78;
      case 31LL:
        if (Device) {
          _WiFiDeviceClientDispatchWeightAvgLQMEvent((uint64_t)Device, (uint64_t)v15);
        }
        goto LABEL_78;
      case 34LL:
        if (Device) {
          _WiFiDeviceClientDispatchUserJoinNotification((uint64_t)Device, v15);
        }
        goto LABEL_78;
      case 35LL:
        if (Device) {
          _WiFiDeviceClientDispatchBTScanIntervalRelaxEvent((uint64_t)Device, (uint64_t)v15);
        }
        goto LABEL_78;
      case 37LL:
        if (Device)
        {
          LODWORD(valuePtr) = -1;
          CFNumberGetValue(v15, kCFNumberSInt32Type, &valuePtr);
          _WiFiDeviceClientDispatchCarPlayNetworkTypeChangeEvent((uint64_t)Device, valuePtr);
        }

        goto LABEL_78;
      case 38LL:
        if (Device)
        {
          BOOL v31 = CFBooleanGetValue(v15) != 0;
          _WiFiDeviceClientDispatch24GHzNetworkInCriticalStateEvent((uint64_t)Device, v31);
        }

        goto LABEL_78;
      case 39LL:
        if (Device)
        {
          LODWORD(valuePtr) = 0;
          CFNumberGetValue(v15, kCFNumberSInt32Type, &valuePtr);
          _WiFiDeviceClientDispatchM1M4Handshake24GHzCountEvent((uint64_t)Device, valuePtr);
        }

        goto LABEL_78;
      case 41LL:
        if (Device) {
          _WiFiDeviceClientDispatchP2pThreadCoexEvent((uint64_t)Device, (uint64_t)v15);
        }
        goto LABEL_78;
      case 42LL:
        if (Device) {
          _WiFiDeviceClientDispatchBTCoexStatsEvent((uint64_t)Device, (uint64_t)v15);
        }
        goto LABEL_78;
      case 43LL:
        if (Device) {
          _WiFiDeviceClientDispatchBSPEvent((uint64_t)Device, (uint64_t)v15);
        }
        goto LABEL_78;
      case 44LL:
        uint64_t v25 = (uint64_t)v12;
        unsigned int v26 = v16;
        int v27 = 1;
LABEL_73:
        WiFiManagerClientRemoveDevice(v25, v26, 1, v27);
        goto LABEL_78;
      case 45LL:
        if (Device) {
          _WiFiDeviceClientDispatchUCMEvent((uint64_t)Device, (uint64_t)v15);
        }
        goto LABEL_78;
      case 46LL:
        if (Device) {
          _WiFiDeviceClientDispatchTdConfirmedEvent((uint64_t)Device, (uint64_t)v15);
        }
        goto LABEL_78;
      default:
        objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
LABEL_78:
        if (v16) {
          goto LABEL_79;
        }
        goto LABEL_80;
    }
  }

  _WiFiVMDealloc((uint64_t)a2, a3);
  _WiFiVMDealloc((uint64_t)a5, a6);
  return 0LL;
}

uint64_t _wifi_manager_client_dispatch_add_network_async( unsigned int a1, UInt8 *a2, unsigned int a3, uint64_t a4)
{
  uint64_t v7 = WiFiPortCacheCopy(a1);
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = 0LL;
    uint64_t v10 = 0LL;
    if (!a2 || !a3) {
      goto LABEL_6;
    }
    CFPropertyListRef v11 = _WiFiCopyUnserialized(a2, a3);
    if (!v11)
    {
LABEL_12:
      CFRelease(v8);
      goto LABEL_13;
    }

    uint64_t v9 = v11;
    uint64_t v10 = WiFiNetworkCreate(*MEMORY[0x189604DB0], v11);
    if (v10)
    {
LABEL_6:
      uint64_t v12 = (void (*)(void *, _WORD *, uint64_t, void))v8[32];
      if (v12)
      {
        v12(v8, v10, a4, v8[33]);
        v8[32] = 0LL;
        v8[33] = 0LL;
      }

      if (v10) {
        CFRelease(v10);
      }
      if (!v9) {
        goto LABEL_12;
      }
    }

    CFRelease(v9);
    goto LABEL_12;
  }

LABEL_13:
  _WiFiVMDealloc((uint64_t)a2, a3);
  return 0LL;
}

  wifi_manager_set_network_property(v7[1], (uint64_t)BytePtr, Length, (uint64_t)v17, v18, 0LL, 0, &v24);
  if (v16) {
LABEL_14:
  }
    CFRelease(v16);
LABEL_15:
  if (v12) {
    CFRelease(v12);
  }
  CFRelease(v9);
LABEL_18:
  WiFiSendRightRelease(v7);
  return v24 == 0;
}

    uint64_t v12 = v6[1] + 2LL;
    v8 += v12;
    v6 += v12;
  }

  while (1)
  {
    __int16 v14 = v10[2];
    if (*(_WORD *)v10 == 260 && (_DWORD)v14 == 18) {
      return (const __CFData *)1;
    }
    uint64_t v16 = &v10[v14];
    uint64_t v10 = v16 + 3;
  }

  if (a4) {
    *a4 = 0LL;
  }
  if (a3) {
    *a3 = v12;
  }
}

void WiFiManagerClientAddPolicy(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v3)
  {
    CFDictionaryRef v4 = WiFiPolicyCopyRecord(a2);
    if (v4)
    {
      CFDictionaryRef v5 = v4;
      BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x189604DB0], v4);
      if (BinaryData)
      {
        uint64_t v7 = BinaryData;
        int v8 = v3[1];
        BytePtr = CFDataGetBytePtr(BinaryData);
        int Length = CFDataGetLength(v7);
        wifi_manager_add_policy(v8, (uint64_t)BytePtr, Length, 0);
        CFRelease(v7);
      }

      CFRelease(v5);
    }
  }

  WiFiSendRightRelease(v3);
}

void WiFiManagerClientRemovePolicy(uint64_t a1, const void *a2)
{
  uint64_t v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (!v3) {
    goto LABEL_10;
  }
  uint64_t TypeID = WiFiPolicyGetTypeID();
  if (TypeID == CFGetTypeID(a2))
  {
    CFDictionaryRef v5 = WiFiPolicyCopyRecord((uint64_t)a2);
    if (!v5) {
      goto LABEL_10;
    }
    CFDictionaryRef v6 = v5;
    BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x189604DB0], v5);
    if (!BinaryData) {
      goto LABEL_8;
    }
  }

  else
  {
    BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x189604DB0], a2);
    CFDictionaryRef v6 = 0LL;
    if (!BinaryData) {
      goto LABEL_8;
    }
  }

  int v8 = v3[1];
  BytePtr = CFDataGetBytePtr(BinaryData);
  int Length = CFDataGetLength(BinaryData);
  wifi_manager_remove_policy(v8, (uint64_t)BytePtr, Length, 0);
  CFRelease(BinaryData);
LABEL_8:
  if (v6) {
    CFRelease(v6);
  }
LABEL_10:
  WiFiSendRightRelease(v3);
}

__CFArray *WiFiManagerClientCopyPolicies(uint64_t a1)
{
  uint64_t v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  int v2 = v1;
  if (v1
    && ((wifi_manager_copy_policies(v1[1], &length[1], length), *(void *)&length[1])
      ? (BOOL v3 = length[0] == 0)
      : (BOOL v3 = 1),
        !v3 && (CFDictionaryRef v4 = (const __CFArray *)_WiFiCopyUnserialized(*(UInt8 **)&length[1], length[0])) != 0LL))
  {
    CFDictionaryRef v5 = v4;
    CFDictionaryRef v6 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    CFMutableDictionaryRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, MEMORY[0x189605228]);
    if (Mutable)
    {
      CFIndex Count = CFArrayGetCount(v5);
      if (Count >= 1)
      {
        CFIndex v9 = Count;
        for (CFIndex i = 0LL; i != v9; ++i)
        {
          ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v5, i);
          if (ValueAtIndex)
          {
            uint64_t v12 = WiFiPolicyCreate(v6, ValueAtIndex);
            if (v12)
            {
              CFPropertyListRef v13 = v12;
              CFArrayAppendValue(Mutable, v12);
              CFRelease(v13);
            }
          }
        }
      }
    }

    CFRelease(v5);
  }

  else
  {
    CFMutableDictionaryRef Mutable = 0LL;
  }

  _WiFiVMDealloc(*(uint64_t *)&length[1], length[0]);
  WiFiSendRightRelease(v2);
  return Mutable;
}

uint64_t WiFiManagerClientIsRestrictionPolicyActive(uint64_t a1)
{
  int v4 = 0;
  uint64_t v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  int v2 = v1;
  if (v1) {
    wifi_manager_is_restriction_policy_active(v1[1], &v4);
  }
  WiFiSendRightRelease(v2);
  return v4;
}

void WiFiManagerClientSetInCarState(uint64_t a1, int a2, const __CFData *a3)
{
  uint64_t v6 = kdebug_trace();
  objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C](v6));
  uint64_t v7 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v7)
  {
    int v8 = v7;
    if (a3
      && (BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x189604DB0], a3),
          (a3 = BinaryData) != 0LL))
    {
      BytePtr = CFDataGetBytePtr(BinaryData);
      int Length = CFDataGetLength(a3);
    }

    else
    {
      BytePtr = 0LL;
      int Length = 0;
    }

    wifi_manager_set_incar_state(v8[1], a2, (uint64_t)BytePtr, Length);
    if (a3) {
      CFRelease(a3);
    }
    WiFiSendRightRelease(v8);
  }

  else
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
  }

void WiFiManagerClientSetThermalIndex(uint64_t a1, int a2)
{
  BOOL v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v3)
  {
    int v4 = v3;
    wifi_manager_set_thermal_index(v3[1], a2);
    WiFiSendRightRelease(v4);
  }

uint64_t WiFiManagerClientGetThermalIndex(uint64_t a1)
{
  unsigned int v4 = 100;
  uint64_t v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  int v2 = v1;
  if (v1) {
    wifi_manager_get_thermal_index(v1[1], &v4);
  }
  WiFiSendRightRelease(v2);
  return v4;
}

CFPropertyListRef WiFiManagerClientCopyLeechedLocation(uint64_t a1)
{
  uint64_t v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  int v2 = v1;
  if (!v1)
  {
    unsigned int v3 = 0;
LABEL_9:
    CFPropertyListRef v5 = 0LL;
    goto LABEL_7;
  }

  wifi_manager_copy_leeched_location(v1[1], &length[1], length);
  uint64_t v1 = *(unsigned int **)&length[1];
  unsigned int v3 = length[0];
  if (*(void *)&length[1]) {
    BOOL v4 = length[0] == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4) {
    goto LABEL_9;
  }
  CFPropertyListRef v5 = _WiFiCopyUnserialized(*(UInt8 **)&length[1], length[0]);
  uint64_t v1 = *(unsigned int **)&length[1];
  unsigned int v3 = length[0];
LABEL_7:
  _WiFiVMDealloc((uint64_t)v1, v3);
  WiFiSendRightRelease(v2);
  return v5;
}

CFPropertyListRef WiFiManagerClientCopyGeoTagsForNetwork(uint64_t a1, uint64_t a2)
{
  if (!a1)
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
    uint64_t v13 = 0LL;
    uint64_t v12 = 0LL;
    unsigned int v3 = 0LL;
    goto LABEL_14;
  }

  unsigned int v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (!v3 || (CFDictionaryRef v4 = WiFiNetworkCopyRecord(a2)) == 0LL)
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
    uint64_t v13 = 0LL;
    uint64_t v12 = 0LL;
LABEL_14:
    CFPropertyListRef v11 = 0LL;
    goto LABEL_10;
  }

  CFDictionaryRef v5 = v4;
  BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x189604DB0], v4);
  if (BinaryData)
  {
    uint64_t v7 = BinaryData;
    int v8 = v3[1];
    BytePtr = CFDataGetBytePtr(BinaryData);
    int v10 = CFDataGetLength(v7);
    wifi_manager_copy_geotags_for_network(v8, (uint64_t)BytePtr, v10, &length[1], length);
    if (!*(void *)&length[1] || !length[0] || (CFPropertyListRef v11 = _WiFiCopyUnserialized(*(UInt8 **)&length[1], length[0])) == 0LL)
    {
      objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
      CFPropertyListRef v11 = 0LL;
    }

    CFRelease(v7);
  }

  else
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
    CFPropertyListRef v11 = 0LL;
  }

  CFRelease(v5);
  uint64_t v12 = *(void *)&length[1];
  uint64_t v13 = length[0];
LABEL_10:
  _WiFiVMDealloc(v12, v13);
  WiFiSendRightRelease(v3);
  return v11;
}

uint64_t WiFiManagerClientSetGeoTagForNetwork(uint64_t a1, uint64_t a2, double a3, double a4)
{
  if (!a1)
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
    uint64_t v7 = 0LL;
    goto LABEL_10;
  }

  uint64_t v7 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (!v7 || (CFDictionaryRef v8 = WiFiNetworkCopyRecord(a2)) == 0LL)
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
LABEL_10:
    uint64_t v15 = 74LL;
    goto LABEL_7;
  }

  CFDictionaryRef v9 = v8;
  BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x189604DB0], v8);
  if (BinaryData)
  {
    CFPropertyListRef v11 = BinaryData;
    int v12 = v7[1];
    BytePtr = CFDataGetBytePtr(BinaryData);
    int Length = CFDataGetLength(v11);
    wifi_manager_set_geotag_for_network(v12, (uint64_t)BytePtr, Length, a3, a4);
    CFRelease(v11);
    uint64_t v15 = 0LL;
  }

  else
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
    uint64_t v15 = 74LL;
  }

  CFRelease(v9);
LABEL_7:
  WiFiSendRightRelease(v7);
  return v15;
}

__CFArray *WiFiManagerClientCopyKnownNetworksNearLocation(uint64_t a1, double a2, double a3)
{
  if (a1)
  {
    CFDictionaryRef v5 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
    uint64_t v6 = v5;
    if (v5
      && (wifi_manager_copy_networks_at_location(v5[1], 0, &length[1], length, a2, a3), *(void *)&length[1])
      && length[0]
      && (uint64_t v7 = (const __CFArray *)_WiFiCopyUnserialized(*(UInt8 **)&length[1], length[0])) != 0LL)
    {
      CFDictionaryRef v8 = v7;
      NetworksFromRecords = _WiFiCreateNetworksFromRecords(v7);
      if (!NetworksFromRecords) {
        objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
      }
      CFRelease(v8);
    }

    else
    {
      objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
      NetworksFromRecords = 0LL;
    }
  }

  else
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
    NetworksFromRecords = 0LL;
    uint64_t v6 = 0LL;
  }

  _WiFiVMDealloc(*(uint64_t *)&length[1], length[0]);
  WiFiSendRightRelease(v6);
  return NetworksFromRecords;
}

__CFArray *WiFiManagerClientCopyScoreSortedKnownNetworksNearLocation(uint64_t a1, double a2, double a3)
{
  if (a1)
  {
    CFDictionaryRef v5 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
    uint64_t v6 = v5;
    if (v5
      && (wifi_manager_copy_networks_at_location(v5[1], 1, &length[1], length, a2, a3), *(void *)&length[1])
      && length[0]
      && (uint64_t v7 = (const __CFArray *)_WiFiCopyUnserialized(*(UInt8 **)&length[1], length[0])) != 0LL)
    {
      CFDictionaryRef v8 = v7;
      NetworksFromRecords = _WiFiCreateNetworksFromRecords(v7);
      if (!NetworksFromRecords) {
        objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
      }
      CFRelease(v8);
    }

    else
    {
      objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
      NetworksFromRecords = 0LL;
    }
  }

  else
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
    NetworksFromRecords = 0LL;
    uint64_t v6 = 0LL;
  }

  _WiFiVMDealloc(*(uint64_t *)&length[1], length[0]);
  WiFiSendRightRelease(v6);
  return NetworksFromRecords;
}

CFPropertyListRef WiFiManagerClientCopyScoreForNetwork(uint64_t a1, uint64_t a2)
{
  if (!a1)
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
    uint64_t v13 = 0LL;
    uint64_t v12 = 0LL;
    unsigned int v3 = 0LL;
    goto LABEL_14;
  }

  unsigned int v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (!v3 || (CFDictionaryRef v4 = WiFiNetworkCopyRecord(a2)) == 0LL)
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
    uint64_t v13 = 0LL;
    uint64_t v12 = 0LL;
LABEL_14:
    CFPropertyListRef v11 = 0LL;
    goto LABEL_10;
  }

  CFDictionaryRef v5 = v4;
  BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x189604DB0], v4);
  if (BinaryData)
  {
    uint64_t v7 = BinaryData;
    int v8 = v3[1];
    BytePtr = CFDataGetBytePtr(BinaryData);
    int v10 = CFDataGetLength(v7);
    wifi_manager_copy_score_for_network(v8, (uint64_t)BytePtr, v10, &length[1], length);
    if (!*(void *)&length[1] || !length[0] || (CFPropertyListRef v11 = _WiFiCopyUnserialized(*(UInt8 **)&length[1], length[0])) == 0LL)
    {
      objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
      CFPropertyListRef v11 = 0LL;
    }

    CFRelease(v7);
  }

  else
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
    CFPropertyListRef v11 = 0LL;
  }

  CFRelease(v5);
  uint64_t v12 = *(void *)&length[1];
  uint64_t v13 = length[0];
LABEL_10:
  _WiFiVMDealloc(v12, v13);
  WiFiSendRightRelease(v3);
  return v11;
}

CFPropertyListRef WiFiManagerClientCopySoftErrorCounters(uint64_t a1)
{
  uint64_t v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  int v2 = v1;
  if (!v1)
  {
    unsigned int v3 = 0;
LABEL_9:
    CFPropertyListRef v5 = 0LL;
    goto LABEL_7;
  }

  wifi_manager_copy_softerror_counters(v1[1], &length[1], length);
  uint64_t v1 = *(unsigned int **)&length[1];
  unsigned int v3 = length[0];
  if (*(void *)&length[1]) {
    BOOL v4 = length[0] == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4) {
    goto LABEL_9;
  }
  CFPropertyListRef v5 = _WiFiCopyUnserialized(*(UInt8 **)&length[1], length[0]);
  uint64_t v1 = *(unsigned int **)&length[1];
  unsigned int v3 = length[0];
LABEL_7:
  _WiFiVMDealloc((uint64_t)v1, v3);
  WiFiSendRightRelease(v2);
  return v5;
}

BOOL WiFiManagerClientGetAirplaneModePowerPreference(uint64_t a1)
{
  if (!a1)
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
    return 0LL;
  }

  CFPropertyListRef v1 = WiFiManagerClientCopyProperty(a1, @"KeepWiFiPoweredAirplaneMode");
  if (!v1) {
    return 0LL;
  }
  int v2 = v1;
  CFTypeID TypeID = CFBooleanGetTypeID();
  BOOL v4 = TypeID == CFGetTypeID(v2) && CFBooleanGetValue((CFBooleanRef)v2) != 0;
  CFRelease(v2);
  return v4;
}

void WiFiManagerClientSetAirplaneModePowerPreference(uint64_t a1, int a2)
{
  if (a1)
  {
    int v2 = (const __CFData **)MEMORY[0x189604DE8];
    if (!a2) {
      int v2 = (const __CFData **)MEMORY[0x189604DE0];
    }
    WiFiManagerClientSetProperty(a1, @"KeepWiFiPoweredAirplaneMode", *v2);
  }

  else
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
  }

_WORD *WiFiManagerClientCopyCurrentSessionBasedNetwork(uint64_t a1)
{
  CFPropertyListRef v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  int v2 = v1;
  if (v1
    && (wifi_manager_copy_current_session_based_network(v1[1], &length[1], length),
        (CFPropertyListRef v3 = _WiFiCopyUnserialized(*(UInt8 **)&length[1], length[0])) != 0LL))
  {
    BOOL v4 = v3;
    CFPropertyListRef v5 = WiFiNetworkCreate(*MEMORY[0x189604DB0], v3);
    CFRelease(v4);
  }

  else
  {
    CFPropertyListRef v5 = 0LL;
  }

  _WiFiVMDealloc(*(uint64_t *)&length[1], length[0]);
  WiFiSendRightRelease(v2);
  return v5;
}

uint64_t WiFiManagerClientGetUserAutoJoinState(uint64_t a1)
{
  int v4 = 0;
  CFPropertyListRef v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  int v2 = v1;
  if (v1) {
    wifi_manager_get_user_auto_join_state(v1[1], &v4);
  }
  WiFiSendRightRelease(v2);
  return v4;
}

void WiFiManagerClientEnableUserAutoJoin(uint64_t a1)
{
  CFPropertyListRef v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v1)
  {
    int v2 = v1;
    wifi_manager_set_user_auto_join_state(v1[1], 1);
    WiFiSendRightRelease(v2);
  }

void WiFiManagerClientDisableUserAutoJoin(uint64_t a1)
{
  CFPropertyListRef v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v1)
  {
    int v2 = v1;
    wifi_manager_set_user_auto_join_state(v1[1], 0);
    WiFiSendRightRelease(v2);
  }

void WiFiManagerClientRegisterUserAutoJoinStateChangedCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 272) = a2;
  *(void *)(a1 + 280) = a3;
  if (a2) {
    __WiFiManagerClientOrEventMask(a1, 0x4000000LL);
  }
  else {
    __WiFiManagerClientAndEventMask(a1, -67108865LL);
  }
}

uint64_t _wifi_manager_client_dispatch_auto_join_state_change( unsigned int a1, unsigned __int8 a2, UInt8 *a3, unsigned int a4)
{
  uint64_t v7 = WiFiPortCacheCopy(a1);
  if (v7)
  {
    int v8 = v7;
    CFPropertyListRef v9 = _WiFiCopyUnserialized(a3, a4);
    if ((*((_BYTE *)v8 + 75) & 4) != 0)
    {
      int v10 = (void (*)(void *, void, CFPropertyListRef, void))v8[34];
      if (v10) {
        v10(v8, a2, v9, v8[35]);
      }
    }

    CFRelease(v8);
    if (v9) {
      CFRelease(v9);
    }
  }

  _WiFiVMDealloc((uint64_t)a3, a4);
  return 0LL;
}

uint64_t _wifi_manager_client_dispatch_managed_apple_id_state_change()
{
  return 0LL;
}

void WiFiManagerClientRemoveOrphanedSCNetworkSets(uint64_t a1)
{
  CFPropertyListRef v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v1)
  {
    int v2 = v1;
    wifi_manager_remove_orphaned_sc_network_sets(v1[1]);
    WiFiSendRightRelease(v2);
  }

void WiFiManagerClientMigrateList(uint64_t a1)
{
  CFPropertyListRef v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v1)
  {
    int v2 = v1;
    wifi_manager_migrate_list(v1[1]);
    WiFiSendRightRelease(v2);
  }

void WiFiManagerClientRemoveUnusedNetworkGeotags(uint64_t a1, double a2)
{
  CFPropertyListRef v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v3)
  {
    int v4 = v3;
    wifi_manager_remove_unused_network_geotags(v3[1], a2);
    WiFiSendRightRelease(v4);
  }

void WiFiManagerClientScheduleUnusedNetworkGeotagsRemovalTest(uint64_t a1, int a2, double a3)
{
  CFPropertyListRef v5 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v5)
  {
    uint64_t v6 = v5;
    wifi_manager_schedule_unused_network_geotags_removal_test(v5[1], a2, a3);
    WiFiSendRightRelease(v6);
  }

void WiFiManagerClientUnScheduleUnusedNetworkGeotagsRemovalTest(uint64_t a1)
{
  CFPropertyListRef v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v1)
  {
    int v2 = v1;
    wifi_manager_unschedule_unused_network_geotags_removal_test(v1[1]);
    WiFiSendRightRelease(v2);
  }

void WiFiManagerClientRegisterPreferredNetworksChangedCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 288) = a2;
  *(void *)(a1 + 296) = a3;
  if (a2) {
    __WiFiManagerClientOrEventMask(a1, 0x20000000LL);
  }
  else {
    __WiFiManagerClientAndEventMask(a1, -536870913LL);
  }
}

uint64_t _wifi_manager_client_dispatch_preferred_networks_change(unsigned int a1, UInt8 *a2, unsigned int a3)
{
  CFPropertyListRef v5 = WiFiPortCacheCopy(a1);
  if (v5)
  {
    uint64_t v6 = v5;
    CFPropertyListRef v7 = _WiFiCopyUnserialized(a2, a3);
    if (v7)
    {
      int v8 = v7;
      if ((*((_BYTE *)v6 + 75) & 0x20) != 0)
      {
        CFPropertyListRef v9 = (void (*)(void *, CFPropertyListRef, void))v6[36];
        if (v9) {
          v9(v6, v7, v6[37]);
        }
      }

      CFRelease(v6);
    }

    else
    {
      objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
      int v8 = v6;
    }

    CFRelease(v8);
  }

  _WiFiVMDealloc((uint64_t)a2, a3);
  return 0LL;
}

uint64_t WiFiManagerClientSimulateNotification(uint64_t a1, CFDictionaryRef a2, int a3, const __CFData *a4)
{
  if (!a1)
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
    CFPropertyListRef v7 = 0LL;
    goto LABEL_20;
  }

  CFPropertyListRef v7 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (!v7) {
    goto LABEL_18;
  }
  int v8 = (CFAllocatorRef *)MEMORY[0x189604DB0];
  if (!a2)
  {
    CFPropertyListRef v11 = 0LL;
    BytePtr = 0LL;
    int Length = 0;
    if (a4) {
      goto LABEL_7;
    }
LABEL_10:
    uint64_t v15 = 0LL;
    int v16 = 0;
LABEL_11:
    wifi_manager_simulate_notification(v7[1], (uint64_t)BytePtr, Length, a3, (uint64_t)v15, v16);
    uint64_t v17 = 0LL;
    if (!v11) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }

  CFDictionaryRef v9 = WiFiNetworkCopyRecord((uint64_t)a2);
  if (!v9)
  {
LABEL_18:
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
LABEL_20:
    uint64_t v17 = 74LL;
    goto LABEL_17;
  }

  a2 = v9;
  BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData(*v8, v9);
  if (!BinaryData)
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
    uint64_t v17 = 74LL;
LABEL_16:
    CFRelease(a2);
    goto LABEL_17;
  }

  CFPropertyListRef v11 = BinaryData;
  BytePtr = CFDataGetBytePtr(BinaryData);
  int Length = CFDataGetLength(v11);
  if (!a4) {
    goto LABEL_10;
  }
LABEL_7:
  __int16 v14 = (const __CFData *)_CFPropertyListCreateBinaryData(*v8, a4);
  a4 = v14;
  if (v14)
  {
    uint64_t v15 = CFDataGetBytePtr(v14);
    int v16 = CFDataGetLength(a4);
    goto LABEL_11;
  }

  objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
  uint64_t v17 = 74LL;
  if (v11) {
LABEL_12:
  }
    CFRelease(v11);
LABEL_13:
  if (a4) {
    CFRelease(a4);
  }
  if (a2) {
    goto LABEL_16;
  }
LABEL_17:
  WiFiSendRightRelease(v7);
  return v17;
}

void WiFiManagerClientSetAutoInstantHotspotMode(uint64_t a1, int a2)
{
  CFPropertyListRef v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v3)
  {
    int v4 = v3;
    wifi_manager_set_auto_instant_hotspot_mode(v3[1], a2);
    WiFiSendRightRelease(v4);
  }

uint64_t WiFiManagerClientGetAutoInstantHotspotMode(uint64_t a1)
{
  unsigned int v4 = 1;
  CFPropertyListRef v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  int v2 = v1;
  if (v1) {
    wifi_manager_get_auto_instant_hotspot_mode(v1[1], &v4);
  }
  WiFiSendRightRelease(v2);
  return v4;
}

void WiFiManagerClientSetShareMyPersonalHotspotMode(uint64_t a1, int a2)
{
  CFPropertyListRef v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v3)
  {
    unsigned int v4 = v3;
    wifi_manager_set_share_personal_hotspot_mode(v3[1], a2);
    WiFiSendRightRelease(v4);
  }

uint64_t WiFiManagerClientGetShareMyPersonalHotspotMode(uint64_t a1)
{
  unsigned int v4 = 1;
  CFPropertyListRef v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  int v2 = v1;
  if (v1) {
    wifi_manager_get_share_personal_hotspot_mode(v1[1], &v4);
  }
  WiFiSendRightRelease(v2);
  return v4;
}

void WiFiManagerClientSetAutoInstantHotspotTestMode(uint64_t a1, int a2)
{
  CFPropertyListRef v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v3)
  {
    unsigned int v4 = v3;
    wifi_manager_set_auto_instant_hotspot_test_mode(v3[1], a2);
    WiFiSendRightRelease(v4);
  }

void WiFiManagerClientSetAutoInstantHotspotTriggerInterval(uint64_t a1, double a2)
{
  CFPropertyListRef v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v3)
  {
    unsigned int v4 = v3;
    wifi_manager_set_auto_instant_hotspot_trigger_interval(v3[1], a2);
    WiFiSendRightRelease(v4);
  }

uint64_t WiFiManagerClientTriggerGizmoSyncPasswordCheck(uint64_t a1)
{
  CFPropertyListRef v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (!v1) {
    return 0xFFFFFFFFLL;
  }
  int v2 = v1;
  wifi_manager_tigger_gizmo_sync_password_check(v1[1]);
  WiFiSendRightRelease(v2);
  return 0LL;
}

CFPropertyListRef WiFiManagerClientCopySSIDRepresentingMostUsedNetworkGeoTaggedToCurrentDeviceLocation( uint64_t a1)
{
  CFPropertyListRef v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (!v1) {
    return 0LL;
  }
  int v2 = v1;
  wifi_manager_copy_ssid_most_used_geo_tagged_to_current_location(v1[1], &length[1], length);
  uint64_t v3 = *(void *)&length[1];
  unsigned int v4 = length[0];
  if (*(void *)&length[1]) {
    BOOL v5 = length[0] == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    CFPropertyListRef v6 = 0LL;
  }

  else
  {
    CFPropertyListRef v6 = _WiFiCopyUnserialized(*(UInt8 **)&length[1], length[0]);
    uint64_t v3 = *(void *)&length[1];
    unsigned int v4 = length[0];
  }

  _WiFiVMDealloc(v3, v4);
  WiFiSendRightRelease(v2);
  return v6;
}

uint64_t WiFiManagerClientIsWPA3PersonalSupported(uint64_t a1)
{
  int v4 = 0;
  CFPropertyListRef v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  int v2 = v1;
  if (v1) {
    wifi_manager_is_wpa3_personal_supported(v1[1], &v4);
  }
  WiFiSendRightRelease(v2);
  return v4;
}

uint64_t WiFiManagerClientIsHotspotWPA3PersonalSupported(uint64_t a1)
{
  int v4 = 0;
  CFPropertyListRef v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  int v2 = v1;
  if (v1) {
    wifi_manager_is_hotspot_wpa3_personal_supported(v1[1], &v4);
  }
  WiFiSendRightRelease(v2);
  return v4;
}

uint64_t WiFiManagerClientIsWPA3EnterpriseSupported(uint64_t a1)
{
  int v4 = 0;
  CFPropertyListRef v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  int v2 = v1;
  if (v1) {
    wifi_manager_is_wpa3_enterprise_supported(v1[1], &v4);
  }
  WiFiSendRightRelease(v2);
  return v4;
}

uint64_t WiFiManagerClientIsMfpCapableDevice(uint64_t a1)
{
  int v4 = 0;
  CFPropertyListRef v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  int v2 = v1;
  if (v1) {
    wifi_manager_is_mfp_capable_device(v1[1], &v4);
  }
  WiFiSendRightRelease(v2);
  return v4;
}

BOOL WiFiManagerClientIsInfraAllowed(uint64_t a1)
{
  int v4 = 0;
  CFPropertyListRef v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  int v2 = v1;
  if (v1) {
    wifi_manager_is_infra_allowed(v1[1], &v4);
  }
  WiFiSendRightRelease(v2);
  return v4 != 0;
}

BOOL WiFiManagerClientIsP2PAllowed(uint64_t a1)
{
  int v4 = 0;
  CFPropertyListRef v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  int v2 = v1;
  if (v1) {
    wifi_manager_is_p2p_allowed(v1[1], &v4);
  }
  WiFiSendRightRelease(v2);
  return v4 != 0;
}

BOOL WiFiManagerClientSetNetworkProperty(uint64_t a1, uint64_t a2, const void *a3, const void *a4)
{
  int v24 = -3902;
  CFPropertyListRef v7 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (!v7) {
    goto LABEL_18;
  }
  CFDictionaryRef v8 = WiFiNetworkCopyRecord(a2);
  if (!v8) {
    goto LABEL_18;
  }
  CFDictionaryRef v9 = v8;
  int v10 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x189604DB0], v8);
  uint64_t v12 = BinaryData;
  if (BinaryData)
  {
    BytePtr = CFDataGetBytePtr(BinaryData);
    int Length = CFDataGetLength(v12);
  }

  else
  {
    BytePtr = 0LL;
    int Length = 0;
  }

  uint64_t v15 = (const __CFData *)_CFPropertyListCreateBinaryData(v10, a3);
  int v16 = v15;
  if (v15)
  {
    uint64_t v17 = CFDataGetBytePtr(v15);
    int v18 = CFDataGetLength(v16);
    if (!a4) {
      goto LABEL_13;
    }
  }

  else
  {
    uint64_t v17 = 0LL;
    int v18 = 0;
    if (!a4) {
      goto LABEL_13;
    }
  }

  int v19 = (const __CFData *)_CFPropertyListCreateBinaryData(v10, a4);
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = CFDataGetBytePtr(v19);
    int v22 = CFDataGetLength(v20);
    wifi_manager_set_network_property(v7[1], (uint64_t)BytePtr, Length, (uint64_t)v17, v18, (uint64_t)v21, v22, &v24);
    CFRelease(v20);
    if (!v16) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }

unsigned int *WiFiManagerClientSetFamilyHotspotPreferences(uint64_t a1, const void *a2)
{
  int v14 = -3902;
  uint64_t result = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (result)
  {
    int v4 = result;
    BOOL v5 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData( (CFAllocatorRef)*MEMORY[0x189604DB0],  @"FamilyHotspotPreferences");
    CFPropertyListRef v7 = BinaryData;
    if (BinaryData)
    {
      BytePtr = CFDataGetBytePtr(BinaryData);
      int Length = CFDataGetLength(v7);
      if (!a2) {
        goto LABEL_9;
      }
    }

    else
    {
      BytePtr = 0LL;
      int Length = 0;
      if (!a2) {
        goto LABEL_9;
      }
    }

    int v10 = (const __CFData *)_CFPropertyListCreateBinaryData(v5, a2);
    if (v10)
    {
      CFPropertyListRef v11 = v10;
      uint64_t v12 = CFDataGetBytePtr(v10);
      int v13 = CFDataGetLength(v11);
      wifi_manager_set_property(v4[1], (uint64_t)BytePtr, Length, (uint64_t)v12, v13, &v14);
      CFRelease(v11);
      if (!v7) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }

LABEL_9:
    wifi_manager_set_property(v4[1], (uint64_t)BytePtr, Length, 0LL, 0, &v14);
    if (!v7)
    {
LABEL_11:
      WiFiSendRightRelease(v4);
      return (unsigned int *)(v14 == 0);
    }

LABEL_10:
    CFRelease(v7);
    goto LABEL_11;
  }

  return result;
}

    CFPropertyListRef v11 = BytePtr[1] + 2LL;
    v7 += v11;
    BytePtr += v11;
  }

  while (1)
  {
    int v13 = *((unsigned __int8 *)v9 + 2);
    uint64_t v15 = (char *)v9 + v13;
    CFDictionaryRef v9 = (unsigned __int16 *)(v15 + 3);
  }

  int v16 = *(_OWORD *)(v9 + 2);
  v2[16] = *((_BYTE *)v9 + 20);
  *(_OWORD *)int v2 = v16;
  BytePtr = (const UInt8 *)objc_msgSend(objc_alloc(NSString), "initWithFormat:", @"%s", v2);
LABEL_24:
  free(v2);
  return BytePtr;
}

    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
    return 0LL;
  }

  return result;
}

CFPropertyListRef WiFiManagerClientCopyFamilyHotspotPreferences(uint64_t a1)
{
  CFPropertyListRef v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (!v1) {
    return 0LL;
  }
  int v2 = v1;
  wifi_manager_copy_family_hotspot_preferences(v1[1], &length[1], length);
  uint64_t v3 = *(void *)&length[1];
  unsigned int v4 = length[0];
  if (*(void *)&length[1]) {
    BOOL v5 = length[0] == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    CFPropertyListRef v6 = 0LL;
  }

  else
  {
    CFPropertyListRef v6 = _WiFiCopyUnserialized(*(UInt8 **)&length[1], length[0]);
    uint64_t v3 = *(void *)&length[1];
    unsigned int v4 = length[0];
  }

  _WiFiVMDealloc(v3, v4);
  WiFiSendRightRelease(v2);
  return v6;
}

uint64_t WiFiManagerClientIsPowerModificationDisabled(uint64_t a1)
{
  int v4 = 0;
  CFPropertyListRef v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  int v2 = v1;
  if (v1) {
    wifi_manager_is_power_modification_disabled(v1[1], &v4);
  }
  WiFiSendRightRelease(v2);
  return v4;
}

uint64_t WiFiManagerClientIsPersonalHotspotModificationDisabled(uint64_t a1)
{
  int v4 = 0;
  CFPropertyListRef v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  int v2 = v1;
  if (v1) {
    wifi_manager_is_personal_hotspot_modification_disabled(v1[1], &v4);
  }
  WiFiSendRightRelease(v2);
  return v4;
}

void WiFiManagerClientRegisterUIEventCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 304) = a2;
  *(void *)(a1 + 312) = a3;
  if (a2) {
    __WiFiManagerClientOrEventMask(a1, 0x200000000LL);
  }
  else {
    __WiFiManagerClientAndEventMask(a1, 0xFFFFFFFDFFFFFFFFLL);
  }
}

void WiFiManagerClientSetAdaptiveRoamingParams(uint64_t a1, const void *a2)
{
  uint64_t v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v3)
  {
    int v4 = v3;
    if (a2
      && (BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x189604DB0], a2)) != 0LL)
    {
      CFPropertyListRef v6 = BinaryData;
      BytePtr = CFDataGetBytePtr(BinaryData);
      int Length = CFDataGetLength(v6);
      wifi_manager_set_adaptive_roam_params(v4[1], (uint64_t)BytePtr, Length);
      CFRelease(v6);
    }

    else
    {
      wifi_manager_set_adaptive_roam_params(v4[1], 0LL, 0);
    }

    WiFiSendRightRelease(v4);
  }

uint64_t _wifi_manager_client_dispatch_ui_event(unsigned int a1, UInt8 *a2, unsigned int a3)
{
  BOOL v5 = WiFiPortCacheCopy(a1);
  if (v5)
  {
    CFPropertyListRef v6 = v5;
    CFPropertyListRef v7 = _WiFiCopyUnserialized(a2, a3);
    if (v7)
    {
      CFDictionaryRef v8 = v7;
      if ((*((_BYTE *)v6 + 76) & 2) != 0)
      {
        CFDictionaryRef v9 = (void (*)(void *, CFPropertyListRef, void))v6[38];
        if (v9) {
          v9(v6, v7, v6[39]);
        }
      }

      CFRelease(v6);
    }

    else
    {
      objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
      CFDictionaryRef v8 = v6;
    }

    CFRelease(v8);
  }

  _WiFiVMDealloc((uint64_t)a2, a3);
  return 0LL;
}

CFPropertyListRef WiFiManagerClientCopyMacRandomisationParameters(uint64_t a1)
{
  CFPropertyListRef v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  int v2 = v1;
  if (!v1)
  {
    unsigned int v3 = 0;
LABEL_9:
    CFPropertyListRef v5 = 0LL;
    goto LABEL_7;
  }

  wifi_manager_get_mac_randomisation_parameters(v1[1], &length[1], length);
  CFPropertyListRef v1 = *(unsigned int **)&length[1];
  unsigned int v3 = length[0];
  if (*(void *)&length[1]) {
    BOOL v4 = length[0] == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4) {
    goto LABEL_9;
  }
  CFPropertyListRef v5 = _WiFiCopyUnserialized(*(UInt8 **)&length[1], length[0]);
  CFPropertyListRef v1 = *(unsigned int **)&length[1];
  unsigned int v3 = length[0];
LABEL_7:
  _WiFiVMDealloc((uint64_t)v1, v3);
  WiFiSendRightRelease(v2);
  return v5;
}

CFDataRef WiFiManagerClientGetPrivateMacNetworkSwitchState(uint64_t a1, const void *a2)
{
  unsigned int v9 = 0;
  unsigned int v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (!a2) {
    return 0LL;
  }
  BOOL v4 = v3;
  uint64_t result = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x189604DB0], a2);
  if (result)
  {
    CFPropertyListRef v6 = result;
    BytePtr = CFDataGetBytePtr(result);
    int Length = CFDataGetLength(v6);
    if (v4)
    {
      wifi_manager_get_privatemac_network_switch_state(v4[1], (uint64_t)BytePtr, Length, (int *)&v9);
      WiFiSendRightRelease(v4);
    }

    CFRelease(v6);
    return (const __CFData *)v9;
  }

  return result;
}

void WiFiManagerClientSetUserInteractionOverride(uint64_t a1, const void *a2)
{
  if (!a1)
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
    BOOL v4 = 0LL;
    goto LABEL_7;
  }

  unsigned int v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  BOOL v4 = v3;
  if (!v3) {
    goto LABEL_8;
  }
  if (!a2)
  {
    wifi_manager_set_user_interaction_override(v3[1], 0LL, 0);
    goto LABEL_7;
  }

  BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x189604DB0], a2);
  if (!BinaryData)
  {
LABEL_8:
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
    goto LABEL_7;
  }

  CFPropertyListRef v6 = BinaryData;
  BytePtr = CFDataGetBytePtr(BinaryData);
  int Length = CFDataGetLength(v6);
  wifi_manager_set_user_interaction_override(v4[1], (uint64_t)BytePtr, Length);
  CFRelease(v6);
LABEL_7:
  WiFiSendRightRelease(v4);
}

void WiFiManagerClientSetUserInteractionNwOverride(uint64_t a1, const void *a2)
{
  if (!a1)
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
    BOOL v4 = 0LL;
    goto LABEL_7;
  }

  unsigned int v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  BOOL v4 = v3;
  if (!v3) {
    goto LABEL_8;
  }
  if (!a2)
  {
    wifi_manager_set_user_interaction_nw_override(v3[1], 0LL, 0);
    goto LABEL_7;
  }

  BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x189604DB0], a2);
  if (!BinaryData)
  {
LABEL_8:
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
    goto LABEL_7;
  }

  CFPropertyListRef v6 = BinaryData;
  BytePtr = CFDataGetBytePtr(BinaryData);
  int Length = CFDataGetLength(v6);
  wifi_manager_set_user_interaction_nw_override(v4[1], (uint64_t)BytePtr, Length);
  CFRelease(v6);
LABEL_7:
  WiFiSendRightRelease(v4);
}

BOOL WiFiManagerClientSetPrivateMacPrefForScanRecord(uint64_t a1, const void *a2, const void *a3, int a4)
{
  int v19 = 0;
  CFPropertyListRef v7 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x189604DB0], a2);
  unsigned int v9 = BinaryData;
  if (BinaryData)
  {
    BytePtr = CFDataGetBytePtr(BinaryData);
    int Length = CFDataGetLength(v9);
  }

  else
  {
    BytePtr = 0LL;
    int Length = 0;
  }

  uint64_t v12 = (const __CFData *)_CFPropertyListCreateBinaryData(v7, a3);
  int v13 = v12;
  if (v12)
  {
    int v14 = CFDataGetBytePtr(v12);
    int v15 = CFDataGetLength(v13);
  }

  else
  {
    int v14 = 0LL;
    int v15 = 0;
  }

  int v16 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v16)
  {
    uint64_t v17 = v16;
    wifi_manager_set_private_mac_pref(v16[1], (uint64_t)BytePtr, Length, a4, (uint64_t)v14, v15, &v19);
    WiFiSendRightRelease(v17);
  }

  if (v13) {
    CFRelease(v13);
  }
  if (v9) {
    CFRelease(v9);
  }
  return v19 == 0;
}

CFDataRef WiFiManagerClientCreatePrivateMacAddress( int a1, const __CFData *a2, const __CFData *a3, const __CFData *a4, CFStringRef theString)
{
  return WiFiNetworkCreatePrivateMacAddress(a2, a3, a4, theString);
}

void WiFiManagerClientSetMacRandomisationParams(uint64_t a1, const void *a2)
{
  unsigned int v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v3)
  {
    BOOL v4 = v3;
    if (a2
      && (BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x189604DB0], a2)) != 0LL)
    {
      CFPropertyListRef v6 = BinaryData;
      BytePtr = CFDataGetBytePtr(BinaryData);
      int Length = CFDataGetLength(v6);
      wifi_manager_set_mac_randomisation_params(v4[1], (uint64_t)BytePtr, Length);
      CFRelease(v6);
    }

    else
    {
      wifi_manager_set_mac_randomisation_params(v4[1], 0LL, 0);
    }

    WiFiSendRightRelease(v4);
  }

void WiFiManagerClientUpdatePrivateMacNetwork(uint64_t a1, uint64_t a2)
{
  unsigned int v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v3)
  {
    CFDictionaryRef v4 = WiFiNetworkCopyRecord(a2);
    if (v4)
    {
      CFDictionaryRef v5 = v4;
      BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x189604DB0], v4);
      if (BinaryData)
      {
        CFPropertyListRef v7 = BinaryData;
        int v8 = v3[1];
        BytePtr = CFDataGetBytePtr(BinaryData);
        int Length = CFDataGetLength(v7);
        wifi_manager_update_privateMac_network(v8, (uint64_t)BytePtr, Length);
        CFRelease(v7);
      }

      CFRelease(v5);
    }
  }

  WiFiSendRightRelease(v3);
}

BOOL WiFiManagerClientPrivateMacIsQuickProbeRequired(uint64_t a1, uint64_t a2)
{
  int v12 = 0;
  unsigned int v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v3)
  {
    CFDictionaryRef v4 = WiFiNetworkCopyRecord(a2);
    if (v4)
    {
      CFDictionaryRef v5 = v4;
      BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x189604DB0], v4);
      if (BinaryData)
      {
        CFPropertyListRef v7 = BinaryData;
        mach_port_t v8 = v3[1];
        BytePtr = CFDataGetBytePtr(BinaryData);
        int Length = CFDataGetLength(v7);
        wifi_manager_private_mac_is_quick_probe_required(v8, (uint64_t)BytePtr, Length, &v12);
        CFRelease(v7);
      }

      CFRelease(v5);
    }
  }

  WiFiSendRightRelease(v3);
  return v12 != 0;
}

void WiFiManagerClientPrivateMacReportProbeResult(uint64_t a1, uint64_t a2, int a3)
{
  CFDictionaryRef v5 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v5)
  {
    CFDictionaryRef v6 = WiFiNetworkCopyRecord(a2);
    if (v6)
    {
      CFDictionaryRef v7 = v6;
      BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x189604DB0], v6);
      if (BinaryData)
      {
        unsigned int v9 = BinaryData;
        mach_port_t v10 = v5[1];
        BytePtr = CFDataGetBytePtr(BinaryData);
        int Length = CFDataGetLength(v9);
        wifi_manager_private_mac_probe_result(v10, a3, (uint64_t)BytePtr, Length);
        CFRelease(v9);
      }

      CFRelease(v7);
    }
  }

  WiFiSendRightRelease(v5);
}

uint64_t WiFiManagerClientIsMultiBand(uint64_t a1)
{
  int v4 = 0;
  CFPropertyListRef v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  int v2 = v1;
  if (v1) {
    wifi_manager_is_multi_band(v1[1], &v4);
  }
  WiFiSendRightRelease(v2);
  return v4;
}

uint64_t WiFiManagerClientGetHardwareFailure(uint64_t a1)
{
  int v5 = -1;
  CFPropertyListRef v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  int v2 = v1;
  if (v1)
  {
    wifi_manager_get_hardware_failure(v1[1], &v5);
    if (v5 == 1) {
      uint64_t v3 = 1LL;
    }
    else {
      uint64_t v3 = 2 * (v5 == 2);
    }
  }

  else
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
    uint64_t v3 = 0LL;
  }

  WiFiSendRightRelease(v2);
  return v3;
}

void WiFiManagerClientResetNetworkSettings(uint64_t a1)
{
  CFPropertyListRef v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  int v2 = v1;
  if (v1) {
    wifi_manager_reset_network_settings(v1[1]);
  }
  else {
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
  }
  WiFiSendRightRelease(v2);
}

void WiFiManagerClientCleanupLogBufferFiles(uint64_t a1)
{
  CFPropertyListRef v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v1)
  {
    int v2 = v1;
    wifi_manager_cleanup_log_buffer_files(v1[1]);
    WiFiSendRightRelease(v2);
  }

void WiFiManagerClientWiFiCallHandoverNotification(uint64_t a1, int a2)
{
  uint64_t v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  int v4 = v3;
  if (v3) {
    wifi_manager_wificall_handover_notification(v3[1], a2);
  }
  else {
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
  }
  WiFiSendRightRelease(v4);
}

uint64_t WiFiManagerClientSetAWDLMacAddressInUse(uint64_t a1, int a2)
{
  uint64_t v3 = (void *)[MEMORY[0x189612C48] shared];
  if (a2) {
    return [v3 beginTransaction:15 completionHandler:0];
  }
  else {
    return [v3 endTransaction:15];
  }
}

CFPropertyListRef WiFiManagerClientCopyMovementStates(uint64_t a1)
{
  if (!a1)
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
    int v2 = 0LL;
    goto LABEL_10;
  }

  CFPropertyListRef v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  int v2 = v1;
  if (!v1 || (wifi_manager_copy_movement_states(v1[1], &length[1], length), !*(void *)&length[1]) || !length[0])
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
LABEL_10:
    CFPropertyListRef v3 = 0LL;
    goto LABEL_7;
  }

  CFPropertyListRef v3 = _WiFiCopyUnserialized(*(UInt8 **)&length[1], length[0]);
  if (!v3) {
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
  }
LABEL_7:
  _WiFiVMDealloc(*(uint64_t *)&length[1], length[0]);
  WiFiSendRightRelease(v2);
  return v3;
}

void WiFiManagerClientSetSimulatedMovementStates(uint64_t a1, const void *a2)
{
  CFPropertyListRef v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v3)
  {
    BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x189604DB0], a2);
    if (BinaryData)
    {
      int v5 = BinaryData;
      mach_port_t v6 = v3[1];
      BytePtr = CFDataGetBytePtr(BinaryData);
      int Length = CFDataGetLength(v5);
      wifi_manager_set_simulated_movement_states(v6, (uint64_t)BytePtr, Length);
      CFRelease(v5);
    }
  }

  else
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
  }

  WiFiSendRightRelease(v3);
}

void WiFiManagerClientSetBatterySaveMode(uint64_t a1, int a2)
{
  CFPropertyListRef v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v3)
  {
    int v4 = v3;
    wifi_manager_set_battery_save_mode(v3[1], a2);
    WiFiSendRightRelease(v4);
  }

uint64_t WiFiManagerClientGetBatterySaveMode(uint64_t a1)
{
  int v5 = 0;
  CFPropertyListRef v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v1)
  {
    int v2 = v1;
    wifi_manager_get_battery_save_mode(v1[1], &v5);
    WiFiSendRightRelease(v2);
    return v5;
  }

  else
  {
    return 0;
  }

void WiFiManagerClientInitiateColocatedNetworkTransition(uint64_t a1, const void *a2)
{
  CFPropertyListRef v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v3)
  {
    int v4 = v3;
    if (a2
      && (BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x189604DB0], a2)) != 0LL)
    {
      mach_port_t v6 = BinaryData;
      BytePtr = CFDataGetBytePtr(BinaryData);
      int Length = CFDataGetLength(v6);
      wifi_manager_initiate_network_transition(v4[1], (uint64_t)BytePtr, Length);
      CFRelease(v6);
    }

    else
    {
      wifi_manager_initiate_network_transition(v4[1], 0LL, 0);
    }

    WiFiSendRightRelease(v4);
  }

uint64_t _WiFiManagerClientGetCoreWiFiInterface(uint64_t a1)
{
  if (!*(void *)(a1 + 328))
  {
    int v2 = (void *)[objc_alloc(MEMORY[0x18960F048]) initWithServiceType:7];
    *(void *)(a1 + 328) = v2;
    if (v2)
    {
      v4[0] = MEMORY[0x1895F87A8];
      v4[1] = 3221225472LL;
      v4[2] = ___WiFiManagerClientGetCoreWiFiInterface_block_invoke;
      v4[3] = &__block_descriptor_40_e5_v8__0l;
      v4[4] = a1;
      [v2 setInvalidationHandler:v4];
      [*(id *)(a1 + 328) activate];
    }

    else
    {
      objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
    }
  }

  return *(void *)(a1 + 328);
}

void __WiFiManagerClientRelease(uint64_t a1)
{
  int v2 = *(__CFMachPort **)(a1 + 96);
  if (v2)
  {
    CFMachPortInvalidate(v2);
    CFPropertyListRef v3 = *(const void **)(a1 + 96);
    if (v3)
    {
      CFRelease(v3);
      *(void *)(a1 + 96) = 0LL;
    }
  }

  int v4 = *(const void **)(a1 + 104);
  if (v4)
  {
    CFRelease(v4);
    *(void *)(a1 + 104) = 0LL;
  }

  int v5 = *(_DWORD *)(a1 + 88);
  if (v5)
  {
    notify_cancel(v5);
    *(_DWORD *)(a1 + 88) = 0;
  }

  uint64_t v6 = *(void *)(a1 + 32);
  if (v6)
  {
    wifi_manager_close(*(_DWORD *)(v6 + 4));
    WiFiSendRightRelease(*(unsigned int **)(a1 + 32));
    *(void *)(a1 + 32) = 0LL;
  }

  unsigned int Port = WiFiMIGMachPortGetPort(*(void *)(a1 + 40));
  WiFiPortCacheRemove(Port);
  mach_port_name_t v8 = WiFiMIGMachPortGetPort(*(void *)(a1 + 40));
  unsigned int v9 = *(const void **)(a1 + 40);
  if (v9)
  {
    CFRelease(v9);
    *(void *)(a1 + 40) = 0LL;
  }

  mach_port_mod_refs(*MEMORY[0x1895FBBE0], v8, 1u, -1);
  mach_port_t v10 = *(const void **)(a1 + 64);
  if (v10)
  {
    CFRelease(v10);
    *(void *)(a1 + 64) = 0LL;
  }

  [*(id *)(a1 + 328) invalidate];

  *(void *)(a1 + 328) = 0LL;
}

unsigned int *__WiFiManagerClientGetOrReconnectServerPort(uint64_t a1, int a2)
{
  error[3] = *(CFErrorRef *)MEMORY[0x1895F89C0];
  mach_port_t v83 = 0;
  mach_port_t sp = 0;
  mach_port_t previous = -1431655766;
  int v82 = -1431655766;
  os_unfair_recursive_lock_lock_with_options();
  int v4 = *(unsigned int **)(a1 + 32);
  if (a2)
  {
    WiFiSendRightRelease(*(unsigned int **)(a1 + 32));
    *(void *)(a1 + 32) = 0LL;
  }

  else if (v4)
  {
    do
      unsigned int v32 = __ldxr(v4);
    while (__stxr(v32 + 1, v4));
    os_unfair_recursive_lock_unlock();
    return v4;
  }

  error[0] = 0LL;
  int v5 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  uint64_t v6 = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x189604DB0]);
  if (!v6) {
    goto LABEL_42;
  }
  CFDictionaryRef v7 = v6;
  CFTypeRef v8 = SecTaskCopyValueForEntitlement(v6, @"com.apple.wifi.manager-access", error);
  BOOL v10 = 1;
  if (v8)
  {
    CFTypeID TypeID = CFBooleanGetTypeID();
    if (TypeID == CFGetTypeID(v8))
    {
      if (CFEqual(v8, (CFTypeRef)*MEMORY[0x189604DE8])) {
        BOOL v10 = 0;
      }
    }
  }

  if (error[0])
  {
    CFRelease(error[0]);
    error[0] = 0LL;
  }

  if (v8) {
    CFRelease(v8);
  }
  CFRelease(v7);
  if (v10)
  {
LABEL_42:
    BOOL v33 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    if (v33) {
      __WiFiManagerClientGetOrReconnectServerPort_cold_1(v33, v34, v35, v36, v37, v38, v39, v40);
    }
    goto LABEL_54;
  }

  if (bootstrap_look_up(*MEMORY[0x1895F9630], "com.apple.wifi.manager", &sp))
  {
    BOOL v41 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    if (v41) {
      __WiFiManagerClientGetOrReconnectServerPort_cold_7(v41, v42, v43, v44, v45, v46, v47, v48);
    }
    goto LABEL_54;
  }

  if (!sp)
  {
    BOOL v49 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    if (v49) {
      __WiFiManagerClientGetOrReconnectServerPort_cold_2(v49, v50, v51, v52, v53, v54, v55, v56);
    }
    goto LABEL_54;
  }

  mach_port_name_t Port = WiFiMIGMachPortGetPort(*(void *)(a1 + 40));
  int v12 = (ipc_space_t *)MEMORY[0x1895FBBE0];
  mach_port_insert_right(*MEMORY[0x1895FBBE0], Port, Port, 0x14u);
  if (mach_port_request_notification(*v12, Port, 70, 0, Port, 0x15u, &previous))
  {
    BOOL v57 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    if (v57) {
      __WiFiManagerClientGetOrReconnectServerPort_cold_6(v57, v58, v59, v60, v61, v62, v63, v64);
    }
    goto LABEL_54;
  }

  mach_port_t v13 = sp;
  int v14 = *(_DWORD *)(a1 + 16);
  pid_t v15 = getpid();
  wifi_manager_open(v13, v14, v15, Port, &v83, &v82);
  mach_port_deallocate(*v12, sp);
  if (v82 == 1)
  {
    BOOL v65 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    if (v65) {
      __WiFiManagerClientGetOrReconnectServerPort_cold_3(v65, v66, v67, v68, v69, v70, v71, v72);
    }
    goto LABEL_54;
  }

  mach_port_t v16 = v83;
  if (!v83)
  {
    BOOL v73 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    if (v73) {
      __WiFiManagerClientGetOrReconnectServerPort_cold_4(v73, v74, v75, v76, v77, v78, v79, v80);
    }
LABEL_54:
    os_unfair_recursive_lock_unlock();
    return 0LL;
  }

  int v4 = (unsigned int *)malloc(8uLL);
  *int v4 = 1;
  v4[1] = v16;
  *(void *)(a1 + 32) = v4;
  wifi_manager_set_event_mask(v16, *(void *)(a1 + 72));
  CFMutableDictionaryRef Mutable = CFArrayCreateMutable(v5, 0LL, MEMORY[0x189605228]);
  memset(length, 0, sizeof(length));
  wifi_manager_copy_devices(v83, &length[1], length);
  if (*(void *)&length[1])
  {
    if (length[0])
    {
      int v18 = (const __CFArray *)_WiFiCopyUnserialized(*(UInt8 **)&length[1], length[0]);
      if (v18)
      {
        int v19 = v18;
        error[0] = 0LL;
        CFIndex Count = CFArrayGetCount(v18);
        if (Count >= 1)
        {
          CFIndex v21 = Count;
          for (CFIndex i = 0LL; i != v21; ++i)
          {
            ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v19, i);
            if (ValueAtIndex)
            {
              int v24 = ValueAtIndex;
              Value = CFDictionaryGetValue(ValueAtIndex, @"VIRT_IF_NAME");
              unsigned int v26 = (const __CFNumber *)CFDictionaryGetValue(v24, @"VIRT_IF_ROLE");
              CFNumberGetValue(v26, kCFNumberLongType, error);
              if (Value) {
                __WiFiManagerClientAddDevice(a1, Value, (uint64_t)error[0], Mutable);
              }
            }
          }
        }

        CFRelease(v19);
      }
    }
  }

  _WiFiVMDealloc(*(uint64_t *)&length[1], length[0]);
  do
    unsigned int v27 = __ldxr(v4);
  while (__stxr(v27 + 1, v4));
  os_unfair_recursive_lock_unlock();
  if (Mutable)
  {
    if (CFArrayGetCount(Mutable) >= 1)
    {
      CFIndex v28 = 0LL;
      CFTypeID v29 = (os_log_s *)MEMORY[0x1895F8DA0];
      do
      {
        unsigned int v30 = CFArrayGetValueAtIndex(Mutable, v28);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
          __WiFiManagerClientGetOrReconnectServerPort_cold_5((uint8_t *)error, (CFErrorRef *)((char *)error + 4));
        }
        (*(void (**)(uint64_t, const void *, void))(a1 + 128))(a1, v30, *(void *)(a1 + 136));
        ++v28;
      }

      while (CFArrayGetCount(Mutable) > v28);
    }

    CFRelease(Mutable);
  }

  return v4;
}

void OUTLINED_FUNCTION_0_0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void OUTLINED_FUNCTION_2_0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
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

uint64_t WiFiDeviceClientGetTypeID()
{
  uint64_t result = __wiFiDeviceTypeID;
  if (!__wiFiDeviceTypeID)
  {
    pthread_once(&__wiFiDeviceTypeInit, (void (*)(void))__WiFiDeviceClientRegister);
    return __wiFiDeviceTypeID;
  }

  return result;
}

uint64_t __WiFiDeviceClientRegister()
{
  uint64_t result = _CFRuntimeRegisterClass();
  __wiFiDeviceCFTypeID TypeID = result;
  return result;
}

uint64_t _WiFiDeviceClientCreate(uint64_t a1, uint64_t a2, int a3, const void *a4, uint64_t a5)
{
  uint64_t v5 = 0LL;
  if (a3 && a4)
  {
    if (!__wiFiDeviceTypeID) {
      pthread_once(&__wiFiDeviceTypeInit, (void (*)(void))__WiFiDeviceClientRegister);
    }
    uint64_t Instance = _CFRuntimeCreateInstance();
    uint64_t v5 = Instance;
    if (Instance)
    {
      bzero((void *)(Instance + 16), 0x280uLL);
      *(void *)(v5 + 56) = a2;
      *(_DWORD *)(v5 + 16) = a3;
      CFTypeRef v11 = CFRetain(a4);
      *(void *)(v5 + 24) = v11;
      CFTypeRef BinaryData = _CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x189604DB0], v11);
      *(void *)(v5 + 48) = BinaryData;
      if (BinaryData)
      {
        *(void *)(v5 + 40) = a5;
      }

      else
      {
        CFRelease((CFTypeRef)v5);
        return 0LL;
      }
    }
  }

  return v5;
}

uint64_t _WiFiDeviceClientSendEventMaskToServer(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 16);
  BytePtr = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
  int Length = CFDataGetLength(*(CFDataRef *)(a1 + 48));
  return wifi_device_set_event_mask(v2, (uint64_t)BytePtr, Length, *(void *)(a1 + 64));
}

uint64_t _WiFiDeviceClientGetServerPort(uint64_t a1)
{
  return *(unsigned int *)(a1 + 16);
}

uint64_t _WiFiDeviceClientSetServerPort(uint64_t result, int a2)
{
  *(_DWORD *)(result + 16) = a2;
  return result;
}

CFPropertyListRef WiFiDeviceClientCopyProperty(uint64_t a1, const void *a2)
{
  CFPropertyListRef v2 = 0LL;
  memset(length, 0, sizeof(length));
  if (a1 && a2)
  {
    CFTypeRef BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x189604DB0], a2);
    uint64_t v5 = BinaryData;
    if (BinaryData)
    {
      BytePtr = CFDataGetBytePtr(BinaryData);
      int v7 = CFDataGetLength(v5);
    }

    else
    {
      BytePtr = 0LL;
      int v7 = 0;
    }

    mach_port_t v8 = *(_DWORD *)(a1 + 16);
    unsigned int v9 = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
    int v10 = CFDataGetLength(*(CFDataRef *)(a1 + 48));
    wifi_device_copy_property(v8, (uint64_t)v9, v10, (uint64_t)BytePtr, v7, &length[1], length);
    CFPropertyListRef v2 = 0LL;
    if (*(void *)&length[1] && length[0]) {
      CFPropertyListRef v2 = _WiFiCopyUnserialized(*(UInt8 **)&length[1], length[0]);
    }
    if (v5) {
      CFRelease(v5);
    }
  }

  _WiFiVMDealloc(*(uint64_t *)&length[1], length[0]);
  return v2;
}

void WiFiDeviceClientSetProperty(uint64_t a1, const void *a2, const void *a3)
{
  if (a1 && a2)
  {
    uint64_t v5 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    CFTypeRef BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x189604DB0], a2);
    int v7 = BinaryData;
    if (BinaryData)
    {
      BytePtr = CFDataGetBytePtr(BinaryData);
      int Length = CFDataGetLength(v7);
    }

    else
    {
      BytePtr = 0LL;
      int Length = 0;
    }

    int v10 = (const __CFData *)_CFPropertyListCreateBinaryData(v5, a3);
    CFTypeRef v11 = v10;
    if (v10)
    {
      int v12 = CFDataGetBytePtr(v10);
      int v13 = CFDataGetLength(v11);
    }

    else
    {
      int v12 = 0LL;
      int v13 = 0;
    }

    int v14 = *(_DWORD *)(a1 + 16);
    pid_t v15 = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
    int v16 = CFDataGetLength(*(CFDataRef *)(a1 + 48));
    wifi_device_set_property(v14, (uint64_t)v15, v16, (uint64_t)BytePtr, Length, (uint64_t)v12, v13);
    if (v7) {
      CFRelease(v7);
    }
    if (v11) {
      CFRelease(v11);
    }
  }

uint64_t WiFiDeviceClientSetCoexParameters(uint64_t a1, const void *a2, const void *a3)
{
  unsigned int v18 = -3902;
  uint64_t v5 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  CFTypeRef BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x189604DB0], a2);
  int v7 = BinaryData;
  if (BinaryData)
  {
    BytePtr = CFDataGetBytePtr(BinaryData);
    int Length = CFDataGetLength(v7);
  }

  else
  {
    BytePtr = 0LL;
    int Length = 0;
  }

  int v10 = (const __CFData *)_CFPropertyListCreateBinaryData(v5, a3);
  CFTypeRef v11 = v10;
  if (v10)
  {
    int v12 = CFDataGetBytePtr(v10);
    int v13 = CFDataGetLength(v11);
  }

  else
  {
    int v12 = 0LL;
    int v13 = 0;
  }

  mach_port_t v14 = *(_DWORD *)(a1 + 16);
  pid_t v15 = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
  int v16 = CFDataGetLength(*(CFDataRef *)(a1 + 48));
  wifi_device_set_coex_parameters(v14, (uint64_t)v15, v16, (uint64_t)BytePtr, Length, (uint64_t)v12, v13, (int *)&v18);
  if (v7) {
    CFRelease(v7);
  }
  if (v11) {
    CFRelease(v11);
  }
  return v18;
}

uint64_t WiFiDeviceClientRegisterRemovalCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 80) = a2;
  *(void *)(a1 + 88) = a3;
  *(void *)(a1 + 64) = *(void *)(a1 + 64) & 0xFFFFFFFFFFFFFFF7LL | (8LL * (a2 != 0));
  return _WiFiDeviceClientSendEventMaskToServer(a1);
}

uint64_t WiFiDeviceClientRegisterPowerCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 144) = a2;
  *(void *)(a1 + 152) = a3;
  *(void *)(a1 + 64) = *(void *)(a1 + 64) & 0xFFFFFFFFFFFFFFFELL | (a2 != 0);
  return _WiFiDeviceClientSendEventMaskToServer(a1);
}

uint64_t WiFiDeviceClientRegisterBssidChangeCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 272) = a2;
  *(void *)(a1 + 280) = a3;
  *(void *)(a1 + 64) = *(void *)(a1 + 64) & 0xFFFFFFFFFFFFFBFFLL | ((unint64_t)(a2 != 0) << 10);
  return _WiFiDeviceClientSendEventMaskToServer(a1);
}

uint64_t WiFiDeviceClientRegisterScanCacheUpdateCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 224) = a2;
  *(void *)(a1 + 232) = a3;
  *(void *)(a1 + 64) = *(void *)(a1 + 64) & 0xFFFFFFFFFFFFFFBFLL | ((unint64_t)(a2 != 0) << 6);
  return _WiFiDeviceClientSendEventMaskToServer(a1);
}

uint64_t WiFiDeviceClientRegisterScanCacheUpdateCallback2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 240) = a2;
  *(void *)(a1 + 248) = a3;
  *(void *)(a1 + 64) = *(void *)(a1 + 64) & 0xFFFFFFFFFFFFFFBFLL | ((unint64_t)(a2 != 0) << 6);
  return _WiFiDeviceClientSendEventMaskToServer(a1);
}

uint64_t WiFiDeviceClientRegisterScanUpdateCallback(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  *(void *)(a1 + 256) = a2;
  *(void *)(a1 + 264) = a4;
  uint64_t v4 = 128LL;
  if (a3 == 1) {
    uint64_t v4 = 256LL;
  }
  if (a2) {
    uint64_t v5 = *(void *)(a1 + 64) | v4;
  }
  else {
    uint64_t v5 = *(void *)(a1 + 64) & ~v4;
  }
  *(void *)(a1 + 64) = v5;
  return _WiFiDeviceClientSendEventMaskToServer(a1);
}

uint64_t WiFiDeviceClientRegisterLinkCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 96) = a2;
  *(void *)(a1 + 104) = a3;
  *(void *)(a1 + 64) = *(void *)(a1 + 64) & 0xFFFFFFFFFFFFFFFDLL | (2LL * (a2 != 0));
  return _WiFiDeviceClientSendEventMaskToServer(a1);
}

uint64_t WiFiDeviceClientRegisterExtendedLinkCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 432) = a2;
  *(void *)(a1 + 440) = a3;
  *(void *)(a1 + 64) = *(void *)(a1 + 64) & 0xFFFFFFFFFFFFFFFDLL | (2LL * (a2 != 0));
  return _WiFiDeviceClientSendEventMaskToServer(a1);
}

uint64_t WiFiDeviceClientRegisterAutoJoinNotificationCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 448) = a2;
  *(void *)(a1 + 456) = a3;
  *(void *)(a1 + 64) = *(void *)(a1 + 64) & 0xFFFFFFFFFF7FFFFFLL | ((unint64_t)(a2 != 0) << 23);
  return _WiFiDeviceClientSendEventMaskToServer(a1);
}

uint64_t WiFiDeviceClientRegisterUserJoinNotificationCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 464) = a2;
  *(void *)(a1 + 472) = a3;
  *(void *)(a1 + 64) = *(void *)(a1 + 64) & 0xFFFFFFFBFFFFFFFFLL | ((unint64_t)(a2 != 0) << 34);
  return _WiFiDeviceClientSendEventMaskToServer(a1);
}

uint64_t WiFiDeviceClientRegisterDecryptionCallback(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(void *)(result + 112) = a2;
  *(void *)(result + 120) = a3;
  return result;
}

uint64_t WiFiDeviceClientRegisterResumeScanCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 128) = a2;
  *(void *)(a1 + 136) = a3;
  *(void *)(a1 + 64) = *(void *)(a1 + 64) & 0xFFFFFFFFFFFFF7FFLL | ((unint64_t)(a2 != 0) << 11);
  return _WiFiDeviceClientSendEventMaskToServer(a1);
}

uint64_t WiFiDeviceClientRegisterBgScanSuspendResumeCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 288) = a2;
  *(void *)(a1 + 296) = a3;
  *(void *)(a1 + 64) = *(void *)(a1 + 64) & 0xFFFFFFFFFFFFEFFFLL | ((unint64_t)(a2 != 0) << 12);
  return _WiFiDeviceClientSendEventMaskToServer(a1);
}

uint64_t WiFiDeviceClientRegisterLQMCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 304) = a2;
  *(void *)(a1 + 312) = a3;
  *(void *)(a1 + 64) = *(void *)(a1 + 64) & 0xFFFFFFFFFFFFBFFFLL | ((unint64_t)(a2 != 0) << 14);
  return _WiFiDeviceClientSendEventMaskToServer(a1);
}

uint64_t WiFiDeviceClientRegisterWeightAvgLQMCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 320) = a2;
  *(void *)(a1 + 328) = a3;
  *(void *)(a1 + 64) = *(void *)(a1 + 64) & 0xFFFFFFFF7FFFFFFFLL | ((unint64_t)(a2 != 0) << 31);
  return _WiFiDeviceClientSendEventMaskToServer(a1);
}

uint64_t WiFiDeviceClientRegisterBTCoexStatsCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 336) = a2;
  *(void *)(a1 + 344) = a3;
  *(void *)(a1 + 64) = *(void *)(a1 + 64) & 0xFFFFFBFFFFFFFFFFLL | ((unint64_t)(a2 != 0) << 42);
  return _WiFiDeviceClientSendEventMaskToServer(a1);
}

uint64_t WiFiDeviceClientRegisterBSPEventCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 608) = a2;
  *(void *)(a1 + 616) = a3;
  *(void *)(a1 + 64) = *(void *)(a1 + 64) & 0xFFFFF7FFFFFFFFFFLL | ((unint64_t)(a2 != 0) << 43);
  return _WiFiDeviceClientSendEventMaskToServer(a1);
}

uint64_t WiFiDeviceClientRegisterUCMEventCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 624) = a2;
  *(void *)(a1 + 632) = a3;
  *(void *)(a1 + 64) = *(void *)(a1 + 64) & 0xFFFFDFFFFFFFFFFFLL | ((unint64_t)(a2 != 0) << 45);
  return _WiFiDeviceClientSendEventMaskToServer(a1);
}

uint64_t WiFiDeviceClientRegisterBTScanIntervalRelaxCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 352) = a2;
  *(void *)(a1 + 360) = a3;
  *(void *)(a1 + 64) = *(void *)(a1 + 64) & 0xFFFFFFF7FFFFFFFFLL | ((unint64_t)(a2 != 0) << 35);
  return _WiFiDeviceClientSendEventMaskToServer(a1);
}

uint64_t WiFiDeviceClientRegister24GHzNetworkInCriticalStateCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 368) = a2;
  *(void *)(a1 + 376) = a3;
  *(void *)(a1 + 64) = *(void *)(a1 + 64) & 0xFFFFFFBFFFFFFFFFLL | ((unint64_t)(a2 != 0) << 38);
  return _WiFiDeviceClientSendEventMaskToServer(a1);
}

uint64_t WiFiDeviceClientRegisterM1M4Handshake24GHzCountCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 384) = a2;
  *(void *)(a1 + 392) = a3;
  *(void *)(a1 + 64) = *(void *)(a1 + 64) & 0xFFFFFF7FFFFFFFFFLL | ((unint64_t)(a2 != 0) << 39);
  return _WiFiDeviceClientSendEventMaskToServer(a1);
}

uint64_t WiFiDeviceClientRegisterCarPlayNetworkTypeChangeCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 400) = a2;
  *(void *)(a1 + 408) = a3;
  *(void *)(a1 + 64) = *(void *)(a1 + 64) & 0xFFFFFFDFFFFFFFFFLL | ((unint64_t)(a2 != 0) << 37);
  return _WiFiDeviceClientSendEventMaskToServer(a1);
}

uint64_t WiFiDeviceClientRegisterDiagnosticsCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 416) = a2;
  *(void *)(a1 + 424) = a3;
  *(void *)(a1 + 64) = *(void *)(a1 + 64) & 0xFFFFFFFFFFFF7FFFLL | ((unint64_t)(a2 != 0) << 15);
  return _WiFiDeviceClientSendEventMaskToServer(a1);
}

uint64_t WiFiDeviceClientRegisterHostApStateChangedCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 480) = a2;
  *(void *)(a1 + 488) = a3;
  *(void *)(a1 + 64) = *(void *)(a1 + 64) & 0xFFFFFFFFFFF7FFFFLL | ((unint64_t)(a2 != 0) << 19);
  return _WiFiDeviceClientSendEventMaskToServer(a1);
}

uint64_t WiFiDeviceClientRegisterDeviceAvailableCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 512) = a2;
  *(void *)(a1 + 520) = a3;
  *(void *)(a1 + 64) = *(void *)(a1 + 64) & 0xFFFFFFFFFFEFFFFFLL | ((unint64_t)(a2 != 0) << 20);
  return _WiFiDeviceClientSendEventMaskToServer(a1);
}

uint64_t WiFiDeviceClientRegisterTdConfirmedCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 640) = a2;
  *(void *)(a1 + 648) = a3;
  *(void *)(a1 + 64) = *(void *)(a1 + 64) & 0xFFFFBFFFFFFFFFFFLL | ((unint64_t)(a2 != 0) << 46);
  return _WiFiDeviceClientSendEventMaskToServer(a1);
}

_WORD *WiFiDeviceClientCopyCurrentNetwork(uint64_t a1)
{
  CFPropertyListRef v2 = getprogname();
  if (!strncmp("SpringBoard", v2, 0xBuLL) && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
    WiFiDeviceClientCopyCurrentNetwork_cold_1(a1);
  }
  int v3 = *(_DWORD *)(a1 + 16);
  BytePtr = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
  int v5 = CFDataGetLength(*(CFDataRef *)(a1 + 48));
  wifi_device_copy_current_network(v3, (uint64_t)BytePtr, v5, &length[1], length);
  CFPropertyListRef v6 = _WiFiCopyUnserialized(*(UInt8 **)&length[1], length[0]);
  if (v6)
  {
    int v7 = v6;
    mach_port_t v8 = WiFiNetworkCreate(*MEMORY[0x189604DB0], v6);
    CFRelease(v7);
  }

  else
  {
    mach_port_t v8 = 0LL;
  }

  _WiFiVMDealloc(*(uint64_t *)&length[1], length[0]);
  return v8;
}

uint64_t WiFiDeviceClientCopyCurrentNetworkAsync(uint64_t a1, dispatch_object_s *a2, uint64_t a3, uint64_t a4)
{
  if (!a1) {
    return 4294963396LL;
  }
  uint64_t result = 4294963396LL;
  if (a2 && *(void *)(a1 + 56))
  {
    unsigned int v9 = malloc(0x20uLL);
    if (v9)
    {
      int v10 = v9;
      *unsigned int v9 = a4;
      v9[1] = a1;
      void v9[2] = a3;
      dispatch_retain(a2);
      v10[3] = a2;
      CFTypeRef v11 = dispatch_queue_create("com.apple.wifid.queue", 0LL);
      dispatch_async_f(v11, v10, (dispatch_function_t)_dispatchCopyCurrentNetwork);
      dispatch_release(v11);
      return 0LL;
    }

    else
    {
      return 4294963395LL;
    }
  }

  return result;
}

void _dispatchCopyCurrentNetwork(uint64_t a1)
{
  if (a1)
  {
    CFPropertyListRef v2 = WiFiDeviceClientCopyCurrentNetwork(*(void *)(a1 + 8));
    int v3 = *(dispatch_queue_s **)(a1 + 24);
    v4[0] = MEMORY[0x1895F87A8];
    v4[1] = 3221225472LL;
    v4[2] = ___dispatchCopyCurrentNetwork_block_invoke;
    v4[3] = &__block_descriptor_48_e5_v8__0l;
    v4[4] = a1;
    void v4[5] = v2;
    dispatch_async(v3, v4);
  }

uint64_t WiFiDeviceClientGetInterfaceName(uint64_t a1)
{
  return *(void *)(a1 + 24);
}

uint64_t WiFiDeviceClientGetInterfaceRoleIndex(uint64_t a1)
{
  return *(void *)(a1 + 40);
}

BOOL WiFiDeviceClientIsInterfaceAWDL(uint64_t a1)
{
  return *(void *)(a1 + 40) == 6LL;
}

BOOL WiFiDeviceClientIsInterfaceHostAp(uint64_t a1)
{
  return *(void *)(a1 + 40) == 7LL;
}

BOOL WiFiDeviceClientGetPower(uint64_t a1)
{
  int v6 = 0;
  mach_port_t v2 = *(_DWORD *)(a1 + 16);
  BytePtr = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
  int Length = CFDataGetLength(*(CFDataRef *)(a1 + 48));
  wifi_device_get_power(v2, (uint64_t)BytePtr, Length, &v6);
  return v6 == 1;
}

uint64_t WiFiDeviceClientSetPower(uint64_t a1, int a2)
{
  int v8 = -3902;
  mach_port_t v4 = *(_DWORD *)(a1 + 16);
  BytePtr = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
  int Length = CFDataGetLength(*(CFDataRef *)(a1 + 48));
  wifi_device_set_power(v4, (uint64_t)BytePtr, Length, a2, &v8);
  if (v8) {
    return 4294963394LL;
  }
  else {
    return 0LL;
  }
}

uint64_t WiFiDeviceClientScanAsync(uint64_t a1, const void *a2, uint64_t a3, uint64_t a4)
{
  if (!a2) {
    return 4294963396LL;
  }
  unsigned int v20 = -1431655766;
  if (!WiFiManagerClientIsUserInteractive(*(void *)(a1 + 56)))
  {
    double v8 = vabdd_f64(CFAbsoluteTimeGetCurrent(), *(double *)&WiFiDeviceClientScanAsync_timeBetweenCalls);
    if (v8 < 0.02)
    {
      NSLog( @"%s called %0.2fs ago, rejecting, min time between successive calls is %0.2fs",  "WiFiDeviceClientScanAsync",  *(void *)&v8,  0x3F947AE147AE147BLL);
      return 4294963366LL;
    }

    WiFiDeviceClientScanAsync_timeBetweenCalls = CFAbsoluteTimeGetCurrent();
  }

  *(void *)(a1 + 160) = a3;
  *(void *)(a1 + 168) = a4;
  CFTypeRef BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x189604DB0], a2);
  if (BinaryData)
  {
    int v10 = BinaryData;
    BytePtr = CFDataGetBytePtr(BinaryData);
    int Length = CFDataGetLength(v10);
    mach_port_t v13 = *(_DWORD *)(a1 + 16);
    mach_port_t v14 = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
    int v15 = CFDataGetLength(*(CFDataRef *)(a1 + 48));
    wifi_device_scan_async(v13, (uint64_t)v14, v15, (uint64_t)BytePtr, Length, (int *)&v20);
    CFRelease(v10);
  }

  else
  {
    mach_port_t v17 = *(_DWORD *)(a1 + 16);
    unsigned int v18 = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
    int v19 = CFDataGetLength(*(CFDataRef *)(a1 + 48));
    wifi_device_scan_async(v17, (uint64_t)v18, v19, 0LL, 0, (int *)&v20);
  }

  return v20;
}

uint64_t WiFiDeviceClientScanCancel(uint64_t result)
{
  *(void *)(result + 160) = 0LL;
  *(void *)(result + 168) = 0LL;
  return result;
}

uint64_t WiFiDeviceClientAssociateAsync(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = 4294963394LL;
  int v16 = -3902;
  *(void *)(a1 + 176) = a3;
  *(void *)(a1 + 184) = a4;
  CFDictionaryRef v6 = WiFiNetworkCopyRecord(a2);
  if (v6)
  {
    CFDictionaryRef v7 = v6;
    CFTypeRef BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x189604DB0], v6);
    if (BinaryData)
    {
      unsigned int v9 = BinaryData;
      mach_port_t v10 = *(_DWORD *)(a1 + 16);
      BytePtr = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
      int Length = CFDataGetLength(*(CFDataRef *)(a1 + 48));
      mach_port_t v13 = CFDataGetBytePtr(v9);
      int v14 = CFDataGetLength(v9);
      wifi_device_assoc_async(v10, (uint64_t)BytePtr, Length, (uint64_t)v13, v14, &v16);
      CFRelease(v9);
    }

    CFRelease(v7);
    if (v16) {
      return 4294963394LL;
    }
    else {
      return 0LL;
    }
  }

  return v5;
}

uint64_t WiFiDeviceClientAssociateCancel(uint64_t result)
{
  *(void *)(result + 176) = 0LL;
  *(void *)(result + 184) = 0LL;
  return result;
}

uint64_t WiFiDeviceClientDisassociate(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 16);
  BytePtr = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
  int Length = CFDataGetLength(*(CFDataRef *)(a1 + 48));
  wifi_device_disassociate(v2, (uint64_t)BytePtr, Length);
  return 0LL;
}

uint64_t WiFiDeviceClientDisassociateWithReason(uint64_t a1, uint64_t a2, int a3)
{
  if (a1)
  {
    int v5 = *(_DWORD *)(a1 + 16);
    BytePtr = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
    int Length = CFDataGetLength(*(CFDataRef *)(a1 + 48));
    wifi_device_disassociate_with_reason(v5, (uint64_t)BytePtr, Length, a3);
  }

  else
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
  }

  return 0LL;
}

uint64_t WiFiDeviceClientStartNetwork(uint64_t a1, int a2, const void *a3, uint64_t a4, uint64_t a5)
{
  unsigned int v17 = 0;
  if (a3)
  {
    CFTypeRef BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x189604DB0], a3);
    if (!BinaryData)
    {
LABEL_7:
      uint64_t v10 = 22LL;
      unsigned int v17 = 22;
LABEL_13:
      NSLog(@"%s Start network failed %d", "WiFiDeviceClientStartNetwork", v10);
      return v17;
    }
  }

  else
  {
    CFTypeRef BinaryData = 0LL;
  }

  *(void *)(a1 + 192) = a4;
  *(void *)(a1 + 200) = a5;
  NSLog(@"%s Starting network", "WiFiDeviceClientStartNetwork");
  mach_port_t v11 = *(_DWORD *)(a1 + 16);
  BytePtr = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
  int Length = CFDataGetLength(*(CFDataRef *)(a1 + 48));
  if (BinaryData)
  {
    int v14 = CFDataGetBytePtr(BinaryData);
    int v15 = CFDataGetLength(BinaryData);
    wifi_device_start_network(v11, (uint64_t)BytePtr, Length, a2, (uint64_t)v14, v15, (int *)&v17);
    CFRelease(BinaryData);
  }

  else
  {
    wifi_device_start_network(v11, (uint64_t)BytePtr, Length, a2, 0LL, 0, (int *)&v17);
  }

  uint64_t v10 = v17;
  if (v17) {
    goto LABEL_13;
  }
  return 0LL;
}

uint64_t WiFiDeviceClientStopNetwork(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unsigned int v17 = 0;
  uint64_t result = 22LL;
  if (a2 && a3)
  {
    CFDictionaryRef v8 = WiFiNetworkCopyRecord(a2);
    if (v8)
    {
      CFDictionaryRef v9 = v8;
      CFTypeRef BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x189604DB0], v8);
      if (BinaryData)
      {
        mach_port_t v11 = BinaryData;
        *(void *)(a1 + 208) = a3;
        *(void *)(a1 + 216) = a4;
        mach_port_t v12 = *(_DWORD *)(a1 + 16);
        BytePtr = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
        int Length = CFDataGetLength(*(CFDataRef *)(a1 + 48));
        int v15 = CFDataGetBytePtr(v11);
        int v16 = CFDataGetLength(v11);
        wifi_device_stop_network(v12, (uint64_t)BytePtr, Length, (uint64_t)v15, v16, (int *)&v17);
        CFRelease(v11);
      }

      else
      {
        unsigned int v17 = 22;
      }

      CFRelease(v9);
      return v17;
    }

    else
    {
      return 22LL;
    }
  }

  return result;
}

uint64_t WiFiDeviceClientRegisterRangingReportCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 560) = a2;
  *(void *)(a1 + 568) = a3;
  *(void *)(a1 + 64) = *(void *)(a1 + 64) & 0xFFFFFFFFFEFFFFFFLL | ((unint64_t)(a2 != 0) << 24);
  return _WiFiDeviceClientSendEventMaskToServer(a1);
}

void WiFiDeviceClientRegisterVirtualInterfaceStateChangeCallback(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  a1[66] = a2;
  a1[67] = a3;
  uint64_t v4 = a1[8];
  if (a2)
  {
    a1[8] = v4 | 0x400000;
    _WiFiDeviceClientSendEventMaskToServer((uint64_t)a1);
    RunLoop = (__CFRunLoop *)_WiFiManagerClientGetRunLoop(a1[7]);
    RunLoopMode = (const void *)_WiFiManagerClientGetRunLoopMode(a1[7]);
    if (RunLoop) {
      BOOL v7 = RunLoopMode == 0LL;
    }
    else {
      BOOL v7 = 1;
    }
    if (!v7)
    {
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __WiFiDeviceClientRegisterVirtualInterfaceStateChangeCallback_block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0l;
      block[4] = a1;
      CFRunLoopPerformBlock(RunLoop, RunLoopMode, block);
      CFRunLoopWakeUp(RunLoop);
    }
  }

  else
  {
    a1[8] = v4 & 0xFFFFFFFFFFBFFFFFLL;
    _WiFiDeviceClientSendEventMaskToServer((uint64_t)a1);
  }

void __WiFiDeviceClientRegisterVirtualInterfaceStateChangeCallback_block_invoke(uint64_t a1)
{
  CFTypeRef cf = 0LL;
  int v2 = WiFiDeviceClientCopyInterfaceStateInfo(*(void *)(a1 + 32), &cf);
  CFTypeRef v3 = cf;
  if (cf) {
    BOOL v4 = v2 == 0;
  }
  else {
    BOOL v4 = 0;
  }
  if (v4)
  {
    _WiFiDeviceClientDispatchVirtInterfaceStateChangeEvent(*(void *)(a1 + 32), cf);
    goto LABEL_8;
  }

  if (cf) {
LABEL_8:
  }
    CFRelease(v3);
}

uint64_t WiFiDeviceClientCopyInterfaceStateInfo(uint64_t a1, void *a2)
{
  unsigned int v11 = 0;
  *(void *)&length[1] = 0LL;
  length[0] = 0;
  if (*a2)
  {
    int v9 = 22;
    goto LABEL_11;
  }

  mach_port_t v4 = *(_DWORD *)(a1 + 16);
  BytePtr = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
  unsigned int v6 = CFDataGetLength(*(CFDataRef *)(a1 + 48));
  wifi_device_copy_interface_state_info(v4, (uint64_t)BytePtr, v6, 0, &length[1], length, &v11);
  if (!v11)
  {
    if (*(void *)&length[1] && length[0])
    {
      CFPropertyListRef v7 = _WiFiCopyUnserialized(*(UInt8 **)&length[1], length[0]);
      if (v7)
      {
        *a2 = v7;
        goto LABEL_7;
      }

      int v9 = 94;
    }

    else
    {
      int v9 = 5;
    }

LABEL_11:
    unsigned int v11 = v9;
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

LABEL_7:
  _WiFiVMDealloc(*(uint64_t *)&length[1], length[0]);
  return v11;
}

void _WiFiDeviceClientDispatchVirtInterfaceStateChangeEvent(uint64_t a1, CFTypeRef cf)
{
  uint64_t v39 = *MEMORY[0x1895F89C0];
  CFTypeRef cfa = 0LL;
  if (!a1) {
    return;
  }
  if (!cf) {
    goto LABEL_24;
  }
  CFTypeID v4 = CFGetTypeID(cf);
  if (v4 != CFDictionaryGetTypeID())
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
      _WiFiDeviceClientDispatchVirtInterfaceStateChangeEvent_cold_2((uint64_t)cf, v25, v26, v27, v28, v29, v30, v31);
    }
    goto LABEL_24;
  }

  int v5 = (void *)CFRetain(cf);
  CFTypeRef cfa = v5;
  Value = CFDictionaryGetValue((CFDictionaryRef)v5, @"WiFiHostApStateIdentifier");
  if (Value && CFEqual(Value, (CFTypeRef)*MEMORY[0x189604DE8])) {
    goto LABEL_15;
  }
  CFPropertyListRef v7 = CFDictionaryGetValue((CFDictionaryRef)v5, @"LINK_CHANGED_IS_LINKDOWN");
  if (v7)
  {
    CFDictionaryRef v8 = v7;
    CFTypeID v9 = CFGetTypeID(v7);
    if (v9 != CFBooleanGetTypeID())
    {
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
      {
        _WiFiDeviceClientDispatchVirtInterfaceStateChangeEvent_cold_1(v8);
        if (!v5)
        {
LABEL_11:
          uint64_t v10 = WiFiDeviceClientCopyInterfaceStateInfo(a1, &cfa);
          int v5 = (void *)cfa;
          if (!cfa)
          {
            objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C](v10));
            return;
          }

          goto LABEL_12;
        }
      }

      else if (!v5)
      {
        goto LABEL_11;
      }

      CFRelease(v5);
      CFTypeRef cfa = 0LL;
      goto LABEL_11;
    }
  }

LABEL_12:
  unsigned int v11 = CFDictionaryGetValue((CFDictionaryRef)v5, @"LINK_CHANGED_NETWORK");
  if (v11)
  {
    mach_port_t v12 = WiFiNetworkCreate(*MEMORY[0x189604DB0], v11);
    if (v12)
    {
      mach_port_t v13 = v12;
      CFDictionaryReplaceValue((CFMutableDictionaryRef)v5, @"LINK_CHANGED_NETWORK", v12);
      CFRelease(v13);
    }

LABEL_15:
    int v14 = (const __CFArray *)CFDictionaryGetValue((CFDictionaryRef)v5, @"LINK_CHANGED_PEER_LIST");
    if (*(void *)(a1 + 528))
    {
      int v15 = v14;
      if (v14)
      {
        if (CFArrayGetCount(v14) >= 1)
        {
          CFIndex v16 = 0LL;
          unsigned int v17 = (os_log_s *)MEMORY[0x1895F8DA0];
          do
          {
            ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v15, v16);
            if (ValueAtIndex)
            {
              int v19 = (const __CFData *)CFDictionaryGetValue(ValueAtIndex, @"STATION_MAC");
              if (v19)
              {
                BytePtr = (const ether_addr *)CFDataGetBytePtr(v19);
                CFIndex v21 = ether_ntoa(BytePtr);
                if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
                {
                  CFIndex Count = CFArrayGetCount(v15);
                  *(_DWORD *)buf = 134218498;
                  CFIndex v34 = v16 + 1;
                  __int16 v35 = 2048;
                  CFIndex v36 = Count;
                  __int16 v37 = 2080;
                  uint64_t v38 = v21;
                  _os_log_impl(&dword_18658B000, v17, OS_LOG_TYPE_INFO, "Peer %ld of %ld: MAC:%s", buf, 0x20u);
                }
              }
            }

            ++v16;
          }

          while (v16 < CFArrayGetCount(v15));
        }
      }
    }
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

LABEL_24:
  CFPropertyListRef v23 = *(void (**)(uint64_t, CFTypeRef, void))(a1 + 528);
  CFTypeRef v24 = cfa;
  if (v23) {
    v23(a1, cfa, *(void *)(a1 + 536));
  }
  if (v24) {
    CFRelease(v24);
  }
}

    if (!v6) {
      return;
    }
    goto LABEL_25;
  }

  objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
  if (v6) {
LABEL_25:
  }
    CFRelease(v6);
}

      int v22 = (const __CFArray *)WiFiNetworkGetProperty(a2, @"NaiRealmName");
      if (v22)
      {
        CFPropertyListRef v23 = v22;
        CFTypeRef v24 = CFArrayGetCount(v22);
        if (!(_DWORD)v2 && v24 >= 1)
        {
          uint64_t v25 = 0LL;
          while (1)
          {
            int v2 = (uint64_t)CFArrayGetValueAtIndex(v23, v25);
            if (v2)
            {
              objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
              uint64_t v26 = (const __CFArray *)CFDictionaryGetValue(v5, @"ANQP_NAI_REALM_LIST");
              if (v26)
              {
                uint64_t v27 = v26;
                objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
                if (CFArrayGetCount(v27) >= 1)
                {
                  uint64_t v28 = 0LL;
                  while (1)
                  {
                    uint64_t v29 = (const __CFDictionary *)CFArrayGetValueAtIndex(v27, v28);
                    if (v29)
                    {
                      uint64_t v30 = CFDictionaryGetValue(v29, @"ANQP_NAI_REALM_NAME");
                      if (v30)
                      {
                        if (CFEqual(v30, (CFTypeRef)v2)) {
                          break;
                        }
                      }
                    }

                    if (++v28 >= CFArrayGetCount(v27)) {
                      goto LABEL_36;
                    }
                  }

                  objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
                  uint64_t v31 = 0;
                  int v2 = 1LL;
                  goto LABEL_38;
                }
              }

          int v19 = a1;
          unsigned int v20 = 0LL;
          goto LABEL_25;
        }
      }
    }

    else
    {
      SSID = WiFiNetworkGetSSID(a2);
      if (SSID)
      {
        mach_port_t v12 = SSID;
        mach_port_t v13 = (const __CFDictionary *)WiFiNetworkGetProperty(a1, @"userPreferredNetworkNames");
        int v14 = (const __CFAllocator *)*MEMORY[0x189604DB0];
        int v15 = v13
            ? CFDictionaryCreateMutableCopy(v14, 0LL, v13)
            : CFDictionaryCreateMutable(v14, 0LL, MEMORY[0x189605240], MEMORY[0x189605250]);
        CFIndex v16 = v15;
        if (v15)
        {
          if (a3) {
            CFDictionarySetValue(v15, v12, a3);
          }
          else {
            CFDictionaryRemoveValue(v15, v12);
          }
          CFIndex v21 = CFDictionaryGetCount(v16);
          unsigned int v18 = @"userPreferredNetworkNames";
          if (v21) {
            goto LABEL_16;
          }
          goto LABEL_24;
        }
      }
    }
  }

      mach_msg_destroy((mach_msg_header_t *)msg);
      return v9;
    }

    mig_dealloc_special_reply_port();
  }

  return v9;
}

      mach_msg_destroy((mach_msg_header_t *)msg);
      return v10;
    }

    mig_dealloc_special_reply_port();
  }

  return v10;
}

      mach_msg_destroy((mach_msg_header_t *)&v14);
      return v11;
    }

    mig_dealloc_special_reply_port();
  }

  return v11;
}

      mach_msg_destroy((mach_msg_header_t *)msg);
      return v9;
    }

    mig_dealloc_special_reply_port();
  }

  return v9;
}

      mach_msg_destroy((mach_msg_header_t *)msg);
      return v9;
    }

    mig_dealloc_special_reply_port();
  }

  return v9;
}

      mach_msg_destroy((mach_msg_header_t *)msg);
      return v9;
    }

    mig_dealloc_special_reply_port();
  }

  return v9;
}

      mach_msg_destroy((mach_msg_header_t *)msg);
      return v9;
    }

    mig_dealloc_special_reply_port();
  }

  return v9;
}

      mach_msg_destroy((mach_msg_header_t *)&v14);
      return v11;
    }

    mig_dealloc_special_reply_port();
  }

  return v11;
}

      mach_msg_destroy(&msg);
      return v14;
    }

    mig_dealloc_special_reply_port();
  }

  return v14;
}

      mach_msg_destroy((mach_msg_header_t *)&v14);
      return v11;
    }

    mig_dealloc_special_reply_port();
  }

  return v11;
}

      mach_msg_destroy((mach_msg_header_t *)msg);
      return v9;
    }

    mig_dealloc_special_reply_port();
  }

  return v9;
}

      mach_msg_destroy((mach_msg_header_t *)msg);
      return v9;
    }

    mig_dealloc_special_reply_port();
  }

  return v9;
}

      mach_msg_destroy((mach_msg_header_t *)&v14);
      return v11;
    }

    mig_dealloc_special_reply_port();
  }

  return v11;
}

      mach_msg_destroy(&msg);
      return v14;
    }

    mig_dealloc_special_reply_port();
  }

  return v14;
}

      mach_msg_destroy((mach_msg_header_t *)msg);
      return v9;
    }

    mig_dealloc_special_reply_port();
  }

  return v9;
}

      mach_msg_destroy((mach_msg_header_t *)msg);
      return v9;
    }

    mig_dealloc_special_reply_port();
  }

  return v9;
}

      mach_msg_destroy((mach_msg_header_t *)&v14);
      return v11;
    }

    mig_dealloc_special_reply_port();
  }

  return v11;
}

      mach_msg_destroy((mach_msg_header_t *)&v15);
      return v12;
    }

    mig_dealloc_special_reply_port();
  }

  return v12;
}

      mach_msg_destroy((mach_msg_header_t *)&v14);
      return v11;
    }

    mig_dealloc_special_reply_port();
  }

  return v11;
}

      mach_msg_destroy((mach_msg_header_t *)msg);
      return v9;
    }

    mig_dealloc_special_reply_port();
  }

  return v9;
}

      mach_msg_destroy((mach_msg_header_t *)msg);
      return v9;
    }

    mig_dealloc_special_reply_port();
  }

  return v9;
}

      mach_msg_destroy((mach_msg_header_t *)msg);
      return v9;
    }

    mig_dealloc_special_reply_port();
  }

  return v9;
}

      mach_msg_destroy((mach_msg_header_t *)msg);
      return v9;
    }

    mig_dealloc_special_reply_port();
  }

  return v9;
}

      mach_msg_destroy((mach_msg_header_t *)&v14);
      return v11;
    }

    mig_dealloc_special_reply_port();
  }

  return v11;
}

      mach_msg_destroy((mach_msg_header_t *)msg);
      return v9;
    }

    mig_dealloc_special_reply_port();
  }

  return v9;
}

      mach_msg_destroy((mach_msg_header_t *)msg);
      return v9;
    }

    mig_dealloc_special_reply_port();
  }

  return v9;
}

uint64_t WiFiDeviceClientRegisterRoamStatusEventCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 576) = a2;
  *(void *)(a1 + 584) = a3;
  *(void *)(a1 + 64) = *(void *)(a1 + 64) & 0xFFFFFFFFBFFFFFFFLL | ((unint64_t)(a2 != 0) << 30);
  return _WiFiDeviceClientSendEventMaskToServer(a1);
}

uint64_t WiFiDeviceClientCopyHostedNetworks(uint64_t a1, __CFArray **a2)
{
  unsigned int v13 = 0;
  *(void *)&length[1] = 0LL;
  length[0] = 0;
  if (*a2)
  {
    int v11 = 22;
LABEL_13:
    unsigned int v13 = v11;
    goto LABEL_9;
  }

  mach_port_t v4 = *(_DWORD *)(a1 + 16);
  BytePtr = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
  unsigned int v6 = CFDataGetLength(*(CFDataRef *)(a1 + 48));
  wifi_device_copy_networks(v4, (uint64_t)BytePtr, v6, 0, &length[1], length, &v13);
  if (v13) {
    goto LABEL_9;
  }
  if (!*(void *)&length[1] || !length[0])
  {
    int v11 = 5;
    goto LABEL_13;
  }

  CFPropertyListRef v7 = (const __CFArray *)_WiFiCopyUnserialized(*(UInt8 **)&length[1], length[0]);
  if (!v7)
  {
    int v11 = 94;
    goto LABEL_13;
  }

  CFDictionaryRef v8 = v7;
  NetworksFromRecords = _WiFiCreateNetworksFromRecords(v7);
  if (NetworksFromRecords) {
    *a2 = NetworksFromRecords;
  }
  else {
    unsigned int v13 = 5;
  }
  CFRelease(v8);
LABEL_9:
  _WiFiVMDealloc(*(uint64_t *)&length[1], length[0]);
  return v13;
}

uint64_t WiFiDeviceClientSetWiFiDirect(uint64_t a1, int a2)
{
  unsigned int v8 = 0;
  if (!a1) {
    WiFiDeviceClientSetWiFiDirect_cold_1();
  }
  mach_port_t v4 = *(_DWORD *)(a1 + 16);
  BytePtr = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
  int Length = CFDataGetLength(*(CFDataRef *)(a1 + 48));
  wifi_device_set_wifi_direct_state(v4, (uint64_t)BytePtr, Length, a2, (int *)&v8);
  return v8;
}

uint64_t _WiFiDeviceClientDispatchScanResults(uint64_t result, uint64_t a2, uint64_t a3)
{
  CFTypeRef v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, void))(result + 160);
  if (v3) {
    return v3(result, a2, a3, *(void *)(result + 168));
  }
  return result;
}

uint64_t _WiFiDeviceClientDispatchAssociationResult(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int v5 = (void *)(result + 176);
  mach_port_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, void))(result + 176);
  if (v4)
  {
    uint64_t result = v4(result, a2, a3, a4, *(void *)(result + 184));
    void *v5 = 0LL;
    v5[1] = 0LL;
  }

  return result;
}

uint64_t _WiFiDeviceClientDispatchStartNetworkResult(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  mach_port_t v4 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, void))(a1 + 192);
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
    {
      int v18 = 136315906;
      int v19 = "_WiFiDeviceClientDispatchStartNetworkResult";
      __int16 v20 = 1024;
      int v21 = a2;
      __int16 v22 = 2112;
      uint64_t v23 = a4;
      __int16 v24 = 2112;
      uint64_t v25 = a3;
      _os_log_impl( &dword_18658B000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_INFO,  "%s: dispatching callback (error=%d) with response %@ and network %@",  (uint8_t *)&v18,  0x26u);
      mach_port_t v4 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, void))(a1 + 192);
    }

    v4(a1, a2, a3, a4, *(void *)(a1 + 200));
    uint64_t result = 0LL;
    *(void *)(a1 + 192) = 0LL;
  }

  else
  {
    BOOL v10 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    if (v10) {
      _WiFiDeviceClientDispatchStartNetworkResult_cold_1(v10, v11, v12, v13, v14, v15, v16, v17);
    }
    return 2LL;
  }

  return result;
}

uint64_t _WiFiDeviceClientDispatchStopNetworkResult(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  CFTypeRef v3 = *(void (**)(uint64_t, uint64_t, uint64_t, void))(a1 + 208);
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
    {
      int v16 = 136315650;
      uint64_t v17 = "_WiFiDeviceClientDispatchStopNetworkResult";
      __int16 v18 = 1024;
      int v19 = a2;
      __int16 v20 = 2112;
      uint64_t v21 = a3;
      _os_log_impl( &dword_18658B000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_INFO,  "%s: dispatching callback (error=%d) with response %@",  (uint8_t *)&v16,  0x1Cu);
      CFTypeRef v3 = *(void (**)(uint64_t, uint64_t, uint64_t, void))(a1 + 208);
    }

    v3(a1, a2, a3, *(void *)(a1 + 216));
    uint64_t result = 0LL;
    *(void *)(a1 + 208) = 0LL;
  }

  else
  {
    BOOL v8 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    if (v8) {
      _WiFiDeviceClientDispatchStopNetworkResult_cold_1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
    return 2LL;
  }

  return result;
}

uint64_t _WiFiDeviceClientDispatchPowerEvent(uint64_t result)
{
  CFPropertyListRef v1 = *(uint64_t (**)(uint64_t, void))(result + 144);
  if (v1) {
    return v1(result, *(void *)(result + 152));
  }
  return result;
}

uint64_t _WiFiDeviceClientDispatchBssidEvent(uint64_t result, uint64_t a2)
{
  int v2 = *(uint64_t (**)(uint64_t, uint64_t, void))(result + 272);
  if (v2) {
    return v2(result, a2, *(void *)(result + 280));
  }
  return result;
}

void _WiFiDeviceClientDispatchScanCacheUpdateEvent(void *a1, CFDictionaryRef theDict)
{
  if (theDict)
  {
    Value = CFDictionaryGetValue(theDict, @"scanRequest");
    if (Value
      && (v5 = Value, CFTypeID v6 = CFGetTypeID(Value), v6 == CFDictionaryGetTypeID())
      && (CFPropertyListRef v7 = (const __CFArray *)CFDictionaryGetValue(theDict, @"scanResults")) != 0LL
      && (v8 = v7, CFTypeID v9 = CFGetTypeID(v7), v9 == CFArrayGetTypeID()))
    {
      NetworksFromRecords = _WiFiCreateNetworksFromRecords(v8);
      uint64_t v11 = (void (*)(void *, __CFArray *, void, void))a1[28];
      if (v11) {
        v11(a1, NetworksFromRecords, 0LL, a1[29]);
      }
      uint64_t v12 = (void (*)(void *, const void *, __CFArray *, void, void))a1[30];
      if (v12) {
        v12(a1, v5, NetworksFromRecords, 0LL, a1[31]);
      }
      if (NetworksFromRecords) {
        CFRelease(NetworksFromRecords);
      }
    }

    else
    {
      objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
    }
  }

void _WiFiDeviceClientDispatchScanUpdateEvent(uint64_t a1, CFDictionaryRef theDict)
{
  if (theDict)
  {
    Value = CFDictionaryGetValue(theDict, @"scanRequest");
    if (Value
      && (v5 = Value, CFTypeID v6 = CFGetTypeID(Value), v6 == CFDictionaryGetTypeID())
      && (CFPropertyListRef v7 = (const __CFArray *)CFDictionaryGetValue(theDict, @"scanResults")) != 0LL
      && (v8 = v7, CFTypeID v9 = CFGetTypeID(v7), v9 == CFArrayGetTypeID()))
    {
      NetworksFromRecords = _WiFiCreateNetworksFromRecords(v8);
      uint64_t v11 = *(void (**)(uint64_t, const void *, __CFArray *, void, void))(a1 + 256);
      if (v11) {
        v11(a1, v5, NetworksFromRecords, 0LL, *(void *)(a1 + 264));
      }
      if (NetworksFromRecords) {
        CFRelease(NetworksFromRecords);
      }
    }

    else
    {
      objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
    }
  }

uint64_t _WiFiDeviceClientDispatchLinkEvent(uint64_t result, CFDictionaryRef theDict)
{
  uint64_t v3 = result;
  mach_port_t v4 = *(uint64_t (**)(uint64_t, void))(result + 96);
  if (v4) {
    uint64_t result = v4(result, *(void *)(result + 104));
  }
  if (*(void *)(v3 + 432))
  {
    Value = CFDictionaryGetValue(theDict, @"LINK_CHANGED_NETWORK");
    if (Value)
    {
      CFTypeID v6 = WiFiNetworkCreate(*MEMORY[0x189604DB0], Value);
      if (v6)
      {
        CFPropertyListRef v7 = v6;
        CFDictionaryReplaceValue(theDict, @"LINK_CHANGED_NETWORK", v6);
        CFRelease(v7);
      }
    }

    return (*(uint64_t (**)(uint64_t, CFDictionaryRef, void))(v3 + 432))(v3, theDict, *(void *)(v3 + 440));
  }

  return result;
}

void _WiFiDeviceClientDispatchAutoJoinNotification(uint64_t a1, CFDictionaryRef theDict)
{
  if (theDict)
  {
    Value = CFDictionaryGetValue(theDict, @"autoJoinNetwork");
    if (Value)
    {
      int v5 = WiFiNetworkCreate(*MEMORY[0x189604DB0], Value);
      CFDictionaryReplaceValue(theDict, @"autoJoinNetwork", v5);
      if (v5) {
        CFRelease(v5);
      }
    }

    CFTypeID v6 = *(void (**)(uint64_t, CFDictionaryRef, void))(a1 + 448);
    if (v6) {
      v6(a1, theDict, *(void *)(a1 + 456));
    }
  }

  else
  {
    BOOL v7 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    if (v7) {
      _WiFiDeviceClientDispatchAutoJoinNotification_cold_1(v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }

void _WiFiDeviceClientDispatchUserJoinNotification(uint64_t a1, CFDictionaryRef theDict)
{
  if (theDict)
  {
    Value = CFDictionaryGetValue(theDict, @"userJoinNetwork");
    if (Value)
    {
      int v5 = WiFiNetworkCreate(*MEMORY[0x189604DB0], Value);
      CFDictionaryReplaceValue(theDict, @"userJoinNetwork", v5);
      if (v5) {
        CFRelease(v5);
      }
    }

    CFTypeID v6 = CFDictionaryGetValue(theDict, @"userJoinStatus");
    if (v6)
    {
      BOOL v7 = v6;
      BOOL v8 = CFEqual(v6, @"userJoinStarted")
        || CFEqual(v7, @"userJoinScanning")
        || CFEqual(v7, @"userJoinAssociating")
        || CFEqual(v7, @"userJoinWaiting") != 0;
    }

    else
    {
      BOOL v8 = 0LL;
    }

    uint64_t v9 = *(void (**)(uint64_t, BOOL, CFDictionaryRef, void))(a1 + 464);
    if (v9) {
      v9(a1, v8, theDict, *(void *)(a1 + 472));
    }
  }

  else
  {
    BOOL v10 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    if (v10) {
      _WiFiDeviceClientDispatchUserJoinNotification_cold_1(v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }

uint64_t _WiFiDeviceClientDispatchResumeScanEvent(uint64_t result)
{
  CFPropertyListRef v1 = *(uint64_t (**)(uint64_t, void))(result + 128);
  if (v1) {
    return v1(result, *(void *)(result + 136));
  }
  return result;
}

uint64_t _WiFiDeviceClientDispatchBgScanSuspendResumeEvent(uint64_t result, uint64_t a2)
{
  int v2 = *(uint64_t (**)(uint64_t, uint64_t, void))(result + 288);
  if (v2) {
    return v2(result, a2, *(void *)(result + 296));
  }
  return result;
}

uint64_t _WiFiDeviceClientDispatchLQMEvent(uint64_t result, uint64_t a2)
{
  int v2 = *(uint64_t (**)(uint64_t, uint64_t, void))(result + 304);
  if (v2) {
    return v2(result, a2, *(void *)(result + 312));
  }
  return result;
}

uint64_t _WiFiDeviceClientDispatchWeightAvgLQMEvent(uint64_t result, uint64_t a2)
{
  int v2 = *(uint64_t (**)(uint64_t, uint64_t, void))(result + 320);
  if (v2) {
    return v2(result, a2, *(void *)(result + 328));
  }
  return result;
}

uint64_t _WiFiDeviceClientDispatchBTCoexStatsEvent(uint64_t result, uint64_t a2)
{
  int v2 = *(uint64_t (**)(uint64_t, uint64_t, void))(result + 336);
  if (v2) {
    return v2(result, a2, *(void *)(result + 344));
  }
  return result;
}

uint64_t _WiFiDeviceClientDispatchBSPEvent(uint64_t result, uint64_t a2)
{
  int v2 = *(uint64_t (**)(uint64_t, uint64_t, void))(result + 608);
  if (v2) {
    return v2(result, a2, *(void *)(result + 616));
  }
  return result;
}

uint64_t _WiFiDeviceClientDispatchUCMEvent(uint64_t result, uint64_t a2)
{
  int v2 = *(uint64_t (**)(uint64_t, uint64_t, void))(result + 624);
  if (v2) {
    return v2(result, a2, *(void *)(result + 632));
  }
  return result;
}

void _WiFiDeviceClientDispatchBTScanIntervalRelaxEvent(uint64_t a1, uint64_t a2)
{
  int v2 = *(void (**)(uint64_t, uint64_t, void))(a1 + 352);
  if (v2) {
    v2(a1, a2, *(void *)(a1 + 360));
  }
  else {
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
  }
}

void _WiFiDeviceClientDispatch24GHzNetworkInCriticalStateEvent(uint64_t a1, uint64_t a2)
{
  int v2 = *(void (**)(uint64_t, uint64_t, void))(a1 + 368);
  if (v2) {
    v2(a1, a2, *(void *)(a1 + 376));
  }
  else {
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
  }
}

void _WiFiDeviceClientDispatchM1M4Handshake24GHzCountEvent(uint64_t a1, uint64_t a2)
{
  int v2 = *(void (**)(uint64_t, uint64_t, void))(a1 + 384);
  if (v2) {
    v2(a1, a2, *(void *)(a1 + 392));
  }
  else {
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
  }
}

void _WiFiDeviceClientDispatchCarPlayNetworkTypeChangeEvent(uint64_t a1, uint64_t a2)
{
  int v2 = *(void (**)(uint64_t, uint64_t, void))(a1 + 400);
  if (v2) {
    v2(a1, a2, *(void *)(a1 + 408));
  }
  else {
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
  }
}

uint64_t _WiFiDeviceClientDispatchDiagnosticsStartEvent(uint64_t result, uint64_t a2)
{
  int v2 = *(uint64_t (**)(uint64_t, uint64_t, void))(result + 416);
  if (v2) {
    return v2(result, a2, *(void *)(result + 424));
  }
  return result;
}

uint64_t _WiFiDeviceClientDispatchHostApStateChangedEvent(uint64_t result, uint64_t a2)
{
  int v2 = *(uint64_t (**)(uint64_t, uint64_t, void))(result + 480);
  if (v2) {
    return v2(result, a2, *(void *)(result + 488));
  }
  return result;
}

uint64_t _WiFiDeviceClientDispatchGasResults(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, void))(result + 496);
  if (v3) {
    return v3(result, a2, a3, *(void *)(result + 504));
  }
  return result;
}

uint64_t _WiFiDeviceClientDispatchRangingResult(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, void))(result + 544);
  if (v3) {
    return v3(result, a2, a3, *(void *)(result + 552));
  }
  return result;
}

uint64_t _WiFiDeviceClientDispatchRangingReportEvent(uint64_t result, uint64_t a2)
{
  if (result)
  {
    int v2 = *(uint64_t (**)(uint64_t, uint64_t, void))(result + 560);
    if (v2) {
      return v2(result, a2, *(void *)(result + 568));
    }
  }

  return result;
}

uint64_t _WiFiDeviceClientDispatchDeviceAvailableEvent(uint64_t result, uint64_t a2)
{
  int v2 = *(uint64_t (**)(uint64_t, uint64_t, void))(result + 512);
  if (v2) {
    return v2(result, a2, *(void *)(result + 520));
  }
  return result;
}

uint64_t _WiFiDeviceClientDispatchRoamStatusEvent(uint64_t result, uint64_t a2)
{
  if (result)
  {
    int v2 = *(uint64_t (**)(uint64_t, uint64_t, void))(result + 576);
    if (v2) {
      return v2(result, a2, *(void *)(result + 584));
    }
  }

  return result;
}

uint64_t WiFiDeviceClientGasStartAsync( uint64_t a1, const __CFArray *a2, const void *a3, uint64_t a4, uint64_t a5)
{
  uint64_t result = 4294963396LL;
  if (a2 && a3)
  {
    *(void *)(a1 + 496) = a4;
    *(void *)(a1 + 504) = a5;
    BOOL v8 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    CFTypeRef BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x189604DB0], a3);
    BOOL v10 = BinaryData;
    if (BinaryData)
    {
      BytePtr = CFDataGetBytePtr(BinaryData);
      int Length = CFDataGetLength(v10);
    }

    else
    {
      BytePtr = 0LL;
      int Length = 0;
    }

    RecordsFromNetworks = _WiFiCreateRecordsFromNetworks(a2);
    if (RecordsFromNetworks)
    {
      uint64_t v14 = (const __CFData *)_CFPropertyListCreateBinaryData(v8, RecordsFromNetworks);
      uint64_t v15 = v14;
      if (v14)
      {
        uint64_t v16 = CFDataGetBytePtr(v14);
        int v17 = CFDataGetLength(v15);
      }

      else
      {
        uint64_t v16 = 0LL;
        int v17 = 0;
      }
    }

    else
    {
      uint64_t v16 = 0LL;
      int v17 = 0;
      uint64_t v15 = 0LL;
    }

    unsigned int v21 = -1431655766;
    mach_port_t v18 = *(_DWORD *)(a1 + 16);
    int v19 = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
    int v20 = CFDataGetLength(*(CFDataRef *)(a1 + 48));
    wifi_device_gas_start_async(v18, (uint64_t)v19, v20, (uint64_t)v16, v17, (uint64_t)BytePtr, Length, (int *)&v21);
    if (RecordsFromNetworks) {
      CFRelease(RecordsFromNetworks);
    }
    if (v15) {
      CFRelease(v15);
    }
    if (v10) {
      CFRelease(v10);
    }
    return v21;
  }

  return result;
}

uint64_t WiFiDeviceClientSetRangeable(uint64_t a1, int a2, const void *a3)
{
  if (a3)
  {
    CFTypeRef BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x189604DB0], a3);
    CFTypeID v6 = BinaryData;
    if (BinaryData)
    {
      BytePtr = CFDataGetBytePtr(BinaryData);
      int Length = CFDataGetLength(v6);
      goto LABEL_6;
    }
  }

  else
  {
    CFTypeID v6 = 0LL;
  }

  BytePtr = 0LL;
  int Length = 0;
LABEL_6:
  int v13 = -1431655766;
  mach_port_t v9 = *(_DWORD *)(a1 + 16);
  BOOL v10 = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
  int v11 = CFDataGetLength(*(CFDataRef *)(a1 + 48));
  wifi_device_set_rangeable(v9, (uint64_t)v10, v11, a2, (uint64_t)BytePtr, Length, &v13);
  if (v6) {
    CFRelease(v6);
  }
  if (v13) {
    return 4294963394LL;
  }
  else {
    return 0LL;
  }
}

uint64_t WiFiDeviceClientSetRangingIdentifier(uint64_t a1, const void *a2)
{
  if (a2)
  {
    CFTypeRef BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x189604DB0], a2);
    mach_port_t v4 = BinaryData;
    if (BinaryData)
    {
      BytePtr = CFDataGetBytePtr(BinaryData);
      int Length = CFDataGetLength(v4);
    }

    else
    {
      BytePtr = 0LL;
      int Length = 0;
    }

    int v7 = 1;
  }

  else
  {
    BytePtr = 0LL;
    int Length = 0;
    mach_port_t v4 = 0LL;
    int v7 = 0;
  }

  int v12 = -1431655766;
  mach_port_t v8 = *(_DWORD *)(a1 + 16);
  mach_port_t v9 = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
  int v10 = CFDataGetLength(*(CFDataRef *)(a1 + 48));
  wifi_device_set_ranging_identifier(v8, (uint64_t)v9, v10, v7, (uint64_t)BytePtr, Length, &v12);
  if (v4) {
    CFRelease(v4);
  }
  if (v12) {
    return 4294963394LL;
  }
  else {
    return 0LL;
  }
}

uint64_t WiFiDeviceClientRangingStartAsync(uint64_t a1, const void *a2, uint64_t a3, uint64_t a4, double a5)
{
  if (!a2) {
    return 4294963396LL;
  }
  *(void *)(a1 + 544) = a3;
  *(void *)(a1 + 552) = a4;
  CFTypeRef BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x189604DB0], a2);
  mach_port_t v8 = BinaryData;
  if (BinaryData)
  {
    BytePtr = CFDataGetBytePtr(BinaryData);
    int Length = CFDataGetLength(v8);
  }

  else
  {
    BytePtr = 0LL;
    int Length = 0;
  }

  unsigned int v15 = -1431655766;
  mach_port_t v12 = *(_DWORD *)(a1 + 16);
  int v13 = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
  int v14 = CFDataGetLength(*(CFDataRef *)(a1 + 48));
  wifi_device_ranging_start_async(v12, (uint64_t)v13, v14, (uint64_t)BytePtr, Length, (int)a5, (int *)&v15);
  if (v8) {
    CFRelease(v8);
  }
  return v15;
}

uint64_t WiFiDeviceClientDebugCommand(uint64_t a1, const void *a2, CFPropertyListRef *a3)
{
  unsigned int v13 = -1431655766;
  memset(length, 0, sizeof(length));
  if (a2)
  {
    CFTypeRef BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x189604DB0], a2);
    CFTypeID v6 = BinaryData;
    if (BinaryData)
    {
      BytePtr = CFDataGetBytePtr(BinaryData);
      int v8 = CFDataGetLength(v6);
    }

    else
    {
      BytePtr = 0LL;
      int v8 = 0;
    }

    mach_port_t v9 = *(_DWORD *)(a1 + 16);
    int v10 = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
    int v11 = CFDataGetLength(*(CFDataRef *)(a1 + 48));
    wifi_device_debug_command(v9, (uint64_t)v10, v11, (uint64_t)BytePtr, v8, &length[1], length, &v13);
    if (a3) {
      *a3 = _WiFiCopyUnserialized(*(UInt8 **)&length[1], length[0]);
    }
    if (v6) {
      CFRelease(v6);
    }
  }

  else
  {
    unsigned int v13 = -3900;
  }

  _WiFiVMDealloc(*(uint64_t *)&length[1], length[0]);
  return v13;
}

CFPropertyListRef WiFiDeviceClientCopyRoamStats(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 16);
  BytePtr = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
  int v4 = CFDataGetLength(*(CFDataRef *)(a1 + 48));
  wifi_device_copy_roam_stats(v2, (uint64_t)BytePtr, v4, &length[1], length);
  CFPropertyListRef v5 = _WiFiCopyUnserialized(*(UInt8 **)&length[1], length[0]);
  _WiFiVMDealloc(*(uint64_t *)&length[1], length[0]);
  return v5;
}

uint64_t WiFiDeviceClientSetTrgDiscParams(uint64_t a1, const void *a2)
{
  if (!a2) {
    return 4294963396LL;
  }
  unsigned int v14 = -1431655766;
  CFTypeRef BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x189604DB0], a2);
  if (BinaryData)
  {
    int v4 = BinaryData;
    BytePtr = CFDataGetBytePtr(BinaryData);
    int Length = CFDataGetLength(v4);
    mach_port_t v7 = *(_DWORD *)(a1 + 16);
    int v8 = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
    int v9 = CFDataGetLength(*(CFDataRef *)(a1 + 48));
    wifi_device_set_trgdisc_params(v7, (uint64_t)v8, v9, (uint64_t)BytePtr, Length, (int *)&v14);
    CFRelease(v4);
  }

  else
  {
    mach_port_t v11 = *(_DWORD *)(a1 + 16);
    mach_port_t v12 = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
    int v13 = CFDataGetLength(*(CFDataRef *)(a1 + 48));
    wifi_device_set_trgdisc_params(v11, (uint64_t)v12, v13, 0LL, 0, (int *)&v14);
  }

  return v14;
}

uint64_t WiFiDeviceClientTrafficRegistration(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    return 4294963396LL;
  }
  char v8 = 0;
  id v7 = 0LL;
  uint64_t v3 = [objc_alloc(MEMORY[0x189612C40]) initWithDictionary:a2 isActive:&v8];
  if (!v3) {
    return 4294963396LL;
  }
  int v4 = (void *)v3;
  id v5 = *(id *)(a1 + 72);
  if (!v5)
  {
    id v5 = objc_alloc_init(MEMORY[0x189612C38]);
    *(void *)(a1 + 72) = v5;
  }

  if (v8) {
    [v5 setTrafficRegistration:v4 error:&v7];
  }
  else {
    [v5 clearTrafficRegistration:v4 error:&v7];
  }

  uint64_t result = (uint64_t)v7;
  if (v7) {
    return [v7 code];
  }
  return result;
}

CFPropertyListRef WiFiDeviceClientSendWoWBlacklistCommandAndCopyResponse( uint64_t a1, const void *a2, _DWORD *a3)
{
  if (a2)
  {
    CFTypeRef BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x189604DB0], a2);
    id v7 = BinaryData;
    if (BinaryData)
    {
      BytePtr = CFDataGetBytePtr(BinaryData);
      int v9 = CFDataGetLength(v7);
    }

    else
    {
      BytePtr = 0LL;
      int v9 = 0;
    }

    mach_port_t v10 = *(_DWORD *)(a1 + 16);
    mach_port_t v11 = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
    int v12 = CFDataGetLength(*(CFDataRef *)(a1 + 48));
    wifi_device_wowblacklist_command(v10, (uint64_t)v11, v12, (uint64_t)BytePtr, v9, &length[1], length, a3);
    CFPropertyListRef v13 = 0LL;
    if (*(void *)&length[1] && length[0]) {
      CFPropertyListRef v13 = _WiFiCopyUnserialized(*(UInt8 **)&length[1], length[0]);
    }
    if (v7) {
      CFRelease(v7);
    }
  }

  else
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
    CFPropertyListRef v13 = 0LL;
  }

  _WiFiVMDealloc(*(uint64_t *)&length[1], length[0]);
  return v13;
}

uint64_t WiFiDeviceClientNotifySoftError(uint64_t a1, const void *a2)
{
  int v14 = -3900;
  if (a2)
  {
    CFTypeRef BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x189604DB0], a2);
    if (BinaryData)
    {
      int v4 = BinaryData;
      BytePtr = CFDataGetBytePtr(BinaryData);
      int Length = CFDataGetLength(v4);
      mach_port_t v7 = *(_DWORD *)(a1 + 16);
      char v8 = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
      int v9 = CFDataGetLength(*(CFDataRef *)(a1 + 48));
      wifi_device_soft_error_notification(v7, (uint64_t)v8, v9, (uint64_t)BytePtr, Length, &v14);
      CFRelease(v4);
    }

    else
    {
      mach_port_t v10 = *(_DWORD *)(a1 + 16);
      mach_port_t v11 = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
      int v12 = CFDataGetLength(*(CFDataRef *)(a1 + 48));
      wifi_device_soft_error_notification(v10, (uint64_t)v11, v12, 0LL, 0, &v14);
    }
  }

  else
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
  }

  if (v14) {
    return 4294963394LL;
  }
  else {
    return 0LL;
  }
}

CFDictionaryRef WiFiDeviceClientAutoJoinBlacklistCommand(uint64_t a1, const void *a2, _DWORD *a3)
{
  length[0] = 0;
  objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
  CFTypeRef BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x189604DB0], a2);
  mach_port_t v7 = BinaryData;
  if (BinaryData)
  {
    BytePtr = CFDataGetBytePtr(BinaryData);
    int v9 = CFDataGetLength(v7);
  }

  else
  {
    BytePtr = 0LL;
    int v9 = 0;
  }

  *(void *)&length[1] = 0xAAAAAAAAAAAAAAAALL;
  mach_port_t v10 = *(_DWORD *)(a1 + 16);
  mach_port_t v11 = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
  int v12 = CFDataGetLength(*(CFDataRef *)(a1 + 48));
  wifi_device_autojoinblacklist_command(v10, (uint64_t)v11, v12, (uint64_t)BytePtr, v9, &length[1], length);
  CFPropertyListRef v13 = 0LL;
  if (*(void *)&length[1] && length[0])
  {
    CFPropertyListRef v13 = (const __CFDictionary *)_WiFiCopyUnserialized(*(UInt8 **)&length[1], length[0]);
    Value = (const __CFArray *)CFDictionaryGetValue(v13, @"networks");
    NetworksFromRecords = _WiFiCreateNetworksFromRecords(Value);
    if (NetworksFromRecords)
    {
      uint64_t v16 = NetworksFromRecords;
      CFDictionarySetValue(v13, @"networks", NetworksFromRecords);
      CFRelease(v16);
    }

    else
    {
      objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
    }
  }

  *a3 = 0;
  if (v7) {
    CFRelease(v7);
  }
  _WiFiVMDealloc(*(uint64_t *)&length[1], length[0]);
  return v13;
}

uint64_t WiFiDeviceClientDestroyEAPTrustExceptionsForCurrentNetwork(uint64_t a1, int *a2)
{
  if (a1)
  {
    mach_port_t v4 = *(_DWORD *)(a1 + 16);
    BytePtr = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
    int Length = CFDataGetLength(*(CFDataRef *)(a1 + 48));
    wifi_device_destroy_eap_trust_current_network(v4, (uint64_t)BytePtr, Length, a2);
  }

  else
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
  }

  if (a2) {
    return 4294963394LL;
  }
  else {
    return 0LL;
  }
}

uint64_t WiFiDeviceClientGetLQMEventInterval(uint64_t a1)
{
  unsigned int v6 = 0;
  mach_port_t v2 = *(_DWORD *)(a1 + 16);
  BytePtr = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
  int Length = CFDataGetLength(*(CFDataRef *)(a1 + 48));
  wifi_device_get_event_interval(v2, (uint64_t)BytePtr, Length, 14, (int *)&v6);
  return v6;
}

uint64_t WiFiDeviceClientSetLQMEventInterval(uint64_t a1, int a2)
{
  int v8 = -3902;
  mach_port_t v4 = *(_DWORD *)(a1 + 16);
  BytePtr = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
  int Length = CFDataGetLength(*(CFDataRef *)(a1 + 48));
  wifi_device_set_event_interval(v4, (uint64_t)BytePtr, Length, 14LL, a2, &v8);
  if (v8) {
    return 4294963394LL;
  }
  else {
    return 0LL;
  }
}

CFPropertyListRef WiFiDeviceClientCopyNetworkRecommendations(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 16);
  BytePtr = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
  int v4 = CFDataGetLength(*(CFDataRef *)(a1 + 48));
  wifi_device_copy_network_recommendations(v2, (uint64_t)BytePtr, v4, &length[1], length);
  CFPropertyListRef v5 = _WiFiCopyUnserialized(*(UInt8 **)&length[1], length[0]);
  _WiFiVMDealloc(*(uint64_t *)&length[1], length[0]);
  return v5;
}

void WiFiDeviceClientResetAvailabilityEngine(uint64_t a1)
{
  if (a1)
  {
    int v2 = *(_DWORD *)(a1 + 16);
    BytePtr = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
    int Length = CFDataGetLength(*(CFDataRef *)(a1 + 48));
    wifi_device_reset_availability_engine(v2, (uint64_t)BytePtr, Length);
  }

  else
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
  }

CFDictionaryRef WiFiDeviceClientBssBlacklistCommandAndCopyResponse( uint64_t a1, const void *a2, _DWORD *a3)
{
  length[0] = 0;
  CFTypeRef BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x189604DB0], a2);
  unsigned int v6 = BinaryData;
  if (BinaryData)
  {
    BytePtr = CFDataGetBytePtr(BinaryData);
    int v8 = CFDataGetLength(v6);
  }

  else
  {
    BytePtr = 0LL;
    int v8 = 0;
  }

  *(void *)&length[1] = 0xAAAAAAAAAAAAAAAALL;
  mach_port_t v9 = *(_DWORD *)(a1 + 16);
  mach_port_t v10 = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
  int v11 = CFDataGetLength(*(CFDataRef *)(a1 + 48));
  wifi_device_bssblacklist_command(v9, (uint64_t)v10, v11, (uint64_t)BytePtr, v8, &length[1], length);
  int v12 = 0LL;
  if (*(void *)&length[1] && length[0])
  {
    int v12 = (const __CFDictionary *)_WiFiCopyUnserialized(*(UInt8 **)&length[1], length[0]);
    Value = (const __CFArray *)CFDictionaryGetValue(v12, @"networks");
    NetworksFromRecords = _WiFiCreateNetworksFromRecords(Value);
    if (NetworksFromRecords)
    {
      unsigned int v15 = NetworksFromRecords;
      CFDictionarySetValue(v12, @"networks", NetworksFromRecords);
      CFRelease(v15);
    }

    else
    {
      objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
    }
  }

  *a3 = 0;
  if (v6) {
    CFRelease(v6);
  }
  _WiFiVMDealloc(*(uint64_t *)&length[1], length[0]);
  return v12;
}

uint64_t WiFiDeviceClientCopyAirplayStatistics()
{
  return 0LL;
}

CFPropertyListRef WiFiDeviceClientCopyMimoStatus(CFNumberRef a1)
{
  CFPropertyListRef v1 = a1;
  int v13 = 375;
  memset(length, 0, sizeof(length));
  if (a1)
  {
    int v2 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    a1 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x189604DB0], kCFNumberIntType, &v13);
    if (a1)
    {
      CFNumberRef v3 = a1;
      CFTypeRef BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData(v2, a1);
      CFPropertyListRef v5 = BinaryData;
      if (BinaryData)
      {
        BytePtr = CFDataGetBytePtr(BinaryData);
        int v7 = CFDataGetLength(v5);
      }

      else
      {
        BytePtr = 0LL;
        int v7 = 0;
      }

      mach_port_t v8 = *((_DWORD *)v1 + 4);
      mach_port_t v9 = CFDataGetBytePtr(*((CFDataRef *)v1 + 6));
      int v10 = CFDataGetLength(*((CFDataRef *)v1 + 6));
      wifi_device_copy_property(v8, (uint64_t)v9, v10, (uint64_t)BytePtr, v7, &length[1], length);
      CFPropertyListRef v1 = 0LL;
      if (*(void *)&length[1] && length[0]) {
        CFPropertyListRef v1 = _WiFiCopyUnserialized(*(UInt8 **)&length[1], length[0]);
      }
      if (v5) {
        CFRelease(v5);
      }
      CFRelease(v3);
      a1 = *(CFNumberRef *)&length[1];
      uint64_t v11 = length[0];
    }

    else
    {
      uint64_t v11 = 0LL;
      CFPropertyListRef v1 = 0LL;
    }
  }

  else
  {
    uint64_t v11 = 0LL;
  }

  _WiFiVMDealloc((uint64_t)a1, v11);
  return v1;
}

BOOL WiFiDeviceClientGetAppState(BOOL result)
{
  int v5 = 0;
  if (result)
  {
    uint64_t v1 = result;
    mach_port_t v2 = *(_DWORD *)(result + 16);
    BytePtr = CFDataGetBytePtr(*(CFDataRef *)(result + 48));
    int Length = CFDataGetLength(*(CFDataRef *)(v1 + 48));
    wifi_device_get_app_state(v2, (uint64_t)BytePtr, Length, &v5);
    return v5 != 0;
  }

  return result;
}

uint64_t WiFiDeviceClientRegisterP2pThreadCoexCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 592) = a2;
  *(void *)(a1 + 600) = a3;
  *(void *)(a1 + 64) = *(void *)(a1 + 64) & 0xFFFFFDFFFFFFFFFFLL | ((unint64_t)(a2 != 0) << 41);
  return _WiFiDeviceClientSendEventMaskToServer(a1);
}

void _WiFiDeviceClientDispatchP2pThreadCoexEvent(uint64_t a1, uint64_t a2)
{
  mach_port_t v2 = *(void (**)(uint64_t, uint64_t, void))(a1 + 592);
  if (v2) {
    v2(a1, a2, *(void *)(a1 + 600));
  }
  else {
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
  }
}

void WiFiDeviceClientInsertMissingNetworkService(uint64_t a1)
{
  if (a1)
  {
    int v2 = *(_DWORD *)(a1 + 16);
    BytePtr = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
    int Length = CFDataGetLength(*(CFDataRef *)(a1 + 48));
    wifi_device_insert_missing_network_service(v2, (uint64_t)BytePtr, Length);
  }

  else
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
  }

void WiFiDeviceClientSet6GDisablementParams(uint64_t a1, uint64_t a2)
{
  CFDictionaryRef v3 = WiFiNetworkCopyRecord(a2);
  if (v3)
  {
    CFDictionaryRef v4 = v3;
    CFTypeRef BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x189604DB0], v3);
    if (BinaryData)
    {
      unsigned int v6 = BinaryData;
      int v7 = *(_DWORD *)(a1 + 16);
      BytePtr = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
      int Length = CFDataGetLength(*(CFDataRef *)(a1 + 48));
      int v10 = CFDataGetBytePtr(v6);
      int v11 = CFDataGetLength(v6);
      wifi_device_update_network_property(v7, (uint64_t)BytePtr, Length, (uint64_t)v10, v11);
      CFRelease(v6);
    }

    CFRelease(v4);
  }

void _WiFiDeviceClientDispatchTdConfirmedEvent(uint64_t a1, uint64_t a2)
{
  int v2 = *(void (**)(uint64_t, uint64_t, void))(a1 + 640);
  if (v2) {
    v2(a1, a2, *(void *)(a1 + 648));
  }
  else {
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
  }
}

void __WiFiDeviceClientRelease(void *a1)
{
  int v2 = (const void *)a1[3];
  if (v2)
  {
    CFRelease(v2);
    a1[3] = 0LL;
  }

  CFDictionaryRef v3 = (const void *)a1[6];
  if (v3)
  {
    CFRelease(v3);
    a1[6] = 0LL;
  }

  CFDictionaryRef v4 = (const void *)a1[9];
  if (v4)
  {
    CFRelease(v4);
    a1[9] = 0LL;
  }

void ___dispatchCopyCurrentNetwork_block_invoke(uint64_t a1)
{
}

uint64_t WiFiNetworkGetTypeID()
{
  uint64_t result = __kWiFiNetworkTypeID;
  if (!__kWiFiNetworkTypeID)
  {
    pthread_once(&__wifiNetworkTypeInit, (void (*)(void))__WiFiNetworkRegister);
    return __kWiFiNetworkTypeID;
  }

  return result;
}

CFSetRef __WiFiNetworkRegister()
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  __kWiFiNetworkCFTypeID TypeID = _CFRuntimeRegisterClass();
  *(_OWORD *)values = xmmword_189E8BA08;
  __int128 v4 = *(_OWORD *)&off_189E8BA18;
  int v5 = @"AcceptEAPTypes";
  uint64_t v0 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  __eapKeys = (uint64_t)CFArrayCreate( (CFAllocatorRef)*MEMORY[0x189604DB0],  (const void **)values,  5LL,  MEMORY[0x189605228]);
  v2[0] = xmmword_189E8BA30;
  v2[1] = *(_OWORD *)off_189E8BA40;
  CFSetRef result = CFSetCreate(v0, (const void **)v2, 4LL, MEMORY[0x189605258]);
  __internalSSIDs = (uint64_t)result;
  return result;
}

_WORD *WiFiNetworkCreate(int a1, CFTypeRef cf)
{
  if (cf)
  {
    CFTypeID v3 = CFGetTypeID(cf);
    if (v3 != CFDictionaryGetTypeID()) {
      goto LABEL_25;
    }
    Value = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)cf, @"SSID_STR");
    if (Value)
    {
      CFTypeID TypeID = CFStringGetTypeID();
      if (TypeID != CFGetTypeID(Value)) {
        return 0LL;
      }
    }

    if (!WiFiNetworkIsSSIDLengthValid(Value) && !CFDictionaryGetValue((CFDictionaryRef)cf, @"DomainName"))
    {
LABEL_25:
      objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
      return 0LL;
    }

    uint64_t v6 = CFDictionaryGetValue((CFDictionaryRef)cf, @"SSID");
    if (v6)
    {
      int v7 = v6;
      CFTypeID v8 = CFDataGetTypeID();
      if (v8 != CFGetTypeID(v7)) {
        return 0LL;
      }
    }
  }

  if (!__kWiFiNetworkTypeID) {
    pthread_once(&__wifiNetworkTypeInit, (void (*)(void))__WiFiNetworkRegister);
  }
  uint64_t Instance = _CFRuntimeCreateInstance();
  int v10 = (_WORD *)Instance;
  if (Instance)
  {
    *(void *)(Instance + 16) = 0LL;
    *(void *)(Instance + 24) = 0LL;
    int v11 = (CFMutableDictionaryRef *)(Instance + 16);
    int v12 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    if (cf) {
      MutableCFDictionaryRef Copy = CFDictionaryCreateMutableCopy(v12, 0LL, (CFDictionaryRef)cf);
    }
    else {
      MutableCFDictionaryRef Copy = CFDictionaryCreateMutable(v12, 0LL, MEMORY[0x189605240], MEMORY[0x189605250]);
    }
    *int v11 = MutableCopy;
    if (MutableCopy)
    {
      int v14 = CFDictionaryGetValue(MutableCopy, @"HIDDEN_NETWORK");
      if (v14) {
        BOOL v15 = v14 == (const void *)*MEMORY[0x189604DE8];
      }
      else {
        BOOL v15 = 0;
      }
      if (v15)
      {
        uint64_t v16 = v14;
        CFDictionaryRemoveValue(*v11, @"HIDDEN_NETWORK");
        CFDictionarySetValue(*v11, @"UserDirected", v16);
      }

      v10[12] = -1;
      return v10;
    }

    CFRelease(v10);
    return 0LL;
  }

  return v10;
}

_WORD *WiFiNetworkCreateWithSsid(const __CFString *a1)
{
  if (a1
    && (int v2 = (const __CFAllocator *)*MEMORY[0x189604DB0],
        (CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250])) != 0LL))
  {
    __int128 v4 = Mutable;
    CFDictionarySetValue(Mutable, @"SSID_STR", a1);
    CFDataRef ExternalRepresentation = CFStringCreateExternalRepresentation(v2, a1, 0x8000100u, 0);
    if (ExternalRepresentation)
    {
      CFDataRef v6 = ExternalRepresentation;
      CFDictionarySetValue(v4, @"SSID", ExternalRepresentation);
      CFRelease(v6);
    }

    __int16 valuePtr = 2;
    CFNumberRef v7 = CFNumberCreate(v2, kCFNumberSInt16Type, &valuePtr);
    if (v7)
    {
      CFNumberRef v8 = v7;
      CFDictionarySetValue(v4, @"AP_MODE", v7);
      CFRelease(v8);
    }

    mach_port_t v9 = WiFiNetworkCreate((int)v2, v4);
    CFRelease(v4);
  }

  else
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
    return 0LL;
  }

  return v9;
}

_WORD *WiFiNetworkCreateCopy(uint64_t a1, uint64_t a2)
{
  CFSetRef result = WiFiNetworkCreate(*MEMORY[0x189604DB0], *(CFTypeRef *)(a2 + 16));
  result[12] = *(_WORD *)(a2 + 24);
  return result;
}

CFMutableDictionaryRef WiFiNetworkCopyMutableRecord(uint64_t a1)
{
  return CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, *(CFDictionaryRef *)(a1 + 16));
}

CFDictionaryRef WiFiNetworkCopyRecord(uint64_t a1)
{
  return CFDictionaryCreateCopy((CFAllocatorRef)*MEMORY[0x189604DB0], *(CFDictionaryRef *)(a1 + 16));
}

CFDictionaryRef WiFiNetworkCopyFilteredRecord(uint64_t a1)
{
  uint64_t v1 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  MutableCFDictionaryRef Copy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, *(CFDictionaryRef *)(a1 + 16));
  CFTypeID v3 = MutableCopy;
  if (MutableCopy)
  {
    if (!CFDictionaryGetValue(MutableCopy, @"SSID_STR"))
    {
      CFDataRef v6 = v3;
      CFTypeID v3 = 0LL;
LABEL_10:
      CFRelease(v6);
      return v3;
    }

    Value = (const __CFDictionary *)CFDictionaryGetValue(v3, @"EnterpriseProfile");
    if (Value)
    {
      int v5 = CFDictionaryCreateMutableCopy(v1, 0LL, Value);
      if (v5)
      {
        CFDataRef v6 = v5;
        CFNumberRef v7 = (const __CFDictionary *)CFDictionaryGetValue(v5, @"EAPClientConfiguration");
        if (v7)
        {
          CFNumberRef v8 = CFDictionaryCreateMutableCopy(v1, 0LL, v7);
          if (v8)
          {
            mach_port_t v9 = v8;
            CFDictionaryRemoveValue(v8, @"UserPassword");
            CFDictionaryRemoveValue(v9, @"TLSSaveTrustExceptions");
            CFDictionaryRemoveValue(v9, @"TLSUserTrustProceedCertificateChain");
            CFDictionarySetValue(v6, @"EAPClientConfiguration", v9);
            CFRelease(v9);
          }
        }

        CFDictionarySetValue(v3, @"EnterpriseProfile", v6);
        goto LABEL_10;
      }
    }
  }

  return v3;
}

CFDictionaryRef WiFiNetworkCopyPreparedEAPProfile(CFDictionaryRef *a1, const void *a2)
{
  Property = (const __CFDictionary *)WiFiNetworkGetProperty((uint64_t)a1, @"EnterpriseProfile");
  if (!Property) {
    return 0LL;
  }
  int v5 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  MutableCFDictionaryRef Copy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, Property);
  CFNumberRef v7 = MutableCopy;
  if (MutableCopy)
  {
    CFDictionarySetValue(MutableCopy, @"EnableUserInterface", (const void *)*MEMORY[0x189604DE0]);
    Value = (const __CFDictionary *)CFDictionaryGetValue(v7, @"EAPClientConfiguration");
    if (Value)
    {
      mach_port_t v9 = CFDictionaryCreateMutableCopy(v5, 0LL, Value);
      if (v9)
      {
        int v10 = v9;
        if (a2)
        {
          CFDictionarySetValue(v9, @"UserPassword", a2);
LABEL_15:
          CFDictionarySetValue(v7, @"EAPClientConfiguration", v10);
          CFRelease(v10);
          return v7;
        }

        if (WiFiNetworkIsHotspot20((BOOL)a1))
        {
          CFStringRef v11 = __WiFiNetworkCopyPasswordForAccount((uint64_t)a1);
          objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
          if (!v11)
          {
            CFStringRef v11 = WiFiNetworkCopyPassword(a1);
            if (!v11)
            {
              objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
              CFStringRef v11 = __WiFiNetworkCopyPasswordByDomainName((uint64_t)a1);
              if (!v11)
              {
                objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
                goto LABEL_15;
              }
            }
          }
        }

        else
        {
          CFStringRef v11 = WiFiNetworkCopyPassword(a1);
          if (!v11) {
            goto LABEL_15;
          }
        }

        CFDictionarySetValue(v10, @"UserPassword", v11);
        CFRelease(v11);
        goto LABEL_15;
      }
    }
  }

  return v7;
}

const void *WiFiNetworkGetProperty(uint64_t a1, void *key)
{
  if (a1 && (CFTypeID v3 = *(const __CFDictionary **)(a1 + 16)) != 0LL)
  {
    int v5 = (const __CFArray *)__eapKeys;
    if (!__eapKeys) {
      return CFDictionaryGetValue(v3, key);
    }
    v9.length = CFArrayGetCount((CFArrayRef)__eapKeys);
    v9.location = 0LL;
    int v6 = CFArrayContainsValue(v5, v9, key);
    CFTypeID v3 = *(const __CFDictionary **)(a1 + 16);
    if (!v6) {
      return CFDictionaryGetValue(v3, key);
    }
    Value = (const __CFDictionary *)CFDictionaryGetValue(v3, @"EnterpriseProfile");
    if (Value)
    {
      CFTypeID v3 = (const __CFDictionary *)CFDictionaryGetValue(Value, @"EAPClientConfiguration");
      if (v3) {
        return CFDictionaryGetValue(v3, key);
      }
    }
  }

  else
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
  }

  return 0LL;
}

BOOL WiFiNetworkIsHotspot20(BOOL result)
{
  if (result)
  {
    uint64_t v1 = result;
    return CFDictionaryGetValue(*(CFDictionaryRef *)(result + 16), @"HOTSPOT20_IE")
        || CFDictionaryGetValue(*(CFDictionaryRef *)(v1 + 16), @"DomainName") != 0LL;
  }

  return result;
}

CFStringRef __WiFiNetworkCopyPasswordForAccount(uint64_t a1)
{
  Property = (__CFString *)WiFiNetworkGetProperty(a1, @"HS20AccountName");
  objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
  if (Property && CFStringGetLength(Property) >= 1) {
    return WiFiSecurityCopyPassword(Property);
  }
  else {
    return 0LL;
  }
}

CFStringRef WiFiNetworkCopyPassword(CFDictionaryRef *a1)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    int v6 = "WiFiNetworkCopyPassword";
    __int16 v7 = 2112;
    AccountForNetwork = WiFiNetworkGetAccountForNetwork(a1);
    _os_log_impl( &dword_18658B000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%s: Copy password for Network %@",  (uint8_t *)&v5,  0x16u);
  }

  if (!a1
    || !CFDictionaryContainsKey(a1[2], @"PayloadUUID")
    || (v2 = WiFiNetworkGetAccountForNetwork(a1), (CFStringRef result = WiFiSecurityCopyNonSyncablePassword(v2)) == 0LL))
  {
    __int128 v4 = (__CFString *)WiFiNetworkGetAccountForNetwork(a1);
    return WiFiSecurityCopyPassword(v4);
  }

  return result;
}

__CFString *__WiFiNetworkCopyPasswordByDomainName(uint64_t a1)
{
  CFStringRef result = (__CFString *)WiFiNetworkGetProperty(a1, @"DomainName");
  if (result) {
    return (__CFString *)WiFiSecurityCopyPassword(result);
  }
  return result;
}

void WiFiNetworkMergeForAssociation(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    if (CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"WEP") == (const void *)*MEMORY[0x189604DE8])
    {
      Property = WiFiNetworkGetProperty(a2, @"WEP_AUTH_Flags");
      if (Property) {
        WiFiNetworkSetProperty(a1, @"WEP_AUTH_Flags", Property);
      }
    }
  }

  if (WiFiNetworkIsEAP(a2))
  {
    int v5 = WiFiNetworkGetProperty(a2, @"EnterpriseProfile");
    if (v5) {
      WiFiNetworkSetProperty(a1, @"EnterpriseProfile", v5);
    }
  }

  if (a2 && CFDictionaryGetValue(*(CFDictionaryRef *)(a2 + 16), @"DomainName") && WiFiNetworkIsHotspot20(a1))
  {
    int v6 = WiFiNetworkGetProperty(a2, @"DisplayedOperatorName");
    if (v6) {
      WiFiNetworkSetProperty(a1, @"HS2NetworkBadge", v6);
    }
    SSID = WiFiNetworkGetProperty(a2, @"HS20AccountName");
    if (SSID || (SSID = WiFiNetworkGetSSID((const void *)a2)) != 0LL)
    {
      WiFiNetworkSetProperty(a1, @"HS20AccountName", SSID);
      objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
    }
  }

  CFNumberRef v8 = WiFiNetworkGetProperty(a2, @"TransitionDisabledFlags");
  if (v8) {
    WiFiNetworkSetProperty(a1, @"TransitionDisabledFlags", v8);
  }
  uint64_t v9 = (void *)*MEMORY[0x18960F000];
  int v10 = WiFiNetworkGetProperty(a2, (void *)*MEMORY[0x18960F000]);
  if (v10) {
    WiFiNetworkSetProperty(a1, v9, v10);
  }
  CFStringRef v11 = WiFiNetworkGetProperty(a2, @"PolicyUUID");
  if (v11) {
    WiFiNetworkSetProperty(a1, @"PolicyUUID", v11);
  }
  int v12 = WiFiNetworkGetProperty(a2, @"PayloadUUID");
  if (v12) {
    WiFiNetworkSetProperty(a1, @"PayloadUUID", v12);
  }
  WiFiNetworkMergeAutoJoinProperties(a1, a2);
  if (MEMORY[0x18960D5A8])
  {
    int v13 = (void *)*MEMORY[0x18960D690];
    int v14 = WiFiNetworkGetProperty(a2, (void *)*MEMORY[0x18960D690]);
    WiFiNetworkSetProperty(a1, v13, v14);
  }

  BOOL v15 = WiFiNetworkGetProperty(a2, @"WiFiNetworkUserAcceptedRecommendationAt");
  WiFiNetworkSetProperty(a1, @"WiFiNetworkUserAcceptedRecommendationAt", v15);
  if (*(__int16 *)(a1 + 24) == -1)
  {
    int v16 = *(unsigned __int16 *)(a2 + 24);
    if (v16 != 0xFFFF) {
      *(_WORD *)(a1 + 24) = v16;
    }
  }

BOOL WiFiNetworkIsWEP(BOOL result)
{
  if (result) {
    return CFDictionaryGetValue(*(CFDictionaryRef *)(result + 16), @"WEP") == (const void *)*MEMORY[0x189604DE8];
  }
  return result;
}

void WiFiNetworkSetProperty(uint64_t a1, void *key, const void *a3)
{
  if (!a1 || (__int128 v4 = *(const __CFDictionary **)(a1 + 16)) == 0LL)
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
    return;
  }

  __int16 v7 = (const __CFArray *)__eapKeys;
  if (__eapKeys
    && (v29.length = CFArrayGetCount((CFArrayRef)__eapKeys),
        v29.location = 0LL,
        int v8 = CFArrayContainsValue(v7, v29, key),
        __int128 v4 = *(const __CFDictionary **)(a1 + 16),
        v8))
  {
    Value = (const __CFDictionary *)CFDictionaryGetValue(v4, @"EnterpriseProfile");
    if (!Value
      || (int v10 = Value,
          CFStringRef v11 = (const __CFAllocator *)*MEMORY[0x189604DB0],
          (MutableCFDictionaryRef Copy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, Value)) == 0LL))
    {
      BOOL v21 = 0;
      mach_port_t v18 = 0LL;
      goto LABEL_28;
    }

    int v13 = MutableCopy;
    int v14 = (const __CFDictionary *)CFDictionaryGetValue(v10, @"EAPClientConfiguration");
    if (v14 && (BOOL v15 = CFDictionaryCreateMutableCopy(v11, 0LL, v14)) != 0LL)
    {
      int v16 = v15;
      int v17 = CFDictionaryGetValue(v15, key);
      mach_port_t v18 = v17;
      if (v17) {
        CFRetain(v17);
      }
      CFDictionarySetValue(v16, key, a3);
      CFDictionarySetValue(v13, @"EAPClientConfiguration", v16);
      CFRelease(v16);
    }

    else
    {
      mach_port_t v18 = 0LL;
    }

    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 16), @"EnterpriseProfile", v13);
    CFRelease(v13);
  }

  else
  {
    int v19 = CFDictionaryGetValue(v4, key);
    mach_port_t v18 = v19;
    if (v19) {
      CFRetain(v19);
    }
    int v20 = *(__CFDictionary **)(a1 + 16);
    if (a3) {
      CFDictionarySetValue(v20, key, a3);
    }
    else {
      CFDictionaryRemoveValue(v20, key);
    }
    if (CFEqual(key, @"EnterpriseProfile") && !__WiFiNetworkIsWPAEAP(*(const __CFDictionary **)(a1 + 16)))
    {
      unsigned int v22 = __WiFiNetworkIsSAE(*(const __CFDictionary **)(a1 + 16));
      int IsWPAWPA2PSK = WiFiNetworkIsWPAWPA2PSK(a1);
      if (v22) {
        WiFiNetworkSetSAE(a1, 1, IsWPAWPA2PSK);
      }
      else {
        WiFiNetworkSetWPA(a1, IsWPAWPA2PSK);
      }
    }
  }

  BOOL v21 = v18 != 0LL;
  if (!a3 && v18)
  {
LABEL_27:
    BOOL v21 = 1;
    goto LABEL_30;
  }

LABEL_28:
  if (!a3 || v18)
  {
    char v28 = !v21;
    if (!a3) {
      char v28 = 1;
    }
    if ((v28 & 1) != 0) {
      goto LABEL_38;
    }
    if (CFEqual(a3, v18)) {
      goto LABEL_39;
    }
    goto LABEL_27;
  }

    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
    goto LABEL_29;
  }

  int v12 = (const __CFDictionary *)WiFiNetworkGetProperty(a1, @"RSN_IE");
  if (v12)
  {
    int v13 = CFDictionaryCreateMutableCopy(v3, 0LL, v12);
    if (v13)
    {
      int v14 = v13;
      BOOL v15 = (const __CFArray *)CFDictionaryGetValue(v12, @"IE_KEY_RSN_AUTHSELS");
      if (!v15 || CFArrayGetCount(v15) >= 2)
      {
        CFDictionaryReplaceValue(v14, @"IE_KEY_RSN_AUTHSELS", v5);
        WiFiNetworkSetProperty(a1, @"RSN_IE", v14);
      }

      CFRelease(v14);
    }
  }

  else
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
  }

  int v16 = WiFiNetworkGetProperty(a1, @"WPA_IE");
  if (!v16) {
    goto LABEL_28;
  }
  int v17 = v16;
  CFTypeID TypeID = CFDictionaryGetTypeID();
  if (!_CFValidateType(TypeID, v17)) {
    goto LABEL_28;
  }
  int v19 = CFDictionaryCreateMutableCopy(v3, 0LL, (CFDictionaryRef)v17);
  if (v19)
  {
    uint64_t v9 = v19;
    int v20 = (const __CFArray *)CFDictionaryGetValue(v12, @"IE_KEY_WPA_AUTHSELS");
    if (v20 && CFArrayGetCount(v20) < 2) {
      goto LABEL_27;
    }
    CFDictionaryReplaceValue(v9, @"IE_KEY_WPA_AUTHSELS", v5);
    CFStringRef v11 = @"WPA_IE";
    goto LABEL_26;
  }

    __int128 v4 = 0LL;
    goto LABEL_15;
  }

  CFTypeID v3 = WiFiSecurityCopySSIDHashForPasswordBackup(*(void **)(a1 + 32));
  __int128 v4 = v3;
  if (!v3 || ![v3 length])
  {
    if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    *(_DWORD *)buf = 136315138;
    int v19 = "WiFiSecuritySavePasswordForPasswordBackup_block_invoke";
    uint64_t v9 = (os_log_s *)MEMORY[0x1895F8DA0];
    int v10 = "%s: error: empty ssid hash";
    CFStringRef v11 = 12;
    goto LABEL_14;
  }

  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    int v5 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 136315650;
    int v19 = "WiFiSecuritySavePasswordForPasswordBackup_block_invoke";
    int v20 = 2112;
    BOOL v21 = v5;
    unsigned int v22 = 2112;
    uint64_t v23 = v4;
    _os_log_impl(&dword_18658B000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "%s: ssid %@ (%@)", buf, 0x20u);
  }

  int v6 = [*(id *)(a1 + 40) dataUsingEncoding:4];
  __int16 v7 = (void *)[MEMORY[0x189603FC8] dictionary];
  [v7 setObject:*MEMORY[0x18960BB48] forKey:*MEMORY[0x18960BB38]];
  [v7 setObject:v4 forKey:*MEMORY[0x18960B870]];
  [v7 setObject:@"AirPort" forKey:*MEMORY[0x18960BA88]];
  [v7 setObject:v6 forKey:*MEMORY[0x18960BE78]];
  [v7 setObject:*MEMORY[0x18960B830] forKey:*MEMORY[0x18960B828]];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = SecItemAdd((CFDictionaryRef)v7, &result);
  int v8 = *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL);
  if (v8 == -25299)
  {
    WiFiSecurityRemovePasswordFromPasswordBackup(*(void *)(a1 + 32));
    *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = SecItemAdd((CFDictionaryRef)v7, &result);
    int v8 = *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL);
  }

  if (v8 && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    int v19 = "WiFiSecuritySavePasswordForPasswordBackup_block_invoke";
    int v20 = 2112;
    BOOL v21 = v4;
    unsigned int v22 = 1024;
    LODWORD(v23) = v8;
    uint64_t v9 = (os_log_s *)MEMORY[0x1895F8DA0];
    int v10 = "%s:[%@] error result %d \n";
    CFStringRef v11 = 28;
LABEL_14:
    _os_log_impl(&dword_18658B000, v9, OS_LOG_TYPE_DEFAULT, v10, buf, v11);
  }

LABEL_30:
  __int16 v24 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  CFDateRef v26 = CFDateCreate(v24, Current);
  if (v26)
  {
    CFDateRef v27 = v26;
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 16), @"lastUpdated", v26);
    CFRelease(v27);
    if (!v21) {
      return;
    }
LABEL_39:
    CFRelease(v18);
    return;
  }

LABEL_38:
  if (v21) {
    goto LABEL_39;
  }
}

BOOL WiFiNetworkIsEAP(uint64_t a1)
{
  return a1 && !WiFiNetworkIsWAPI(a1) && __WiFiNetworkIsEAP(*(const __CFDictionary **)(a1 + 16));
}

BOOL WiFiNetworkIsHS20Account(BOOL result)
{
  if (result) {
    return CFDictionaryGetValue(*(CFDictionaryRef *)(result + 16), @"DomainName") != 0LL;
  }
  return result;
}

void WiFiNetworkSetHS2NetworkBadge(uint64_t a1, const void *a2)
{
}

const void *WiFiNetworkGetSSID(const void *result)
{
  if (result)
  {
    uint64_t v1 = (uint64_t)result;
    CFStringRef result = WiFiNetworkGetProperty((uint64_t)result, @"SSID_STR");
    if (!result)
    {
      Property = (const __CFData *)WiFiNetworkGetProperty(v1, @"SSID");
      CFTypeID v3 = (const __CFAllocator *)*MEMORY[0x189604DB0];
      if (Property
        && ((__int128 v4 = Property,
             (CFStringRef v5 = CFStringCreateFromExternalRepresentation((CFAllocatorRef)*MEMORY[0x189604DB0], Property, 0x8000100u)) != 0LL)
         || (CFStringRef v5 = CFStringCreateFromExternalRepresentation(v3, v4, 0)) != 0LL)
        || (CFStringRef v5 = CFStringCreateWithCString(v3, "", 0x8000100u)) != 0LL)
      {
        WiFiNetworkSetProperty(v1, @"SSID_STR", v5);
        CFRelease(v5);
      }

      return WiFiNetworkGetProperty(v1, @"SSID_STR");
    }
  }

  return result;
}

CFStringRef WiFiNetworkGetAccountForNetwork(const void *a1)
{
  if (!a1) {
    return 0LL;
  }
  SSID = (const __CFString *)WiFiNetworkGetSSID(a1);
  CFTypeID v3 = SSID;
  if ((!SSID || !CFStringGetLength(SSID)) && WiFiNetworkIsHotspot20((BOOL)a1))
  {
    Property = WiFiNetworkGetProperty((uint64_t)a1, @"DomainName");
    if (Property) {
      return (const __CFString *)Property;
    }
  }

  return v3;
}

void WiFiNetworkMergeAutoJoinProperties(uint64_t a1, uint64_t a2)
{
  if (!a1 || !a2) {
    goto LABEL_7;
  }
  WiFiNetworkRemoveAutoJoinProperties(a1);
  BOOL IsEnabled = WiFiNetworkIsEnabled(a2);
  WiFiNetworkSetState(a1, IsEnabled);
  if (!IsEnabled)
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
    Property = WiFiNetworkGetProperty(a2, @"networkDisabledClientName");
    WiFiNetworkSetProperty(a1, @"networkDisabledClientName", Property);
    int v6 = WiFiNetworkGetProperty(a2, @"networkDisabledReason");
    WiFiNetworkSetProperty(a1, @"networkDisabledReason", v6);
    __int16 v7 = WiFiNetworkGetProperty(a2, @"networkDisabledTimestamp");
    WiFiNetworkSetProperty(a1, @"networkDisabledTimestamp", v7);
    int v8 = WiFiNetworkGetProperty(a2, @"WiFiNetworkDisabledUntilDate");
    if (v8)
    {
      WiFiNetworkSetProperty(a1, @"WiFiNetworkDisabledUntilDate", v8);
LABEL_7:
      objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
    }
  }

void WiFiNetworkMerge(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    WiFiNetworkMergeProperties(a1, *(CFDictionaryRef *)(a2 + 16));
    if (*(__int16 *)(a1 + 24) == -1)
    {
      int v4 = *(unsigned __int16 *)(a2 + 24);
      if (v4 != 0xFFFF) {
        *(_WORD *)(a1 + 24) = v4;
      }
    }
  }

void WiFiNetworkMergeProperties(uint64_t a1, CFDictionaryRef theDict)
{
  if (!a1) {
    return;
  }
  if (!theDict) {
    return;
  }
  uint64_t v3 = a1;
  unsigned int Count = CFDictionaryGetCount(theDict);
  uint64_t v5 = Count;
  if (!Count) {
    return;
  }
  size_t v6 = 8LL * Count;
  __int16 v7 = (const void **)malloc(v6);
  uint64_t v40 = (const void **)malloc(v6);
  CFDictionaryGetKeysAndValues(theDict, v7, v40);
  uint64_t v8 = 0LL;
  int v9 = 0;
  char v43 = 0;
  int v10 = @"LEAKY_AP_LEARNED_DATA";
  allocator = (const __CFAllocator *)*MEMORY[0x189604DB0];
  uint64_t v38 = v5;
  do
  {
    if (CFStringCompare(v10, (CFStringRef)v7[v8], 0LL) == kCFCompareEqualTo)
    {
      objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
      char v43 = 1;
    }

    if (WiFiNetworkIsHotspot20(v3)
      && (CFStringCompare(@"SSID_STR", (CFStringRef)v7[v8], 0LL) == kCFCompareEqualTo
       || CFStringCompare(@"SSID", (CFStringRef)v7[v8], 0LL) == kCFCompareEqualTo))
    {
      objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
      goto LABEL_42;
    }

    if (CFStringCompare(@"PRIVATE_MAC_ADDRESS", (CFStringRef)v7[v8], 0LL) == kCFCompareEqualTo) {
      goto LABEL_42;
    }
    if (CFStringCompare(@"EnterpriseProfile", (CFStringRef)v7[v8], 0LL) == kCFCompareEqualTo)
    {
      Property = (const __CFDictionary *)WiFiNetworkGetProperty(v3, @"EnterpriseProfile");
      CFMutableDictionaryRef Mutable = Property;
      if (!Property) {
        CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(allocator, 0LL, MEMORY[0x189605240], MEMORY[0x189605250]);
      }
      int v14 = (const __CFDictionary *)v40[v8];
      BOOL v15 = _copyDictionaryAddingMissingValuesFromSource(Mutable, v14);
      value = 0LL;
      __int16 valuePtr = 0LL;
      CFDictionaryGetValueIfPresent(v14, @"EAPClientConfiguration", (const void **)&valuePtr);
      CFDictionaryGetValueIfPresent(Mutable, @"EAPClientConfiguration", (const void **)&value);
      int v16 = valuePtr;
      if (valuePtr)
      {
        int v17 = value;
        mach_port_t v18 = value;
        if (!value)
        {
          mach_port_t v18 = CFDictionaryCreateMutable(allocator, 0LL, MEMORY[0x189605240], MEMORY[0x189605250]);
          value = v18;
          int v16 = valuePtr;
        }

        CFDictionaryRef v19 = _copyDictionaryAddingMissingValuesFromSource((CFDictionaryRef)v18, v16);
        Default = CFAllocatorGetDefault();
        MutableCFDictionaryRef Copy = CFDictionaryCreateMutableCopy(Default, 0LL, v15);
        CFDictionarySetValue(MutableCopy, @"EAPClientConfiguration", v19);
        WiFiNetworkSetProperty(v3, @"EnterpriseProfile", MutableCopy);
        if (MutableCopy) {
          CFRelease(MutableCopy);
        }
        if (v19) {
          CFRelease(v19);
        }
        if (!v17 && value)
        {
          CFRelease(value);
          value = 0LL;
        }

        if (!v15)
        {
LABEL_37:
          if (!Property && Mutable)
          {
            unsigned int v22 = Mutable;
            goto LABEL_40;
          }

LABEL_41:
          int v9 = 1;
          uint64_t v5 = v38;
          goto LABEL_42;
        }
      }

      else
      {
        WiFiNetworkSetProperty(v3, @"EnterpriseProfile", v15);
        if (!v15) {
          goto LABEL_37;
        }
      }

      CFRelease(v15);
      goto LABEL_37;
    }

    if (CFStringCompare(@"HomePropertyFromMobilewifitool", (CFStringRef)v7[v8], 0LL)
      && CFStringCompare(@"COLOCATED_NETWORK_SCOPE_ID", (CFStringRef)v7[v8], 0LL))
    {
      if (CFStringCompare(@"NetworkOfInterestHomeState", (CFStringRef)v7[v8], 0LL) == kCFCompareEqualTo)
      {
        CFStringRef v11 = (const __CFNumber *)v40[v8];
        LODWORD(valuePtr) = 0;
        if (WiFiNetworkGetNetworkOfInterestHomeType(v3))
        {
          if (v11) {
            CFNumberGetValue(v11, kCFNumberSInt32Type, &valuePtr);
          }
        }
      }

      if (CFStringCompare(@"networkKnownBSSListKey", (CFStringRef)v7[v8], 0LL) == kCFCompareEqualTo)
      {
        uint64_t v23 = (const __CFArray *)WiFiNetworkGetProperty(v3, @"networkKnownBSSListKey");
        theArray = (const __CFArray *)v40[v8];
        if (theArray)
        {
          __int16 v24 = v23;
          if (v23)
          {
            uint64_t v36 = v3;
            CFIndex v25 = CFArrayGetCount(theArray);
            CFIndex v26 = CFArrayGetCount(v24);
            uint64_t v39 = CFArrayCreateMutableCopy(allocator, 0LL, v24);
            CFIndex v41 = v25;
            if (v25 >= 1)
            {
              CFIndex v27 = 0LL;
              do
              {
                ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(theArray, v27);
                if (ValueAtIndex)
                {
                  CFRange v29 = ValueAtIndex;
                  uint64_t v30 = v10;
                  uint64_t v31 = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, @"BSSID");
                  if (v26 < 1)
                  {
LABEL_59:
                    CFArrayAppendValue(v39, v29);
                  }

                  else
                  {
                    unsigned int v32 = v31;
                    BOOL v33 = 0LL;
                    CFIndex v34 = 0LL;
                    while (1)
                    {
                      __int16 v35 = (const __CFDictionary *)CFArrayGetValueAtIndex(v24, v34);
                      if (v35) {
                        BOOL v33 = (const __CFString *)CFDictionaryGetValue(v35, @"BSSID");
                      }
                      if (v33 && v32 && CFStringCompare(v33, v32, 1uLL) == kCFCompareEqualTo) {
                        break;
                      }
                      if (v26 == ++v34) {
                        goto LABEL_59;
                      }
                    }

                    CFArraySetValueAtIndex(v39, v34, v29);
                  }

                  int v10 = v30;
                }

                ++v27;
              }

              while (v27 != v41);
            }

            uint64_t v3 = v36;
            WiFiNetworkSetProperty(v36, @"networkKnownBSSListKey", v39);
            if (v39)
            {
              unsigned int v22 = v39;
LABEL_40:
              CFRelease(v22);
            }

            goto LABEL_41;
          }
        }
      }

      if (CFStringCompare(@"lastUpdated", (CFStringRef)v7[v8], 0LL) || v9 != 1)
      {
        CFRetain(v40[v8]);
        CFDictionarySetValue(*(CFMutableDictionaryRef *)(v3 + 16), v7[v8], v40[v8]);
        CFRelease(v40[v8]);
      }
    }

LABEL_42:
    ++v8;
  }

  while (v8 != v5);
  if ((v43 & 1) == 0)
  {
    if (WiFiNetworkGetProperty(v3, @"LEAKY_AP_LEARNED_DATA"))
    {
      CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(v3 + 16), @"LEAKY_AP_LEARNED_DATA");
      objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
    }
  }

  free(v40);
  free(v7);
}

CFDictionaryRef _copyDictionaryAddingMissingValuesFromSource( CFDictionaryRef result, CFDictionaryRef theDict)
{
  if (result)
  {
    uint64_t v3 = result;
    if (theDict && (unsigned int Count = CFDictionaryGetCount(theDict), (v5 = Count) != 0))
    {
      size_t v6 = 8LL * Count;
      __int16 v7 = (const void **)malloc(v6);
      uint64_t v8 = (const void **)malloc(v6);
      Default = CFAllocatorGetDefault();
      MutableCFDictionaryRef Copy = CFDictionaryCreateMutableCopy(Default, 0LL, v3);
      CFDictionaryGetKeysAndValues(theDict, v7, v8);
      unint64_t v11 = 0LL;
      uint64_t v12 = 8 * v5;
      do
      {
        CFDictionaryGetValueIfPresent(MutableCopy, v7[v11 / 8], 0LL);
        CFDictionaryAddValue(MutableCopy, v7[v11 / 8], v8[v11 / 8]);
        v11 += 8LL;
      }

      while (v12 != v11);
      free(v8);
      free(v7);
      int v13 = CFAllocatorGetDefault();
      CFDictionaryRef Copy = CFDictionaryCreateCopy(v13, MutableCopy);
      CFRelease(MutableCopy);
      return Copy;
    }

    else
    {
      BOOL v15 = CFAllocatorGetDefault();
      return CFDictionaryCreateCopy(v15, v3);
    }
  }

  return result;
}

CFNumberRef WiFiNetworkGetNetworkOfInterestHomeType(uint64_t a1)
{
  unsigned int valuePtr = 0;
  if (a1)
  {
    CFStringRef result = (const __CFNumber *)WiFiNetworkGetProperty(a1, @"NetworkOfInterestHomeState");
    if (result)
    {
      int Value = CFNumberGetValue(result, kCFNumberSInt32Type, &valuePtr);
      if (valuePtr - 3 >= 0xFFFFFFFE || Value == 0) {
        return (const __CFNumber *)valuePtr;
      }
      else {
        return 0LL;
      }
    }
  }

  else
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
    return 0LL;
  }

  return result;
}

const void *WiFiNetworkGetKnownBssList(uint64_t a1)
{
  return WiFiNetworkGetProperty(a1, @"networkKnownBSSListKey");
}

CFDictionaryRef WiFiNetworkRecordGetSSID(const __CFDictionary *result)
{
  if (result)
  {
    uint64_t v1 = result;
    CFStringRef result = (const __CFDictionary *)CFDictionaryGetValue(result, @"SSID_STR");
    if (!result)
    {
      int Value = (const __CFData *)CFDictionaryGetValue(v1, @"SSID");
      uint64_t v3 = (const __CFAllocator *)*MEMORY[0x189604DB0];
      if (Value
        && ((int v4 = Value,
             (CFStringRef v5 = CFStringCreateFromExternalRepresentation((CFAllocatorRef)*MEMORY[0x189604DB0], Value, 0x8000100u)) != 0LL)
         || (CFStringRef v5 = CFStringCreateFromExternalRepresentation(v3, v4, 0)) != 0LL)
        || (CFStringRef v5 = CFStringCreateWithCString(v3, "", 0x8000100u)) != 0LL)
      {
        CFDictionarySetValue(v1, @"SSID_STR", v5);
        CFRelease(v5);
      }

      return (const __CFDictionary *)CFDictionaryGetValue(v1, @"SSID_STR");
    }
  }

  return result;
}

CFStringRef WiFiNetworkGetSSIDData(const void *a1)
{
  CFStringRef result = (const __CFString *)WiFiNetworkGetProperty((uint64_t)a1, @"SSID");
  if (!result)
  {
    CFStringRef result = (const __CFString *)WiFiNetworkGetSSID(a1);
    if (result)
    {
      CFStringRef result = (const __CFString *)CFStringCreateExternalRepresentation( (CFAllocatorRef)*MEMORY[0x189604DB0],  result,  0x8000100u,  0);
      if (result)
      {
        uint64_t v3 = result;
        WiFiNetworkSetProperty((uint64_t)a1, @"SSID", result);
        CFRelease(v3);
        return (const __CFString *)WiFiNetworkGetProperty((uint64_t)a1, @"SSID");
      }
    }
  }

  return result;
}

CFDataRef WiFiNetworkCopyBSSIDData(uint64_t a1)
{
  v5[2] = *MEMORY[0x1895F89C0];
  CFDataRef result = (CFDataRef)WiFiNetworkGetProperty(a1, @"BSSID");
  if (result)
  {
    int v2 = (const __CFString *)result;
    CFTypeID v3 = CFGetTypeID(result);
    if (v3 == CFStringGetTypeID()
      && (uint64_t v4 = 0LL, v5[0] = 0LL, *(_DWORD *)((char *)v5 + 7) = 0, CFStringGetCString(v2, (char *)&v4, 19LL, 0x8000100u)))
    {
      CFDataRef result = (CFDataRef)ether_aton((const char *)&v4);
      if (result) {
        return CFDataCreate((CFAllocatorRef)*MEMORY[0x189604DB0], (const UInt8 *)result, 6LL);
      }
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

CFArrayRef WiFiNetworkGetLastBSSID(const __CFArray *result)
{
  if (result)
  {
    uint64_t v1 = (uint64_t)result;
    CFDataRef result = (const __CFArray *)WiFiNetworkGetProperty((uint64_t)result, @"BSSID");
    if (!result)
    {
      CFDataRef result = (const __CFArray *)WiFiNetworkGetProperty(v1, @"networkKnownBSSListKey");
      if (result)
      {
        int v2 = result;
        CFDataRef result = (const __CFArray *)CFArrayGetCount(result);
        if (result)
        {
          CFIndex Count = CFArrayGetCount(v2);
          CFDataRef result = (const __CFArray *)CFArrayGetValueAtIndex(v2, Count - 1);
          if (result) {
            return (const __CFArray *)CFDictionaryGetValue(result, @"BSSID");
          }
        }
      }
    }
  }

  return result;
}

const void *WiFiNetworkGetBSSIDList(const void *result)
{
  if (result) {
    return WiFiNetworkGetProperty((uint64_t)result, @"SCAN_BSSID_LIST");
  }
  return result;
}

CFArrayRef WiFiNetworkGetLastChannel(const __CFArray *result)
{
  if (result)
  {
    uint64_t v1 = (uint64_t)result;
    CFDataRef result = (const __CFArray *)WiFiNetworkGetProperty((uint64_t)result, @"CHANNEL");
    if (!result)
    {
      CFDataRef result = (const __CFArray *)WiFiNetworkGetProperty(v1, @"networkKnownBSSListKey");
      if (result)
      {
        int v2 = result;
        CFDataRef result = (const __CFArray *)CFArrayGetCount(result);
        if (result)
        {
          CFIndex Count = CFArrayGetCount(v2);
          CFDataRef result = (const __CFArray *)CFArrayGetValueAtIndex(v2, Count - 1);
          if (result) {
            return (const __CFArray *)CFDictionaryGetValue(result, @"CHANNEL");
          }
        }
      }
    }
  }

  return result;
}

const void *WiFiNetworkGetChannel(uint64_t a1, uint64_t a2)
{
  if (a1) {
    return WiFiNetworkGetProperty(a1, @"CHANNEL");
  }
  objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C](0LL, a2));
  return 0LL;
}

CFArrayRef WiFiNetworkGetBandHistory(const __CFArray *result)
{
  if (result)
  {
    uint64_t v1 = (uint64_t)result;
    CFDataRef result = (const __CFArray *)WiFiNetworkGetProperty((uint64_t)result, @"CHANNEL");
    if (!result)
    {
      CFDataRef result = (const __CFArray *)WiFiNetworkGetProperty(v1, @"networkKnownBSSListKey");
      if (result)
      {
        int v2 = result;
        CFDataRef result = (const __CFArray *)CFArrayGetCount(result);
        if (result)
        {
          CFIndex Count = CFArrayGetCount(v2);
          CFDataRef result = (const __CFArray *)CFArrayGetValueAtIndex(v2, Count - 1);
          if (result) {
            return (const __CFArray *)CFDictionaryGetValue(result, @"CHANNEL");
          }
        }
      }
    }
  }

  return result;
}

uint64_t WiFiNetworkGetRateBounds(uint64_t a1, void *a2, void *a3)
{
  *a3 = 0xFFFFFFFF80000000LL;
  *a2 = 37LL;
  uint64_t result = (uint64_t)WiFiNetworkGetProperty(a1, @"RATES");
  if (result)
  {
    size_t v6 = (const __CFArray *)result;
    uint64_t result = CFArrayGetCount((CFArrayRef)result);
    if (result >= 1)
    {
      uint64_t v7 = result;
      for (CFIndex i = 0LL; i != v7; ++i)
      {
        uint64_t result = (uint64_t)CFArrayGetValueAtIndex(v6, i);
        int valuePtr = -1431655766;
        if (result)
        {
          int v9 = (const void *)result;
          CFTypeID TypeID = CFNumberGetTypeID();
          uint64_t result = CFGetTypeID(v9);
          if (TypeID == result)
          {
            uint64_t result = CFNumberGetValue((CFNumberRef)v9, kCFNumberIntType, &valuePtr);
            uint64_t v11 = valuePtr;
            if (*a3 < valuePtr) {
              *a3 = valuePtr;
            }
            if (*a2 > v11) {
              *a2 = v11;
            }
          }
        }
      }
    }
  }

  return result;
}

CFNumberRef WiFiNetworkGetRSSI(const __CFNumber *result)
{
  if (result)
  {
    Property = (const __CFNumber *)WiFiNetworkGetProperty((uint64_t)result, @"RSSI");
    return _CFTypeGetIntValue(Property);
  }

  return result;
}

CFNumberRef WiFiNetworkGetIntProperty(uint64_t a1, void *a2)
{
  Property = (const __CFNumber *)WiFiNetworkGetProperty(a1, a2);
  return _CFTypeGetIntValue(Property);
}

BOOL __WiFiNetworkIsWPAEAP(const __CFDictionary *a1)
{
  int Value = (const __CFDictionary *)CFDictionaryGetValue(a1, @"WPA_IE");
  CFTypeID v3 = (const __CFDictionary *)CFDictionaryGetValue(a1, @"RSN_IE");
  if (Value && (CFTypeID TypeID = CFDictionaryGetTypeID(), _CFValidateType(TypeID, Value)))
  {
    BOOL v5 = 1LL;
  }

  else
  {
    BOOL v5 = 0LL;
  }

  if (!v5)
  {
    if (v3)
    {
      BOOL v5 = 1LL;
      if (!__WiFiNetworkContainsAuthSelector(v3, 1)
        && !__WiFiNetworkContainsAuthSelector(v3, 0)
        && !__WiFiNetworkContainsAuthSelector(v3, 3)
        && !__WiFiNetworkContainsAuthSelector(v3, 5)
        && !__WiFiNetworkContainsAuthSelector(v3, 12))
      {
        return __WiFiNetworkContainsAuthSelector(v3, 13) != 0;
      }
    }
  }

  return v5;
}

CFDictionaryRef WiFiNetworkIsSAE(const __CFDictionary *result)
{
  if (result) {
    return __WiFiNetworkIsSAE(*((const __CFDictionary **)result + 2));
  }
  return result;
}

void WiFiNetworkSetSAE(int a1, int a2, int a3)
{
  if (a2)
  {
    BOOL v5 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, MEMORY[0x189605228]);
    values = Mutable;
    if (Mutable)
    {
      uint64_t v7 = Mutable;
      uint64_t valuePtr = 8LL;
      CFNumberRef v8 = CFNumberCreate(v5, kCFNumberCFIndexType, &valuePtr);
      if (v8)
      {
        CFNumberRef v9 = v8;
        CFArrayAppendValue(v7, v8);
        CFRelease(v9);
      }

      if (a3)
      {
        uint64_t valuePtr = 2LL;
        CFNumberRef v10 = CFNumberCreate(v5, kCFNumberCFIndexType, &valuePtr);
        if (v10)
        {
          CFNumberRef v11 = v10;
          CFArrayAppendValue(v7, v10);
          CFRelease(v11);
        }
      }

      else
      {
        WiFiNetworkSetProperty(a1, @"ALLOW_WPA2_PSK");
      }

      keys = @"IE_KEY_RSN_AUTHSELS";
      CFDictionaryRef v12 = CFDictionaryCreate( v5,  (const void **)&keys,  (const void **)&values,  1LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
      if (v12)
      {
        CFDictionaryRef v13 = v12;
        WiFiNetworkSetProperty(a1, @"RSN_IE");
        CFRelease(v13);
      }

      CFRelease(values);
    }
  }

  else
  {
    WiFiNetworkSetProperty(a1, @"RSN_IE");
  }

uint64_t WiFiNetworkIsWPAWPA2PSK(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = *(const __CFDictionary **)(result + 16);
    else {
      return __WiFiNetworkSupportsWPA2(v1);
    }
  }

  return result;
}

void WiFiNetworkSetWPA(uint64_t a1, int a2)
{
  int v2 = a1;
  if (a2)
  {
    uint64_t v3 = 2LL * (WiFiNetworkGetProperty(a1, @"EnterpriseProfile") == 0LL);
    uint64_t valuePtr = v3;
    uint64_t v4 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    values = CFNumberCreate((CFAllocatorRef)*MEMORY[0x189604DB0], kCFNumberCFIndexType, &valuePtr);
    if (values)
    {
      CFTypeRef cf = CFArrayCreate(v4, (const void **)&values, 1LL, MEMORY[0x189605228]);
      if (cf)
      {
        CFNumberRef v9 = @"IE_KEY_RSN_AUTHSELS";
        CFDictionaryRef v5 = CFDictionaryCreate(v4, (const void **)&v9, &cf, 1LL, MEMORY[0x189605240], MEMORY[0x189605250]);
        if (v5)
        {
          CFDictionaryRef v6 = v5;
          WiFiNetworkSetProperty(v2, @"RSN_IE");
          CFRelease(v6);
        }

        if (cf)
        {
          CFRelease(cf);
          CFTypeRef cf = 0LL;
        }
      }

      if (values)
      {
        CFRelease(values);
        values = 0LL;
      }
    }

    uint64_t valuePtr = v3;
    values = CFNumberCreate(v4, kCFNumberCFIndexType, &valuePtr);
    if (values)
    {
      CFTypeRef cf = CFArrayCreate(v4, (const void **)&values, 1LL, MEMORY[0x189605228]);
      if (cf)
      {
        CFNumberRef v9 = @"IE_KEY_WPA_AUTHSELS";
        CFDictionaryRef v7 = CFDictionaryCreate(v4, (const void **)&v9, &cf, 1LL, MEMORY[0x189605240], MEMORY[0x189605250]);
        if (v7)
        {
          CFDictionaryRef v8 = v7;
          WiFiNetworkSetProperty(v2, @"WPA_IE");
          CFRelease(v8);
        }

        if (cf)
        {
          CFRelease(cf);
          CFTypeRef cf = 0LL;
        }
      }

      if (values) {
        CFRelease(values);
      }
    }
  }

  else
  {
    WiFiNetworkSetProperty(a1, @"RSN_IE");
    WiFiNetworkSetProperty(v2, @"WPA_IE");
  }

void WiFiNetworkSetIntProperty(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t valuePtr = a3;
  CFNumberRef v5 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x189604DB0], kCFNumberCFIndexType, &valuePtr);
  if (v5)
  {
    CFNumberRef v6 = v5;
    WiFiNetworkSetProperty(a1, a2, v5);
    CFRelease(v6);
  }

double WiFiNetworkGetFloatProperty(uint64_t a1, void *a2)
{
  Property = WiFiNetworkGetProperty(a1, a2);
  return _CFTypeGetFloatValue(Property);
}

void WiFiNetworkSetFloatProperty(uint64_t a1, void *a2, double a3)
{
  double valuePtr = a3;
  CFNumberRef v5 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x189604DB0], kCFNumberDoubleType, &valuePtr);
  if (v5)
  {
    CFNumberRef v6 = v5;
    WiFiNetworkSetProperty(a1, a2, v5);
    CFRelease(v6);
  }

CFNumberRef WiFiNetworkIsAdHoc(uint64_t a1)
{
  uint64_t result = (const __CFNumber *)WiFiNetworkGetProperty(a1, @"AP_MODE");
  if (result)
  {
    __int16 valuePtr = -21846;
    uint64_t result = (const __CFNumber *)CFNumberGetValue(result, kCFNumberSInt16Type, &valuePtr);
    if ((_DWORD)result) {
      return (const __CFNumber *)(valuePtr == 1);
    }
  }

  return result;
}

uint64_t WiFiNetworkIsHidden(const void *a1)
{
  Property = (const __CFNumber *)WiFiNetworkGetProperty((uint64_t)a1, @"HIDDEN_NETWORK");
  Intint Value = _CFTypeGetIntValue(Property);
  if (IntValue) {
    goto LABEL_2;
  }
  CFNumberRef v5 = (const __CFNumber *)WiFiNetworkGetProperty((uint64_t)a1, @"scanWasDirected");
  if (!_CFTypeGetIntValue(v5))
  {
    Intint Value = WiFiNetworkIsHiddenSSID(a1);
LABEL_2:
    unsigned int v4 = 0;
    goto LABEL_5;
  }

  Intint Value = 0;
  unsigned int v4 = 1;
LABEL_5:
  if (IntValue) {
    return 1LL;
  }
  else {
    return v4;
  }
}

BOOL WiFiNetworkIsHiddenSSID(const void *a1)
{
  SSID = WiFiNetworkGetSSID(a1);
  if (SSID && (int v2 = SSID, !CFEqual(SSID, &stru_189E8DBC8))) {
    return CFEqual(v2, @" ") != 0;
  }
  else {
    return 1LL;
  }
}

BOOL WiFiNetworkIsSSIDAmbiguous(uint64_t a1)
{
  Property = WiFiNetworkGetProperty(a1, @"AmbiguousSSIDs");
  return Property && Property == (const void *)*MEMORY[0x189604DE8];
}

BOOL WiFiNetworkIsSSIDUnmappable(const void *a1)
{
  SSID = (const __CFString *)WiFiNetworkGetSSID(a1);
  return SSID && CFStringHasSuffix(SSID, @"_nomap");
}

uint64_t WiFiNetworkGetDirectedState(const void *a1)
{
  Property = (const __CFNumber *)WiFiNetworkGetProperty((uint64_t)a1, @"UserDirected");
  Intint Value = _CFTypeGetIntValue(Property);
  if (IntValue || !WiFiNetworkIsHidden(a1))
  {
    unsigned int v4 = 0;
  }

  else
  {
    WiFiNetworkSetProperty((uint64_t)a1, @"UserDirected", (const void *)*MEMORY[0x189604DE8]);
    unsigned int v4 = 1;
  }

  if (IntValue) {
    return 1LL;
  }
  else {
    return v4;
  }
}

void WiFiNetworkSetDirectedState(uint64_t a1, int a2)
{
  int v2 = (const void **)MEMORY[0x189604DE8];
  if (!a2) {
    int v2 = (const void **)MEMORY[0x189604DE0];
  }
  WiFiNetworkSetProperty(a1, @"UserDirected", *v2);
}

BOOL WiFiNetworkIsCaptive(uint64_t a1)
{
  return MEMORY[0x18960D5A8]
      && CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), (const void *)*MEMORY[0x18960D690]) == (const void *)*MEMORY[0x189604DE8];
}

BOOL WiFiNetworkWasCaptive(uint64_t a1)
{
  return MEMORY[0x18960D5A8]
      && CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), (const void *)*MEMORY[0x18960D6D8]) == (const void *)*MEMORY[0x189604DE8];
}

const void *WiFiNetworkGetAPEnv(uint64_t a1)
{
  if (a1 && (uint64_t v1 = *(const __CFDictionary **)(a1 + 16)) != 0LL) {
    return CFDictionaryGetValue(v1, @"DiagnosticsBssEnv");
  }
  else {
    return 0LL;
  }
}

uint64_t WiFiNetworkGetCaptiveStatus(uint64_t a1)
{
  if (!MEMORY[0x18960D5A8]) {
    return 0LL;
  }
  value = 0LL;
  int ValueIfPresent = CFDictionaryGetValueIfPresent( *(CFDictionaryRef *)(a1 + 16),  (const void *)*MEMORY[0x18960D690],  (const void **)&value);
  else {
    unsigned int v2 = 1;
  }
  if (ValueIfPresent) {
    return v2;
  }
  else {
    return 0LL;
  }
}

BOOL WiFiNetworkIsWoWAllowed(uint64_t a1)
{
  if (!a1) {
    goto LABEL_17;
  }
  unsigned int v2 = *(const void **)(a1 + 16);
  if (!v2) {
    goto LABEL_17;
  }
  CFTypeID v3 = CFGetTypeID(v2);
  if (v3 != CFDictionaryGetTypeID()) {
    goto LABEL_17;
  }
  int Value = (const __CFData *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"IE");
  if (!Value) {
    return 1LL;
  }
  CFNumberRef v5 = Value;
  CFTypeID v6 = CFGetTypeID(Value);
  if (v6 != CFDataGetTypeID())
  {
LABEL_17:
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
    return 1LL;
  }

  BytePtr = CFDataGetBytePtr(v5);
  if (!BytePtr) {
    return 1LL;
  }
  CFDictionaryRef v8 = BytePtr;
  CFIndex Length = CFDataGetLength(v5);
  if (Length << 32 < 1) {
    return 1LL;
  }
  uint64_t v10 = 0LL;
  while (*v8 != 221 || v8[1] != 10 || *(_DWORD *)(v8 + 2) != 116528896 || *(_DWORD *)(v8 + 5) != 50397446)
  {
    uint64_t v12 = v8[1] + 2LL;
    v10 += v12;
    v8 += v12;
  }

  return (v8[9] & 3) != 1;
}

uint64_t WiFiNetworkIsApplePersonalHotspot(uint64_t a1)
{
  if (!a1) {
    goto LABEL_20;
  }
  unsigned int v2 = *(const void **)(a1 + 16);
  if (!v2) {
    goto LABEL_20;
  }
  CFTypeID v3 = CFGetTypeID(v2);
  if (v3 != CFDictionaryGetTypeID()) {
    goto LABEL_20;
  }
  int Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"IsPersonalHotspot");
  if (Value && CFEqual(Value, (CFTypeRef)*MEMORY[0x189604DE8])) {
    return 1LL;
  }
  uint64_t result = (uint64_t)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"IE");
  if (result)
  {
    CFTypeID v6 = (const __CFData *)result;
    CFTypeID v7 = CFGetTypeID((CFTypeRef)result);
    if (v7 == CFDataGetTypeID())
    {
      uint64_t result = (uint64_t)CFDataGetBytePtr(v6);
      if (!result) {
        return result;
      }
      CFDictionaryRef v8 = (unsigned __int8 *)result;
      CFIndex Length = CFDataGetLength(v6);
      if (Length << 32 >= 1)
      {
        uint64_t v10 = 0LL;
        while (*v8 != 221 || v8[1] != 10 || *(_DWORD *)(v8 + 2) != 116528896 || *(_DWORD *)(v8 + 5) != 50397446)
        {
          uint64_t v12 = v8[1] + 2LL;
          v10 += v12;
          v8 += v12;
        }

        return 1LL;
      }

      return 0LL;
    }

CFDataRef WiFiNetworkFoundNanIe(uint64_t a1)
{
  if (!a1 || (v2 = *(const void **)(a1 + 16)) == 0LL || (CFTypeID v3 = CFGetTypeID(v2), v3 != CFDictionaryGetTypeID()))
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
    return 0LL;
  }

  uint64_t result = (const __CFData *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"IE");
  if (!result) {
    return result;
  }
  CFNumberRef v5 = result;
  uint64_t result = (const __CFData *)CFDataGetBytePtr(result);
  if (!result) {
    return result;
  }
  CFTypeID v6 = (unsigned __int8 *)result;
  CFIndex Length = CFDataGetLength(v5);
  if (Length << 32 < 1) {
    return 0LL;
  }
  uint64_t v8 = 0LL;
  unint64_t v9 = (unint64_t)&v6[(int)Length];
  while (1)
  {
    uint64_t v10 = v6 + 6;
    if (*v6 == 221
      && (unint64_t)v10 <= v9
      && *(_DWORD *)(v6 + 2) == 116528896
      && (unint64_t)(v6 + 9) <= v9)
    {
      break;
    }

uint64_t WiFiNetworkIsNanPH(uint64_t a1)
{
  if (a1)
  {
    uint64_t result = WiFiNetworkIsApplePersonalHotspot(a1);
    if ((_DWORD)result)
    {
      uint64_t result = (uint64_t)WiFiNetworkFoundNanIe(a1);
      if ((_DWORD)result) {
        return WiFiNetworkGetProperty(a1, @"WiFiNetworkNANServiceID") != 0LL;
      }
    }
  }

  else
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
    return 0LL;
  }

  return result;
}

CFDataRef WiFiNetworkGetBtMacFromIe(uint64_t a1, uint64_t a2)
{
  uint64_t result = (const __CFData *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"IE");
  if (result)
  {
    unsigned int v4 = result;
    uint64_t result = (const __CFData *)CFDataGetBytePtr(result);
    if (result)
    {
      CFNumberRef v5 = (unsigned __int8 *)result;
      CFIndex Length = CFDataGetLength(v4);
      if (Length << 32 < 1)
      {
        return 0LL;
      }

      else
      {
        uint64_t v7 = 0LL;
        while (*v5 != 221 || v5[1] != 13 || *(_DWORD *)(v5 + 2) != 116528896 || *(_DWORD *)(v5 + 5) != 100729350)
        {
          uint64_t v9 = v5[1] + 2LL;
          v7 += v9;
          v5 += v9;
        }

        int v10 = *(_DWORD *)(v5 + 9);
        *(_WORD *)(a2 + 4) = *(_WORD *)(v5 + 13);
        *(_DWORD *)a2 = v10;
        objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
        return (const __CFData *)1;
      }
    }
  }

  return result;
}

const UInt8 *WiFiNetworkCopyNanPHSServiceNameFromIe(uint64_t a1)
{
  unsigned int v2 = malloc(0x11uLL);
  int Value = (const __CFData *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"IE");
  if (!Value) {
    goto LABEL_23;
  }
  unsigned int v4 = Value;
  BytePtr = CFDataGetBytePtr(Value);
  if (!BytePtr) {
    goto LABEL_24;
  }
  CFIndex Length = CFDataGetLength(v4);
  if (Length << 32 < 1)
  {
LABEL_23:
    BytePtr = 0LL;
    goto LABEL_24;
  }

  uint64_t v7 = 0LL;
  unint64_t v8 = (unint64_t)&BytePtr[(int)Length];
  while (1)
  {
    uint64_t v9 = (unsigned __int16 *)(BytePtr + 6);
    if (*BytePtr == 221
      && (unint64_t)v9 <= v8
      && *(_DWORD *)(BytePtr + 2) == 116528896
      && (unint64_t)(BytePtr + 9) <= v8)
    {
      break;
    }

const UInt8 *WiFiNetworkGet11dCountryCodeFromIe(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  int Value = (const __CFData *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"IE");
  if (*a3 < 3u || Value == 0LL) {
    return 0LL;
  }
  uint64_t v7 = Value;
  uint64_t result = CFDataGetBytePtr(Value);
  if (!result) {
    return result;
  }
  uint64_t v9 = result;
  CFIndex Length = CFDataGetLength(v7);
  if (Length << 32 < 1) {
    return 0LL;
  }
  uint64_t v11 = 0LL;
  while (1)
  {
    uint64_t v12 = v9[1];
    uint64_t v14 = v12 + 2;
    v11 += v14;
    v9 += v14;
  }

  __int16 v15 = *((_WORD *)v9 + 1);
  *(_BYTE *)(a2 + 2) = v9[4];
  *(_WORD *)a2 = v15;
  *a3 = 3;
  return (const UInt8 *)1;
}

BOOL WiFiNetworkIsWPA(BOOL result)
{
  if (result)
  {
    uint64_t v1 = result;
    unsigned int v2 = *(const __CFDictionary **)(result + 16);
    return __WiFiNetworkSupportsWPA(v2)
  }

  return result;
}

CFDictionaryRef __WiFiNetworkIsSAE(const __CFDictionary *a1)
{
  uint64_t result = (const __CFDictionary *)CFDictionaryGetValue(a1, @"RSN_IE");
  if (result)
  {
    unsigned int v2 = result;
    int v3 = __WiFiNetworkContainsAuthSelector(result, 8);
    int v4 = __WiFiNetworkContainsAuthSelector(v2, 9) | v3;
    int v5 = __WiFiNetworkContainsAuthSelector(v2, 24);
    return v4 | v5 | __WiFiNetworkContainsAuthSelector(v2, 25);
  }

  return result;
}

uint64_t WiFiNetworkSupportsWPA(uint64_t result)
{
  if (result) {
    return __WiFiNetworkSupportsWPA(*(const __CFDictionary **)(result + 16));
  }
  return result;
}

uint64_t __WiFiNetworkSupportsWPA(const __CFDictionary *a1)
{
  int Value = (const __CFDictionary *)CFDictionaryGetValue(a1, @"WPA_IE");
  if (Value && (v2 = Value, CFTypeID TypeID = CFDictionaryGetTypeID(), _CFValidateType(TypeID, v2))) {
    return __WiFiNetworkContainsAuthSelector(v2, 2);
  }
  else {
    return 0LL;
  }
}

uint64_t WiFiNetworkSupportsWPA2(uint64_t result)
{
  if (result) {
    return __WiFiNetworkSupportsWPA2(*(const __CFDictionary **)(result + 16));
  }
  return result;
}

uint64_t __WiFiNetworkSupportsWPA2(const __CFDictionary *a1)
{
  if (__WiFiNetworkContainsWPA2Auth(a1))
  {
    LOBYTE(result) = 1;
  }

  else
  {
    int Value = (const __CFNumber *)CFDictionaryGetValue(a1, @"ALLOW_WPA2_PSK");
    LOBYTE(result) = _CFTypeGetIntValue(Value);
  }

  return result;
}

CFDictionaryRef WiFiNetworkContainsWPA2Auth(const __CFDictionary *result)
{
  if (result) {
    return __WiFiNetworkContainsWPA2Auth(*((const __CFDictionary **)result + 2));
  }
  return result;
}

CFDictionaryRef __WiFiNetworkContainsWPA2Auth(const __CFDictionary *result)
{
  if (result)
  {
    uint64_t result = (const __CFDictionary *)CFDictionaryGetValue(result, @"RSN_IE");
    if (result)
    {
      uint64_t v1 = result;
      if (__WiFiNetworkContainsAuthSelector(result, 2)
        || __WiFiNetworkContainsAuthSelector(v1, 4))
      {
        return (const __CFDictionary *)1;
      }

      else
      {
        return __WiFiNetworkContainsAuthSelector(v1, 6 != 0);
      }
    }
  }

  return result;
}

CFDictionaryRef WiFiNetworkSupportsWPA3(const __CFDictionary *result)
{
  if (result) {
    return __WiFiNetworkIsSAE(*((const __CFDictionary **)result + 2));
  }
  return result;
}

void *WiFiNetworkIsBcnProtCapable(void *result)
{
  if (result)
  {
    uint64_t v1 = (const __CFDictionary *)*((void *)result + 2);
    value = 0LL;
    int valuePtr = 0;
    unsigned int v2 = (const __CFDictionary *)CFDictionaryGetValue(v1, @"EXT_CAPS");
    uint64_t result = 0LL;
    if (v2)
    {
      uint64_t result = (void *)CFDictionaryGetValueIfPresent(v2, @"BEACON_PROTECTION", (const void **)&value);
      if ((_DWORD)result)
      {
        uint64_t result = value;
        if (value)
        {
          CFNumberGetValue((CFNumberRef)value, kCFNumberIntType, &valuePtr);
          return (void *)(valuePtr == 1);
        }
      }
    }
  }

  return result;
}

CFDictionaryRef *WiFiNetworkIsOCVCapable(CFDictionaryRef *result)
{
  if (result)
  {
    uint64_t result = (CFDictionaryRef *)CFDictionaryGetValue(result[2], @"RSN_IE");
    if (result)
    {
      uint64_t result = (CFDictionaryRef *)CFDictionaryGetValue((CFDictionaryRef)result, @"IE_KEY_RSN_CAPS");
      if (result)
      {
        uint64_t result = (CFDictionaryRef *)CFDictionaryGetValue((CFDictionaryRef)result, @"OCV");
        if (result) {
          return (CFDictionaryRef *)(CFBooleanGetValue((CFBooleanRef)result) == 1);
        }
      }
    }
  }

  return result;
}

CFDictionaryRef WiFiNetworkIsSAEPK(const __CFDictionary *result)
{
  if (result) {
    return __WiFiNetworkIsSAEPK(*((const __CFDictionary **)result + 2));
  }
  return result;
}

CFDictionaryRef __WiFiNetworkIsSAEPK(const __CFDictionary *a1)
{
  uint64_t result = __WiFiNetworkIsSAE(a1);
  if ((_DWORD)result)
  {
    uint64_t result = (const __CFDictionary *)CFDictionaryGetValue(a1, @"RSN_XE");
    if (result)
    {
      uint64_t result = (const __CFDictionary *)CFDictionaryGetValue(result, @"IE_KEY_RSNXE_CAPS");
      if (result)
      {
        int Value = (const __CFBoolean *)CFDictionaryGetValue(result, @"RSNXE_SAE_PK");
        return CFBooleanGetValue(Value == 1);
      }
    }
  }

  return result;
}

CFDictionaryRef WiFiNetworkIsSAEPKPasswordUsed(const __CFDictionary *result)
{
  if (result)
  {
    uint64_t v1 = (const __CFDictionary *)*((void *)result + 2);
    value = 0LL;
    uint64_t result = __WiFiNetworkIsSAE(v1);
    if ((_DWORD)result)
    {
      uint64_t result = __WiFiNetworkIsSAEPK(v1);
      if ((_DWORD)result)
      {
        uint64_t result = (const __CFDictionary *)CFDictionaryGetValue(v1, @"EXT_CAPS");
        if (result)
        {
          int valuePtr = -1431655766;
          uint64_t result = (const __CFDictionary *)CFDictionaryGetValueIfPresent( result,  @"SAE_PK_PASSWD_USED",  (const void **)&value);
          if ((_DWORD)result) {
            return CFNumberGetValue((CFNumberRefvalue, kCFNumberSInt32Type, &valuePtr)
          }
                                         && valuePtr == 1);
        }
      }
    }
  }

  return result;
}

BOOL WiFiNetworkIsWAPIPSK(BOOL result)
{
  if (result) {
    return (~__WiFiNetworkGetWAPIPolicy(*(const __CFDictionary **)(result + 16)) & 7) == 0;
  }
  return result;
}

CFNumberRef __WiFiNetworkGetWAPIPolicy(const __CFDictionary *a1)
{
  unsigned int valuePtr = 0;
  uint64_t result = (const __CFNumber *)CFDictionaryGetValue(a1, @"WAPI");
  if (result)
  {
    CFNumberGetValue(result, kCFNumberIntType, &valuePtr);
    return (const __CFNumber *)valuePtr;
  }

  return result;
}

BOOL WiFiNetworkIsWAPICERT(BOOL result)
{
  if (result) {
    return (~__WiFiNetworkGetWAPIPolicy(*(const __CFDictionary **)(result + 16)) & 0xB) == 0;
  }
  return result;
}

BOOL WiFiNetworkIsWAPI(BOOL result)
{
  if (result)
  {
    uint64_t v1 = result;
    return (~__WiFiNetworkGetWAPIPolicy(*(const __CFDictionary **)(result + 16)) & 0xB) == 0
        || (~__WiFiNetworkGetWAPIPolicy(*(const __CFDictionary **)(v1 + 16)) & 7) == 0;
  }

  return result;
}

uint64_t WiFiNetworkIsOWETransition(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = *(const __CFDictionary **)(result + 16);
    int Value = (const __CFNumber *)CFDictionaryGetValue(v1, @"SCAN_RESULT_OWE_MULTI_SSID");
    LOBYTE(result) = _CFTypeGetIntValue(Value);
    if (!(_BYTE)result)
    {
      int v3 = (const __CFNumber *)CFDictionaryGetValue(v1, @"ALLOW_OWE_TSN");
      LOBYTE(result) = _CFTypeGetIntValue(v3);
    }
  }

  return result;
}

CFDictionaryRef WiFiNetworkIsOWEOnly(const __CFDictionary *result)
{
  if (result) {
    return __WiFiNetworkIsOWEOnly(*((const __CFDictionary **)result + 2));
  }
  return result;
}

CFDictionaryRef __WiFiNetworkIsOWEOnly(const __CFDictionary *a1)
{
  uint64_t result = (const __CFDictionary *)CFDictionaryGetValue(a1, @"RSN_IE");
  if (result)
  {
    uint64_t result = (const __CFDictionary *)__WiFiNetworkContainsAuthSelector(result, 18);
    if ((_DWORD)result)
    {
      int Value = (const __CFNumber *)CFDictionaryGetValue(a1, @"SCAN_RESULT_OWE_MULTI_SSID");
      if (_CFTypeGetIntValue(Value))
      {
        return 0LL;
      }

      else
      {
        int v4 = (const __CFNumber *)CFDictionaryGetValue(a1, @"ALLOW_OWE_TSN");
        return _CFTypeGetIntValue(v4 == 0LL);
      }
    }
  }

  return result;
}

BOOL __WiFiNetworkIsEAP(const __CFDictionary *a1)
{
  return __WiFiNetworkIsWPAEAP(a1) || CFDictionaryGetValue(a1, @"EnterpriseProfile") != 0LL;
}

BOOL WiFiNetworkAllowsPasswordBasedEAPType(BOOL result)
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t result = WiFiNetworkIsEAP(result);
    if (result) {
      return __WiFiNetworkIsEAPWithType(v1, 17)
    }
          || __WiFiNetworkIsEAPWithType(v1, 21)
          || __WiFiNetworkIsEAPWithType(v1, 25)
  }

  return result;
}

CFArrayRef __WiFiNetworkIsEAPWithType(uint64_t a1, int a2)
{
  int valuePtr = a2;
  uint64_t result = (const __CFArray *)WiFiNetworkIsEAP(a1);
  if ((_DWORD)result)
  {
    uint64_t result = (const __CFArray *)WiFiNetworkGetProperty(a1, @"AcceptEAPTypes");
    if (result)
    {
      int v4 = result;
      uint64_t result = CFNumberCreate((CFAllocatorRef)*MEMORY[0x189604DB0], kCFNumberIntType, &valuePtr);
      if (result)
      {
        int v5 = result;
        v8.length = CFArrayGetCount(v4);
        v8.location = 0LL;
        FirstIndexOfint Value = CFArrayGetFirstIndexOfValue(v4, v8, v5);
        CFRelease(v5);
        return (const __CFArray *)(FirstIndexOfValue != -1);
      }
    }
  }

  return result;
}

BOOL WiFiNetworkIsProfileBased(uint64_t a1)
{
  return a1 && CFDictionaryContainsKey(*(CFDictionaryRef *)(a1 + 16), @"PayloadUUID");
}

BOOL WiFiNetworkIsShareble(uint64_t a1)
{
  int valuePtr = 0;
  if (!a1) {
    return 1LL;
  }
  int Value = (const __CFNumber *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"IsWiFiNetworkShareble");
  if (!Value) {
    return 1LL;
  }
  CFNumberGetValue(Value, kCFNumberIntType, &valuePtr);
  return valuePtr != 0;
}

BOOL WiFiNetworkIsAppBased(uint64_t a1)
{
  return a1 && CFDictionaryContainsKey(*(CFDictionaryRef *)(a1 + 16), @"BundleIdentifier");
}

void WiFiNetworkGetTimeToExpire(uint64_t a1)
{
  if (WiFiNetworkGetExpireDate(a1) != 0.0) {
    CFAbsoluteTimeGetCurrent();
  }
}

double WiFiNetworkGetExpireDate(uint64_t a1)
{
  double valuePtr = 0.0;
  if (!a1)
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
    return 0.0;
  }

  Property = (const __CFNumber *)WiFiNetworkGetProperty(a1, @"WiFiNetworkExpirationDate");
  if (!Property) {
    return 0.0;
  }
  CFNumberGetValue(Property, kCFNumberDoubleType, &valuePtr);
  return valuePtr;
}

void WiFiNetworkSetExpireDate(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    if (a2)
    {
      double v3 = MEMORY[0x186E3B410](a2);
      WiFiNetworkSetFloatProperty(a1, @"WiFiNetworkExpirationDate", v3);
    }

    else
    {
      objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
      WiFiNetworkSetProperty(a1, @"WiFiNetworkExpirationDate", 0LL);
    }
  }

BOOL WiFiNetworkIsExpirable(uint64_t a1)
{
  if (a1) {
    return WiFiNetworkGetProperty(a1, @"WiFiNetworkExpirationDate") != 0LL;
  }
  objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
  return 0LL;
}

void WiFiNetworkSetWEP(uint64_t a1, int a2)
{
  unsigned int v2 = (const void **)MEMORY[0x189604DE8];
  if (!a2) {
    unsigned int v2 = (const void **)MEMORY[0x189604DE0];
  }
  WiFiNetworkSetProperty(a1, @"WEP", *v2);
}

void WiFiNetworkSetOWE(uint64_t a1, int a2)
{
  if (a2)
  {
    double v3 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, MEMORY[0x189605228]);
    values = Mutable;
    if (Mutable)
    {
      int v5 = Mutable;
      uint64_t valuePtr = 18LL;
      CFNumberRef v6 = CFNumberCreate(v3, kCFNumberCFIndexType, &valuePtr);
      if (v6)
      {
        CFNumberRef v7 = v6;
        CFArrayAppendValue(v5, v6);
        CFRelease(v7);
      }

      keys = @"IE_KEY_RSN_AUTHSELS";
      CFDictionaryRef v8 = CFDictionaryCreate( v3,  (const void **)&keys,  (const void **)&values,  1LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
      if (v8)
      {
        CFDictionaryRef v9 = v8;
        WiFiNetworkSetProperty(a1, @"RSN_IE", v8);
        CFRelease(v9);
      }

      CFRelease(values);
    }
  }

  else
  {
    WiFiNetworkSetProperty(a1, @"RSN_IE", 0LL);
  }

void WiFiNetworkSetEAP(uint64_t a1, int a2)
{
  if (a2)
  {
    uint64_t valuePtr = 1LL;
    double v3 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    values = CFNumberCreate((CFAllocatorRef)*MEMORY[0x189604DB0], kCFNumberCFIndexType, &valuePtr);
    if (values)
    {
      CFTypeRef cf = CFArrayCreate(v3, (const void **)&values, 1LL, MEMORY[0x189605228]);
      if (cf)
      {
        CFDictionaryRef v8 = @"IE_KEY_RSN_AUTHSELS";
        CFDictionaryRef v4 = CFDictionaryCreate(v3, (const void **)&v8, &cf, 1LL, MEMORY[0x189605240], MEMORY[0x189605250]);
        if (v4)
        {
          CFDictionaryRef v5 = v4;
          WiFiNetworkSetProperty(a1, @"RSN_IE", v4);
          CFRelease(v5);
        }

        if (cf)
        {
          CFRelease(cf);
          CFTypeRef cf = 0LL;
        }
      }

      if (values)
      {
        CFRelease(values);
        values = 0LL;
      }
    }

    uint64_t valuePtr = 1LL;
    values = CFNumberCreate(v3, kCFNumberCFIndexType, &valuePtr);
    if (values)
    {
      CFTypeRef cf = CFArrayCreate(v3, (const void **)&values, 1LL, MEMORY[0x189605228]);
      if (cf)
      {
        CFDictionaryRef v8 = @"IE_KEY_WPA_AUTHSELS";
        CFDictionaryRef v6 = CFDictionaryCreate(v3, (const void **)&v8, &cf, 1LL, MEMORY[0x189605240], MEMORY[0x189605250]);
        if (v6)
        {
          CFDictionaryRef v7 = v6;
          WiFiNetworkSetProperty(a1, @"WPA_IE", v6);
          CFRelease(v7);
        }

        if (cf)
        {
          CFRelease(cf);
          CFTypeRef cf = 0LL;
        }
      }

      if (values) {
        CFRelease(values);
      }
    }
  }

  else
  {
    WiFiNetworkSetProperty(a1, @"RSN_IE", 0LL);
    WiFiNetworkSetProperty(a1, @"WPA_IE", 0LL);
    WiFiNetworkSetProperty(a1, @"EnterpriseProfile", 0LL);
  }

BOOL WiFiNetworkRequiresPassword(uint64_t a1)
{
  if (!WiFiNetworkIsEAP(a1))
  {
    if (!WiFiNetworkIsWPAWPA2PSK(a1))
    {
      if (a1)
      {
        if (CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"WEP") != (const void *)*MEMORY[0x189604DE8]
          && !WiFiNetworkIsWAPI(a1))
        {
          return __WiFiNetworkIsSAE(*(const __CFDictionary **)(a1 + 16)) != 0;
        }
      }

      else
      {
        BOOL result = WiFiNetworkIsWAPI(0LL);
        if (!result) {
          return result;
        }
      }
    }

    return 1LL;
  }

  return !WiFiNetworkRequiresIdentity(a1)
}

CFArrayRef WiFiNetworkRequiresIdentity(uint64_t a1)
{
  if (!WiFiNetworkIsEAP(a1)) {
    return 0LL;
  }
  Property = (const __CFArray *)WiFiNetworkGetProperty(a1, @"AcceptEAPTypes");
  if (Property)
  {
    int valuePtr = 13;
    CFNumberRef v3 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x189604DB0], kCFNumberIntType, &valuePtr);
    if (v3)
    {
      CFNumberRef v4 = v3;
      v7.length = CFArrayGetCount(Property);
      v7.location = 0LL;
      Property = (const __CFArray *)(CFArrayGetFirstIndexOfValue(Property, v7, v4) != -1);
      CFRelease(v4);
      return Property;
    }

    return 0LL;
  }

  return Property;
}

BOOL WiFiNetworkRequiresUsername(uint64_t a1)
{
  int v12 = 18;
  int valuePtr = 13;
  BOOL result = WiFiNetworkIsEAP(a1);
  if (result)
  {
    Property = (const __CFArray *)WiFiNetworkGetProperty(a1, @"AcceptEAPTypes");
    if (Property
      && (CFNumberRef v4 = Property,
          CFDictionaryRef v5 = (const __CFAllocator *)*MEMORY[0x189604DB0],
          (CFNumberRef v6 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x189604DB0], kCFNumberIntType, &valuePtr)) != 0LL))
    {
      CFNumberRef v7 = v6;
      v14.length = CFArrayGetCount(v4);
      v14.location = 0LL;
      FirstIndexOfint Value = CFArrayGetFirstIndexOfValue(v4, v14, v7);
      CFRelease(v7);
      CFNumberRef v9 = CFNumberCreate(v5, kCFNumberIntType, &v12);
      if (v9)
      {
        CFNumberRef v10 = v9;
        v15.length = CFArrayGetCount(v4);
        v15.location = 0LL;
        CFIndex v11 = CFArrayGetFirstIndexOfValue(v4, v15, v10);
        CFRelease(v10);
      }

      else
      {
        CFIndex v11 = -1LL;
      }

      if (FirstIndexOfValue != -1) {
        return 0LL;
      }
    }

    else
    {
      CFIndex v11 = -1LL;
    }

    return v11 == -1;
  }

  return result;
}

const void *WiFiNetworkRequiresOneTimePassword(const void *result)
{
  if (result)
  {
    BOOL result = WiFiNetworkGetProperty((uint64_t)result, @"OneTimeUserPassword");
    if (result) {
      return (const void *)(CFEqual(result, (CFTypeRef)*MEMORY[0x189604DE8]) != 0);
    }
  }

  return result;
}

uint64_t WiFiNetworkGetAuthFlags(uint64_t a1)
{
  return __WiFiNetworkGetAuthFlags(*(const __CFDictionary **)(a1 + 16));
}

uint64_t __WiFiNetworkGetAuthFlags(const __CFDictionary *a1)
{
  else {
    int v2 = 2 * (__WiFiNetworkSupportsWPA2(a1) != 0);
  }
  if (__WiFiNetworkIsEAP(a1)) {
    v2 |= 8u;
  }
  unsigned int v3 = v2 | (CFDictionaryGetValue(a1, @"WEP") == (const void *)*MEMORY[0x189604DE8]);
  else {
    return v3;
  }
}

uint64_t WiFiNetworkCompareAuthFlags(unsigned int a1, unsigned int a2)
{
  if ((a1 & a2 & 4) == 0 || ((a2 ^ a1) & 8) != 0)
  {
    if (a1 >= a2) {
      unsigned int v8 = 0;
    }
    else {
      unsigned int v8 = -1;
    }
    if (a1 <= a2) {
      return v8;
    }
    else {
      return 1LL;
    }
  }

  else
  {
    unsigned int v2 = a1 & 0xFFFFFFFB;
    unsigned int v3 = a2 & 0xFFFFFFFB;
    if ((a1 & 0xFFFFFFFB) > (a2 & 0xFFFFFFFB)) {
      int v4 = 1;
    }
    else {
      int v4 = -1;
    }
    if (v3) {
      int v5 = v4;
    }
    else {
      int v5 = -1;
    }
    if (v2) {
      unsigned int v6 = v5;
    }
    else {
      unsigned int v6 = 1;
    }
    if (v2 == v3) {
      return 0LL;
    }
    else {
      return v6;
    }
  }

uint64_t WiFiNetworkIsSameSecurity(const __CFDictionary **cf, const __CFDictionary **a2)
{
  uint64_t result = 0LL;
  if (cf && a2)
  {
    CFTypeID v5 = CFGetTypeID(cf);
    uint64_t v6 = __kWiFiNetworkTypeID;
    if (!__kWiFiNetworkTypeID)
    {
      pthread_once(&__wifiNetworkTypeInit, (void (*)(void))__WiFiNetworkRegister);
      uint64_t v6 = __kWiFiNetworkTypeID;
    }

    if (v5 != v6) {
      return 0LL;
    }
    CFTypeID v7 = CFGetTypeID(a2);
    uint64_t v8 = __kWiFiNetworkTypeID;
    if (!__kWiFiNetworkTypeID)
    {
      pthread_once(&__wifiNetworkTypeInit, (void (*)(void))__WiFiNetworkRegister);
      uint64_t v8 = __kWiFiNetworkTypeID;
    }

    if (v7 != v8) {
      return 0LL;
    }
    int AuthFlags = __WiFiNetworkGetAuthFlags(cf[2]);
    int v10 = __WiFiNetworkGetAuthFlags(a2[2]);
    int v33 = __WiFiNetworkIsSAE(cf[2])
    int v30 = v10;
    int v13 = __WiFiNetworkIsSAE(a2[2])
    unsigned int v31 = __WiFiNetworkIsOWEOnly(cf[2]);
    unsigned int v32 = __WiFiNetworkIsOWEOnly(a2[2]);
    unint64_t Value = (unint64_t)CFDictionaryGetValue(cf[2], @"ALLOW_WPA2_PSK");
    unint64_t v15 = (unint64_t)CFDictionaryGetValue(a2[2], @"ALLOW_WPA2_PSK");
    unint64_t v16 = (unint64_t)CFDictionaryGetValue(cf[2], @"ALLOW_OWE_TSN");
    unint64_t v17 = (unint64_t)CFDictionaryGetValue(a2[2], @"ALLOW_OWE_TSN");
    int v18 = (Value | v16) == 0;
    int v19 = (v15 | v17) == 0;
    if (v18 != v19)
    {
      unint64_t v20 = v17;
      int v29 = AuthFlags;
      if (v33)
      {
        BOOL v21 = WiFiNetworkGetOperatingBand((uint64_t)cf) != 3;
        if ((v13 & 1) == 0)
        {
LABEL_20:
          unsigned int v22 = (const void *)*MEMORY[0x189604DE8];
LABEL_31:
          int AuthFlags = v29;
          if ((v19 & v13) == 1)
          {
            int OperatingBand = WiFiNetworkGetOperatingBand((uint64_t)a2);
            int v26 = v30;
            if (OperatingBand == 3) {
              int v26 = v30 | 2;
            }
            int v30 = v26;
          }

          BOOL v27 = v31 && WiFiNetworkGetOperatingBand((uint64_t)cf) != 3;
          if (v32)
          {
            int v28 = WiFiNetworkGetOperatingBand((uint64_t)a2);
          }

LABEL_23:
          if (!AuthFlags || !v30 || (v30 & AuthFlags) != 0) {
            return (AuthFlags == 0) ^ (v30 != 0);
          }
          return 0LL;
        }
      }

      else
      {
        BOOL v21 = 0;
        if ((v13 & 1) == 0) {
          goto LABEL_20;
        }
      }

      int v23 = WiFiNetworkGetOperatingBand((uint64_t)a2);
      BOOL v24 = Value == *MEMORY[0x189604DE8];
      unsigned int v22 = (const void *)*MEMORY[0x189604DE8];
      if (v24 && v23 != 3) {
        return 0LL;
      }
      goto LABEL_31;
    }

    uint64_t result = 0LL;
    if (v33 == v13 && v31 == v32) {
      goto LABEL_23;
    }
  }

  return result;
}

      mach_msg_destroy((mach_msg_header_t *)msg);
      return v12;
    }

    mig_dealloc_special_reply_port();
  }

  return v12;
}

      mach_msg_destroy(&v15);
      return v12;
    }

    mig_dealloc_special_reply_port();
  }

  return v12;
}

      mach_msg_destroy(&v17);
      return v14;
    }

    mig_dealloc_special_reply_port();
  }

  return v14;
}

      mach_msg_destroy(&v17);
      return v14;
    }

    mig_dealloc_special_reply_port();
  }

  return v14;
}

      mach_msg_destroy(&v15);
      return v12;
    }

    mig_dealloc_special_reply_port();
  }

  return v12;
}

      mach_msg_destroy(&v15);
      return v12;
    }

    mig_dealloc_special_reply_port();
  }

  return v12;
}

uint64_t WiFiNetworkGetOperatingBand(uint64_t result)
{
  int v9 = 0;
  if (result)
  {
    uint64_t v1 = (const void *)result;
    CFTypeID v2 = CFGetTypeID((CFTypeRef)result);
    uint64_t v3 = __kWiFiNetworkTypeID;
    if (!__kWiFiNetworkTypeID)
    {
      pthread_once(&__wifiNetworkTypeInit, (void (*)(void))__WiFiNetworkRegister);
      uint64_t v3 = __kWiFiNetworkTypeID;
    }

    if (v2 == v3)
    {
      Property = WiFiNetworkGetProperty((uint64_t)v1, @"CHANNEL");
      CFTypeID v5 = (const __CFNumber *)WiFiNetworkGetProperty((uint64_t)v1, @"CHANNEL_FLAGS");
      if (v5)
      {
        int valuePtr = 0;
        CFNumberGetValue(v5, kCFNumberIntType, &valuePtr);
        if ((valuePtr & 8) != 0) {
          return 1LL;
        }
        if ((valuePtr & 0x10) != 0) {
          return 2LL;
        }
        if ((valuePtr & 0x2000) != 0) {
          return 3LL;
        }
      }

      uint64_t v1 = Property;
      if (!Property) {
        return 0LL;
      }
    }

    else
    {
      CFTypeID v6 = CFGetTypeID(v1);
      if (v6 != CFNumberGetTypeID()) {
        return 0LL;
      }
    }

    CFNumberGetValue((CFNumberRef)v1, kCFNumberIntType, &v9);
    if (v9)
    {
      if (v9 < 15) {
        return 1LL;
      }
      uint64_t v7 = 0LL;
      while (v9 != channels5Ghz[v7])
      {
        if (++v7 == 33) {
          return 0LL;
        }
      }

      return 2LL;
    }

    return 0LL;
  }

  return result;
}

uint64_t WiFiNetworkCompareNoSecurity(uint64_t a1, uint64_t a2)
{
  uint64_t result = 0LL;
  if (a1 && a2)
  {
    uint64_t result = __WiFiCompareSSIDorBSSID(*(const void **)(a1 + 16), *(const __CFDictionary **)(a2 + 16));
    if ((_DWORD)result) {
      return __WiFiCompareDictionaryValues( *(CFTypeRef *)(a1 + 16),  *(const __CFDictionary **)(a1 + 16),  @"AP_MODE") != 0;
    }
  }

  return result;
}

uint64_t __WiFiCompareSSIDorBSSID(const void *a1, const __CFDictionary *a2)
{
  uint64_t v3 = __WiFiCompareDictionaryValues(a1, a2, @"SSID_STR");
  uint64_t v4 = v3;
  if (a1)
  {
    if ((_DWORD)v3)
    {
      unint64_t Value = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)a1, @"SSID_STR");
      if (Value)
      {
        if (!CFStringGetLength(Value)) {
          return 0LL;
        }
      }
    }
  }

  return v4;
}

uint64_t __WiFiCompareDictionaryValues(CFTypeRef cf, const __CFDictionary *a2, const void *a3)
{
  uint64_t result = 0LL;
  if (cf && a2)
  {
    CFTypeID v7 = CFGetTypeID(cf);
    if (v7 == CFGetTypeID(a2))
    {
      CFTypeID v8 = CFGetTypeID(cf);
      if (v8 == CFDictionaryGetTypeID())
      {
        int v9 = (const __CFDictionary *)cf;
        if (!a3)
        {
          int v12 = a2;
          return CFEqual(v9, v12);
        }

        unint64_t Value = (const __CFDictionary *)CFDictionaryGetValue((CFDictionaryRef)cf, a3);
        CFIndex v11 = (const __CFDictionary *)CFDictionaryGetValue(a2, a3);
        if (Value == v11) {
          return 1LL;
        }
        int v12 = v11;
        if ((Value != 0LL) != (v11 == 0LL))
        {
          int v9 = Value;
          return CFEqual(v9, v12);
        }
      }
    }

    return 0LL;
  }

  return result;
}

uint64_t WiFiNetworkCompareNetworksForHS20Equivalency(uint64_t a1, uint64_t a2)
{
  if (a1 && a2) {
    return __WiFiHS20NetworksHaveSameDomain(a1, a2);
  }
  else {
    return 0LL;
  }
}

uint64_t __WiFiHS20NetworksHaveSameDomain(uint64_t a1, uint64_t a2)
{
  if (a1 && a2 && WiFiNetworkIsHotspot20(a1) && WiFiNetworkIsHotspot20(a2)) {
    return __WiFiCompareDictionaryValues( *(CFTypeRef *)(a1 + 16),  *(const __CFDictionary **)(a2 + 16),  @"DomainName");
  }
  else {
    return 0LL;
  }
}

BOOL WiFiNetworkCompareSSIDOnly(uint64_t a1, uint64_t a2)
{
  BOOL result = 0LL;
  if (a1)
  {
    if (a2) {
      return __WiFiCompareDictionaryValues( *(CFTypeRef *)(a1 + 16),  *(const __CFDictionary **)(a2 + 16),  @"SSID_STR") != 0;
    }
  }

  return result;
}

uint64_t WiFiNetworkComparePriority(uint64_t a1, uint64_t a2)
{
  if (a1 | a2) {
    uint64_t v3 = -1LL;
  }
  else {
    uint64_t v3 = 0LL;
  }
  if (a2) {
    uint64_t result = 1LL;
  }
  else {
    uint64_t result = v3;
  }
  if (!a1 || !a2) {
    return result;
  }
  BOOL IsLegacyHotspot = WiFiNetworkIsLegacyHotspot(a1);
  BOOL v7 = WiFiNetworkIsLegacyHotspot(a2);
  BOOL IsHotspot20 = WiFiNetworkIsHotspot20(a1);
  BOOL v9 = WiFiNetworkIsHotspot20(a2);
  if (IsLegacyHotspot || IsHotspot20 || v7 || v9)
  {
    BOOL v16 = !IsLegacyHotspot && !IsHotspot20;
    if (!v16 && !v7 && !v9) {
      return 1LL;
    }
    if (v16 && (v7 || v9)) {
      return -1LL;
    }
    if (IsLegacyHotspot && v9) {
      return 1LL;
    }
    if (IsHotspot20 && v7) {
      return -1LL;
    }
    if (IsHotspot20 && v9)
    {
      Property = WiFiNetworkGetProperty(a1, @"HS20HomeOperatorNetwork");
      int v18 = (const void *)*MEMORY[0x189604DE8];
      int v19 = WiFiNetworkGetProperty(a2, @"HS20HomeOperatorNetwork");
      if (Property == v18 && v19 != v18) {
        return -1LL;
      }
      if (Property != v18 && v19 == v18) {
        return 1LL;
      }
    }
  }

  unsigned int AuthFlags = __WiFiNetworkGetAuthFlags(*(const __CFDictionary **)(a1 + 16));
  unsigned int v11 = __WiFiNetworkGetAuthFlags(*(const __CFDictionary **)(a2 + 16));
  int v12 = WiFiNetworkCompareAuthFlags(AuthFlags, v11);
  if (v12 == 1) {
    return -1LL;
  }
  if (v12 == -1) {
    return 1LL;
  }
  uint64_t valuePtr = 0LL;
  int v13 = (const __CFNumber *)WiFiNetworkGetProperty(a1, @"Strength");
  if (v13) {
    CFNumberGetValue(v13, kCFNumberFloatType, (char *)&valuePtr + 4);
  }
  CFRange v14 = (const __CFNumber *)WiFiNetworkGetProperty(a2, @"Strength");
  if (v14)
  {
    CFNumberGetValue(v14, kCFNumberFloatType, &valuePtr);
    float v15 = *(float *)&valuePtr;
  }

  else
  {
    float v15 = 0.0;
  }

  else {
    return -1LL;
  }
}

BOOL WiFiNetworkIsLegacyHotspot(uint64_t a1)
{
  if (WiFiNetworkGetProperty(a1, @"DomainName")) {
    return 0LL;
  }
  if (MEMORY[0x18960D5A8])
  {
    uint64_t v3 = (const void *)*MEMORY[0x189604DE8];
  }

  return WiFiNetworkIsPublicHotspot(a1) != 0;
}

BOOL WiFiNetworkIsHS20HomeOperatorNetwork(uint64_t a1)
{
  return WiFiNetworkGetProperty(a1, @"HS20HomeOperatorNetwork") == (const void *)*MEMORY[0x189604DE8];
}

__CFString *WiFiNetworkCopyShareablePassword(CFDictionaryRef *a1)
{
  CFTypeID v2 = WiFiNetworkCopyPassword(a1);
  if (v2 && !WiFiNetworkGetProperty((uint64_t)a1, @"RSN_IE"))
  {
    SSIDData = (const __CFData *)WiFiNetworkGetSSIDData(a1);
    uint64_t v4 = WiFiSecurityCopyHashedWPAPassword(v2, SSIDData);
    CFRelease(v2);
    return v4;
  }

  return (__CFString *)v2;
}

uint64_t WiFiNetworkGetShareMode(uint64_t a1)
{
  unsigned int valuePtr = 3;
  Property = (const __CFNumber *)WiFiNetworkGetProperty(a1, @"ShareMode");
  if (Property) {
    CFNumberGetValue(Property, kCFNumberIntType, &valuePtr);
  }
  BOOL v3 = a1 && CFDictionaryContainsKey(*(CFDictionaryRef *)(a1 + 16), @"PayloadUUID");
  BOOL IsEAP = WiFiNetworkIsEAP(a1);
  int IsWPAWPA2PSK = WiFiNetworkIsWPAWPA2PSK(a1);
  if (a1)
  {
    BOOL v6 = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"WEP") == (const void *)*MEMORY[0x189604DE8];
    BOOL v7 = __WiFiNetworkIsSAE(*(const __CFDictionary **)(a1 + 16)) == 0;
  }

  else
  {
    BOOL v6 = 0;
    BOOL v7 = 1;
  }

  if (IsWPAWPA2PSK) {
    BOOL v7 = 0;
  }
  if (IsEAP) {
    BOOL v7 = 1;
  }
  if (v3 || v6 || v7) {
    return 1LL;
  }
  else {
    return valuePtr;
  }
}

__CFString *WiFiNetworkCopyHashedWPAPassword(const void *a1, const __CFString *a2)
{
  SSIDData = (const __CFData *)WiFiNetworkGetSSIDData(a1);
  return WiFiSecurityCopyHashedWPAPassword(a2, SSIDData);
}

uint64_t WiFiNetworkCopyPasswordWithTimeout(CFDictionaryRef *a1, BOOL *a2, double a3)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315394;
    int v10 = "WiFiNetworkCopyPasswordWithTimeout";
    __int16 v11 = 2112;
    AccountForNetwork = WiFiNetworkGetAccountForNetwork(a1);
    _os_log_impl( &dword_18658B000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%s: Copy password for Network/account %@",  (uint8_t *)&v9,  0x16u);
  }

  if (!a1
    || !CFDictionaryContainsKey(a1[2], @"PayloadUUID")
    || (BOOL v6 = WiFiNetworkGetAccountForNetwork(a1),
        (uint64_t result = WiFiSecurityCopyNonSyncablePasswordWithTimeout(v6, a2, a3)) == 0))
  {
    CFTypeID v8 = WiFiNetworkGetAccountForNetwork(a1);
    return WiFiSecurityCopyPasswordWithTimeout(v8, a2, a3);
  }

  return result;
}

BOOL WiFiNetworkSetPasswordWithTimeout(const void *a1, const __CFString *a2, BOOL *a3, double a4)
{
  AccountForNetwork = WiFiNetworkGetAccountForNetwork(a1);
  return WiFiSecuritySetPasswordWithTimeout(AccountForNetwork, a2, a3, a4);
}

CFStringRef WiFiNetworkCopyLegacyPassword(const void *a1)
{
  AccountForNetwork = WiFiNetworkGetAccountForNetwork(a1);
  return WiFiSecurityCopyLegacyPassword(AccountForNetwork);
}

CFStringRef WiFiNetworkCopyNonSyncablePassword(const void *a1)
{
  AccountForNetwork = WiFiNetworkGetAccountForNetwork(a1);
  return WiFiSecurityCopyNonSyncablePassword(AccountForNetwork);
}

uint64_t WiFiNetworkCopyNonSyncablePasswordWithTimeout(const void *a1, BOOL *a2, double a3)
{
  AccountForNetwork = WiFiNetworkGetAccountForNetwork(a1);
  return WiFiSecurityCopyNonSyncablePasswordWithTimeout(AccountForNetwork, a2, a3);
}

BOOL WiFiNetworkSetPassword(const void *a1, const __CFString *a2)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  AccountForNetwork = WiFiNetworkGetAccountForNetwork(a1);
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    BOOL v6 = "WiFiNetworkSetPassword";
    __int16 v7 = 2112;
    CFTypeID v8 = AccountForNetwork;
    _os_log_impl( &dword_18658B000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%s: Set password for Network/account %@",  (uint8_t *)&v5,  0x16u);
  }

  return WiFiSecuritySetPassword((BOOL)AccountForNetwork, a2);
}

BOOL WiFiNetworkSetLegacyPassword(const void *a1, const __CFString *a2)
{
  AccountForNetwork = WiFiNetworkGetAccountForNetwork(a1);
  return WiFiSecuritySetLegacyPassword((BOOL)AccountForNetwork, a2);
}

uint64_t WiFiNetworkRemovePassword(const void *a1)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315394;
    int v5 = "WiFiNetworkRemovePassword";
    __int16 v6 = 2112;
    AccountForNetwork = WiFiNetworkGetAccountForNetwork(a1);
    _os_log_impl( &dword_18658B000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "%s: Remove password for Network/account %@",  (uint8_t *)&v4,  0x16u);
  }

  CFTypeID v2 = WiFiNetworkGetAccountForNetwork(a1);
  return WiFiSecurityRemovePassword(v2);
}

uint64_t WiFiNetworkRemoveLegacyPassword(const void *a1)
{
  AccountForNetwork = WiFiNetworkGetAccountForNetwork(a1);
  return WiFiSecurityRemoveLegacyPassword(AccountForNetwork);
}

CFStringRef WiFiNetworkIsPasswordAvailable(CFDictionaryRef *a1)
{
  CFStringRef result = WiFiNetworkCopyPassword(a1);
  if (result)
  {
    CFRelease(result);
    return (CFStringRef)1;
  }

  return result;
}

uint64_t WiFiNetworkIsPasswordAvailableForHS20Account(void *a1)
{
  uint64_t result = (uint64_t)__WiFiNetworkCopyPasswordForAccount((uint64_t)a1);
  if (result)
  {
LABEL_3:
    CFRelease((CFTypeRef)result);
    return 1LL;
  }

  SSID = WiFiNetworkGetSSID(a1);
  Property = WiFiNetworkGetProperty((uint64_t)a1, @"HS20AccountName");
  if (!SSID || Property && CFEqual(SSID, Property)) {
    return 0LL;
  }
  uint64_t result = (uint64_t)WiFiNetworkCopyPassword((CFDictionaryRef *)a1);
  if (result) {
    goto LABEL_3;
  }
  return result;
}

uint64_t WiFiNetworkSetPasswordSyncable()
{
  return 1LL;
}

uint64_t WiFiNetworkIsPasswordSyncing(const void *a1)
{
  AccountForNetwork = WiFiNetworkGetAccountForNetwork(a1);
  return WiFiSecurityIsPasswordSyncing(AccountForNetwork);
}

void WiFiNetworkSetState(uint64_t a1, int a2)
{
  if (a1)
  {
    int v4 = (const void **)MEMORY[0x189604DE8];
    int v5 = *(__CFDictionary **)(a1 + 16);
    if (!a2) {
      int v4 = (const void **)MEMORY[0x189604DE0];
    }
    CFDictionarySetValue(v5, @"enabled", *v4);
    if (a2)
    {
      WiFiNetworkSetDisabledUntilDate(a1, 0LL);
      CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 16), @"networkDisabledTimestamp");
      CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 16), @"networkDisabledReason");
      CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 16), @"networkDisabledClientName");
      __int16 v6 = *(__CFDictionary **)(a1 + 16);
      __int16 v7 = @"prevJoined";
    }

    else
    {
      __int16 v6 = *(__CFDictionary **)(a1 + 16);
      __int16 v7 = @"WiFiNetworkUserAcceptedRecommendationAt";
    }

    CFDictionaryRemoveValue(v6, v7);
  }

void WiFiNetworkSetDisabledUntilDate(uint64_t a1, const void *a2)
{
  if (a1)
  {
    CFTypeID v2 = a2;
    uint64_t v3 = a1;
    if (!a2)
    {
      objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
      a1 = v3;
      CFTypeID v2 = 0LL;
    }

    WiFiNetworkSetProperty(a1, @"WiFiNetworkDisabledUntilDate", v2);
  }

void WiFiNetworkSetStateWithReason(CFMutableDictionaryRef *a1, int a2, const void *a3)
{
  if (a1)
  {
    if (a3)
    {
      CFTypeID TypeID = CFStringGetTypeID();
      if (TypeID == CFGetTypeID(a3))
      {
        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
          WiFiNetworkSetStateWithReason_cold_1(a1, a2, (uint64_t)a3);
        }
        BOOL IsEnabled = WiFiNetworkIsEnabled((uint64_t)a1);
        if (!a2 && IsEnabled)
        {
          WiFiNetworkSetProperty((uint64_t)a1, @"networkDisabledReason", a3);
          uint64_t v8 = (const __CFAllocator *)*MEMORY[0x189604DB0];
          CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
          CFDateRef v10 = CFDateCreate(v8, Current);
          if (v10)
          {
            CFDateRef v11 = v10;
            CFDictionarySetValue(a1[2], @"networkDisabledTimestamp", v10);
            CFRelease(v11);
          }
        }
      }
    }
  }

  WiFiNetworkSetState((uint64_t)a1, a2);
}

BOOL WiFiNetworkIsEnabled(uint64_t a1)
{
  unint64_t Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"enabled");
  return !Value || CFEqual(Value, (CFTypeRef)*MEMORY[0x189604DE0]) == 0;
}

BOOL WiFiNetworkHasAutoJoinPreference(uint64_t a1)
{
  return CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"enabled") != 0LL;
}

void WiFiNetworkSetAssociationDate(uint64_t a1, int a2, const void *a3)
{
  LastAssociationDate = (const void *)WiFiNetworkGetLastAssociationDate(a1);
  if (LastAssociationDate) {
    WiFiNetworkSetProperty(a1, @"prevJoined", LastAssociationDate);
  }
  if (a2) {
    __int16 v7 = @"lastJoined";
  }
  else {
    __int16 v7 = @"lastAutoJoined";
  }
  WiFiNetworkSetProperty(a1, v7, a3);
}

unint64_t WiFiNetworkGetLastAssociationDate(uint64_t a1)
{
  unint64_t Property = (unint64_t)WiFiNetworkGetProperty(a1, @"lastJoined");
  unint64_t result = (unint64_t)WiFiNetworkGetProperty(a1, @"lastAutoJoined");
  if (Property | result)
  {
    int v4 = (const __CFDate *)result;
    if (!result) {
      unint64_t result = Property;
    }
    if (Property && v4)
    {
      if (CFDateCompare((CFDateRef)Property, v4, 0LL) == kCFCompareGreaterThan) {
        return Property;
      }
      else {
        return (unint64_t)v4;
      }
    }
  }

  else
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
    return 0LL;
  }

  return result;
}

const void *WiFiNetworkGetAssociationDate(uint64_t a1, int a2)
{
  if (a2) {
    CFTypeID v2 = @"lastJoined";
  }
  else {
    CFTypeID v2 = @"lastAutoJoined";
  }
  return WiFiNetworkGetProperty(a1, v2);
}

double WiFiNetworkGetTimeIntervalSinceLastAssociation(uint64_t a1)
{
  LastAssociationDate = (const __CFDate *)WiFiNetworkGetLastAssociationDate(a1);
  unint64_t Property = (const __CFDate *)WiFiNetworkGetProperty(a1, @"prevJoined");
  if (LastAssociationDate && Property) {
    return CFDateGetTimeIntervalSinceDate(LastAssociationDate, Property);
  }
  double result = -1.0;
  if (LastAssociationDate) {
    return 0.0;
  }
  return result;
}

double WiFiNetworkGetNetworkUsage(uint64_t a1)
{
  unint64_t Property = WiFiNetworkGetProperty(a1, @"networkUsage");
  return _CFTypeGetFloatValue(Property);
}

void WiFiNetworkSetNetworkUsage(uint64_t a1, double a2)
{
}

const void *WiFiNetworkGetChannelFlags(uint64_t a1, uint64_t a2)
{
  if (a1) {
    return WiFiNetworkGetProperty(a1, @"CHANNEL_FLAGS");
  }
  objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C](0LL, a2));
  return 0LL;
}

CFNumberRef WiFiNetworkGetPhyMode(uint64_t a1)
{
  unint64_t Property = (const __CFNumber *)WiFiNetworkGetProperty(a1, @"PHY_MODE");
  return _CFTypeGetIntValue(Property);
}

uint64_t WiFiNetworkGetChannelWidthInMHz(uint64_t a1)
{
  unsigned __int16 valuePtr = 0;
  if (a1 && (unint64_t Property = (const __CFNumber *)WiFiNetworkGetProperty(a1, @"CHANNEL_WIDTH")) != 0LL)
  {
    CFNumberGetValue(Property, kCFNumberSInt16Type, &valuePtr);
    return valuePtr;
  }

  else
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
    return 0LL;
  }

uint64_t WiFiNetworkGetChannelFreqBand(int a1)
{
  if (a1 < 1) {
    return 0LL;
  }
  uint64_t v2 = 0LL;
  while (channels5Ghz[v2] != a1)
  {
    if (++v2 == 33) {
      return 0LL;
    }
  }

  return 2LL;
}

void WiFiNetworkPrepareKnownBssList(uint64_t a1)
{
  uint64_t v2 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  CFDateRef v4 = CFDateCreate(v2, Current);
  CFDateRef v5 = v4;
  if (!a1 || !v4) {
    goto LABEL_45;
  }
  unint64_t Property = WiFiNetworkGetProperty(a1, @"CHANNEL");
  if (Property)
  {
    __int16 v7 = Property;
    uint64_t v8 = WiFiNetworkGetProperty(a1, @"CHANNEL_FLAGS");
    if (v8)
    {
      uint64_t v9 = v8;
      CFDateRef v10 = WiFiNetworkGetProperty(a1, @"BSSID");
      if (v10)
      {
        CFDateRef v11 = v10;
        theArray = CFArrayCreateMutable(v2, 0LL, MEMORY[0x189605228]);
        if (theArray)
        {
          int v12 = (const __CFArray *)WiFiNetworkGetProperty(a1, @"networkKnownBSSListKey");
          uint64_t v36 = a1;
          if (!v12) {
            goto LABEL_20;
          }
          uint64_t v13 = v12;
          if (CFArrayGetCount(v12) < 1)
          {
            CFRange v14 = 0LL;
          }

          else
          {
            CFRange v14 = 0LL;
            CFIndex v15 = 0LL;
            do
            {
              ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v13, v15);
              if (ValueAtIndex)
              {
                unint64_t v17 = ValueAtIndex;
                unint64_t Value = CFDictionaryGetValue(ValueAtIndex, @"BSSID");
                if (Value)
                {
                  if (CFEqual(Value, v11)) {
                    CFRange v14 = v17;
                  }
                  else {
                    CFArrayAppendValue(theArray, v17);
                  }
                }
              }

              ++v15;
            }

            while (v15 < CFArrayGetCount(v13));
          }

          a1 = v36;
          if (v14) {
            MutableCFDictionaryRef Copy = CFDictionaryCreateMutableCopy(v2, 0LL, v14);
          }
          else {
LABEL_20:
          }
            MutableCFDictionaryRef Copy = CFDictionaryCreateMutable(v2, 0LL, MEMORY[0x189605240], MEMORY[0x189605250]);
          unint64_t v20 = MutableCopy;
          if (MutableCopy)
          {
            CFDictionarySetValue(MutableCopy, @"BSSID", v11);
            CFDictionarySetValue(v20, @"CHANNEL", v7);
            CFDictionarySetValue(v20, @"CHANNEL_FLAGS", v9);
            CFDictionarySetValue(v20, @"lastRoamed", v5);
            BOOL v21 = (const __CFNumber *)WiFiNetworkGetProperty(a1, @"CHANNEL_FLAGS");
            if (v21)
            {
              int valuePtr = 0;
              CFNumberGetValue(v21, kCFNumberSInt32Type, &valuePtr);
              if ((valuePtr & 0x2000) != 0)
              {
                unsigned int v22 = (const __CFArray *)WiFiNetworkGetProperty(a1, @"ORIG_RNR_CHANNEL_LIST");
                if (v22)
                {
                  int v23 = v22;
                  if (CFArrayGetCount(v22) >= 1)
                  {
                    __int16 v35 = v5;
                    CFIndex v24 = 0LL;
                    CFIndex v25 = 0LL;
                    int v26 = 0LL;
                    BOOL v27 = 0LL;
                    int v28 = 0LL;
                    while (!v28 || !v26)
                    {
                      int v29 = (const __CFDictionary *)CFArrayGetValueAtIndex(v23, v24);
                      if (v29)
                      {
                        int v30 = v29;
                        unsigned int v31 = CFDictionaryGetValue(v29, @"CHANNEL");
                        unsigned int v32 = (const __CFNumber *)CFDictionaryGetValue(v30, @"CHANNEL_FLAGS");
                        if (v31)
                        {
                          int v33 = v32;
                          if (v32)
                          {
                            int v38 = 0;
                            CFNumberGetValue(v32, kCFNumberSInt32Type, &v38);
                            if ((v38 & 8) != 0)
                            {
                              int v28 = v31;
                              BOOL v27 = v33;
                            }

                            else if ((v38 & 0x10) != 0)
                            {
                              int v26 = v31;
                              CFIndex v25 = v33;
                            }
                          }
                        }
                      }

                      if (CFArrayGetCount(v23) <= ++v24)
                      {
                        if (!v26) {
                          goto LABEL_39;
                        }
                        break;
                      }
                    }

                    CFDictionarySetValue(v20, @"colocated5GHzRNRChannel", v26);
                    CFDictionarySetValue(v20, @"colocated5GHzRNRChannelFlags", v25);
LABEL_39:
                    CFDateRef v5 = v35;
                    a1 = v36;
                    if (v28)
                    {
                      CFDictionarySetValue(v20, @"colocated2GHzRNRChannel", v28);
                      CFDictionarySetValue(v20, @"colocated2GHzRNRChannelFlags", v27);
                    }
                  }
                }
              }
            }

            CFIndex v34 = WiFiNetworkGetProperty(a1, @"LEAKY_AP_LEARNED_DATA");
            if (v34)
            {
              CFDictionarySetValue(v20, @"LEAKY_AP_LEARNED_DATA", v34);
              WiFiNetworkSetProperty(a1, @"LEAKY_AP_LEARNED_DATA", 0LL);
              objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
            }

            CFArrayAppendValue(theArray, v20);
            WiFiNetworkSetProperty(a1, @"networkKnownBSSListKey", theArray);
            objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
            CFRelease(theArray);
          }

          else
          {
            unint64_t v20 = theArray;
          }

          CFRelease(v20);
LABEL_45:
          if (!v5) {
            return;
          }
        }
      }
    }
  }

  CFRelease(v5);
}

void WiFiNetworkRemoveBssFromKnownList(uint64_t a1, CFArrayRef theArray)
{
  if (a1)
  {
    if (theArray)
    {
      if (CFArrayGetCount(theArray) >= 1)
      {
        unint64_t Property = (const __CFArray *)WiFiNetworkGetProperty(a1, @"networkKnownBSSListKey");
        if (Property)
        {
          CFDateRef v5 = Property;
          CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, MEMORY[0x189605228]);
          if (Mutable)
          {
            __int16 v7 = Mutable;
            if (CFArrayGetCount(v5) >= 1)
            {
              CFIndex v8 = 0LL;
              do
              {
                ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v5, v8);
                if (ValueAtIndex)
                {
                  CFDateRef v10 = ValueAtIndex;
                  unint64_t Value = CFDictionaryGetValue(ValueAtIndex, @"BSSID");
                  if (Value)
                  {
                    int v12 = Value;
                    v13.length = CFArrayGetCount(theArray);
                    v13.location = 0LL;
                    if (CFArrayGetFirstIndexOfValue(theArray, v13, v12) == -1) {
                      CFArrayAppendValue(v7, v10);
                    }
                    else {
                      objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
                    }
                  }
                }

                ++v8;
              }

              while (v8 < CFArrayGetCount(v5));
            }

            objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
            WiFiNetworkSetProperty(a1, @"networkKnownBSSListKey", v7);
            CFRelease(v7);
          }
        }
      }
    }
  }

void WiFiNetworkSetKnownBssUsageData(uint64_t a1, uint64_t a2)
{
  CFDateRef v4 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  CFDateRef v6 = CFDateCreate(v4, Current);
  if (!a1 || !a2) {
    goto LABEL_24;
  }
  unint64_t Property = WiFiNetworkGetProperty(a2, @"CHANNEL");
  CFIndex v8 = WiFiNetworkGetProperty(a2, @"CHANNEL_FLAGS");
  uint64_t v9 = WiFiNetworkGetProperty(a2, @"BSSID");
  if (v9)
  {
    CFDateRef v10 = v9;
    CFMutableArrayRef Mutable = CFArrayCreateMutable(v4, 0LL, MEMORY[0x189605228]);
    if (Mutable)
    {
      int v12 = Mutable;
      int v23 = v8;
      objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
      CFRange v13 = (const __CFArray *)WiFiNetworkGetProperty(a1, @"networkKnownBSSListKey");
      if (!v13) {
        goto LABEL_18;
      }
      CFRange v14 = v13;
      unsigned int v22 = v6;
      if (CFArrayGetCount(v13) < 1)
      {
        CFIndex v15 = 0LL;
      }

      else
      {
        CFIndex v15 = 0LL;
        CFIndex v16 = 0LL;
        do
        {
          ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v14, v16);
          if (ValueAtIndex)
          {
            int v18 = ValueAtIndex;
            unint64_t Value = CFDictionaryGetValue(ValueAtIndex, @"BSSID");
            if (Value)
            {
              if (CFEqual(Value, v10)) {
                CFIndex v15 = v18;
              }
              else {
                CFArrayAppendValue(v12, v18);
              }
            }
          }

          ++v16;
        }

        while (v16 < CFArrayGetCount(v14));
      }

      CFDateRef v6 = v22;
      if (v15) {
        MutableCFDictionaryRef Copy = CFDictionaryCreateMutableCopy(v4, 0LL, v15);
      }
      else {
LABEL_18:
      }
        MutableCFDictionaryRef Copy = CFDictionaryCreateMutable(v4, 0LL, MEMORY[0x189605240], MEMORY[0x189605250]);
      BOOL v21 = MutableCopy;
      if (MutableCopy)
      {
        CFDictionarySetValue(MutableCopy, @"BSSID", v10);
        CFDictionarySetValue(v21, @"CHANNEL", Property);
        CFDictionarySetValue(v21, @"CHANNEL_FLAGS", v23);
        CFDictionarySetValue(v21, @"lastRoamed", v6);
        CFArrayAppendValue(v12, v21);
        if (CFArrayGetCount(v12) >= 21)
        {
          objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
          CFArrayRemoveValueAtIndex(v12, 0LL);
        }

        objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
        WiFiNetworkSetProperty(a2, @"networkKnownBSSListKey", v12);
        WiFiNetworkSetProperty(a1, @"networkKnownBSSListKey", v12);
        CFRelease(v21);
      }

      CFRelease(v12);
    }

void WiFiNetworkSetBSSLocation(uint64_t a1, const void *a2, double a3, double a4, double a5)
{
  if (a1 && a2)
  {
    unint64_t Property = WiFiNetworkGetProperty(a1, @"BSSID");
    if (Property)
    {
      CFDateRef v11 = Property;
      int v12 = (const __CFAllocator *)*MEMORY[0x189604DB0];
      CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, MEMORY[0x189605228]);
      if (Mutable)
      {
        CFRange v14 = Mutable;
        CFIndex v15 = (const __CFArray *)WiFiNetworkGetProperty(a1, @"networkKnownBSSListKey");
        if (v15)
        {
          CFIndex v16 = v15;
          if (CFArrayGetCount(v15) >= 1)
          {
            unint64_t v17 = 0LL;
            CFIndex v18 = 0LL;
            do
            {
              ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v16, v18);
              if (ValueAtIndex)
              {
                unint64_t v20 = ValueAtIndex;
                unint64_t Value = CFDictionaryGetValue(ValueAtIndex, @"BSSID");
                if (Value)
                {
                  if (CFEqual(Value, v11)) {
                    unint64_t v17 = v20;
                  }
                  else {
                    CFArrayAppendValue(v14, v20);
                  }
                }
              }

              ++v18;
            }

            while (v18 < CFArrayGetCount(v16));
            if (v17)
            {
              MutableCFDictionaryRef Copy = CFDictionaryCreateMutableCopy(v12, 0LL, v17);
              if (MutableCopy)
              {
                int v23 = MutableCopy;
                CFDictionarySetValue( MutableCopy,  @"networkLocnLat",  (const void *)[MEMORY[0x189607968] numberWithDouble:a3]);
                CFDictionarySetValue( v23,  @"networkLocnLong",  (const void *)[MEMORY[0x189607968] numberWithDouble:a4]);
                CFDictionarySetValue( v23,  @"networkLocnAccuracy",  (const void *)[MEMORY[0x189607968] numberWithDouble:a5]);
                CFDictionarySetValue(v23, @"networkLocnTimestamp", a2);
                CFArrayAppendValue(v14, v23);
                WiFiNetworkSetProperty(a1, @"networkKnownBSSListKey", v14);
                CFRelease(v23);
              }
            }
          }
        }

        CFRelease(v14);
      }
    }

    else
    {
      objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
    }
  }

void WiFiNetworkSetBSSProperty(const void *a1, const __CFString *a2, uint64_t a3)
{
  if (a1 && a3)
  {
    SSID = WiFiNetworkGetSSID(a1);
    if (a2)
    {
      __int16 v7 = (const __CFAllocator *)*MEMORY[0x189604DB0];
      CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, MEMORY[0x189605228]);
      if (Mutable)
      {
        uint64_t v9 = Mutable;
        unint64_t Property = (const __CFArray *)WiFiNetworkGetProperty((uint64_t)a1, @"networkKnownBSSListKey");
        if (Property)
        {
          CFDateRef v11 = Property;
          if (CFArrayGetCount(Property) >= 1)
          {
            CFIndex v12 = 0LL;
            do
            {
              ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v11, v12);
              if (ValueAtIndex)
              {
                CFRange v14 = ValueAtIndex;
                unint64_t Value = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, @"BSSID");
                if (Value)
                {
                  if (CFStringCompare(Value, a2, 1uLL))
                  {
                    CFArrayAppendValue(v9, v14);
                  }

                  else
                  {
                    MutableCFDictionaryRef Copy = CFDictionaryCreateMutableCopy(v7, 0LL, v14);
                    if (MutableCopy)
                    {
                      CFMutableDictionaryRef v17 = MutableCopy;
                      (*(void (**)(uint64_t, CFMutableDictionaryRef))(a3 + 16))(a3, MutableCopy);
                      CFArrayAppendValue(v9, v17);
                      CFRelease(v17);
                    }
                  }
                }
              }

              ++v12;
            }

            while (v12 < CFArrayGetCount(v11));
          }
        }

        WiFiNetworkSetProperty((uint64_t)a1, @"networkKnownBSSListKey", v9);
        CFRelease(v9);
      }
    }

    else
    {
      objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C](SSID));
    }
  }

void WiFiNetworkSetBSSAWDLRealTimeModeTimestamp(uint64_t a1, const void *a2)
{
  if (a1 && a2)
  {
    unint64_t Property = WiFiNetworkGetProperty(a1, @"BSSID");
    if (Property)
    {
      CFDateRef v5 = Property;
      CFDateRef v6 = (const __CFAllocator *)*MEMORY[0x189604DB0];
      CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, MEMORY[0x189605228]);
      if (Mutable)
      {
        CFIndex v8 = Mutable;
        objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
        uint64_t v9 = (const __CFArray *)WiFiNetworkGetProperty(a1, @"networkKnownBSSListKey");
        if (v9)
        {
          CFDateRef v10 = v9;
          if (CFArrayGetCount(v9) >= 1)
          {
            CFDateRef v11 = 0LL;
            CFIndex v12 = 0LL;
            do
            {
              ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v10, v12);
              if (ValueAtIndex)
              {
                CFRange v14 = ValueAtIndex;
                unint64_t Value = CFDictionaryGetValue(ValueAtIndex, @"BSSID");
                if (Value)
                {
                  if (CFEqual(Value, v5)) {
                    CFDateRef v11 = v14;
                  }
                  else {
                    CFArrayAppendValue(v8, v14);
                  }
                }
              }

              ++v12;
            }

            while (v12 < CFArrayGetCount(v10));
            if (v11)
            {
              MutableCFDictionaryRef Copy = CFDictionaryCreateMutableCopy(v6, 0LL, v11);
              if (MutableCopy)
              {
                CFMutableDictionaryRef v17 = MutableCopy;
                CFDictionarySetValue(MutableCopy, @"AWDLRealTimeModeTimestamp", a2);
                CFArrayAppendValue(v8, v17);
                WiFiNetworkSetProperty(a1, @"networkKnownBSSListKey", v8);
                CFRelease(v17);
              }
            }
          }
        }

        CFRelease(v8);
      }
    }

    else
    {
      objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
    }
  }

void WiFiNetworkSetBssLateRoamInfo(uint64_t a1, uint64_t a2, int a3, int a4)
{
  int v33 = a4;
  int v34 = a3;
  if (a1 && a2)
  {
    unint64_t Property = WiFiNetworkGetProperty(a2, @"BSSID");
    if (!Property)
    {
      objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
      return;
    }

    uint64_t v9 = Property;
    CFDateRef v10 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, MEMORY[0x189605228]);
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
    if (Mutable)
    {
      CFIndex v12 = (const __CFArray *)WiFiNetworkGetProperty(a1, @"networkKnownBSSListKey");
      if (!v12) {
        goto LABEL_40;
      }
      CFRange v13 = v12;
      int v31 = a3;
      if (CFArrayGetCount(v12) < 1)
      {
        CFRange v14 = 0LL;
      }

      else
      {
        CFRange v14 = 0LL;
        CFIndex v15 = 0LL;
        do
        {
          ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v13, v15);
          if (ValueAtIndex)
          {
            CFMutableDictionaryRef v17 = ValueAtIndex;
            unint64_t Value = CFDictionaryGetValue(ValueAtIndex, @"BSSID");
            if (Value)
            {
              if (CFEqual(Value, v9)) {
                CFRange v14 = v17;
              }
              else {
                CFArrayAppendValue(Mutable, v17);
              }
            }
          }

          ++v15;
        }

        while (v15 < CFArrayGetCount(v13));
      }

      int v19 = a4;
      if (!v14) {
        goto LABEL_40;
      }
      MutableCFDictionaryRef Copy = CFDictionaryCreateMutableCopy(v10, 0LL, v14);
      if (!MutableCopy)
      {
        objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
        goto LABEL_40;
      }

      CFMutableDictionaryRef v21 = MutableCopy;
      unsigned int v22 = (const __CFDictionary *)CFDictionaryGetValue(v14, @"lateRoamInfo");
      if (v22)
      {
        int v23 = v22;
        objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
        CFIndex v24 = CFDictionaryCreateMutableCopy(v10, 0LL, v23);
      }

      else
      {
        CFIndex v24 = CFDictionaryCreateMutable(v10, 0LL, MEMORY[0x189605240], MEMORY[0x189605250]);
      }

      CFIndex v25 = v24;
      if (!v24)
      {
        objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
        goto LABEL_39;
      }

      int v26 = (const __CFNumber *)CFDictionaryGetValue(v24, @"lateRoamMinDelta");
      if (v26 && (int valuePtr = 0, CFNumberGetValue(v26, kCFNumberIntType, &valuePtr)) && valuePtr <= v31)
      {
        CFNumberRef v27 = 0LL;
      }

      else
      {
        CFNumberRef v28 = CFNumberCreate(v10, kCFNumberIntType, &v34);
        if (!v28)
        {
          objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
LABEL_38:
          CFRelease(v25);
LABEL_39:
          CFRelease(v21);
LABEL_40:
          CFRelease(Mutable);
          return;
        }

        CFNumberRef v27 = v28;
        CFDictionarySetValue(v25, @"lateRoamMinDelta", v28);
      }

      int v29 = (const __CFNumber *)CFDictionaryGetValue(v25, @"lateRoamMaxDelta");
      if (v29 && (int valuePtr = 0, CFNumberGetValue(v29, kCFNumberIntType, &valuePtr)) && valuePtr >= v19)
      {
        CFNumberRef v30 = 0LL;
      }

      else
      {
        CFNumberRef v30 = CFNumberCreate(v10, kCFNumberIntType, &v33);
        if (!v30)
        {
          objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
          if (!v27)
          {
LABEL_36:
            if (v30) {
              CFRelease(v30);
            }
            goto LABEL_38;
          }

LABEL_35:
          CFRelease(v27);
          goto LABEL_36;
        }

        CFDictionarySetValue(v25, @"lateRoamMaxDelta", v30);
      }

      CFDictionarySetValue(v21, @"lateRoamInfo", v25);
      CFArrayAppendValue(Mutable, v21);
      objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
      WiFiNetworkSetProperty(a2, @"networkKnownBSSListKey", Mutable);
      WiFiNetworkSetProperty(a1, @"networkKnownBSSListKey", Mutable);
      if (!v27) {
        goto LABEL_36;
      }
      goto LABEL_35;
    }
  }

void WiFiNetworkSetBssDisconnectReason(uint64_t a1, const __CFString *a2, int a3)
{
  double Current = CFAbsoluteTimeGetCurrent();
  uint64_t v40 = 0LL;
  int valuePtr = 0;
  if (!a1 || !a2) {
    return;
  }
  int v7 = a3 - 3;
  if ((a3 - 3) >= 3)
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C](Current));
    return;
  }

  CFAbsoluteTime v8 = Current;
  LODWORD(v36) = dword_1865BCF14[v7];
  HIDWORD(v36) = dword_1865BCF08[v7];
  unint64_t Property = WiFiNetworkGetProperty(a1, @"knownBSSUpdatedDate");
  CFDateRef v10 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  CFDateRef v11 = CFDateCreate((CFAllocatorRef)*MEMORY[0x189604DB0], v8);
  if (!Property)
  {
    int v13 = 1;
    goto LABEL_10;
  }

  double v12 = v8 - MEMORY[0x186E3B410](Property);
  if (v12 > 2592000.0)
  {
    int v13 = 0;
    LOBYTE(Property) = 1;
LABEL_10:
    WiFiNetworkSetProperty(a1, @"knownBSSUpdatedDate", v11);
    char v14 = v13;
    char v15 = (char)Property;
    goto LABEL_11;
  }

  LOBYTE(Property) = 0;
  char v14 = 0;
  int v13 = 1;
  char v15 = 1;
  if (v12 > 1296000.0) {
    goto LABEL_10;
  }
LABEL_11:
  int v37 = v13;
  CFDateRef cf = v11;
  CFIndex v16 = (const __CFArray *)WiFiNetworkGetProperty(a1, @"networkKnownBSSListKey");
  CFMutableArrayRef Mutable = CFArrayCreateMutable(v10, 0LL, MEMORY[0x189605228]);
  if (Mutable)
  {
    CFIndex v18 = Mutable;
    if (v16 && CFArrayGetCount(v16) >= 1)
    {
      CFIndex v19 = 0LL;
      char v38 = v14 | Property;
      do
      {
        ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v16, v19);
        if (!ValueAtIndex) {
          goto LABEL_42;
        }
        CFMutableDictionaryRef v21 = ValueAtIndex;
        unint64_t Value = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, @"BSSID");
        if (!Value) {
          goto LABEL_42;
        }
        int v23 = Value;
        if (CFStringCompare(Value, a2, 0LL))
        {
          uint64_t v40 = 0LL;
          if ((v38 & 1) == 0)
          {
            CFArrayAppendValue(v18, v21);
            goto LABEL_42;
          }
        }

        else
        {
          uint64_t v40 = v36;
        }

        CFIndex v24 = (const __CFNumber *)CFDictionaryGetValue(v21, @"beaconLossCount");
        if (v24)
        {
          CFNumberGetValue(v24, kCFNumberIntType, &valuePtr);
          if ((v15 & 1) != 0)
          {
            if (!v37) {
              goto LABEL_27;
            }
            int v25 = valuePtr & 0xFF00 | (BYTE4(v40) + valuePtr);
          }

          else
          {
            int v25 = BYTE4(v40) | (valuePtr << 8);
          }

          HIDWORD(v40) = v25;
        }

LABEL_27:
        int v26 = (const __CFNumber *)CFDictionaryGetValue(v21, @"trigDisconnectCount");
        if (!v26) {
          goto LABEL_33;
        }
        CFNumberGetValue(v26, kCFNumberIntType, &valuePtr);
        if ((v15 & 1) != 0)
        {
          if (!v37) {
            goto LABEL_33;
          }
          int v27 = valuePtr & 0xFF00 | (v40 + valuePtr);
        }

        else
        {
          int v27 = v40 | (valuePtr << 8);
        }

        LODWORD(v40) = v27;
LABEL_33:
        int v28 = CFEqual(v23, a2);
        if (a3 == 5 && v28) {
          uint64_t v40 = 0LL;
        }
        MutableCFDictionaryRef Copy = CFDictionaryCreateMutableCopy(v10, 0LL, v21);
        if (!MutableCopy) {
          goto LABEL_44;
        }
        CFNumberRef v30 = MutableCopy;
        CFNumberRef v31 = CFNumberCreate(v10, kCFNumberIntType, (char *)&v40 + 4);
        if (v31)
        {
          CFNumberRef v32 = v31;
          CFDictionarySetValue(v30, @"beaconLossCount", v31);
          CFRelease(v32);
        }

        CFNumberRef v33 = CFNumberCreate(v10, kCFNumberIntType, &v40);
        if (v33)
        {
          CFNumberRef v34 = v33;
          CFDictionarySetValue(v30, @"trigDisconnectCount", v33);
          CFRelease(v34);
        }

        CFArrayInsertValueAtIndex(v18, v19, v30);
        CFRelease(v30);
        objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
LABEL_42:
        ++v19;
      }

      while (v19 < CFArrayGetCount(v16));
    }

    WiFiNetworkSetProperty(a1, @"networkKnownBSSListKey", v18);
LABEL_44:
    CFRelease(v18);
  }

  if (cf) {
    CFRelease(cf);
  }
}

__CFDictionary *WiFiNetworkCopyNetworkChannelList(uint64_t a1)
{
  unint64_t Property = (const __CFArray *)WiFiNetworkGetProperty(a1, @"networkKnownBSSListKey");
  if (!Property) {
    return 0LL;
  }
  uint64_t v2 = Property;
  uint64_t v3 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  CFMutableArrayRef Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
  if (Mutable && CFArrayGetCount(v2) >= 1)
  {
    CFIndex v5 = 0LL;
    do
    {
      ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v2, v5);
      if (ValueAtIndex)
      {
        int v7 = ValueAtIndex;
        unint64_t Value = CFDictionaryGetValue(ValueAtIndex, @"CHANNEL");
        if (Value)
        {
          uint64_t v9 = Value;
          CFDateRef v10 = CFStringCreateMutable(v3, 0LL);
          if (v10)
          {
            CFDateRef v11 = v10;
            CFStringAppendFormat(v10, 0LL, @"%@", v9);
            CFDictionarySetValue(Mutable, v11, v7);
            CFRelease(v11);
          }
        }
      }

      ++v5;
    }

    while (v5 < CFArrayGetCount(v2));
  }

  return Mutable;
}

uint64_t WiFiNetworkIsEdgeBss(uint64_t a1, const void *a2)
{
  uint64_t v2 = 0LL;
  uint64_t valuePtr = 0LL;
  if (a1 && a2)
  {
    unint64_t Property = (const __CFArray *)WiFiNetworkGetProperty(a1, @"networkKnownBSSListKey");
    uint64_t v2 = (uint64_t)Property;
    if (Property)
    {
      if (CFArrayGetCount(Property) < 1)
      {
LABEL_10:
        uint64_t v2 = 0LL;
      }

      else
      {
        CFIndex v5 = 0LL;
        while (1)
        {
          ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex((CFArrayRef)v2, v5);
          if (ValueAtIndex)
          {
            int v7 = ValueAtIndex;
            unint64_t Value = CFDictionaryGetValue(ValueAtIndex, @"BSSID");
            if (Value)
            {
              if (CFEqual(Value, a2)) {
                break;
              }
            }
          }

          if (++v5 >= CFArrayGetCount((CFArrayRef)v2)) {
            goto LABEL_10;
          }
        }

        CFDateRef v10 = (const __CFNumber *)CFDictionaryGetValue(v7, @"beaconLossCount");
        if (v10)
        {
          CFNumberGetValue(v10, kCFNumberIntType, (char *)&valuePtr + 4);
          HIDWORD(valuePtr) = BYTE5(valuePtr) + BYTE4(valuePtr);
        }

        CFDateRef v11 = (const __CFNumber *)CFDictionaryGetValue(v7, @"trigDisconnectCount");
        if (v11)
        {
          CFNumberGetValue(v11, kCFNumberIntType, &valuePtr);
          LODWORD(valuePtr) = BYTE1(valuePtr) + valuePtr;
          BOOL v12 = valuePtr > 2;
        }

        else
        {
          BOOL v12 = 0;
        }

        uint64_t v2 = SHIDWORD(valuePtr) > 5 || v12;
      }
    }

    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
  }

  return v2;
}

uint64_t WiFiNetworkSortNetworksByUsageTime(uint64_t a1, uint64_t a2)
{
  if (a1 | a2) {
    uint64_t v3 = -1LL;
  }
  else {
    uint64_t v3 = 0LL;
  }
  if (a2) {
    uint64_t result = 1LL;
  }
  else {
    uint64_t result = v3;
  }
  if (a1 && a2)
  {
    unint64_t Property = WiFiNetworkGetProperty(a1, @"networkUsage");
    Floatunint64_t Value = _CFTypeGetFloatValue(Property);
    CFAbsoluteTime v8 = WiFiNetworkGetProperty(a2, @"networkUsage");
    double v9 = _CFTypeGetFloatValue(v8);
    if (FloatValue >= v9)
    {
      if (FloatValue <= v9) {
        return WiFiNetworkSortNetworksByLastUsedDate(a1, a2);
      }
      else {
        return -1LL;
      }
    }

    else
    {
      return 1LL;
    }
  }

  return result;
}

uint64_t WiFiNetworkSortNetworksByLastUsedDate(uint64_t a1, uint64_t a2)
{
  if (a1 | a2) {
    uint64_t v3 = -1LL;
  }
  else {
    uint64_t v3 = 0LL;
  }
  if (a2) {
    uint64_t result = 1LL;
  }
  else {
    uint64_t result = v3;
  }
  if (a1 && a2)
  {
    unint64_t Property = (const __CFDate *)WiFiNetworkGetProperty(a1, @"lastAutoJoined");
    int v7 = (const __CFDate *)WiFiNetworkGetProperty(a1, @"lastJoined");
    CFAbsoluteTime v8 = v7;
    if (Property && v7)
    {
      CFComparisonResult v9 = CFDateCompare(Property, v7, 0LL);
      if (v9 == kCFCompareGreaterThan) {
        CFDateRef v10 = Property;
      }
      else {
        CFDateRef v10 = 0LL;
      }
      if (v9 == kCFCompareEqualTo) {
        CFDateRef v10 = v8;
      }
      if (v9 == kCFCompareLessThan) {
        unint64_t Property = v8;
      }
      else {
        unint64_t Property = v10;
      }
    }

    else if (!Property)
    {
      unint64_t Property = v7;
    }

    CFDateRef v11 = (const __CFDate *)WiFiNetworkGetProperty(a2, @"lastAutoJoined");
    BOOL v12 = (const __CFDate *)WiFiNetworkGetProperty(a2, @"lastJoined");
    int v13 = v12;
    if (v11 && v12)
    {
      CFComparisonResult v14 = CFDateCompare(v11, v12, 0LL);
      if (v14 != kCFCompareLessThan)
      {
        if (v14)
        {
          int v13 = v11;
          if (v14 != kCFCompareGreaterThan)
          {
            BOOL v15 = 0;
            BOOL v16 = Property != 0LL;
LABEL_34:
            if (v16) {
              return -1LL;
            }
            else {
              return v15;
            }
          }
        }
      }
    }

    else if (v11)
    {
      int v13 = v11;
    }

    BOOL v16 = Property != 0LL;
    BOOL v15 = v13 != 0LL;
    if (!Property || !v13) {
      goto LABEL_34;
    }
    CFComparisonResult v17 = CFDateCompare(Property, v13, 0LL);
    if (v17 == kCFCompareGreaterThan) {
      return -1LL;
    }
    else {
      return v17 == kCFCompareLessThan;
    }
  }

  return result;
}

BOOL WiFiNetworkSortNetworksBySignalStrength(uint64_t a1, uint64_t a2)
{
  uint64_t valuePtr = 0LL;
  if (a1 | a2) {
    uint64_t v2 = -1LL;
  }
  else {
    uint64_t v2 = 0LL;
  }
  if (a2) {
    uint64_t v2 = 1LL;
  }
  if (a1 && a2)
  {
    unint64_t Property = (const __CFNumber *)WiFiNetworkGetProperty(a1, @"Strength");
    if (Property) {
      CFNumberGetValue(Property, kCFNumberFloatType, (char *)&valuePtr + 4);
    }
    CFIndex v5 = (const __CFNumber *)WiFiNetworkGetProperty(a2, @"Strength");
    if (v5)
    {
      CFNumberGetValue(v5, kCFNumberFloatType, &valuePtr);
      float v6 = *(float *)&valuePtr;
    }

    else
    {
      float v6 = 0.0;
    }

    uint64_t v2 = -1LL;
  }

  return v2;
}

CFArrayRef WiFiNetworkIsMultiAPEnvironment(uint64_t a1)
{
  int valuePtr = 0;
  uint64_t result = (const __CFArray *)WiFiNetworkGetProperty(a1, @"networkKnownBSSListKey");
  if (result)
  {
    uint64_t v2 = result;
    CFIndex Count = CFArrayGetCount(result);
    if (Count >= 2)
    {
      CFIndex v4 = Count;
      uint64_t v5 = 0LL;
      uint64_t v6 = 0LL;
      uint64_t v7 = 0LL;
      CFIndex v8 = 0LL;
      unsigned int v17 = -1431655766;
      do
      {
        ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v2, v8);
        if (ValueAtIndex)
        {
          CFDateRef v10 = ValueAtIndex;
          unint64_t Value = (const __CFNumber *)CFDictionaryGetValue(ValueAtIndex, @"CHANNEL");
          BOOL v12 = (const __CFNumber *)CFDictionaryGetValue(v10, @"CHANNEL_FLAGS");
          if (Value)
          {
            int v13 = v12;
            if (v12)
            {
              CFNumberGetValue(Value, kCFNumberSInt32Type, &valuePtr);
              CFNumberGetValue(v13, kCFNumberSInt32Type, &v17);
              if (valuePtr)
              {
                if (v17)
                {
                  if ((v17 & 8) != 0)
                  {
                    ++v7;
                  }

                  else if ((v17 & 0x10) != 0)
                  {
                    ++v6;
                  }

                  else
                  {
                    v5 += ((unint64_t)v17 >> 13) & 1;
                  }
                }
              }
            }
          }
        }

        ++v8;
      }

      while (v4 != v8);
      return (const __CFArray *)(v6 > 1 || v7 > 1 || v5 > 1);
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

uint64_t WiFiNetworkCompareHomeState(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  if (!(a1 | a2)) {
    return 0LL;
  }
  if (a1)
  {
    int ForcedHomeFix = WiFiNetworkGetForcedHomeFix(a1);
    if (ForcedHomeFix == 1)
    {
      objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
      int v7 = 1;
    }

    else
    {
      int v7 = 0;
    }

    NetworkOfInterestHomeint Type = WiFiNetworkGetNetworkOfInterestHomeType(a1);
    if (NetworkOfInterestHomeType == 1)
    {
      objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
      int v9 = 1;
    }

    else
    {
      int v9 = 0;
    }

    BOOL v10 = CFDictionaryContainsKey(*(CFDictionaryRef *)(a1 + 16), @"PayloadUUID") != 0;
    unint64_t Property = (const __CFDate *)WiFiNetworkGetProperty(a1, @"addedAt");
    if (!a2)
    {
      uint64_t result = -1LL;
      if (ForcedHomeFix != 1 && NetworkOfInterestHomeType != 1) {
        return 0LL;
      }
      return result;
    }

    int v28 = Property;
  }

  else
  {
    if (!a2) {
      return 0LL;
    }
    int v9 = 0;
    int v7 = 0;
    BOOL v10 = 0;
    int v28 = 0LL;
  }

  int v13 = WiFiNetworkGetForcedHomeFix(a2);
  if (v13 == 1) {
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
  }
  unsigned int v14 = WiFiNetworkGetNetworkOfInterestHomeType(a2);
  if (v14 == 1) {
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
  }
  int v15 = CFDictionaryContainsKey(*(CFDictionaryRef *)(a2 + 16), @"PayloadUUID");
  BOOL v16 = (const __CFDate *)WiFiNetworkGetProperty(a2, @"addedAt");
  if (a1 && a2)
  {
    unsigned int v17 = v16;
    if (v7 && v13 == 1)
    {
      CFIndex v18 = (const __CFDate *)WiFiNetworkGetProperty(a1, @"kWiFiNetworkLastHomeForceFixDateKey");
      unsigned int v17 = (const __CFDate *)WiFiNetworkGetProperty(a2, @"kWiFiNetworkLastHomeForceFixDateKey");
      BOOL v16 = v18;
LABEL_23:
      CFComparisonResult v19 = CFDateCompare(v16, v17, 0LL);
      objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
      BOOL v20 = v19 == kCFCompareLessThan;
      goto LABEL_50;
    }

    if (v7 && v15 || v10 && v13 == 1)
    {
      if (v7) {
        uint64_t v21 = a1;
      }
      else {
        uint64_t v21 = a2;
      }
      unsigned int v22 = (const __CFDate *)WiFiNetworkGetProperty(v21, @"kWiFiNetworkLastHomeForceFixDateKey");
      if (v10) {
        uint64_t v23 = a1;
      }
      else {
        uint64_t v23 = a2;
      }
      CFIndex v24 = (const __CFDate *)WiFiNetworkGetProperty(v23, @"addedAt");
      CFComparisonResult v25 = CFDateCompare(v22, v24, 0LL);
      objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
      if (v25 == kCFCompareLessThan)
      {
        BOOL v20 = v7 == 0;
        uint64_t v26 = -1LL;
LABEL_51:
        if (v20) {
          return v26;
        }
        else {
          return -v26;
        }
      }

      BOOL v20 = v7 == 0;
LABEL_50:
      uint64_t v26 = 1LL;
      goto LABEL_51;
    }

    if (v7) {
      BOOL v27 = v13 == 1;
    }
    else {
      BOOL v27 = 1;
    }
    if (!v27) {
      goto LABEL_65;
    }
    if (!v7 && v13 == 1) {
      goto LABEL_62;
    }
    if (v10 && !v15)
    {
LABEL_65:
      objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C](v16, v17));
      return -1LL;
    }

    if (!v10 && v15)
    {
LABEL_62:
      objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
      return 1LL;
    }

    if (v10 && v15)
    {
      BOOL v16 = v28;
      if (v28)
      {
        if (v17) {
          goto LABEL_23;
        }
        goto LABEL_65;
      }

      goto LABEL_62;
    }

    if (v9 && v14 != 1) {
      goto LABEL_65;
    }
    if (!v9 && v14 == 1) {
      goto LABEL_62;
    }
    if (a3) {
      *a3 = v9;
    }
    return 0LL;
  }

  if (v7) {
    uint64_t result = -1LL;
  }
  else {
    uint64_t result = 1LL;
  }
  if (!v7 && v13 != 1)
  {
    uint64_t result = v9 ? -1LL : 1LL;
    if (!v9 && v14 != 1) {
      return 0LL;
    }
  }

  return result;
}

uint64_t WiFiNetworkGetForcedHomeFix(uint64_t a1)
{
  if (!a1)
  {
LABEL_5:
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
    return 0LL;
  }

  unint64_t Property = (const __CFBoolean *)WiFiNetworkGetProperty(a1, @"NetworkForcedHomeFix");
  if (Property)
  {
    uint64_t v2 = Property;
    CFTypeID v3 = CFGetTypeID(Property);
    if (v3 == CFBooleanGetTypeID()) {
      return CFBooleanGetValue(v2);
    }
    goto LABEL_5;
  }

  return 0LL;
}

const void *WiFiNetworkGetLastHomeForceFixDate(uint64_t a1)
{
  if (a1) {
    return WiFiNetworkGetProperty(a1, @"kWiFiNetworkLastHomeForceFixDateKey");
  }
  objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
  return 0LL;
}

CFDictionaryRef WiFiNetworkIsPublicHotspot(uint64_t a1)
{
  char valuePtr = 0;
  uint64_t result = (const __CFDictionary *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"11U_INTERWORKING_IE");
  if (result)
  {
    uint64_t result = (const __CFDictionary *)CFDictionaryGetValue(result, @"INTERWORKING_ACCESS_NETWORK_TYPE");
    if (result)
    {
      CFNumberGetValue(result, kCFNumberSInt8Type, &valuePtr);
      return (valuePtr & 0xFE == 2);
    }
  }

  return result;
}

BOOL WiFiNetworkIsHotspot(uint64_t a1)
{
  return CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"IsHotspot") == (const void *)*MEMORY[0x189604DE8]
      || WiFiNetworkIsLegacyHotspot(a1)
      || WiFiNetworkIsHotspot20(a1);
}

void WiFiNetworkDumpHS20AccountInfo(uint64_t a1, __CFString *a2)
{
  value = (void *)*MEMORY[0x189604DE0];
  if (a2)
  {
    CFIndex v4 = (const __CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"DomainName");
    if (v4)
    {
      uint64_t v5 = v4;
      CFStringAppend(a2, @"\nDomain name ");
      CFStringAppend(a2, v5);
    }

    uint64_t v6 = (const __CFArray *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"RoamingConsortiumOIs");
    if (v6)
    {
      int v7 = v6;
      CFIndex Count = CFArrayGetCount(v6);
      if (Count)
      {
        uint64_t v9 = Count;
        CFStringAppend(a2, @"\nRoaming Consortium OI ");
        if (v9 >= 1)
        {
          for (CFIndex i = 0LL; i != v9; ++i)
          {
            ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v7, i);
            CFStringAppend(a2, ValueAtIndex);
            CFStringAppend(a2, @" ");
          }
        }
      }
    }

    BOOL v12 = (const __CFArray *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"NaiRealmName");
    if (v12)
    {
      int v13 = v12;
      CFIndex v14 = CFArrayGetCount(v12);
      if (v14)
      {
        uint64_t v15 = v14;
        CFStringAppend(a2, @"\nNAI Realm Name ");
        if (v15 >= 1)
        {
          for (CFIndex j = 0LL; j != v15; ++j)
          {
            unsigned int v17 = (const __CFString *)CFArrayGetValueAtIndex(v13, j);
            CFStringAppend(a2, v17);
            CFStringAppend(a2, @" ");
          }
        }
      }
    }

    CFIndex v18 = (const __CFArray *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"MCCandMNC");
    if (v18)
    {
      CFComparisonResult v19 = v18;
      CFIndex v20 = CFArrayGetCount(v18);
      if (v20)
      {
        uint64_t v21 = v20;
        CFStringAppend(a2, @"\n3GPP MCC&MNC ");
        if (v21 >= 1)
        {
          for (CFIndex k = 0LL; k != v21; ++k)
          {
            uint64_t v23 = (const __CFString *)CFArrayGetValueAtIndex(v19, k);
            CFStringAppend(a2, v23);
            CFStringAppend(a2, @" ");
          }
        }
      }
    }

    CFIndex v24 = (const __CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"DisplayedOperatorName");
    if (v24)
    {
      CFComparisonResult v25 = v24;
      CFStringAppend(a2, @"\nFriendly Operator Name ");
      CFStringAppend(a2, v25);
    }

    if (CFDictionaryGetValueIfPresent(*(CFDictionaryRef *)(a1 + 16), @"SPRoaming", (const void **)&value))
    {
      CFStringAppend(a2, @"\nRoaming set to: ");
      if (value) {
        uint64_t v26 = @"true";
      }
      else {
        uint64_t v26 = @"false";
      }
      CFStringAppend(a2, v26);
    }
  }

__CFDictionary *WiFiNetworkCopyHS20Account(uint64_t a1)
{
  CFMutableArrayRef Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
  if (Mutable)
  {
    unint64_t Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"DomainName");
    if (Value) {
      CFDictionaryAddValue(Mutable, @"DomainName", Value);
    }
    CFIndex v4 = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"DisplayedOperatorName");
    if (v4) {
      CFDictionaryAddValue(Mutable, @"DisplayedOperatorName", v4);
    }
    uint64_t v5 = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"RoamingConsortiumOIs");
    if (v5) {
      CFDictionaryAddValue(Mutable, @"RoamingConsortiumOIs", v5);
    }
    uint64_t v6 = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"NaiRealmName");
    if (v6) {
      CFDictionaryAddValue(Mutable, @"NaiRealmName", v6);
    }
    int v7 = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"MCCandMNC");
    if (v7) {
      CFDictionaryAddValue(Mutable, @"MCCandMNC", v7);
    }
  }

  return Mutable;
}

void WiFiNetworkSetProvisionedHS20Network(uint64_t a1, int a2)
{
  uint64_t v2 = (const void **)MEMORY[0x189604DE8];
  if (!a2) {
    uint64_t v2 = (const void **)MEMORY[0x189604DE0];
  }
  WiFiNetworkSetProperty(a1, @"HS20ProvisionedNetwork", *v2);
}

BOOL WiFiNetworkIsProvisionedHS20Network(uint64_t a1)
{
  return WiFiNetworkGetProperty(a1, @"HS20ProvisionedNetwork") == (const void *)*MEMORY[0x189604DE8];
}

void WiFiNetworkSetHS20HomeOperatorNetwork(uint64_t a1, int a2)
{
  uint64_t v2 = (const void **)MEMORY[0x189604DE8];
  if (!a2) {
    uint64_t v2 = (const void **)MEMORY[0x189604DE0];
  }
  WiFiNetworkSetProperty(a1, @"HS20HomeOperatorNetwork", *v2);
}

const void *WiFiNetworkGetHS2NetworkBadge(uint64_t a1)
{
  uint64_t result = WiFiNetworkGetProperty(a1, @"HS2NetworkBadge");
  if (!result) {
    return WiFiNetworkGetHS20OperatorFriendlyName(a1);
  }
  return result;
}

const void *WiFiNetworkGetHS20OperatorFriendlyName(uint64_t a1)
{
  unint64_t Property = (const __CFDictionary *)WiFiNetworkGetProperty(a1, @"HS20GasResponse");
  if (Property
    && (unint64_t Value = (const __CFArray *)CFDictionaryGetValue(Property, @"ANQP_OPERATOR_NAMES_LIST")) != 0LL
    && (CFTypeID v3 = Value, CFArrayGetCount(Value) >= 1)
    && (ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v3, 0LL)) != 0LL)
  {
    return CFDictionaryGetValue(ValueAtIndex, @"ANQP_OPERATOR_NAME");
  }

  else
  {
    return 0LL;
  }

const void *WiFiNetworkGetGasResponse(uint64_t a1)
{
  return WiFiNetworkGetProperty(a1, @"HS20GasResponse");
}

const void *WiFiNetworkGetHS20DomainName(uint64_t a1)
{
  unint64_t Property = (const __CFDictionary *)WiFiNetworkGetProperty(a1, @"HS20GasResponse");
  if (!Property) {
    return WiFiNetworkGetProperty(a1, @"DomainName");
  }
  unint64_t Value = (const __CFArray *)CFDictionaryGetValue(Property, @"ANQP_DOMAIN_NAME_LIST");
  if (Value && (CFIndex v4 = Value, CFArrayGetCount(Value) >= 1)) {
    return CFArrayGetValueAtIndex(v4, 0LL);
  }
  else {
    return 0LL;
  }
}

void WiFiNetworkSetGasResponse(uint64_t a1, const void *a2)
{
  if (WiFiNetworkGetProperty(a1, @"HS20GasResponse")) {
    WiFiNetworkSetProperty(a1, @"HS20GasResponse", 0LL);
  }
  WiFiNetworkSetProperty(a1, @"HS20GasResponse", a2);
}

uint64_t WiFiNetworkIsScannedNetworkMatchingHS20Account(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = 0LL;
  if (a1 && a2)
  {
    unint64_t Property = (const __CFDictionary *)WiFiNetworkGetProperty(a1, @"HS20GasResponse");
    if (Property)
    {
      uint64_t v5 = Property;
      uint64_t v6 = WiFiNetworkGetProperty(a2, @"DomainName");
      unint64_t Value = (const __CFArray *)CFDictionaryGetValue(v5, @"ANQP_DOMAIN_NAME_LIST");
      if (Value && (CFIndex v8 = Value, CFArrayGetCount(Value) >= 1))
      {
        CFIndex v9 = 0LL;
        while (1)
        {
          ValueAtIndex = CFArrayGetValueAtIndex(v8, v9);
          if (ValueAtIndex)
          {
            if (v6 && CFEqual(ValueAtIndex, v6)) {
              break;
            }
          }

          if (++v9 >= CFArrayGetCount(v8)) {
            goto LABEL_11;
          }
        }

        objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
        char v11 = 0;
        uint64_t v2 = 1LL;
      }

      else
      {
LABEL_11:
        uint64_t v2 = 0LL;
        char v11 = 1;
      }

      BOOL v12 = WiFiNetworkGetProperty(a2, @"SPRoaming");
      objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C](v12));
      int v13 = (const __CFArray *)WiFiNetworkGetProperty(a2, @"MCCandMNC");
      if (v13)
      {
        CFIndex v14 = v13;
        CFIndex Count = CFArrayGetCount(v13);
        char v16 = v11 ^ 1;
        if (Count < 1) {
          char v16 = 1;
        }
        if ((v16 & 1) == 0)
        {
          CFIndex v17 = 0LL;
          while (1)
          {
            CFIndex v18 = CFArrayGetValueAtIndex(v14, v17);
            if (v18)
            {
              CFComparisonResult v19 = v18;
              objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
              CFIndex v20 = (const __CFArray *)CFDictionaryGetValue(v5, @"ANQP_CELL_NETWORK_INFO");
              if (v20)
              {
                uint64_t v21 = v20;
                objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
                v44.length = CFArrayGetCount(v21);
                v44.location = 0LL;
                if (CFArrayContainsValue(v21, v44, v19)) {
                  break;
                }
              }
            }

            if (++v17 >= CFArrayGetCount(v14))
            {
              uint64_t v2 = 0LL;
              goto LABEL_24;
            }
          }

          objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
          uint64_t v2 = 1LL;
        }
      }

LABEL_36:
              uint64_t v2 = 0LL;
            }

            int v31 = 1;
LABEL_38:
            CFIndex v32 = CFArrayGetCount(v23);
            if (v31)
            {
              if (++v25 < v32) {
                continue;
              }
            }

            break;
          }
        }
      }

      CFNumberRef v33 = (const __CFArray *)WiFiNetworkGetProperty(a2, @"RoamingConsortiumOIs");
      if (v33)
      {
        CFNumberRef v34 = v33;
        CFIndex v35 = CFArrayGetCount(v33);
        if (!(_DWORD)v2 && v35 >= 1)
        {
          CFIndex v36 = 0LL;
          while (1)
          {
            uint64_t v2 = (uint64_t)CFArrayGetValueAtIndex(v34, v36);
            if (v2)
            {
              objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
              int v37 = (const __CFArray *)CFDictionaryGetValue(v5, @"ANQP_ROAMING_CONSORTIUM_OI_LIST");
              if (v37)
              {
                char v38 = v37;
                objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
                if (CFArrayGetCount(v38) >= 1)
                {
                  CFIndex v39 = 0LL;
                  while (1)
                  {
                    uint64_t v40 = (const __CFString *)CFArrayGetValueAtIndex(v38, v39);
                    if (v40)
                    {
                      if (CFStringCompare(v40, (CFStringRef)v2, 1uLL) == kCFCompareEqualTo) {
                        break;
                      }
                    }

                    if (++v39 >= CFArrayGetCount(v38)) {
                      goto LABEL_53;
                    }
                  }

                  objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
                  int v41 = 0;
                  uint64_t v2 = 1LL;
                  goto LABEL_55;
                }
              }

LABEL_53:
              uint64_t v2 = 0LL;
            }

            int v41 = 1;
LABEL_55:
            CFIndex v42 = CFArrayGetCount(v34);
            if (v41)
            {
              if (++v36 < v42) {
                continue;
              }
            }

            return v2;
          }
        }
      }
    }

    else
    {
      return 0LL;
    }
  }

  return v2;
}

CFDictionaryRef *WiFiNetworkIsFullyLoaded(CFDictionaryRef *result)
{
  __int16 valuePtr = 0;
  __int16 v3 = 0;
  if (result)
  {
    uint64_t v1 = result;
    uint64_t result = (CFDictionaryRef *)CFDictionaryGetValue(result[2], @"EXT_CAPS");
    if (result)
    {
      uint64_t result = (CFDictionaryRef *)CFDictionaryGetValue((CFDictionaryRef)result, @"BSS_TRANS_MGMT");
      if (result)
      {
        CFNumberGetValue((CFNumberRef)result, kCFNumberSInt8Type, &valuePtr);
        if ((_BYTE)valuePtr)
        {
          uint64_t result = (CFDictionaryRef *)CFDictionaryGetValue(v1[2], @"QBSS_LOAD_IE");
          if (result)
          {
            uint64_t v2 = (const __CFDictionary *)result;
            uint64_t result = (CFDictionaryRef *)CFDictionaryGetValue((CFDictionaryRef)result, @"QBSS_CHAN_UTIL");
            if (result)
            {
              CFNumberGetValue((CFNumberRef)result, kCFNumberSInt8Type, (char *)&valuePtr + 1);
              uint64_t result = (CFDictionaryRef *)CFDictionaryGetValue(v2, @"QBSS_STA_COUNT");
              if (result)
              {
                CFNumberGetValue((CFNumberRef)result, kCFNumberSInt16Type, &v3);
                return (CFDictionaryRef *)(v3 == -1);
              }
            }
          }
        }

        else
        {
          return 0LL;
        }
      }
    }
  }

  return result;
}

void WiFiNetworkSetPasswordModificationDate(const void *a1, const void *a2)
{
  if (a1 && a2)
  {
    SSID = WiFiNetworkGetSSID(a1);
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
    if (SSID) {
      WiFiNetworkSetProperty((uint64_t)a1, @"WiFiNetworkPasswordModificationDate", a2);
    }
  }

  else
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
  }

const void *WiFiNetworkGetPasswordModificationDate(uint64_t a1)
{
  if (a1) {
    return WiFiNetworkGetProperty(a1, @"WiFiNetworkPasswordModificationDate");
  }
  objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
  return 0LL;
}

CFTypeRef WiFiNetworkCopyKeychainModDate(const void *a1)
{
  if (a1)
  {
    AccountForNetworCFIndex k = WiFiNetworkGetAccountForNetwork(a1);
    return WiFiSecurityCopyPasswordModificationDate(AccountForNetwork);
  }

  else
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
    return 0LL;
  }

CFDictionaryRef WiFiNetworkIsFullyQualifiedCarPlayNetwork(uint64_t a1)
{
  uint64_t result = (const __CFDictionary *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"APPLE_DEVICE_IE");
  if (result)
  {
    unint64_t Value = CFDictionaryGetValue(result, @"APPLE_DEVICE_IE_FEATURE_SUPPORTS_CARPLAY");
    return Value && Value == (const void **MEMORY[0x189604DE8]);
  }

  return result;
}

uint64_t WiFiNetworkIsCarPlay(uint64_t a1)
{
  if (a1 && (uint64_t v2 = *(const __CFDictionary **)(a1 + 16)) != 0LL)
  {
    unint64_t Value = (const __CFDictionary *)CFDictionaryGetValue(v2, @"APPLE_DEVICE_IE");
    CFIndex v4 = (CFTypeRef *)MEMORY[0x189604DE8];
    if (Value)
    {
      CFTypeRef v5 = CFDictionaryGetValue(Value, @"APPLE_DEVICE_IE_FEATURE_SUPPORTS_CARPLAY");
      if (v5) {
        BOOL v6 = v5 == *v4;
      }
      else {
        BOOL v6 = 0;
      }
      uint64_t v7 = v6;
    }

    else
    {
      uint64_t v7 = 0LL;
    }

    CFIndex v8 = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"CARPLAY_NETWORK");
    if (v8)
    {
      if (CFEqual(v8, *v4)) {
        return 1LL;
      }
      else {
        return v7;
      }
    }
  }

  else
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
    return 0LL;
  }

  return v7;
}

BOOL WiFiNetworkIs24GHzNetwork(uint64_t a1)
{
  unint64_t Property = (const __CFNumber *)WiFiNetworkGetProperty(a1, @"CHANNEL");
  int v7 = -1431655766;
  __int16 v3 = (const __CFNumber *)WiFiNetworkGetProperty(a1, @"CHANNEL_FLAGS");
  if (v3)
  {
    unsigned int valuePtr = 0;
    CFNumberGetValue(v3, kCFNumberIntType, &valuePtr);
    return (valuePtr >> 3) & 1;
  }

  else
  {
    uint64_t Value = CFNumberGetValue(Property, kCFNumberSInt32Type, &v7);
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C](Value));
    return (v7 - 1) < 0xE;
  }

uint64_t WiFiNetworkGetType(uint64_t a1)
{
  unint64_t Property = WiFiNetworkGetProperty(a1, @"CARPLAY_NETWORK");
  if (Property && CFEqual(Property, (CFTypeRef)*MEMORY[0x189604DE8]))
  {
    if (WiFiNetworkGetProperty(a1, @"lastJoined")
      || a1 && CFDictionaryContainsKey(*(CFDictionaryRef *)(a1 + 16), @"PayloadUUID"))
    {
      unsigned int v3 = 2;
    }

    else
    {
      unsigned int v3 = 1;
    }
  }

  else
  {
    unsigned int v3 = 0;
  }

  if (WiFiNetworkIsHotspot20(a1)) {
    return 3LL;
  }
  else {
    return v3;
  }
}

CFIndex WiFiNetworkDumpRecords(CFIndex result)
{
  if (result)
  {
    uint64_t v1 = (const __CFArray *)result;
    uint64_t result = CFArrayGetCount((CFArrayRef)result);
    if (result >= 1)
    {
      for (CFIndex i = 0LL; i < result; ++i)
      {
        if (CFArrayGetValueAtIndex(v1, i)) {
          objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
        }
        uint64_t result = CFArrayGetCount(v1);
      }
    }
  }

  return result;
}

void WiFiNetworkRemoveCarPlaySettings(uint64_t a1)
{
}

const void *WiFiNetworkCopyLeakyStatus(uint64_t a1, const __CFString *a2)
{
  if (!a1) {
    goto LABEL_18;
  }
  if (!a2) {
    goto LABEL_18;
  }
  unint64_t Property = (const __CFString *)WiFiNetworkGetProperty(a1, @"BSSID");
  if (!Property) {
    goto LABEL_18;
  }
  if (CFStringCompare(a2, Property, 0LL) == kCFCompareEqualTo)
  {
    uint64_t result = WiFiNetworkGetProperty(a1, @"LEAKY_AP_LEARNED_DATA");
    if (!result) {
      return result;
    }
    goto LABEL_14;
  }

  CFTypeRef v5 = (const __CFArray *)WiFiNetworkGetProperty(a1, @"networkKnownBSSListKey");
  if (!v5 || (v6 = v5, (CFIndex Count = CFArrayGetCount(v5)) == 0))
  {
LABEL_18:
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
    return 0LL;
  }

  CFIndex v8 = Count;
  if (Count < 1) {
    return 0LL;
  }
  CFIndex v9 = 0LL;
  while (1)
  {
    ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v6, v9);
    if (ValueAtIndex)
    {
      char v11 = ValueAtIndex;
      uint64_t Value = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, @"BSSID");
      if (CFStringCompare(a2, Value, 0LL) == kCFCompareEqualTo) {
        break;
      }
    }

    if (v8 == ++v9) {
      return 0LL;
    }
  }

  uint64_t result = CFDictionaryGetValue(v11, @"LEAKY_AP_LEARNED_DATA");
  if (result)
  {
LABEL_14:
    Apple80211CopyLeakyAPStatus();
    return 0LL;
  }

  return result;
}

BOOL WiFiNetworkIsAPLeaky(uint64_t a1, const __CFString *a2)
{
  uint64_t v2 = (const __CFNumber *)WiFiNetworkCopyLeakyStatus(a1, a2);
  if (v2)
  {
    unsigned int v3 = v2;
    char valuePtr = -86;
    CFNumberGetValue(v2, kCFNumberSInt8Type, &valuePtr);
    BOOL v4 = valuePtr == 2;
    CFRelease(v3);
  }

  else
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
    return 0LL;
  }

  return v4;
}

CFDictionaryRef WiFiNetworkIsChargeablePublicNetwork(uint64_t a1)
{
  uint64_t result = (const __CFDictionary *)WiFiNetworkGetProperty(a1, @"11U_INTERWORKING_IE");
  if (result)
  {
    uint64_t result = (const __CFDictionary *)CFDictionaryGetValue(result, @"INTERWORKING_ACCESS_NETWORK_TYPE");
    if (result)
    {
      char valuePtr = 0;
      CFNumberGetValue(result, kCFNumberSInt8Type, &valuePtr);
      return valuePtr == 2;
    }
  }

  return result;
}

BOOL WiFiNetworkIsMetered(uint64_t a1)
{
  if (WiFiNetworkIsHotspot20(a1)
    || MEMORY[0x18960D5A8]
    && CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), (const void *)*MEMORY[0x18960D690]) == (const void *)*MEMORY[0x189604DE8])
  {
    unsigned int v2 = WiFiNetworkIsChargeablePublicNetwork(a1);
  }

  else
  {
    unsigned int v2 = 0;
  }

  return WiFiNetworkIsApplePersonalHotspot(a1) || WiFiNetworkIsCarPlay(a1) || v2;
}

uint64_t WiFiNetworkIsInSaveDataMode(uint64_t a1)
{
  int valuePtr = 0;
  unint64_t Property = (const __CFNumber *)WiFiNetworkGetProperty(a1, @"SaveDataMode");
  if (Property)
  {
    CFNumberGetValue(Property, kCFNumberSInt32Type, &valuePtr);
    BOOL v3 = valuePtr == 1;
    if (valuePtr) {
      return v3;
    }
  }

  else
  {
    BOOL v3 = 0LL;
  }

  if (WiFiNetworkIsApplePersonalHotspot(a1)
    || WiFiNetworkFoundNanIe(a1)
    || WiFiNetworkIsCarPlay(a1))
  {
    return 1LL;
  }

  return v3;
}

CFNumberRef WiFiNetworkGetSaveDataMode(uint64_t a1)
{
  unsigned int valuePtr = 0;
  uint64_t result = (const __CFNumber *)WiFiNetworkGetProperty(a1, @"SaveDataMode");
  if (result)
  {
    CFNumberGetValue(result, kCFNumberSInt32Type, &valuePtr);
    return (const __CFNumber *)valuePtr;
  }

  return result;
}

double WiFiNetworkGetNetworkQualityResponsiveness(uint64_t a1)
{
  double valuePtr = 0.0;
  unint64_t Property = (const __CFNumber *)WiFiNetworkGetProperty(a1, @"NetworkQualityResponsiveness");
  if (Property) {
    unint64_t Property = (const __CFNumber *)CFNumberGetValue(Property, kCFNumberDoubleType, &valuePtr);
  }
  objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C](Property));
  return valuePtr;
}

const void *WiFiNetworkGetNetworkQualityDate(uint64_t a1)
{
  unint64_t Property = WiFiNetworkGetProperty(a1, @"NetworkQualityDate");
  objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
  return Property;
}

void WiFiNetworkSetNetworkQuality(uint64_t a1, const void *a2, double a3)
{
  double valuePtr = a3;
  objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
  CFNumberRef v5 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x189604DB0], kCFNumberDoubleType, &valuePtr);
  if (v5)
  {
    CFNumberRef v6 = v5;
    WiFiNetworkSetProperty(a1, @"NetworkQualityResponsiveness", v5);
    WiFiNetworkSetProperty(a1, @"NetworkQualityDate", a2);
    CFRelease(v6);
  }

  else
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
  }

void WiFiNetworkDisableAutoJoinUntilFirstUserJoin(uint64_t a1, int a2)
{
  if (a1)
  {
    BOOL v4 = (const void **)MEMORY[0x189604DE8];
    if (!a2) {
      BOOL v4 = (const void **)MEMORY[0x189604DE0];
    }
    WiFiNetworkSetProperty(a1, @"DisableWiFiAutoJoinUntilFirstUserJoin", *v4);
  }

uint64_t WiFiNetworkIsAutoJoinDisabledUntilFirstUserJoin(uint64_t a1)
{
  if (!a1)
  {
LABEL_5:
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
    return 0LL;
  }

  unint64_t Property = (const __CFBoolean *)WiFiNetworkGetProperty(a1, @"DisableWiFiAutoJoinUntilFirstUserJoin");
  if (Property)
  {
    unsigned int v2 = Property;
    CFTypeID v3 = CFGetTypeID(Property);
    if (v3 == CFBooleanGetTypeID()) {
      return CFBooleanGetValue(v2);
    }
    goto LABEL_5;
  }

  return 0LL;
}

CFBooleanRef WiFiNetworkIsInfrequentlyJoinedPublicNetwork(uint64_t a1)
{
  if (!a1) {
    goto LABEL_8;
  }
  uint64_t result = (const __CFBoolean *)WiFiNetworkGetProperty(a1, @"WiFiNetworkAttributeIsPublic");
  if (!result) {
    return result;
  }
  CFTypeID v3 = result;
  CFTypeID v4 = CFGetTypeID(result);
  if (v4 != CFBooleanGetTypeID())
  {
LABEL_8:
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
    return 0LL;
  }

  uint64_t result = (const __CFBoolean *)CFBooleanGetValue(v3);
  if ((_DWORD)result) {
    return (const __CFBoolean *)(WiFiNetworkGetTimeIntervalSinceLastAssociation(a1) > 1209600.0);
  }
  return result;
}

BOOL WiFiNetworkIsBypassCaptiveEnabled(uint64_t a1)
{
  unint64_t Property = WiFiNetworkGetProperty(a1, @"CaptiveBypass");
  return Property && Property == (const void *)*MEMORY[0x189604DE8];
}

void WiFiNetworkAddBundleIdentifier(uint64_t a1, const void *a2)
{
  if (a1) {
    WiFiNetworkSetProperty(a1, @"BundleIdentifier", a2);
  }
  else {
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
  }
}

const void *WiFiNetworkGetBundleIdentifier(uint64_t a1)
{
  if (a1) {
    return WiFiNetworkGetProperty(a1, @"BundleIdentifier");
  }
  objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
  return 0LL;
}

void WiFiNetworkAddOriginator(uint64_t a1, unsigned int a2)
{
  if (a1) {
    WiFiNetworkSetIntProperty(a1, @"NetworkOriginator", a2);
  }
  else {
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
  }
}

void WiFiNetworkSetOriginatorName(uint64_t a1, const void *a2)
{
  if (a1) {
    WiFiNetworkSetProperty(a1, @"NetworkOriginatorName", a2);
  }
  else {
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
  }
}

CFNumberRef WiFiNetworkGetOriginator(uint64_t a1)
{
  if (a1)
  {
    unint64_t Property = (const __CFNumber *)WiFiNetworkGetProperty(a1, @"NetworkOriginator");
    return _CFTypeGetIntValue(Property);
  }

  else
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
    return 0LL;
  }

uint64_t WiFiNetworkGetUserRole(uint64_t a1)
{
  uint64_t v1 = 1LL;
  unsigned int valuePtr = 1;
  unint64_t Property = (const __CFNumber *)WiFiNetworkGetProperty(a1, @"UserRole");
  if (Property)
  {
    CFNumberGetValue(Property, kCFNumberIntType, &valuePtr);
    return valuePtr;
  }

  return v1;
}

uint64_t WiFiNetworkGetFirstIndexMatchingSSIDNetwork(const __CFArray *a1, uint64_t a2)
{
  CFIndex v2 = -1LL;
  if (a1 && a2 && CFArrayGetCount(a1) >= 1)
  {
    CFIndex v2 = 0LL;
    while (1)
    {
      ValueAtIndex = (CFTypeRef *)CFArrayGetValueAtIndex(a1, v2);
      if (ValueAtIndex)
      {
        CFNumberRef v6 = ValueAtIndex;
        CFTypeID v7 = CFGetTypeID(ValueAtIndex);
        uint64_t v8 = __kWiFiNetworkTypeID;
        if (!__kWiFiNetworkTypeID)
        {
          pthread_once(&__wifiNetworkTypeInit, (void (*)(void))__WiFiNetworkRegister);
          uint64_t v8 = __kWiFiNetworkTypeID;
        }

        if (v7 == v8
          && __WiFiCompareDictionaryValues(v6[2], *(const __CFDictionary **)(a2 + 16), @"SSID_STR"))
        {
          break;
        }
      }

      if (++v2 >= CFArrayGetCount(a1)) {
        return -1LL;
      }
    }
  }

  return v2;
}

BOOL WiFiNetworkIsCarrierBundleBased(uint64_t a1)
{
  if (a1)
  {
    unint64_t Property = (const __CFNumber *)WiFiNetworkGetProperty(a1, @"NetworkOriginator");
    return _CFTypeGetIntValue(Property) == 2;
  }

  else
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
    return 0LL;
  }

const void *WiFiNetworkGetDisabledUntilDate(uint64_t a1)
{
  if (a1) {
    return WiFiNetworkGetProperty(a1, @"WiFiNetworkDisabledUntilDate");
  }
  objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
  return 0LL;
}

CFArrayRef WiFiNetworkCanExposeIMSI(uint64_t a1)
{
  if (!a1) {
    goto LABEL_10;
  }
  if (__WiFiNetworkIsEAPWithType(a1, 18)
    || __WiFiNetworkIsEAPWithType(a1, 23)
    || (uint64_t result = __WiFiNetworkIsEAPWithType(a1, 50), (_DWORD)result))
  {
    unint64_t Property = (const __CFDictionary *)WiFiNetworkGetProperty(a1, @"EnterpriseProfile");
    if (Property)
    {
      uint64_t Value = CFDictionaryGetValue(Property, @"EAPClientConfiguration");
      CFTypeID v5 = CFGetTypeID(Value);
      if (v5 == CFDictionaryGetTypeID())
      {
        if (CFDictionaryContainsKey((CFDictionaryRef)Value, @"EAPSIMAKAEncryptedIdentityEnabled"))
        {
          CFNumberRef v6 = (const __CFNumber *)CFDictionaryGetValue( (CFDictionaryRef)Value,  @"EAPSIMAKAEncryptedIdentityEnabled");
          return (const __CFArray *)(_CFTypeGetIntValue(v6) == 0LL);
        }

        else
        {
          objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
          return (const __CFArray *)1;
        }
      }
    }

void WiFiNetworkRemoveInternalProperties(uint64_t a1)
{
  if (a1)
  {
    if (CFDictionaryContainsKey(*(CFDictionaryRef *)(a1 + 16), @"enabled")) {
      CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 16), @"enabled");
    }
    if (CFDictionaryContainsKey(*(CFDictionaryRef *)(a1 + 16), @"lastAutoJoined")) {
      CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 16), @"lastAutoJoined");
    }
    if (CFDictionaryContainsKey(*(CFDictionaryRef *)(a1 + 16), @"lastJoined")) {
      CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 16), @"lastJoined");
    }
    if (CFDictionaryContainsKey(*(CFDictionaryRef *)(a1 + 16), @"prevJoined")) {
      CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 16), @"prevJoined");
    }
    if (CFDictionaryContainsKey(*(CFDictionaryRef *)(a1 + 16), @"lastRoamed")) {
      CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 16), @"lastRoamed");
    }
  }

  else
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
  }

CFDictionaryRef *WiFiNetworkInterworkingIsOutdoorNetwork(CFDictionaryRef *result)
{
  char valuePtr = -1;
  if (result)
  {
    uint64_t result = (CFDictionaryRef *)CFDictionaryGetValue(result[2], @"11U_INTERWORKING_IE");
    if (result)
    {
      uint64_t result = (CFDictionaryRef *)CFDictionaryGetValue( (CFDictionaryRef)result,  @"INTERWORKING_ACCESS_VENTURE_GRP");
      if (result)
      {
        CFNumberGetValue((CFNumberRef)result, kCFNumberSInt8Type, &valuePtr);
        return (CFDictionaryRef *)(valuePtr == 11);
      }
    }
  }

  return result;
}

CFDictionaryRef *WiFiNetworkInterworkingIsVehicularNetwork(CFDictionaryRef *result)
{
  char valuePtr = -1;
  if (result)
  {
    uint64_t result = (CFDictionaryRef *)CFDictionaryGetValue(result[2], @"11U_INTERWORKING_IE");
    if (result)
    {
      uint64_t result = (CFDictionaryRef *)CFDictionaryGetValue( (CFDictionaryRef)result,  @"INTERWORKING_ACCESS_VENTURE_GRP");
      if (result)
      {
        CFNumberGetValue((CFNumberRef)result, kCFNumberSInt8Type, &valuePtr);
        return (CFDictionaryRef *)(valuePtr == 10);
      }
    }
  }

  return result;
}

CFDictionaryRef WiFiNetworkGetAdvertisedNetworkType(uint64_t a1)
{
  char valuePtr = -1;
  uint64_t result = (const __CFDictionary *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"11U_INTERWORKING_IE");
  if (result)
  {
    uint64_t result = (const __CFDictionary *)CFDictionaryGetValue(result, @"INTERWORKING_ACCESS_NETWORK_TYPE");
    if (result)
    {
      uint64_t Value = CFNumberGetValue(result, kCFNumberSInt8Type, &valuePtr);
      char v3 = valuePtr + 1;
      if ((valuePtr + 1) < 0x13u && ((0x6007Fu >> v3) & 1) != 0)
      {
        return (const __CFDictionary *)dword_1865BCF20[v3];
      }

      else
      {
        objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C](Value));
        return 0LL;
      }
    }
  }

  return result;
}

uint64_t WiFiNetworkArchiveToPath(uint64_t a1, void *a2)
{
  uint64_t v9 = 0LL;
  objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
  uint64_t v4 = [a2 stringByDeletingLastPathComponent];
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1896078A8], "defaultManager"), "fileExistsAtPath:", v4) & 1) == 0
    && !objc_msgSend( (id)objc_msgSend(MEMORY[0x1896078A8], "defaultManager"),  "createDirectoryAtPath:withIntermediateDirectories:attributes:error:",  v4,  0,  0,  &v9))
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
    return 0LL;
  }

  CFDictionaryRef Copy = CFDictionaryCreateCopy((CFAllocatorRef)*MEMORY[0x189604DB0], *(CFDictionaryRef *)(a1 + 16));
  uint64_t v6 = [MEMORY[0x1896079E8] dataWithPropertyList:Copy format:200 options:0 error:0];
  if (v6
    && (objc_msgSend( (id)objc_msgSend(MEMORY[0x1896078A8], "defaultManager"),  "createFileAtPath:contents:attributes:",  a2,  v6,  0) & 1) != 0)
  {
    uint64_t v7 = 1LL;
    if (!Copy) {
      return v7;
    }
    goto LABEL_8;
  }

  objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
  uint64_t v7 = 0LL;
  if (Copy) {
LABEL_8:
  }
    CFRelease(Copy);
  return v7;
}

_WORD *WiFiNetworkCreateFromPath(uint64_t a1)
{
  if (!a1
    || (uint64_t v1 = objc_msgSend((id)objc_msgSend(MEMORY[0x1896078A8], "defaultManager"), "contentsAtPath:", a1)) == 0
    || (uint64_t result = WiFiNetworkCreate( 0,  (CFTypeRef)[MEMORY[0x1896079E8] propertyListWithData:v1 options:0 format:0 error:0])) == 0)
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
    return 0LL;
  }

  return result;
}

uint64_t WiFiNetworkSetUsageRank(uint64_t result, __int16 a2)
{
  *(_WORD *)(result + 24) = a2;
  return result;
}

uint64_t WiFiNetworkGetUsageRank(uint64_t a1)
{
  return *(unsigned __int16 *)(a1 + 24);
}

void WiFiNetworkSetNetworkOfInterestWorkType(uint64_t a1, int a2)
{
  int valuePtr = a2;
  if (a1)
  {
    if ((a2 - 1) > 1)
    {
      int valuePtr = 0;
      CFNumberRef v3 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x189604DB0], kCFNumberIntType, &valuePtr);
      objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
    }

    else
    {
      objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
      CFNumberRef v3 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x189604DB0], kCFNumberIntType, &valuePtr);
    }

    WiFiNetworkSetProperty(a1, @"NetworkOfInterestWorkState", v3);
    if (v3) {
      CFRelease(v3);
    }
  }

CFNumberRef WiFiNetworkGetNetworkOfInterestWorkType(uint64_t a1)
{
  unsigned int valuePtr = 0;
  if (a1)
  {
    uint64_t result = (const __CFNumber *)WiFiNetworkGetProperty(a1, @"NetworkOfInterestWorkState");
    if (result)
    {
      int Value = CFNumberGetValue(result, kCFNumberSInt32Type, &valuePtr);
      if (valuePtr - 3 >= 0xFFFFFFFE || Value == 0) {
        return (const __CFNumber *)valuePtr;
      }
      else {
        return 0LL;
      }
    }
  }

  else
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
    return 0LL;
  }

  return result;
}

void WiFiNetworkSetNetworkOfInterestHomeType(uint64_t a1, int a2)
{
  int valuePtr = a2;
  if (a1)
  {
    if ((a2 - 1) > 1)
    {
      int valuePtr = 0;
      CFNumberRef v3 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x189604DB0], kCFNumberIntType, &valuePtr);
      objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
    }

    else
    {
      objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
      CFNumberRef v3 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x189604DB0], kCFNumberIntType, &valuePtr);
    }

    WiFiNetworkSetProperty(a1, @"NetworkOfInterestHomeState", v3);
    if (v3) {
      CFRelease(v3);
    }
  }

void WiFiNetworkSetForcedHomeFix(const void *a1, int a2)
{
  if (a1)
  {
    uint64_t v4 = (const void **)MEMORY[0x189604DE0];
    if (a2) {
      uint64_t v4 = (const void **)MEMORY[0x189604DE8];
    }
    WiFiNetworkSetProperty((uint64_t)a1, @"NetworkForcedHomeFix", *v4);
    if (a2)
    {
      CFTypeID v5 = (const __CFAllocator *)*MEMORY[0x189604DB0];
      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      CFDateRef v7 = CFDateCreate(v5, Current);
      WiFiNetworkSetLastHomeForceFixDate(a1, v7);
      if (v7) {
        CFRelease(v7);
      }
    }
  }

  else
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
  }

void WiFiNetworkSetLastHomeForceFixDate(const void *a1, const void *a2)
{
  if (a1 && a2)
  {
    SSID = WiFiNetworkGetSSID(a1);
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
    if (SSID) {
      WiFiNetworkSetProperty((uint64_t)a1, @"kWiFiNetworkLastHomeForceFixDateKey", a2);
    }
  }

  else
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
  }

uint64_t WiFiNetworkGetLOIType(uint64_t a1)
{
  unsigned int valuePtr = 0;
  if (!a1
    || (unint64_t Property = (const __CFNumber *)WiFiNetworkGetProperty(a1, @"NetworkAtLocationOfInterestType")) == 0LL
    || !CFNumberGetValue(Property, kCFNumberSInt32Type, &valuePtr))
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
  }

  return valuePtr;
}

void WiFiNetworkSetLOIType(uint64_t a1, int a2)
{
  int valuePtr = a2;
  CFNumberRef v3 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x189604DB0], kCFNumberIntType, &valuePtr);
  objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
  if (v3)
  {
    WiFiNetworkSetProperty(a1, @"NetworkAtLocationOfInterestType", v3);
    CFRelease(v3);
  }

BOOL WiFiNetworkIsSSIDLengthValid(const __CFString *a1)
{
  if (!a1) {
    return 1LL;
  }
  if (CFEqual(a1, @"_AppleWi-FiInternetTetheringSSID_")) {
    return 1LL;
  }
  return CFStringGetLength(a1) < 33;
}

BOOL WiFiNetworkIsInternalNetwork(const void *a1)
{
  SSID = WiFiNetworkGetSSID(a1);
  else {
    BOOL v2 = 1;
  }
  return !v2 && CFSetContainsValue((CFSetRef)__internalSSIDs, SSID);
}

CFNumberRef WiFiNetworkGetShareableStatus(const __CFNumber *result)
{
  if (result)
  {
    if (*((void *)result + 2))
    {
      unint64_t Property = (const __CFNumber *)WiFiNetworkGetProperty((uint64_t)result, @"ShareableStatus");
      return _CFTypeGetIntValue(Property);
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

void WiFiNetworkSetWalletIdentifier(uint64_t a1, const void *a2)
{
  if (a1) {
    WiFiNetworkSetProperty(a1, @"WalletIdentifier", a2);
  }
}

const void *WiFiNetworkGetWalletIdentifier(const void *result)
{
  if (result) {
    return WiFiNetworkGetProperty((uint64_t)result, @"WalletIdentifier");
  }
  return result;
}

void WiFiNetworkUpdateWPARSNAuthType(uint64_t a1, uint64_t a2)
{
  uint64_t valuePtr = a2;
  CFNumberRef v3 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  CFTypeRef cf = CFNumberCreate((CFAllocatorRef)*MEMORY[0x189604DB0], kCFNumberCFIndexType, &valuePtr);
  if (!cf)
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
    return;
  }

  CFArrayRef v4 = CFArrayCreate(v3, &cf, 1LL, MEMORY[0x189605228]);
  if (!v4)
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
    goto LABEL_30;
  }

  CFArrayRef v5 = v4;
  if ((unint64_t)(valuePtr - 1) >= 2)
  {
    if (valuePtr != 8 && valuePtr != 12) {
      goto LABEL_29;
    }
    unint64_t Property = (const __CFDictionary *)WiFiNetworkGetProperty(a1, @"RSN_IE");
    if (Property)
    {
      CFDateRef v7 = Property;
      MutableCFDictionaryRef Copy = CFDictionaryCreateMutableCopy(v3, 0LL, Property);
      if (MutableCopy)
      {
        uint64_t v9 = MutableCopy;
        int Value = (const __CFArray *)CFDictionaryGetValue(v7, @"IE_KEY_RSN_AUTHSELS");
        if (Value && CFArrayGetCount(Value) < 2) {
          goto LABEL_27;
        }
        CFDictionaryReplaceValue(v9, @"IE_KEY_RSN_AUTHSELS", v5);
        char v11 = @"RSN_IE";
LABEL_26:
        WiFiNetworkSetProperty(a1, v11, v9);
LABEL_27:
        CFRelease(v9);
        goto LABEL_29;
      }

      goto LABEL_29;
    }

LABEL_29:
  CFRelease(v5);
LABEL_30:
  if (cf) {
    CFRelease(cf);
  }
}

uint64_t WiFiNetworkGetHarvestSSIDStatus(uint64_t a1)
{
  if (a1)
  {
    unint64_t Property = (const __CFNumber *)WiFiNetworkGetProperty(a1, @"kWiFiNetworkSSIDHarvestStatusKey");
    uint64_t result = (uint64_t)_CFTypeGetIntValue(Property);
    if (!(_DWORD)result)
    {
      CFArrayRef v4 = WiFiNetworkGetProperty(a1, @"WiFiNetworkAttributeHighPopularity");
      if (v4 == (const void *)*MEMORY[0x189604DE8])
      {
        if (WiFiNetworkGetProperty(a1, @"WiFiNetworkAttributeIsPublic") == v4) {
          return 3LL;
        }
        else {
          return 0LL;
        }
      }

      else
      {
        return 0LL;
      }
    }
  }

  else
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
    return 1LL;
  }

  return result;
}

void WiFiNetworkRemoveAutoJoinProperties(uint64_t a1)
{
  if (a1)
  {
    if (CFDictionaryContainsKey(*(CFDictionaryRef *)(a1 + 16), @"enabled")) {
      CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 16), @"enabled");
    }
    if (CFDictionaryContainsKey(*(CFDictionaryRef *)(a1 + 16), @"WiFiNetworkDisabledUntilDate")) {
      CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 16), @"WiFiNetworkDisabledUntilDate");
    }
    if (CFDictionaryContainsKey(*(CFDictionaryRef *)(a1 + 16), @"networkDisabledClientName")) {
      CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 16), @"networkDisabledClientName");
    }
    if (CFDictionaryContainsKey(*(CFDictionaryRef *)(a1 + 16), @"networkDisabledReason")) {
      CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 16), @"networkDisabledReason");
    }
    if (CFDictionaryContainsKey(*(CFDictionaryRef *)(a1 + 16), @"networkDisabledTimestamp")) {
      CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 16), @"networkDisabledTimestamp");
    }
  }

  else
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
  }

void *WiFiNetworkCreateCoreWiFiNetworkProfile(CFDictionaryRef *a1)
{
  uint64_t v118 = *MEMORY[0x1895F89C0];
  context = (void *)MEMORY[0x186E3BB0C]();
  if (!a1 || !getCWFNetworkProfileClass())
  {
    v86 = 0LL;
    goto LABEL_141;
  }

  id v2 = objc_alloc_init((Class)getCWFNetworkProfileClass());
  objc_msgSend(v2, "setSSID:", WiFiNetworkGetSSIDData(a1), context);
  WiFiNetworkIsHotspot20((BOOL)a1);
  [v2 setSupportedSecurityTypes:0];
  BOOL IsWAPI = WiFiNetworkIsWAPI((BOOL)a1);
  CFArrayRef v4 = (const void **)MEMORY[0x189604DE8];
  v86 = v2;
  if (!IsWAPI)
  {
    if (WiFiNetworkIsOWETransition((uint64_t)a1))
    {
      uint64_t v8 = v2;
      uint64_t v9 = 768LL;
    }

    else
    {
      if (!__WiFiNetworkIsOWEOnly(a1[2]))
      {
        if (CFDictionaryGetValue(a1[2], @"WEP") == *v4)
        {
          objc_msgSend(v2, "setSupportedSecurityTypes:", objc_msgSend(v2, "supportedSecurityTypes") | 1);
          if (WiFiNetworkIsEAP((uint64_t)a1))
          {
            uint64_t v23 = v2;
            uint64_t v24 = 5LL;
          }

          else
          {
            unint64_t Property = (void *)WiFiNetworkGetProperty((uint64_t)a1, @"WEP_AUTH_Flags");
            if (!Property) {
              goto LABEL_14;
            }
            v81 = Property;
            char v82 = [Property intValue];
            [v81 intValue];
            char v83 = [v81 intValue];
            if ((v82 & 1) != 0)
            {
              if ((v83 & 4) == 0) {
                goto LABEL_14;
              }
              uint64_t v23 = v86;
              uint64_t v24 = 3LL;
            }

            else
            {
              if ((v83 & 4) == 0) {
                goto LABEL_14;
              }
              uint64_t v23 = v86;
              uint64_t v24 = 4LL;
            }
          }

          [v23 setWEPSubtype:v24];
        }

        goto LABEL_14;
      }

      uint64_t v9 = [v2 supportedSecurityTypes] | 0x100;
      uint64_t v8 = v2;
    }

    [v8 setSupportedSecurityTypes:v9];
    goto LABEL_14;
  }

  objc_msgSend(v2, "setSupportedSecurityTypes:", objc_msgSend(v2, "supportedSecurityTypes") | 2);
  int v5 = objc_msgSend((id)WiFiNetworkGetProperty((uint64_t)a1, @"WAPI"), "intValue");
  if ((~v5 & 0xB) == 0)
  {
    uint64_t v6 = v2;
    uint64_t v7 = 2LL;
LABEL_10:
    [v6 setWAPISubtype:v7];
    goto LABEL_14;
  }

  if ((~v5 & 7) == 0)
  {
    uint64_t v6 = v2;
    uint64_t v7 = 1LL;
    goto LABEL_10;
  }

LABEL_14:
  BOOL v10 = (void *)WiFiNetworkGetProperty((uint64_t)a1, @"RSN_IE");
  if (v10)
  {
    char v11 = (void *)[v10 objectForKey:@"IE_KEY_RSN_AUTHSELS"];
    if (([v11 containsObject:&unk_189E926B8] & 1) != 0
      || [v11 containsObject:&unk_189E926D0])
    {
      objc_msgSend(v86, "setSupportedSecurityTypes:", objc_msgSend(v86, "supportedSecurityTypes") | 0x80);
    }

    if (([v11 containsObject:&unk_189E926E8] & 1) != 0
      || ([v11 containsObject:&unk_189E92700] & 1) != 0
      || ([v11 containsObject:&unk_189E92718] & 1) != 0
      || [v11 containsObject:&unk_189E92730])
    {
      objc_msgSend(v86, "setSupportedSecurityTypes:", objc_msgSend(v86, "supportedSecurityTypes") | 0x20);
    }

    if (([v11 containsObject:&unk_189E92748] & 1) != 0
      || ([v11 containsObject:&unk_189E92760] & 1) != 0
      || ([v11 containsObject:&unk_189E92778] & 1) != 0
      || [v11 containsObject:&unk_189E92790])
    {
      objc_msgSend(v86, "setSupportedSecurityTypes:", objc_msgSend(v86, "supportedSecurityTypes") | 0x40);
    }

    if (([v11 containsObject:&unk_189E927A8] & 1) != 0
      || ([v11 containsObject:&unk_189E927C0] & 1) != 0
      || [v11 containsObject:&unk_189E927D8])
    {
      objc_msgSend(v86, "setSupportedSecurityTypes:", objc_msgSend(v86, "supportedSecurityTypes") | 0x10);
    }
  }

  BOOL v12 = (void *)WiFiNetworkGetProperty((uint64_t)a1, @"WPA_IE");
  if (v12)
  {
    CFMutableDictionaryRef v13 = (void *)[v12 objectForKey:@"IE_KEY_WPA_AUTHSELS"];
    if (([v13 containsObject:&unk_189E926E8] & 1) != 0
      || [v13 containsObject:&unk_189E92700])
    {
      objc_msgSend(v86, "setSupportedSecurityTypes:", objc_msgSend(v86, "supportedSecurityTypes") | 8);
    }
  }

  if (![v86 supportedSecurityTypes]) {
    [v86 setSupportedSecurityTypes:512];
  }
  if (MEMORY[0x18960D5A8])
  {
    CFIndex v14 = (void *)[MEMORY[0x189603FC8] dictionary];
    objc_msgSend( v14,  "setObject:forKeyedSubscript:",  WiFiNetworkGetProperty((uint64_t)a1, (void *)*MEMORY[0x18960D690]),  *MEMORY[0x18960D690]);
    objc_msgSend( v14,  "setObject:forKeyedSubscript:",  WiFiNetworkGetProperty((uint64_t)a1, (void *)*MEMORY[0x18960D6A0]),  *MEMORY[0x18960D6A0]);
    objc_msgSend( v14,  "setObject:forKeyedSubscript:",  WiFiNetworkGetProperty((uint64_t)a1, (void *)*MEMORY[0x18960D6B8]),  *MEMORY[0x18960D6B8]);
    objc_msgSend( v14,  "setObject:forKeyedSubscript:",  WiFiNetworkGetProperty((uint64_t)a1, (void *)*MEMORY[0x18960D6C0]),  *MEMORY[0x18960D6C0]);
    objc_msgSend( v14,  "setObject:forKeyedSubscript:",  WiFiNetworkGetProperty((uint64_t)a1, (void *)*MEMORY[0x18960D6A8]),  *MEMORY[0x18960D6A8]);
    objc_msgSend( v14,  "setObject:forKeyedSubscript:",  WiFiNetworkGetProperty((uint64_t)a1, (void *)*MEMORY[0x18960D6B0]),  *MEMORY[0x18960D6B0]);
    objc_msgSend( v14,  "setObject:forKeyedSubscript:",  WiFiNetworkGetProperty((uint64_t)a1, (void *)*MEMORY[0x18960D6D8]),  *MEMORY[0x18960D6D8]);
    objc_msgSend( v14,  "setObject:forKeyedSubscript:",  WiFiNetworkGetProperty((uint64_t)a1, (void *)*MEMORY[0x18960D6C8]),  *MEMORY[0x18960D6C8]);
    objc_msgSend( v14,  "setObject:forKeyedSubscript:",  WiFiNetworkGetProperty((uint64_t)a1, (void *)*MEMORY[0x18960D688]),  *MEMORY[0x18960D688]);
    objc_msgSend( v14,  "setObject:forKeyedSubscript:",  WiFiNetworkGetProperty((uint64_t)a1, (void *)*MEMORY[0x18960D6D0]),  *MEMORY[0x18960D6D0]);
    objc_msgSend( v14,  "setObject:forKeyedSubscript:",  WiFiNetworkGetProperty((uint64_t)a1, (void *)*MEMORY[0x18960D6F8]),  *MEMORY[0x18960D6F8]);
    objc_msgSend( v14,  "setObject:forKeyedSubscript:",  WiFiNetworkGetProperty((uint64_t)a1, (void *)*MEMORY[0x18960D678]),  *MEMORY[0x18960D678]);
    objc_msgSend( v14,  "setObject:forKeyedSubscript:",  WiFiNetworkGetProperty((uint64_t)a1, (void *)*MEMORY[0x18960D680]),  *MEMORY[0x18960D680]);
    objc_msgSend( v14,  "setObject:forKeyedSubscript:",  WiFiNetworkGetProperty((uint64_t)a1, (void *)*MEMORY[0x18960D698]),  *MEMORY[0x18960D698]);
    objc_msgSend( v14,  "setObject:forKeyedSubscript:",  WiFiNetworkGetProperty((uint64_t)a1, @"DisabledByCaptiveReason"),  @"DisabledByCaptiveReason");
    if ([v14 count]) {
      uint64_t v15 = v14;
    }
    else {
      uint64_t v15 = 0LL;
    }
    [v86 setCaptiveProfile:v15];
  }

  else {
    uint64_t v16 = 2LL;
  }
  [v86 setHiddenState:v16];
  objc_msgSend(v86, "setPayloadUUID:", WiFiNetworkGetProperty((uint64_t)a1, @"PayloadUUID"));
  [v86 setAutoJoinDisabled:!WiFiNetworkIsEnabled((uint64_t)a1)];
  unsigned int SaveDataMode = WiFiNetworkGetSaveDataMode((uint64_t)a1);
  if (SaveDataMode == 1) {
    uint64_t v18 = 1LL;
  }
  else {
    uint64_t v18 = 2LL * (SaveDataMode == 2);
  }
  [v86 setLowDataMode:v18];
  objc_msgSend(v86, "setBundleID:", WiFiNetworkGetProperty((uint64_t)a1, @"BundleIdentifier"));
  objc_msgSend(v86, "setLastJoinedBySystemAt:", WiFiNetworkGetProperty((uint64_t)a1, @"lastAutoJoined"));
  objc_msgSend(v86, "setLastJoinedByUserAt:", WiFiNetworkGetProperty((uint64_t)a1, @"lastJoined"));
  int v19 = objc_msgSend((id)WiFiNetworkGetProperty((uint64_t)a1, @"WiFiManagerKnownNetworksEventType"), "intValue");
  int v20 = objc_msgSend((id)WiFiNetworkGetProperty((uint64_t)a1, @"WiFiNetworkAttributeSource"), "intValue");
  int v21 = objc_msgSend((id)WiFiNetworkGetProperty((uint64_t)a1, @"NetworkOriginator"), "intValue");
  uint64_t v22 = 10LL;
  switch(v21)
  {
    case 0:
      if (!objc_msgSend(v86, "bundleID", 10)) {
        goto LABEL_58;
      }
      uint64_t v22 = 14LL;
      break;
    case 1:
    case 6:
      uint64_t v22 = 15LL;
      break;
    case 2:
      break;
    default:
LABEL_58:
      uint64_t v22 = 17LL;
      if (v21 != 3 && v20 != 1)
      {
        if (v21 == 4)
        {
          uint64_t v22 = 7LL;
        }

        else if (v21 == 5)
        {
          uint64_t v22 = 12LL;
        }

        else if (objc_msgSend(v86, "payloadUUID", 17))
        {
LABEL_69:
          uint64_t v22 = 9LL;
        }

        else
        {
          uint64_t v22 = 16LL;
          if (v19 != 14 && v20 != 2)
          {
            uint64_t v22 = 5LL;
            switch(v19)
            {
              case 1:
                goto LABEL_70;
              case 2:
              case 4:
              case 7:
              case 8:
              case 9:
              case 10:
                goto LABEL_154;
              case 3:
                uint64_t v22 = 8LL;
                break;
              case 5:
                uint64_t v22 = 13LL;
                break;
              case 6:
                uint64_t v22 = 6LL;
                break;
              case 11:
                uint64_t v22 = 11LL;
                break;
              default:
                if (v19 == 17) {
                  goto LABEL_69;
                }
LABEL_154:
                uint64_t v22 = 0LL;
                break;
            }
          }
        }
      }

      break;
  }

LABEL_70:
  [v86 setAddReason:v22];
  objc_msgSend(v86, "setAddedAt:", WiFiNetworkGetProperty((uint64_t)a1, @"addedAt"));
  objc_msgSend(v86, "setUpdatedAt:", WiFiNetworkGetProperty((uint64_t)a1, @"lastUpdated"));
  objc_msgSend( v86,  "setEAPProfile:",  objc_msgSend( (id)WiFiNetworkGetProperty((uint64_t)a1, @"EnterpriseProfile"),  "objectForKeyedSubscript:",  @"EAPClientConfiguration"));
  objc_msgSend(v86, "setDomainName:", WiFiNetworkGetProperty((uint64_t)a1, @"DomainName"));
  objc_msgSend(v86, "setDisplayedOperatorName:", WiFiNetworkGetProperty((uint64_t)a1, @"DisplayedOperatorName"));
  objc_msgSend( v86,  "setServiceProviderRoamingEnabled:",  WiFiNetworkGetProperty((uint64_t)a1, @"SPRoaming") != (const void *)*MEMORY[0x189604DE0]);
  objc_msgSend(v86, "setCellularNetworkInfo:", WiFiNetworkGetProperty((uint64_t)a1, @"MCCandMNC"));
  objc_msgSend(v86, "setNAIRealmNameList:", WiFiNetworkGetProperty((uint64_t)a1, @"NaiRealmName"));
  objc_msgSend(v86, "setRoamingConsortiumList:", WiFiNetworkGetProperty((uint64_t)a1, @"RoamingConsortiumOIs"));
  objc_msgSend( v86,  "setUserPreferredNetworkNames:",  WiFiNetworkGetProperty((uint64_t)a1, @"userPreferredNetworkNames"));
  objc_msgSend( v86,  "setUserPreferredPasspointDomains:",  WiFiNetworkGetProperty((uint64_t)a1, @"userPreferredPasspointDomains"));
  objc_msgSend(v86, "setNetworkGroupID:", WiFiNetworkGetProperty((uint64_t)a1, @"networkGroupID"));
  objc_msgSend( v86,  "setNetworkGroupPriority:",  objc_msgSend((id)WiFiNetworkGetProperty((uint64_t)a1, @"networkGroupPriority"), "unsignedIntegerValue"));
  objc_msgSend(v86, "setLastDiscoveredAt:", WiFiNetworkGetProperty((uint64_t)a1, @"discoveredAt"));
  CFIndex v25 = (void *)WiFiNetworkGetProperty((uint64_t)a1, @"TransitionDisabledFlags");
  if (v25) {
    objc_msgSend(v86, "setTransitionDisabledFlags:", objc_msgSend(v25, "unsignedIntegerValue"));
  }
  uint64_t v26 = WiFiNetworkGetProperty((uint64_t)a1, @"Standalone");
  CFTypeRef cf2 = *v4;
  [v86 setStandalone6G:v26 == *v4];
  BOOL v27 = (const __CFArray *)WiFiNetworkGetProperty((uint64_t)a1, @"networkKnownBSSListKey");
  if (v27)
  {
    CFIndex v28 = v27;
    if (CFArrayGetCount(v27))
    {
      __int128 v102 = 0u;
      __int128 v103 = 0u;
      __int128 v100 = 0u;
      __int128 v101 = 0u;
      obuint64_t j = v28;
      uint64_t v90 = -[__CFArray countByEnumeratingWithState:objects:count:]( v28,  "countByEnumeratingWithState:objects:count:",  &v100,  v117,  16LL);
      if (v90)
      {
        v91 = 0LL;
        uint64_t v89 = *(void *)v101;
        uint64_t v88 = *MEMORY[0x18960F000];
        do
        {
          for (uint64_t i = 0LL; i != v90; ++i)
          {
            if (*(void *)v101 != v89) {
              objc_enumerationMutation(obj);
            }
            CFNumberRef v30 = *(void **)(*((void *)&v100 + 1) + 8 * i);
            uint64_t v109 = 0LL;
            v110 = &v109;
            uint64_t v111 = 0x3052000000LL;
            v112 = __Block_byref_object_copy_;
            v113 = __Block_byref_object_dispose_;
            int v31 = (objc_class *)getCWFBSSClass_softClass;
            uint64_t v114 = getCWFBSSClass_softClass;
            if (!getCWFBSSClass_softClass)
            {
              uint64_t v104 = MEMORY[0x1895F87A8];
              uint64_t v105 = 3221225472LL;
              v106 = __getCWFBSSClass_block_invoke;
              v107 = &unk_189E8BA58;
              v108 = &v109;
              __getCWFBSSClass_block_invoke((uint64_t)&v104);
              int v31 = (objc_class *)v110[5];
            }

            _Block_object_dispose(&v109, 8);
            id v32 = objc_alloc_init(v31);
            [v30 objectForKeyedSubscript:@"BSSID"];
            [v32 setBSSID:CWFCorrectEthernetAddressString()];
            CFNumberRef v33 = (void *)[v30 objectForKeyedSubscript:@"CHANNEL"];
            uint64_t v34 = [v30 objectForKeyedSubscript:@"CHANNEL_FLAGS"];
            if (v33)
            {
              CFIndex v35 = (void *)v34;
              if (v34)
              {
                id v36 = objc_alloc_init((Class)getCWFChannelClass());
                objc_msgSend(v36, "setChannel:", objc_msgSend(v33, "integerValue"));
                objc_msgSend(v36, "setFlags:", objc_msgSend(v35, "unsignedIntegerValue"));
                [v32 setChannel:v36];
              }
            }

            if ([v32 BSSID] && objc_msgSend(v32, "channel"))
            {
              objc_msgSend( v32,  "setLastAssociatedAt:",  objc_msgSend(v30, "objectForKeyedSubscript:", @"lastRoamed"));
              int v37 = (void *)[v30 objectForKeyedSubscript:@"networkLocnLat"];
              char v38 = (void *)[v30 objectForKeyedSubscript:@"networkLocnLong"];
              CFIndex v39 = (void *)[v30 objectForKeyedSubscript:@"networkLocnAccuracy"];
              uint64_t v40 = [v30 objectForKeyedSubscript:@"networkLocnTimestamp"];
              if (v37)
              {
                if (v38)
                {
                  if (v39)
                  {
                    uint64_t v41 = v40;
                    if (v40)
                    {
                      uint64_t v109 = 0LL;
                      v110 = &v109;
                      uint64_t v111 = 0x3052000000LL;
                      v112 = __Block_byref_object_copy_;
                      v113 = __Block_byref_object_dispose_;
                      CFIndex v42 = (objc_class *)getCLLocationClass_softClass;
                      uint64_t v114 = getCLLocationClass_softClass;
                      if (!getCLLocationClass_softClass)
                      {
                        uint64_t v104 = MEMORY[0x1895F87A8];
                        uint64_t v105 = 3221225472LL;
                        v106 = __getCLLocationClass_block_invoke;
                        v107 = &unk_189E8BA58;
                        v108 = &v109;
                        __getCLLocationClass_block_invoke((uint64_t)&v104);
                        CFIndex v42 = (objc_class *)v110[5];
                      }

                      _Block_object_dispose(&v109, 8);
                      id v43 = objc_alloc(v42);
                      [v37 doubleValue];
                      double v45 = v44;
                      [v38 doubleValue];
                      double v47 = v46;
                      uint64_t v109 = 0LL;
                      v110 = &v109;
                      uint64_t v111 = 0x2020000000LL;
                      uint64_t v48 = getCLLocationCoordinate2DMakeSymbolLoc_ptr;
                      v112 = (void (*)(uint64_t, uint64_t))getCLLocationCoordinate2DMakeSymbolLoc_ptr;
                      if (!getCLLocationCoordinate2DMakeSymbolLoc_ptr)
                      {
                        BOOL v49 = (void *)CoreLocationLibrary();
                        uint64_t v48 = dlsym(v49, "CLLocationCoordinate2DMake");
                        v110[3] = (uint64_t)v48;
                        getCLLocationCoordinate2DMakeSymbolLoc_ptr = v48;
                      }

                      _Block_object_dispose(&v109, 8);
                      if (!v48) {
                        WiFiNetworkCreateCoreWiFiNetworkProfile_cold_1();
                      }
                      double v50 = ((double (*)(double, double))v48)(v45, v47);
                      double v52 = v51;
                      [v39 doubleValue];
                      objc_msgSend( v32,  "setLocation:",  (id)objc_msgSend( v43,  "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:",  v41,  v50,  v52,  0.0,  v53,  0.0));
                    }
                  }
                }
              }

              uint64_t v54 = (void *)[v30 objectForKeyedSubscript:@"colocated2GHzRNRChannel"];
              uint64_t v55 = [v30 objectForKeyedSubscript:@"colocated2GHzRNRChannelFlags"];
              if (v54)
              {
                uint64_t v56 = (void *)v55;
                if (v55)
                {
                  id v57 = objc_alloc_init((Class)getCWFChannelClass());
                  objc_msgSend(v57, "setChannel:", objc_msgSend(v54, "integerValue"));
                  objc_msgSend(v57, "setFlags:", objc_msgSend(v56, "unsignedIntegerValue"));
                  [v32 setColocated2GHzRNRChannel:v57];
                }
              }

              uint64_t v58 = (void *)[v30 objectForKeyedSubscript:@"colocated5GHzRNRChannel"];
              uint64_t v59 = [v30 objectForKeyedSubscript:@"colocated5GHzRNRChannelFlags"];
              if (v58)
              {
                uint64_t v60 = (void *)v59;
                if (v59)
                {
                  id v61 = objc_alloc_init((Class)getCWFChannelClass());
                  objc_msgSend(v61, "setChannel:", objc_msgSend(v58, "integerValue"));
                  objc_msgSend(v61, "setFlags:", objc_msgSend(v60, "unsignedIntegerValue"));
                  [v32 setColocated5GHzRNRChannel:v61];
                }
              }

              objc_msgSend( v32,  "setAWDLRealTimeModeTimestamp:",  objc_msgSend(v30, "objectForKeyedSubscript:", @"AWDLRealTimeModeTimestamp"));
              objc_msgSend( v32,  "setIPv4NetworkSignature:",  objc_msgSend(v30, "objectForKeyedSubscript:", @"IPv4NetworkSignature"));
              objc_msgSend( v32,  "setIPv6NetworkSignature:",  objc_msgSend(v30, "objectForKeyedSubscript:", @"IPv6NetworkSignature"));
              objc_msgSend( v32,  "setDHCPServerID:",  objc_msgSend(v30, "objectForKeyedSubscript:", @"DHCPServerID"));
              objc_msgSend( v32,  "setDHCPv6ServerID:",  objc_msgSend(v30, "objectForKeyedSubscript:", @"DHCPv6ServerID"));
              uint64_t v62 = (void *)[MEMORY[0x189603FC8] dictionary];
              __int128 v98 = 0u;
              __int128 v99 = 0u;
              __int128 v96 = 0u;
              __int128 v97 = 0u;
              uint64_t v63 = (void *)[MEMORY[0x18960F030] supportedOSSpecificKeys];
              uint64_t v64 = [v63 countByEnumeratingWithState:&v96 objects:v116 count:16];
              if (v64)
              {
                uint64_t v65 = *(void *)v97;
                do
                {
                  for (uint64_t j = 0LL; j != v64; ++j)
                  {
                    if (*(void *)v97 != v65) {
                      objc_enumerationMutation(v63);
                    }
                    objc_msgSend( v62,  "setObject:forKeyedSubscript:",  WiFiNetworkGetProperty((uint64_t)a1, *(void **)(*((void *)&v96 + 1) + 8 * j)),  *(void *)(*((void *)&v96 + 1) + 8 * j));
                  }

                  uint64_t v64 = [v63 countByEnumeratingWithState:&v96 objects:v116 count:16];
                }

                while (v64);
              }

              if ([v62 count]) {
                uint64_t v67 = v62;
              }
              else {
                uint64_t v67 = 0LL;
              }
              [v32 setOSSpecificAttributes:v67];
              objc_msgSend(v32, "setCoreWiFiSpecificAttributes:", objc_msgSend(v30, "objectForKeyedSubscript:", v88));
              uint64_t v68 = v91;
              if (!v91) {
                uint64_t v68 = (void *)[MEMORY[0x189603FE0] set];
              }
              v91 = v68;
              [v68 addObject:v32];
            }
          }

          uint64_t v90 = -[__CFArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v100,  v117,  16LL);
        }

        while (v90);
      }

      else
      {
        v91 = 0LL;
      }

      [v86 setBSSList:v91];
    }
  }

  [v86 setPrivacyProxyEnabled:WiFiNetworkGetPrivacyProxyEnabled((uint64_t)a1)];
  objc_msgSend( v86,  "setPrivacyProxyBlockedReason:",  WiFiNetworkGetProperty((uint64_t)a1, @"PrivacyProxyBlockedReason"));
  if (WiFiNetworkGetProperty((uint64_t)a1, @"WiFiNetworkAttributeIsMoving"))
  {
    uint64_t v69 = WiFiNetworkGetProperty((uint64_t)a1, @"WiFiNetworkAttributeIsMoving");
    if (CFEqual(v69, cf2)) {
      uint64_t v70 = 1LL;
    }
    else {
      uint64_t v70 = 2LL;
    }
  }

  else
  {
    uint64_t v70 = 0LL;
  }

  [v86 setMovingAttribute:v70];
  if (WiFiNetworkGetProperty((uint64_t)a1, @"WiFiNetworkAttributeIsPublic"))
  {
    uint64_t v71 = WiFiNetworkGetProperty((uint64_t)a1, @"WiFiNetworkAttributeIsPublic");
    if (CFEqual(v71, cf2)) {
      uint64_t v72 = 1LL;
    }
    else {
      uint64_t v72 = 2LL;
    }
  }

  else
  {
    uint64_t v72 = 0LL;
  }

  [v86 setPublicAttribute:v72];
  objc_msgSend(v86, "setCarplayUUID:", WiFiNetworkGetProperty((uint64_t)a1, @"CARPLAY_UUID"));
  [v86 setCarplayNetwork:WiFiNetworkIsCarPlay((uint64_t)a1) != 0];
  [v86 setPersonalHotspot:WiFiNetworkIsApplePersonalHotspot((uint64_t)a1) != 0];
  objc_msgSend(v86, "setNANServiceID:", WiFiNetworkGetProperty((uint64_t)a1, @"WiFiNetworkNANServiceID"));
  [v86 setPublicAirPlayNetwork:WiFiNetworkIsPublicAirPlayNetwork((uint64_t)a1) != 0];
  objc_msgSend( v86,  "setDNSHeuristicsFilteredNetwork:",  WiFiNetworkGetProperty((uint64_t)a1, @"FilteredNetwork") == cf2);
  objc_msgSend(v86, "setDNSHeuristicsFailureStateInfo:", WiFiNetworkGetProperty((uint64_t)a1, @"DNSFailures"));
  BOOL v73 = (void *)[MEMORY[0x189603FC8] dictionary];
  __int128 v94 = 0u;
  __int128 v95 = 0u;
  __int128 v92 = 0u;
  __int128 v93 = 0u;
  uint64_t v74 = (void *)[MEMORY[0x18960F050] supportedOSSpecificKeys];
  uint64_t v75 = [v74 countByEnumeratingWithState:&v92 objects:v115 count:16];
  if (v75)
  {
    uint64_t v76 = *(void *)v93;
    do
    {
      for (uint64_t k = 0LL; k != v75; ++k)
      {
        if (*(void *)v93 != v76) {
          objc_enumerationMutation(v74);
        }
        objc_msgSend( v73,  "setObject:forKeyedSubscript:",  WiFiNetworkGetProperty((uint64_t)a1, *(void **)(*((void *)&v92 + 1) + 8 * k)),  *(void *)(*((void *)&v92 + 1) + 8 * k));
      }

      uint64_t v75 = [v74 countByEnumeratingWithState:&v92 objects:v115 count:16];
    }

    while (v75);
  }

  if ([v73 count]) {
    uint64_t v78 = v73;
  }
  else {
    uint64_t v78 = 0LL;
  }
  [v86 setOSSpecificAttributes:v78];
  objc_msgSend(v86, "setCoreWiFiSpecificAttributes:", WiFiNetworkGetProperty((uint64_t)a1, (void *)*MEMORY[0x18960F000]));
LABEL_141:
  objc_autoreleasePoolPop(context);
  return v86;
}

void sub_1865A39F8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, char a47)
{
}

uint64_t getCWFNetworkProfileClass()
{
  uint64_t v3 = 0LL;
  CFArrayRef v4 = &v3;
  uint64_t v5 = 0x3052000000LL;
  uint64_t v6 = __Block_byref_object_copy_;
  uint64_t v7 = __Block_byref_object_dispose_;
  uint64_t v0 = getCWFNetworkProfileClass_softClass;
  uint64_t v8 = getCWFNetworkProfileClass_softClass;
  if (!getCWFNetworkProfileClass_softClass)
  {
    v2[0] = MEMORY[0x1895F87A8];
    v2[1] = 3221225472LL;
    _OWORD v2[2] = __getCWFNetworkProfileClass_block_invoke;
    v2[3] = &unk_189E8BA58;
    v2[4] = &v3;
    __getCWFNetworkProfileClass_block_invoke((uint64_t)v2);
    uint64_t v0 = v4[5];
  }

  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1865A3AD0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t getCWFChannelClass()
{
  uint64_t v3 = 0LL;
  CFArrayRef v4 = &v3;
  uint64_t v5 = 0x3052000000LL;
  uint64_t v6 = __Block_byref_object_copy_;
  uint64_t v7 = __Block_byref_object_dispose_;
  uint64_t v0 = getCWFChannelClass_softClass;
  uint64_t v8 = getCWFChannelClass_softClass;
  if (!getCWFChannelClass_softClass)
  {
    v2[0] = MEMORY[0x1895F87A8];
    v2[1] = 3221225472LL;
    _OWORD v2[2] = __getCWFChannelClass_block_invoke;
    v2[3] = &unk_189E8BA58;
    v2[4] = &v3;
    __getCWFChannelClass_block_invoke((uint64_t)v2);
    uint64_t v0 = v4[5];
  }

  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1865A3B98( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

BOOL WiFiNetworkGetPrivacyProxyEnabled(uint64_t a1)
{
  if (a1)
  {
    if (CFDictionaryContainsKey(*(CFDictionaryRef *)(a1 + 16), @"PrivacyProxyEnabled")) {
      return WiFiNetworkGetProperty(a1, @"PrivacyProxyEnabled") == (const void *)*MEMORY[0x189604DE8];
    }
  }

  else
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
  }

  return 1LL;
}

const void *WiFiNetworkGetPrivacyProxyBlockedReason(uint64_t a1)
{
  if (a1) {
    return WiFiNetworkGetProperty(a1, @"PrivacyProxyBlockedReason");
  }
  objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
  return 0LL;
}

uint64_t WiFiNetworkIsPublicAirPlayNetwork(uint64_t a1)
{
  if (a1)
  {
    uint64_t result = CFDictionaryContainsKey(*(CFDictionaryRef *)(a1 + 16), @"PublicAirPlayNetwork");
    if ((_DWORD)result) {
      return WiFiNetworkGetProperty(a1, @"PublicAirPlayNetwork") == (const void *)*MEMORY[0x189604DE8];
    }
  }

  else
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
    return 0LL;
  }

  return result;
}

_WORD *WiFiNetworkCreateFromCoreWiFiNetworkProfile(void *a1, void *a2)
{
  v95[1] = *MEMORY[0x1895F89C0];
  CFArrayRef v4 = (void *)MEMORY[0x186E3BB0C]();
  uint64_t CWFNetworkProfileClass = getCWFNetworkProfileClass();
  uint64_t v6 = 0LL;
  if (a1 && CWFNetworkProfileClass)
  {
    getCWFNetworkProfileClass();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v6 = 0LL;
      goto LABEL_223;
    }

    uint64_t v7 = (void *)[MEMORY[0x189603FC8] dictionary];
    if (!a2 || [a2 containsObject:&unk_189E927F0])
    {
      objc_msgSend(v7, "addEntriesFromDictionary:", objc_msgSend(a1, "OSSpecificAttributes"));
      if (![v7 objectForKey:@"AP_MODE"]) {
        [v7 setObject:&unk_189E927A8 forKeyedSubscript:@"AP_MODE"];
      }
    }

    uint64_t v8 = [a1 coreWiFiSpecificAttributes];
    uint64_t v88 = *MEMORY[0x18960F000];
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v8);
    uint64_t v9 = MEMORY[0x189604A80];
    v86 = v4;
    if (a2)
    {
      if ([a2 containsObject:&unk_189E92808])
      {
        objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a1, "SSID"), @"SSID");
        objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a1, "networkName"), @"SSID_STR");
      }

      if (([a2 containsObject:&unk_189E92820] & 1) == 0)
      {
LABEL_61:
        if (![a2 containsObject:&unk_189E92898])
        {
LABEL_65:
LABEL_66:
          if ([a1 hiddenState] == 1)
          {
            uint64_t v33 = MEMORY[0x189604A88];
          }

          else
          {
            if ([a1 hiddenState] != 2) {
              goto LABEL_71;
            }
            uint64_t v33 = MEMORY[0x189604A80];
          }

          [v7 setObject:v33 forKeyedSubscript:@"UserDirected"];
LABEL_71:
          if (!a2)
          {
LABEL_73:
            if (!a2)
            {
              objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a1, "payloadUUID"), @"PayloadUUID");
LABEL_81:
              objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a1, "bundleID"), @"BundleIdentifier");
              if (!a2)
              {
                else {
                  uint64_t v35 = MEMORY[0x189604A88];
                }
                [v7 setObject:v35 forKeyedSubscript:@"enabled"];
LABEL_93:
                uint64_t v36 = [a1 lowDataMode];
                int v37 = &unk_189E926E8;
                if (v36 == 2) {
                  int v37 = &unk_189E927A8;
                }
                if (v36 == 1) {
                  char v38 = &unk_189E92700;
                }
                else {
                  char v38 = v37;
                }
                [v7 setObject:v38 forKeyedSubscript:@"SaveDataMode"];
                if (!a2)
                {
                  objc_msgSend( v7,  "setObject:forKeyedSubscript:",  objc_msgSend(a1, "lastJoinedByUserAt"),  @"lastJoined");
LABEL_104:
                  objc_msgSend( v7,  "setObject:forKeyedSubscript:",  objc_msgSend(a1, "lastJoinedBySystemAt"),  @"lastAutoJoined");
                  if (!a2)
                  {
LABEL_106:
                    uint64_t v39 = [a1 addReason];
                    uint64_t v40 = 0LL;
                    uint64_t v41 = &unk_189E92748;
                    char v42 = 1;
                    id v43 = &unk_189E92700;
                    switch(v39)
                    {
                      case 2LL:
                      case 3LL:
                      case 4LL:
                      case 5LL:
                        goto LABEL_107;
                      case 6LL:
                        id v43 = &unk_189E927D8;
                        goto LABEL_107;
                      case 7LL:
                        uint64_t v40 = 0LL;
                        uint64_t v41 = &unk_189E92700;
                        id v43 = &unk_189E927C0;
                        goto LABEL_119;
                      case 8LL:
                        id v43 = &unk_189E92718;
                        goto LABEL_107;
                      case 9LL:
                        id v43 = &unk_189E929A0;
                        goto LABEL_107;
                      case 10LL:
                        uint64_t v40 = 0LL;
                        id v43 = &unk_189E927A8;
                        goto LABEL_119;
                      case 11LL:
                        id v43 = &unk_189E92850;
                        goto LABEL_107;
                      case 12LL:
                        uint64_t v40 = 0LL;
                        uint64_t v41 = &unk_189E92700;
                        id v43 = &unk_189E92730;
                        goto LABEL_119;
                      case 13LL:
                        id v43 = &unk_189E92730;
LABEL_107:
                        double v44 = @"WiFiManagerKnownNetworksEventType";
                        double v45 = v7;
                        double v46 = v43;
                        goto LABEL_121;
                      case 14LL:
                        uint64_t v40 = 0LL;
                        id v43 = &unk_189E926E8;
                        goto LABEL_119;
                      case 15LL:
                        goto LABEL_119;
                      case 16LL:
                        [v7 setObject:&unk_189E92988 forKeyedSubscript:@"WiFiManagerKnownNetworksEventType"];
                        uint64_t v40 = &unk_189E92820;
                        goto LABEL_120;
                      case 17LL:
                        char v42 = 0;
                        uint64_t v40 = &unk_189E92808;
                        uint64_t v41 = &unk_189E92988;
                        id v43 = &unk_189E92718;
LABEL_119:
                        [v7 setObject:v41 forKeyedSubscript:@"WiFiManagerKnownNetworksEventType"];
                        [v7 setObject:v43 forKeyedSubscript:@"NetworkOriginator"];
                        if ((v42 & 1) == 0)
                        {
LABEL_120:
                          double v44 = @"WiFiNetworkAttributeSource";
                          double v45 = v7;
                          double v46 = v40;
LABEL_121:
                          [v45 setObject:v46 forKeyedSubscript:v44];
                        }

                        break;
                      default:
                        break;
                    }

                    if (!a2)
                    {
                      objc_msgSend( v7,  "setObject:forKeyedSubscript:",  objc_msgSend(a1, "addedAt", v41),  @"addedAt");
LABEL_128:
                      uint64_t v47 = [a1 EAPProfile];
                      if (v47)
                      {
                        __int128 v94 = @"EAPClientConfiguration";
                        v95[0] = v47;
                        uint64_t v48 = [MEMORY[0x189603F68] dictionaryWithObjects:v95 forKeys:&v94 count:1];
                      }

                      else
                      {
                        uint64_t v48 = 0LL;
                      }

                      [v7 setObject:v48 forKeyedSubscript:@"EnterpriseProfile"];
                      if (!a2)
                      {
                        objc_msgSend( v7,  "setObject:forKeyedSubscript:",  objc_msgSend(a1, "domainName"),  @"DomainName");
LABEL_137:
                        objc_msgSend( v7,  "setObject:forKeyedSubscript:",  objc_msgSend(a1, "displayedOperatorName"),  @"DisplayedOperatorName");
                        if (!a2)
                        {
                          objc_msgSend( v7,  "setObject:forKeyedSubscript:",  objc_msgSend( MEMORY[0x189607968],  "numberWithBool:",  objc_msgSend(a1, "isServiceProviderRoamingEnabled")),  @"SPRoaming");
LABEL_143:
                          objc_msgSend( v7,  "setObject:forKeyedSubscript:",  objc_msgSend(a1, "cellularNetworkInfo"),  @"MCCandMNC");
                          if (!a2)
                          {
                            objc_msgSend( v7,  "setObject:forKeyedSubscript:",  objc_msgSend(a1, "NAIRealmNameList"),  @"NaiRealmName");
LABEL_149:
                            objc_msgSend( v7,  "setObject:forKeyedSubscript:",  objc_msgSend(a1, "roamingConsortiumList"),  @"RoamingConsortiumOIs");
                            if (!a2)
                            {
                              objc_msgSend( v7,  "setObject:forKeyedSubscript:",  objc_msgSend(a1, "userPreferredNetworkNames"),  @"userPreferredNetworkNames");
LABEL_155:
                              objc_msgSend( v7,  "setObject:forKeyedSubscript:",  objc_msgSend(a1, "userPreferredPasspointDomains"),  @"userPreferredPasspointDomains");
                              if (!a2)
                              {
                                objc_msgSend( v7,  "setObject:forKeyedSubscript:",  objc_msgSend(a1, "networkGroupID"),  @"networkGroupID");
LABEL_161:
                                objc_msgSend( v7,  "setObject:forKeyedSubscript:",  objc_msgSend(a1, "networkGroupPriority"),  @"networkGroupPriority");
                                if (!a2)
                                {
                                  objc_msgSend( v7,  "setObject:forKeyedSubscript:",  objc_msgSend(a1, "lastDiscoveredAt"),  @"discoveredAt");
LABEL_167:
                                  BOOL v49 = (void *)[MEMORY[0x189603FE0] set];
                                  double v50 = (void *)[a1 BSSList];
                                  if (v50)
                                  {
                                    double v51 = v50;
                                    char v83 = a2;
                                    v84 = v7;
                                    v85 = a1;
                                    __int128 v91 = 0u;
                                    __int128 v92 = 0u;
                                    __int128 v89 = 0u;
                                    __int128 v90 = 0u;
                                    uint64_t v52 = [v50 countByEnumeratingWithState:&v89 objects:v93 count:16];
                                    if (v52)
                                    {
                                      uint64_t v53 = v52;
                                      uint64_t v54 = 0LL;
                                      uint64_t v55 = *(void *)v90;
                                      unint64_t v56 = 0x189607000uLL;
                                      v87 = v51;
                                      do
                                      {
                                        for (uint64_t i = 0LL; i != v53; ++i)
                                        {
                                          if (*(void *)v90 != v55) {
                                            objc_enumerationMutation(v51);
                                          }
                                          uint64_t v58 = *(void **)(*((void *)&v89 + 1) + 8 * i);
                                          uint64_t v59 = (void *)[v58 BSSID];
                                          if (v59)
                                          {
                                            uint64_t v60 = (const char *)[v59 UTF8String];
                                            if (v60)
                                            {
                                              id v61 = ether_aton(v60);
                                              if (v61)
                                              {
                                                uint64_t v62 = ether_ntoa(v61);
                                                if (v62)
                                                {
                                                  uint64_t v63 = [*(id *)(v56 + 2600) stringWithUTF8String:v62];
                                                  if (v63)
                                                  {
                                                    uint64_t v64 = v63;
                                                    if (([v49 containsObject:v63] & 1) == 0)
                                                    {
                                                      [v49 addObject:v64];
                                                      uint64_t v65 = (void *)[MEMORY[0x189603FC8] dictionary];
                                                      objc_msgSend( v65,  "addEntriesFromDictionary:",  objc_msgSend(v58, "OSSpecificAttributes"));
                                                      [v65 setObject:v64 forKeyedSubscript:@"BSSID"];
                                                      uint64_t v66 = (void *)[v58 channel];
                                                      if (v66)
                                                      {
                                                        uint64_t v67 = v66;
                                                        objc_msgSend( v65,  "setObject:forKeyedSubscript:",  objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInteger:",  objc_msgSend(v66, "channel")),  @"CHANNEL");
                                                        objc_msgSend( v65,  "setObject:forKeyedSubscript:",  objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInt:",  objc_msgSend(v67, "flags")),  @"CHANNEL_FLAGS");
                                                      }

                                                      uint64_t v68 = (void *)[v58 location];
                                                      if (v68)
                                                      {
                                                        uint64_t v69 = v68;
                                                        uint64_t v70 = (void *)MEMORY[0x189607968];
                                                        [v68 coordinate];
                                                        objc_msgSend( v65,  "setObject:forKeyedSubscript:",  objc_msgSend(v70, "numberWithDouble:"),  @"networkLocnLat");
                                                        uint64_t v71 = (void *)MEMORY[0x189607968];
                                                        [v69 coordinate];
                                                        objc_msgSend( v65,  "setObject:forKeyedSubscript:",  objc_msgSend(v71, "numberWithDouble:", v72),  @"networkLocnLong");
                                                        BOOL v73 = (void *)MEMORY[0x189607968];
                                                        [v69 horizontalAccuracy];
                                                        objc_msgSend( v65,  "setObject:forKeyedSubscript:",  objc_msgSend(v73, "numberWithDouble:"),  @"networkLocnAccuracy");
                                                        objc_msgSend( v65,  "setObject:forKeyedSubscript:",  objc_msgSend(v69, "timestamp"),  @"networkLocnTimestamp");
                                                      }

                                                      objc_msgSend( v65,  "setObject:forKeyedSubscript:",  objc_msgSend(v58, "lastAssociatedAt"),  @"lastRoamed");
                                                      uint64_t v74 = (void *)[v58 colocated2GHzRNRChannel];
                                                      if (v74)
                                                      {
                                                        uint64_t v75 = v74;
                                                        objc_msgSend( v65,  "setObject:forKeyedSubscript:",  objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInteger:",  objc_msgSend(v74, "channel")),  @"colocated2GHzRNRChannel");
                                                        objc_msgSend( v65,  "setObject:forKeyedSubscript:",  objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInt:",  objc_msgSend(v75, "flags")),  @"colocated2GHzRNRChannelFlags");
                                                      }

                                                      uint64_t v76 = (void *)[v58 colocated5GHzRNRChannel];
                                                      if (v76)
                                                      {
                                                        uint64_t v77 = v76;
                                                        objc_msgSend( v65,  "setObject:forKeyedSubscript:",  objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInteger:",  objc_msgSend(v76, "channel")),  @"colocated5GHzRNRChannel");
                                                        objc_msgSend( v65,  "setObject:forKeyedSubscript:",  objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInt:",  objc_msgSend(v77, "flags")),  @"colocated5GHzRNRChannelFlags");
                                                      }

                                                      objc_msgSend( v65,  "setObject:forKeyedSubscript:",  objc_msgSend(v58, "AWDLRealTimeModeTimestamp"),  @"AWDLRealTimeModeTimestamp");
                                                      objc_msgSend( v65,  "setObject:forKeyedSubscript:",  objc_msgSend(v58, "IPv4NetworkSignature"),  @"IPv4NetworkSignature");
                                                      objc_msgSend( v65,  "setObject:forKeyedSubscript:",  objc_msgSend(v58, "IPv6NetworkSignature"),  @"IPv6NetworkSignature");
                                                      objc_msgSend( v65,  "setObject:forKeyedSubscript:",  objc_msgSend(v58, "DHCPServerID"),  @"DHCPServerID");
                                                      objc_msgSend( v65,  "setObject:forKeyedSubscript:",  objc_msgSend(v58, "DHCPv6ServerID"),  @"DHCPv6ServerID");
                                                      objc_msgSend( v65,  "setObject:forKeyedSubscript:",  objc_msgSend(v58, "coreWiFiSpecificAttributes"),  v88);
                                                      if (!v54) {
                                                        uint64_t v54 = (void *)[MEMORY[0x189603FA8] array];
                                                      }
                                                      [v54 addObject:v65];
                                                      double v51 = v87;
                                                      unint64_t v56 = 0x189607000LL;
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }

                                        uint64_t v53 = [v51 countByEnumeratingWithState:&v89 objects:v93 count:16];
                                      }

                                      while (v53);
                                    }

                                    else
                                    {
                                      uint64_t v54 = 0LL;
                                    }

                                    uint64_t v7 = v84;
                                    [v84 setObject:v54 forKeyedSubscript:@"networkKnownBSSListKey"];
                                    a1 = v85;
                                    CFArrayRef v4 = v86;
                                    a2 = v83;
                                  }

                                  if (!a2)
                                  {
                                    objc_msgSend( v7,  "setObject:forKeyedSubscript:",  objc_msgSend( MEMORY[0x189607968],  "numberWithBool:",  objc_msgSend(a1, "isPrivacyProxyEnabled")),  @"PrivacyProxyEnabled");
                                    goto LABEL_201;
                                  }

LABEL_196:
                                  if ([a2 containsObject:&unk_189E92B08]) {
                                    objc_msgSend( v7,  "setObject:forKeyedSubscript:",  objc_msgSend( MEMORY[0x189607968],  "numberWithBool:",  objc_msgSend(a1, "isPrivacyProxyEnabled")),  @"PrivacyProxyEnabled");
                                  }
                                  if (([a2 containsObject:&unk_189E92B20] & 1) == 0)
                                  {
LABEL_202:
                                    if (![a2 containsObject:&unk_189E92B38])
                                    {
LABEL_209:
LABEL_210:
                                      uint64_t v80 = [a1 publicAttribute];
                                      if (v80 == 1)
                                      {
                                        uint64_t v81 = MEMORY[0x189604A88];
                                      }

                                      else
                                      {
                                        if (v80 != 2) {
                                          goto LABEL_215;
                                        }
                                        uint64_t v81 = MEMORY[0x189604A80];
                                      }

                                      [v7 setObject:v81 forKeyedSubscript:@"WiFiNetworkAttributeIsPublic"];
LABEL_215:
                                      if (!a2)
                                      {
                                        objc_msgSend( v7,  "setObject:forKeyedSubscript:",  objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInt:",  objc_msgSend(a1, "transitionDisabledFlags")),  @"TransitionDisabledFlags");
LABEL_221:
                                        objc_msgSend( v7,  "setObject:forKeyedSubscript:",  objc_msgSend( MEMORY[0x189607968],  "numberWithBool:",  objc_msgSend(a1, "isStandalone6G")),  @"Standalone");
LABEL_222:
                                        objc_msgSend( v7,  "setObject:forKeyedSubscript:",  objc_msgSend(a1, "carplayUUID"),  @"CARPLAY_UUID");
                                        objc_msgSend( v7,  "setObject:forKeyedSubscript:",  objc_msgSend( MEMORY[0x189607968],  "numberWithBool:",  objc_msgSend(a1, "isPersonalHotspot")),  @"IsPersonalHotspot");
                                        objc_msgSend( v7,  "setObject:forKeyedSubscript:",  objc_msgSend(a1, "NANServiceID"),  @"WiFiNetworkNANServiceID");
                                        objc_msgSend( v7,  "setObject:forKeyedSubscript:",  objc_msgSend( MEMORY[0x189607968],  "numberWithBool:",  objc_msgSend(a1, "isPublicAirPlayNetwork")),  @"PublicAirPlayNetwork");
                                        objc_msgSend( v7,  "setObject:forKeyedSubscript:",  objc_msgSend( MEMORY[0x189607968],  "numberWithBool:",  objc_msgSend(a1, "isDNSHeuristicsFilteredNetwork")),  @"FilteredNetwork");
                                        objc_msgSend( v7,  "setObject:forKeyedSubscript:",  objc_msgSend(a1, "DNSHeuristicsFailureStateInfo"),  @"DNSFailures");
                                        uint64_t v6 = WiFiNetworkCreate(*MEMORY[0x189604DB0], v7);
                                        goto LABEL_223;
                                      }

LABEL_216:
                                      if ([a2 containsObject:&unk_189E92B68]) {
                                        objc_msgSend( v7,  "setObject:forKeyedSubscript:",  objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInt:",  objc_msgSend(a1, "transitionDisabledFlags")),  @"TransitionDisabledFlags");
                                      }
                                      if (([a2 containsObject:&unk_189E92B80] & 1) == 0) {
                                        goto LABEL_222;
                                      }
                                      goto LABEL_221;
                                    }

LABEL_203:
                                    uint64_t v78 = [a1 movingAttribute];
                                    if (v78 == 1)
                                    {
                                      uint64_t v79 = MEMORY[0x189604A88];
                                    }

                                    else
                                    {
                                      if (v78 != 2) {
                                        goto LABEL_208;
                                      }
                                      uint64_t v79 = MEMORY[0x189604A80];
                                    }

                                    [v7 setObject:v79 forKeyedSubscript:@"WiFiNetworkAttributeIsMoving"];
LABEL_208:
                                    if (!a2) {
                                      goto LABEL_210;
                                    }
                                    goto LABEL_209;
                                  }

LABEL_201:
                                  objc_msgSend( v7,  "setObject:forKeyedSubscript:",  objc_msgSend(a1, "privacyProxyBlockedReason"),  @"PrivacyProxyBlockedReason");
                                  if (!a2) {
                                    goto LABEL_203;
                                  }
                                  goto LABEL_202;
                                }

LABEL_162:
                                if ([a2 containsObject:&unk_189E92AD8]) {
                                  objc_msgSend( v7,  "setObject:forKeyedSubscript:",  objc_msgSend(a1, "lastDiscoveredAt"),  @"discoveredAt");
                                }
                                if (([a2 containsObject:&unk_189E92AF0] & 1) == 0) {
                                  goto LABEL_196;
                                }
                                goto LABEL_167;
                              }

LABEL_156:
                              if ([a2 containsObject:&unk_189E92AA8]) {
                                objc_msgSend( v7,  "setObject:forKeyedSubscript:",  objc_msgSend(a1, "networkGroupID"),  @"networkGroupID");
                              }
                              if (([a2 containsObject:&unk_189E92AC0] & 1) == 0) {
                                goto LABEL_162;
                              }
                              goto LABEL_161;
                            }

LABEL_150:
                            if ([a2 containsObject:&unk_189E92A78]) {
                              objc_msgSend( v7,  "setObject:forKeyedSubscript:",  objc_msgSend(a1, "userPreferredNetworkNames"),  @"userPreferredNetworkNames");
                            }
                            if (([a2 containsObject:&unk_189E92A90] & 1) == 0) {
                              goto LABEL_156;
                            }
                            goto LABEL_155;
                          }

LABEL_144:
                          if ([a2 containsObject:&unk_189E92A48]) {
                            objc_msgSend( v7,  "setObject:forKeyedSubscript:",  objc_msgSend(a1, "NAIRealmNameList"),  @"NaiRealmName");
                          }
                          if (([a2 containsObject:&unk_189E92A60] & 1) == 0) {
                            goto LABEL_150;
                          }
                          goto LABEL_149;
                        }

LABEL_138:
                        if ([a2 containsObject:&unk_189E92A18]) {
                          objc_msgSend( v7,  "setObject:forKeyedSubscript:",  objc_msgSend( MEMORY[0x189607968],  "numberWithBool:",  objc_msgSend(a1, "isServiceProviderRoamingEnabled")),  @"SPRoaming");
                        }
                        if (([a2 containsObject:&unk_189E92A30] & 1) == 0) {
                          goto LABEL_144;
                        }
                        goto LABEL_143;
                      }

LABEL_132:
                      if ([a2 containsObject:&unk_189E929E8]) {
                        objc_msgSend( v7,  "setObject:forKeyedSubscript:",  objc_msgSend(a1, "domainName"),  @"DomainName");
                      }
                      if (([a2 containsObject:&unk_189E92A00] & 1) == 0) {
                        goto LABEL_138;
                      }
                      goto LABEL_137;
                    }

LABEL_123:
                    if (([a2 containsObject:&unk_189E929D0] & 1) == 0) {
                      goto LABEL_132;
                    }
                    goto LABEL_128;
                  }

LABEL_105:
                  goto LABEL_106;
                }

LABEL_99:
                if ([a2 containsObject:&unk_189E92940]) {
                  objc_msgSend( v7,  "setObject:forKeyedSubscript:",  objc_msgSend(a1, "lastJoinedByUserAt"),  @"lastJoined");
                }
                if (([a2 containsObject:&unk_189E92958] & 1) == 0) {
                  goto LABEL_105;
                }
                goto LABEL_104;
              }

LABEL_82:
              if ([a2 containsObject:&unk_189E92910])
              {
                else {
                  uint64_t v34 = MEMORY[0x189604A88];
                }
                [v7 setObject:v34 forKeyedSubscript:@"enabled"];
              }

              if (([a2 containsObject:&unk_189E92928] & 1) == 0) {
                goto LABEL_99;
              }
              goto LABEL_93;
            }

LABEL_76:
            if (([a2 containsObject:&unk_189E928F8] & 1) == 0) {
              goto LABEL_82;
            }
            goto LABEL_81;
          }

LABEL_72:
          goto LABEL_73;
        }

LABEL_62:
        uint64_t v32 = [a1 captiveProfile];
        if (v32) {
          [v7 addEntriesFromDictionary:v32];
        }
        if (!a2) {
          goto LABEL_66;
        }
        goto LABEL_65;
      }

      __int16 v10 = [a1 supportedSecurityTypes];
      __int16 v11 = v10;
      if ((v10 & 2) == 0)
      {
        if ((v10 & 1) == 0
          || ([v7 setObject:MEMORY[0x189604A88] forKeyedSubscript:@"WEP"],
              ![a2 containsObject:&unk_189E92880]))
        {
LABEL_31:
          if ((v11 & 0xC) != 0)
          {
            int v19 = (void *)[MEMORY[0x189603FC8] dictionary];
            objc_msgSend( v19,  "setObject:forKey:",  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInt:", 1),  @"IE_KEY_WPA_VERSION");
            objc_msgSend( v19,  "setObject:forKey:",  objc_msgSend(MEMORY[0x189607968], "numberWithInt:", 2),  @"IE_KEY_WPA_MCIPHER");
            int v20 = (void *)[MEMORY[0x189603FA8] array];
            objc_msgSend(v20, "addObject:", objc_msgSend(MEMORY[0x189607968], "numberWithInt:", 2));
            [v19 setObject:v20 forKey:@"IE_KEY_WPA_UCIPHERS"];
            int v21 = (void *)[MEMORY[0x189603FA8] array];
            if ((v11 & 8) != 0) {
              uint64_t v22 = 1LL;
            }
            else {
              uint64_t v22 = 2LL;
            }
            objc_msgSend(v21, "addObject:", objc_msgSend(MEMORY[0x189607968], "numberWithInt:", v22));
            [v19 setObject:v21 forKey:@"IE_KEY_WPA_AUTHSELS"];
            [v7 setObject:v19 forKeyedSubscript:@"WPA_IE"];
          }

          uint64_t v23 = v11 & 0x300;
          if ((v11 & 0xF0) == 0 && v23 != 256)
          {
LABEL_52:
            if (v23 == 768) {
              [v7 setObject:MEMORY[0x189604A88] forKeyedSubscript:@"SCAN_RESULT_OWE_MULTI_SSID"];
            }
            int v28 = [a1 isWPA2];
            uint64_t v29 = MEMORY[0x189604A88];
            if (v28) {
              uint64_t v30 = MEMORY[0x189604A88];
            }
            else {
              uint64_t v30 = v9;
            }
            [v7 setObject:v30 forKeyedSubscript:@"ALLOW_WPA2_PSK"];
            else {
              uint64_t v31 = v9;
            }
            [v7 setObject:v31 forKeyedSubscript:@"ALLOW_OWE_TSN"];
            CFArrayRef v4 = v86;
            if (!a2) {
              goto LABEL_62;
            }
            goto LABEL_61;
          }

          uint64_t v24 = (void *)[MEMORY[0x189603FC8] dictionary];
          objc_msgSend( v24,  "setObject:forKey:",  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInt:", 1),  @"IE_KEY_RSN_VERSION");
          objc_msgSend( v24,  "setObject:forKey:",  objc_msgSend(MEMORY[0x189607968], "numberWithInt:", 4),  @"IE_KEY_RSN_MCIPHER");
          CFIndex v25 = (void *)[MEMORY[0x189603FA8] array];
          objc_msgSend(v25, "addObject:", objc_msgSend(MEMORY[0x189607968], "numberWithInt:", 4));
          [v24 setObject:v25 forKey:@"IE_KEY_RSN_UCIPHERS"];
          uint64_t v26 = (void *)[MEMORY[0x189603FA8] array];
          if ((v11 & 0x80) != 0)
          {
            objc_msgSend(v26, "addObject:", objc_msgSend(MEMORY[0x189607968], "numberWithInt:", 12));
            if ((v11 & 0x20) == 0)
            {
LABEL_40:
              if ((v11 & 0x40) == 0) {
                goto LABEL_47;
              }
              goto LABEL_44;
            }
          }

          else if ((v11 & 0x20) == 0)
          {
            goto LABEL_40;
          }

          objc_msgSend(v26, "addObject:", objc_msgSend(MEMORY[0x189607968], "numberWithInt:", 1));
          if ((v11 & 0x40) == 0)
          {
LABEL_47:
            if (v23 == 256) {
              objc_msgSend(v26, "addObject:", objc_msgSend(MEMORY[0x189607968], "numberWithInt:", 18));
            }
            if ((v11 & 0x10) != 0) {
              objc_msgSend(v26, "addObject:", objc_msgSend(MEMORY[0x189607968], "numberWithInt:", 2));
            }
            [v24 setObject:v26 forKey:@"IE_KEY_RSN_AUTHSELS"];
            [v7 setObject:v24 forKeyedSubscript:@"RSN_IE"];
            goto LABEL_52;
          }

LABEL_44:
          objc_msgSend(v26, "addObject:", objc_msgSend(MEMORY[0x189607968], "numberWithInt:", 8));
          BOOL v27 = (void *)[MEMORY[0x189603FC8] dictionary];
          [v27 setObject:MEMORY[0x189604A88] forKey:@"MFP_CAPABLE"];
          if ((v11 & 0x10) == 0) {
            [v27 setObject:MEMORY[0x189604A88] forKey:@"MFP_REQUIRED"];
          }
          [v24 setObject:v27 forKey:@"IE_KEY_RSN_CAPS"];
          goto LABEL_47;
        }

        goto LABEL_19;
      }
    }

    else
    {
      objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a1, "SSID"), @"SSID");
      objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a1, "networkName"), @"SSID_STR");
      __int16 v12 = [a1 supportedSecurityTypes];
      __int16 v11 = v12;
      if ((v12 & 2) == 0)
      {
        if ((v12 & 1) == 0) {
          goto LABEL_31;
        }
        [v7 setObject:MEMORY[0x189604A88] forKeyedSubscript:@"WEP"];
LABEL_19:
        unint64_t v13 = [a1 WEPSubtype] - 1;
        if (v13 > 3) {
          uint64_t v14 = 0LL;
        }
        else {
          uint64_t v14 = dword_1865BCF70[v13];
        }
        CFIndex v17 = (void *)[MEMORY[0x189607968] numberWithInt:v14];
        uint64_t v18 = @"WEP_AUTH_Flags";
LABEL_30:
        [v7 setObject:v17 forKeyedSubscript:v18];
        goto LABEL_31;
      }
    }

    uint64_t v15 = [a1 WAPISubtype];
    uint64_t v16 = &unk_189E92868;
    if (v15 != 1) {
      uint64_t v16 = 0LL;
    }
    if (v15 == 2) {
      CFIndex v17 = &unk_189E92850;
    }
    else {
      CFIndex v17 = v16;
    }
    uint64_t v18 = @"WAPI";
    goto LABEL_30;
  }

LABEL_223:
  objc_autoreleasePoolPop(v4);
  return v6;
}

uint64_t WiFiNetworkCreateCoreWiFiScanResult(uint64_t a1)
{
  v35[75] = *MEMORY[0x1895F89C0];
  id v2 = (void *)MEMORY[0x186E3BB0C]();
  if (getCWFScanResultClass()
    && (uint64_t CWFScanResultPropertyOSSpecificAttributesKey = getCWFScanResultPropertyOSSpecificAttributesKey(), a1)
    && CWFScanResultPropertyOSSpecificAttributesKey
    && (CFDictionaryRef Copy = CFDictionaryCreateCopy((CFAllocatorRef)*MEMORY[0x189604DB0], *(CFDictionaryRef *)(a1 + 16))) != 0LL)
  {
    CFDictionaryRef v5 = Copy;
    uint64_t v23 = v2;
    id v6 = (id)objc_msgSend((id)WiFiNetworkGetProperty(a1, @"HS20GasResponse"), "mutableCopy");
    [v6 setObject:0 forKeyedSubscript:@"ANQP_STATUS"];
    [v6 setObject:0 forKeyedSubscript:@"BSSID"];
    [v6 setObject:0 forKeyedSubscript:@"CHANNEL"];
    [v6 setObject:0 forKeyedSubscript:@"CHANNEL_FLAGS"];
    id v7 = (id)-[__CFDictionary mutableCopy](v5, "mutableCopy");
    [v7 setObject:v6 forKeyedSubscript:@"ANQP_PARSED"];
    uint64_t v8 = (void *)[MEMORY[0x189603FC8] dictionary];
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    uint64_t v9 = (void *)[MEMORY[0x18960F060] supportedOSSpecificKeys];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v29;
      do
      {
        for (uint64_t i = 0LL; i != v11; ++i)
        {
          if (*(void *)v29 != v12) {
            objc_enumerationMutation(v9);
          }
          objc_msgSend( v8,  "setObject:forKeyedSubscript:",  WiFiNetworkGetProperty(a1, *(void **)(*((void *)&v28 + 1) + 8 * i)),  *(void *)(*((void *)&v28 + 1) + 8 * i));
        }

        uint64_t v11 = [v9 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }

      while (v11);
    }

    if ([v8 count]) {
      uint64_t v14 = v8;
    }
    else {
      uint64_t v14 = 0LL;
    }
    [v7 setObject:v14 forKeyedSubscript:getCWFScanResultPropertyOSSpecificAttributesKey()];
    v35[0] = @"IsWiFiNetworkShareble";
    v35[1] = @"NetworkOriginator";
    v35[2] = @"CaptiveBypass";
    v35[3] = @"DiagnosticsBssEnv";
    v35[4] = @"DisableWiFiAutoJoinUntilFirstUserJoin";
    v35[5] = @"DisplayedOperatorName";
    v35[6] = @"DomainName";
    v35[7] = @"HS20GasResponse";
    v35[8] = @"HS20HomeOperatorNetwork";
    v35[9] = @"HS20ProvisionedNetwork";
    v35[10] = @"HS2NetworkBadge";
    v35[11] = @"HS20AccountName";
    v35[12] = @"MCCandMNC";
    v35[13] = @"NaiRealmName";
    v35[14] = @"NetworkAtLocationOfInterestType";
    v35[15] = @"WiFiNetworkAttributeHighPopularity";
    v35[16] = @"WiFiNetworkAttributeHighQuality";
    v35[17] = @"WiFiNetworkAttributeIsMoving";
    v35[18] = @"WiFiNetworkAttributeIsPotentiallyCaptive";
    v35[19] = @"WiFiNetworkAttributeIsPotentiallyMoving";
    v35[20] = @"WiFiNetworkAttributeIsSuspicious";
    v35[21] = @"WiFiNetworkAttributeIsTCPGood";
    v35[22] = @"WiFiNetworkAttributeLowPopularity";
    v35[23] = @"WiFiNetworkAttributeLowQuality";
    v35[24] = @"WiFiNetworkAttributePopularityScore";
    v35[25] = @"WiFiNetworkAttributeProminentDisplay";
    v35[26] = @"WiFiNetworkAttributeQualityScore";
    v35[27] = @"WiFiNetworkAttributeSource";
    v35[28] = @"BundleIdentifier";
    v35[29] = @"SIMIdentifiers";
    v35[30] = @"WiFiNetworkDisabledUntilDate";
    v35[31] = @"EnterpriseProfile";
    v35[32] = @"WiFiNetworkExpirationDate";
    v35[33] = @"NetworkForcedHomeFix";
    v35[34] = @"kWiFiNetworkLastHomeForceFixDateKey";
    v35[35] = @"NetworkOfInterestHomeState";
    v35[36] = @"NetworkOfInterestWorkState";
    v35[37] = @"WiFiNetworkPasswordModificationDate";
    v35[38] = @"PayloadUUID";
    v35[39] = @"SaveDataMode";
    v35[40] = @"NetworkQualityResponsiveness";
    v35[41] = @"NetworkQualityDate";
    v35[42] = @"ShareableEAPConfig";
    v35[43] = @"ShareableEAPTrustExceptions";
    v35[44] = @"ShareableStatus";
    v35[45] = @"ShareMode";
    v35[46] = @"kWiFiNetworkSSIDHarvestStatusKey";
    v35[47] = @"UserRole";
    v35[48] = @"WalletIdentifier";
    v35[49] = @"addedAt";
    v35[50] = @"knownBSSUpdatedDate";
    v35[51] = @"lastAutoJoined";
    v35[52] = @"lastJoined";
    v35[53] = @"lastRoamed";
    v35[54] = @"lastUpdated";
    v35[55] = @"WiFiManagerKnownNetworksEventType";
    v35[56] = @"networkDisabledClientName";
    v35[57] = @"networkDisabledReason";
    v35[58] = @"networkDisabledTimestamp";
    v35[59] = @"enabled";
    v35[60] = @"networkKnownBSSListKey";
    v35[61] = @"scanWasDirected";
    v35[62] = @"prevJoined";
    v35[63] = @"UserDirected";
    v35[64] = @"networkUsage";
    v35[65] = @"RoamingConsortiumOIs";
    v35[66] = @"SPRoaming";
    v35[67] = @"PolicyUUID";
    v35[68] = @"PrivacyProxyEnabled";
    v35[69] = @"TransitionDisabledFlags";
    v35[70] = @"Standalone";
    v35[71] = @"PublicAirPlayNetwork";
    v35[72] = @"PrivacyProxyBlockedReason";
    v35[73] = @"FilteredNetwork";
    v35[74] = @"DNSFailures";
    uint64_t v15 = (void *)[MEMORY[0x189603F18] arrayWithObjects:v35 count:75];
    if (MEMORY[0x18960D5A8])
    {
      uint64_t v16 = *MEMORY[0x18960D6D8];
      v34[0] = *MEMORY[0x18960D690];
      v34[1] = v16;
      uint64_t v15 = (void *)objc_msgSend( v15,  "arrayByAddingObjectsFromArray:",  objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:count:", v34, 2));
    }

    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    uint64_t v17 = [v15 countByEnumeratingWithState:&v24 objects:v32 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v25;
      do
      {
        for (uint64_t j = 0LL; j != v18; ++j)
        {
          if (*(void *)v25 != v19) {
            objc_enumerationMutation(v15);
          }
          [v7 setObject:0 forKeyedSubscript:*(void *)(*((void *)&v24 + 1) + 8 * j)];
        }

        uint64_t v18 = [v15 countByEnumeratingWithState:&v24 objects:v32 count:16];
      }

      while (v18);
    }

    uint64_t v21 = [objc_alloc((Class)getCWFScanResultClass()) initWithScanRecord:v7 includeProperties:0];
    objc_autoreleasePoolPop(v23);
    CFRelease(v5);
  }

  else
  {
    objc_autoreleasePoolPop(v2);
    return 0LL;
  }

  return v21;
}

uint64_t getCWFScanResultClass()
{
  uint64_t v3 = 0LL;
  CFArrayRef v4 = &v3;
  uint64_t v5 = 0x3052000000LL;
  id v6 = __Block_byref_object_copy_;
  id v7 = __Block_byref_object_dispose_;
  uint64_t v0 = getCWFScanResultClass_softClass;
  uint64_t v8 = getCWFScanResultClass_softClass;
  if (!getCWFScanResultClass_softClass)
  {
    v2[0] = MEMORY[0x1895F87A8];
    v2[1] = 3221225472LL;
    _OWORD v2[2] = __getCWFScanResultClass_block_invoke;
    v2[3] = &unk_189E8BA58;
    v2[4] = &v3;
    __getCWFScanResultClass_block_invoke((uint64_t)v2);
    uint64_t v0 = v4[5];
  }

  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1865A5A4C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t getCWFScanResultPropertyOSSpecificAttributesKey()
{
  uint64_t v3 = 0LL;
  CFArrayRef v4 = &v3;
  uint64_t v5 = 0x2020000000LL;
  uint64_t v0 = (void *)getCWFScanResultPropertyOSSpecificAttributesKeySymbolLoc_ptr;
  uint64_t v6 = getCWFScanResultPropertyOSSpecificAttributesKeySymbolLoc_ptr;
  if (!getCWFScanResultPropertyOSSpecificAttributesKeySymbolLoc_ptr)
  {
    uint64_t v1 = (void *)CoreWiFiLibrary();
    uint64_t v0 = dlsym(v1, "CWFScanResultPropertyOSSpecificAttributesKey");
    v4[3] = (uint64_t)v0;
    getCWFScanResultPropertyOSSpecificAttributesKeySymbolLoc_ptr = (uint64_t)v0;
  }

  _Block_object_dispose(&v3, 8);
  if (!v0) {
    getCWFScanResultPropertyOSSpecificAttributesKey_cold_1();
  }
  return *(void *)v0;
}

void sub_1865A5AE8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t WiFiNetworkCompareWithKnownNetwork(const __CFDictionary **a1, const __CFDictionary **a2)
{
  unint64_t Property = WiFiNetworkGetProperty((uint64_t)a1, @"WiFiNetworkNANServiceID");
  uint64_t v5 = WiFiNetworkGetProperty((uint64_t)a2, @"WiFiNetworkNANServiceID");
  if (Property) {
    BOOL v6 = v5 == 0LL;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6 && CFEqual(Property, v5)) {
    return 1LL;
  }
  uint64_t result = 0LL;
  if (a1 && a2)
  {
    if (__WiFiCompareSSIDorBSSID(a1[2], a2[2]))
    {
      if (WiFiNetworkIsHotspot20((BOOL)a1) && !WiFiNetworkIsHotspot20((BOOL)a2)
        || !WiFiNetworkIsHotspot20((BOOL)a1) && WiFiNetworkIsHotspot20((BOOL)a2))
      {
        objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
        return 0LL;
      }

      uint64_t result = __WiFiCompareBGScanParams(a1[2], a2[2]);
      if (!(_DWORD)result) {
        return result;
      }
      int HaveSameDomain = __WiFiCompareDictionaryValues(a1[2], a2[2], @"AP_MODE");
      return HaveSameDomain != 0;
    }

    if (!__WiFiIsSameHS20Account(a1, a2, 0))
    {
      int HaveSameDomain = __WiFiHS20NetworksHaveSameDomain((uint64_t)a1, (uint64_t)a2);
      return HaveSameDomain != 0;
    }

    return 1LL;
  }

  return result;
}

void *WiFiNetworkCreateFromCoreWiFiScanResult(void *a1)
{
  id v2 = (void *)MEMORY[0x186E3BB0C]();
  uint64_t CWFScanResultClass = getCWFScanResultClass();
  if (a1
    && CWFScanResultClass
    && (getCWFScanResultClass(), objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (id v4 = (id)objc_msgSend((id)objc_msgSend(a1, "scanRecord"), "mutableCopy")) != 0
    && (uint64_t v5 = v4,
        objc_msgSend(v4, "addEntriesFromDictionary:", objc_msgSend(a1, "OSSpecificAttributes")),
        BOOL v6 = (const __CFAllocator *)*MEMORY[0x189604DB0],
        (id v7 = WiFiNetworkCreate(*MEMORY[0x189604DB0], v5)) != 0LL))
  {
    uint64_t v8 = v7;
    uint64_t v9 = (void *)[a1 matchingKnownNetworkProfile];
    if (v9)
    {
      uint64_t v10 = (CFDictionaryRef *)WiFiNetworkCreateFromCoreWiFiNetworkProfile(v9, 0LL);
      uint64_t v11 = v10;
      if (v10 && (CFDictionaryRef Copy = CFDictionaryCreateCopy(v6, v10[2])) != 0LL)
      {
        CFDictionaryRef v13 = Copy;
        id v14 = (id)[v5 copy];
        [v5 setDictionary:v13];
        [v5 addEntriesFromDictionary:v14];
        uint64_t v15 = WiFiNetworkCreate((int)v6, v5);
        CFRelease(v13);
      }

      else
      {
        uint64_t v15 = 0LL;
      }
    }

    else
    {
      uint64_t v15 = (void *)CFRetain(v8);
      uint64_t v11 = 0LL;
    }

    unint64_t Property = WiFiNetworkGetProperty((uint64_t)v11, @"WPA_IE");
    uint64_t v17 = WiFiNetworkGetProperty((uint64_t)v8, @"WPA_IE");
    uint64_t v18 = WiFiNetworkGetProperty((uint64_t)v11, @"RSN_IE");
    uint64_t v19 = WiFiNetworkGetProperty((uint64_t)v8, @"RSN_IE");
    if (v18 && Property && v19 && !v17) {
      WiFiNetworkSetProperty((uint64_t)v15, @"WPA_IE", 0LL);
    }
    objc_autoreleasePoolPop(v2);
    if (v11) {
      CFRelease(v11);
    }
    CFRelease(v8);
  }

  else
  {
    objc_autoreleasePoolPop(v2);
    return 0LL;
  }

  return v15;
}

CFDictionaryRef WiFiNetworkGetApManufacturerName(const __CFDictionary *result)
{
  if (result)
  {
    uint64_t result = (const __CFDictionary *)WiFiNetworkGetProperty((uint64_t)result, @"WPS_PROB_RESP_IE");
    if (result)
    {
      uint64_t result = (const __CFDictionary *)CFDictionaryGetValue(result, @"IE_KEY_WPS_MANUFACTURER");
      if (result)
      {
        uint64_t v1 = result;
        CFTypeID TypeID = CFStringGetTypeID();
        if (TypeID == CFGetTypeID(v1)) {
          return v1;
        }
        else {
          return 0LL;
        }
      }
    }
  }

  return result;
}

CFDictionaryRef WiFiNetworkGetApModelName(const __CFDictionary *result)
{
  if (result)
  {
    uint64_t result = (const __CFDictionary *)WiFiNetworkGetProperty((uint64_t)result, @"WPS_PROB_RESP_IE");
    if (result)
    {
      uint64_t result = (const __CFDictionary *)CFDictionaryGetValue(result, @"IE_KEY_WPS_MODEL_NAME");
      if (result)
      {
        uint64_t v1 = result;
        CFTypeID TypeID = CFStringGetTypeID();
        if (TypeID == CFGetTypeID(v1)) {
          return v1;
        }
        else {
          return 0LL;
        }
      }
    }
  }

  return result;
}

CFDictionaryRef WiFiNetworkGetApModelNumber(const __CFDictionary *result)
{
  if (result)
  {
    uint64_t result = (const __CFDictionary *)WiFiNetworkGetProperty((uint64_t)result, @"WPS_PROB_RESP_IE");
    if (result)
    {
      uint64_t result = (const __CFDictionary *)CFDictionaryGetValue(result, @"IE_KEY_WPS_MODEL_NUM");
      if (result)
      {
        uint64_t v1 = result;
        CFTypeID TypeID = CFStringGetTypeID();
        if (TypeID == CFGetTypeID(v1)) {
          return v1;
        }
        else {
          return 0LL;
        }
      }
    }
  }

  return result;
}

uint64_t WiFiNetworkGetApDeviceVersion(uint64_t a1)
{
  if (a1) {
    WiFiNetworkGetProperty(a1, @"WPS_PROB_RESP_IE");
  }
  return 0LL;
}

CFDataRef WiFiNetworkCreatePrivateMacAddress( const __CFData *a1, const __CFData *a2, const __CFData *a3, CFStringRef theString)
{
  CFDataRef v4 = 0LL;
  uint64_t v29 = *MEMORY[0x1895F89C0];
  *(_OWORD *)md = 0u;
  __int128 v28 = 0u;
  *(void *)&__int128 v5 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  bytes[0] = v5;
  bytes[1] = v5;
  if (a1 && a3)
  {
    if (theString)
    {
      uint64_t v9 = (const __CFAllocator *)*MEMORY[0x189604DB0];
      CFDataRef ExternalRepresentation = CFStringCreateExternalRepresentation( (CFAllocatorRef)*MEMORY[0x189604DB0],  theString,  0x8000100u,  0);
    }

    else
    {
      if (SecRandomCopyBytes((SecRandomRef)*MEMORY[0x18960BE08], 0x20uLL, bytes)) {
        return 0LL;
      }
      uint64_t v9 = (const __CFAllocator *)*MEMORY[0x189604DB0];
      CFDataRef ExternalRepresentation = CFDataCreate((CFAllocatorRef)*MEMORY[0x189604DB0], (const UInt8 *)bytes, 32LL);
    }

    uint64_t v11 = ExternalRepresentation;
    CFMutableArrayRef Mutable = CFDataCreateMutable(v9, 0LL);
    if (Mutable)
    {
      BytePtr = CFDataGetBytePtr(v11);
      id v14 = CFDataGetBytePtr(a1);
      uint64_t v15 = CFDataGetBytePtr(a3);
      if (a2) {
        uint64_t v16 = CFDataGetBytePtr(a2);
      }
      else {
        uint64_t v16 = 0LL;
      }
      CFIndex Length = CFDataGetLength(a1);
      CFDataAppendBytes(Mutable, v14, Length);
      CFDataAppendBytes(Mutable, v15, 6LL);
      CFIndex v18 = CFDataGetLength(v11);
      CFDataAppendBytes(Mutable, BytePtr, v18);
      if (a2 && v16)
      {
        CFIndex v19 = CFDataGetLength(a2);
        CFDataAppendBytes(Mutable, v16, v19);
      }

      CFIndex v20 = CFDataGetLength(a1);
      CFIndex v21 = v20 + CFDataGetLength(v11) + 6;
      if (a2) {
        LODWORD(v21) = CFDataGetLength(a2) + v21;
      }
      MutableBytePtr = CFDataGetMutableBytePtr(Mutable);
      *(void *)&v25.wbuf[14] = 0xAAAAAAAAAAAAAAAALL;
      *(void *)&__int128 v23 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v23 + 1) = 0xAAAAAAAAAAAAAAAALL;
      *(_OWORD *)&v25.wbuf[6] = v23;
      *(_OWORD *)&v25.wbuf[10] = v23;
      *(_OWORD *)&v25.hash[6] = v23;
      *(_OWORD *)&v25.wbuf[2] = v23;
      *(_OWORD *)v25.count = v23;
      *(_OWORD *)&v25.hash[2] = v23;
      CC_SHA256_Init(&v25);
      CC_SHA256_Update(&v25, MutableBytePtr, v21);
      CC_SHA256_Final(md, &v25);
    }

    v25.count[0] = *(_DWORD *)md;
    LOWORD(v25.count[1]) = *(_WORD *)&md[4];
    LOBYTE(v25.count[0]) = md[0] & 0xFC | 2;
    CFDataRef v4 = CFDataCreate(v9, (const UInt8 *)&v25, 6LL);
    if (Mutable) {
      CFRelease(Mutable);
    }
    if (v11) {
      CFRelease(v11);
    }
  }

  return v4;
}

CFDataRef WiFiNetworkCreateForceNewPrivateMacAddress( const __CFData *a1, const __CFData *a2, CFStringRef theString)
{
  CFDataRef v3 = 0LL;
  uint64_t v28 = *MEMORY[0x1895F89C0];
  __int16 v22 = 0;
  *(_DWORD *)CFIndex v21 = 0;
  *(_OWORD *)md = 0u;
  __int128 v27 = 0u;
  *(void *)&__int128 v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  bytes[0] = v4;
  bytes[1] = v4;
  *(_OWORD *)__int128 v23 = v4;
  __int128 v24 = v4;
  if (a1 && a2)
  {
    if (theString)
    {
      id v7 = (const __CFAllocator *)*MEMORY[0x189604DB0];
      CFDataRef ExternalRepresentation = CFStringCreateExternalRepresentation( (CFAllocatorRef)*MEMORY[0x189604DB0],  theString,  0x8000100u,  0);
      uint64_t v9 = (const __SecRandom *)*MEMORY[0x18960BE08];
    }

    else
    {
      uint64_t v9 = (const __SecRandom *)*MEMORY[0x18960BE08];
      if (SecRandomCopyBytes((SecRandomRef)*MEMORY[0x18960BE08], 0x20uLL, v23)) {
        return 0LL;
      }
      id v7 = (const __CFAllocator *)*MEMORY[0x189604DB0];
      CFDataRef ExternalRepresentation = CFDataCreate((CFAllocatorRef)*MEMORY[0x189604DB0], v23, 32LL);
    }

    if (SecRandomCopyBytes(v9, 0x20uLL, bytes))
    {
      CFDataRef v3 = 0LL;
    }

    else
    {
      CFMutableArrayRef Mutable = CFDataCreateMutable(v7, 0LL);
      if (Mutable)
      {
        BytePtr = CFDataGetBytePtr(ExternalRepresentation);
        uint64_t v12 = CFDataGetBytePtr(a1);
        CFDictionaryRef v13 = CFDataGetBytePtr(a2);
        CFIndex Length = CFDataGetLength(a1);
        CFDataAppendBytes(Mutable, v12, Length);
        CFDataAppendBytes(Mutable, v13, 6LL);
        CFIndex v15 = CFDataGetLength(ExternalRepresentation);
        CFDataAppendBytes(Mutable, BytePtr, v15);
        CFDataAppendBytes(Mutable, (const UInt8 *)bytes, 32LL);
        int v16 = CFDataGetLength(a1);
        LODWORD(v13) = v16 + CFDataGetLength(ExternalRepresentation);
        MutableBytePtr = CFDataGetMutableBytePtr(Mutable);
        *(void *)&v20.wbuf[14] = 0xAAAAAAAAAAAAAAAALL;
        *(void *)&__int128 v18 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v18 + 1) = 0xAAAAAAAAAAAAAAAALL;
        *(_OWORD *)&v20.wbuf[6] = v18;
        *(_OWORD *)&v20.wbuf[10] = v18;
        *(_OWORD *)&v20.hash[6] = v18;
        *(_OWORD *)&v20.wbuf[2] = v18;
        *(_OWORD *)v20.count = v18;
        *(_OWORD *)&v20.hash[2] = v18;
        CC_SHA256_Init(&v20);
        CC_SHA256_Update(&v20, MutableBytePtr, (_DWORD)v13 + 38);
        CC_SHA256_Final(md, &v20);
      }

      *(_DWORD *)CFIndex v21 = *(_DWORD *)md;
      __int16 v22 = *(_WORD *)&md[4];
      v21[0] = md[0] & 0xFC | 2;
      CFDataRef v3 = CFDataCreate(v7, v21, 6LL);
      if (Mutable) {
        CFRelease(Mutable);
      }
    }

    if (ExternalRepresentation) {
      CFRelease(ExternalRepresentation);
    }
  }

  return v3;
}

CFDataRef WiFiNetworkCreateNetworkID(const __CFData *a1, const __CFString *a2)
{
  CFDataRef v2 = 0LL;
  uint64_t v21 = *MEMORY[0x1895F89C0];
  *(void *)&__int128 v3 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)bytes = v3;
  __int128 v20 = v3;
  *(_OWORD *)md = 0u;
  __int128 v18 = 0u;
  if (a1 && a2)
  {
    __int128 v5 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    CFDataRef ExternalRepresentation = CFStringCreateExternalRepresentation( (CFAllocatorRef)*MEMORY[0x189604DB0],  a2,  0x8000100u,  0);
    CFMutableDataRef Mutable = CFDataCreateMutable(v5, 0LL);
    if (!Mutable)
    {
      *(_OWORD *)bytes = 0u;
      __int128 v20 = 0u;
      CFDataRef v2 = CFDataCreate(v5, bytes, 32LL);
      if (!ExternalRepresentation) {
        return v2;
      }
      goto LABEL_5;
    }

    uint64_t v8 = Mutable;
    BytePtr = CFDataGetBytePtr(ExternalRepresentation);
    uint64_t v10 = CFDataGetBytePtr(a1);
    CFDataAppendBytes(v8, v10, 6LL);
    CFIndex Length = CFDataGetLength(ExternalRepresentation);
    CFDataAppendBytes(v8, BytePtr, Length);
    int v12 = CFDataGetLength(ExternalRepresentation);
    MutableBytePtr = CFDataGetMutableBytePtr(v8);
    *(void *)&v16.wbuf[14] = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&__int128 v14 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v14 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)&v16.wbuf[6] = v14;
    *(_OWORD *)&v16.wbuf[10] = v14;
    *(_OWORD *)&v16.hash[6] = v14;
    *(_OWORD *)&v16.wbuf[2] = v14;
    *(_OWORD *)v16.count = v14;
    *(_OWORD *)&v16.hash[2] = v14;
    CC_SHA256_Init(&v16);
    CC_SHA256_Update(&v16, MutableBytePtr, v12 + 6);
    CC_SHA256_Final(md, &v16);
    *(_OWORD *)bytes = *(_OWORD *)md;
    __int128 v20 = v18;
    CFDataRef v2 = CFDataCreate(v5, bytes, 32LL);
    CFRelease(v8);
    if (ExternalRepresentation) {
LABEL_5:
    }
      CFRelease(ExternalRepresentation);
  }

  return v2;
}

uint64_t WiFiNetworkIsOpen(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    return !WiFiNetworkIsEAP(result)
        && CFDictionaryGetValue(*(CFDictionaryRef *)(v1 + 16), @"WEP") != (const void *)*MEMORY[0x189604DE8]
        && !WiFiNetworkIsWPAWPA2PSK(v1)
        && !WiFiNetworkIsWAPI(v1)
  }

  return result;
}

const void *WiFiPrivateMacNetworkGetMatchingNetwork(const __CFArray *a1, const __CFDictionary **a2)
{
  uint64_t result = 0LL;
  uint64_t v4 = 0LL;
  CFIndex idx = -1LL;
  if (a1 && a2)
  {
    WiFiGetPrivateMacNetworkIndices(a1, a2, &idx, &v4);
    if (idx == -1) {
      return 0LL;
    }
    else {
      return CFArrayGetValueAtIndex(a1, idx);
    }
  }

  return result;
}

void WiFiGetPrivateMacNetworkIndices( const __CFArray *a1, const __CFDictionary **a2, CFIndex *a3, void *a4)
{
  if (!a1) {
    goto LABEL_12;
  }
  CFIndex Count = CFArrayGetCount(a1);
  if (!Count) {
    goto LABEL_12;
  }
  if (!a2) {
    goto LABEL_18;
  }
  uint64_t v9 = Count;
  CFTypeID v10 = CFGetTypeID(a2);
  uint64_t v11 = __kWiFiNetworkTypeID;
  if (!__kWiFiNetworkTypeID)
  {
    pthread_once(&__wifiNetworkTypeInit, (void (*)(void))__WiFiNetworkRegister);
    uint64_t v11 = __kWiFiNetworkTypeID;
  }

  if (v10 != v11)
  {
LABEL_18:
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
    goto LABEL_12;
  }

  if (v9 < 1)
  {
LABEL_12:
    CFIndex v12 = -1LL;
    goto LABEL_13;
  }

  CFIndex v12 = 0LL;
  while (1)
  {
    ValueAtIndex = (CFTypeRef *)CFArrayGetValueAtIndex(a1, v12);
    if (ValueAtIndex)
    {
    }

    if (v9 == ++v12) {
      goto LABEL_12;
    }
  }

uint64_t WiFiNetworkPrivateMacIsNetworkTrustworthy(uint64_t a1)
{
  if (a1) {
    return WiFiNetworkIsPublicAirPlayNetwork(a1) ^ 1;
  }
  else {
    return 1LL;
  }
}

BOOL WiFiNetworkPrivateMacNetworkType(CFDictionaryRef *a1)
{
  CoreWiFiNetworkProfile = WiFiNetworkCreateCoreWiFiNetworkProfile(a1);
  CoreWiFiScanResult = (void *)WiFiNetworkCreateCoreWiFiScanResult((uint64_t)a1);
  else {
    LOBYTE(v4) = 1;
  }
  char v5 = [CoreWiFiNetworkProfile supportedSecurityTypes];
  if (CoreWiFiNetworkProfile) {
    CFRelease(CoreWiFiNetworkProfile);
  }
  if (CoreWiFiScanResult) {
    CFRelease(CoreWiFiScanResult);
  }
  BOOL v6 = WiFiNetworkIsCarPlay((uint64_t)a1) == 0;
  BOOL result = v6;
  if (v6) {
    char v8 = v4;
  }
  else {
    char v8 = 1;
  }
  if ((v8 & 1) == 0)
  {
    if (WiFiNetworkIsLegacyHotspot((uint64_t)a1)
      || WiFiNetworkIsHotspot20((BOOL)a1)
      || WiFiNetworkIsHotspot((uint64_t)a1)
      || WiFiNetworkIsPublicHotspot((uint64_t)a1))
    {
      return 1LL;
    }

    if (a1)
    {
      if (!CFDictionaryGetValue(a1[2], @"DomainName")
        && !CFDictionaryContainsKey(a1[2], @"BundleIdentifier")
        && !WiFiNetworkIsCarrierBundleBased((uint64_t)a1)
        && !WiFiNetworkGetProperty((uint64_t)a1, @"WalletIdentifier"))
      {
LABEL_25:
        if (!WiFiNetworkIsPublicAirPlayNetwork((uint64_t)a1)
          && !WiFiNetworkIsApplePersonalHotspot((uint64_t)a1))
        {
          return ((unint64_t)WiFiNetworkGetAccessoryIdentifier((uint64_t)a1) | v5 & 4 | v5 & 8) != 0;
        }
      }
    }

    else if (!WiFiNetworkIsCarrierBundleBased(0LL))
    {
      goto LABEL_25;
    }

    return 1LL;
  }

  return result;
}

BOOL WiFiNetworkIsAccessoryNetwork(uint64_t a1)
{
  return WiFiNetworkGetAccessoryIdentifier(a1) != 0LL;
}

uint64_t WiFiNetworkGetAuthTypes(uint64_t a1, __int32 *a2)
{
  int v4 = *(const __CFDictionary **)(a1 + 16);
  if (v4)
  {
    int Value = (const __CFDictionary *)CFDictionaryGetValue(v4, @"RSN_IE");
    BOOL v6 = (const __CFDictionary *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"WPA_IE");
    if (Value)
    {
      BOOL v7 = __WiFiNetworkContainsAuthSelector(Value, 2) != 0;
      int v8 = __WiFiNetworkContainsAuthSelector(Value, 1);
      if (v8) {
        int v9 = (8 * v7) | 4;
      }
      else {
        int v9 = 8 * v7;
      }
      v35.i32[0] = v9;
      v35.i32[1] = v8 | (2 * v7);
      unsigned int v34 = __WiFiNetworkContainsAuthSelector(Value, 3) == 0;
      unsigned int v10 = __WiFiNetworkContainsAuthSelector(Value, 4) == 0;
      unsigned int v11 = __WiFiNetworkContainsAuthSelector(Value, 5) == 0;
      unsigned int v12 = __WiFiNetworkContainsAuthSelector(Value, 6) == 0;
      unsigned int v13 = __WiFiNetworkContainsAuthSelector(Value, 8) == 0;
      unsigned int v14 = __WiFiNetworkContainsAuthSelector(Value, 9) == 0;
      unsigned int v15 = __WiFiNetworkContainsAuthSelector(Value, 24) == 0;
      unsigned int v16 = __WiFiNetworkContainsAuthSelector(Value, 25) == 0;
      unsigned int v17 = __WiFiNetworkContainsAuthSelector(Value, 12) == 0;
      int8x8_t v18 = vbsl_s8( (int8x8_t)vcltz_s32(vshl_n_s32(vdup_n_s32(v34), 0x1FuLL)),  v35,  vorr_s8(v35, (int8x8_t)0x400000080LL));
      int8x8_t v19 = vbsl_s8( (int8x8_t)vcltz_s32(vshl_n_s32(vdup_n_s32(v10), 0x1FuLL)),  v18,  vorr_s8(v18, (int8x8_t)0x800000010LL));
      int8x8_t v20 = vbsl_s8( (int8x8_t)vcltz_s32(vshl_n_s32(vdup_n_s32(v11), 0x1FuLL)),  v19,  vorr_s8(v19, (int8x8_t)0x1000000800LL));
      int8x8_t v21 = vbsl_s8( (int8x8_t)vcltz_s32(vshl_n_s32(vdup_n_s32(v12), 0x1FuLL)),  v20,  vorr_s8(v20, (int8x8_t)0x2000000400LL));
      int8x8_t v22 = vbsl_s8( (int8x8_t)vcltz_s32(vshl_n_s32(vdup_n_s32(v13), 0x1FuLL)),  v21,  vorr_s8(v21, (int8x8_t)0x8000001000LL));
      int8x8_t v23 = vbsl_s8( (int8x8_t)vcltz_s32(vshl_n_s32(vdup_n_s32(v14), 0x1FuLL)),  v22,  vorr_s8(v22, (int8x8_t)0x10000002000LL));
      int8x8_t v24 = vbsl_s8( (int8x8_t)vcltz_s32(vshl_n_s32(vdup_n_s32(v15), 0x1FuLL)),  v23,  vorr_s8(v23, (int8x8_t)0x80000000010000LL));
      int8x8_t v25 = vbsl_s8( (int8x8_t)vcltz_s32(vshl_n_s32(vdup_n_s32(v16), 0x1FuLL)),  v24,  vorr_s8(v24, (int8x8_t)0x100000000020000LL));
      int8x8_t v26 = vbsl_s8( (int8x8_t)vcltz_s32(vshl_n_s32(vdup_n_s32(v17), 0x1FuLL)),  v25,  vorr_s8(v25, (int8x8_t)0x80000004000LL));
      __int32 v27 = __WiFiNetworkContainsAuthSelector(Value, 13);
      v28.i32[0] = 0;
      v29.i32[0] = v27;
      int8x8_t v30 = vbsl_s8(vdup_lane_s8(vceq_s8(v29, v28), 0), v26, vorr_s8(v26, (int8x8_t)0x100000008000LL));
    }

    else
    {
      int8x8_t v30 = 0LL;
    }

    uint64_t v32 = v30.u32[0];
    __int32 v31 = v30.i32[1];
    if (v6)
    {
      uint64_t v32 = v32 | __WiFiNetworkContainsAuthSelector(v6, 1);
    }
  }

  else
  {
    __int32 v31 = 0;
    uint64_t v32 = 0xFFFFLL;
  }

  if (a2) {
    *a2 = v31;
  }
  return v32;
}

uint64_t __WiFiNetworkContainsAuthSelector(const __CFDictionary *a1, int a2)
{
  int Value = (const __CFArray *)CFDictionaryGetValue(a1, @"IE_KEY_RSN_AUTHSELS");
  if (Value
    || (uint64_t result = (uint64_t)CFDictionaryGetValue(a1, @"IE_KEY_WPA_AUTHSELS"),
        (int Value = (const __CFArray *)result) != 0LL))
  {
    CFIndex Count = CFArrayGetCount(Value);
    if (Count < 1)
    {
      return 0LL;
    }

    else
    {
      CFIndex v7 = Count;
      CFIndex v8 = 0LL;
      while (1)
      {
        int valuePtr = -1431655766;
        ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(Value, v8);
        if (CFNumberGetValue(ValueAtIndex, kCFNumberSInt32Type, &valuePtr))
        {
          if (valuePtr == a2) {
            break;
          }
        }

        if (v7 == ++v8) {
          return 0LL;
        }
      }

      return 1LL;
    }
  }

  return result;
}

uint64_t WiFiNetworkIsProblematicForEncryptedDNS(const void *a1)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  unint64_t v2 = 0LL;
  __int128 v3 = &byte_1865BCEF0;
  int v4 = (os_log_s *)MEMORY[0x1895F8DA0];
  do
  {
    char v5 = WiFiNetworkCopyBSSIDData((uint64_t)a1);
    if (v5)
    {
      BOOL v6 = v5;
      memset(buffer, 170, 6);
      v18.location = 0LL;
      v18.length = 6LL;
      CFDataGetBytes(v5, v18, buffer);
      if (buffer[0] == *(v3 - 2)
        && buffer[1] == *(v3 - 1)
        && buffer[2] == *v3)
      {
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          SSID = WiFiNetworkGetSSID(a1);
          *(_DWORD *)buf = 136315650;
          unsigned int v12 = "WiFiNetworkIsProblematicForEncryptedDNS";
          __int16 v13 = 2112;
          unsigned int v14 = SSID;
          __int16 v15 = 2112;
          unsigned int v16 = v6;
          _os_log_impl( &dword_18658B000,  v4,  OS_LOG_TYPE_DEFAULT,  "%s: network %@ (%@) is known to be problematic for DoT/DoH",  buf,  0x20u);
        }

        uint64_t v8 = 1LL;
      }

      else
      {
        uint64_t v8 = 0LL;
      }

      CFRelease(v6);
    }

    else
    {
      uint64_t v8 = 0LL;
    }

    if (v2 > 1) {
      break;
    }
    ++v2;
    v3 += 3;
  }

  while (!(_DWORD)v8);
  return v8;
}

void WiFiNetworkAddSIMIdentifier(uint64_t a1, const void *a2)
{
  if (a1 && a2)
  {
    unint64_t Property = (const __CFArray *)WiFiNetworkGetProperty(a1, @"SIMIdentifiers");
    char v5 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    if (Property) {
      MutableCFDictionaryRef Copy = CFArrayCreateMutableCopy(v5, 0LL, Property);
    }
    else {
      MutableCFDictionaryRef Copy = CFArrayCreateMutable(v5, 0LL, MEMORY[0x189605228]);
    }
    CFIndex v7 = MutableCopy;
    v8.length = CFArrayGetCount(MutableCopy);
    v8.location = 0LL;
    if (CFArrayGetFirstIndexOfValue(v7, v8, a2) == -1) {
      CFArrayAppendValue(v7, a2);
    }
    WiFiNetworkSetProperty(a1, @"SIMIdentifiers", v7);
    if (v7) {
      CFRelease(v7);
    }
  }

  else
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
  }

void WiFiNetworkRemoveSIMIdentifier(uint64_t a1, const void *a2)
{
  if (a1 && a2)
  {
    unint64_t Property = (const __CFArray *)WiFiNetworkGetProperty(a1, @"SIMIdentifiers");
    char v5 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    if (Property) {
      MutableCFDictionaryRef Copy = CFArrayCreateMutableCopy(v5, 0LL, Property);
    }
    else {
      MutableCFDictionaryRef Copy = CFArrayCreateMutable(v5, 0LL, MEMORY[0x189605228]);
    }
    CFIndex v7 = MutableCopy;
    v10.length = CFArrayGetCount(MutableCopy);
    v10.location = 0LL;
    FirstIndexOfint Value = CFArrayGetFirstIndexOfValue(v7, v10, a2);
    if (FirstIndexOfValue != -1) {
      CFArrayRemoveValueAtIndex(v7, FirstIndexOfValue);
    }
    if (CFArrayGetCount(v7)) {
      int v9 = v7;
    }
    else {
      int v9 = 0LL;
    }
    WiFiNetworkSetProperty(a1, @"SIMIdentifiers", v9);
    if (v7) {
      CFRelease(v7);
    }
  }

  else
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
  }

void WiFiNetworkSetUserPreferredNetwork(uint64_t a1, CFDictionaryRef *a2, const void *a3)
{
  if (a1 && a2)
  {
    if (CFDictionaryGetValue(a2[2], @"DomainName"))
    {
      HS20DomainName = WiFiNetworkGetHS20DomainName((uint64_t)a2);
      if (HS20DomainName)
      {
        CFIndex v7 = HS20DomainName;
        unint64_t Property = (const __CFDictionary *)WiFiNetworkGetProperty(a1, @"userPreferredPasspointDomains");
        int v9 = (const __CFAllocator *)*MEMORY[0x189604DB0];
        CFRange v10 = Property
            ? CFDictionaryCreateMutableCopy(v9, 0LL, Property)
            : CFDictionaryCreateMutable(v9, 0LL, MEMORY[0x189605240], MEMORY[0x189605250]);
        unsigned int v16 = v10;
        if (v10)
        {
          if (a3) {
            CFDictionaryAddValue(v10, v7, a3);
          }
          else {
            CFDictionaryRemoveValue(v10, v7);
          }
          CFIndex Count = CFDictionaryGetCount(v16);
          CFRange v18 = @"userPreferredPasspointDomains";
          if (Count)
          {
LABEL_16:
            uint64_t v19 = a1;
            int8x8_t v20 = v16;
LABEL_25:
            WiFiNetworkSetProperty(v19, v18, v20);
            CFRelease(v16);
            return;
          }

const void *WiFiNetworkGetUserPreferredTimestamp(uint64_t a1, CFDictionaryRef *a2)
{
  if (!a1 || !a2) {
    return 0LL;
  }
  if (CFDictionaryGetValue(a2[2], @"DomainName"))
  {
    HS20DomainName = WiFiNetworkGetHS20DomainName((uint64_t)a2);
    if (!HS20DomainName) {
      return 0LL;
    }
    char v5 = HS20DomainName;
    BOOL v6 = @"userPreferredPasspointDomains";
  }

  else
  {
    SSID = WiFiNetworkGetSSID(a2);
    if (!SSID) {
      return 0LL;
    }
    char v5 = SSID;
    BOOL v6 = @"userPreferredNetworkNames";
  }

  unint64_t Property = (const __CFDictionary *)WiFiNetworkGetProperty(a1, v6);
  if (Property) {
    return CFDictionaryGetValue(Property, v5);
  }
  return 0LL;
}

void WiFiNetworkSetPrivacyProxyEnabled(uint64_t a1, int a2)
{
  if (a1)
  {
    unint64_t v2 = (const void **)MEMORY[0x189604DE8];
    if (!a2) {
      unint64_t v2 = (const void **)MEMORY[0x189604DE0];
    }
    WiFiNetworkSetProperty(a1, @"PrivacyProxyEnabled", *v2);
  }

  else
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
  }

void WiFiNetworkSetPrivacyProxyBlockedReason(uint64_t a1, const void *a2)
{
  if (a1) {
    WiFiNetworkSetProperty(a1, @"PrivacyProxyBlockedReason", a2);
  }
  else {
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
  }
}

BOOL WiFiNetworkIsPriorityNetwork(uint64_t a1)
{
  unint64_t v2 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  int v4 = CFDateCreate(v2, Current);
  unint64_t Property = (const __CFDate *)WiFiNetworkGetProperty(a1, @"lastJoined");
  double TimeIntervalSinceDate = CFDateGetTimeIntervalSinceDate(v4, Property);
  if (WiFiNetworkGetNetworkOfInterestWorkType(a1) == 1
    || WiFiNetworkGetNetworkOfInterestHomeType(a1) == 1
    || (!MEMORY[0x18960D5A8]
     || CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), (const void *)*MEMORY[0x18960D690]) != (const void *)*MEMORY[0x189604DE8])
    && !WiFiNetworkGetProperty(a1, @"WiFiNetworkAttributeIsPublic")
    && !WiFiNetworkIsCarrierBundleBased(a1))
  {
    BOOL v7 = 1LL;
    if (!v4) {
      return v7;
    }
LABEL_4:
    CFRelease(v4);
    return v7;
  }

  BOOL v7 = TimeIntervalSinceDate < 86400.0 && TimeIntervalSinceDate > -1.0;
  if (v4) {
    goto LABEL_4;
  }
  return v7;
}

BOOL WiFiNetworkIsPriorityNetworkWrapper(uint64_t a1)
{
  return !_os_feature_enabled_impl() || WiFiNetworkIsPriorityNetwork(a1);
}

uint64_t WiFiNetworkIsPublicNetwork(CFDictionaryRef *a1)
{
  uint64_t result = (uint64_t)WiFiNetworkInterworkingIsOutdoorNetwork(a1);
  if ((_DWORD)result) {
    return 1LL;
  }
  return result;
}

BOOL WiFiNetworkIsLowQualityNetwork(uint64_t a1)
{
  return WiFiNetworkGetProperty(a1, @"WiFiNetworkAttributeIsLowQuality") != 0LL;
}

void WiFiNetworkSetPublicAirPlayNetwork(uint64_t a1, int a2)
{
  if (a1)
  {
    unint64_t v2 = (const void **)MEMORY[0x189604DE8];
    if (!a2) {
      unint64_t v2 = (const void **)MEMORY[0x189604DE0];
    }
    WiFiNetworkSetProperty(a1, @"PublicAirPlayNetwork", *v2);
  }

  else
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
  }

void *WiFiNetworkIs6EModeOff(uint64_t a1)
{
  if (a1)
  {
    uint64_t result = (void *)WiFiNetworkGetProperty(a1, (void *)*MEMORY[0x18960F000]);
    if (result) {
      return (void *)(objc_msgSend((id)objc_msgSend(result, "objectForKey:", *MEMORY[0x18960F010]), "integerValue") == 2);
    }
  }

  else
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
    return 0LL;
  }

  return result;
}

void WiFiNetworkSetDisplayFriendlyName(uint64_t a1, const void *a2)
{
  if (a1) {
    WiFiNetworkSetProperty(a1, @"DisplayFriendlyName", a2);
  }
  else {
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
  }
}

const void *WiFiNetworkGetDisplayFriendlyName(uint64_t a1)
{
  if (a1) {
    return WiFiNetworkGetProperty(a1, @"DisplayFriendlyName");
  }
  objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
  return 0LL;
}

void WiFiNetworkSetAccessoryIdentifier(uint64_t a1, const void *a2)
{
  if (a1) {
    WiFiNetworkSetProperty(a1, @"AccessoryIdentifier", a2);
  }
  else {
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
  }
}

const void *WiFiNetworkGetAccessoryIdentifier(uint64_t a1)
{
  if (a1) {
    return WiFiNetworkGetProperty(a1, @"AccessoryIdentifier");
  }
  objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
  return 0LL;
}

BOOL WiFiNetworkSupportsSlowWiFiRecovery(uint64_t a1)
{
  return WiFiNetworkGetAccessoryIdentifier(a1) == 0LL;
}

BOOL WiFiNetworkSupportsDPSRecovery(uint64_t a1)
{
  return WiFiNetworkGetAccessoryIdentifier(a1) == 0LL;
}

void __WiFiNetworkRelease(void *a1)
{
  if (a1)
  {
    CFTypeID v2 = CFGetTypeID(a1);
    uint64_t v3 = __kWiFiNetworkTypeID;
    if (!__kWiFiNetworkTypeID)
    {
      pthread_once(&__wifiNetworkTypeInit, (void (*)(void))__WiFiNetworkRegister);
      uint64_t v3 = __kWiFiNetworkTypeID;
    }

    if (v2 == v3)
    {
      int v4 = (const void *)a1[2];
      if (v4)
      {
        CFRelease(v4);
        a1[2] = 0LL;
      }
    }
  }

BOOL __WiFiNetworkEqual(void *a1, void *a2)
{
  uint64_t v2 = 0LL;
  if (a1)
  {
    uint64_t v3 = a2;
    if (a2)
    {
      int v4 = a1;
      CFTypeID v5 = CFGetTypeID(a1);
      uint64_t v6 = __kWiFiNetworkTypeID;
      if (!__kWiFiNetworkTypeID)
      {
        pthread_once(&__wifiNetworkTypeInit, (void (*)(void))__WiFiNetworkRegister);
        uint64_t v6 = __kWiFiNetworkTypeID;
      }

      if (v5 == v6) {
        BOOL v7 = v4;
      }
      else {
        BOOL v7 = 0LL;
      }
      CFTypeID v8 = CFGetTypeID(v3);
      uint64_t v9 = __kWiFiNetworkTypeID;
      if (!__kWiFiNetworkTypeID)
      {
        pthread_once(&__wifiNetworkTypeInit, (void (*)(void))__WiFiNetworkRegister);
        uint64_t v9 = __kWiFiNetworkTypeID;
      }

      if (v8 == v9) {
        CFRange v10 = v3;
      }
      else {
        CFRange v10 = 0LL;
      }
      CFTypeID TypeID = CFDictionaryGetTypeID();
      if (TypeID != CFGetTypeID(v4))
      {
        uint64_t v12 = __kWiFiNetworkTypeID;
        if (!__kWiFiNetworkTypeID)
        {
          pthread_once(&__wifiNetworkTypeInit, (void (*)(void))__WiFiNetworkRegister);
          uint64_t v12 = __kWiFiNetworkTypeID;
        }

        if (v12 == CFGetTypeID(v4)) {
          int v4 = (void *)v4[2];
        }
        else {
          int v4 = 0LL;
        }
      }

      CFTypeID v13 = CFDictionaryGetTypeID();
      if (v13 != CFGetTypeID(v3))
      {
        uint64_t v14 = __kWiFiNetworkTypeID;
        if (!__kWiFiNetworkTypeID)
        {
          pthread_once(&__wifiNetworkTypeInit, (void (*)(void))__WiFiNetworkRegister);
          uint64_t v14 = __kWiFiNetworkTypeID;
        }

        if (v14 != CFGetTypeID(v3)) {
          return 0LL;
        }
        uint64_t v3 = (void *)v3[2];
      }

      uint64_t v2 = 0LL;
      if (v4)
      {
        if (v3)
        {
          if (__WiFiCompareSSIDorBSSID(v4, (const __CFDictionary *)v3))
          {
            if (WiFiNetworkIsHotspot20((BOOL)v7) && !WiFiNetworkIsHotspot20((BOOL)v10)
              || !WiFiNetworkIsHotspot20((BOOL)v7) && WiFiNetworkIsHotspot20((BOOL)v10))
            {
              objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
              return 0LL;
            }

            if (!__WiFiCompareBGScanParams((const __CFDictionary *)v4, (const __CFDictionary *)v3)
              || !__WiFiCompareDictionaryValues(v4, (const __CFDictionary *)v3, @"AP_MODE"))
            {
              return 0LL;
            }

            int AuthFlags = __WiFiNetworkGetAuthFlags((const __CFDictionary *)v4);
            int v42 = __WiFiNetworkGetAuthFlags((const __CFDictionary *)v3);
            int v15 = __WiFiNetworkIsSAE((const __CFDictionary *)v4)
            int v24 = __WiFiNetworkIsSAE((const __CFDictionary *)v3)
            unsigned int v44 = __WiFiNetworkIsOWEOnly((const __CFDictionary *)v4);
            unsigned int v45 = __WiFiNetworkIsOWEOnly((const __CFDictionary *)v3);
            unint64_t Value = (unint64_t)CFDictionaryGetValue((CFDictionaryRef)v4, @"ALLOW_WPA2_PSK");
            unint64_t v26 = (unint64_t)CFDictionaryGetValue((CFDictionaryRef)v3, @"ALLOW_WPA2_PSK");
            unint64_t v27 = (unint64_t)CFDictionaryGetValue((CFDictionaryRef)v4, @"ALLOW_OWE_TSN");
            unint64_t v28 = (unint64_t)CFDictionaryGetValue((CFDictionaryRef)v3, @"ALLOW_OWE_TSN");
            int v29 = (Value | v27) == 0;
            int v30 = (v26 | v28) == 0;
            if (v29 != v30)
            {
              unint64_t v31 = v28;
              if (v15) {
                BOOL v32 = WiFiNetworkGetOperatingBand((uint64_t)v7) != 3;
              }
              else {
                BOOL v32 = 0;
              }
              if ((v24 & 1) != 0)
              {
                BOOL v41 = v32;
                int OperatingBand = WiFiNetworkGetOperatingBand((uint64_t)v10);
                BOOL v20 = Value == *MEMORY[0x189604DE8];
                unsigned int v34 = (const void *)*MEMORY[0x189604DE8];
                if (v20)
                {
                  BOOL v32 = v41;
                  if (OperatingBand != 3) {
                    return 0LL;
                  }
                }

                else
                {
                  BOOL v32 = v41;
                }
              }

              else
              {
                unsigned int v34 = (const void *)*MEMORY[0x189604DE8];
              }

              if ((v29 & v15) == 1)
              {
                int v35 = WiFiNetworkGetOperatingBand((uint64_t)v7);
                int v36 = AuthFlags;
                if (v35 == 3) {
                  int v36 = AuthFlags | 2;
                }
                int AuthFlags = v36;
              }

              if ((v30 & v24) == 1)
              {
                int v37 = WiFiNetworkGetOperatingBand((uint64_t)v10);
                int v38 = v42;
                if (v37 == 3) {
                  int v38 = v42 | 2;
                }
                int v42 = v38;
              }

              BOOL v39 = v44 && WiFiNetworkGetOperatingBand((uint64_t)v7) != 3;
              if (v45)
              {
                int v40 = WiFiNetworkGetOperatingBand((uint64_t)v10);
              }

LABEL_59:
              if (!AuthFlags || !v42 || (v42 & AuthFlags) != 0) {
                return (AuthFlags == 0) ^ (v42 != 0);
              }
              return 0LL;
            }

            uint64_t v2 = 0LL;
            if (v15 == v24 && v44 == v45) {
              goto LABEL_59;
            }
          }

          else
          {
            unint64_t Property = (const __CFNumber *)WiFiNetworkGetProperty((uint64_t)v7, @"networkRole");
            Intunint64_t Value = _CFTypeGetIntValue(Property);
            CFRange v18 = (const __CFNumber *)WiFiNetworkGetProperty((uint64_t)v10, @"networkRole");
            unsigned int v19 = _CFTypeGetIntValue(v18);
            BOOL v20 = (IntValue & 0xFFFFFFFE) == 2 || IntValue == 4;
            if (v20 || v19 - 2 <= 2)
            {
              return IntValue == v19;
            }

            else
            {
              uint64_t v2 = 1LL;
              if (!__WiFiIsSameHS20Account(v7, v10, 1))
              {
                SSID = (const __CFString *)WiFiNetworkGetSSID(v7);
                if (CFStringGetLength(SSID)) {
                  return 0LL;
                }
                int8x8_t v22 = (const __CFString *)WiFiNetworkGetSSID(v10);
                if (CFStringGetLength(v22)) {
                  return 0LL;
                }
                return __WiFiHS20NetworksHaveSameDomain((uint64_t)v7, (uint64_t)v10) != 0;
              }
            }
          }
        }
      }
    }
  }

  return v2;
}

CFHashCode __WiFiNetworkHash(const void *a1)
{
  if (a1 && (SSID = WiFiNetworkGetSSID(a1)) != 0LL) {
    return CFHash(SSID);
  }
  else {
    return 0LL;
  }
}

CFStringRef __WiFiNetworkCopyDesc(const __CFDictionary **cf)
{
  valuePtr[0] = 0;
  if (!cf) {
    return @"Invalid network ref";
  }
  uint64_t v2 = __kWiFiNetworkTypeID;
  if (!__kWiFiNetworkTypeID)
  {
    pthread_once(&__wifiNetworkTypeInit, (void (*)(void))__WiFiNetworkRegister);
    uint64_t v2 = __kWiFiNetworkTypeID;
  }

  if (v2 != CFGetTypeID(cf)) {
    return @"Invalid network ref";
  }
  Channel = (const __CFNumber *)WiFiNetworkGetChannel((uint64_t)cf, v3);
  if (Channel) {
    CFNumberGetValue(Channel, kCFNumberSInt32Type, valuePtr);
  }
  unint64_t v31 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  SSID = WiFiNetworkGetSSID(cf);
  unsigned int DirectedState = WiFiNetworkGetDirectedState(cf);
  BOOL IsEAP = WiFiNetworkIsEAP((uint64_t)cf);
  unsigned int v27 = __WiFiNetworkIsSAE(cf[2]);
  BOOL v26 = WiFiNetworkIsWPAWPA2PSK((uint64_t)cf) != 0;
  BOOL v25 = CFDictionaryGetValue(cf[2], @"WEP") == (const void *)*MEMORY[0x189604DE8];
  WAPIPolicy = __WiFiNetworkGetWAPIPolicy(cf[2]);
  uint64_t Type = WiFiNetworkGetType((uint64_t)cf);
  unint64_t Property = WiFiNetworkGetProperty((uint64_t)cf, @"enabled");
  CFIndex v21 = WiFiNetworkGetProperty((uint64_t)cf, @"SaveDataMode");
  BOOL v20 = WiFiNetworkGetProperty((uint64_t)cf, @"NetworkQualityResponsiveness");
  CFTypeID v5 = WiFiNetworkGetProperty((uint64_t)cf, @"NetworkQualityDate");
  NetworkOfInterestHomeuint64_t Type = WiFiNetworkGetNetworkOfInterestHomeType((uint64_t)cf);
  BOOL v7 = @"Unknown";
  if (NetworkOfInterestHomeType == 1) {
    BOOL v7 = @"Home";
  }
  if (NetworkOfInterestHomeType == 2) {
    CFTypeID v8 = @"Not Home";
  }
  else {
    CFTypeID v8 = v7;
  }
  unsigned int ForcedHomeFix = WiFiNetworkGetForcedHomeFix((uint64_t)cf);
  CFRange v10 = WiFiNetworkGetProperty((uint64_t)cf, @"TransitionDisabledFlags");
  unsigned int v11 = WiFiNetworkFoundNanIe((uint64_t)cf);
  unsigned int IsApplePersonalHotspot = WiFiNetworkIsApplePersonalHotspot((uint64_t)cf);
  IsPublicAirPlayNetworuint64_t k = WiFiNetworkIsPublicAirPlayNetwork((uint64_t)cf);
  unsigned int v14 = WiFiNetworkIs6EModeOff((uint64_t)cf);
  BOOL IsHotspot20 = WiFiNetworkIsHotspot20((BOOL)cf);
  unsigned int v16 = cf[2];
  uint64_t v17 = valuePtr[0];
  int v18 = CFDictionaryContainsKey(v16, @"BundleIdentifier");
  return CFStringCreateWithFormat( v31,  0LL,  @"%@: isHidden=%d, isEAP=%d, isSAE=%d, isWPA=%d, isWEP=%d, WAPI=%d, type=%d, enabled=%@, saveData=%@, responsiveness=%@ (%@) isHome=%@, isForceFixed=%d, transitionDisabledFlags=%@, foundNanIe=%d, isPH=%d, isPublicAirPlayNetwork=%d, is6EDisabled=%d, hs20=%d, Channel=%d, isBundleIdentifierPresent=%d",  SSID,  DirectedState,  IsEAP,  v27,  v26,  v25,  WAPIPolicy,  Type,  Property,  v21,  v20,  v5,  v8,  ForcedHomeFix,  v10,  v11,  IsApplePersonalHotspot,  IsPublicAirPlayNetwork,  v14,  IsHotspot20,  v17,  v18 != 0);
}

uint64_t __WiFiIsSameHS20Account(const void *a1, const void *a2, int a3)
{
  uint64_t v3 = 0LL;
  if (a1 && a2)
  {
    if (WiFiNetworkIsHotspot20((BOOL)a1) && WiFiNetworkIsHotspot20((BOOL)a2))
    {
      SSID = (const __CFString *)WiFiNetworkGetSSID(a1);
      CFTypeID v8 = (const __CFString *)WiFiNetworkGetSSID(a2);
      unint64_t Property = (const __CFString *)WiFiNetworkGetProperty((uint64_t)a1, @"HS20AccountName");
      CFRange v10 = (const __CFString *)WiFiNetworkGetProperty((uint64_t)a2, @"HS20AccountName");
      HS20DomainName = (const __CFString *)WiFiNetworkGetHS20DomainName((uint64_t)a1);
      uint64_t v12 = (const __CFString *)WiFiNetworkGetHS20DomainName((uint64_t)a2);
      objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
      if (SSID && v10 && CFStringCompare(SSID, v10, 0LL) == kCFCompareEqualTo
        || v8 && Property && CFStringCompare(v8, Property, 0LL) == kCFCompareEqualTo)
      {
        return 1LL;
      }

      if (Property && v10 && HS20DomainName && v12 && CFStringCompare(HS20DomainName, v12, 0LL) == kCFCompareEqualTo) {
        goto LABEL_19;
      }
      if (!a3)
      {
        uint64_t v3 = 0LL;
        goto LABEL_23;
      }

      if (WiFiNetworkIsScannedNetworkMatchingHS20Account((uint64_t)a1, (uint64_t)a2)
        || WiFiNetworkIsScannedNetworkMatchingHS20Account((uint64_t)a2, (uint64_t)a1))
      {
LABEL_19:
        uint64_t v3 = 1LL;
LABEL_23:
        objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
        return v3;
      }
    }

    return 0LL;
  }

  return v3;
}

uint64_t __WiFiCompareBGScanParams(const __CFDictionary *a1, const __CFDictionary *a2)
{
  if (CFDictionaryGetValue(a1, @"forceBGScanParamsCompare") != (const void *)*MEMORY[0x189604DE8])
  {
    int v4 = (const void *)*MEMORY[0x189604DE8];
    if (CFDictionaryGetValue(a2, @"forceBGScanParamsCompare") != v4) {
      return 1LL;
    }
  }

  uint64_t result = __WiFiCompareDictionaryValues(a1, a2, @"BSSID");
  if ((_DWORD)result)
  {
    uint64_t result = __WiFiCompareDictionaryValues(a1, a2, @"ENTRY_NETWORK");
    if ((_DWORD)result) {
      return __WiFiCompareDictionaryValues(a1, a2, @"EXIT_NETWORK");
    }
  }

  return result;
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

Class __getCWFNetworkProfileClass_block_invoke(uint64_t a1)
{
  Class result = objc_getClass("CWFNetworkProfile");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL)) {
    __getCWFNetworkProfileClass_block_invoke_cold_1();
  }
  getCWFNetworkProfileClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
  return result;
}

uint64_t CoreWiFiLibrary()
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  uint64_t v1 = 0LL;
  if (!CoreWiFiLibraryCore_frameworkLibrary)
  {
    __int128 v2 = xmmword_189E8BA78;
    uint64_t v3 = 0LL;
    CoreWiFiLibraryCore_frameworkLibrary = _sl_dlopen();
  }

  if (!CoreWiFiLibraryCore_frameworkLibrary) {
    CoreWiFiLibrary_cold_1(&v1);
  }
  return CoreWiFiLibraryCore_frameworkLibrary;
}

Class __getCWFBSSClass_block_invoke(uint64_t a1)
{
  Class result = objc_getClass("CWFBSS");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL)) {
    __getCWFBSSClass_block_invoke_cold_1();
  }
  getCWFBSSClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
  return result;
}

Class __getCWFChannelClass_block_invoke(uint64_t a1)
{
  Class result = objc_getClass("CWFChannel");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL)) {
    __getCWFChannelClass_block_invoke_cold_1();
  }
  getCWFChannelClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
  return result;
}

Class __getCLLocationClass_block_invoke(uint64_t a1)
{
  Class result = objc_getClass("CLLocation");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL)) {
    __getCLLocationClass_block_invoke_cold_1();
  }
  getCLLocationClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
  return result;
}

uint64_t CoreLocationLibrary()
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  uint64_t v1 = 0LL;
  if (!CoreLocationLibraryCore_frameworkLibrary)
  {
    __int128 v2 = xmmword_189E8BA90;
    uint64_t v3 = 0LL;
    CoreLocationLibraryCore_frameworkLibrary = _sl_dlopen();
  }

  if (!CoreLocationLibraryCore_frameworkLibrary) {
    CoreLocationLibrary_cold_1(&v1);
  }
  return CoreLocationLibraryCore_frameworkLibrary;
}

Class __getCWFScanResultClass_block_invoke(uint64_t a1)
{
  Class result = objc_getClass("CWFScanResult");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL)) {
    __getCWFScanResultClass_block_invoke_cold_1();
  }
  getCWFScanResultClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
  return result;
}

uint64_t WiFiSecurityCopyPasswordWithTimeout(const void *a1, BOOL *a2, double a3)
{
  uint64_t v18 = 0LL;
  unsigned int v19 = &v18;
  uint64_t v20 = 0x2020000000LL;
  uint64_t v21 = 0LL;
  if (a1)
  {
    if (MKBGetDeviceLockState() == 1 && !MKBUserUnlockedSinceBoot())
    {
      objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
    }

    else
    {
      uint64_t v6 = dispatch_semaphore_create(0LL);
      uint64_t v14 = 0LL;
      int v15 = &v14;
      uint64_t v16 = 0x2020000000LL;
      char v17 = 0;
      CFRetain(a1);
      dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
      v13[0] = MEMORY[0x1895F87A8];
      v13[1] = 3221225472LL;
      v13[2] = __WiFiSecurityCopyPasswordWithTimeout_block_invoke;
      v13[3] = &unk_189E8BAB0;
      v13[6] = &v14;
      v13[7] = a1;
      v13[4] = v6;
      v13[5] = &v18;
      dispatch_async(global_queue, v13);
      dispatch_time_t v8 = dispatch_time(0LL, (uint64_t)(a3 * 1000000000.0));
      BOOL v9 = dispatch_semaphore_wait(v6, v8) != 0;
      CFRange v10 = v15;
      *((_BYTE *)v15 + 24) = v9;
      *a2 = v9;
      if (*((_BYTE *)v10 + 24)) {
        objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
      }
      dispatch_release(v6);
      _Block_object_dispose(&v14, 8);
    }
  }

  uint64_t v11 = v19[3];
  _Block_object_dispose(&v18, 8);
  return v11;
}

void sub_1865A8568( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t __WiFiSecurityCopyPasswordWithTimeout_block_invoke(uint64_t a1)
{
  CFTypeRef result = 0LL;
  Query = __WiFiSecurityCreateQuery(*(const void **)(a1 + 56), 0LL, 0LL, 0, 0, 1);
  uint64_t v3 = Query;
  if (!Query || (!SecItemCopyMatching(Query, &result) ? (BOOL v4 = result == 0LL) : (BOOL v4 = 1), v4)) {
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
  }
  else {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = CFStringCreateFromExternalRepresentation( (CFAllocatorRef)*MEMORY[0x189604DB0],  (CFDataRef)result,  0x8000100u);
  }
  if (result)
  {
    CFRelease(result);
    CFTypeRef result = 0LL;
  }

  if (v3) {
    CFRelease(v3);
  }
  if (*(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL))
  {
    CFTypeID v5 = *(const void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
    if (v5)
    {
      CFRelease(v5);
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0LL;
    }
  }

  CFRelease(*(CFTypeRef *)(a1 + 56));
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

__CFDictionary *__WiFiSecurityCreateQuery( const void *a1, const void *a2, const void *a3, int a4, int a5, int a6)
{
  if (a1)
  {
    CFMutableDataRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, 0LL, 0LL);
    CFTypeID v13 = Mutable;
    if (Mutable)
    {
      CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x18960BB38], (const void *)*MEMORY[0x18960BB48]);
      CFDictionarySetValue(v13, (const void *)*MEMORY[0x18960B870], a1);
      CFDictionarySetValue(v13, (const void *)*MEMORY[0x18960BA88], @"AirPort");
      CFDictionarySetValue(v13, (const void *)*MEMORY[0x18960BAA8], (const void *)*MEMORY[0x18960BAB0]);
      if (a2) {
        CFDictionarySetValue(v13, (const void *)*MEMORY[0x18960B9F8], a2);
      }
      if (a3) {
        CFDictionarySetValue(v13, (const void *)*MEMORY[0x18960B918], a3);
      }
      uint64_t v14 = (const void **)MEMORY[0x189604DE8];
      if (a6) {
        CFDictionarySetValue(v13, (const void *)*MEMORY[0x18960BE70], (const void *)*MEMORY[0x189604DE8]);
      }
      if (!a4) {
        CFDictionarySetValue(v13, (const void *)*MEMORY[0x18960BE20], *v14);
      }
      if (a5) {
        CFDictionarySetValue(v13, (const void *)*MEMORY[0x18960BE18], *v14);
      }
    }

    else
    {
      objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
    }
  }

  else
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
    return 0LL;
  }

  return v13;
}

CFStringRef WiFiSecurityCopyPassword(__CFString *a1)
{
  CFStringRef result = __WiFiSecurityCopyPassword(a1, 1);
  if (!result)
  {
    uint64_t v3 = getprogname();
    if (!strncmp("sharingd", v3, 8uLL)) {
      return WiFiSecurityCopyPasswordFromPasswordBackup(a1);
    }
    BOOL v4 = getprogname();
    if (!strncmp("HPSetup", v4, 7uLL)) {
      return WiFiSecurityCopyPasswordFromPasswordBackup(a1);
    }
    CFTypeID v5 = getprogname();
    if (!strncmp("HDSViewService", v5, 0xEuLL)) {
      return WiFiSecurityCopyPasswordFromPasswordBackup(a1);
    }
    else {
      return 0LL;
    }
  }

  return result;
}

CFStringRef __WiFiSecurityCopyPassword(const __CFString *a1, int a2)
{
  CFStringRef v2 = a1;
  if (a1)
  {
    if (MKBGetDeviceLockState() == 1 && !MKBUserUnlockedSinceBoot())
    {
      objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
      return 0LL;
    }

    else
    {
      Query = __WiFiSecurityCreateQuery(v2, 0LL, 0LL, 0, 0, a2);
      CFTypeID v5 = Query;
      CFTypeRef result = 0LL;
      if (Query && !SecItemCopyMatching(Query, &result) && result)
      {
        CFStringRef v2 = CFStringCreateFromExternalRepresentation( (CFAllocatorRef)*MEMORY[0x189604DB0],  (CFDataRef)result,  0x8000100u);
      }

      else
      {
        objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
        CFStringRef v2 = 0LL;
      }

      if (result)
      {
        CFRelease(result);
        CFTypeRef result = 0LL;
      }

      if (v5) {
        CFRelease(v5);
      }
    }
  }

  return v2;
}

CFStringRef WiFiSecurityCopyPasswordFromPasswordBackup(void *a1)
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  CFStringRef v2 = (void *)MEMORY[0x186E3BB0C]();
  CFTypeRef result = 0LL;
  if (a1)
  {
    if ([a1 length])
    {
      uint64_t v3 = WiFiSecurityCopySSIDHashForPasswordBackup(a1);
      BOOL v4 = v3;
      if (v3 && [v3 length])
      {
        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          uint64_t v16 = "WiFiSecurityCopyPasswordFromPasswordBackup";
          __int16 v17 = 2112;
          uint64_t v18 = a1;
          __int16 v19 = 2112;
          uint64_t v20 = v4;
          _os_log_impl(&dword_18658B000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "%s: ssid %@ (%@)", buf, 0x20u);
        }

        CFTypeID v5 = (void *)[MEMORY[0x189603FC8] dictionary];
        [v5 setObject:*MEMORY[0x18960BB48] forKey:*MEMORY[0x18960BB38]];
        [v5 setObject:v4 forKey:*MEMORY[0x18960B870]];
        [v5 setObject:@"AirPort" forKey:*MEMORY[0x18960BA88]];
        [v5 setObject:MEMORY[0x189604A88] forKey:*MEMORY[0x18960BE20]];
        OSStatus v6 = SecItemCopyMatching((CFDictionaryRef)v5, &result);
        if (!v6 && result)
        {
          CFStringRef v7 = CFStringCreateFromExternalRepresentation( (CFAllocatorRef)*MEMORY[0x189604DB0],  (CFDataRef)result,  0x8000100u);
          goto LABEL_14;
        }

        if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_13;
        }
        *(_DWORD *)buf = 136315650;
        uint64_t v16 = "WiFiSecurityCopyPasswordFromPasswordBackup";
        __int16 v17 = 2112;
        uint64_t v18 = v4;
        __int16 v19 = 1024;
        LODWORD(v20) = v6;
        dispatch_time_t v8 = (os_log_s *)MEMORY[0x1895F8DA0];
        uint64_t v9 = "%s:[%@] error result %d \n";
        uint32_t v10 = 28;
      }

      else
      {
        if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_13;
        }
        *(_DWORD *)buf = 136315138;
        uint64_t v16 = "WiFiSecurityCopyPasswordFromPasswordBackup";
        dispatch_time_t v8 = (os_log_s *)MEMORY[0x1895F8DA0];
        uint64_t v9 = "%s: error: empty ssid hash";
        uint32_t v10 = 12;
      }

      _os_log_impl(&dword_18658B000, v8, OS_LOG_TYPE_DEFAULT, v9, buf, v10);
LABEL_13:
      CFStringRef v7 = 0LL;
      goto LABEL_14;
    }

    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v16 = "WiFiSecurityCopyPasswordFromPasswordBackup";
      uint64_t v12 = (os_log_s *)MEMORY[0x1895F8DA0];
      CFTypeID v13 = "%s: error: empty ssid";
      goto LABEL_23;
    }
  }

  else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v16 = "WiFiSecurityCopyPasswordFromPasswordBackup";
    uint64_t v12 = (os_log_s *)MEMORY[0x1895F8DA0];
    CFTypeID v13 = "%s: null ssid";
LABEL_23:
    _os_log_impl(&dword_18658B000, v12, OS_LOG_TYPE_DEFAULT, v13, buf, 0xCu);
  }

  CFStringRef v7 = 0LL;
  BOOL v4 = 0LL;
LABEL_14:

  if (result) {
    CFRelease(result);
  }
  objc_autoreleasePoolPop(v2);
  return v7;
}

CFStringRef WiFiSecurityCopyLegacyPassword(const __CFString *a1)
{
  return __WiFiSecurityCopyPassword(a1, 0);
}

CFTypeRef WiFiSecurityCopyPasswordModificationDate(const void *a1)
{
  CFTypeRef result = 0LL;
  if (a1)
  {
    if (MKBGetDeviceLockState() == 1 && !MKBUserUnlockedSinceBoot())
    {
      objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
      CFTypeRef v5 = 0LL;
      uint64_t v3 = 0LL;
    }

    else
    {
      Query = __WiFiSecurityCreateQuery(a1, 0LL, 0LL, 0, 1, 1);
      uint64_t v3 = Query;
      if (Query && !SecItemCopyMatching(Query, &result) && result)
      {
        unint64_t Value = CFDictionaryGetValue((CFDictionaryRef)result, (const void *)*MEMORY[0x18960BA00]);
        CFTypeRef v5 = CFRetain(Value);
      }

      else
      {
        objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
        CFTypeRef v5 = 0LL;
      }
    }

    if (result)
    {
      CFRelease(result);
      CFTypeRef result = 0LL;
    }

    if (v3) {
      CFRelease(v3);
    }
  }

  else
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
    return 0LL;
  }

  return v5;
}

BOOL WiFiSecuritySetPasswordWithTimeout(const void *a1, const __CFString *a2, BOOL *a3, double a4)
{
  BOOL v22 = 0;
  objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
  if (!a1 || !a2 || !CFStringGetLength(a2))
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
    return 0LL;
  }

  dispatch_time_t v8 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  CFDataRef ExternalRepresentation = CFStringCreateExternalRepresentation((CFAllocatorRef)*MEMORY[0x189604DB0], a2, 0x8000100u, 0);
  uint32_t v10 = (const __CFString *)WiFiSecurityCopyPasswordWithTimeout(a1, &v22, a4);
  uint64_t v11 = v10;
  BOOL v12 = v22;
  if (v22)
  {
    *a3 = 1;
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
    BOOL v13 = 0LL;
    if (!v11) {
      goto LABEL_21;
    }
LABEL_20:
    CFRelease(v11);
    goto LABEL_21;
  }

  if (v10)
  {
    if (CFStringCompare(a2, v10, 0LL) == kCFCompareEqualTo)
    {
      *a3 = v12;
      BOOL v13 = 1LL;
      goto LABEL_20;
    }

    Query = __WiFiSecurityCreateQuery(a1, 0LL, 0LL, 1, 0, 1);
    if (!Query)
    {
      objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
      BOOL v13 = 0LL;
      goto LABEL_20;
    }

    int v15 = Query;
    CFMutableDataRef Mutable = CFDictionaryCreateMutable(v8, 0LL, 0LL, 0LL);
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x18960BE78], ExternalRepresentation);
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x18960B9F8], a1);
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x18960B918], @"AirPort network password");
    uint64_t v17 = SecItemUpdate(v15, Mutable);
    int v18 = v17;
    if (Mutable) {
      CFRelease(Mutable);
    }
  }

  else
  {
    __int16 v19 = __WiFiSecurityCreateQuery(a1, a1, @"AirPort network password", 1, 0, 1);
    if (!v19)
    {
      objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
      BOOL v13 = 0LL;
      if (!ExternalRepresentation) {
        return v13;
      }
      goto LABEL_22;
    }

    int v15 = v19;
    unint64_t v21 = 0xAAAAAAAAAAAAAAAALL;
    CFDictionarySetValue(v19, (const void *)*MEMORY[0x18960BE78], ExternalRepresentation);
    CFDictionarySetValue(v15, (const void *)*MEMORY[0x18960B828], (const void *)*MEMORY[0x18960B830]);
    CFDictionarySetValue(v15, (const void *)*MEMORY[0x18960BAA8], (const void *)*MEMORY[0x189604DE8]);
    uint64_t v17 = SecItemAdd(v15, (CFTypeRef *)&v21);
    int v18 = v17;
  }

  *a3 = v12;
  BOOL v13 = v18 == 0;
  if (v18) {
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C](v17));
  }
  else {
    notify_post("com.apple.wifid.WiFiPasswordChanged");
  }
  CFRelease(v15);
  if (v11) {
    goto LABEL_20;
  }
LABEL_21:
  if (ExternalRepresentation) {
LABEL_22:
  }
    CFRelease(ExternalRepresentation);
  return v13;
}

BOOL WiFiSecuritySetPassword(BOOL a1, const __CFString *a2)
{
  return __WiFiSecuritySetPassword(a1, a2, 1);
}

BOOL __WiFiSecuritySetPassword(BOOL a1, CFStringRef theString, int a3)
{
  BOOL v3 = a1;
  if (!a1)
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C](0LL, theString));
    return v3;
  }

  if (!theString || !CFStringGetLength(theString))
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
    return 0LL;
  }

  OSStatus v6 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  CFDataRef ExternalRepresentation = CFStringCreateExternalRepresentation( (CFAllocatorRef)*MEMORY[0x189604DB0],  theString,  0x8000100u,  0);
  dispatch_time_t v8 = WiFiSecurityCopyPassword((__CFString *)v3);
  if (v8)
  {
    if (CFStringCompare(theString, v8, 0LL))
    {
      Query = __WiFiSecurityCreateQuery((const void *)v3, 0LL, 0LL, 1, 0, a3);
      if (Query)
      {
        uint32_t v10 = Query;
        CFMutableDataRef Mutable = CFDictionaryCreateMutable(v6, 0LL, 0LL, 0LL);
        CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x18960BE78], ExternalRepresentation);
        CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x18960B9F8], (const void *)v3);
        CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x18960B918], @"AirPort network password");
        OSStatus v12 = SecItemUpdate(v10, Mutable);
        if (Mutable) {
          CFRelease(Mutable);
        }
        goto LABEL_11;
      }

      objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
      BOOL v3 = 0LL;
    }

    else
    {
      BOOL v3 = 1LL;
    }

LABEL_17:
    CFRelease(v8);
    goto LABEL_18;
  }

  BOOL v13 = __WiFiSecurityCreateQuery((const void *)v3, (const void *)v3, @"AirPort network password", 1, 0, a3);
  if (!v13)
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
    BOOL v3 = 0LL;
    if (!ExternalRepresentation) {
      return v3;
    }
    goto LABEL_19;
  }

  uint32_t v10 = v13;
  CFTypeRef result = (CFTypeRef)0xAAAAAAAAAAAAAAAALL;
  CFDictionarySetValue(v13, (const void *)*MEMORY[0x18960BE78], ExternalRepresentation);
  CFDictionarySetValue(v10, (const void *)*MEMORY[0x18960B828], (const void *)*MEMORY[0x18960B830]);
  CFDictionarySetValue(v10, (const void *)*MEMORY[0x18960BAA8], (const void *)*MEMORY[0x189604DE8]);
  OSStatus v12 = SecItemAdd(v10, &result);
LABEL_11:
  BOOL v3 = v12 == 0;
  if (v12) {
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
  }
  else {
    notify_post("com.apple.wifid.WiFiPasswordChanged");
  }
  CFRelease(v10);
  if (v8) {
    goto LABEL_17;
  }
LABEL_18:
  if (ExternalRepresentation) {
LABEL_19:
  }
    CFRelease(ExternalRepresentation);
  return v3;
}

BOOL WiFiSecuritySetLegacyPassword(BOOL a1, const __CFString *a2)
{
  return __WiFiSecuritySetPassword(a1, a2, 0);
}

uint64_t WiFiSecurityRemovePassword(const void *a1)
{
  return __WiFiSecurityRemovePassword(a1, 1);
}

uint64_t __WiFiSecurityRemovePassword(const void *a1, int a2)
{
  if (a1
    && (Query = __WiFiSecurityCreateQuery(a1, 0LL, 0LL, 0, 0, a2)) != 0LL
    && (BOOL v3 = Query, v4 = SecItemDelete(Query), CFRelease(v3), !v4))
  {
    notify_post("com.apple.wifid.WiFiPasswordChanged");
    return 1LL;
  }

  else
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
    return 0LL;
  }

uint64_t WiFiSecurityRemoveLegacyPassword(const void *a1)
{
  return __WiFiSecurityRemovePassword(a1, 0);
}

uint64_t WiFiSecurityIsPasswordSyncing(const void *a1)
{
  CFTypeRef result = 0LL;
  if (!a1)
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
    return 0LL;
  }

  if (MKBGetDeviceLockState() == 1 && !MKBUserUnlockedSinceBoot())
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
    uint64_t v5 = 0LL;
    BOOL v3 = 0LL;
    goto LABEL_11;
  }

  Query = __WiFiSecurityCreateQuery(a1, 0LL, 0LL, 0, 1, 1);
  BOOL v3 = Query;
  if (!Query || SecItemCopyMatching(Query, &result) || !result)
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
    goto LABEL_10;
  }

  unint64_t Value = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)result, (const void *)*MEMORY[0x18960BAA8]);
  if (!Value)
  {
LABEL_10:
    uint64_t v5 = 0LL;
    goto LABEL_11;
  }

  uint64_t v5 = CFBooleanGetValue(Value);
LABEL_11:
  if (result)
  {
    CFRelease(result);
    CFTypeRef result = 0LL;
  }

  if (v3) {
    CFRelease(v3);
  }
  return v5;
}

BOOL WiFiSecuritySetPasswordSyncable(__CFString *a1, int a2)
{
  if (!a1 || (CFStringRef v4 = WiFiSecurityCopyPassword(a1)) == 0LL)
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
    return 0LL;
  }

  CFStringRef v5 = v4;
  Query = __WiFiSecurityCreateQuery(a1, 0LL, 0LL, 0, 0, 1);
  if (!Query)
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
    CFRelease(v5);
    return 0LL;
  }

  CFStringRef v7 = Query;
  CFMutableDataRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, 0LL, 0LL);
  if (Mutable)
  {
    uint64_t v9 = Mutable;
    uint32_t v10 = (const void **)MEMORY[0x189604DE0];
    if (a2) {
      uint32_t v10 = (const void **)MEMORY[0x189604DE8];
    }
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x18960BAA8], *v10);
    CFDictionaryRemoveValue(v7, (const void *)*MEMORY[0x18960BE20]);
    OSStatus v11 = SecItemUpdate(v7, v9);
    BOOL v12 = v11 == 0;
    if (v11) {
      objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
    }
    CFRelease(v9);
  }

  else
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
    BOOL v12 = 0LL;
  }

  CFRelease(v5);
  CFRelease(v7);
  return v12;
}

__CFString *WiFiSecurityCopyHashedWPAPassword(const __CFString *a1, const __CFData *a2)
{
  CFMutableDataRef Mutable = 0LL;
  uint64_t v12 = *MEMORY[0x1895F89C0];
  if (a1 && a2)
  {
    *(_OWORD *)bytes = 0u;
    __int128 v11 = 0u;
    CFStringGetCStringPtr(a1, 0x8000100u);
    CFDataGetBytePtr(a2);
    CFDataGetLength(a2);
    CFStringRef v4 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    CFStringRef v5 = CFDataCreate((CFAllocatorRef)*MEMORY[0x189604DB0], bytes, 32LL);
    if (!v5)
    {
      return 0LL;
    }

    else
    {
      OSStatus v6 = v5;
      BytePtr = CFDataGetBytePtr(v5);
      if (CFDataGetLength(v6) == 32)
      {
        CFMutableDataRef Mutable = CFStringCreateMutable(v4, 64LL);
        for (uint64_t i = 0LL; i != 32; ++i)
          CFStringAppendFormat(Mutable, 0LL, @"%02x", BytePtr[i]);
      }

      else
      {
        CFMutableDataRef Mutable = 0LL;
      }

      CFRelease(v6);
    }
  }

  return Mutable;
}

CFTypeRef WiFiSecurityCopyAttributesForAllAirPortEntries()
{
  CFTypeRef result = 0LL;
  if ((MKBGetDeviceLockState() != 1 || MKBUserUnlockedSinceBoot())
    && (CFMutableDataRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, 0LL, 0LL)) != 0LL)
  {
    uint64_t v1 = Mutable;
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x18960BB38], (const void *)*MEMORY[0x18960BB48]);
    CFDictionarySetValue(v1, (const void *)*MEMORY[0x18960BDA0], (const void *)*MEMORY[0x18960BDA8]);
    CFDictionarySetValue(v1, (const void *)*MEMORY[0x18960BA88], @"AirPort");
    CFDictionarySetValue(v1, (const void *)*MEMORY[0x18960BAA8], (const void *)*MEMORY[0x18960BAB0]);
    CFStringRef v2 = (const void *)*MEMORY[0x189604DE8];
    CFDictionarySetValue(v1, (const void *)*MEMORY[0x18960BE18], (const void *)*MEMORY[0x189604DE8]);
    CFDictionarySetValue(v1, (const void *)*MEMORY[0x18960BE70], v2);
    if (SecItemCopyMatching(v1, &result))
    {
      if (result) {
        objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
      }
    }

    CFRelease(v1);
    return result;
  }

  else
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
    return 0LL;
  }

CFStringRef WiFiSecurityCopyNonSyncablePassword(const void *a1)
{
  CFTypeRef result = 0LL;
  if (!a1) {
    return 0LL;
  }
  objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
  if (MKBGetDeviceLockState() == 1 && !MKBUserUnlockedSinceBoot())
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
    CFStringRef v4 = 0LL;
    goto LABEL_13;
  }

  CFStringRef v2 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  CFMutableDataRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, 0LL, 0LL);
  CFStringRef v4 = Mutable;
  if (!Mutable)
  {
LABEL_13:
    CFStringRef v7 = 0LL;
    goto LABEL_14;
  }

  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x18960BB38], (const void *)*MEMORY[0x18960BB48]);
  CFDictionarySetValue(v4, (const void *)*MEMORY[0x18960B870], a1);
  CFDictionarySetValue(v4, (const void *)*MEMORY[0x18960BA88], @"AirPort");
  CFStringRef v5 = (const void *)*MEMORY[0x189604DE8];
  CFDictionarySetValue(v4, (const void *)*MEMORY[0x18960BE70], (const void *)*MEMORY[0x189604DE8]);
  CFDictionarySetValue(v4, (const void *)*MEMORY[0x18960BE20], v5);
  if (SecItemCopyMatching(v4, &result)) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = result == 0LL;
  }
  if (v6)
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
    goto LABEL_13;
  }

  CFStringRef v7 = CFStringCreateFromExternalRepresentation(v2, (CFDataRef)result, 0x8000100u);
LABEL_14:
  if (result)
  {
    CFRelease(result);
    CFTypeRef result = 0LL;
  }

  if (v4) {
    CFRelease(v4);
  }
  return v7;
}

uint64_t WiFiSecurityCopyNonSyncablePasswordWithTimeout(const void *a1, BOOL *a2, double a3)
{
  uint64_t v18 = 0LL;
  __int16 v19 = &v18;
  uint64_t v20 = 0x2020000000LL;
  uint64_t v21 = 0LL;
  if (a1)
  {
    if (MKBGetDeviceLockState() == 1 && !MKBUserUnlockedSinceBoot())
    {
      objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
    }

    else
    {
      BOOL v6 = dispatch_semaphore_create(0LL);
      uint64_t v14 = 0LL;
      int v15 = &v14;
      uint64_t v16 = 0x2020000000LL;
      char v17 = 0;
      CFRetain(a1);
      dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
      v13[0] = MEMORY[0x1895F87A8];
      v13[1] = 3221225472LL;
      v13[2] = __WiFiSecurityCopyNonSyncablePasswordWithTimeout_block_invoke;
      v13[3] = &unk_189E8BAB0;
      v13[6] = &v14;
      v13[7] = a1;
      v13[4] = v6;
      v13[5] = &v18;
      dispatch_async(global_queue, v13);
      dispatch_time_t v8 = dispatch_time(0LL, (uint64_t)(a3 * 1000000000.0));
      BOOL v9 = dispatch_semaphore_wait(v6, v8) != 0;
      uint32_t v10 = v15;
      *((_BYTE *)v15 + 24) = v9;
      *a2 = v9;
      if (*((_BYTE *)v10 + 24)) {
        objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
      }
      dispatch_release(v6);
      _Block_object_dispose(&v14, 8);
    }
  }

  uint64_t v11 = v19[3];
  _Block_object_dispose(&v18, 8);
  return v11;
}

void sub_1865A9B44( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t __WiFiSecurityCopyNonSyncablePasswordWithTimeout_block_invoke(uint64_t a1)
{
  CFTypeRef result = 0LL;
  CFStringRef v2 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  CFMutableDataRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, 0LL, 0LL);
  CFStringRef v4 = Mutable;
  if (!Mutable
    || ((CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x18960BB38], (const void *)*MEMORY[0x18960BB48]),
         CFDictionarySetValue(v4, (const void *)*MEMORY[0x18960B870], *(const void **)(a1 + 56)),
         CFDictionarySetValue(v4, (const void *)*MEMORY[0x18960BA88], @"AirPort"),
         CFStringRef v5 = (const void *)*MEMORY[0x189604DE8],
         CFDictionarySetValue(v4, (const void *)*MEMORY[0x18960BE70], (const void *)*MEMORY[0x189604DE8]),
         CFDictionarySetValue(v4, (const void *)*MEMORY[0x18960BE20], v5),
         !SecItemCopyMatching(v4, &result))
      ? (BOOL v6 = result == 0LL)
      : (BOOL v6 = 1),
        v6))
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x186E3BB0C]());
  }

  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = CFStringCreateFromExternalRepresentation( v2,  (CFDataRef)result,  0x8000100u);
  }

  if (result)
  {
    CFRelease(result);
    CFTypeRef result = 0LL;
  }

  if (v4) {
    CFRelease(v4);
  }
  if (*(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL))
  {
    CFStringRef v7 = *(const void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
    if (v7)
    {
      CFRelease(v7);
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0LL;
    }
  }

  CFRelease(*(CFTypeRef *)(a1 + 56));
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void *WiFiSecurityCopySSIDHashForPasswordBackup(void *a1)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  CFStringRef v2 = (void *)MEMORY[0x186E3BB0C]();
  *(void *)&__int128 v3 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  macOut[0] = v3;
  macOut[1] = v3;
  CFStringRef v4 = (const char *)[a1 cStringUsingEncoding:4];
  size_t v5 = strlen(v4);
  CCHmac(2u, "CURRENT_NETWORK", 0xFuLL, v4, v5, macOut);
  BOOL v6 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithCapacity:64];
  for (uint64_t i = 0LL; i != 32; ++i)
    objc_msgSend(v6, "appendFormat:", @"%02x", *((unsigned __int8 *)macOut + i));
  objc_autoreleasePoolPop(v2);
  return v6;
}

BOOL WiFiSecuritySavePasswordForPasswordBackup(uint64_t a1, uint64_t a2)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  CFStringRef v4 = (void *)MEMORY[0x186E3BB0C]();
  size_t v5 = dispatch_semaphore_create(0LL);
  uint64_t v12 = 0LL;
  BOOL v13 = &v12;
  uint64_t v14 = 0x2020000000LL;
  int v15 = 0;
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __WiFiSecuritySavePasswordForPasswordBackup_block_invoke;
  v11[3] = &unk_189E8BAD8;
  v11[4] = a1;
  v11[5] = a2;
  v11[6] = v5;
  v11[7] = &v12;
  dispatch_async(MEMORY[0x1895F8AE0], v11);
  dispatch_time_t v6 = dispatch_time(0LL, 1000000000LL);
  uint64_t v7 = dispatch_semaphore_wait(v5, v6);
  BOOL v8 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v8)
    {
      *(_DWORD *)buf = 136315394;
      char v17 = "WiFiSecuritySavePasswordForPasswordBackup";
      __int16 v18 = 2112;
      uint64_t v19 = a1;
      _os_log_impl(&dword_18658B000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "%s:[%@] timed out\n", buf, 0x16u);
    }

    BOOL v9 = 0LL;
  }

  else
  {
    if (v8)
    {
      *(_DWORD *)buf = 136315394;
      char v17 = "WiFiSecuritySavePasswordForPasswordBackup";
      __int16 v18 = 2112;
      uint64_t v19 = a1;
      _os_log_impl(&dword_18658B000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "%s:[%@] completed\n", buf, 0x16u);
    }

    BOOL v9 = *((_DWORD *)v13 + 6) == 0;
  }

  dispatch_release(v5);
  _Block_object_dispose(&v12, 8);
  objc_autoreleasePoolPop(v4);
  return v9;
}

uint64_t __WiFiSecuritySavePasswordForPasswordBackup_block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  CFTypeRef result = (CFTypeRef)0xAAAAAAAAAAAAAAAALL;
  CFStringRef v2 = *(void **)(a1 + 32);
  if (!v2)
  {
    if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_28;
    }
    *(_DWORD *)buf = 136315138;
    uint64_t v19 = "WiFiSecuritySavePasswordForPasswordBackup_block_invoke";
    BOOL v13 = (os_log_s *)MEMORY[0x1895F8DA0];
    uint64_t v14 = "%s: null ssid";
LABEL_24:
    uint32_t v15 = 12;
LABEL_27:
    _os_log_impl(&dword_18658B000, v13, OS_LOG_TYPE_DEFAULT, v14, buf, v15);
    goto LABEL_28;
  }

  if (!*(void *)(a1 + 40))
  {
    if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_28;
    }
    *(_DWORD *)buf = 136315138;
    uint64_t v19 = "WiFiSecuritySavePasswordForPasswordBackup_block_invoke";
    BOOL v13 = (os_log_s *)MEMORY[0x1895F8DA0];
    uint64_t v14 = "%s: null password";
    goto LABEL_24;
  }

  if (![v2 length])
  {
    if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_28;
    }
    *(_DWORD *)buf = 136315138;
    uint64_t v19 = "WiFiSecuritySavePasswordForPasswordBackup_block_invoke";
    BOOL v13 = (os_log_s *)MEMORY[0x1895F8DA0];
    uint64_t v14 = "%s: error: empty ssid";
    goto LABEL_24;
  }

  if (![*(id *)(a1 + 40) length])
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 136315394;
      uint64_t v19 = "WiFiSecuritySavePasswordForPasswordBackup_block_invoke";
      __int16 v20 = 2112;
      uint64_t v21 = v16;
      BOOL v13 = (os_log_s *)MEMORY[0x1895F8DA0];
      uint64_t v14 = "%s: error: empty password for ssid %@";
      uint32_t v15 = 22;
      goto LABEL_27;
    }

BOOL WiFiSecurityRemovePasswordFromPasswordBackup(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  CFStringRef v2 = (void *)MEMORY[0x186E3BB0C]();
  __int128 v3 = dispatch_semaphore_create(0LL);
  uint64_t v10 = 0LL;
  uint32_t v11 = &v10;
  uint64_t v12 = 0x2020000000LL;
  int v13 = 0;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __WiFiSecurityRemovePasswordFromPasswordBackup_block_invoke;
  block[3] = &unk_189E8BB00;
  void block[5] = v3;
  block[6] = &v10;
  block[4] = a1;
  dispatch_async(MEMORY[0x1895F8AE0], block);
  dispatch_time_t v4 = dispatch_time(0LL, 1000000000LL);
  uint64_t v5 = dispatch_semaphore_wait(v3, v4);
  BOOL v6 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v6)
    {
      *(_DWORD *)buf = 136315394;
      uint32_t v15 = "WiFiSecurityRemovePasswordFromPasswordBackup";
      __int16 v16 = 2112;
      uint64_t v17 = a1;
      _os_log_impl(&dword_18658B000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "%s:[%@] timed out\n", buf, 0x16u);
    }

    BOOL v7 = 0LL;
  }

  else
  {
    if (v6)
    {
      *(_DWORD *)buf = 136315394;
      uint32_t v15 = "WiFiSecurityRemovePasswordFromPasswordBackup";
      __int16 v16 = 2112;
      uint64_t v17 = a1;
      _os_log_impl(&dword_18658B000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "%s:[%@] completed\n", buf, 0x16u);
    }

    BOOL v7 = *((_DWORD *)v11 + 6) == 0;
  }

  dispatch_release(v3);
  _Block_object_dispose(&v10, 8);
  objc_autoreleasePoolPop(v2);
  return v7;
}

uint64_t __WiFiSecurityRemovePasswordFromPasswordBackup_block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  CFStringRef v2 = *(void **)(a1 + 32);
  if (!v2)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 136315138;
      uint32_t v15 = "WiFiSecurityRemovePasswordFromPasswordBackup_block_invoke";
      uint64_t v12 = (os_log_s *)MEMORY[0x1895F8DA0];
      int v13 = "%s: null ssid";
LABEL_18:
      _os_log_impl(&dword_18658B000, v12, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v14, 0xCu);
    }

LABEL_19:
    dispatch_time_t v4 = 0LL;
    goto LABEL_11;
  }

  if (![v2 length])
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 136315138;
      uint32_t v15 = "WiFiSecurityRemovePasswordFromPasswordBackup_block_invoke";
      uint64_t v12 = (os_log_s *)MEMORY[0x1895F8DA0];
      int v13 = "%s: error: empty ssid";
      goto LABEL_18;
    }

    goto LABEL_19;
  }

  __int128 v3 = WiFiSecurityCopySSIDHashForPasswordBackup(*(void **)(a1 + 32));
  dispatch_time_t v4 = v3;
  if (!v3 || ![v3 length])
  {
    if (!os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    int v14 = 136315138;
    uint32_t v15 = "WiFiSecurityRemovePasswordFromPasswordBackup_block_invoke";
    int v8 = (os_log_s *)MEMORY[0x1895F8DA0];
    BOOL v9 = "%s: error: empty ssid hash";
    uint32_t v10 = 12;
    goto LABEL_10;
  }

  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void **)(a1 + 32);
    int v14 = 136315650;
    uint32_t v15 = "WiFiSecurityRemovePasswordFromPasswordBackup_block_invoke";
    __int16 v16 = 2112;
    uint64_t v17 = v5;
    __int16 v18 = 2112;
    uint64_t v19 = v4;
    _os_log_impl(&dword_18658B000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT, "%s: ssid %@ (%@)", (uint8_t *)&v14, 0x20u);
  }

  BOOL v6 = (void *)[MEMORY[0x189603FC8] dictionary];
  [v6 setObject:*MEMORY[0x18960BB48] forKey:*MEMORY[0x18960BB38]];
  [v6 setObject:v4 forKey:*MEMORY[0x18960B870]];
  [v6 setObject:@"AirPort" forKey:*MEMORY[0x18960BA88]];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = SecItemDelete((CFDictionaryRef)v6);
  int v7 = *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL);
  if (v7 && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315650;
    uint32_t v15 = "WiFiSecurityRemovePasswordFromPasswordBackup_block_invoke";
    __int16 v16 = 2112;
    uint64_t v17 = v4;
    __int16 v18 = 1024;
    LODWORD(v19) = v7;
    int v8 = (os_log_s *)MEMORY[0x1895F8DA0];
    BOOL v9 = "%s:[%@] error result %d \n";
    uint32_t v10 = 28;
LABEL_10:
    _os_log_impl(&dword_18658B000, v8, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v14, v10);
  }

BOOL MobileWiFiContainsRadio()
{
  mach_port_t v0 = *MEMORY[0x1896086B0];
  uint64_t v1 = IOServiceMatching("IOPlatformExpertDevice");
  io_service_t MatchingService = IOServiceGetMatchingService(v0, v1);
  if (MatchingService)
  {
    io_object_t v3 = MatchingService;
    dispatch_time_t v4 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    uint64_t v5 = (const __CFData *)IORegistryEntrySearchCFProperty( MatchingService,  "IODeviceTree",  @"software-behavior",  (CFAllocatorRef)*MEMORY[0x189604DB0],  1u);
    if (v5)
    {
      BOOL v6 = v5;
      *(_DWORD *)buffer = -1431655766;
      v14.location = 0LL;
      v14.length = 4LL;
      CFDataGetBytes(v5, v14, buffer);
      UInt8 v7 = buffer[0];
      CFRelease(v6);
      if ((v7 & 0x20) != 0)
      {
        BOOL v8 = 0LL;
LABEL_10:
        IOObjectRelease(v3);
        goto LABEL_11;
      }
    }

    else
    {
      SCLog();
    }

    SCLog();
    BOOL v9 = (const __CFData *)IORegistryEntrySearchCFProperty(v3, "IODeviceTree", @"no-sdio-devices", v4, 1u);
    if (v9)
    {
      uint32_t v10 = v9;
      *(_DWORD *)uint64_t v12 = -1431655766;
      v15.location = 0LL;
      v15.length = 4LL;
      CFDataGetBytes(v9, v15, v12);
      BOOL v8 = *(_DWORD *)v12 == 0;
      CFRelease(v10);
    }

    else
    {
      BOOL v8 = 1LL;
      SCLog();
    }

    goto LABEL_10;
  }

  BOOL v8 = 1LL;
  SCLog();
LABEL_11:
  SCLog();
  return v8;
}

uint64_t MobileWiFiContainsDriver()
{
  kern_return_t v3;
  mach_port_t v0 = MobileWiFiContainsDriver_masterPort;
  if (!MobileWiFiContainsDriver_masterPort)
  {
    io_object_t v3 = IOMasterPort(0, (mach_port_t *)&MobileWiFiContainsDriver_masterPort);
    uint64_t result = 0LL;
    if (v3) {
      return result;
    }
    mach_port_t v0 = MobileWiFiContainsDriver_masterPort;
  }

  uint64_t v1 = IOServiceMatching("IO80211Controller");
  uint64_t result = IOServiceGetMatchingService(v0, v1);
  if ((_DWORD)result)
  {
    IOObjectRelease(result);
    return 1LL;
  }

  return result;
}

void sub_1865AAC24( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void __Block_byref_object_copy__0(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

Class __getSFPasswordSharingServiceClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  io_object_t v3 = 0LL;
  if (!SharingLibraryCore_frameworkLibrary)
  {
    __int128 v4 = xmmword_189E8C840;
    uint64_t v5 = 0LL;
    SharingLibraryCore_frameworkLibrary = _sl_dlopen();
  }

  if (!SharingLibraryCore_frameworkLibrary) {
    __getSFPasswordSharingServiceClass_block_invoke_cold_1(&v3);
  }
  Class result = objc_getClass("SFPasswordSharingService");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL)) {
    __getSFPasswordSharingServiceClass_block_invoke_cold_2();
  }
  getSFPasswordSharingServiceClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
  return result;
}

uint64_t wifi_manager_client_server_routine(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 20);
  else {
    return 0LL;
  }
}

uint64_t _Xwifi_manager_client_dispatch_notification(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 && *(_DWORD *)(result + 24) == 3 && *(_DWORD *)(result + 4) == 104)
  {
    if (*(_BYTE *)(result + 39) == 1 && *(_BYTE *)(result + 55) == 1 && *(_BYTE *)(result + 71) == 1)
    {
      unsigned int v3 = *(_DWORD *)(result + 40);
      if (v3 == *(_DWORD *)(result + 84))
      {
        unsigned int v4 = *(_DWORD *)(result + 56);
        if (v4 == *(_DWORD *)(result + 96))
        {
          unsigned int v5 = *(_DWORD *)(result + 72);
          if (v5 == *(_DWORD *)(result + 100))
          {
            Class result = _wifi_manager_client_dispatch_notification( *(_DWORD *)(result + 12),  *(UInt8 **)(result + 28),  v3,  *(_DWORD *)(result + 88),  *(_DWORD *)(result + 92),  *(UInt8 **)(result + 44),  v4,  *(UInt8 **)(result + 60),  v5);
            *(_DWORD *)(a2 + 32) = result;
            return result;
          }
        }
      }
    }

    int v6 = -300;
  }

  else
  {
    int v6 = -304;
  }

  *(_DWORD *)(a2 + 32) = v6;
  *(void *)(a2 + 24) = *MEMORY[0x1895F8468];
  return result;
}

uint64_t _Xwifi_manager_client_dispatch_scan_results(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 && *(_DWORD *)(result + 24) == 2 && *(_DWORD *)(result + 4) == 80)
  {
    if (*(_BYTE *)(result + 39) == 1 && *(_BYTE *)(result + 55) == 1)
    {
      unsigned int v3 = *(_DWORD *)(result + 40);
      if (v3 == *(_DWORD *)(result + 68))
      {
        unsigned int v4 = *(_DWORD *)(result + 56);
        if (v4 == *(_DWORD *)(result + 72))
        {
          Class result = _wifi_manager_client_dispatch_scan_results( *(_DWORD *)(result + 12),  *(UInt8 **)(result + 28),  v3,  *(UInt8 **)(result + 44),  v4,  *(unsigned int *)(result + 76));
          *(_DWORD *)(a2 + 32) = result;
          return result;
        }
      }
    }

    int v5 = -300;
  }

  else
  {
    int v5 = -304;
  }

  *(_DWORD *)(a2 + 32) = v5;
  *(void *)(a2 + 24) = *MEMORY[0x1895F8468];
  return result;
}

uint64_t _Xwifi_manager_client_dispatch_association_result(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 && *(_DWORD *)(result + 24) == 3 && *(_DWORD *)(result + 4) == 100)
  {
    if (*(_BYTE *)(result + 39) == 1 && *(_BYTE *)(result + 55) == 1 && *(_BYTE *)(result + 71) == 1)
    {
      unsigned int v3 = *(_DWORD *)(result + 40);
      if (v3 == *(_DWORD *)(result + 84))
      {
        unsigned int v4 = *(_DWORD *)(result + 56);
        if (v4 == *(_DWORD *)(result + 88))
        {
          unsigned int v5 = *(_DWORD *)(result + 72);
          if (v5 == *(_DWORD *)(result + 92))
          {
            Class result = _wifi_manager_client_dispatch_association_result( *(_DWORD *)(result + 12),  *(UInt8 **)(result + 28),  v3,  *(UInt8 **)(result + 44),  v4,  *(UInt8 **)(result + 60),  v5,  *(_DWORD *)(result + 96));
            *(_DWORD *)(a2 + 32) = result;
            return result;
          }
        }
      }
    }

    int v6 = -300;
  }

  else
  {
    int v6 = -304;
  }

  *(_DWORD *)(a2 + 32) = v6;
  *(void *)(a2 + 24) = *MEMORY[0x1895F8468];
  return result;
}

uint64_t _Xwifi_manager_client_dispatch_start_network_result(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 && *(_DWORD *)(result + 24) == 3 && *(_DWORD *)(result + 4) == 100)
  {
    if (*(_BYTE *)(result + 39) == 1 && *(_BYTE *)(result + 55) == 1 && *(_BYTE *)(result + 71) == 1)
    {
      unsigned int v3 = *(_DWORD *)(result + 40);
      if (v3 == *(_DWORD *)(result + 84))
      {
        unsigned int v4 = *(_DWORD *)(result + 56);
        if (v4 == *(_DWORD *)(result + 92))
        {
          unsigned int v5 = *(_DWORD *)(result + 72);
          if (v5 == *(_DWORD *)(result + 96))
          {
            Class result = _wifi_manager_client_dispatch_start_network_result( *(_DWORD *)(result + 12),  *(UInt8 **)(result + 28),  v3,  *(_DWORD *)(result + 88),  *(UInt8 **)(result + 44),  v4,  *(UInt8 **)(result + 60),  v5);
            *(_DWORD *)(a2 + 32) = result;
            return result;
          }
        }
      }
    }

    int v6 = -300;
  }

  else
  {
    int v6 = -304;
  }

  *(_DWORD *)(a2 + 32) = v6;
  *(void *)(a2 + 24) = *MEMORY[0x1895F8468];
  return result;
}

uint64_t _Xwifi_manager_client_dispatch_stop_network_result(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 && *(_DWORD *)(result + 24) == 2 && *(_DWORD *)(result + 4) == 80)
  {
    if (*(_BYTE *)(result + 39) == 1 && *(_BYTE *)(result + 55) == 1)
    {
      unsigned int v3 = *(_DWORD *)(result + 40);
      if (v3 == *(_DWORD *)(result + 68))
      {
        unsigned int v4 = *(_DWORD *)(result + 56);
        if (v4 == *(_DWORD *)(result + 76))
        {
          Class result = _wifi_manager_client_dispatch_stop_network_result( *(_DWORD *)(result + 12),  *(UInt8 **)(result + 28),  v3,  *(unsigned int *)(result + 72),  *(UInt8 **)(result + 44),  v4);
          *(_DWORD *)(a2 + 32) = result;
          return result;
        }
      }
    }

    int v5 = -300;
  }

  else
  {
    int v5 = -304;
  }

  *(_DWORD *)(a2 + 32) = v5;
  *(void *)(a2 + 24) = *MEMORY[0x1895F8468];
  return result;
}

uint64_t _Xwifi_manager_client_dispatch_event(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 && *(_DWORD *)(result + 24) == 2 && *(_DWORD *)(result + 4) == 84)
  {
    if (*(_BYTE *)(result + 39) == 1 && *(_BYTE *)(result + 55) == 1)
    {
      unsigned int v3 = *(_DWORD *)(result + 40);
      if (v3 == *(_DWORD *)(result + 68))
      {
        unsigned int v4 = *(_DWORD *)(result + 56);
        if (v4 == *(_DWORD *)(result + 80))
        {
          Class result = _wifi_manager_client_dispatch_event( *(_DWORD *)(result + 12),  *(UInt8 **)(result + 28),  v3,  *(void *)(result + 72),  *(UInt8 **)(result + 44),  v4);
          *(_DWORD *)(a2 + 32) = result;
          return result;
        }
      }
    }

    int v5 = -300;
  }

  else
  {
    int v5 = -304;
  }

  *(_DWORD *)(a2 + 32) = v5;
  *(void *)(a2 + 24) = *MEMORY[0x1895F8468];
  return result;
}

_DWORD *_Xwifi_manager_client_dispatch_wow_state_change(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 36)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(void *)(a2 + 24) = *MEMORY[0x1895F8468];
  }

  else
  {
    Class result = (_DWORD *)_wifi_manager_client_dispatch_wow_state_change(result[3], result[8]);
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
  }

  return result;
}

uint64_t _Xwifi_manager_client_dispatch_gas_results(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 && *(_DWORD *)(result + 24) == 2 && *(_DWORD *)(result + 4) == 80)
  {
    if (*(_BYTE *)(result + 39) == 1 && *(_BYTE *)(result + 55) == 1)
    {
      unsigned int v3 = *(_DWORD *)(result + 40);
      if (v3 == *(_DWORD *)(result + 68))
      {
        unsigned int v4 = *(_DWORD *)(result + 56);
        if (v4 == *(_DWORD *)(result + 72))
        {
          Class result = _wifi_manager_client_dispatch_gas_results( *(_DWORD *)(result + 12),  *(UInt8 **)(result + 28),  v3,  *(UInt8 **)(result + 44),  v4,  *(unsigned int *)(result + 76));
          *(_DWORD *)(a2 + 32) = result;
          return result;
        }
      }
    }

    int v5 = -300;
  }

  else
  {
    int v5 = -304;
  }

  *(_DWORD *)(a2 + 32) = v5;
  *(void *)(a2 + 24) = *MEMORY[0x1895F8468];
  return result;
}

uint64_t _Xwifi_manager_client_dispatch_ranging_result(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 && *(_DWORD *)(result + 24) == 2 && *(_DWORD *)(result + 4) == 80)
  {
    if (*(_BYTE *)(result + 39) == 1 && *(_BYTE *)(result + 55) == 1)
    {
      unsigned int v3 = *(_DWORD *)(result + 40);
      if (v3 == *(_DWORD *)(result + 68))
      {
        unsigned int v4 = *(_DWORD *)(result + 56);
        if (v4 == *(_DWORD *)(result + 72))
        {
          Class result = _wifi_manager_client_dispatch_ranging_result( *(_DWORD *)(result + 12),  *(UInt8 **)(result + 28),  v3,  *(UInt8 **)(result + 44),  v4,  *(unsigned int *)(result + 76));
          *(_DWORD *)(a2 + 32) = result;
          return result;
        }
      }
    }

    int v5 = -300;
  }

  else
  {
    int v5 = -304;
  }

  *(_DWORD *)(a2 + 32) = v5;
  *(void *)(a2 + 24) = *MEMORY[0x1895F8468];
  return result;
}

uint64_t _Xwifi_manager_client_dispatch_add_network_async(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 && *(_DWORD *)(result + 24) == 1 && *(_DWORD *)(result + 4) == 60)
  {
    if (*(_BYTE *)(result + 39) == 1)
    {
      unsigned int v3 = *(_DWORD *)(result + 40);
      if (v3 == *(_DWORD *)(result + 52))
      {
        Class result = _wifi_manager_client_dispatch_add_network_async( *(_DWORD *)(result + 12),  *(UInt8 **)(result + 28),  v3,  *(unsigned int *)(result + 56));
        *(_DWORD *)(a2 + 32) = result;
        return result;
      }
    }

    int v4 = -300;
  }

  else
  {
    int v4 = -304;
  }

  *(_DWORD *)(a2 + 32) = v4;
  *(void *)(a2 + 24) = *MEMORY[0x1895F8468];
  return result;
}

uint64_t _Xwifi_manager_client_dispatch_auto_join_state_change(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 && *(_DWORD *)(result + 24) == 1 && *(_DWORD *)(result + 4) == 60)
  {
    if (*(_BYTE *)(result + 39) == 1)
    {
      unsigned int v3 = *(_DWORD *)(result + 40);
      if (v3 == *(_DWORD *)(result + 56))
      {
        Class result = _wifi_manager_client_dispatch_auto_join_state_change( *(_DWORD *)(result + 12),  *(_DWORD *)(result + 52),  *(UInt8 **)(result + 28),  v3);
        *(_DWORD *)(a2 + 32) = result;
        return result;
      }
    }

    int v4 = -300;
  }

  else
  {
    int v4 = -304;
  }

  *(_DWORD *)(a2 + 32) = v4;
  *(void *)(a2 + 24) = *MEMORY[0x1895F8468];
  return result;
}

uint64_t _Xwifi_manager_client_dispatch_preferred_networks_change(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 && *(_DWORD *)(result + 24) == 1 && *(_DWORD *)(result + 4) == 56)
  {
    if (*(_BYTE *)(result + 39) == 1)
    {
      unsigned int v3 = *(_DWORD *)(result + 40);
      if (v3 == *(_DWORD *)(result + 52))
      {
        Class result = _wifi_manager_client_dispatch_preferred_networks_change( *(_DWORD *)(result + 12),  *(UInt8 **)(result + 28),  v3);
        *(_DWORD *)(a2 + 32) = result;
        return result;
      }
    }

    int v4 = -300;
  }

  else
  {
    int v4 = -304;
  }

  *(_DWORD *)(a2 + 32) = v4;
  *(void *)(a2 + 24) = *MEMORY[0x1895F8468];
  return result;
}

_DWORD *_Xwifi_manager_client_dispatch_managed_apple_id_state_change(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 36)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(void *)(a2 + 24) = *MEMORY[0x1895F8468];
  }

  else
  {
    Class result = (_DWORD *)_wifi_manager_client_dispatch_managed_apple_id_state_change();
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
  }

  return result;
}

uint64_t _Xwifi_manager_client_dispatch_ui_event(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 && *(_DWORD *)(result + 24) == 1 && *(_DWORD *)(result + 4) == 56)
  {
    if (*(_BYTE *)(result + 39) == 1)
    {
      unsigned int v3 = *(_DWORD *)(result + 40);
      if (v3 == *(_DWORD *)(result + 52))
      {
        Class result = _wifi_manager_client_dispatch_ui_event(*(_DWORD *)(result + 12), *(UInt8 **)(result + 28), v3);
        *(_DWORD *)(a2 + 32) = result;
        return result;
      }
    }

    int v4 = -300;
  }

  else
  {
    int v4 = -304;
  }

  *(_DWORD *)(a2 + 32) = v4;
  *(void *)(a2 + 24) = *MEMORY[0x1895F8468];
  return result;
}

uint64_t wifi_manager_client_server(_DWORD *a1, uint64_t a2)
{
  int v2 = a1[2];
  *(_DWORD *)a2 = *a1 & 0x1F;
  *(_DWORD *)(a2 + 4) = 36;
  int v3 = a1[5] + 100;
  *(_DWORD *)(a2 + _Block_object_dispose(va, 8) = v2;
  *(_DWORD *)(a2 + 12) = 0;
  *(_DWORD *)(a2 + 16) = 0;
  *(_DWORD *)(a2 + 20) = v3;
  int v4 = a1[5];
  if ((v4 - 96974) >= 0xFFFFFFF2
    && (int v5 = (void (*)(void))*(&_wifi_manager_client_subsystem + 5 * (v4 - 96960) + 5)) != 0LL)
  {
    v5();
    return 1LL;
  }

  else
  {
    uint64_t result = 0LL;
    *(void *)(a2 + 24) = *MEMORY[0x1895F8468];
    *(_DWORD *)(a2 + 32) = -303;
  }

  return result;
}

uint64_t wifi_manager_open(int a1, int a2, int a3, int a4, _DWORD *a5, _DWORD *a6)
{
  *(void *)&__int128 v9 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&msg[20] = v9;
  __int128 v16 = v9;
  unint64_t v17 = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&msg[4] = v9;
  *(_DWORD *)&msg[24] = 1;
  *(_DWORD *)&msg[28] = a4;
  LODWORD(v16) = 1157802;
  *(void *)((char *)&v16 + 4) = *MEMORY[0x1895F8468];
  HIDWORD(v16) = a2;
  LODWORD(v17) = a3;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)uint64_t msg = -2147478253;
  *(void *)&msg[16] = 0x1103A00000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t special_reply_port = *(_DWORD *)&msg[12];
  }

  uint64_t v11 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x38u, 0x3Cu, special_reply_port, 0, 0);
  uint64_t v12 = v11;
  if ((v11 - 268435458) > 0xE || ((1 << (v11 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v11)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        uint64_t v12 = 4294966988LL;
      }

      else if (*(_DWORD *)&msg[20] == 69790)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 36)
          {
            uint64_t v12 = 4294966996LL;
            if (*(_DWORD *)&msg[32])
            {
              if (*(_DWORD *)&msg[8]) {
                uint64_t v12 = 4294966996LL;
              }
              else {
                uint64_t v12 = *(unsigned int *)&msg[32];
              }
            }
          }

          else
          {
            uint64_t v12 = 4294966996LL;
          }

          goto LABEL_23;
        }

        uint64_t v12 = 4294966996LL;
        if (*(_DWORD *)&msg[24] == 1 && *(_DWORD *)&msg[4] == 52 && !*(_DWORD *)&msg[8] && WORD1(v16) << 16 == 1114112)
        {
          uint64_t v12 = 0LL;
          int v13 = HIDWORD(v16);
          *a5 = *(_DWORD *)&msg[28];
          *a6 = v13;
          return v12;
        }
      }

      else
      {
        uint64_t v12 = 4294966995LL;
      }

uint64_t wifi_manager_close(mach_port_t a1)
{
  *(void *)&msg.msgh_bits = 0xAAAAAAAA00000013LL;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 69691;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1895FD5F8]) {
    voucher_mach_msg_set(&msg);
  }
  return mach_msg(&msg, 2097153, 0x18u, 0, 0, 0, 0);
}

uint64_t wifi_manager_copy_devices(int a1, void *a2, _DWORD *a3)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  *(void *)&__int128 v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v13[12] = v6;
  *(_OWORD *)int v13 = v6;
  *(_OWORD *)&msg[20] = v6;
  *(_DWORD *)&msg[4] = -1431655766;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)mach_msg_header_t msg = 5395;
  *(void *)&msg[16] = 0x1103C00000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t special_reply_port = *(_DWORD *)&msg[12];
  }

  uint64_t v8 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x18u, 0x40u, special_reply_port, 0, 0);
  uint64_t v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v8)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        uint64_t v9 = 4294966988LL;
      }

      else if (*(_DWORD *)&msg[20] == 69792)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 36)
          {
            uint64_t v9 = 4294966996LL;
            if (*(_DWORD *)&msg[32])
            {
              if (*(_DWORD *)&msg[8]) {
                uint64_t v9 = 4294966996LL;
              }
              else {
                uint64_t v9 = *(unsigned int *)&msg[32];
              }
            }
          }

          else
          {
            uint64_t v9 = 4294966996LL;
          }

          goto LABEL_24;
        }

        uint64_t v9 = 4294966996LL;
        if (*(_DWORD *)&msg[24] == 1 && *(_DWORD *)&msg[4] == 56 && !*(_DWORD *)&msg[8] && v13[3] == 1)
        {
          int v10 = *(_DWORD *)&v13[4];
          if (*(_DWORD *)&v13[4] == *(_DWORD *)&v13[16])
          {
            uint64_t v9 = 0LL;
            *a2 = *(void *)&msg[28];
            *a3 = v10;
            return v9;
          }
        }
      }

      else
      {
        uint64_t v9 = 4294966995LL;
      }

uint64_t wifi_manager_copy_networks(int a1, int a2, void *a3, _DWORD *a4)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  *(void *)&__int128 v7 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&msg[20] = v7;
  *(_OWORD *)&v14[12] = v7;
  *(_OWORD *)uint64_t v14 = v7;
  *(_OWORD *)&msg[4] = v7;
  *(void *)&msg[24] = *MEMORY[0x1895F8468];
  *(_DWORD *)&msg[32] = a2;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)mach_msg_header_t msg = 5395;
  *(void *)&msg[16] = 0x1103D00000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t special_reply_port = *(_DWORD *)&msg[12];
  }

  uint64_t v9 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x24u, 0x40u, special_reply_port, 0, 0);
  uint64_t v10 = v9;
  if ((v9 - 268435458) > 0xE || ((1 << (v9 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v9)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        uint64_t v10 = 4294966988LL;
      }

      else if (*(_DWORD *)&msg[20] == 69793)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 36)
          {
            uint64_t v10 = 4294966996LL;
            if (*(_DWORD *)&msg[32])
            {
              if (*(_DWORD *)&msg[8]) {
                uint64_t v10 = 4294966996LL;
              }
              else {
                uint64_t v10 = *(unsigned int *)&msg[32];
              }
            }
          }

          else
          {
            uint64_t v10 = 4294966996LL;
          }

          goto LABEL_24;
        }

        uint64_t v10 = 4294966996LL;
        if (*(_DWORD *)&msg[24] == 1 && *(_DWORD *)&msg[4] == 56 && !*(_DWORD *)&msg[8] && v14[3] == 1)
        {
          int v11 = *(_DWORD *)&v14[4];
          if (*(_DWORD *)&v14[4] == *(_DWORD *)&v14[16])
          {
            uint64_t v10 = 0LL;
            *a3 = *(void *)&msg[28];
            *a4 = v11;
            return v10;
          }
        }
      }

      else
      {
        uint64_t v10 = 4294966995LL;
      }

uint64_t wifi_manager_copy_property(int a1, uint64_t a2, int a3, void *a4, _DWORD *a5)
{
  *(void *)&__int128 v8 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&rcv_name[16] = 0x1AAAAAAAALL;
  *(_DWORD *)uint64_t v19 = -1431655766;
  *(_OWORD *)&v19[4] = v8;
  *(_OWORD *)rcv_mach_port_name_t name = v8;
  uint64_t v16 = a2;
  int v17 = 27918592;
  int v18 = a3;
  *(void *)uint64_t v19 = *MEMORY[0x1895F8468];
  *(_DWORD *)&v19[8] = a3;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&rcv_name[4] = a1;
  *(_DWORD *)&rcv_name[8] = special_reply_port;
  int v14 = -2147478253;
  *(void *)&rcv_name[12] = 0x1103E00000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v14);
    mach_port_name_t special_reply_port = *(_DWORD *)&rcv_name[8];
  }

  uint64_t v10 = mach_msg((mach_msg_header_t *)&v14, 3162115, 0x38u, 0x40u, special_reply_port, 0, 0);
  uint64_t v11 = v10;
  if ((v10 - 268435458) > 0xE || ((1 << (v10 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v10)
    {
      if (*(_DWORD *)&rcv_name[16] == 71)
      {
        uint64_t v11 = 4294966988LL;
      }

      else if (*(_DWORD *)&rcv_name[16] == 69794)
      {
        if ((v14 & 0x80000000) == 0)
        {
          if (*(_DWORD *)rcv_name == 36)
          {
            uint64_t v11 = 4294966996LL;
            if (HIDWORD(v16))
            {
              if (*(_DWORD *)&rcv_name[4]) {
                uint64_t v11 = 4294966996LL;
              }
              else {
                uint64_t v11 = HIDWORD(v16);
              }
            }
          }

          else
          {
            uint64_t v11 = 4294966996LL;
          }

          goto LABEL_24;
        }

        uint64_t v11 = 4294966996LL;
        if (*(_DWORD *)&rcv_name[20] == 1 && *(_DWORD *)rcv_name == 56 && !*(_DWORD *)&rcv_name[4] && HIBYTE(v17) == 1)
        {
          int v12 = v18;
          if (v18 == *(_DWORD *)&v19[8])
          {
            uint64_t v11 = 0LL;
            *a4 = v16;
            *a5 = v12;
            return v11;
          }
        }
      }

      else
      {
        uint64_t v11 = 4294966995LL;
      }

uint64_t wifi_manager_set_property(mach_port_t a1, uint64_t a2, int a3, uint64_t a4, int a5, int *a6)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  int v14 = 2;
  uint64_t v15 = a2;
  int v16 = 27918592;
  int v17 = a3;
  uint64_t v18 = a4;
  int v19 = 27918592;
  int v20 = a5;
  uint64_t v21 = *MEMORY[0x1895F8468];
  int v22 = a3;
  int v23 = a5;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  *(void *)&msg.msgh_bits = 0xAAAAAAAA80001513LL;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  *(void *)&msg.msgh_voucher_port = 0x1103F00000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }

  uint64_t v9 = mach_msg(&msg, 3162115, 0x4Cu, 0x30u, special_reply_port, 0, 0);
  uint64_t v10 = v9;
  if ((v9 - 268435458) > 0xE || ((1 << (v9 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v9)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v10 = 4294966988LL;
      }

      else if (msg.msgh_id == 69795)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 40)
          {
            if (!msg.msgh_remote_port)
            {
              uint64_t v10 = HIDWORD(v15);
              if (!HIDWORD(v15))
              {
                *a6 = v16;
                return v10;
              }

              goto LABEL_22;
            }
          }

          else if (msg.msgh_size == 36)
          {
            if (msg.msgh_remote_port) {
              BOOL v11 = 1;
            }
            else {
              BOOL v11 = HIDWORD(v15) == 0;
            }
            if (v11) {
              uint64_t v10 = 4294966996LL;
            }
            else {
              uint64_t v10 = HIDWORD(v15);
            }
            goto LABEL_22;
          }
        }

        uint64_t v10 = 4294966996LL;
      }

      else
      {
        uint64_t v10 = 4294966995LL;
      }

LABEL_22:
      mach_msg_destroy(&msg);
      return v10;
    }

    mig_dealloc_special_reply_port();
  }

  return v10;
}

      mach_msg_destroy(&v11);
      return v8;
    }

    mig_dealloc_special_reply_port();
  }

  return v8;
}

      mach_msg_destroy((mach_msg_header_t *)&v10);
      return v7;
    }

    mig_dealloc_special_reply_port();
  }

  return v7;
}

      mach_msg_destroy((mach_msg_header_t *)&v10);
      return v7;
    }

    mig_dealloc_special_reply_port();
  }

  return v7;
}

      mach_msg_destroy((mach_msg_header_t *)&v10);
      return v7;
    }

    mig_dealloc_special_reply_port();
  }

  return v7;
}

      mach_msg_destroy((mach_msg_header_t *)&v10);
      return v7;
    }

    mig_dealloc_special_reply_port();
  }

  return v7;
}

      mach_msg_destroy((mach_msg_header_t *)&v11);
      return v8;
    }

    mig_dealloc_special_reply_port();
  }

  return v8;
}

      mach_msg_destroy((mach_msg_header_t *)&v10);
      return v7;
    }

    mig_dealloc_special_reply_port();
  }

  return v7;
}

      mach_msg_destroy((mach_msg_header_t *)&v10);
      return v7;
    }

    mig_dealloc_special_reply_port();
  }

  return v7;
}

      mach_msg_destroy((mach_msg_header_t *)&v10);
      return v7;
    }

    mig_dealloc_special_reply_port();
  }

  return v7;
}

      mach_msg_destroy((mach_msg_header_t *)&v10);
      return v7;
    }

    mig_dealloc_special_reply_port();
  }

  return v7;
}

      mach_msg_destroy((mach_msg_header_t *)&v10);
      return v7;
    }

    mig_dealloc_special_reply_port();
  }

  return v7;
}

      mach_msg_destroy((mach_msg_header_t *)&v10);
      return v7;
    }

    mig_dealloc_special_reply_port();
  }

  return v7;
}

      mach_msg_destroy((mach_msg_header_t *)msg);
      return v7;
    }

    mig_dealloc_special_reply_port();
  }

  return v7;
}

      mach_msg_destroy((mach_msg_header_t *)&v10);
      return v7;
    }

    mig_dealloc_special_reply_port();
  }

  return v7;
}

      mach_msg_destroy((mach_msg_header_t *)&v10);
      return v7;
    }

    mig_dealloc_special_reply_port();
  }

  return v7;
}

      mach_msg_destroy((mach_msg_header_t *)&v10);
      return v7;
    }

    mig_dealloc_special_reply_port();
  }

  return v7;
}

      mach_msg_destroy(&v11);
      return v8;
    }

    mig_dealloc_special_reply_port();
  }

  return v8;
}

      mach_msg_destroy(&msg);
      return v12;
    }

    mig_dealloc_special_reply_port();
  }

  return v12;
}

      mach_msg_destroy(&v11);
      return v8;
    }

    mig_dealloc_special_reply_port();
  }

  return v8;
}

      mach_msg_destroy(&msg);
      return v9;
    }

    mig_dealloc_special_reply_port();
  }

  return v9;
}

      mach_msg_destroy(&msg);
      return v10;
    }

    mig_dealloc_special_reply_port();
  }

  return v10;
}

      mach_msg_destroy(&msg);
      return v10;
    }

    mig_dealloc_special_reply_port();
  }

  return v10;
}

      mach_msg_destroy(&msg);
      return v11;
    }

    mig_dealloc_special_reply_port();
  }

  return v11;
}

      mach_msg_destroy(&msg);
      return v10;
    }

    mig_dealloc_special_reply_port();
  }

  return v10;
}

      mach_msg_destroy(&msg);
      return v9;
    }

    mig_dealloc_special_reply_port();
  }

  return v9;
}

      mach_msg_destroy(&v11);
      return v8;
    }

    mig_dealloc_special_reply_port();
  }

  return v8;
}

      mach_msg_destroy(&msg);
      return v12;
    }

    mig_dealloc_special_reply_port();
  }

  return v12;
}

      mach_msg_destroy(&msg);
      return v11;
    }

    mig_dealloc_special_reply_port();
  }

  return v11;
}

      mach_msg_destroy(&msg);
      return v11;
    }

    mig_dealloc_special_reply_port();
  }

  return v11;
}

      mach_msg_destroy(&msg);
      return v11;
    }

    mig_dealloc_special_reply_port();
  }

  return v11;
}

      mach_msg_destroy(&msg);
      return v10;
    }

    mig_dealloc_special_reply_port();
  }

  return v10;
}

      mach_msg_destroy((mach_msg_header_t *)&v10);
      return v7;
    }

    mig_dealloc_special_reply_port();
  }

  return v7;
}

      mach_msg_destroy((mach_msg_header_t *)&v10);
      return v7;
    }

    mig_dealloc_special_reply_port();
  }

  return v7;
}

      mach_msg_destroy(&msg);
      return v10;
    }

    mig_dealloc_special_reply_port();
  }

  return v10;
}

      mach_msg_destroy((mach_msg_header_t *)&v10);
      return v7;
    }

    mig_dealloc_special_reply_port();
  }

  return v7;
}

      mach_msg_destroy(&v11);
      return v8;
    }

    mig_dealloc_special_reply_port();
  }

  return v8;
}

      mach_msg_destroy((mach_msg_header_t *)&v10);
      return v7;
    }

    mig_dealloc_special_reply_port();
  }

  return v7;
}

      mach_msg_destroy((mach_msg_header_t *)&v10);
      return v7;
    }

    mig_dealloc_special_reply_port();
  }

  return v7;
}

      mach_msg_destroy((mach_msg_header_t *)&v10);
      return v7;
    }

    mig_dealloc_special_reply_port();
  }

  return v7;
}

      mach_msg_destroy((mach_msg_header_t *)&v10);
      return v7;
    }

    mig_dealloc_special_reply_port();
  }

  return v7;
}

      mach_msg_destroy((mach_msg_header_t *)&v10);
      return v7;
    }

    mig_dealloc_special_reply_port();
  }

  return v7;
}

      mach_msg_destroy((mach_msg_header_t *)&v10);
      return v7;
    }

    mig_dealloc_special_reply_port();
  }

  return v7;
}

      mach_msg_destroy(&msg);
      return v9;
    }

    mig_dealloc_special_reply_port();
  }

  return v9;
}

      mach_msg_destroy(&v13);
      return v10;
    }

    mig_dealloc_special_reply_port();
  }

  return v10;
}

      mach_msg_destroy((mach_msg_header_t *)&v10);
      return v7;
    }

    mig_dealloc_special_reply_port();
  }

  return v7;
}

      mach_msg_destroy((mach_msg_header_t *)&v10);
      return v7;
    }

    mig_dealloc_special_reply_port();
  }

  return v7;
}

      mach_msg_destroy(&msg);
      return v12;
    }

    mig_dealloc_special_reply_port();
  }

  return v12;
}

      mach_msg_destroy((mach_msg_header_t *)&v10);
      return v7;
    }

    mig_dealloc_special_reply_port();
  }

  return v7;
}

      mach_msg_destroy((mach_msg_header_t *)&v10);
      return v7;
    }

    mig_dealloc_special_reply_port();
  }

  return v7;
}

      mach_msg_destroy((mach_msg_header_t *)&v10);
      return v7;
    }

    mig_dealloc_special_reply_port();
  }

  return v7;
}

      mach_msg_destroy(&msg);
      return v11;
    }

    mig_dealloc_special_reply_port();
  }

  return v11;
}

      mach_msg_destroy(&v11);
      return v8;
    }

    mig_dealloc_special_reply_port();
  }

  return v8;
}

      mach_msg_destroy(&v11);
      return v8;
    }

    mig_dealloc_special_reply_port();
  }

  return v8;
}

      mach_msg_destroy((mach_msg_header_t *)&v10);
      return v7;
    }

    mig_dealloc_special_reply_port();
  }

  return v7;
}

      mach_msg_destroy((mach_msg_header_t *)&v10);
      return v7;
    }

    mig_dealloc_special_reply_port();
  }

  return v7;
}

      mach_msg_destroy(&v11);
      return v8;
    }

    mig_dealloc_special_reply_port();
  }

  return v8;
}

      mach_msg_destroy((mach_msg_header_t *)&v10);
      return v7;
    }

    mig_dealloc_special_reply_port();
  }

  return v7;
}

uint64_t wifi_manager_add_network(int a1, uint64_t a2, int a3)
{
  uint64_t v5 = a2;
  int v6 = 27918592;
  int v7 = a3;
  uint64_t v8 = *MEMORY[0x1895F8468];
  int v9 = a3;
  *(void *)mach_msg_header_t msg = 0xAAAAAAAA80000013LL;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_1865BD2A0;
  if (MEMORY[0x1895FD5F8]) {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  }
  return mach_msg((mach_msg_header_t *)msg, 2097153, 0x38u, 0, 0, 0, 0);
}

uint64_t wifi_manager_add_network_async(int a1, uint64_t a2, int a3, uint64_t a4, int a5)
{
  uint64_t v9 = a2;
  int v10 = 27918592;
  int v11 = a3;
  uint64_t v12 = a4;
  int v13 = 27918592;
  int v14 = a5;
  uint64_t v15 = *MEMORY[0x1895F8468];
  int v16 = a3;
  int v17 = a5;
  unint64_t v6 = 0xAAAAAAAA80000013LL;
  int v7 = a1;
  __int128 v8 = xmmword_1865BD2B0;
  if (MEMORY[0x1895FD5F8]) {
    voucher_mach_msg_set((mach_msg_header_t *)&v6);
  }
  return mach_msg((mach_msg_header_t *)&v6, 2097153, 0x4Cu, 0, 0, 0, 0);
}

uint64_t wifi_manager_update_network(int a1, uint64_t a2, int a3)
{
  uint64_t v5 = a2;
  int v6 = 27918592;
  int v7 = a3;
  uint64_t v8 = *MEMORY[0x1895F8468];
  int v9 = a3;
  *(void *)mach_msg_header_t msg = 0xAAAAAAAA80000013LL;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_1865BD2C0;
  if (MEMORY[0x1895FD5F8]) {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  }
  return mach_msg((mach_msg_header_t *)msg, 2097153, 0x38u, 0, 0, 0, 0);
}

uint64_t wifi_manager_remove_network(int a1, uint64_t a2, int a3, int a4)
{
  uint64_t v8 = a2;
  int v9 = 27918592;
  int v10 = a3;
  uint64_t v11 = *MEMORY[0x1895F8468];
  int v12 = a3;
  int v13 = a4;
  unint64_t v5 = 0xAAAAAAAA80000013LL;
  int v6 = a1;
  __int128 v7 = xmmword_1865BD2D0;
  if (MEMORY[0x1895FD5F8]) {
    voucher_mach_msg_set((mach_msg_header_t *)&v5);
  }
  return mach_msg((mach_msg_header_t *)&v5, 2097153, 0x3Cu, 0, 0, 0, 0);
}

uint64_t wifi_manager_remove_networks_with_bundle_identifier(int a1, uint64_t a2, int a3)
{
  uint64_t v5 = a2;
  int v6 = 27918592;
  int v7 = a3;
  uint64_t v8 = *MEMORY[0x1895F8468];
  int v9 = a3;
  *(void *)mach_msg_header_t msg = 0xAAAAAAAA80000013LL;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_1865BD2E0;
  if (MEMORY[0x1895FD5F8]) {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  }
  return mach_msg((mach_msg_header_t *)msg, 2097153, 0x38u, 0, 0, 0, 0);
}

uint64_t wifi_manager_set_networks_state_with_bundle_identifier(int a1, uint64_t a2, int a3, int a4)
{
  uint64_t v8 = a2;
  int v9 = 27918592;
  int v10 = a3;
  uint64_t v11 = *MEMORY[0x1895F8468];
  int v12 = a3;
  int v13 = a4;
  unint64_t v5 = 0xAAAAAAAA80000013LL;
  int v6 = a1;
  __int128 v7 = xmmword_1865BD2F0;
  if (MEMORY[0x1895FD5F8]) {
    voucher_mach_msg_set((mach_msg_header_t *)&v5);
  }
  return mach_msg((mach_msg_header_t *)&v5, 2097153, 0x3Cu, 0, 0, 0, 0);
}

uint64_t wifi_manager_set_network_state(int a1, uint64_t a2, int a3, int a4, int a5)
{
  uint64_t v9 = a2;
  int v10 = 27918592;
  int v11 = a3;
  uint64_t v12 = *MEMORY[0x1895F8468];
  int v13 = a3;
  int v14 = a4;
  int v15 = a5;
  unint64_t v6 = 0xAAAAAAAA80000013LL;
  int v7 = a1;
  __int128 v8 = xmmword_1865BD300;
  if (MEMORY[0x1895FD5F8]) {
    voucher_mach_msg_set((mach_msg_header_t *)&v6);
  }
  return mach_msg((mach_msg_header_t *)&v6, 2097153, 0x40u, 0, 0, 0, 0);
}

uint64_t wifi_manager_get_network_state(mach_port_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  int v12 = 1;
  uint64_t v13 = a2;
  int v14 = 27918592;
  int v15 = a3;
  uint64_t v16 = *MEMORY[0x1895F8468];
  int v17 = a3;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  *(void *)&v11.msgh_bits = 0xAAAAAAAA80001513LL;
  v11.mach_port_t msgh_remote_port = a1;
  v11.msgh_local_port = special_reply_port;
  *(void *)&v11.msgh_voucher_port = 0x1104700000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&v11);
    mach_port_t special_reply_port = v11.msgh_local_port;
  }

  uint64_t v7 = mach_msg(&v11, 3162115, 0x38u, 0x30u, special_reply_port, 0, 0);
  uint64_t v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v7)
    {
      if (v11.msgh_id == 71)
      {
        uint64_t v8 = 4294966988LL;
      }

      else if (v11.msgh_id == 69803)
      {
        if ((v11.msgh_bits & 0x80000000) == 0)
        {
          if (v11.msgh_size == 40)
          {
            if (!v11.msgh_remote_port)
            {
              uint64_t v8 = HIDWORD(v13);
              if (!HIDWORD(v13))
              {
                *a4 = v14;
                return v8;
              }

              goto LABEL_22;
            }
          }

          else if (v11.msgh_size == 36)
          {
            if (v11.msgh_remote_port) {
              BOOL v9 = 1;
            }
            else {
              BOOL v9 = HIDWORD(v13) == 0;
            }
            if (v9) {
              uint64_t v8 = 4294966996LL;
            }
            else {
              uint64_t v8 = HIDWORD(v13);
            }
            goto LABEL_22;
          }
        }

        uint64_t v8 = 4294966996LL;
      }

      else
      {
        uint64_t v8 = 4294966995LL;
      }

uint64_t wifi_manager_dispatch_notification_response(int a1, int a2, int a3, uint64_t a4, int a5)
{
  uint64_t v9 = a4;
  int v10 = 27918592;
  int v11 = a5;
  uint64_t v12 = *MEMORY[0x1895F8468];
  int v13 = a2;
  int v14 = a3;
  int v15 = a5;
  unint64_t v6 = 0xAAAAAAAA80000013LL;
  int v7 = a1;
  __int128 v8 = xmmword_1865BD310;
  if (MEMORY[0x1895FD5F8]) {
    voucher_mach_msg_set((mach_msg_header_t *)&v6);
  }
  return mach_msg((mach_msg_header_t *)&v6, 2097153, 0x40u, 0, 0, 0, 0);
}

uint64_t wifi_manager_indicate_carplay_hid_event_received(int a1, int a2, int a3, uint64_t a4, int a5)
{
  uint64_t v9 = a4;
  int v10 = 27918592;
  int v11 = a5;
  uint64_t v12 = *MEMORY[0x1895F8468];
  int v13 = a2;
  int v14 = a3;
  int v15 = a5;
  unint64_t v6 = 0xAAAAAAAA80000013LL;
  int v7 = a1;
  __int128 v8 = xmmword_1865BD320;
  if (MEMORY[0x1895FD5F8]) {
    voucher_mach_msg_set((mach_msg_header_t *)&v6);
  }
  return mach_msg((mach_msg_header_t *)&v6, 2097153, 0x40u, 0, 0, 0, 0);
}

uint64_t wifi_manager_set_enable_state(mach_port_t a1, int a2)
{
  uint64_t v4 = *MEMORY[0x1895F8468];
  int v5 = a2;
  *(void *)&msg.msgh_bits = 0xAAAAAAAA00000013LL;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 69706;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1895FD5F8]) {
    voucher_mach_msg_set(&msg);
  }
  return mach_msg(&msg, 2097153, 0x24u, 0, 0, 0, 0);
}

uint64_t wifi_manager_set_power(mach_port_t a1, int a2)
{
  uint64_t v4 = *MEMORY[0x1895F8468];
  int v5 = a2;
  *(void *)&msg.msgh_bits = 0xAAAAAAAA00000013LL;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 69707;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1895FD5F8]) {
    voucher_mach_msg_set(&msg);
  }
  return mach_msg(&msg, 2097153, 0x24u, 0, 0, 0, 0);
}

uint64_t wifi_manager_get_power(int a1, _DWORD *a2)
{
  *(void *)&__int128 v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&rcv_name_12[16] = v4;
  *(_OWORD *)&rcv_name_12[4] = v4;
  rcv_mach_port_name_t name = -1431655766;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  int rcv_name_4 = a1;
  mach_port_name_t rcv_name_8 = special_reply_port;
  int v10 = 5395;
  *(void *)rcv_name_12 = 0x1104C00000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v10);
    mach_port_name_t special_reply_port = rcv_name_8;
  }

  uint64_t v6 = mach_msg((mach_msg_header_t *)&v10, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  uint64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v6)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        uint64_t v7 = 4294966988LL;
      }

      else if (*(_DWORD *)&rcv_name_12[4] == 69808)
      {
        if ((v10 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = *(_DWORD *)&rcv_name_12[20];
                return v7;
              }

              goto LABEL_22;
            }
          }

          else if (rcv_name == 36)
          {
            if (rcv_name_4) {
              BOOL v8 = 1;
            }
            else {
              BOOL v8 = *(_DWORD *)&rcv_name_12[16] == 0;
            }
            if (v8) {
              uint64_t v7 = 4294966996LL;
            }
            else {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
            }
            goto LABEL_22;
          }
        }

        uint64_t v7 = 4294966996LL;
      }

      else
      {
        uint64_t v7 = 4294966995LL;
      }

uint64_t wifi_manager_set_power_ext(mach_port_t a1, int a2)
{
  uint64_t v4 = *MEMORY[0x1895F8468];
  int v5 = a2;
  *(void *)&msg.msgh_bits = 0xAAAAAAAA00000013LL;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 69709;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1895FD5F8]) {
    voucher_mach_msg_set(&msg);
  }
  return mach_msg(&msg, 2097153, 0x24u, 0, 0, 0, 0);
}

uint64_t wifi_manager_get_ask_to_join_state(int a1, _DWORD *a2)
{
  *(void *)&__int128 v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&rcv_name_12[16] = v4;
  *(_OWORD *)&rcv_name_12[4] = v4;
  rcv_mach_port_name_t name = -1431655766;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  int rcv_name_4 = a1;
  mach_port_name_t rcv_name_8 = special_reply_port;
  int v10 = 5395;
  *(void *)rcv_name_12 = 0x1104E00000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v10);
    mach_port_name_t special_reply_port = rcv_name_8;
  }

  uint64_t v6 = mach_msg((mach_msg_header_t *)&v10, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  uint64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v6)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        uint64_t v7 = 4294966988LL;
      }

      else if (*(_DWORD *)&rcv_name_12[4] == 69810)
      {
        if ((v10 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = *(_DWORD *)&rcv_name_12[20];
                return v7;
              }

              goto LABEL_22;
            }
          }

          else if (rcv_name == 36)
          {
            if (rcv_name_4) {
              BOOL v8 = 1;
            }
            else {
              BOOL v8 = *(_DWORD *)&rcv_name_12[16] == 0;
            }
            if (v8) {
              uint64_t v7 = 4294966996LL;
            }
            else {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
            }
            goto LABEL_22;
          }
        }

        uint64_t v7 = 4294966996LL;
      }

      else
      {
        uint64_t v7 = 4294966995LL;
      }

uint64_t wifi_manager_set_mis_state(mach_port_t a1, int a2)
{
  uint64_t v4 = *MEMORY[0x1895F8468];
  int v5 = a2;
  *(void *)&msg.msgh_bits = 0xAAAAAAAA00000013LL;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 69711;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1895FD5F8]) {
    voucher_mach_msg_set(&msg);
  }
  return mach_msg(&msg, 2097153, 0x24u, 0, 0, 0, 0);
}

uint64_t wifi_manager_get_mis_state(int a1, _DWORD *a2)
{
  *(void *)&__int128 v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&rcv_name_12[16] = v4;
  *(_OWORD *)&rcv_name_12[4] = v4;
  rcv_mach_port_name_t name = -1431655766;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  int rcv_name_4 = a1;
  mach_port_name_t rcv_name_8 = special_reply_port;
  int v10 = 5395;
  *(void *)rcv_name_12 = 0x1105000000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v10);
    mach_port_name_t special_reply_port = rcv_name_8;
  }

  uint64_t v6 = mach_msg((mach_msg_header_t *)&v10, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  uint64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v6)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        uint64_t v7 = 4294966988LL;
      }

      else if (*(_DWORD *)&rcv_name_12[4] == 69812)
      {
        if ((v10 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = *(_DWORD *)&rcv_name_12[20];
                return v7;
              }

              goto LABEL_22;
            }
          }

          else if (rcv_name == 36)
          {
            if (rcv_name_4) {
              BOOL v8 = 1;
            }
            else {
              BOOL v8 = *(_DWORD *)&rcv_name_12[16] == 0;
            }
            if (v8) {
              uint64_t v7 = 4294966996LL;
            }
            else {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
            }
            goto LABEL_22;
          }
        }

        uint64_t v7 = 4294966996LL;
      }

      else
      {
        uint64_t v7 = 4294966995LL;
      }

uint64_t wifi_manager_set_mis_discovery_state( mach_port_t a1, int a2, int a3, int a4, int a5, uint64_t a6, int a7, uint64_t a8, int a9, int a10)
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  int v16 = 2;
  uint64_t v17 = a6;
  int v18 = 27918592;
  int v19 = a7;
  uint64_t v20 = a8;
  int v21 = 27918592;
  int v22 = a9;
  uint64_t v23 = *MEMORY[0x1895F8468];
  int v24 = a2;
  int v25 = a3;
  int v26 = a4;
  int v27 = a5;
  int v28 = a7;
  int v29 = a9;
  int v30 = a10;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  *(void *)&msg.msgh_bits = 0xAAAAAAAA80001513LL;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  *(void *)&msg.msgh_voucher_port = 0x1105100000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }

  uint64_t v12 = mach_msg(&msg, 3162115, 0x60u, 0x2Cu, special_reply_port, 0, 0);
  uint64_t v13 = v12;
  if ((v12 - 268435458) > 0xE || ((1 << (v12 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v12)
    {
      mig_dealloc_special_reply_port();
      return v13;
    }

    if (msg.msgh_id == 71)
    {
      uint64_t v13 = 4294966988LL;
    }

    else if (msg.msgh_id == 69813)
    {
      uint64_t v13 = 4294966996LL;
      if ((msg.msgh_bits & 0x80000000) == 0 && msg.msgh_size == 36 && !msg.msgh_remote_port)
      {
        uint64_t v13 = HIDWORD(v17);
        if (!HIDWORD(v17)) {
          return v13;
        }
      }
    }

    else
    {
      uint64_t v13 = 4294966995LL;
    }

    mach_msg_destroy(&msg);
  }

  return v13;
}

uint64_t wifi_manager_get_mis_discovery_state(int a1, _DWORD *a2)
{
  *(void *)&__int128 v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&rcv_name_12[16] = v4;
  *(_OWORD *)&rcv_name_12[4] = v4;
  rcv_mach_port_name_t name = -1431655766;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  int rcv_name_4 = a1;
  mach_port_name_t rcv_name_8 = special_reply_port;
  int v10 = 5395;
  *(void *)rcv_name_12 = 0x1105200000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v10);
    mach_port_name_t special_reply_port = rcv_name_8;
  }

  uint64_t v6 = mach_msg((mach_msg_header_t *)&v10, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  uint64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v6)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        uint64_t v7 = 4294966988LL;
      }

      else if (*(_DWORD *)&rcv_name_12[4] == 69814)
      {
        if ((v10 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = *(_DWORD *)&rcv_name_12[20];
                return v7;
              }

              goto LABEL_22;
            }
          }

          else if (rcv_name == 36)
          {
            if (rcv_name_4) {
              BOOL v8 = 1;
            }
            else {
              BOOL v8 = *(_DWORD *)&rcv_name_12[16] == 0;
            }
            if (v8) {
              uint64_t v7 = 4294966996LL;
            }
            else {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
            }
            goto LABEL_22;
          }
        }

        uint64_t v7 = 4294966996LL;
      }

      else
      {
        uint64_t v7 = 4294966995LL;
      }

uint64_t wifi_manager_set_wow_state(mach_port_t a1, int a2)
{
  uint64_t v4 = *MEMORY[0x1895F8468];
  int v5 = a2;
  *(void *)&msg.msgh_bits = 0xAAAAAAAA00000013LL;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 69715;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1895FD5F8]) {
    voucher_mach_msg_set(&msg);
  }
  return mach_msg(&msg, 2097153, 0x24u, 0, 0, 0, 0);
}

uint64_t wifi_manager_copy_wow_state(int a1, void *a2, _DWORD *a3)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  *(void *)&__int128 v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v13[12] = v6;
  *(_OWORD *)uint64_t v13 = v6;
  *(_OWORD *)&msg[20] = v6;
  *(_DWORD *)&msg[4] = -1431655766;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)mach_msg_header_t msg = 5395;
  *(void *)&msg[16] = 0x1105400000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t special_reply_port = *(_DWORD *)&msg[12];
  }

  uint64_t v8 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x18u, 0x40u, special_reply_port, 0, 0);
  uint64_t v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v8)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        uint64_t v9 = 4294966988LL;
      }

      else if (*(_DWORD *)&msg[20] == 69816)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 36)
          {
            uint64_t v9 = 4294966996LL;
            if (*(_DWORD *)&msg[32])
            {
              if (*(_DWORD *)&msg[8]) {
                uint64_t v9 = 4294966996LL;
              }
              else {
                uint64_t v9 = *(unsigned int *)&msg[32];
              }
            }
          }

          else
          {
            uint64_t v9 = 4294966996LL;
          }

          goto LABEL_24;
        }

        uint64_t v9 = 4294966996LL;
        if (*(_DWORD *)&msg[24] == 1 && *(_DWORD *)&msg[4] == 56 && !*(_DWORD *)&msg[8] && v13[3] == 1)
        {
          int v10 = *(_DWORD *)&v13[4];
          if (*(_DWORD *)&v13[4] == *(_DWORD *)&v13[16])
          {
            uint64_t v9 = 0LL;
            *a2 = *(void *)&msg[28];
            *a3 = v10;
            return v9;
          }
        }
      }

      else
      {
        uint64_t v9 = 4294966995LL;
      }

uint64_t wifi_manager_set_quiesce_state(int a1, int a2, _DWORD *a3)
{
  *(void *)&__int128 v5 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&rcv_name[16] = v5;
  *(_OWORD *)&rcv_name[28] = v5;
  *(_OWORD *)rcv_mach_port_name_t name = v5;
  *(void *)&rcv_name[20] = *MEMORY[0x1895F8468];
  *(_DWORD *)&rcv_name[28] = a2;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&rcv_name[4] = a1;
  *(_DWORD *)&rcv_name[8] = special_reply_port;
  int v11 = 5395;
  *(void *)&rcv_name[12] = 0x1105500000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v11);
    mach_port_name_t special_reply_port = *(_DWORD *)&rcv_name[8];
  }

  uint64_t v7 = mach_msg((mach_msg_header_t *)&v11, 3162115, 0x24u, 0x30u, special_reply_port, 0, 0);
  uint64_t v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v7)
    {
      if (*(_DWORD *)&rcv_name[16] == 71)
      {
        uint64_t v8 = 4294966988LL;
      }

      else if (*(_DWORD *)&rcv_name[16] == 69817)
      {
        if ((v11 & 0x80000000) == 0)
        {
          if (*(_DWORD *)rcv_name == 40)
          {
            if (!*(_DWORD *)&rcv_name[4])
            {
              uint64_t v8 = *(unsigned int *)&rcv_name[28];
              if (!*(_DWORD *)&rcv_name[28])
              {
                *a3 = *(_DWORD *)&rcv_name[32];
                return v8;
              }

              goto LABEL_22;
            }
          }

          else if (*(_DWORD *)rcv_name == 36)
          {
            if (*(_DWORD *)&rcv_name[4]) {
              BOOL v9 = 1;
            }
            else {
              BOOL v9 = *(_DWORD *)&rcv_name[28] == 0;
            }
            if (v9) {
              uint64_t v8 = 4294966996LL;
            }
            else {
              uint64_t v8 = *(unsigned int *)&rcv_name[28];
            }
            goto LABEL_22;
          }
        }

        uint64_t v8 = 4294966996LL;
      }

      else
      {
        uint64_t v8 = 4294966995LL;
      }

uint64_t wifi_manager_get_quiesce_state(int a1, _DWORD *a2)
{
  *(void *)&__int128 v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&rcv_name_12[16] = v4;
  *(_OWORD *)&rcv_name_12[4] = v4;
  rcv_mach_port_name_t name = -1431655766;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  int rcv_name_4 = a1;
  mach_port_name_t rcv_name_8 = special_reply_port;
  int v10 = 5395;
  *(void *)rcv_name_12 = 0x1105600000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v10);
    mach_port_name_t special_reply_port = rcv_name_8;
  }

  uint64_t v6 = mach_msg((mach_msg_header_t *)&v10, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  uint64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v6)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        uint64_t v7 = 4294966988LL;
      }

      else if (*(_DWORD *)&rcv_name_12[4] == 69818)
      {
        if ((v10 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = *(_DWORD *)&rcv_name_12[20];
                return v7;
              }

              goto LABEL_22;
            }
          }

          else if (rcv_name == 36)
          {
            if (rcv_name_4) {
              BOOL v8 = 1;
            }
            else {
              BOOL v8 = *(_DWORD *)&rcv_name_12[16] == 0;
            }
            if (v8) {
              uint64_t v7 = 4294966996LL;
            }
            else {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
            }
            goto LABEL_22;
          }
        }

        uint64_t v7 = 4294966996LL;
      }

      else
      {
        uint64_t v7 = 4294966995LL;
      }

uint64_t wifi_manager_get_wow_capability(int a1, _DWORD *a2)
{
  *(void *)&__int128 v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&rcv_name_12[16] = v4;
  *(_OWORD *)&rcv_name_12[4] = v4;
  rcv_mach_port_name_t name = -1431655766;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  int rcv_name_4 = a1;
  mach_port_name_t rcv_name_8 = special_reply_port;
  int v10 = 5395;
  *(void *)rcv_name_12 = 0x1105700000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v10);
    mach_port_name_t special_reply_port = rcv_name_8;
  }

  uint64_t v6 = mach_msg((mach_msg_header_t *)&v10, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  uint64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v6)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        uint64_t v7 = 4294966988LL;
      }

      else if (*(_DWORD *)&rcv_name_12[4] == 69819)
      {
        if ((v10 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = *(_DWORD *)&rcv_name_12[20];
                return v7;
              }

              goto LABEL_22;
            }
          }

          else if (rcv_name == 36)
          {
            if (rcv_name_4) {
              BOOL v8 = 1;
            }
            else {
              BOOL v8 = *(_DWORD *)&rcv_name_12[16] == 0;
            }
            if (v8) {
              uint64_t v7 = 4294966996LL;
            }
            else {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
            }
            goto LABEL_22;
          }
        }

        uint64_t v7 = 4294966996LL;
      }

      else
      {
        uint64_t v7 = 4294966995LL;
      }

uint64_t wifi_manager_get_bgscancache_state(int a1, _DWORD *a2)
{
  *(void *)&__int128 v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&rcv_name_12[16] = v4;
  *(_OWORD *)&rcv_name_12[4] = v4;
  rcv_mach_port_name_t name = -1431655766;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  int rcv_name_4 = a1;
  mach_port_name_t rcv_name_8 = special_reply_port;
  int v10 = 5395;
  *(void *)rcv_name_12 = 0x1105800000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v10);
    mach_port_name_t special_reply_port = rcv_name_8;
  }

  uint64_t v6 = mach_msg((mach_msg_header_t *)&v10, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  uint64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v6)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        uint64_t v7 = 4294966988LL;
      }

      else if (*(_DWORD *)&rcv_name_12[4] == 69820)
      {
        if ((v10 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = *(_DWORD *)&rcv_name_12[20];
                return v7;
              }

              goto LABEL_22;
            }
          }

          else if (rcv_name == 36)
          {
            if (rcv_name_4) {
              BOOL v8 = 1;
            }
            else {
              BOOL v8 = *(_DWORD *)&rcv_name_12[16] == 0;
            }
            if (v8) {
              uint64_t v7 = 4294966996LL;
            }
            else {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
            }
            goto LABEL_22;
          }
        }

        uint64_t v7 = 4294966996LL;
      }

      else
      {
        uint64_t v7 = 4294966995LL;
      }

uint64_t wifi_manager_set_retry_cap(mach_port_t a1, int a2)
{
  uint64_t v4 = *MEMORY[0x1895F8468];
  int v5 = a2;
  *(void *)&msg.msgh_bits = 0xAAAAAAAA00000013LL;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 69721;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1895FD5F8]) {
    voucher_mach_msg_set(&msg);
  }
  return mach_msg(&msg, 2097153, 0x24u, 0, 0, 0, 0);
}

uint64_t wifi_manager_get_retry_cap(int a1, _DWORD *a2)
{
  *(void *)&__int128 v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&rcv_name_12[16] = v4;
  *(_OWORD *)&rcv_name_12[4] = v4;
  rcv_mach_port_name_t name = -1431655766;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  int rcv_name_4 = a1;
  mach_port_name_t rcv_name_8 = special_reply_port;
  int v10 = 5395;
  *(void *)rcv_name_12 = 0x1105A00000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v10);
    mach_port_name_t special_reply_port = rcv_name_8;
  }

  uint64_t v6 = mach_msg((mach_msg_header_t *)&v10, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  uint64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v6)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        uint64_t v7 = 4294966988LL;
      }

      else if (*(_DWORD *)&rcv_name_12[4] == 69822)
      {
        if ((v10 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = *(_DWORD *)&rcv_name_12[20];
                return v7;
              }

              goto LABEL_22;
            }
          }

          else if (rcv_name == 36)
          {
            if (rcv_name_4) {
              BOOL v8 = 1;
            }
            else {
              BOOL v8 = *(_DWORD *)&rcv_name_12[16] == 0;
            }
            if (v8) {
              uint64_t v7 = 4294966996LL;
            }
            else {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
            }
            goto LABEL_22;
          }
        }

        uint64_t v7 = 4294966996LL;
      }

      else
      {
        uint64_t v7 = 4294966995LL;
      }

uint64_t wifi_manager_set_association_mode(mach_port_t a1, int a2)
{
  uint64_t v4 = *MEMORY[0x1895F8468];
  int v5 = a2;
  *(void *)&msg.msgh_bits = 0xAAAAAAAA00000013LL;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 69723;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1895FD5F8]) {
    voucher_mach_msg_set(&msg);
  }
  return mach_msg(&msg, 2097153, 0x24u, 0, 0, 0, 0);
}

uint64_t wifi_manager_get_association_mode(int a1, _DWORD *a2)
{
  *(void *)&__int128 v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&rcv_name_12[16] = v4;
  *(_OWORD *)&rcv_name_12[4] = v4;
  rcv_mach_port_name_t name = -1431655766;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  int rcv_name_4 = a1;
  mach_port_name_t rcv_name_8 = special_reply_port;
  int v10 = 5395;
  *(void *)rcv_name_12 = 0x1105C00000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v10);
    mach_port_name_t special_reply_port = rcv_name_8;
  }

  uint64_t v6 = mach_msg((mach_msg_header_t *)&v10, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  uint64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v6)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        uint64_t v7 = 4294966988LL;
      }

      else if (*(_DWORD *)&rcv_name_12[4] == 69824)
      {
        if ((v10 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = *(_DWORD *)&rcv_name_12[20];
                return v7;
              }

              goto LABEL_22;
            }
          }

          else if (rcv_name == 36)
          {
            if (rcv_name_4) {
              BOOL v8 = 1;
            }
            else {
              BOOL v8 = *(_DWORD *)&rcv_name_12[16] == 0;
            }
            if (v8) {
              uint64_t v7 = 4294966996LL;
            }
            else {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
            }
            goto LABEL_22;
          }
        }

        uint64_t v7 = 4294966996LL;
      }

      else
      {
        uint64_t v7 = 4294966995LL;
      }

uint64_t wifi_manager_get_nanclient_assoc_status(int a1, _DWORD *a2)
{
  *(void *)&__int128 v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&rcv_name_12[16] = v4;
  *(_OWORD *)&rcv_name_12[4] = v4;
  rcv_mach_port_name_t name = -1431655766;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  int rcv_name_4 = a1;
  mach_port_name_t rcv_name_8 = special_reply_port;
  int v10 = 5395;
  *(void *)rcv_name_12 = 0x1105D00000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v10);
    mach_port_name_t special_reply_port = rcv_name_8;
  }

  uint64_t v6 = mach_msg((mach_msg_header_t *)&v10, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  uint64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v6)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        uint64_t v7 = 4294966988LL;
      }

      else if (*(_DWORD *)&rcv_name_12[4] == 69825)
      {
        if ((v10 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = *(_DWORD *)&rcv_name_12[20];
                return v7;
              }

              goto LABEL_22;
            }
          }

          else if (rcv_name == 36)
          {
            if (rcv_name_4) {
              BOOL v8 = 1;
            }
            else {
              BOOL v8 = *(_DWORD *)&rcv_name_12[16] == 0;
            }
            if (v8) {
              uint64_t v7 = 4294966996LL;
            }
            else {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
            }
            goto LABEL_22;
          }
        }

        uint64_t v7 = 4294966996LL;
      }

      else
      {
        uint64_t v7 = 4294966995LL;
      }

uint64_t wifi_manager_set_nan_off_head_connection_expiry(mach_port_t a1, double a2)
{
  uint64_t v4 = *MEMORY[0x1895F8468];
  double v5 = a2;
  *(void *)&msg.msgh_bits = 0xAAAAAAAA00000013LL;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 69726;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1895FD5F8]) {
    voucher_mach_msg_set(&msg);
  }
  return mach_msg(&msg, 2097153, 0x28u, 0, 0, 0, 0);
}

uint64_t wifi_manager_get_nan_off_head_connection_expiry(int a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  *(void *)&__int128 v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  __int128 v11 = v4;
  *(_OWORD *)&msg[20] = v4;
  *(_DWORD *)&msg[4] = -1431655766;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)mach_msg_header_t msg = 5395;
  *(void *)&msg[16] = 0x1105F00000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t special_reply_port = *(_DWORD *)&msg[12];
  }

  uint64_t v6 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x18u, 0x34u, special_reply_port, 0, 0);
  uint64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v6)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        uint64_t v7 = 4294966988LL;
      }

      else if (*(_DWORD *)&msg[20] == 69827)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 44)
          {
            if (!*(_DWORD *)&msg[8])
            {
              uint64_t v7 = *(unsigned int *)&msg[32];
              if (!*(_DWORD *)&msg[32])
              {
                *a2 = v11;
                return v7;
              }

              goto LABEL_22;
            }
          }

          else if (*(_DWORD *)&msg[4] == 36)
          {
            if (*(_DWORD *)&msg[8]) {
              BOOL v8 = 1;
            }
            else {
              BOOL v8 = *(_DWORD *)&msg[32] == 0;
            }
            if (v8) {
              uint64_t v7 = 4294966996LL;
            }
            else {
              uint64_t v7 = *(unsigned int *)&msg[32];
            }
            goto LABEL_22;
          }
        }

        uint64_t v7 = 4294966996LL;
      }

      else
      {
        uint64_t v7 = 4294966995LL;
      }

uint64_t wifi_manager_set_asktojoin_preference(mach_port_t a1, int a2)
{
  uint64_t v4 = *MEMORY[0x1895F8468];
  int v5 = a2;
  *(void *)&msg.msgh_bits = 0xAAAAAAAA00000013LL;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 69728;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1895FD5F8]) {
    voucher_mach_msg_set(&msg);
  }
  return mach_msg(&msg, 2097153, 0x24u, 0, 0, 0, 0);
}

uint64_t wifi_manager_get_asktojoin_preference(int a1, _DWORD *a2)
{
  *(void *)&__int128 v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&rcv_name_12[16] = v4;
  *(_OWORD *)&rcv_name_12[4] = v4;
  rcv_mach_port_name_t name = -1431655766;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  int rcv_name_4 = a1;
  mach_port_name_t rcv_name_8 = special_reply_port;
  int v10 = 5395;
  *(void *)rcv_name_12 = 0x1106100000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v10);
    mach_port_name_t special_reply_port = rcv_name_8;
  }

  uint64_t v6 = mach_msg((mach_msg_header_t *)&v10, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  uint64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v6)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        uint64_t v7 = 4294966988LL;
      }

      else if (*(_DWORD *)&rcv_name_12[4] == 69829)
      {
        if ((v10 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = *(_DWORD *)&rcv_name_12[20];
                return v7;
              }

              goto LABEL_22;
            }
          }

          else if (rcv_name == 36)
          {
            if (rcv_name_4) {
              BOOL v8 = 1;
            }
            else {
              BOOL v8 = *(_DWORD *)&rcv_name_12[16] == 0;
            }
            if (v8) {
              uint64_t v7 = 4294966996LL;
            }
            else {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
            }
            goto LABEL_22;
          }
        }

        uint64_t v7 = 4294966996LL;
      }

      else
      {
        uint64_t v7 = 4294966995LL;
      }

uint64_t wifi_manager_set_client_type(mach_port_t a1, int a2)
{
  uint64_t v4 = *MEMORY[0x1895F8468];
  int v5 = a2;
  *(void *)&msg.msgh_bits = 0xAAAAAAAA00000013LL;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 69730;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1895FD5F8]) {
    voucher_mach_msg_set(&msg);
  }
  return mach_msg(&msg, 2097153, 0x24u, 0, 0, 0, 0);
}

uint64_t wifi_manager_set_event_mask(mach_port_t a1, uint64_t a2)
{
  uint64_t v4 = *MEMORY[0x1895F8468];
  uint64_t v5 = a2;
  *(void *)&msg.msgh_bits = 0xAAAAAAAA00000013LL;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 69731;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1895FD5F8]) {
    voucher_mach_msg_set(&msg);
  }
  return mach_msg(&msg, 2097153, 0x28u, 0, 0, 0, 0);
}

uint64_t wifi_manager_is_tethering_supported(int a1, _DWORD *a2)
{
  *(void *)&__int128 v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&rcv_name_12[16] = v4;
  *(_OWORD *)&rcv_name_12[4] = v4;
  rcv_mach_port_name_t name = -1431655766;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  int rcv_name_4 = a1;
  mach_port_name_t rcv_name_8 = special_reply_port;
  int v10 = 5395;
  *(void *)rcv_name_12 = 0x1106400000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v10);
    mach_port_name_t special_reply_port = rcv_name_8;
  }

  uint64_t v6 = mach_msg((mach_msg_header_t *)&v10, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  uint64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v6)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        uint64_t v7 = 4294966988LL;
      }

      else if (*(_DWORD *)&rcv_name_12[4] == 69832)
      {
        if ((v10 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = *(_DWORD *)&rcv_name_12[20];
                return v7;
              }

              goto LABEL_22;
            }
          }

          else if (rcv_name == 36)
          {
            if (rcv_name_4) {
              BOOL v8 = 1;
            }
            else {
              BOOL v8 = *(_DWORD *)&rcv_name_12[16] == 0;
            }
            if (v8) {
              uint64_t v7 = 4294966996LL;
            }
            else {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
            }
            goto LABEL_22;
          }
        }

        uint64_t v7 = 4294966996LL;
      }

      else
      {
        uint64_t v7 = 4294966995LL;
      }

uint64_t wifi_manager_copy_mis_stats(int a1, void *a2, _DWORD *a3)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  *(void *)&__int128 v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v13[12] = v6;
  *(_OWORD *)uint64_t v13 = v6;
  *(_OWORD *)&msg[20] = v6;
  *(_DWORD *)&msg[4] = -1431655766;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)mach_msg_header_t msg = 5395;
  *(void *)&msg[16] = 0x1106500000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t special_reply_port = *(_DWORD *)&msg[12];
  }

  uint64_t v8 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x18u, 0x40u, special_reply_port, 0, 0);
  uint64_t v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v8)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        uint64_t v9 = 4294966988LL;
      }

      else if (*(_DWORD *)&msg[20] == 69833)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 36)
          {
            uint64_t v9 = 4294966996LL;
            if (*(_DWORD *)&msg[32])
            {
              if (*(_DWORD *)&msg[8]) {
                uint64_t v9 = 4294966996LL;
              }
              else {
                uint64_t v9 = *(unsigned int *)&msg[32];
              }
            }
          }

          else
          {
            uint64_t v9 = 4294966996LL;
          }

          goto LABEL_24;
        }

        uint64_t v9 = 4294966996LL;
        if (*(_DWORD *)&msg[24] == 1 && *(_DWORD *)&msg[4] == 56 && !*(_DWORD *)&msg[8] && v13[3] == 1)
        {
          int v10 = *(_DWORD *)&v13[4];
          if (*(_DWORD *)&v13[4] == *(_DWORD *)&v13[16])
          {
            uint64_t v9 = 0LL;
            *a2 = *(void *)&msg[28];
            *a3 = v10;
            return v9;
          }
        }
      }

      else
      {
        uint64_t v9 = 4294966995LL;
      }

uint64_t wifi_manager_reset_mis_stats(int a1)
{
  unint64_t v8 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&__int128 v2 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&msg[20] = v2;
  *(_DWORD *)&msg[4] = -1431655766;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)mach_msg_header_t msg = 5395;
  *(void *)&msg[16] = 0x1106600000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t special_reply_port = *(_DWORD *)&msg[12];
  }

  uint64_t v4 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x18u, 0x2Cu, special_reply_port, 0, 0);
  uint64_t v5 = v4;
  if ((v4 - 268435458) > 0xE || ((1 << (v4 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v4)
    {
      mig_dealloc_special_reply_port();
      return v5;
    }

    if (*(_DWORD *)&msg[20] == 71)
    {
      uint64_t v5 = 4294966988LL;
    }

    else if (*(_DWORD *)&msg[20] == 69834)
    {
      uint64_t v5 = 4294966996LL;
      if ((*(_DWORD *)msg & 0x80000000) == 0 && *(_DWORD *)&msg[4] == 36 && !*(_DWORD *)&msg[8])
      {
        uint64_t v5 = *(unsigned int *)&msg[32];
        if (!*(_DWORD *)&msg[32]) {
          return v5;
        }
      }
    }

    else
    {
      uint64_t v5 = 4294966995LL;
    }

    mach_msg_destroy((mach_msg_header_t *)msg);
  }

  return v5;
}

uint64_t wifi_manager_is_always_on_wifi_supported(int a1, _DWORD *a2)
{
  *(void *)&__int128 v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&rcv_name_12[16] = v4;
  *(_OWORD *)&rcv_name_12[4] = v4;
  rcv_mach_port_name_t name = -1431655766;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  int rcv_name_4 = a1;
  mach_port_name_t rcv_name_8 = special_reply_port;
  int v10 = 5395;
  *(void *)rcv_name_12 = 0x1106700000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v10);
    mach_port_name_t special_reply_port = rcv_name_8;
  }

  uint64_t v6 = mach_msg((mach_msg_header_t *)&v10, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  uint64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v6)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        uint64_t v7 = 4294966988LL;
      }

      else if (*(_DWORD *)&rcv_name_12[4] == 69835)
      {
        if ((v10 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = *(_DWORD *)&rcv_name_12[20];
                return v7;
              }

              goto LABEL_22;
            }
          }

          else if (rcv_name == 36)
          {
            if (rcv_name_4) {
              BOOL v8 = 1;
            }
            else {
              BOOL v8 = *(_DWORD *)&rcv_name_12[16] == 0;
            }
            if (v8) {
              uint64_t v7 = 4294966996LL;
            }
            else {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
            }
            goto LABEL_22;
          }
        }

        uint64_t v7 = 4294966996LL;
      }

      else
      {
        uint64_t v7 = 4294966995LL;
      }

uint64_t wifi_manager_copy_locale_stats(int a1, void *a2, _DWORD *a3)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  *(void *)&__int128 v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v13[12] = v6;
  *(_OWORD *)uint64_t v13 = v6;
  *(_OWORD *)&msg[20] = v6;
  *(_DWORD *)&msg[4] = -1431655766;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)mach_msg_header_t msg = 5395;
  *(void *)&msg[16] = 0x1106800000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t special_reply_port = *(_DWORD *)&msg[12];
  }

  uint64_t v8 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x18u, 0x40u, special_reply_port, 0, 0);
  uint64_t v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v8)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        uint64_t v9 = 4294966988LL;
      }

      else if (*(_DWORD *)&msg[20] == 69836)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 36)
          {
            uint64_t v9 = 4294966996LL;
            if (*(_DWORD *)&msg[32])
            {
              if (*(_DWORD *)&msg[8]) {
                uint64_t v9 = 4294966996LL;
              }
              else {
                uint64_t v9 = *(unsigned int *)&msg[32];
              }
            }
          }

          else
          {
            uint64_t v9 = 4294966996LL;
          }

          goto LABEL_24;
        }

        uint64_t v9 = 4294966996LL;
        if (*(_DWORD *)&msg[24] == 1 && *(_DWORD *)&msg[4] == 56 && !*(_DWORD *)&msg[8] && v13[3] == 1)
        {
          int v10 = *(_DWORD *)&v13[4];
          if (*(_DWORD *)&v13[4] == *(_DWORD *)&v13[16])
          {
            uint64_t v9 = 0LL;
            *a2 = *(void *)&msg[28];
            *a3 = v10;
            return v9;
          }
        }
      }

      else
      {
        uint64_t v9 = 4294966995LL;
      }

uint64_t wifi_manager_mis_set_password(mach_port_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  int v12 = 1;
  uint64_t v13 = a2;
  int v14 = 27918592;
  int v15 = a3;
  uint64_t v16 = *MEMORY[0x1895F8468];
  int v17 = a3;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  *(void *)&v11.msgh_bits = 0xAAAAAAAA80001513LL;
  v11.mach_port_t msgh_remote_port = a1;
  v11.msgh_local_port = special_reply_port;
  *(void *)&v11.msgh_voucher_port = 0x1106900000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&v11);
    mach_port_t special_reply_port = v11.msgh_local_port;
  }

  uint64_t v7 = mach_msg(&v11, 3162115, 0x38u, 0x30u, special_reply_port, 0, 0);
  uint64_t v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v7)
    {
      if (v11.msgh_id == 71)
      {
        uint64_t v8 = 4294966988LL;
      }

      else if (v11.msgh_id == 69837)
      {
        if ((v11.msgh_bits & 0x80000000) == 0)
        {
          if (v11.msgh_size == 40)
          {
            if (!v11.msgh_remote_port)
            {
              uint64_t v8 = HIDWORD(v13);
              if (!HIDWORD(v13))
              {
                *a4 = v14;
                return v8;
              }

              goto LABEL_22;
            }
          }

          else if (v11.msgh_size == 36)
          {
            if (v11.msgh_remote_port) {
              BOOL v9 = 1;
            }
            else {
              BOOL v9 = HIDWORD(v13) == 0;
            }
            if (v9) {
              uint64_t v8 = 4294966996LL;
            }
            else {
              uint64_t v8 = HIDWORD(v13);
            }
            goto LABEL_22;
          }
        }

        uint64_t v8 = 4294966996LL;
      }

      else
      {
        uint64_t v8 = 4294966995LL;
      }

uint64_t wifi_manager_mis_copy_password(int a1, void *a2, _DWORD *a3)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  *(void *)&__int128 v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v13[12] = v6;
  *(_OWORD *)uint64_t v13 = v6;
  *(_OWORD *)&msg[20] = v6;
  *(_DWORD *)&msg[4] = -1431655766;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)mach_msg_header_t msg = 5395;
  *(void *)&msg[16] = 0x1106A00000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t special_reply_port = *(_DWORD *)&msg[12];
  }

  uint64_t v8 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x18u, 0x40u, special_reply_port, 0, 0);
  uint64_t v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v8)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        uint64_t v9 = 4294966988LL;
      }

      else if (*(_DWORD *)&msg[20] == 69838)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 36)
          {
            uint64_t v9 = 4294966996LL;
            if (*(_DWORD *)&msg[32])
            {
              if (*(_DWORD *)&msg[8]) {
                uint64_t v9 = 4294966996LL;
              }
              else {
                uint64_t v9 = *(unsigned int *)&msg[32];
              }
            }
          }

          else
          {
            uint64_t v9 = 4294966996LL;
          }

          goto LABEL_24;
        }

        uint64_t v9 = 4294966996LL;
        if (*(_DWORD *)&msg[24] == 1 && *(_DWORD *)&msg[4] == 56 && !*(_DWORD *)&msg[8] && v13[3] == 1)
        {
          int v10 = *(_DWORD *)&v13[4];
          if (*(_DWORD *)&v13[4] == *(_DWORD *)&v13[16])
          {
            uint64_t v9 = 0LL;
            *a2 = *(void *)&msg[28];
            *a3 = v10;
            return v9;
          }
        }
      }

      else
      {
        uint64_t v9 = 4294966995LL;
      }

uint64_t wifi_device_copy_property( mach_port_t a1, uint64_t a2, int a3, uint64_t a4, int a5, void *a6, _DWORD *a7)
{
  int v16 = 2;
  uint64_t v17 = a2;
  int v18 = 27918592;
  int v19 = a3;
  uint64_t v20 = a4;
  int v21 = 27918592;
  int v22 = a5;
  uint64_t v23 = *MEMORY[0x1895F8468];
  int v24 = a3;
  int v25 = a5;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  *(void *)&v15.msgh_bits = 0xAAAAAAAA80001513LL;
  v15.mach_port_t msgh_remote_port = a1;
  v15.msgh_local_port = special_reply_port;
  *(void *)&v15.msgh_voucher_port = 0x1106B00000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&v15);
    mach_port_t special_reply_port = v15.msgh_local_port;
  }

  uint64_t v11 = mach_msg(&v15, 3162115, 0x4Cu, 0x40u, special_reply_port, 0, 0);
  uint64_t v12 = v11;
  if ((v11 - 268435458) > 0xE || ((1 << (v11 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v11)
    {
      if (v15.msgh_id == 71)
      {
        uint64_t v12 = 4294966988LL;
      }

      else if (v15.msgh_id == 69839)
      {
        if ((v15.msgh_bits & 0x80000000) == 0)
        {
          if (v15.msgh_size == 36)
          {
            uint64_t v12 = 4294966996LL;
            if (HIDWORD(v17))
            {
              if (v15.msgh_remote_port) {
                uint64_t v12 = 4294966996LL;
              }
              else {
                uint64_t v12 = HIDWORD(v17);
              }
            }
          }

          else
          {
            uint64_t v12 = 4294966996LL;
          }

          goto LABEL_23;
        }

        uint64_t v12 = 4294966996LL;
        if (v16 == 1 && *(void *)&v15.msgh_size == 56LL && HIBYTE(v18) == 1)
        {
          int v13 = v19;
          if (v19 == v21)
          {
            uint64_t v12 = 0LL;
            *a6 = v17;
            *a7 = v13;
            return v12;
          }
        }
      }

      else
      {
        uint64_t v12 = 4294966995LL;
      }

uint64_t wifi_device_set_property(int a1, uint64_t a2, int a3, uint64_t a4, int a5, uint64_t a6, int a7)
{
  uint64_t v11 = a2;
  int v12 = 27918592;
  int v13 = a3;
  uint64_t v14 = a4;
  int v15 = 27918592;
  int v16 = a5;
  uint64_t v17 = a6;
  int v18 = 27918592;
  int v19 = a7;
  uint64_t v20 = *MEMORY[0x1895F8468];
  int v21 = a3;
  int v22 = a5;
  int v23 = a7;
  unint64_t v8 = 0xAAAAAAAA80000013LL;
  int v9 = a1;
  __int128 v10 = xmmword_1865BD330;
  if (MEMORY[0x1895FD5F8]) {
    voucher_mach_msg_set((mach_msg_header_t *)&v8);
  }
  return mach_msg((mach_msg_header_t *)&v8, 2097153, 0x60u, 0, 0, 0, 0);
}

uint64_t wifi_device_set_coex_parameters( mach_port_t a1, uint64_t a2, int a3, uint64_t a4, int a5, uint64_t a6, int a7, int *a8)
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  int v16 = 3;
  uint64_t v17 = a2;
  int v18 = 27918592;
  int v19 = a3;
  uint64_t v20 = a4;
  int v21 = 27918592;
  int v22 = a5;
  uint64_t v23 = a6;
  int v24 = 27918592;
  int v25 = a7;
  uint64_t v26 = *MEMORY[0x1895F8468];
  int v27 = a3;
  int v28 = a5;
  int v29 = a7;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  *(void *)&msg.msgh_bits = 0xAAAAAAAA80001513LL;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  *(void *)&msg.msgh_voucher_port = 0x1106D00000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }

  uint64_t v11 = mach_msg(&msg, 3162115, 0x60u, 0x30u, special_reply_port, 0, 0);
  uint64_t v12 = v11;
  if ((v11 - 268435458) > 0xE || ((1 << (v11 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v11)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v12 = 4294966988LL;
      }

      else if (msg.msgh_id == 69841)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 40)
          {
            if (!msg.msgh_remote_port)
            {
              uint64_t v12 = HIDWORD(v17);
              if (!HIDWORD(v17))
              {
                *a8 = v18;
                return v12;
              }

              goto LABEL_22;
            }
          }

          else if (msg.msgh_size == 36)
          {
            if (msg.msgh_remote_port) {
              BOOL v13 = 1;
            }
            else {
              BOOL v13 = HIDWORD(v17) == 0;
            }
            if (v13) {
              uint64_t v12 = 4294966996LL;
            }
            else {
              uint64_t v12 = HIDWORD(v17);
            }
            goto LABEL_22;
          }
        }

        uint64_t v12 = 4294966996LL;
      }

      else
      {
        uint64_t v12 = 4294966995LL;
      }

uint64_t wifi_device_get_power(mach_port_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  int v12 = 1;
  uint64_t v13 = a2;
  int v14 = 27918592;
  int v15 = a3;
  uint64_t v16 = *MEMORY[0x1895F8468];
  int v17 = a3;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  *(void *)&v11.msgh_bits = 0xAAAAAAAA80001513LL;
  v11.mach_port_t msgh_remote_port = a1;
  v11.msgh_local_port = special_reply_port;
  *(void *)&v11.msgh_voucher_port = 0x1106E00000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&v11);
    mach_port_t special_reply_port = v11.msgh_local_port;
  }

  uint64_t v7 = mach_msg(&v11, 3162115, 0x38u, 0x30u, special_reply_port, 0, 0);
  uint64_t v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v7)
    {
      if (v11.msgh_id == 71)
      {
        uint64_t v8 = 4294966988LL;
      }

      else if (v11.msgh_id == 69842)
      {
        if ((v11.msgh_bits & 0x80000000) == 0)
        {
          if (v11.msgh_size == 40)
          {
            if (!v11.msgh_remote_port)
            {
              uint64_t v8 = HIDWORD(v13);
              if (!HIDWORD(v13))
              {
                *a4 = v14;
                return v8;
              }

              goto LABEL_22;
            }
          }

          else if (v11.msgh_size == 36)
          {
            if (v11.msgh_remote_port) {
              BOOL v9 = 1;
            }
            else {
              BOOL v9 = HIDWORD(v13) == 0;
            }
            if (v9) {
              uint64_t v8 = 4294966996LL;
            }
            else {
              uint64_t v8 = HIDWORD(v13);
            }
            goto LABEL_22;
          }
        }

        uint64_t v8 = 4294966996LL;
      }

      else
      {
        uint64_t v8 = 4294966995LL;
      }

uint64_t wifi_device_set_power(mach_port_t a1, uint64_t a2, int a3, int a4, int *a5)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  int v13 = 1;
  uint64_t v14 = a2;
  int v15 = 27918592;
  int v16 = a3;
  uint64_t v17 = *MEMORY[0x1895F8468];
  int v18 = a3;
  int v19 = a4;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  *(void *)&msg.msgh_bits = 0xAAAAAAAA80001513LL;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  *(void *)&msg.msgh_voucher_port = 0x1106F00000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }

  uint64_t v8 = mach_msg(&msg, 3162115, 0x3Cu, 0x30u, special_reply_port, 0, 0);
  uint64_t v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v8)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v9 = 4294966988LL;
      }

      else if (msg.msgh_id == 69843)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 40)
          {
            if (!msg.msgh_remote_port)
            {
              uint64_t v9 = HIDWORD(v14);
              if (!HIDWORD(v14))
              {
                *a5 = v15;
                return v9;
              }

              goto LABEL_22;
            }
          }

          else if (msg.msgh_size == 36)
          {
            if (msg.msgh_remote_port) {
              BOOL v10 = 1;
            }
            else {
              BOOL v10 = HIDWORD(v14) == 0;
            }
            if (v10) {
              uint64_t v9 = 4294966996LL;
            }
            else {
              uint64_t v9 = HIDWORD(v14);
            }
            goto LABEL_22;
          }
        }

        uint64_t v9 = 4294966996LL;
      }

      else
      {
        uint64_t v9 = 4294966995LL;
      }

uint64_t wifi_device_copy_current_network(int a1, uint64_t a2, int a3, void *a4, _DWORD *a5)
{
  *(void *)&__int128 v8 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&rcv_name[16] = 0x1AAAAAAAALL;
  *(_DWORD *)int v19 = -1431655766;
  *(_OWORD *)&v19[4] = v8;
  *(_OWORD *)rcv_mach_port_name_t name = v8;
  uint64_t v16 = a2;
  int v17 = 27918592;
  int v18 = a3;
  *(void *)int v19 = *MEMORY[0x1895F8468];
  *(_DWORD *)&v19[8] = a3;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&rcv_name[4] = a1;
  *(_DWORD *)&rcv_name[8] = special_reply_port;
  int v14 = -2147478253;
  *(void *)&rcv_name[12] = 0x1107000000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v14);
    mach_port_name_t special_reply_port = *(_DWORD *)&rcv_name[8];
  }

  uint64_t v10 = mach_msg((mach_msg_header_t *)&v14, 3162115, 0x38u, 0x40u, special_reply_port, 0, 0);
  uint64_t v11 = v10;
  if ((v10 - 268435458) > 0xE || ((1 << (v10 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v10)
    {
      if (*(_DWORD *)&rcv_name[16] == 71)
      {
        uint64_t v11 = 4294966988LL;
      }

      else if (*(_DWORD *)&rcv_name[16] == 69844)
      {
        if ((v14 & 0x80000000) == 0)
        {
          if (*(_DWORD *)rcv_name == 36)
          {
            uint64_t v11 = 4294966996LL;
            if (HIDWORD(v16))
            {
              if (*(_DWORD *)&rcv_name[4]) {
                uint64_t v11 = 4294966996LL;
              }
              else {
                uint64_t v11 = HIDWORD(v16);
              }
            }
          }

          else
          {
            uint64_t v11 = 4294966996LL;
          }

          goto LABEL_24;
        }

        uint64_t v11 = 4294966996LL;
        if (*(_DWORD *)&rcv_name[20] == 1 && *(_DWORD *)rcv_name == 56 && !*(_DWORD *)&rcv_name[4] && HIBYTE(v17) == 1)
        {
          int v12 = v18;
          if (v18 == *(_DWORD *)&v19[8])
          {
            uint64_t v11 = 0LL;
            *a4 = v16;
            *a5 = v12;
            return v11;
          }
        }
      }

      else
      {
        uint64_t v11 = 4294966995LL;
      }

uint64_t wifi_device_disassociate(int a1, uint64_t a2, int a3)
{
  uint64_t v5 = a2;
  int v6 = 27918592;
  int v7 = a3;
  uint64_t v8 = *MEMORY[0x1895F8468];
  int v9 = a3;
  *(void *)mach_msg_header_t msg = 0xAAAAAAAA80000013LL;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_1865BD340;
  if (MEMORY[0x1895FD5F8]) {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  }
  return mach_msg((mach_msg_header_t *)msg, 2097153, 0x38u, 0, 0, 0, 0);
}

uint64_t wifi_device_disassociate_with_reason(int a1, uint64_t a2, int a3, int a4)
{
  uint64_t v8 = a2;
  int v9 = 27918592;
  int v10 = a3;
  uint64_t v11 = *MEMORY[0x1895F8468];
  int v12 = a3;
  int v13 = a4;
  unint64_t v5 = 0xAAAAAAAA80000013LL;
  int v6 = a1;
  __int128 v7 = xmmword_1865BD350;
  if (MEMORY[0x1895FD5F8]) {
    voucher_mach_msg_set((mach_msg_header_t *)&v5);
  }
  return mach_msg((mach_msg_header_t *)&v5, 2097153, 0x3Cu, 0, 0, 0, 0);
}

uint64_t wifi_device_scan_async(mach_port_t a1, uint64_t a2, int a3, uint64_t a4, int a5, int *a6)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  int v14 = 2;
  uint64_t v15 = a2;
  int v16 = 27918592;
  int v17 = a3;
  uint64_t v18 = a4;
  int v19 = 27918592;
  int v20 = a5;
  uint64_t v21 = *MEMORY[0x1895F8468];
  int v22 = a3;
  int v23 = a5;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  *(void *)&msg.msgh_bits = 0xAAAAAAAA80001513LL;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  *(void *)&msg.msgh_voucher_port = 0x1107300000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }

  uint64_t v9 = mach_msg(&msg, 3162115, 0x4Cu, 0x30u, special_reply_port, 0, 0);
  uint64_t v10 = v9;
  if ((v9 - 268435458) > 0xE || ((1 << (v9 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v9)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v10 = 4294966988LL;
      }

      else if (msg.msgh_id == 69847)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 40)
          {
            if (!msg.msgh_remote_port)
            {
              uint64_t v10 = HIDWORD(v15);
              if (!HIDWORD(v15))
              {
                *a6 = v16;
                return v10;
              }

              goto LABEL_22;
            }
          }

          else if (msg.msgh_size == 36)
          {
            if (msg.msgh_remote_port) {
              BOOL v11 = 1;
            }
            else {
              BOOL v11 = HIDWORD(v15) == 0;
            }
            if (v11) {
              uint64_t v10 = 4294966996LL;
            }
            else {
              uint64_t v10 = HIDWORD(v15);
            }
            goto LABEL_22;
          }
        }

        uint64_t v10 = 4294966996LL;
      }

      else
      {
        uint64_t v10 = 4294966995LL;
      }

uint64_t wifi_device_assoc_async(mach_port_t a1, uint64_t a2, int a3, uint64_t a4, int a5, int *a6)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  int v14 = 2;
  uint64_t v15 = a2;
  int v16 = 27918592;
  int v17 = a3;
  uint64_t v18 = a4;
  int v19 = 27918592;
  int v20 = a5;
  uint64_t v21 = *MEMORY[0x1895F8468];
  int v22 = a3;
  int v23 = a5;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  *(void *)&msg.msgh_bits = 0xAAAAAAAA80001513LL;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  *(void *)&msg.msgh_voucher_port = 0x1107400000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }

  uint64_t v9 = mach_msg(&msg, 3162115, 0x4Cu, 0x30u, special_reply_port, 0, 0);
  uint64_t v10 = v9;
  if ((v9 - 268435458) > 0xE || ((1 << (v9 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v9)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v10 = 4294966988LL;
      }

      else if (msg.msgh_id == 69848)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 40)
          {
            if (!msg.msgh_remote_port)
            {
              uint64_t v10 = HIDWORD(v15);
              if (!HIDWORD(v15))
              {
                *a6 = v16;
                return v10;
              }

              goto LABEL_22;
            }
          }

          else if (msg.msgh_size == 36)
          {
            if (msg.msgh_remote_port) {
              BOOL v11 = 1;
            }
            else {
              BOOL v11 = HIDWORD(v15) == 0;
            }
            if (v11) {
              uint64_t v10 = 4294966996LL;
            }
            else {
              uint64_t v10 = HIDWORD(v15);
            }
            goto LABEL_22;
          }
        }

        uint64_t v10 = 4294966996LL;
      }

      else
      {
        uint64_t v10 = 4294966995LL;
      }

uint64_t wifi_device_start_network(mach_port_t a1, uint64_t a2, int a3, int a4, uint64_t a5, int a6, int *a7)
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  int v15 = 2;
  uint64_t v16 = a2;
  int v17 = 27918592;
  int v18 = a3;
  uint64_t v19 = a5;
  int v20 = 27918592;
  int v21 = a6;
  uint64_t v22 = *MEMORY[0x1895F8468];
  int v23 = a3;
  int v24 = a4;
  int v25 = a6;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  *(void *)&msg.msgh_bits = 0xAAAAAAAA80001513LL;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  *(void *)&msg.msgh_voucher_port = 0x1107500000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }

  uint64_t v10 = mach_msg(&msg, 3162115, 0x50u, 0x30u, special_reply_port, 0, 0);
  uint64_t v11 = v10;
  if ((v10 - 268435458) > 0xE || ((1 << (v10 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v10)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v11 = 4294966988LL;
      }

      else if (msg.msgh_id == 69849)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 40)
          {
            if (!msg.msgh_remote_port)
            {
              uint64_t v11 = HIDWORD(v16);
              if (!HIDWORD(v16))
              {
                *a7 = v17;
                return v11;
              }

              goto LABEL_22;
            }
          }

          else if (msg.msgh_size == 36)
          {
            if (msg.msgh_remote_port) {
              BOOL v12 = 1;
            }
            else {
              BOOL v12 = HIDWORD(v16) == 0;
            }
            if (v12) {
              uint64_t v11 = 4294966996LL;
            }
            else {
              uint64_t v11 = HIDWORD(v16);
            }
            goto LABEL_22;
          }
        }

        uint64_t v11 = 4294966996LL;
      }

      else
      {
        uint64_t v11 = 4294966995LL;
      }

uint64_t wifi_device_stop_network(mach_port_t a1, uint64_t a2, int a3, uint64_t a4, int a5, int *a6)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  int v14 = 2;
  uint64_t v15 = a2;
  int v16 = 27918592;
  int v17 = a3;
  uint64_t v18 = a4;
  int v19 = 27918592;
  int v20 = a5;
  uint64_t v21 = *MEMORY[0x1895F8468];
  int v22 = a3;
  int v23 = a5;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  *(void *)&msg.msgh_bits = 0xAAAAAAAA80001513LL;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  *(void *)&msg.msgh_voucher_port = 0x1107600000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }

  uint64_t v9 = mach_msg(&msg, 3162115, 0x4Cu, 0x30u, special_reply_port, 0, 0);
  uint64_t v10 = v9;
  if ((v9 - 268435458) > 0xE || ((1 << (v9 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v9)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v10 = 4294966988LL;
      }

      else if (msg.msgh_id == 69850)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 40)
          {
            if (!msg.msgh_remote_port)
            {
              uint64_t v10 = HIDWORD(v15);
              if (!HIDWORD(v15))
              {
                *a6 = v16;
                return v10;
              }

              goto LABEL_22;
            }
          }

          else if (msg.msgh_size == 36)
          {
            if (msg.msgh_remote_port) {
              BOOL v11 = 1;
            }
            else {
              BOOL v11 = HIDWORD(v15) == 0;
            }
            if (v11) {
              uint64_t v10 = 4294966996LL;
            }
            else {
              uint64_t v10 = HIDWORD(v15);
            }
            goto LABEL_22;
          }
        }

        uint64_t v10 = 4294966996LL;
      }

      else
      {
        uint64_t v10 = 4294966995LL;
      }

uint64_t wifi_device_copy_networks( mach_port_t a1, uint64_t a2, unsigned int a3, unsigned int a4, void *a5, unsigned int *a6, _DWORD *a7)
{
  *(void *)&__int128 v11 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
  msg.msgh_id = -1431655766;
  unint64_t v22 = 0xAAAAAAAAAAAAAAAALL;
  __int128 v23 = v11;
  *(_OWORD *)&msg.msgh_size = v11;
  int v18 = 1;
  uint64_t v19 = a2;
  int v20 = 27918592;
  unsigned int v21 = a3;
  unint64_t v22 = *MEMORY[0x1895F8468];
  *(void *)&__int128 v23 = __PAIR64__(a4, a3);
  mach_port_t special_reply_port = mig_get_special_reply_port();
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  msg.msgh_bits = -2147478253;
  *(void *)&msg.msgh_voucher_port = 0x1107700000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }

  uint64_t v13 = mach_msg(&msg, 3162115, 0x3Cu, 0x44u, special_reply_port, 0, 0);
  uint64_t v14 = v13;
  if ((v13 - 268435458) > 0xE || ((1 << (v13 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v13)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v14 = 4294966988LL;
      }

      else if (msg.msgh_id == 69851)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 36)
          {
            uint64_t v14 = 4294966996LL;
            if (HIDWORD(v19))
            {
              if (msg.msgh_remote_port) {
                uint64_t v14 = 4294966996LL;
              }
              else {
                uint64_t v14 = HIDWORD(v19);
              }
            }
          }

          else
          {
            uint64_t v14 = 4294966996LL;
          }

          goto LABEL_24;
        }

        uint64_t v14 = 4294966996LL;
        if (v18 == 1 && msg.msgh_size == 60 && !msg.msgh_remote_port && HIBYTE(v20) == 1)
        {
          unsigned int v15 = v21;
          if (v21 == (_DWORD)v23)
          {
            uint64_t v14 = 0LL;
            *a5 = v19;
            *a6 = v15;
            *a7 = DWORD1(v23);
            return v14;
          }
        }
      }

      else
      {
        uint64_t v14 = 4294966995LL;
      }

uint64_t wifi_device_set_wifi_direct_state(mach_port_t a1, uint64_t a2, int a3, int a4, int *a5)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  int v13 = 1;
  uint64_t v14 = a2;
  int v15 = 27918592;
  int v16 = a3;
  uint64_t v17 = *MEMORY[0x1895F8468];
  int v18 = a3;
  int v19 = a4;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  *(void *)&msg.msgh_bits = 0xAAAAAAAA80001513LL;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  *(void *)&msg.msgh_voucher_port = 0x1107800000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }

  uint64_t v8 = mach_msg(&msg, 3162115, 0x3Cu, 0x30u, special_reply_port, 0, 0);
  uint64_t v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v8)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v9 = 4294966988LL;
      }

      else if (msg.msgh_id == 69852)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 40)
          {
            if (!msg.msgh_remote_port)
            {
              uint64_t v9 = HIDWORD(v14);
              if (!HIDWORD(v14))
              {
                *a5 = v15;
                return v9;
              }

              goto LABEL_22;
            }
          }

          else if (msg.msgh_size == 36)
          {
            if (msg.msgh_remote_port) {
              BOOL v10 = 1;
            }
            else {
              BOOL v10 = HIDWORD(v14) == 0;
            }
            if (v10) {
              uint64_t v9 = 4294966996LL;
            }
            else {
              uint64_t v9 = HIDWORD(v14);
            }
            goto LABEL_22;
          }
        }

        uint64_t v9 = 4294966996LL;
      }

      else
      {
        uint64_t v9 = 4294966995LL;
      }

uint64_t wifi_device_set_event_mask(int a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = a2;
  int v9 = 27918592;
  int v10 = a3;
  uint64_t v11 = *MEMORY[0x1895F8468];
  int v12 = a3;
  uint64_t v13 = a4;
  unint64_t v5 = 0xAAAAAAAA80000013LL;
  int v6 = a1;
  __int128 v7 = xmmword_1865BD360;
  if (MEMORY[0x1895FD5F8]) {
    voucher_mach_msg_set((mach_msg_header_t *)&v5);
  }
  return mach_msg((mach_msg_header_t *)&v5, 2097153, 0x40u, 0, 0, 0, 0);
}

uint64_t wifi_manager_set_background_scan_networks(int a1, uint64_t a2, int a3)
{
  uint64_t v5 = a2;
  int v6 = 27918592;
  int v7 = a3;
  uint64_t v8 = *MEMORY[0x1895F8468];
  int v9 = a3;
  *(void *)mach_msg_header_t msg = 0xAAAAAAAA80000013LL;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_1865BD370;
  if (MEMORY[0x1895FD5F8]) {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  }
  return mach_msg((mach_msg_header_t *)msg, 2097153, 0x38u, 0, 0, 0, 0);
}

uint64_t wifi_manager_set_bgscan_cache_state(int a1, uint64_t a2, int a3)
{
  uint64_t v5 = a2;
  int v6 = 27918592;
  int v7 = a3;
  uint64_t v8 = *MEMORY[0x1895F8468];
  int v9 = a3;
  *(void *)mach_msg_header_t msg = 0xAAAAAAAA80000013LL;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_1865BD380;
  if (MEMORY[0x1895FD5F8]) {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  }
  return mach_msg((mach_msg_header_t *)msg, 2097153, 0x38u, 0, 0, 0, 0);
}

uint64_t wifi_manager_set_scan_backoff_report(mach_port_t a1, int a2)
{
  uint64_t v4 = *MEMORY[0x1895F8468];
  int v5 = a2;
  *(void *)&msg.msgh_bits = 0xAAAAAAAA00000013LL;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 69756;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1895FD5F8]) {
    voucher_mach_msg_set(&msg);
  }
  return mach_msg(&msg, 2097153, 0x24u, 0, 0, 0, 0);
}

uint64_t wifi_manager_set_test_params(int a1, uint64_t a2, int a3)
{
  uint64_t v5 = a2;
  int v6 = 27918592;
  int v7 = a3;
  uint64_t v8 = *MEMORY[0x1895F8468];
  int v9 = a3;
  *(void *)mach_msg_header_t msg = 0xAAAAAAAA80000013LL;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_1865BD390;
  if (MEMORY[0x1895FD5F8]) {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  }
  return mach_msg((mach_msg_header_t *)msg, 2097153, 0x38u, 0, 0, 0, 0);
}

uint64_t wifi_manager_copy_test_params(int a1, uint64_t a2, int a3, void *a4, _DWORD *a5)
{
  *(void *)&__int128 v8 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&rcv_name[16] = 0x1AAAAAAAALL;
  *(_DWORD *)int v19 = -1431655766;
  *(_OWORD *)&v19[4] = v8;
  *(_OWORD *)rcv_mach_port_name_t name = v8;
  uint64_t v16 = a2;
  int v17 = 27918592;
  int v18 = a3;
  *(void *)int v19 = *MEMORY[0x1895F8468];
  *(_DWORD *)&v19[8] = a3;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&rcv_name[4] = a1;
  *(_DWORD *)&rcv_name[8] = special_reply_port;
  int v14 = -2147478253;
  *(void *)&rcv_name[12] = 0x1107E00000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v14);
    mach_port_name_t special_reply_port = *(_DWORD *)&rcv_name[8];
  }

  uint64_t v10 = mach_msg((mach_msg_header_t *)&v14, 3162115, 0x38u, 0x40u, special_reply_port, 0, 0);
  uint64_t v11 = v10;
  if ((v10 - 268435458) > 0xE || ((1 << (v10 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v10)
    {
      if (*(_DWORD *)&rcv_name[16] == 71)
      {
        uint64_t v11 = 4294966988LL;
      }

      else if (*(_DWORD *)&rcv_name[16] == 69858)
      {
        if ((v14 & 0x80000000) == 0)
        {
          if (*(_DWORD *)rcv_name == 36)
          {
            uint64_t v11 = 4294966996LL;
            if (HIDWORD(v16))
            {
              if (*(_DWORD *)&rcv_name[4]) {
                uint64_t v11 = 4294966996LL;
              }
              else {
                uint64_t v11 = HIDWORD(v16);
              }
            }
          }

          else
          {
            uint64_t v11 = 4294966996LL;
          }

          goto LABEL_24;
        }

        uint64_t v11 = 4294966996LL;
        if (*(_DWORD *)&rcv_name[20] == 1 && *(_DWORD *)rcv_name == 56 && !*(_DWORD *)&rcv_name[4] && HIBYTE(v17) == 1)
        {
          int v12 = v18;
          if (v18 == *(_DWORD *)&v19[8])
          {
            uint64_t v11 = 0LL;
            *a4 = v16;
            *a5 = v12;
            return v11;
          }
        }
      }

      else
      {
        uint64_t v11 = 4294966995LL;
      }

uint64_t wifi_manager_copy_version_info(int a1, void *a2, _DWORD *a3)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  *(void *)&__int128 v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v13[12] = v6;
  *(_OWORD *)uint64_t v13 = v6;
  *(_OWORD *)&msg[20] = v6;
  *(_DWORD *)&msg[4] = -1431655766;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)mach_msg_header_t msg = 5395;
  *(void *)&msg[16] = 0x1107F00000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t special_reply_port = *(_DWORD *)&msg[12];
  }

  uint64_t v8 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x18u, 0x40u, special_reply_port, 0, 0);
  uint64_t v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v8)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        uint64_t v9 = 4294966988LL;
      }

      else if (*(_DWORD *)&msg[20] == 69859)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 36)
          {
            uint64_t v9 = 4294966996LL;
            if (*(_DWORD *)&msg[32])
            {
              if (*(_DWORD *)&msg[8]) {
                uint64_t v9 = 4294966996LL;
              }
              else {
                uint64_t v9 = *(unsigned int *)&msg[32];
              }
            }
          }

          else
          {
            uint64_t v9 = 4294966996LL;
          }

          goto LABEL_24;
        }

        uint64_t v9 = 4294966996LL;
        if (*(_DWORD *)&msg[24] == 1 && *(_DWORD *)&msg[4] == 56 && !*(_DWORD *)&msg[8] && v13[3] == 1)
        {
          int v10 = *(_DWORD *)&v13[4];
          if (*(_DWORD *)&v13[4] == *(_DWORD *)&v13[16])
          {
            uint64_t v9 = 0LL;
            *a2 = *(void *)&msg[28];
            *a3 = v10;
            return v9;
          }
        }
      }

      else
      {
        uint64_t v9 = 4294966995LL;
      }

uint64_t wifi_manager_copy_client_names(int a1, void *a2, _DWORD *a3)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  *(void *)&__int128 v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v13[12] = v6;
  *(_OWORD *)uint64_t v13 = v6;
  *(_OWORD *)&msg[20] = v6;
  *(_DWORD *)&msg[4] = -1431655766;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)mach_msg_header_t msg = 5395;
  *(void *)&msg[16] = 0x1108000000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t special_reply_port = *(_DWORD *)&msg[12];
  }

  uint64_t v8 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x18u, 0x40u, special_reply_port, 0, 0);
  uint64_t v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v8)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        uint64_t v9 = 4294966988LL;
      }

      else if (*(_DWORD *)&msg[20] == 69860)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 36)
          {
            uint64_t v9 = 4294966996LL;
            if (*(_DWORD *)&msg[32])
            {
              if (*(_DWORD *)&msg[8]) {
                uint64_t v9 = 4294966996LL;
              }
              else {
                uint64_t v9 = *(unsigned int *)&msg[32];
              }
            }
          }

          else
          {
            uint64_t v9 = 4294966996LL;
          }

          goto LABEL_24;
        }

        uint64_t v9 = 4294966996LL;
        if (*(_DWORD *)&msg[24] == 1 && *(_DWORD *)&msg[4] == 56 && !*(_DWORD *)&msg[8] && v13[3] == 1)
        {
          int v10 = *(_DWORD *)&v13[4];
          if (*(_DWORD *)&v13[4] == *(_DWORD *)&v13[16])
          {
            uint64_t v9 = 0LL;
            *a2 = *(void *)&msg[28];
            *a3 = v10;
            return v9;
          }
        }
      }

      else
      {
        uint64_t v9 = 4294966995LL;
      }

uint64_t wifi_manager_merge_known_networks(mach_port_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  int v12 = 1;
  uint64_t v13 = a2;
  int v14 = 27918592;
  int v15 = a3;
  uint64_t v16 = *MEMORY[0x1895F8468];
  int v17 = a3;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  *(void *)&v11.msgh_bits = 0xAAAAAAAA80001513LL;
  v11.mach_port_t msgh_remote_port = a1;
  v11.msgh_local_port = special_reply_port;
  *(void *)&v11.msgh_voucher_port = 0x1108100000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&v11);
    mach_port_t special_reply_port = v11.msgh_local_port;
  }

  uint64_t v7 = mach_msg(&v11, 3162115, 0x38u, 0x30u, special_reply_port, 0, 0);
  uint64_t v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v7)
    {
      if (v11.msgh_id == 71)
      {
        uint64_t v8 = 4294966988LL;
      }

      else if (v11.msgh_id == 69861)
      {
        if ((v11.msgh_bits & 0x80000000) == 0)
        {
          if (v11.msgh_size == 40)
          {
            if (!v11.msgh_remote_port)
            {
              uint64_t v8 = HIDWORD(v13);
              if (!HIDWORD(v13))
              {
                *a4 = v14;
                return v8;
              }

              goto LABEL_22;
            }
          }

          else if (v11.msgh_size == 36)
          {
            if (v11.msgh_remote_port) {
              BOOL v9 = 1;
            }
            else {
              BOOL v9 = HIDWORD(v13) == 0;
            }
            if (v9) {
              uint64_t v8 = 4294966996LL;
            }
            else {
              uint64_t v8 = HIDWORD(v13);
            }
            goto LABEL_22;
          }
        }

        uint64_t v8 = 4294966996LL;
      }

      else
      {
        uint64_t v8 = 4294966995LL;
      }

uint64_t wifi_device_gas_start_async( mach_port_t a1, uint64_t a2, int a3, uint64_t a4, int a5, uint64_t a6, int a7, int *a8)
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  int v16 = 3;
  uint64_t v17 = a2;
  int v18 = 27918592;
  int v19 = a3;
  uint64_t v20 = a4;
  int v21 = 27918592;
  int v22 = a5;
  uint64_t v23 = a6;
  int v24 = 27918592;
  int v25 = a7;
  uint64_t v26 = *MEMORY[0x1895F8468];
  int v27 = a3;
  int v28 = a5;
  int v29 = a7;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  *(void *)&msg.msgh_bits = 0xAAAAAAAA80001513LL;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  *(void *)&msg.msgh_voucher_port = 0x1108200000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }

  uint64_t v11 = mach_msg(&msg, 3162115, 0x60u, 0x30u, special_reply_port, 0, 0);
  uint64_t v12 = v11;
  if ((v11 - 268435458) > 0xE || ((1 << (v11 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v11)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v12 = 4294966988LL;
      }

      else if (msg.msgh_id == 69862)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 40)
          {
            if (!msg.msgh_remote_port)
            {
              uint64_t v12 = HIDWORD(v17);
              if (!HIDWORD(v17))
              {
                *a8 = v18;
                return v12;
              }

              goto LABEL_22;
            }
          }

          else if (msg.msgh_size == 36)
          {
            if (msg.msgh_remote_port) {
              BOOL v13 = 1;
            }
            else {
              BOOL v13 = HIDWORD(v17) == 0;
            }
            if (v13) {
              uint64_t v12 = 4294966996LL;
            }
            else {
              uint64_t v12 = HIDWORD(v17);
            }
            goto LABEL_22;
          }
        }

        uint64_t v12 = 4294966996LL;
      }

      else
      {
        uint64_t v12 = 4294966995LL;
      }

uint64_t wifi_device_set_rangeable(mach_port_t a1, uint64_t a2, int a3, int a4, uint64_t a5, int a6, int *a7)
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  int v15 = 2;
  uint64_t v16 = a2;
  int v17 = 27918592;
  int v18 = a3;
  uint64_t v19 = a5;
  int v20 = 27918592;
  int v21 = a6;
  uint64_t v22 = *MEMORY[0x1895F8468];
  int v23 = a3;
  int v24 = a4;
  int v25 = a6;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  *(void *)&msg.msgh_bits = 0xAAAAAAAA80001513LL;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  *(void *)&msg.msgh_voucher_port = 0x1108300000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }

  uint64_t v10 = mach_msg(&msg, 3162115, 0x50u, 0x30u, special_reply_port, 0, 0);
  uint64_t v11 = v10;
  if ((v10 - 268435458) > 0xE || ((1 << (v10 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v10)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v11 = 4294966988LL;
      }

      else if (msg.msgh_id == 69863)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 40)
          {
            if (!msg.msgh_remote_port)
            {
              uint64_t v11 = HIDWORD(v16);
              if (!HIDWORD(v16))
              {
                *a7 = v17;
                return v11;
              }

              goto LABEL_22;
            }
          }

          else if (msg.msgh_size == 36)
          {
            if (msg.msgh_remote_port) {
              BOOL v12 = 1;
            }
            else {
              BOOL v12 = HIDWORD(v16) == 0;
            }
            if (v12) {
              uint64_t v11 = 4294966996LL;
            }
            else {
              uint64_t v11 = HIDWORD(v16);
            }
            goto LABEL_22;
          }
        }

        uint64_t v11 = 4294966996LL;
      }

      else
      {
        uint64_t v11 = 4294966995LL;
      }

uint64_t wifi_device_set_ranging_identifier( mach_port_t a1, uint64_t a2, int a3, int a4, uint64_t a5, int a6, int *a7)
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  int v15 = 2;
  uint64_t v16 = a2;
  int v17 = 27918592;
  int v18 = a3;
  uint64_t v19 = a5;
  int v20 = 27918592;
  int v21 = a6;
  uint64_t v22 = *MEMORY[0x1895F8468];
  int v23 = a3;
  int v24 = a4;
  int v25 = a6;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  *(void *)&msg.msgh_bits = 0xAAAAAAAA80001513LL;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  *(void *)&msg.msgh_voucher_port = 0x1108400000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }

  uint64_t v10 = mach_msg(&msg, 3162115, 0x50u, 0x30u, special_reply_port, 0, 0);
  uint64_t v11 = v10;
  if ((v10 - 268435458) > 0xE || ((1 << (v10 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v10)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v11 = 4294966988LL;
      }

      else if (msg.msgh_id == 69864)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 40)
          {
            if (!msg.msgh_remote_port)
            {
              uint64_t v11 = HIDWORD(v16);
              if (!HIDWORD(v16))
              {
                *a7 = v17;
                return v11;
              }

              goto LABEL_22;
            }
          }

          else if (msg.msgh_size == 36)
          {
            if (msg.msgh_remote_port) {
              BOOL v12 = 1;
            }
            else {
              BOOL v12 = HIDWORD(v16) == 0;
            }
            if (v12) {
              uint64_t v11 = 4294966996LL;
            }
            else {
              uint64_t v11 = HIDWORD(v16);
            }
            goto LABEL_22;
          }
        }

        uint64_t v11 = 4294966996LL;
      }

      else
      {
        uint64_t v11 = 4294966995LL;
      }

uint64_t wifi_device_ranging_start_async( mach_port_t a1, uint64_t a2, int a3, uint64_t a4, int a5, int a6, int *a7)
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  int v15 = 2;
  uint64_t v16 = a2;
  int v17 = 27918592;
  int v18 = a3;
  uint64_t v19 = a4;
  int v20 = 27918592;
  int v21 = a5;
  uint64_t v22 = *MEMORY[0x1895F8468];
  int v23 = a3;
  int v24 = a5;
  int v25 = a6;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  *(void *)&msg.msgh_bits = 0xAAAAAAAA80001513LL;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  *(void *)&msg.msgh_voucher_port = 0x1108500000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }

  uint64_t v10 = mach_msg(&msg, 3162115, 0x50u, 0x30u, special_reply_port, 0, 0);
  uint64_t v11 = v10;
  if ((v10 - 268435458) > 0xE || ((1 << (v10 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v10)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v11 = 4294966988LL;
      }

      else if (msg.msgh_id == 69865)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 40)
          {
            if (!msg.msgh_remote_port)
            {
              uint64_t v11 = HIDWORD(v16);
              if (!HIDWORD(v16))
              {
                *a7 = v17;
                return v11;
              }

              goto LABEL_22;
            }
          }

          else if (msg.msgh_size == 36)
          {
            if (msg.msgh_remote_port) {
              BOOL v12 = 1;
            }
            else {
              BOOL v12 = HIDWORD(v16) == 0;
            }
            if (v12) {
              uint64_t v11 = 4294966996LL;
            }
            else {
              uint64_t v11 = HIDWORD(v16);
            }
            goto LABEL_22;
          }
        }

        uint64_t v11 = 4294966996LL;
      }

      else
      {
        uint64_t v11 = 4294966995LL;
      }

uint64_t wifi_device_debug_command( mach_port_t a1, uint64_t a2, int a3, uint64_t a4, int a5, void *a6, _DWORD *a7, _DWORD *a8)
{
  int v18 = 2;
  uint64_t v19 = a2;
  int v20 = 27918592;
  int v21 = a3;
  uint64_t v22 = a4;
  int v23 = 27918592;
  int v24 = a5;
  uint64_t v25 = *MEMORY[0x1895F8468];
  int v26 = a3;
  int v27 = a5;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  *(void *)&v17.msgh_bits = 0xAAAAAAAA80001513LL;
  v17.mach_port_t msgh_remote_port = a1;
  v17.msgh_local_port = special_reply_port;
  *(void *)&v17.msgh_voucher_port = 0x1108600000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&v17);
    mach_port_t special_reply_port = v17.msgh_local_port;
  }

  uint64_t v13 = mach_msg(&v17, 3162115, 0x4Cu, 0x44u, special_reply_port, 0, 0);
  uint64_t v14 = v13;
  if ((v13 - 268435458) > 0xE || ((1 << (v13 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v13)
    {
      if (v17.msgh_id == 71)
      {
        uint64_t v14 = 4294966988LL;
      }

      else if (v17.msgh_id == 69866)
      {
        if ((v17.msgh_bits & 0x80000000) == 0)
        {
          if (v17.msgh_size == 36)
          {
            uint64_t v14 = 4294966996LL;
            if (HIDWORD(v19))
            {
              if (v17.msgh_remote_port) {
                uint64_t v14 = 4294966996LL;
              }
              else {
                uint64_t v14 = HIDWORD(v19);
              }
            }
          }

          else
          {
            uint64_t v14 = 4294966996LL;
          }

          goto LABEL_23;
        }

        uint64_t v14 = 4294966996LL;
        if (v18 == 1 && *(void *)&v17.msgh_size == 60LL && HIBYTE(v20) == 1)
        {
          int v15 = v21;
          if (v21 == v23)
          {
            uint64_t v14 = 0LL;
            *a6 = v19;
            *a7 = v15;
            *a8 = v24;
            return v14;
          }
        }
      }

      else
      {
        uint64_t v14 = 4294966995LL;
      }

uint64_t wifi_device_copy_roam_stats(int a1, uint64_t a2, int a3, void *a4, _DWORD *a5)
{
  *(void *)&__int128 v8 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&rcv_name[16] = 0x1AAAAAAAALL;
  *(_DWORD *)uint64_t v19 = -1431655766;
  *(_OWORD *)&v19[4] = v8;
  *(_OWORD *)rcv_mach_port_name_t name = v8;
  uint64_t v16 = a2;
  int v17 = 27918592;
  int v18 = a3;
  *(void *)uint64_t v19 = *MEMORY[0x1895F8468];
  *(_DWORD *)&v19[8] = a3;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&rcv_name[4] = a1;
  *(_DWORD *)&rcv_name[8] = special_reply_port;
  int v14 = -2147478253;
  *(void *)&rcv_name[12] = 0x1108700000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v14);
    mach_port_name_t special_reply_port = *(_DWORD *)&rcv_name[8];
  }

  uint64_t v10 = mach_msg((mach_msg_header_t *)&v14, 3162115, 0x38u, 0x40u, special_reply_port, 0, 0);
  uint64_t v11 = v10;
  if ((v10 - 268435458) > 0xE || ((1 << (v10 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v10)
    {
      if (*(_DWORD *)&rcv_name[16] == 71)
      {
        uint64_t v11 = 4294966988LL;
      }

      else if (*(_DWORD *)&rcv_name[16] == 69867)
      {
        if ((v14 & 0x80000000) == 0)
        {
          if (*(_DWORD *)rcv_name == 36)
          {
            uint64_t v11 = 4294966996LL;
            if (HIDWORD(v16))
            {
              if (*(_DWORD *)&rcv_name[4]) {
                uint64_t v11 = 4294966996LL;
              }
              else {
                uint64_t v11 = HIDWORD(v16);
              }
            }
          }

          else
          {
            uint64_t v11 = 4294966996LL;
          }

          goto LABEL_24;
        }

        uint64_t v11 = 4294966996LL;
        if (*(_DWORD *)&rcv_name[20] == 1 && *(_DWORD *)rcv_name == 56 && !*(_DWORD *)&rcv_name[4] && HIBYTE(v17) == 1)
        {
          int v12 = v18;
          if (v18 == *(_DWORD *)&v19[8])
          {
            uint64_t v11 = 0LL;
            *a4 = v16;
            *a5 = v12;
            return v11;
          }
        }
      }

      else
      {
        uint64_t v11 = 4294966995LL;
      }

uint64_t wifi_device_set_trgdisc_params(mach_port_t a1, uint64_t a2, int a3, uint64_t a4, int a5, int *a6)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  int v14 = 2;
  uint64_t v15 = a2;
  int v16 = 27918592;
  int v17 = a3;
  uint64_t v18 = a4;
  int v19 = 27918592;
  int v20 = a5;
  uint64_t v21 = *MEMORY[0x1895F8468];
  int v22 = a3;
  int v23 = a5;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  *(void *)&msg.msgh_bits = 0xAAAAAAAA80001513LL;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  *(void *)&msg.msgh_voucher_port = 0x1108800000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }

  uint64_t v9 = mach_msg(&msg, 3162115, 0x4Cu, 0x30u, special_reply_port, 0, 0);
  uint64_t v10 = v9;
  if ((v9 - 268435458) > 0xE || ((1 << (v9 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v9)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v10 = 4294966988LL;
      }

      else if (msg.msgh_id == 69868)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 40)
          {
            if (!msg.msgh_remote_port)
            {
              uint64_t v10 = HIDWORD(v15);
              if (!HIDWORD(v15))
              {
                *a6 = v16;
                return v10;
              }

              goto LABEL_22;
            }
          }

          else if (msg.msgh_size == 36)
          {
            if (msg.msgh_remote_port) {
              BOOL v11 = 1;
            }
            else {
              BOOL v11 = HIDWORD(v15) == 0;
            }
            if (v11) {
              uint64_t v10 = 4294966996LL;
            }
            else {
              uint64_t v10 = HIDWORD(v15);
            }
            goto LABEL_22;
          }
        }

        uint64_t v10 = 4294966996LL;
      }

      else
      {
        uint64_t v10 = 4294966995LL;
      }

uint64_t wifi_device_copy_interface_state_info( mach_port_t a1, uint64_t a2, unsigned int a3, unsigned int a4, void *a5, unsigned int *a6, _DWORD *a7)
{
  *(void *)&__int128 v11 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
  msg.msgh_id = -1431655766;
  unint64_t v22 = 0xAAAAAAAAAAAAAAAALL;
  __int128 v23 = v11;
  *(_OWORD *)&msg.msgh_size = v11;
  int v18 = 1;
  uint64_t v19 = a2;
  int v20 = 27918592;
  unsigned int v21 = a3;
  unint64_t v22 = *MEMORY[0x1895F8468];
  *(void *)&__int128 v23 = __PAIR64__(a4, a3);
  mach_port_t special_reply_port = mig_get_special_reply_port();
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  msg.msgh_bits = -2147478253;
  *(void *)&msg.msgh_voucher_port = 0x1108900000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }

  uint64_t v13 = mach_msg(&msg, 3162115, 0x3Cu, 0x44u, special_reply_port, 0, 0);
  uint64_t v14 = v13;
  if ((v13 - 268435458) > 0xE || ((1 << (v13 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v13)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v14 = 4294966988LL;
      }

      else if (msg.msgh_id == 69869)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 36)
          {
            uint64_t v14 = 4294966996LL;
            if (HIDWORD(v19))
            {
              if (msg.msgh_remote_port) {
                uint64_t v14 = 4294966996LL;
              }
              else {
                uint64_t v14 = HIDWORD(v19);
              }
            }
          }

          else
          {
            uint64_t v14 = 4294966996LL;
          }

          goto LABEL_24;
        }

        uint64_t v14 = 4294966996LL;
        if (v18 == 1 && msg.msgh_size == 60 && !msg.msgh_remote_port && HIBYTE(v20) == 1)
        {
          unsigned int v15 = v21;
          if (v21 == (_DWORD)v23)
          {
            uint64_t v14 = 0LL;
            *a5 = v19;
            *a6 = v15;
            *a7 = DWORD1(v23);
            return v14;
          }
        }
      }

      else
      {
        uint64_t v14 = 4294966995LL;
      }

uint64_t wifi_manager_dump_logs(int a1, uint64_t a2, int a3)
{
  uint64_t v5 = a2;
  int v6 = 27918592;
  int v7 = a3;
  uint64_t v8 = *MEMORY[0x1895F8468];
  int v9 = a3;
  *(void *)mach_msg_header_t msg = 0xAAAAAAAA80000013LL;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_1865BD3A0;
  if (MEMORY[0x1895FD5F8]) {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  }
  return mach_msg((mach_msg_header_t *)msg, 2097153, 0x38u, 0, 0, 0, 0);
}

uint64_t wifi_manager_add_policy(int a1, uint64_t a2, int a3, int a4)
{
  uint64_t v8 = a2;
  int v9 = 27918592;
  int v10 = a3;
  uint64_t v11 = *MEMORY[0x1895F8468];
  int v12 = a3;
  int v13 = a4;
  unint64_t v5 = 0xAAAAAAAA80000013LL;
  int v6 = a1;
  __int128 v7 = xmmword_1865BD3B0;
  if (MEMORY[0x1895FD5F8]) {
    voucher_mach_msg_set((mach_msg_header_t *)&v5);
  }
  return mach_msg((mach_msg_header_t *)&v5, 2097153, 0x3Cu, 0, 0, 0, 0);
}

uint64_t wifi_manager_remove_policy(int a1, uint64_t a2, int a3, int a4)
{
  uint64_t v8 = a2;
  int v9 = 27918592;
  int v10 = a3;
  uint64_t v11 = *MEMORY[0x1895F8468];
  int v12 = a3;
  int v13 = a4;
  unint64_t v5 = 0xAAAAAAAA80000013LL;
  int v6 = a1;
  __int128 v7 = xmmword_1865BD3C0;
  if (MEMORY[0x1895FD5F8]) {
    voucher_mach_msg_set((mach_msg_header_t *)&v5);
  }
  return mach_msg((mach_msg_header_t *)&v5, 2097153, 0x3Cu, 0, 0, 0, 0);
}

uint64_t wifi_manager_copy_policies(int a1, void *a2, _DWORD *a3)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  *(void *)&__int128 v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v13[12] = v6;
  *(_OWORD *)int v13 = v6;
  *(_OWORD *)&msg[20] = v6;
  *(_DWORD *)&msg[4] = -1431655766;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)mach_msg_header_t msg = 5395;
  *(void *)&msg[16] = 0x1108D00000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t special_reply_port = *(_DWORD *)&msg[12];
  }

  uint64_t v8 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x18u, 0x40u, special_reply_port, 0, 0);
  uint64_t v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v8)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        uint64_t v9 = 4294966988LL;
      }

      else if (*(_DWORD *)&msg[20] == 69873)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 36)
          {
            uint64_t v9 = 4294966996LL;
            if (*(_DWORD *)&msg[32])
            {
              if (*(_DWORD *)&msg[8]) {
                uint64_t v9 = 4294966996LL;
              }
              else {
                uint64_t v9 = *(unsigned int *)&msg[32];
              }
            }
          }

          else
          {
            uint64_t v9 = 4294966996LL;
          }

          goto LABEL_24;
        }

        uint64_t v9 = 4294966996LL;
        if (*(_DWORD *)&msg[24] == 1 && *(_DWORD *)&msg[4] == 56 && !*(_DWORD *)&msg[8] && v13[3] == 1)
        {
          int v10 = *(_DWORD *)&v13[4];
          if (*(_DWORD *)&v13[4] == *(_DWORD *)&v13[16])
          {
            uint64_t v9 = 0LL;
            *a2 = *(void *)&msg[28];
            *a3 = v10;
            return v9;
          }
        }
      }

      else
      {
        uint64_t v9 = 4294966995LL;
      }

uint64_t wifi_manager_is_restriction_policy_active(int a1, _DWORD *a2)
{
  *(void *)&__int128 v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&rcv_name_12[16] = v4;
  *(_OWORD *)&rcv_name_12[4] = v4;
  rcv_mach_port_name_t name = -1431655766;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  int rcv_name_4 = a1;
  mach_port_name_t rcv_name_8 = special_reply_port;
  int v10 = 5395;
  *(void *)rcv_name_12 = 0x1108E00000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v10);
    mach_port_name_t special_reply_port = rcv_name_8;
  }

  uint64_t v6 = mach_msg((mach_msg_header_t *)&v10, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  uint64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v6)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        uint64_t v7 = 4294966988LL;
      }

      else if (*(_DWORD *)&rcv_name_12[4] == 69874)
      {
        if ((v10 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = *(_DWORD *)&rcv_name_12[20];
                return v7;
              }

              goto LABEL_22;
            }
          }

          else if (rcv_name == 36)
          {
            if (rcv_name_4) {
              BOOL v8 = 1;
            }
            else {
              BOOL v8 = *(_DWORD *)&rcv_name_12[16] == 0;
            }
            if (v8) {
              uint64_t v7 = 4294966996LL;
            }
            else {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
            }
            goto LABEL_22;
          }
        }

        uint64_t v7 = 4294966996LL;
      }

      else
      {
        uint64_t v7 = 4294966995LL;
      }

uint64_t wifi_manager_set_incar_state(int a1, int a2, uint64_t a3, int a4)
{
  uint64_t v8 = a3;
  int v9 = 27918592;
  int v10 = a4;
  uint64_t v11 = *MEMORY[0x1895F8468];
  int v12 = a2;
  int v13 = a4;
  unint64_t v5 = 0xAAAAAAAA80000013LL;
  int v6 = a1;
  __int128 v7 = xmmword_1865BD3D0;
  if (MEMORY[0x1895FD5F8]) {
    voucher_mach_msg_set((mach_msg_header_t *)&v5);
  }
  return mach_msg((mach_msg_header_t *)&v5, 2097153, 0x3Cu, 0, 0, 0, 0);
}

uint64_t wifi_manager_set_thermal_index(mach_port_t a1, int a2)
{
  uint64_t v4 = *MEMORY[0x1895F8468];
  int v5 = a2;
  *(void *)&msg.msgh_bits = 0xAAAAAAAA00000013LL;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 69776;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1895FD5F8]) {
    voucher_mach_msg_set(&msg);
  }
  return mach_msg(&msg, 2097153, 0x24u, 0, 0, 0, 0);
}

uint64_t wifi_manager_get_thermal_index(int a1, _DWORD *a2)
{
  *(void *)&__int128 v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&rcv_name_12[16] = v4;
  *(_OWORD *)&rcv_name_12[4] = v4;
  rcv_mach_port_name_t name = -1431655766;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  int rcv_name_4 = a1;
  mach_port_name_t rcv_name_8 = special_reply_port;
  int v10 = 5395;
  *(void *)rcv_name_12 = 0x1109100000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v10);
    mach_port_name_t special_reply_port = rcv_name_8;
  }

  uint64_t v6 = mach_msg((mach_msg_header_t *)&v10, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  uint64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v6)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        uint64_t v7 = 4294966988LL;
      }

      else if (*(_DWORD *)&rcv_name_12[4] == 69877)
      {
        if ((v10 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = *(_DWORD *)&rcv_name_12[20];
                return v7;
              }

              goto LABEL_22;
            }
          }

          else if (rcv_name == 36)
          {
            if (rcv_name_4) {
              BOOL v8 = 1;
            }
            else {
              BOOL v8 = *(_DWORD *)&rcv_name_12[16] == 0;
            }
            if (v8) {
              uint64_t v7 = 4294966996LL;
            }
            else {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
            }
            goto LABEL_22;
          }
        }

        uint64_t v7 = 4294966996LL;
      }

      else
      {
        uint64_t v7 = 4294966995LL;
      }

uint64_t wifi_device_wowblacklist_command( mach_port_t a1, uint64_t a2, int a3, uint64_t a4, int a5, void *a6, _DWORD *a7, _DWORD *a8)
{
  int v18 = 2;
  uint64_t v19 = a2;
  int v20 = 27918592;
  int v21 = a3;
  uint64_t v22 = a4;
  int v23 = 27918592;
  int v24 = a5;
  uint64_t v25 = *MEMORY[0x1895F8468];
  int v26 = a3;
  int v27 = a5;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  *(void *)&v17.msgh_bits = 0xAAAAAAAA80001513LL;
  v17.mach_port_t msgh_remote_port = a1;
  v17.msgh_local_port = special_reply_port;
  *(void *)&v17.msgh_voucher_port = 0x1109200000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&v17);
    mach_port_t special_reply_port = v17.msgh_local_port;
  }

  uint64_t v13 = mach_msg(&v17, 3162115, 0x4Cu, 0x44u, special_reply_port, 0, 0);
  uint64_t v14 = v13;
  if ((v13 - 268435458) > 0xE || ((1 << (v13 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v13)
    {
      if (v17.msgh_id == 71)
      {
        uint64_t v14 = 4294966988LL;
      }

      else if (v17.msgh_id == 69878)
      {
        if ((v17.msgh_bits & 0x80000000) == 0)
        {
          if (v17.msgh_size == 36)
          {
            uint64_t v14 = 4294966996LL;
            if (HIDWORD(v19))
            {
              if (v17.msgh_remote_port) {
                uint64_t v14 = 4294966996LL;
              }
              else {
                uint64_t v14 = HIDWORD(v19);
              }
            }
          }

          else
          {
            uint64_t v14 = 4294966996LL;
          }

          goto LABEL_23;
        }

        uint64_t v14 = 4294966996LL;
        if (v18 == 1 && *(void *)&v17.msgh_size == 60LL && HIBYTE(v20) == 1)
        {
          int v15 = v21;
          if (v21 == v23)
          {
            uint64_t v14 = 0LL;
            *a6 = v19;
            *a7 = v15;
            *a8 = v24;
            return v14;
          }
        }
      }

      else
      {
        uint64_t v14 = 4294966995LL;
      }

uint64_t wifi_manager_copy_leeched_location(int a1, void *a2, _DWORD *a3)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  *(void *)&__int128 v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v13[12] = v6;
  *(_OWORD *)uint64_t v13 = v6;
  *(_OWORD *)&msg[20] = v6;
  *(_DWORD *)&msg[4] = -1431655766;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)mach_msg_header_t msg = 5395;
  *(void *)&msg[16] = 0x1109300000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t special_reply_port = *(_DWORD *)&msg[12];
  }

  uint64_t v8 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x18u, 0x40u, special_reply_port, 0, 0);
  uint64_t v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v8)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        uint64_t v9 = 4294966988LL;
      }

      else if (*(_DWORD *)&msg[20] == 69879)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 36)
          {
            uint64_t v9 = 4294966996LL;
            if (*(_DWORD *)&msg[32])
            {
              if (*(_DWORD *)&msg[8]) {
                uint64_t v9 = 4294966996LL;
              }
              else {
                uint64_t v9 = *(unsigned int *)&msg[32];
              }
            }
          }

          else
          {
            uint64_t v9 = 4294966996LL;
          }

          goto LABEL_24;
        }

        uint64_t v9 = 4294966996LL;
        if (*(_DWORD *)&msg[24] == 1 && *(_DWORD *)&msg[4] == 56 && !*(_DWORD *)&msg[8] && v13[3] == 1)
        {
          int v10 = *(_DWORD *)&v13[4];
          if (*(_DWORD *)&v13[4] == *(_DWORD *)&v13[16])
          {
            uint64_t v9 = 0LL;
            *a2 = *(void *)&msg[28];
            *a3 = v10;
            return v9;
          }
        }
      }

      else
      {
        uint64_t v9 = 4294966995LL;
      }

uint64_t wifi_manager_copy_geotags_for_network(int a1, uint64_t a2, int a3, void *a4, _DWORD *a5)
{
  *(void *)&__int128 v8 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&rcv_name[16] = 0x1AAAAAAAALL;
  *(_DWORD *)uint64_t v19 = -1431655766;
  *(_OWORD *)&v19[4] = v8;
  *(_OWORD *)rcv_mach_port_name_t name = v8;
  uint64_t v16 = a2;
  int v17 = 27918592;
  int v18 = a3;
  *(void *)uint64_t v19 = *MEMORY[0x1895F8468];
  *(_DWORD *)&v19[8] = a3;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&rcv_name[4] = a1;
  *(_DWORD *)&rcv_name[8] = special_reply_port;
  int v14 = -2147478253;
  *(void *)&rcv_name[12] = 0x1109400000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v14);
    mach_port_name_t special_reply_port = *(_DWORD *)&rcv_name[8];
  }

  uint64_t v10 = mach_msg((mach_msg_header_t *)&v14, 3162115, 0x38u, 0x40u, special_reply_port, 0, 0);
  uint64_t v11 = v10;
  if ((v10 - 268435458) > 0xE || ((1 << (v10 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v10)
    {
      if (*(_DWORD *)&rcv_name[16] == 71)
      {
        uint64_t v11 = 4294966988LL;
      }

      else if (*(_DWORD *)&rcv_name[16] == 69880)
      {
        if ((v14 & 0x80000000) == 0)
        {
          if (*(_DWORD *)rcv_name == 36)
          {
            uint64_t v11 = 4294966996LL;
            if (HIDWORD(v16))
            {
              if (*(_DWORD *)&rcv_name[4]) {
                uint64_t v11 = 4294966996LL;
              }
              else {
                uint64_t v11 = HIDWORD(v16);
              }
            }
          }

          else
          {
            uint64_t v11 = 4294966996LL;
          }

          goto LABEL_24;
        }

        uint64_t v11 = 4294966996LL;
        if (*(_DWORD *)&rcv_name[20] == 1 && *(_DWORD *)rcv_name == 56 && !*(_DWORD *)&rcv_name[4] && HIBYTE(v17) == 1)
        {
          int v12 = v18;
          if (v18 == *(_DWORD *)&v19[8])
          {
            uint64_t v11 = 0LL;
            *a4 = v16;
            *a5 = v12;
            return v11;
          }
        }
      }

      else
      {
        uint64_t v11 = 4294966995LL;
      }

uint64_t wifi_manager_set_geotag_for_network(int a1, uint64_t a2, int a3, double a4, double a5)
{
  *(void *)mach_msg_header_t msg = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v7 = a2;
  int v8 = 27918592;
  int v9 = a3;
  uint64_t v10 = *MEMORY[0x1895F8468];
  int v11 = a3;
  double v12 = a4;
  double v13 = a5;
  *(_DWORD *)mach_msg_header_t msg = -2147483629;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_1865BD3E0;
  if (MEMORY[0x1895FD5F8]) {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  }
  return mach_msg((mach_msg_header_t *)msg, 2097153, 0x48u, 0, 0, 0, 0);
}

uint64_t wifi_manager_copy_networks_at_location(int a1, int a2, void *a3, _DWORD *a4, double a5, double a6)
{
  *(void *)&__int128 v9 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&rcv_name[16] = v9;
  *(_OWORD *)&rcv_name[32] = v9;
  *(_OWORD *)&_BYTE rcv_name[44] = v9;
  *(_OWORD *)rcv_mach_port_name_t name = v9;
  *(void *)&rcv_name[20] = *MEMORY[0x1895F8468];
  *(double *)&rcv_name[28] = a5;
  *(double *)&rcv_name[36] = a6;
  *(_DWORD *)&_BYTE rcv_name[44] = a2;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&rcv_name[4] = a1;
  *(_DWORD *)&rcv_name[8] = special_reply_port;
  int v15 = 5395;
  *(void *)&rcv_name[12] = 0x1109600000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v15);
    mach_port_name_t special_reply_port = *(_DWORD *)&rcv_name[8];
  }

  uint64_t v11 = mach_msg((mach_msg_header_t *)&v15, 3162115, 0x34u, 0x40u, special_reply_port, 0, 0);
  uint64_t v12 = v11;
  if ((v11 - 268435458) > 0xE || ((1 << (v11 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v11)
    {
      if (*(_DWORD *)&rcv_name[16] == 71)
      {
        uint64_t v12 = 4294966988LL;
      }

      else if (*(_DWORD *)&rcv_name[16] == 69882)
      {
        if ((v15 & 0x80000000) == 0)
        {
          if (*(_DWORD *)rcv_name == 36)
          {
            uint64_t v12 = 4294966996LL;
            if (*(_DWORD *)&rcv_name[28])
            {
              if (*(_DWORD *)&rcv_name[4]) {
                uint64_t v12 = 4294966996LL;
              }
              else {
                uint64_t v12 = *(unsigned int *)&rcv_name[28];
              }
            }
          }

          else
          {
            uint64_t v12 = 4294966996LL;
          }

          goto LABEL_24;
        }

        uint64_t v12 = 4294966996LL;
        if (*(_DWORD *)&rcv_name[20] == 1 && *(_DWORD *)rcv_name == 56 && !*(_DWORD *)&rcv_name[4] && rcv_name[35] == 1)
        {
          int v13 = *(_DWORD *)&rcv_name[36];
          if (*(_DWORD *)&rcv_name[36] == *(_DWORD *)&rcv_name[48])
          {
            uint64_t v12 = 0LL;
            *a3 = *(void *)&rcv_name[24];
            *a4 = v13;
            return v12;
          }
        }
      }

      else
      {
        uint64_t v12 = 4294966995LL;
      }

uint64_t wifi_manager_copy_score_for_network(int a1, uint64_t a2, int a3, void *a4, _DWORD *a5)
{
  *(void *)&__int128 v8 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&rcv_name[16] = 0x1AAAAAAAALL;
  *(_DWORD *)uint64_t v19 = -1431655766;
  *(_OWORD *)&v19[4] = v8;
  *(_OWORD *)rcv_mach_port_name_t name = v8;
  uint64_t v16 = a2;
  int v17 = 27918592;
  int v18 = a3;
  *(void *)uint64_t v19 = *MEMORY[0x1895F8468];
  *(_DWORD *)&v19[8] = a3;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&rcv_name[4] = a1;
  *(_DWORD *)&rcv_name[8] = special_reply_port;
  int v14 = -2147478253;
  *(void *)&rcv_name[12] = 0x1109700000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v14);
    mach_port_name_t special_reply_port = *(_DWORD *)&rcv_name[8];
  }

  uint64_t v10 = mach_msg((mach_msg_header_t *)&v14, 3162115, 0x38u, 0x40u, special_reply_port, 0, 0);
  uint64_t v11 = v10;
  if ((v10 - 268435458) > 0xE || ((1 << (v10 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v10)
    {
      if (*(_DWORD *)&rcv_name[16] == 71)
      {
        uint64_t v11 = 4294966988LL;
      }

      else if (*(_DWORD *)&rcv_name[16] == 69883)
      {
        if ((v14 & 0x80000000) == 0)
        {
          if (*(_DWORD *)rcv_name == 36)
          {
            uint64_t v11 = 4294966996LL;
            if (HIDWORD(v16))
            {
              if (*(_DWORD *)&rcv_name[4]) {
                uint64_t v11 = 4294966996LL;
              }
              else {
                uint64_t v11 = HIDWORD(v16);
              }
            }
          }

          else
          {
            uint64_t v11 = 4294966996LL;
          }

          goto LABEL_24;
        }

        uint64_t v11 = 4294966996LL;
        if (*(_DWORD *)&rcv_name[20] == 1 && *(_DWORD *)rcv_name == 56 && !*(_DWORD *)&rcv_name[4] && HIBYTE(v17) == 1)
        {
          int v12 = v18;
          if (v18 == *(_DWORD *)&v19[8])
          {
            uint64_t v11 = 0LL;
            *a4 = v16;
            *a5 = v12;
            return v11;
          }
        }
      }

      else
      {
        uint64_t v11 = 4294966995LL;
      }

uint64_t wifi_device_soft_error_notification(mach_port_t a1, uint64_t a2, int a3, uint64_t a4, int a5, int *a6)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  int v14 = 2;
  uint64_t v15 = a2;
  int v16 = 27918592;
  int v17 = a3;
  uint64_t v18 = a4;
  int v19 = 27918592;
  int v20 = a5;
  uint64_t v21 = *MEMORY[0x1895F8468];
  int v22 = a3;
  int v23 = a5;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  *(void *)&msg.msgh_bits = 0xAAAAAAAA80001513LL;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  *(void *)&msg.msgh_voucher_port = 0x1109800000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }

  uint64_t v9 = mach_msg(&msg, 3162115, 0x4Cu, 0x30u, special_reply_port, 0, 0);
  uint64_t v10 = v9;
  if ((v9 - 268435458) > 0xE || ((1 << (v9 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v9)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v10 = 4294966988LL;
      }

      else if (msg.msgh_id == 69884)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 40)
          {
            if (!msg.msgh_remote_port)
            {
              uint64_t v10 = HIDWORD(v15);
              if (!HIDWORD(v15))
              {
                *a6 = v16;
                return v10;
              }

              goto LABEL_22;
            }
          }

          else if (msg.msgh_size == 36)
          {
            if (msg.msgh_remote_port) {
              BOOL v11 = 1;
            }
            else {
              BOOL v11 = HIDWORD(v15) == 0;
            }
            if (v11) {
              uint64_t v10 = 4294966996LL;
            }
            else {
              uint64_t v10 = HIDWORD(v15);
            }
            goto LABEL_22;
          }
        }

        uint64_t v10 = 4294966996LL;
      }

      else
      {
        uint64_t v10 = 4294966995LL;
      }

uint64_t wifi_manager_copy_softerror_counters(int a1, void *a2, _DWORD *a3)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  *(void *)&__int128 v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v13[12] = v6;
  *(_OWORD *)int v13 = v6;
  *(_OWORD *)&msg[20] = v6;
  *(_DWORD *)&msg[4] = -1431655766;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)mach_msg_header_t msg = 5395;
  *(void *)&msg[16] = 0x1109900000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t special_reply_port = *(_DWORD *)&msg[12];
  }

  uint64_t v8 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x18u, 0x40u, special_reply_port, 0, 0);
  uint64_t v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v8)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        uint64_t v9 = 4294966988LL;
      }

      else if (*(_DWORD *)&msg[20] == 69885)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 36)
          {
            uint64_t v9 = 4294966996LL;
            if (*(_DWORD *)&msg[32])
            {
              if (*(_DWORD *)&msg[8]) {
                uint64_t v9 = 4294966996LL;
              }
              else {
                uint64_t v9 = *(unsigned int *)&msg[32];
              }
            }
          }

          else
          {
            uint64_t v9 = 4294966996LL;
          }

          goto LABEL_24;
        }

        uint64_t v9 = 4294966996LL;
        if (*(_DWORD *)&msg[24] == 1 && *(_DWORD *)&msg[4] == 56 && !*(_DWORD *)&msg[8] && v13[3] == 1)
        {
          int v10 = *(_DWORD *)&v13[4];
          if (*(_DWORD *)&v13[4] == *(_DWORD *)&v13[16])
          {
            uint64_t v9 = 0LL;
            *a2 = *(void *)&msg[28];
            *a3 = v10;
            return v9;
          }
        }
      }

      else
      {
        uint64_t v9 = 4294966995LL;
      }

uint64_t wifi_manager_copy_current_session_based_network(int a1, void *a2, _DWORD *a3)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  *(void *)&__int128 v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v13[12] = v6;
  *(_OWORD *)int v13 = v6;
  *(_OWORD *)&msg[20] = v6;
  *(_DWORD *)&msg[4] = -1431655766;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)mach_msg_header_t msg = 5395;
  *(void *)&msg[16] = 0x1109A00000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t special_reply_port = *(_DWORD *)&msg[12];
  }

  uint64_t v8 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x18u, 0x40u, special_reply_port, 0, 0);
  uint64_t v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v8)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        uint64_t v9 = 4294966988LL;
      }

      else if (*(_DWORD *)&msg[20] == 69886)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 36)
          {
            uint64_t v9 = 4294966996LL;
            if (*(_DWORD *)&msg[32])
            {
              if (*(_DWORD *)&msg[8]) {
                uint64_t v9 = 4294966996LL;
              }
              else {
                uint64_t v9 = *(unsigned int *)&msg[32];
              }
            }
          }

          else
          {
            uint64_t v9 = 4294966996LL;
          }

          goto LABEL_24;
        }

        uint64_t v9 = 4294966996LL;
        if (*(_DWORD *)&msg[24] == 1 && *(_DWORD *)&msg[4] == 56 && !*(_DWORD *)&msg[8] && v13[3] == 1)
        {
          int v10 = *(_DWORD *)&v13[4];
          if (*(_DWORD *)&v13[4] == *(_DWORD *)&v13[16])
          {
            uint64_t v9 = 0LL;
            *a2 = *(void *)&msg[28];
            *a3 = v10;
            return v9;
          }
        }
      }

      else
      {
        uint64_t v9 = 4294966995LL;
      }

uint64_t wifi_manager_set_user_auto_join_state(mach_port_t a1, int a2)
{
  uint64_t v4 = *MEMORY[0x1895F8468];
  int v5 = a2;
  *(void *)&msg.msgh_bits = 0xAAAAAAAA00000013LL;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 69787;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1895FD5F8]) {
    voucher_mach_msg_set(&msg);
  }
  return mach_msg(&msg, 2097153, 0x24u, 0, 0, 0, 0);
}

uint64_t wifi_manager_get_user_auto_join_state(int a1, _DWORD *a2)
{
  *(void *)&__int128 v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&rcv_name_12[16] = v4;
  *(_OWORD *)&rcv_name_12[4] = v4;
  rcv_mach_port_name_t name = -1431655766;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  int rcv_name_4 = a1;
  mach_port_name_t rcv_name_8 = special_reply_port;
  int v10 = 5395;
  *(void *)rcv_name_12 = 0x1109C00000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v10);
    mach_port_name_t special_reply_port = rcv_name_8;
  }

  uint64_t v6 = mach_msg((mach_msg_header_t *)&v10, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  uint64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v6)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        uint64_t v7 = 4294966988LL;
      }

      else if (*(_DWORD *)&rcv_name_12[4] == 69888)
      {
        if ((v10 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = *(_DWORD *)&rcv_name_12[20];
                return v7;
              }

              goto LABEL_22;
            }
          }

          else if (rcv_name == 36)
          {
            if (rcv_name_4) {
              BOOL v8 = 1;
            }
            else {
              BOOL v8 = *(_DWORD *)&rcv_name_12[16] == 0;
            }
            if (v8) {
              uint64_t v7 = 4294966996LL;
            }
            else {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
            }
            goto LABEL_22;
          }
        }

        uint64_t v7 = 4294966996LL;
      }

      else
      {
        uint64_t v7 = 4294966995LL;
      }

uint64_t wifi_manager_remove_orphaned_sc_network_sets(mach_port_t a1)
{
  *(void *)&msg.msgh_bits = 0xAAAAAAAA00000013LL;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 69789;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1895FD5F8]) {
    voucher_mach_msg_set(&msg);
  }
  return mach_msg(&msg, 2097153, 0x18u, 0, 0, 0, 0);
}

uint64_t wifi_manager_migrate_list(mach_port_t a1)
{
  *(void *)&msg.msgh_bits = 0xAAAAAAAA00000013LL;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 69790;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1895FD5F8]) {
    voucher_mach_msg_set(&msg);
  }
  return mach_msg(&msg, 2097153, 0x18u, 0, 0, 0, 0);
}

uint64_t wifi_manager_remove_unused_network_geotags(mach_port_t a1, double a2)
{
  uint64_t v4 = *MEMORY[0x1895F8468];
  double v5 = a2;
  *(void *)&msg.msgh_bits = 0xAAAAAAAA00000013LL;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 69791;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1895FD5F8]) {
    voucher_mach_msg_set(&msg);
  }
  return mach_msg(&msg, 2097153, 0x28u, 0, 0, 0, 0);
}

uint64_t wifi_manager_schedule_unused_network_geotags_removal_test(mach_port_t a1, int a2, double a3)
{
  uint64_t v5 = *MEMORY[0x1895F8468];
  double v6 = a3;
  int v7 = a2;
  *(void *)&v4.msgh_bits = 0xAAAAAAAA00000013LL;
  v4.msgh_voucher_port = 0;
  v4.msgh_id = 69792;
  v4.mach_port_t msgh_remote_port = a1;
  v4.msgh_local_port = 0;
  if (MEMORY[0x1895FD5F8]) {
    voucher_mach_msg_set(&v4);
  }
  return mach_msg(&v4, 2097153, 0x2Cu, 0, 0, 0, 0);
}

uint64_t wifi_manager_unschedule_unused_network_geotags_removal_test(mach_port_t a1)
{
  *(void *)&msg.msgh_bits = 0xAAAAAAAA00000013LL;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 69793;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1895FD5F8]) {
    voucher_mach_msg_set(&msg);
  }
  return mach_msg(&msg, 2097153, 0x18u, 0, 0, 0, 0);
}

uint64_t wifi_device_autojoinblacklist_command( mach_port_t a1, uint64_t a2, int a3, uint64_t a4, int a5, void *a6, _DWORD *a7)
{
  int v16 = 2;
  uint64_t v17 = a2;
  int v18 = 27918592;
  int v19 = a3;
  uint64_t v20 = a4;
  int v21 = 27918592;
  int v22 = a5;
  uint64_t v23 = *MEMORY[0x1895F8468];
  int v24 = a3;
  int v25 = a5;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  *(void *)&v15.msgh_bits = 0xAAAAAAAA80001513LL;
  v15.mach_port_t msgh_remote_port = a1;
  v15.msgh_local_port = special_reply_port;
  *(void *)&v15.msgh_voucher_port = 0x110A200000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&v15);
    mach_port_t special_reply_port = v15.msgh_local_port;
  }

  uint64_t v11 = mach_msg(&v15, 3162115, 0x4Cu, 0x40u, special_reply_port, 0, 0);
  uint64_t v12 = v11;
  if ((v11 - 268435458) > 0xE || ((1 << (v11 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v11)
    {
      if (v15.msgh_id == 71)
      {
        uint64_t v12 = 4294966988LL;
      }

      else if (v15.msgh_id == 69894)
      {
        if ((v15.msgh_bits & 0x80000000) == 0)
        {
          if (v15.msgh_size == 36)
          {
            uint64_t v12 = 4294966996LL;
            if (HIDWORD(v17))
            {
              if (v15.msgh_remote_port) {
                uint64_t v12 = 4294966996LL;
              }
              else {
                uint64_t v12 = HIDWORD(v17);
              }
            }
          }

          else
          {
            uint64_t v12 = 4294966996LL;
          }

          goto LABEL_23;
        }

        uint64_t v12 = 4294966996LL;
        if (v16 == 1 && *(void *)&v15.msgh_size == 56LL && HIBYTE(v18) == 1)
        {
          int v13 = v19;
          if (v19 == v21)
          {
            uint64_t v12 = 0LL;
            *a6 = v17;
            *a7 = v13;
            return v12;
          }
        }
      }

      else
      {
        uint64_t v12 = 4294966995LL;
      }

uint64_t wifi_manager_simulate_notification(int a1, uint64_t a2, int a3, int a4, uint64_t a5, int a6)
{
  uint64_t v10 = a2;
  int v11 = 27918592;
  int v12 = a3;
  uint64_t v13 = a5;
  int v14 = 27918592;
  int v15 = a6;
  uint64_t v16 = *MEMORY[0x1895F8468];
  int v17 = a3;
  int v18 = a4;
  int v19 = a6;
  unint64_t v7 = 0xAAAAAAAA80000013LL;
  int v8 = a1;
  __int128 v9 = xmmword_1865BD3F0;
  if (MEMORY[0x1895FD5F8]) {
    voucher_mach_msg_set((mach_msg_header_t *)&v7);
  }
  return mach_msg((mach_msg_header_t *)&v7, 2097153, 0x50u, 0, 0, 0, 0);
}

uint64_t wifi_device_destroy_eap_trust_current_network(mach_port_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  int v12 = 1;
  uint64_t v13 = a2;
  int v14 = 27918592;
  int v15 = a3;
  uint64_t v16 = *MEMORY[0x1895F8468];
  int v17 = a3;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  *(void *)&v11.msgh_bits = 0xAAAAAAAA80001513LL;
  v11.mach_port_t msgh_remote_port = a1;
  v11.msgh_local_port = special_reply_port;
  *(void *)&v11.msgh_voucher_port = 0x110A400000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&v11);
    mach_port_t special_reply_port = v11.msgh_local_port;
  }

  uint64_t v7 = mach_msg(&v11, 3162115, 0x38u, 0x30u, special_reply_port, 0, 0);
  uint64_t v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v7)
    {
      if (v11.msgh_id == 71)
      {
        uint64_t v8 = 4294966988LL;
      }

      else if (v11.msgh_id == 69896)
      {
        if ((v11.msgh_bits & 0x80000000) == 0)
        {
          if (v11.msgh_size == 40)
          {
            if (!v11.msgh_remote_port)
            {
              uint64_t v8 = HIDWORD(v13);
              if (!HIDWORD(v13))
              {
                *a4 = v14;
                return v8;
              }

              goto LABEL_22;
            }
          }

          else if (v11.msgh_size == 36)
          {
            if (v11.msgh_remote_port) {
              BOOL v9 = 1;
            }
            else {
              BOOL v9 = HIDWORD(v13) == 0;
            }
            if (v9) {
              uint64_t v8 = 4294966996LL;
            }
            else {
              uint64_t v8 = HIDWORD(v13);
            }
            goto LABEL_22;
          }
        }

        uint64_t v8 = 4294966996LL;
      }

      else
      {
        uint64_t v8 = 4294966995LL;
      }

uint64_t wifi_manager_tigger_gizmo_sync_password_check(mach_port_t a1)
{
  *(void *)&msg.msgh_bits = 0xAAAAAAAA00000013LL;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 69797;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1895FD5F8]) {
    voucher_mach_msg_set(&msg);
  }
  return mach_msg(&msg, 2097153, 0x18u, 0, 0, 0, 0);
}

uint64_t wifi_manager_copy_ssid_most_used_geo_tagged_to_current_location(int a1, void *a2, _DWORD *a3)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  *(void *)&__int128 v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v13[12] = v6;
  *(_OWORD *)uint64_t v13 = v6;
  *(_OWORD *)&msg[20] = v6;
  *(_DWORD *)&msg[4] = -1431655766;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)mach_msg_header_t msg = 5395;
  *(void *)&msg[16] = 0x110A600000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t special_reply_port = *(_DWORD *)&msg[12];
  }

  uint64_t v8 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x18u, 0x40u, special_reply_port, 0, 0);
  uint64_t v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v8)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        uint64_t v9 = 4294966988LL;
      }

      else if (*(_DWORD *)&msg[20] == 69898)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 36)
          {
            uint64_t v9 = 4294966996LL;
            if (*(_DWORD *)&msg[32])
            {
              if (*(_DWORD *)&msg[8]) {
                uint64_t v9 = 4294966996LL;
              }
              else {
                uint64_t v9 = *(unsigned int *)&msg[32];
              }
            }
          }

          else
          {
            uint64_t v9 = 4294966996LL;
          }

          goto LABEL_24;
        }

        uint64_t v9 = 4294966996LL;
        if (*(_DWORD *)&msg[24] == 1 && *(_DWORD *)&msg[4] == 56 && !*(_DWORD *)&msg[8] && v13[3] == 1)
        {
          int v10 = *(_DWORD *)&v13[4];
          if (*(_DWORD *)&v13[4] == *(_DWORD *)&v13[16])
          {
            uint64_t v9 = 0LL;
            *a2 = *(void *)&msg[28];
            *a3 = v10;
            return v9;
          }
        }
      }

      else
      {
        uint64_t v9 = 4294966995LL;
      }

uint64_t wifi_manager_is_wpa3_personal_supported(int a1, _DWORD *a2)
{
  *(void *)&__int128 v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&rcv_name_12[16] = v4;
  *(_OWORD *)&rcv_name_12[4] = v4;
  rcv_mach_port_name_t name = -1431655766;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  int rcv_name_4 = a1;
  mach_port_name_t rcv_name_8 = special_reply_port;
  int v10 = 5395;
  *(void *)rcv_name_12 = 0x110A700000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v10);
    mach_port_name_t special_reply_port = rcv_name_8;
  }

  uint64_t v6 = mach_msg((mach_msg_header_t *)&v10, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  uint64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v6)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        uint64_t v7 = 4294966988LL;
      }

      else if (*(_DWORD *)&rcv_name_12[4] == 69899)
      {
        if ((v10 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = *(_DWORD *)&rcv_name_12[20];
                return v7;
              }

              goto LABEL_22;
            }
          }

          else if (rcv_name == 36)
          {
            if (rcv_name_4) {
              BOOL v8 = 1;
            }
            else {
              BOOL v8 = *(_DWORD *)&rcv_name_12[16] == 0;
            }
            if (v8) {
              uint64_t v7 = 4294966996LL;
            }
            else {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
            }
            goto LABEL_22;
          }
        }

        uint64_t v7 = 4294966996LL;
      }

      else
      {
        uint64_t v7 = 4294966995LL;
      }

uint64_t wifi_manager_is_hotspot_wpa3_personal_supported(int a1, _DWORD *a2)
{
  *(void *)&__int128 v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&rcv_name_12[16] = v4;
  *(_OWORD *)&rcv_name_12[4] = v4;
  rcv_mach_port_name_t name = -1431655766;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  int rcv_name_4 = a1;
  mach_port_name_t rcv_name_8 = special_reply_port;
  int v10 = 5395;
  *(void *)rcv_name_12 = 0x110A800000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v10);
    mach_port_name_t special_reply_port = rcv_name_8;
  }

  uint64_t v6 = mach_msg((mach_msg_header_t *)&v10, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  uint64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v6)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        uint64_t v7 = 4294966988LL;
      }

      else if (*(_DWORD *)&rcv_name_12[4] == 69900)
      {
        if ((v10 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = *(_DWORD *)&rcv_name_12[20];
                return v7;
              }

              goto LABEL_22;
            }
          }

          else if (rcv_name == 36)
          {
            if (rcv_name_4) {
              BOOL v8 = 1;
            }
            else {
              BOOL v8 = *(_DWORD *)&rcv_name_12[16] == 0;
            }
            if (v8) {
              uint64_t v7 = 4294966996LL;
            }
            else {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
            }
            goto LABEL_22;
          }
        }

        uint64_t v7 = 4294966996LL;
      }

      else
      {
        uint64_t v7 = 4294966995LL;
      }

uint64_t wifi_manager_is_wpa3_enterprise_supported(int a1, _DWORD *a2)
{
  *(void *)&__int128 v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&rcv_name_12[16] = v4;
  *(_OWORD *)&rcv_name_12[4] = v4;
  rcv_mach_port_name_t name = -1431655766;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  int rcv_name_4 = a1;
  mach_port_name_t rcv_name_8 = special_reply_port;
  int v10 = 5395;
  *(void *)rcv_name_12 = 0x110A900000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v10);
    mach_port_name_t special_reply_port = rcv_name_8;
  }

  uint64_t v6 = mach_msg((mach_msg_header_t *)&v10, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  uint64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v6)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        uint64_t v7 = 4294966988LL;
      }

      else if (*(_DWORD *)&rcv_name_12[4] == 69901)
      {
        if ((v10 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = *(_DWORD *)&rcv_name_12[20];
                return v7;
              }

              goto LABEL_22;
            }
          }

          else if (rcv_name == 36)
          {
            if (rcv_name_4) {
              BOOL v8 = 1;
            }
            else {
              BOOL v8 = *(_DWORD *)&rcv_name_12[16] == 0;
            }
            if (v8) {
              uint64_t v7 = 4294966996LL;
            }
            else {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
            }
            goto LABEL_22;
          }
        }

        uint64_t v7 = 4294966996LL;
      }

      else
      {
        uint64_t v7 = 4294966995LL;
      }

uint64_t wifi_manager_is_mfp_capable_device(int a1, _DWORD *a2)
{
  *(void *)&__int128 v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&rcv_name_12[16] = v4;
  *(_OWORD *)&rcv_name_12[4] = v4;
  rcv_mach_port_name_t name = -1431655766;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  int rcv_name_4 = a1;
  mach_port_name_t rcv_name_8 = special_reply_port;
  int v10 = 5395;
  *(void *)rcv_name_12 = 0x110AA00000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v10);
    mach_port_name_t special_reply_port = rcv_name_8;
  }

  uint64_t v6 = mach_msg((mach_msg_header_t *)&v10, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  uint64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v6)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        uint64_t v7 = 4294966988LL;
      }

      else if (*(_DWORD *)&rcv_name_12[4] == 69902)
      {
        if ((v10 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = *(_DWORD *)&rcv_name_12[20];
                return v7;
              }

              goto LABEL_22;
            }
          }

          else if (rcv_name == 36)
          {
            if (rcv_name_4) {
              BOOL v8 = 1;
            }
            else {
              BOOL v8 = *(_DWORD *)&rcv_name_12[16] == 0;
            }
            if (v8) {
              uint64_t v7 = 4294966996LL;
            }
            else {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
            }
            goto LABEL_22;
          }
        }

        uint64_t v7 = 4294966996LL;
      }

      else
      {
        uint64_t v7 = 4294966995LL;
      }

uint64_t wifi_manager_set_auto_instant_hotspot_mode(mach_port_t a1, int a2)
{
  uint64_t v4 = *MEMORY[0x1895F8468];
  int v5 = a2;
  *(void *)&msg.msgh_bits = 0xAAAAAAAA00000013LL;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 69803;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1895FD5F8]) {
    voucher_mach_msg_set(&msg);
  }
  return mach_msg(&msg, 2097153, 0x24u, 0, 0, 0, 0);
}

uint64_t wifi_manager_get_auto_instant_hotspot_mode(int a1, _DWORD *a2)
{
  *(void *)&__int128 v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&rcv_name_12[16] = v4;
  *(_OWORD *)&rcv_name_12[4] = v4;
  rcv_mach_port_name_t name = -1431655766;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  int rcv_name_4 = a1;
  mach_port_name_t rcv_name_8 = special_reply_port;
  int v10 = 5395;
  *(void *)rcv_name_12 = 0x110AC00000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v10);
    mach_port_name_t special_reply_port = rcv_name_8;
  }

  uint64_t v6 = mach_msg((mach_msg_header_t *)&v10, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  uint64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v6)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        uint64_t v7 = 4294966988LL;
      }

      else if (*(_DWORD *)&rcv_name_12[4] == 69904)
      {
        if ((v10 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = *(_DWORD *)&rcv_name_12[20];
                return v7;
              }

              goto LABEL_22;
            }
          }

          else if (rcv_name == 36)
          {
            if (rcv_name_4) {
              BOOL v8 = 1;
            }
            else {
              BOOL v8 = *(_DWORD *)&rcv_name_12[16] == 0;
            }
            if (v8) {
              uint64_t v7 = 4294966996LL;
            }
            else {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
            }
            goto LABEL_22;
          }
        }

        uint64_t v7 = 4294966996LL;
      }

      else
      {
        uint64_t v7 = 4294966995LL;
      }

uint64_t wifi_manager_set_share_personal_hotspot_mode(mach_port_t a1, int a2)
{
  uint64_t v4 = *MEMORY[0x1895F8468];
  int v5 = a2;
  *(void *)&msg.msgh_bits = 0xAAAAAAAA00000013LL;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 69805;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1895FD5F8]) {
    voucher_mach_msg_set(&msg);
  }
  return mach_msg(&msg, 2097153, 0x24u, 0, 0, 0, 0);
}

uint64_t wifi_manager_get_share_personal_hotspot_mode(int a1, _DWORD *a2)
{
  *(void *)&__int128 v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&rcv_name_12[16] = v4;
  *(_OWORD *)&rcv_name_12[4] = v4;
  rcv_mach_port_name_t name = -1431655766;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  int rcv_name_4 = a1;
  mach_port_name_t rcv_name_8 = special_reply_port;
  int v10 = 5395;
  *(void *)rcv_name_12 = 0x110AE00000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v10);
    mach_port_name_t special_reply_port = rcv_name_8;
  }

  uint64_t v6 = mach_msg((mach_msg_header_t *)&v10, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  uint64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v6)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        uint64_t v7 = 4294966988LL;
      }

      else if (*(_DWORD *)&rcv_name_12[4] == 69906)
      {
        if ((v10 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = *(_DWORD *)&rcv_name_12[20];
                return v7;
              }

              goto LABEL_22;
            }
          }

          else if (rcv_name == 36)
          {
            if (rcv_name_4) {
              BOOL v8 = 1;
            }
            else {
              BOOL v8 = *(_DWORD *)&rcv_name_12[16] == 0;
            }
            if (v8) {
              uint64_t v7 = 4294966996LL;
            }
            else {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
            }
            goto LABEL_22;
          }
        }

        uint64_t v7 = 4294966996LL;
      }

      else
      {
        uint64_t v7 = 4294966995LL;
      }

uint64_t wifi_manager_set_auto_instant_hotspot_test_mode(mach_port_t a1, int a2)
{
  uint64_t v4 = *MEMORY[0x1895F8468];
  int v5 = a2;
  *(void *)&msg.msgh_bits = 0xAAAAAAAA00000013LL;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 69807;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1895FD5F8]) {
    voucher_mach_msg_set(&msg);
  }
  return mach_msg(&msg, 2097153, 0x24u, 0, 0, 0, 0);
}

uint64_t wifi_manager_set_auto_instant_hotspot_trigger_interval(mach_port_t a1, double a2)
{
  uint64_t v4 = *MEMORY[0x1895F8468];
  double v5 = a2;
  *(void *)&msg.msgh_bits = 0xAAAAAAAA00000013LL;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 69808;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1895FD5F8]) {
    voucher_mach_msg_set(&msg);
  }
  return mach_msg(&msg, 2097153, 0x28u, 0, 0, 0, 0);
}

uint64_t wifi_device_get_event_interval(mach_port_t a1, uint64_t a2, int a3, int a4, int *a5)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  int v13 = 1;
  uint64_t v14 = a2;
  int v15 = 27918592;
  int v16 = a3;
  uint64_t v17 = *MEMORY[0x1895F8468];
  int v18 = a3;
  int v19 = a4;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  *(void *)&msg.msgh_bits = 0xAAAAAAAA80001513LL;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  *(void *)&msg.msgh_voucher_port = 0x110B100000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }

  uint64_t v8 = mach_msg(&msg, 3162115, 0x3Cu, 0x30u, special_reply_port, 0, 0);
  uint64_t v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v8)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v9 = 4294966988LL;
      }

      else if (msg.msgh_id == 69909)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 40)
          {
            if (!msg.msgh_remote_port)
            {
              uint64_t v9 = HIDWORD(v14);
              if (!HIDWORD(v14))
              {
                *a5 = v15;
                return v9;
              }

              goto LABEL_22;
            }
          }

          else if (msg.msgh_size == 36)
          {
            if (msg.msgh_remote_port) {
              BOOL v10 = 1;
            }
            else {
              BOOL v10 = HIDWORD(v14) == 0;
            }
            if (v10) {
              uint64_t v9 = 4294966996LL;
            }
            else {
              uint64_t v9 = HIDWORD(v14);
            }
            goto LABEL_22;
          }
        }

        uint64_t v9 = 4294966996LL;
      }

      else
      {
        uint64_t v9 = 4294966995LL;
      }

uint64_t wifi_device_set_event_interval(mach_port_t a1, uint64_t a2, int a3, uint64_t a4, int a5, int *a6)
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  int v14 = 1;
  uint64_t v15 = a2;
  int v16 = 27918592;
  int v17 = a3;
  uint64_t v18 = *MEMORY[0x1895F8468];
  int v19 = a3;
  uint64_t v20 = a4;
  int v21 = a5;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  *(void *)&v13.msgh_bits = 0xAAAAAAAA80001513LL;
  v13.mach_port_t msgh_remote_port = a1;
  v13.msgh_local_port = special_reply_port;
  *(void *)&v13.msgh_voucher_port = 0x110B200000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&v13);
    mach_port_t special_reply_port = v13.msgh_local_port;
  }

  uint64_t v9 = mach_msg(&v13, 3162115, 0x44u, 0x30u, special_reply_port, 0, 0);
  uint64_t v10 = v9;
  if ((v9 - 268435458) > 0xE || ((1 << (v9 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v9)
    {
      if (v13.msgh_id == 71)
      {
        uint64_t v10 = 4294966988LL;
      }

      else if (v13.msgh_id == 69910)
      {
        if ((v13.msgh_bits & 0x80000000) == 0)
        {
          if (v13.msgh_size == 40)
          {
            if (!v13.msgh_remote_port)
            {
              uint64_t v10 = HIDWORD(v15);
              if (!HIDWORD(v15))
              {
                *a6 = v16;
                return v10;
              }

              goto LABEL_22;
            }
          }

          else if (v13.msgh_size == 36)
          {
            if (v13.msgh_remote_port) {
              BOOL v11 = 1;
            }
            else {
              BOOL v11 = HIDWORD(v15) == 0;
            }
            if (v11) {
              uint64_t v10 = 4294966996LL;
            }
            else {
              uint64_t v10 = HIDWORD(v15);
            }
            goto LABEL_22;
          }
        }

        uint64_t v10 = 4294966996LL;
      }

      else
      {
        uint64_t v10 = 4294966995LL;
      }

uint64_t wifi_manager_is_infra_allowed(int a1, _DWORD *a2)
{
  *(void *)&__int128 v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&rcv_name_12[16] = v4;
  *(_OWORD *)&rcv_name_12[4] = v4;
  rcv_mach_port_name_t name = -1431655766;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  int rcv_name_4 = a1;
  mach_port_name_t rcv_name_8 = special_reply_port;
  int v10 = 5395;
  *(void *)rcv_name_12 = 0x110B300000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v10);
    mach_port_name_t special_reply_port = rcv_name_8;
  }

  uint64_t v6 = mach_msg((mach_msg_header_t *)&v10, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  uint64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v6)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        uint64_t v7 = 4294966988LL;
      }

      else if (*(_DWORD *)&rcv_name_12[4] == 69911)
      {
        if ((v10 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = *(_DWORD *)&rcv_name_12[20];
                return v7;
              }

              goto LABEL_22;
            }
          }

          else if (rcv_name == 36)
          {
            if (rcv_name_4) {
              BOOL v8 = 1;
            }
            else {
              BOOL v8 = *(_DWORD *)&rcv_name_12[16] == 0;
            }
            if (v8) {
              uint64_t v7 = 4294966996LL;
            }
            else {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
            }
            goto LABEL_22;
          }
        }

        uint64_t v7 = 4294966996LL;
      }

      else
      {
        uint64_t v7 = 4294966995LL;
      }

uint64_t wifi_manager_is_p2p_allowed(int a1, _DWORD *a2)
{
  *(void *)&__int128 v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&rcv_name_12[16] = v4;
  *(_OWORD *)&rcv_name_12[4] = v4;
  rcv_mach_port_name_t name = -1431655766;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  int rcv_name_4 = a1;
  mach_port_name_t rcv_name_8 = special_reply_port;
  int v10 = 5395;
  *(void *)rcv_name_12 = 0x110B400000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v10);
    mach_port_name_t special_reply_port = rcv_name_8;
  }

  uint64_t v6 = mach_msg((mach_msg_header_t *)&v10, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  uint64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v6)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        uint64_t v7 = 4294966988LL;
      }

      else if (*(_DWORD *)&rcv_name_12[4] == 69912)
      {
        if ((v10 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = *(_DWORD *)&rcv_name_12[20];
                return v7;
              }

              goto LABEL_22;
            }
          }

          else if (rcv_name == 36)
          {
            if (rcv_name_4) {
              BOOL v8 = 1;
            }
            else {
              BOOL v8 = *(_DWORD *)&rcv_name_12[16] == 0;
            }
            if (v8) {
              uint64_t v7 = 4294966996LL;
            }
            else {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
            }
            goto LABEL_22;
          }
        }

        uint64_t v7 = 4294966996LL;
      }

      else
      {
        uint64_t v7 = 4294966995LL;
      }

uint64_t wifi_manager_set_network_property( mach_port_t a1, uint64_t a2, int a3, uint64_t a4, int a5, uint64_t a6, int a7, int *a8)
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  int v16 = 3;
  uint64_t v17 = a2;
  int v18 = 27918592;
  int v19 = a3;
  uint64_t v20 = a4;
  int v21 = 27918592;
  int v22 = a5;
  uint64_t v23 = a6;
  int v24 = 27918592;
  int v25 = a7;
  uint64_t v26 = *MEMORY[0x1895F8468];
  int v27 = a3;
  int v28 = a5;
  int v29 = a7;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  *(void *)&msg.msgh_bits = 0xAAAAAAAA80001513LL;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  *(void *)&msg.msgh_voucher_port = 0x110B500000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }

  uint64_t v11 = mach_msg(&msg, 3162115, 0x60u, 0x30u, special_reply_port, 0, 0);
  uint64_t v12 = v11;
  if ((v11 - 268435458) > 0xE || ((1 << (v11 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v11)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v12 = 4294966988LL;
      }

      else if (msg.msgh_id == 69913)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 40)
          {
            if (!msg.msgh_remote_port)
            {
              uint64_t v12 = HIDWORD(v17);
              if (!HIDWORD(v17))
              {
                *a8 = v18;
                return v12;
              }

              goto LABEL_22;
            }
          }

          else if (msg.msgh_size == 36)
          {
            if (msg.msgh_remote_port) {
              BOOL v13 = 1;
            }
            else {
              BOOL v13 = HIDWORD(v17) == 0;
            }
            if (v13) {
              uint64_t v12 = 4294966996LL;
            }
            else {
              uint64_t v12 = HIDWORD(v17);
            }
            goto LABEL_22;
          }
        }

        uint64_t v12 = 4294966996LL;
      }

      else
      {
        uint64_t v12 = 4294966995LL;
      }

uint64_t wifi_manager_copy_family_hotspot_preferences(int a1, void *a2, _DWORD *a3)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  *(void *)&__int128 v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v13[12] = v6;
  *(_OWORD *)BOOL v13 = v6;
  *(_OWORD *)&msg[20] = v6;
  *(_DWORD *)&msg[4] = -1431655766;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)mach_msg_header_t msg = 5395;
  *(void *)&msg[16] = 0x110B600000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t special_reply_port = *(_DWORD *)&msg[12];
  }

  uint64_t v8 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x18u, 0x40u, special_reply_port, 0, 0);
  uint64_t v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v8)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        uint64_t v9 = 4294966988LL;
      }

      else if (*(_DWORD *)&msg[20] == 69914)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 36)
          {
            uint64_t v9 = 4294966996LL;
            if (*(_DWORD *)&msg[32])
            {
              if (*(_DWORD *)&msg[8]) {
                uint64_t v9 = 4294966996LL;
              }
              else {
                uint64_t v9 = *(unsigned int *)&msg[32];
              }
            }
          }

          else
          {
            uint64_t v9 = 4294966996LL;
          }

          goto LABEL_24;
        }

        uint64_t v9 = 4294966996LL;
        if (*(_DWORD *)&msg[24] == 1 && *(_DWORD *)&msg[4] == 56 && !*(_DWORD *)&msg[8] && v13[3] == 1)
        {
          int v10 = *(_DWORD *)&v13[4];
          if (*(_DWORD *)&v13[4] == *(_DWORD *)&v13[16])
          {
            uint64_t v9 = 0LL;
            *a2 = *(void *)&msg[28];
            *a3 = v10;
            return v9;
          }
        }
      }

      else
      {
        uint64_t v9 = 4294966995LL;
      }

uint64_t wifi_manager_is_power_modification_disabled(int a1, _DWORD *a2)
{
  *(void *)&__int128 v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&rcv_name_12[16] = v4;
  *(_OWORD *)&rcv_name_12[4] = v4;
  rcv_mach_port_name_t name = -1431655766;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  int rcv_name_4 = a1;
  mach_port_name_t rcv_name_8 = special_reply_port;
  int v10 = 5395;
  *(void *)rcv_name_12 = 0x110B700000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v10);
    mach_port_name_t special_reply_port = rcv_name_8;
  }

  uint64_t v6 = mach_msg((mach_msg_header_t *)&v10, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  uint64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v6)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        uint64_t v7 = 4294966988LL;
      }

      else if (*(_DWORD *)&rcv_name_12[4] == 69915)
      {
        if ((v10 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = *(_DWORD *)&rcv_name_12[20];
                return v7;
              }

              goto LABEL_22;
            }
          }

          else if (rcv_name == 36)
          {
            if (rcv_name_4) {
              BOOL v8 = 1;
            }
            else {
              BOOL v8 = *(_DWORD *)&rcv_name_12[16] == 0;
            }
            if (v8) {
              uint64_t v7 = 4294966996LL;
            }
            else {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
            }
            goto LABEL_22;
          }
        }

        uint64_t v7 = 4294966996LL;
      }

      else
      {
        uint64_t v7 = 4294966995LL;
      }

uint64_t wifi_manager_is_managed_apple_id(int a1, _DWORD *a2)
{
  *(void *)&__int128 v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&rcv_name_12[16] = v4;
  *(_OWORD *)&rcv_name_12[4] = v4;
  rcv_mach_port_name_t name = -1431655766;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  int rcv_name_4 = a1;
  mach_port_name_t rcv_name_8 = special_reply_port;
  int v10 = 5395;
  *(void *)rcv_name_12 = 0x110B800000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v10);
    mach_port_name_t special_reply_port = rcv_name_8;
  }

  uint64_t v6 = mach_msg((mach_msg_header_t *)&v10, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  uint64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v6)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        uint64_t v7 = 4294966988LL;
      }

      else if (*(_DWORD *)&rcv_name_12[4] == 69916)
      {
        if ((v10 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = *(_DWORD *)&rcv_name_12[20];
                return v7;
              }

              goto LABEL_22;
            }
          }

          else if (rcv_name == 36)
          {
            if (rcv_name_4) {
              BOOL v8 = 1;
            }
            else {
              BOOL v8 = *(_DWORD *)&rcv_name_12[16] == 0;
            }
            if (v8) {
              uint64_t v7 = 4294966996LL;
            }
            else {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
            }
            goto LABEL_22;
          }
        }

        uint64_t v7 = 4294966996LL;
      }

      else
      {
        uint64_t v7 = 4294966995LL;
      }

uint64_t wifi_manager_set_built_in_receiver(mach_port_t a1, int a2)
{
  uint64_t v4 = *MEMORY[0x1895F8468];
  int v5 = a2;
  *(void *)&msg.msgh_bits = 0xAAAAAAAA00000013LL;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 69817;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1895FD5F8]) {
    voucher_mach_msg_set(&msg);
  }
  return mach_msg(&msg, 2097153, 0x24u, 0, 0, 0, 0);
}

uint64_t wifi_manager_is_personal_hotspot_modification_disabled(int a1, _DWORD *a2)
{
  *(void *)&__int128 v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&rcv_name_12[16] = v4;
  *(_OWORD *)&rcv_name_12[4] = v4;
  rcv_mach_port_name_t name = -1431655766;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  int rcv_name_4 = a1;
  mach_port_name_t rcv_name_8 = special_reply_port;
  int v10 = 5395;
  *(void *)rcv_name_12 = 0x110BA00000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v10);
    mach_port_name_t special_reply_port = rcv_name_8;
  }

  uint64_t v6 = mach_msg((mach_msg_header_t *)&v10, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  uint64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v6)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        uint64_t v7 = 4294966988LL;
      }

      else if (*(_DWORD *)&rcv_name_12[4] == 69918)
      {
        if ((v10 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = *(_DWORD *)&rcv_name_12[20];
                return v7;
              }

              goto LABEL_22;
            }
          }

          else if (rcv_name == 36)
          {
            if (rcv_name_4) {
              BOOL v8 = 1;
            }
            else {
              BOOL v8 = *(_DWORD *)&rcv_name_12[16] == 0;
            }
            if (v8) {
              uint64_t v7 = 4294966996LL;
            }
            else {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
            }
            goto LABEL_22;
          }
        }

        uint64_t v7 = 4294966996LL;
      }

      else
      {
        uint64_t v7 = 4294966995LL;
      }

uint64_t wifi_device_copy_network_recommendations(int a1, uint64_t a2, int a3, void *a4, _DWORD *a5)
{
  *(void *)&__int128 v8 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&rcv_name[16] = 0x1AAAAAAAALL;
  *(_DWORD *)int v19 = -1431655766;
  *(_OWORD *)&v19[4] = v8;
  *(_OWORD *)rcv_mach_port_name_t name = v8;
  uint64_t v16 = a2;
  int v17 = 27918592;
  int v18 = a3;
  *(void *)int v19 = *MEMORY[0x1895F8468];
  *(_DWORD *)&v19[8] = a3;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&rcv_name[4] = a1;
  *(_DWORD *)&rcv_name[8] = special_reply_port;
  int v14 = -2147478253;
  *(void *)&rcv_name[12] = 0x110BB00000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v14);
    mach_port_name_t special_reply_port = *(_DWORD *)&rcv_name[8];
  }

  uint64_t v10 = mach_msg((mach_msg_header_t *)&v14, 3162115, 0x38u, 0x40u, special_reply_port, 0, 0);
  uint64_t v11 = v10;
  if ((v10 - 268435458) > 0xE || ((1 << (v10 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v10)
    {
      if (*(_DWORD *)&rcv_name[16] == 71)
      {
        uint64_t v11 = 4294966988LL;
      }

      else if (*(_DWORD *)&rcv_name[16] == 69919)
      {
        if ((v14 & 0x80000000) == 0)
        {
          if (*(_DWORD *)rcv_name == 36)
          {
            uint64_t v11 = 4294966996LL;
            if (HIDWORD(v16))
            {
              if (*(_DWORD *)&rcv_name[4]) {
                uint64_t v11 = 4294966996LL;
              }
              else {
                uint64_t v11 = HIDWORD(v16);
              }
            }
          }

          else
          {
            uint64_t v11 = 4294966996LL;
          }

          goto LABEL_24;
        }

        uint64_t v11 = 4294966996LL;
        if (*(_DWORD *)&rcv_name[20] == 1 && *(_DWORD *)rcv_name == 56 && !*(_DWORD *)&rcv_name[4] && HIBYTE(v17) == 1)
        {
          int v12 = v18;
          if (v18 == *(_DWORD *)&v19[8])
          {
            uint64_t v11 = 0LL;
            *a4 = v16;
            *a5 = v12;
            return v11;
          }
        }
      }

      else
      {
        uint64_t v11 = 4294966995LL;
      }

uint64_t wifi_device_reset_availability_engine(int a1, uint64_t a2, int a3)
{
  uint64_t v5 = a2;
  int v6 = 27918592;
  int v7 = a3;
  uint64_t v8 = *MEMORY[0x1895F8468];
  int v9 = a3;
  *(void *)mach_msg_header_t msg = 0xAAAAAAAA80000013LL;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_1865BD400;
  if (MEMORY[0x1895FD5F8]) {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  }
  return mach_msg((mach_msg_header_t *)msg, 2097153, 0x38u, 0, 0, 0, 0);
}

uint64_t wifi_manager_set_user_interaction_override(int a1, uint64_t a2, int a3)
{
  uint64_t v5 = a2;
  int v6 = 27918592;
  int v7 = a3;
  uint64_t v8 = *MEMORY[0x1895F8468];
  int v9 = a3;
  *(void *)mach_msg_header_t msg = 0xAAAAAAAA80000013LL;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_1865BD410;
  if (MEMORY[0x1895FD5F8]) {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  }
  return mach_msg((mach_msg_header_t *)msg, 2097153, 0x38u, 0, 0, 0, 0);
}

uint64_t wifi_manager_set_user_interaction_nw_override(int a1, uint64_t a2, int a3)
{
  uint64_t v5 = a2;
  int v6 = 27918592;
  int v7 = a3;
  uint64_t v8 = *MEMORY[0x1895F8468];
  int v9 = a3;
  *(void *)mach_msg_header_t msg = 0xAAAAAAAA80000013LL;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_1865BD420;
  if (MEMORY[0x1895FD5F8]) {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  }
  return mach_msg((mach_msg_header_t *)msg, 2097153, 0x38u, 0, 0, 0, 0);
}

uint64_t wifi_device_bssblacklist_command( mach_port_t a1, uint64_t a2, int a3, uint64_t a4, int a5, void *a6, _DWORD *a7)
{
  int v16 = 2;
  uint64_t v17 = a2;
  int v18 = 27918592;
  int v19 = a3;
  uint64_t v20 = a4;
  int v21 = 27918592;
  int v22 = a5;
  uint64_t v23 = *MEMORY[0x1895F8468];
  int v24 = a3;
  int v25 = a5;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  *(void *)&v15.msgh_bits = 0xAAAAAAAA80001513LL;
  v15.mach_port_t msgh_remote_port = a1;
  v15.msgh_local_port = special_reply_port;
  *(void *)&v15.msgh_voucher_port = 0x110BF00000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&v15);
    mach_port_t special_reply_port = v15.msgh_local_port;
  }

  uint64_t v11 = mach_msg(&v15, 3162115, 0x4Cu, 0x40u, special_reply_port, 0, 0);
  uint64_t v12 = v11;
  if ((v11 - 268435458) > 0xE || ((1 << (v11 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v11)
    {
      if (v15.msgh_id == 71)
      {
        uint64_t v12 = 4294966988LL;
      }

      else if (v15.msgh_id == 69923)
      {
        if ((v15.msgh_bits & 0x80000000) == 0)
        {
          if (v15.msgh_size == 36)
          {
            uint64_t v12 = 4294966996LL;
            if (HIDWORD(v17))
            {
              if (v15.msgh_remote_port) {
                uint64_t v12 = 4294966996LL;
              }
              else {
                uint64_t v12 = HIDWORD(v17);
              }
            }
          }

          else
          {
            uint64_t v12 = 4294966996LL;
          }

          goto LABEL_23;
        }

        uint64_t v12 = 4294966996LL;
        if (v16 == 1 && *(void *)&v15.msgh_size == 56LL && HIBYTE(v18) == 1)
        {
          int v13 = v19;
          if (v19 == v21)
          {
            uint64_t v12 = 0LL;
            *a6 = v17;
            *a7 = v13;
            return v12;
          }
        }
      }

      else
      {
        uint64_t v12 = 4294966995LL;
      }

uint64_t wifi_manager_set_private_mac_pref( mach_port_t a1, uint64_t a2, int a3, int a4, uint64_t a5, int a6, int *a7)
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  int v15 = 2;
  uint64_t v16 = a2;
  int v17 = 27918592;
  int v18 = a3;
  uint64_t v19 = a5;
  int v20 = 27918592;
  int v21 = a6;
  uint64_t v22 = *MEMORY[0x1895F8468];
  int v23 = a3;
  int v24 = a4;
  int v25 = a6;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  *(void *)&msg.msgh_bits = 0xAAAAAAAA80001513LL;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  *(void *)&msg.msgh_voucher_port = 0x110C000000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }

  uint64_t v10 = mach_msg(&msg, 3162115, 0x50u, 0x30u, special_reply_port, 0, 0);
  uint64_t v11 = v10;
  if ((v10 - 268435458) > 0xE || ((1 << (v10 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v10)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v11 = 4294966988LL;
      }

      else if (msg.msgh_id == 69924)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 40)
          {
            if (!msg.msgh_remote_port)
            {
              uint64_t v11 = HIDWORD(v16);
              if (!HIDWORD(v16))
              {
                *a7 = v17;
                return v11;
              }

              goto LABEL_22;
            }
          }

          else if (msg.msgh_size == 36)
          {
            if (msg.msgh_remote_port) {
              BOOL v12 = 1;
            }
            else {
              BOOL v12 = HIDWORD(v16) == 0;
            }
            if (v12) {
              uint64_t v11 = 4294966996LL;
            }
            else {
              uint64_t v11 = HIDWORD(v16);
            }
            goto LABEL_22;
          }
        }

        uint64_t v11 = 4294966996LL;
      }

      else
      {
        uint64_t v11 = 4294966995LL;
      }

uint64_t wifi_manager_set_mac_randomisation_params(int a1, uint64_t a2, int a3)
{
  uint64_t v5 = a2;
  int v6 = 27918592;
  int v7 = a3;
  uint64_t v8 = *MEMORY[0x1895F8468];
  int v9 = a3;
  *(void *)mach_msg_header_t msg = 0xAAAAAAAA80000013LL;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_1865BD430;
  if (MEMORY[0x1895FD5F8]) {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  }
  return mach_msg((mach_msg_header_t *)msg, 2097153, 0x38u, 0, 0, 0, 0);
}

uint64_t wifi_device_update_network_property(int a1, uint64_t a2, int a3, uint64_t a4, int a5)
{
  uint64_t v9 = a2;
  int v10 = 27918592;
  int v11 = a3;
  uint64_t v12 = a4;
  int v13 = 27918592;
  int v14 = a5;
  uint64_t v15 = *MEMORY[0x1895F8468];
  int v16 = a3;
  int v17 = a5;
  unint64_t v6 = 0xAAAAAAAA80000013LL;
  int v7 = a1;
  __int128 v8 = xmmword_1865BD440;
  if (MEMORY[0x1895FD5F8]) {
    voucher_mach_msg_set((mach_msg_header_t *)&v6);
  }
  return mach_msg((mach_msg_header_t *)&v6, 2097153, 0x4Cu, 0, 0, 0, 0);
}

uint64_t wifi_manager_get_mac_randomisation_parameters(int a1, void *a2, _DWORD *a3)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  *(void *)&__int128 v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v13[12] = v6;
  *(_OWORD *)int v13 = v6;
  *(_OWORD *)&msg[20] = v6;
  *(_DWORD *)&msg[4] = -1431655766;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)mach_msg_header_t msg = 5395;
  *(void *)&msg[16] = 0x110C300000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t special_reply_port = *(_DWORD *)&msg[12];
  }

  uint64_t v8 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x18u, 0x40u, special_reply_port, 0, 0);
  uint64_t v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v8)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        uint64_t v9 = 4294966988LL;
      }

      else if (*(_DWORD *)&msg[20] == 69927)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 36)
          {
            uint64_t v9 = 4294966996LL;
            if (*(_DWORD *)&msg[32])
            {
              if (*(_DWORD *)&msg[8]) {
                uint64_t v9 = 4294966996LL;
              }
              else {
                uint64_t v9 = *(unsigned int *)&msg[32];
              }
            }
          }

          else
          {
            uint64_t v9 = 4294966996LL;
          }

          goto LABEL_24;
        }

        uint64_t v9 = 4294966996LL;
        if (*(_DWORD *)&msg[24] == 1 && *(_DWORD *)&msg[4] == 56 && !*(_DWORD *)&msg[8] && v13[3] == 1)
        {
          int v10 = *(_DWORD *)&v13[4];
          if (*(_DWORD *)&v13[4] == *(_DWORD *)&v13[16])
          {
            uint64_t v9 = 0LL;
            *a2 = *(void *)&msg[28];
            *a3 = v10;
            return v9;
          }
        }
      }

      else
      {
        uint64_t v9 = 4294966995LL;
      }

uint64_t wifi_manager_get_privatemac_network_switch_state(mach_port_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  int v12 = 1;
  uint64_t v13 = a2;
  int v14 = 27918592;
  int v15 = a3;
  uint64_t v16 = *MEMORY[0x1895F8468];
  int v17 = a3;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  *(void *)&v11.msgh_bits = 0xAAAAAAAA80001513LL;
  v11.mach_port_t msgh_remote_port = a1;
  v11.msgh_local_port = special_reply_port;
  *(void *)&v11.msgh_voucher_port = 0x110C400000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&v11);
    mach_port_t special_reply_port = v11.msgh_local_port;
  }

  uint64_t v7 = mach_msg(&v11, 3162115, 0x38u, 0x30u, special_reply_port, 0, 0);
  uint64_t v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v7)
    {
      if (v11.msgh_id == 71)
      {
        uint64_t v8 = 4294966988LL;
      }

      else if (v11.msgh_id == 69928)
      {
        if ((v11.msgh_bits & 0x80000000) == 0)
        {
          if (v11.msgh_size == 40)
          {
            if (!v11.msgh_remote_port)
            {
              uint64_t v8 = HIDWORD(v13);
              if (!HIDWORD(v13))
              {
                *a4 = v14;
                return v8;
              }

              goto LABEL_22;
            }
          }

          else if (v11.msgh_size == 36)
          {
            if (v11.msgh_remote_port) {
              BOOL v9 = 1;
            }
            else {
              BOOL v9 = HIDWORD(v13) == 0;
            }
            if (v9) {
              uint64_t v8 = 4294966996LL;
            }
            else {
              uint64_t v8 = HIDWORD(v13);
            }
            goto LABEL_22;
          }
        }

        uint64_t v8 = 4294966996LL;
      }

      else
      {
        uint64_t v8 = 4294966995LL;
      }

uint64_t wifi_manager_update_privateMac_network(int a1, uint64_t a2, int a3)
{
  uint64_t v5 = a2;
  int v6 = 27918592;
  int v7 = a3;
  uint64_t v8 = *MEMORY[0x1895F8468];
  int v9 = a3;
  *(void *)mach_msg_header_t msg = 0xAAAAAAAA80000013LL;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_1865BD450;
  if (MEMORY[0x1895FD5F8]) {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  }
  return mach_msg((mach_msg_header_t *)msg, 2097153, 0x38u, 0, 0, 0, 0);
}

uint64_t wifi_manager_private_mac_is_quick_probe_required(mach_port_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  int v12 = 1;
  uint64_t v13 = a2;
  int v14 = 27918592;
  int v15 = a3;
  uint64_t v16 = *MEMORY[0x1895F8468];
  int v17 = a3;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  *(void *)&v11.msgh_bits = 0xAAAAAAAA80001513LL;
  v11.mach_port_t msgh_remote_port = a1;
  v11.msgh_local_port = special_reply_port;
  *(void *)&v11.msgh_voucher_port = 0x110C600000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&v11);
    mach_port_t special_reply_port = v11.msgh_local_port;
  }

  uint64_t v7 = mach_msg(&v11, 3162115, 0x38u, 0x30u, special_reply_port, 0, 0);
  uint64_t v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v7)
    {
      if (v11.msgh_id == 71)
      {
        uint64_t v8 = 4294966988LL;
      }

      else if (v11.msgh_id == 69930)
      {
        if ((v11.msgh_bits & 0x80000000) == 0)
        {
          if (v11.msgh_size == 40)
          {
            if (!v11.msgh_remote_port)
            {
              uint64_t v8 = HIDWORD(v13);
              if (!HIDWORD(v13))
              {
                *a4 = v14;
                return v8;
              }

              goto LABEL_22;
            }
          }

          else if (v11.msgh_size == 36)
          {
            if (v11.msgh_remote_port) {
              BOOL v9 = 1;
            }
            else {
              BOOL v9 = HIDWORD(v13) == 0;
            }
            if (v9) {
              uint64_t v8 = 4294966996LL;
            }
            else {
              uint64_t v8 = HIDWORD(v13);
            }
            goto LABEL_22;
          }
        }

        uint64_t v8 = 4294966996LL;
      }

      else
      {
        uint64_t v8 = 4294966995LL;
      }

uint64_t wifi_manager_private_mac_probe_result(mach_port_t a1, int a2, uint64_t a3, int a4)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  int v10 = 1;
  uint64_t v11 = a3;
  int v12 = 27918592;
  int v13 = a4;
  uint64_t v14 = *MEMORY[0x1895F8468];
  int v15 = a2;
  int v16 = a4;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  *(void *)&msg.msgh_bits = 0xAAAAAAAA80001513LL;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  *(void *)&msg.msgh_voucher_port = 0x110C700000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }

  uint64_t v6 = mach_msg(&msg, 3162115, 0x3Cu, 0x2Cu, special_reply_port, 0, 0);
  uint64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v6)
    {
      mig_dealloc_special_reply_port();
      return v7;
    }

    if (msg.msgh_id == 71)
    {
      uint64_t v7 = 4294966988LL;
    }

    else if (msg.msgh_id == 69931)
    {
      uint64_t v7 = 4294966996LL;
      if ((msg.msgh_bits & 0x80000000) == 0 && msg.msgh_size == 36 && !msg.msgh_remote_port)
      {
        uint64_t v7 = HIDWORD(v11);
        if (!HIDWORD(v11)) {
          return v7;
        }
      }
    }

    else
    {
      uint64_t v7 = 4294966995LL;
    }

    mach_msg_destroy(&msg);
  }

  return v7;
}

uint64_t wifi_manager_set_adaptive_roam_params(int a1, uint64_t a2, int a3)
{
  uint64_t v5 = a2;
  int v6 = 27918592;
  int v7 = a3;
  uint64_t v8 = *MEMORY[0x1895F8468];
  int v9 = a3;
  *(void *)mach_msg_header_t msg = 0xAAAAAAAA80000013LL;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_1865BD460;
  if (MEMORY[0x1895FD5F8]) {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  }
  return mach_msg((mach_msg_header_t *)msg, 2097153, 0x38u, 0, 0, 0, 0);
}

uint64_t wifi_manager_is_multi_band(int a1, _DWORD *a2)
{
  *(void *)&__int128 v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&rcv_name_12[16] = v4;
  *(_OWORD *)&rcv_name_12[4] = v4;
  rcv_mach_port_name_t name = -1431655766;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  int rcv_name_4 = a1;
  mach_port_name_t rcv_name_8 = special_reply_port;
  int v10 = 5395;
  *(void *)rcv_name_12 = 0x110C900000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v10);
    mach_port_name_t special_reply_port = rcv_name_8;
  }

  uint64_t v6 = mach_msg((mach_msg_header_t *)&v10, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  uint64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v6)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        uint64_t v7 = 4294966988LL;
      }

      else if (*(_DWORD *)&rcv_name_12[4] == 69933)
      {
        if ((v10 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = *(_DWORD *)&rcv_name_12[20];
                return v7;
              }

              goto LABEL_22;
            }
          }

          else if (rcv_name == 36)
          {
            if (rcv_name_4) {
              BOOL v8 = 1;
            }
            else {
              BOOL v8 = *(_DWORD *)&rcv_name_12[16] == 0;
            }
            if (v8) {
              uint64_t v7 = 4294966996LL;
            }
            else {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
            }
            goto LABEL_22;
          }
        }

        uint64_t v7 = 4294966996LL;
      }

      else
      {
        uint64_t v7 = 4294966995LL;
      }

uint64_t wifi_manager_get_hardware_failure(int a1, _DWORD *a2)
{
  *(void *)&__int128 v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&rcv_name_12[16] = v4;
  *(_OWORD *)&rcv_name_12[4] = v4;
  rcv_mach_port_name_t name = -1431655766;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  int rcv_name_4 = a1;
  mach_port_name_t rcv_name_8 = special_reply_port;
  int v10 = 5395;
  *(void *)rcv_name_12 = 0x110CA00000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v10);
    mach_port_name_t special_reply_port = rcv_name_8;
  }

  uint64_t v6 = mach_msg((mach_msg_header_t *)&v10, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  uint64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v6)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        uint64_t v7 = 4294966988LL;
      }

      else if (*(_DWORD *)&rcv_name_12[4] == 69934)
      {
        if ((v10 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = *(_DWORD *)&rcv_name_12[20];
                return v7;
              }

              goto LABEL_22;
            }
          }

          else if (rcv_name == 36)
          {
            if (rcv_name_4) {
              BOOL v8 = 1;
            }
            else {
              BOOL v8 = *(_DWORD *)&rcv_name_12[16] == 0;
            }
            if (v8) {
              uint64_t v7 = 4294966996LL;
            }
            else {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
            }
            goto LABEL_22;
          }
        }

        uint64_t v7 = 4294966996LL;
      }

      else
      {
        uint64_t v7 = 4294966995LL;
      }

uint64_t wifi_manager_reset_network_settings(mach_port_t a1)
{
  *(void *)&msg.msgh_bits = 0xAAAAAAAA00000013LL;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 69835;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1895FD5F8]) {
    voucher_mach_msg_set(&msg);
  }
  return mach_msg(&msg, 2097153, 0x18u, 0, 0, 0, 0);
}

uint64_t wifi_manager_purge_expired_known_networks(mach_port_t a1)
{
  *(void *)&msg.msgh_bits = 0xAAAAAAAA00000013LL;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 69836;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1895FD5F8]) {
    voucher_mach_msg_set(&msg);
  }
  return mach_msg(&msg, 2097153, 0x18u, 0, 0, 0, 0);
}

uint64_t wifi_manager_cleanup_log_buffer_files(mach_port_t a1)
{
  *(void *)&msg.msgh_bits = 0xAAAAAAAA00000013LL;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 69837;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1895FD5F8]) {
    voucher_mach_msg_set(&msg);
  }
  return mach_msg(&msg, 2097153, 0x18u, 0, 0, 0, 0);
}

uint64_t wifi_device_get_app_state(mach_port_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  int v12 = 1;
  uint64_t v13 = a2;
  int v14 = 27918592;
  int v15 = a3;
  uint64_t v16 = *MEMORY[0x1895F8468];
  int v17 = a3;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  *(void *)&v11.msgh_bits = 0xAAAAAAAA80001513LL;
  v11.mach_port_t msgh_remote_port = a1;
  v11.msgh_local_port = special_reply_port;
  *(void *)&v11.msgh_voucher_port = 0x110CE00000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&v11);
    mach_port_t special_reply_port = v11.msgh_local_port;
  }

  uint64_t v7 = mach_msg(&v11, 3162115, 0x38u, 0x30u, special_reply_port, 0, 0);
  uint64_t v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v7)
    {
      if (v11.msgh_id == 71)
      {
        uint64_t v8 = 4294966988LL;
      }

      else if (v11.msgh_id == 69938)
      {
        if ((v11.msgh_bits & 0x80000000) == 0)
        {
          if (v11.msgh_size == 40)
          {
            if (!v11.msgh_remote_port)
            {
              uint64_t v8 = HIDWORD(v13);
              if (!HIDWORD(v13))
              {
                *a4 = v14;
                return v8;
              }

              goto LABEL_22;
            }
          }

          else if (v11.msgh_size == 36)
          {
            if (v11.msgh_remote_port) {
              BOOL v9 = 1;
            }
            else {
              BOOL v9 = HIDWORD(v13) == 0;
            }
            if (v9) {
              uint64_t v8 = 4294966996LL;
            }
            else {
              uint64_t v8 = HIDWORD(v13);
            }
            goto LABEL_22;
          }
        }

        uint64_t v8 = 4294966996LL;
      }

      else
      {
        uint64_t v8 = 4294966995LL;
      }

uint64_t wifi_manager_wificall_handover_notification(int a1, int a2)
{
  *(void *)&__int128 v3 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&msg[20] = v3;
  unint64_t v9 = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&msg[4] = v3;
  *(void *)&msg[24] = *MEMORY[0x1895F8468];
  *(_DWORD *)&msg[32] = a2;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)mach_msg_header_t msg = 5395;
  *(void *)&msg[16] = 0x110CF00000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t special_reply_port = *(_DWORD *)&msg[12];
  }

  uint64_t v5 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x24u, 0x2Cu, special_reply_port, 0, 0);
  uint64_t v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v5)
    {
      mig_dealloc_special_reply_port();
      return v6;
    }

    if (*(_DWORD *)&msg[20] == 71)
    {
      uint64_t v6 = 4294966988LL;
    }

    else if (*(_DWORD *)&msg[20] == 69939)
    {
      uint64_t v6 = 4294966996LL;
      if ((*(_DWORD *)msg & 0x80000000) == 0 && *(_DWORD *)&msg[4] == 36 && !*(_DWORD *)&msg[8])
      {
        uint64_t v6 = *(unsigned int *)&msg[32];
        if (!*(_DWORD *)&msg[32]) {
          return v6;
        }
      }
    }

    else
    {
      uint64_t v6 = 4294966995LL;
    }

    mach_msg_destroy((mach_msg_header_t *)msg);
  }

  return v6;
}

uint64_t wifi_device_insert_missing_network_service(int a1, uint64_t a2, int a3)
{
  uint64_t v5 = a2;
  int v6 = 27918592;
  int v7 = a3;
  uint64_t v8 = *MEMORY[0x1895F8468];
  int v9 = a3;
  *(void *)mach_msg_header_t msg = 0xAAAAAAAA80000013LL;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_1865BD470;
  if (MEMORY[0x1895FD5F8]) {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  }
  return mach_msg((mach_msg_header_t *)msg, 2097153, 0x38u, 0, 0, 0, 0);
}

uint64_t wifi_manager_copy_movement_states(int a1, void *a2, _DWORD *a3)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  *(void *)&__int128 v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v13[12] = v6;
  *(_OWORD *)uint64_t v13 = v6;
  *(_OWORD *)&msg[20] = v6;
  *(_DWORD *)&msg[4] = -1431655766;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)mach_msg_header_t msg = 5395;
  *(void *)&msg[16] = 0x110D100000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t special_reply_port = *(_DWORD *)&msg[12];
  }

  uint64_t v8 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x18u, 0x40u, special_reply_port, 0, 0);
  uint64_t v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v8)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        uint64_t v9 = 4294966988LL;
      }

      else if (*(_DWORD *)&msg[20] == 69941)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 36)
          {
            uint64_t v9 = 4294966996LL;
            if (*(_DWORD *)&msg[32])
            {
              if (*(_DWORD *)&msg[8]) {
                uint64_t v9 = 4294966996LL;
              }
              else {
                uint64_t v9 = *(unsigned int *)&msg[32];
              }
            }
          }

          else
          {
            uint64_t v9 = 4294966996LL;
          }

          goto LABEL_24;
        }

        uint64_t v9 = 4294966996LL;
        if (*(_DWORD *)&msg[24] == 1 && *(_DWORD *)&msg[4] == 56 && !*(_DWORD *)&msg[8] && v13[3] == 1)
        {
          int v10 = *(_DWORD *)&v13[4];
          if (*(_DWORD *)&v13[4] == *(_DWORD *)&v13[16])
          {
            uint64_t v9 = 0LL;
            *a2 = *(void *)&msg[28];
            *a3 = v10;
            return v9;
          }
        }
      }

      else
      {
        uint64_t v9 = 4294966995LL;
      }

uint64_t wifi_manager_set_simulated_movement_states(mach_port_t a1, uint64_t a2, int a3)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  int v9 = 1;
  uint64_t v10 = a2;
  int v11 = 27918592;
  int v12 = a3;
  uint64_t v13 = *MEMORY[0x1895F8468];
  int v14 = a3;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  *(void *)&v8.msgh_bits = 0xAAAAAAAA80001513LL;
  v8.mach_port_t msgh_remote_port = a1;
  v8.msgh_local_port = special_reply_port;
  *(void *)&v8.msgh_voucher_port = 0x110D200000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set(&v8);
    mach_port_t special_reply_port = v8.msgh_local_port;
  }

  uint64_t v5 = mach_msg(&v8, 3162115, 0x38u, 0x2Cu, special_reply_port, 0, 0);
  uint64_t v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v5)
    {
      mig_dealloc_special_reply_port();
      return v6;
    }

    if (v8.msgh_id == 71)
    {
      uint64_t v6 = 4294966988LL;
    }

    else if (v8.msgh_id == 69942)
    {
      uint64_t v6 = 4294966996LL;
      if ((v8.msgh_bits & 0x80000000) == 0 && *(void *)&v8.msgh_size == 36LL)
      {
        uint64_t v6 = HIDWORD(v10);
        if (!HIDWORD(v10)) {
          return v6;
        }
      }
    }

    else
    {
      uint64_t v6 = 4294966995LL;
    }

    mach_msg_destroy(&v8);
  }

  return v6;
}

uint64_t wifi_manager_set_battery_save_mode(mach_port_t a1, int a2)
{
  uint64_t v4 = *MEMORY[0x1895F8468];
  int v5 = a2;
  *(void *)&msg.msgh_bits = 0xAAAAAAAA00000013LL;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 69843;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1895FD5F8]) {
    voucher_mach_msg_set(&msg);
  }
  return mach_msg(&msg, 2097153, 0x24u, 0, 0, 0, 0);
}

uint64_t wifi_manager_get_battery_save_mode(int a1, _DWORD *a2)
{
  *(void *)&__int128 v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&rcv_name_12[16] = v4;
  *(_OWORD *)&rcv_name_12[4] = v4;
  rcv_mach_port_name_t name = -1431655766;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  int rcv_name_4 = a1;
  mach_port_name_t rcv_name_8 = special_reply_port;
  int v10 = 5395;
  *(void *)rcv_name_12 = 0x110D400000000LL;
  if (MEMORY[0x1895FD5F8])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v10);
    mach_port_name_t special_reply_port = rcv_name_8;
  }

  uint64_t v6 = mach_msg((mach_msg_header_t *)&v10, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  uint64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v6)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        uint64_t v7 = 4294966988LL;
      }

      else if (*(_DWORD *)&rcv_name_12[4] == 69944)
      {
        if ((v10 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = *(_DWORD *)&rcv_name_12[20];
                return v7;
              }

              goto LABEL_22;
            }
          }

          else if (rcv_name == 36)
          {
            if (rcv_name_4) {
              BOOL v8 = 1;
            }
            else {
              BOOL v8 = *(_DWORD *)&rcv_name_12[16] == 0;
            }
            if (v8) {
              uint64_t v7 = 4294966996LL;
            }
            else {
              uint64_t v7 = *(unsigned int *)&rcv_name_12[16];
            }
            goto LABEL_22;
          }
        }

        uint64_t v7 = 4294966996LL;
      }

      else
      {
        uint64_t v7 = 4294966995LL;
      }

uint64_t wifi_manager_initiate_network_transition(int a1, uint64_t a2, int a3)
{
  uint64_t v5 = a2;
  int v6 = 27918592;
  int v7 = a3;
  uint64_t v8 = *MEMORY[0x1895F8468];
  int v9 = a3;
  *(void *)mach_msg_header_t msg = 0xAAAAAAAA80000013LL;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_1865BD480;
  if (MEMORY[0x1895FD5F8]) {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  }
  return mach_msg((mach_msg_header_t *)msg, 2097153, 0x38u, 0, 0, 0, 0);
}

void __WiFiPolicyRelease_cold_1()
{
}

void __WiFiPolicyRelease_cold_2()
{
  __assert_rtn("__WiFiPolicyRelease", "WiFiPolicy.c", 200, "CFGetTypeID(object) == WiFiPolicyGetTypeID()");
}

void _WiFiCopyUnserialized_cold_1()
{
  OUTLINED_FUNCTION_0( &dword_18658B000,  MEMORY[0x1895F8DA0],  v0,  "%s: CFPropertyListCreateWithData returned with error %@",  v1,  v2,  v3,  v4,  2u);
  OUTLINED_FUNCTION_2();
}

void _WiFiCopyUnserialized_cold_2()
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  int v0 = 136315138;
  uint64_t v1 = "_WiFiCopyUnserialized";
  _os_log_error_impl( &dword_18658B000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "%s: Invalid buffer/buffersize.",  (uint8_t *)&v0,  0xCu);
  OUTLINED_FUNCTION_2();
}

void _CFPropertyListCreateBinaryData_cold_1()
{
  OUTLINED_FUNCTION_0( &dword_18658B000,  MEMORY[0x1895F8DA0],  v0,  "%s: CFPropertyListWrite returned with error %@",  v1,  v2,  v3,  v4,  2u);
  OUTLINED_FUNCTION_2();
}

void WiFiManagerClientCreate_cold_1( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void WiFiManagerClientCreate_cold_2( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void WiFiManagerClientCreate_cold_3( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void WiFiManagerClientCreate_cold_4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __WiFiManagerClientServerTerminationCallback_cold_1()
{
}

void WiFiManagerClientGetDevice_cold_1()
{
}

void __WiFiManagerClientAddDevice_cold_1()
{
  uint64_t v1 = *MEMORY[0x1895F89C0];
  v0[0] = 136315394;
  OUTLINED_FUNCTION_4();
  _os_log_debug_impl( &dword_18658B000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEBUG,  "%s: delaying attach callback for %@",  (uint8_t *)v0,  0x16u);
  OUTLINED_FUNCTION_2();
}

void __WiFiManagerClientAddDevice_cold_2()
{
}

void WiFiManagerClientDispatchAttachmentEvent_cold_1()
{
}

void __WiFiManagerClientAvailableCallback_cold_1( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __WiFiManagerClientAvailableCallback_cold_2()
{
}

void __WiFiManagerClientAvailableCallback_cold_3( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void WiFiManagerClientUnscheduleFromRunLoop_cold_1( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __WiFiManagerClientGetOrReconnectServerPort_cold_1( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __WiFiManagerClientGetOrReconnectServerPort_cold_2( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __WiFiManagerClientGetOrReconnectServerPort_cold_3( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __WiFiManagerClientGetOrReconnectServerPort_cold_4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __WiFiManagerClientGetOrReconnectServerPort_cold_5(uint8_t *buf, void *a2)
{
  *(_DWORD *)buf = 136315138;
  *a2 = "__WiFiManagerClientGetOrReconnectServerPort";
  _os_log_debug_impl( &dword_18658B000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEBUG,  "%s: invoking delayed attach callback",  buf,  0xCu);
}

void __WiFiManagerClientGetOrReconnectServerPort_cold_6( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __WiFiManagerClientGetOrReconnectServerPort_cold_7( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void WiFiDeviceClientCopyCurrentNetwork_cold_1(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  if (a1) {
    int v1 = *(_DWORD *)(a1 + 16);
  }
  else {
    int v1 = -1;
  }
  int v2 = 136315394;
  uint64_t v3 = "__WiFiDeviceClientCopyCurrentNetworkLegacy";
  __int16 v4 = 1024;
  int v5 = v1;
  _os_log_error_impl( &dword_18658B000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "%s: server port [%d]",  (uint8_t *)&v2,  0x12u);
  OUTLINED_FUNCTION_2();
}

void _WiFiDeviceClientDispatchVirtInterfaceStateChangeEvent_cold_1(const void *a1)
{
}

void _WiFiDeviceClientDispatchVirtInterfaceStateChangeEvent_cold_2( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void WiFiDeviceClientSetWiFiDirect_cold_1()
{
}

void _WiFiDeviceClientDispatchStartNetworkResult_cold_1( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _WiFiDeviceClientDispatchStopNetworkResult_cold_1( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _WiFiDeviceClientDispatchAutoJoinNotification_cold_1( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _WiFiDeviceClientDispatchUserJoinNotification_cold_1( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void WiFiNetworkSetStateWithReason_cold_1(const void *a1, char a2, uint64_t a3)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  SSID = WiFiNetworkGetSSID(a1);
  uint64_t v6 = "enabled";
  int v7 = 136315906;
  uint64_t v8 = "WiFiNetworkSetStateWithReason";
  int v10 = SSID;
  __int16 v9 = 2112;
  __int16 v11 = 2080;
  if (!a2) {
    uint64_t v6 = "disabled";
  }
  int v12 = v6;
  __int16 v13 = 2112;
  uint64_t v14 = a3;
  _os_log_error_impl( &dword_18658B000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "%s: Network '%@' %s for auto-join due to %@",  (uint8_t *)&v7,  0x2Au);
}

void WiFiNetworkCreateCoreWiFiNetworkProfile_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1896077D8] currentHandler];
  objc_msgSend( v0,  "handleFailureInFunction:file:lineNumber:description:",  objc_msgSend( NSString,  "stringWithUTF8String:",  "CLLocationCoordinate2D soft_CLLocationCoordinate2DMake(CLLocationDegrees, CLLocationDegrees)"),  @"WiFiNetwork.c",  51,  @"%s",  dlerror());
  __break(1u);
}

void getCWFScanResultPropertyOSSpecificAttributesKey_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1896077D8] currentHandler];
  objc_msgSend( v0,  "handleFailureInFunction:file:lineNumber:description:",  objc_msgSend( NSString,  "stringWithUTF8String:",  "NSString *getCWFScanResultPropertyOSSpecificAttributesKey(void)"),  @"WiFiNetwork.c",  39,  @"%s",  dlerror());
  __break(1u);
}

void __getCWFNetworkProfileClass_block_invoke_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1896077D8] currentHandler];
  objc_msgSend( v0,  "handleFailureInFunction:file:lineNumber:description:",  objc_msgSend(NSString, "stringWithUTF8String:", "Class getCWFNetworkProfileClass(void)_block_invoke"),  @"WiFiNetwork.c",  35,  @"Unable to find class %s",  "CWFNetworkProfile");
  __break(1u);
}

void CoreWiFiLibrary_cold_1(void *a1)
{
  uint64_t v2 = (void *)[MEMORY[0x1896077D8] currentHandler];
  objc_msgSend( v2,  "handleFailureInFunction:file:lineNumber:description:",  objc_msgSend(NSString, "stringWithUTF8String:", "void *CoreWiFiLibrary(void)"),  @"WiFiNetwork.c",  34,  @"%s",  *a1);
  __break(1u);
}

void __getCWFBSSClass_block_invoke_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1896077D8] currentHandler];
  objc_msgSend( v0,  "handleFailureInFunction:file:lineNumber:description:",  objc_msgSend(NSString, "stringWithUTF8String:", "Class getCWFBSSClass(void)_block_invoke"),  @"WiFiNetwork.c",  43,  @"Unable to find class %s",  "CWFBSS");
  __break(1u);
}

void __getCWFChannelClass_block_invoke_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1896077D8] currentHandler];
  objc_msgSend( v0,  "handleFailureInFunction:file:lineNumber:description:",  objc_msgSend(NSString, "stringWithUTF8String:", "Class getCWFChannelClass(void)_block_invoke"),  @"WiFiNetwork.c",  41,  @"Unable to find class %s",  "CWFChannel");
  __break(1u);
}

void __getCLLocationClass_block_invoke_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1896077D8] currentHandler];
  objc_msgSend( v0,  "handleFailureInFunction:file:lineNumber:description:",  objc_msgSend(NSString, "stringWithUTF8String:", "Class getCLLocationClass(void)_block_invoke"),  @"WiFiNetwork.c",  47,  @"Unable to find class %s",  "CLLocation");
  __break(1u);
}

void CoreLocationLibrary_cold_1(void *a1)
{
  uint64_t v2 = (void *)[MEMORY[0x1896077D8] currentHandler];
  objc_msgSend( v2,  "handleFailureInFunction:file:lineNumber:description:",  objc_msgSend(NSString, "stringWithUTF8String:", "void *CoreLocationLibrary(void)"),  @"WiFiNetwork.c",  46,  @"%s",  *a1);
  __break(1u);
}

void __getCWFScanResultClass_block_invoke_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x1896077D8] currentHandler];
  objc_msgSend( v0,  "handleFailureInFunction:file:lineNumber:description:",  objc_msgSend(NSString, "stringWithUTF8String:", "Class getCWFScanResultClass(void)_block_invoke"),  @"WiFiNetwork.c",  37,  @"Unable to find class %s",  "CWFScanResult");
  __break(1u);
}

void __getSFPasswordSharingServiceClass_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = (void *)[MEMORY[0x1896077D8] currentHandler];
  objc_msgSend( v2,  "handleFailureInFunction:file:lineNumber:description:",  objc_msgSend(NSString, "stringWithUTF8String:", "void *SharingLibrary(void)"),  @"WiFiPasswordSharingSimulator.m",  13,  @"%s",  *a1);
  __break(1u);
}

void __getSFPasswordSharingServiceClass_block_invoke_cold_2()
{
  uint64_t v0 = (void *)[MEMORY[0x1896077D8] currentHandler];
  objc_msgSend( v0,  "handleFailureInFunction:file:lineNumber:description:",  objc_msgSend( NSString,  "stringWithUTF8String:",  "Class getSFPasswordSharingServiceClass(void)_block_invoke"),  @"WiFiPasswordSharingSimulator.m",  14,  @"Unable to find class %s",  "SFPasswordSharingService");
  __break(1u);
  Apple80211CopyLeakyAPStatus();
}

uint64_t Apple80211CopyLeakyAPStatus()
{
  return MEMORY[0x18960FF40]();
}

uint64_t Apple80211ParseWPAPassword()
{
  return MEMORY[0x18960FF90]();
}

void CCHmac( CCHmacAlgorithm algorithm, const void *key, size_t keyLength, const void *data, size_t dataLength, void *macOut)
{
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x1895F82D8](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x1895F82E0](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1895F82E8](c, data, *(void *)&len);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return result;
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return (void *)MEMORY[0x1896025D8](allocator, size, hint);
}

void CFAllocatorDeallocate(CFAllocatorRef allocator, void *ptr)
{
}

CFAllocatorRef CFAllocatorGetDefault(void)
{
  return (CFAllocatorRef)MEMORY[0x1896025F8]();
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

void CFArrayApplyFunction(CFArrayRef theArray, CFRange range, CFArrayApplierFunction applier, void *context)
{
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x189602630](theArray, range.location, range.length, value);
}

CFArrayRef CFArrayCreate( CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x189602638](allocator, values, numValues, callBacks);
}

CFMutableArrayRef CFArrayCreateMutable( CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x189602648](allocator, capacity, callBacks);
}

CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray)
{
  return (CFMutableArrayRef)MEMORY[0x189602658](allocator, capacity, theArray);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x189602660](theArray);
}

CFIndex CFArrayGetFirstIndexOfValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x189602678](theArray, range.location, range.length, value);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x189602690]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x189602698](theArray, idx);
}

void CFArrayInsertValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
}

void CFArraySetValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1896027C8]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1896027D0](BOOLean);
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x189602A58](allocator, bytes, length);
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

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x189602AB0](theData);
}

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return (UInt8 *)MEMORY[0x189602AC0](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x189602AC8]();
}

CFComparisonResult CFDateCompare(CFDateRef theDate, CFDateRef otherDate, void *context)
{
  return MEMORY[0x189602AE8](theDate, otherDate, context);
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return (CFDateRef)MEMORY[0x189602AF0](allocator, at);
}

CFAbsoluteTime CFDateGetAbsoluteTime(CFDateRef theDate)
{
  return result;
}

CFTimeInterval CFDateGetTimeIntervalSinceDate(CFDateRef theDate, CFDateRef otherDate)
{
  return result;
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x189602B90](theDict, key);
}

CFDictionaryRef CFDictionaryCreate( CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x189602BA8](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFDictionaryRef CFDictionaryCreateCopy(CFAllocatorRef allocator, CFDictionaryRef theDict)
{
  return (CFDictionaryRef)MEMORY[0x189602BB0](allocator, theDict);
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

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x189602BF0]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x189602C00](theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x189602C08](theDict, key, value);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionaryReplaceValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
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

CFHashCode CFHash(CFTypeRef cf)
{
  return MEMORY[0x189602D50](cf);
}

CFMachPortRef CFMachPortCreate( CFAllocatorRef allocator, CFMachPortCallBack callout, CFMachPortContext *context, Boolean *shouldFreeInfo)
{
  return (CFMachPortRef)MEMORY[0x189602DB0](allocator, callout, context, shouldFreeInfo);
}

CFRunLoopSourceRef CFMachPortCreateRunLoopSource(CFAllocatorRef allocator, CFMachPortRef port, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x189602DB8](allocator, port, order);
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

CFIndex CFPropertyListWrite( CFPropertyListRef propertyList, CFWriteStreamRef stream, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return MEMORY[0x189603018](propertyList, stream, format, options, error);
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

void CFRunLoopPerformBlock(CFRunLoopRef rl, CFTypeRef mode, void *block)
{
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
}

void CFSetApplyFunction(CFSetRef theSet, CFSetApplierFunction applier, void *context)
{
}

Boolean CFSetContainsValue(CFSetRef theSet, const void *value)
{
  return MEMORY[0x189603248](theSet, value);
}

CFSetRef CFSetCreate( CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFSetCallBacks *callBacks)
{
  return (CFSetRef)MEMORY[0x189603250](allocator, values, numValues, callBacks);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x189603260](allocator, capacity, callBacks);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
}

CFComparisonResult CFStringCompare( CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1896033C0](theString1, theString2, compareOptions);
}

CFArrayRef CFStringCreateArrayBySeparatingStrings( CFAllocatorRef alloc, CFStringRef theString, CFStringRef separatorString)
{
  return (CFArrayRef)MEMORY[0x189603400](alloc, theString, separatorString);
}

CFDataRef CFStringCreateExternalRepresentation( CFAllocatorRef alloc, CFStringRef theString, CFStringEncoding encoding, UInt8 lossByte)
{
  return (CFDataRef)MEMORY[0x189603420](alloc, theString, *(void *)&encoding, lossByte);
}

CFStringRef CFStringCreateFromExternalRepresentation( CFAllocatorRef alloc, CFDataRef data, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x189603428](alloc, data, *(void *)&encoding);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x189603430](alloc, maxLength);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x189603468](alloc, cStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x189603490](alloc, formatOptions, format);
}

CFRange CFStringFind(CFStringRef theString, CFStringRef stringToFind, CFStringCompareFlags compareOptions)
{
  CFIndex v3 = MEMORY[0x1896034C0](theString, stringToFind, compareOptions);
  result.length = v4;
  result.location = v3;
  return result;
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1896034F8](theString, buffer, bufferSize, *(void *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x189603500](theString, *(void *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x189603548](theString);
}

CFStringEncoding CFStringGetSystemEncoding(void)
{
  return MEMORY[0x189603588]();
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x189603590]();
}

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return MEMORY[0x1896035A0](theString, prefix);
}

Boolean CFStringHasSuffix(CFStringRef theString, CFStringRef suffix)
{
  return MEMORY[0x1896035A8](theString, suffix);
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x189603870](alloc);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x189603888](alloc, uuid);
}

void CFWriteStreamClose(CFWriteStreamRef stream)
{
}

CFTypeRef CFWriteStreamCopyProperty(CFWriteStreamRef stream, CFStreamPropertyKey propertyName)
{
  return (CFTypeRef)MEMORY[0x189603920](stream, propertyName);
}

CFWriteStreamRef CFWriteStreamCreateWithAllocatedBuffers(CFAllocatorRef alloc, CFAllocatorRef bufferAllocator)
{
  return (CFWriteStreamRef)MEMORY[0x189603930](alloc, bufferAllocator);
}

Boolean CFWriteStreamOpen(CFWriteStreamRef stream)
{
  return MEMORY[0x189603960](stream);
}

uint64_t CWFCorrectEthernetAddressString()
{
  return MEMORY[0x18960F008]();
}

uint64_t EAPTLSRemoveTrustExceptionsBindings()
{
  return MEMORY[0x18960F330]();
}

kern_return_t IOMasterPort(mach_port_t bootstrapPort, mach_port_t *mainPort)
{
  return MEMORY[0x189608328](*(void *)&bootstrapPort, mainPort);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x189608398](*(void *)&object);
}

CFTypeRef IORegistryEntrySearchCFProperty( io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x189608520](*(void *)&entry, plane, key, allocator, *(void *)&options);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x189608560](*(void *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x189608580](name);
}

uint64_t MGGetProductType()
{
  return MEMORY[0x189613720]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x189611510]();
}

uint64_t MKBUserUnlockedSinceBoot()
{
  return MEMORY[0x189611540]();
}

void NSLog(NSString *format, ...)
{
}

int SCError(void)
{
  return MEMORY[0x18960C220]();
}

const char *__cdecl SCErrorString(int status)
{
  return (const char *)MEMORY[0x18960C228](*(void *)&status);
}

uint64_t SCLog()
{
  return MEMORY[0x18960C230]();
}

Boolean SCPreferencesApplyChanges(SCPreferencesRef prefs)
{
  return MEMORY[0x18960C3E8](prefs);
}

Boolean SCPreferencesCommitChanges(SCPreferencesRef prefs)
{
  return MEMORY[0x18960C3F0](prefs);
}

Boolean SCPreferencesLock(SCPreferencesRef prefs, Boolean wait)
{
  return MEMORY[0x18960C418](prefs, wait);
}

void SCPreferencesSynchronize(SCPreferencesRef prefs)
{
}

Boolean SCPreferencesUnlock(SCPreferencesRef prefs)
{
  return MEMORY[0x18960C450](prefs);
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return MEMORY[0x18960B3F8](attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x18960B400](query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return MEMORY[0x18960B408](query);
}

OSStatus SecItemUpdate(CFDictionaryRef query, CFDictionaryRef attributesToUpdate)
{
  return MEMORY[0x18960B418](query, attributesToUpdate);
}

int SecRandomCopyBytes(SecRandomRef rnd, size_t count, void *bytes)
{
  return MEMORY[0x18960B5F8](rnd, count, bytes);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x18960B640](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x18960B658](allocator);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
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

uint64_t _SC_CFMachPortCreateWithPort()
{
  return MEMORY[0x18960C4E0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1895F8898]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1895F8D88]();
}

void _os_log_debug_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x189612738]();
}

kern_return_t bootstrap_look_up(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return MEMORY[0x1895F9618](*(void *)&bp, service_name, sp);
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
}

dispatch_queue_global_t dispatch_get_global_queue(uint64_t identifier, unint64_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1895FAC40](identifier, flags);
}

uint64_t dispatch_mach_cancel()
{
  return MEMORY[0x1895FACF0]();
}

uint64_t dispatch_mach_connect()
{
  return MEMORY[0x1895FACF8]();
}

uint64_t dispatch_mach_create_f()
{
  return MEMORY[0x1895FAD08]();
}

uint64_t dispatch_mach_mig_demux()
{
  return MEMORY[0x1895FAD10]();
}

uint64_t dispatch_mach_msg_get_msg()
{
  return MEMORY[0x1895FAD20]();
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1895FAD80](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(uint64_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1895FADF0](value);
}

uint64_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1895FAE00](dsema);
}

uint64_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1895FAE08](dsema, timeout);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1895FAEE8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1895FAF58]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1895FAF78](__handle, __symbol);
}

ether_addr *__cdecl ether_aton(const char *a1)
{
  return (ether_addr *)MEMORY[0x1895FB148](a1);
}

char *__cdecl ether_ntoa(const ether_addr *a1)
{
  return (char *)MEMORY[0x1895FB158](a1);
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return MEMORY[0x1895FB628]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x1895FB638]();
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x1895FB6E0](a1, a2);
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1895FB8C0]();
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

kern_return_t mach_port_get_attributes( ipc_space_inspect_t task, mach_port_name_t name, mach_port_flavor_t flavor, mach_port_info_t port_info_out, mach_msg_type_number_t *port_info_outCnt)
{
  return MEMORY[0x1895FBB48](*(void *)&task, *(void *)&name, *(void *)&flavor, port_info_out, port_info_outCnt);
}

kern_return_t mach_port_insert_right( ipc_space_t task, mach_port_name_t name, mach_port_t poly, mach_msg_type_name_t polyPoly)
{
  return MEMORY[0x1895FBB70](*(void *)&task, *(void *)&name, *(void *)&poly, *(void *)&polyPoly);
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

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1895FBE48](__b, *(void *)&__c, __len);
}

uint64_t mig_dealloc_special_reply_port()
{
  return MEMORY[0x1895FBE88]();
}

uint64_t mig_get_special_reply_port()
{
  return MEMORY[0x1895FBEA0]();
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1895FC188](*(void *)&token);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1895FC1B0](name);
}

uint32_t notify_register_mach_port(const char *name, mach_port_t *notify_port, int flags, int *out_token)
{
  return MEMORY[0x1895FC1D0](name, notify_port, *(void *)&flags, out_token);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1896165B0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1896165C0]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1896165D8](a1);
}

void objc_autoreleasePoolPop(void *context)
{
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1896165E8]();
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1896166B8](name);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x189616728](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x189616730]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x189616738]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x189616740]();
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1895FC470](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1895FC640]();
}

uint64_t os_unfair_recursive_lock_lock_with_options()
{
  return MEMORY[0x1895FC688]();
}

uint64_t os_unfair_recursive_lock_unlock()
{
  return MEMORY[0x1895FC6A0]();
}

int printf(const char *a1, ...)
{
  return MEMORY[0x1895FC890](a1);
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

void *__cdecl realloc(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x1895FCC68](__ptr, __size);
}

char *__cdecl strcasestr(const char *__big, const char *__little)
{
  return (char *)MEMORY[0x1895FD038](__big, __little);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1895FD0B8](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1895FD0E8](__s1, __s2, __n);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1895FD2B8](a1, a2, a3, a4, a5);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return MEMORY[0x1895FD558](*(void *)&target_task, address, size);
}

kern_return_t vm_read( vm_map_t target_task, vm_address_t address, vm_size_t size, vm_offset_t *data, mach_msg_type_number_t *dataCnt)
{
  return MEMORY[0x1895FD5A8](*(void *)&target_task, address, size, data, dataCnt);
}

BOOLean_t voucher_mach_msg_set(mach_msg_header_t *msg)
{
  return MEMORY[0x1895FD5F8](msg);
}

uint64_t objc_msgSend_initWithCoordinate_altitude_horizontalAccuracy_verticalAccuracy_timestamp_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_initWithCoordinate_altitude_horizontalAccuracy_verticalAccuracy_timestamp_);
}