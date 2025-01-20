LABEL_20:
}

  return v1;
}

  vm_deallocate(mach_task_self_, (vm_address_t)a3, v14);
  return 0LL;
}

        if (dword_1000673C8) {
          return notify_post("com.apple.system.powermanagement.assertions");
        }
      }
    }
  }

  return result;
}
}

id sub_1000044F8(uint64_t a1)
{
  return [*(id *)(a1 + 32) triggerBatteryReauthentication];
}

void sub_100004DC8(void *a1, io_iterator_t a2)
{
  id v5 = a1;
  uint64_t v3 = IOIteratorNext(a2);
  if ((_DWORD)v3)
  {
    uint64_t v4 = v3;
    do
    {
      [v5 handleServiceAdded:v4];
      IOObjectRelease(v4);
      uint64_t v4 = IOIteratorNext(a2);
    }

    while ((_DWORD)v4);
  }
}

id sub_100004F54(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [a1 handleDataFromService:a2 messageType:a3 messageArgument:a4];
}

id sub_1000051BC()
{
  uint64_t v4 = 0LL;
  id v5 = &v4;
  uint64_t v6 = 0x3032000000LL;
  v7 = sub_1000052A8;
  v8 = sub_1000052B8;
  id v9 = 0LL;
  if (qword_100066E18)
  {
    v0 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([(id)qword_100066E18 queue]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000052C0;
    block[3] = &unk_100058F60;
    block[4] = &v4;
    dispatch_sync(v0, block);

    id v1 = (id)v5[5];
  }

  else
  {
    id v1 = 0LL;
  }

  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_100005290( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_1000052A8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_1000052B8(uint64_t a1)
{
}

void sub_1000052C0(uint64_t a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue([(id)qword_100066E18 trustedDataShared]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_1000052FC()
{
  v0 = objc_autoreleasePoolPush();
  os_log_t v1 = os_log_create("com.apple.powerd", "batteryTrustedData");
  uint64_t v2 = (void *)qword_100066E10;
  qword_100066E10 = (uint64_t)v1;

  uint64_t v3 = (os_log_s *)qword_100066E10;
  if (os_log_type_enabled((os_log_t)qword_100066E10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Battery Trusted Data init", v7, 2u);
  }

  uint64_t v4 = -[BatteryTrustedData initWithIdentifer:]( objc_alloc(&OBJC_CLASS___BatteryTrustedData),  "initWithIdentifer:",  @"0");
  id v5 = (void *)qword_100066E18;
  qword_100066E18 = (uint64_t)v4;

  if (qword_100066E18)
  {
    uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([(id)qword_100066E18 queue]);
    dispatch_async(v6, &stru_100058FA0);
  }

  else if (os_log_type_enabled((os_log_t)qword_100066E10, OS_LOG_TYPE_ERROR))
  {
    sub_10003E8D0();
  }

  objc_autoreleasePoolPop(v0);
}

void sub_100005404(id a1)
{
}

uint64_t sub_100005410()
{
  uint64_t v3 = 0LL;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000LL;
  uint64_t v0 = qword_100066E28;
  uint64_t v6 = qword_100066E28;
  if (!qword_100066E28)
  {
    v2[0] = _NSConcreteStackBlock;
    v2[1] = 3221225472LL;
    v2[2] = sub_1000054BC;
    v2[3] = &unk_100058F60;
    v2[4] = &v3;
    sub_1000054BC((uint64_t)v2);
    uint64_t v0 = v4[3];
  }

  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1000054A4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void *sub_1000054BC(uint64_t a1)
{
  uint64_t v5 = 0LL;
  if (!qword_100066E20)
  {
    __int128 v6 = off_100058FC0;
    uint64_t v7 = 0LL;
    qword_100066E20 = _sl_dlopen(&v6, &v5);
    uint64_t v3 = v5;
    uint64_t v2 = (void *)qword_100066E20;
    if (qword_100066E20)
    {
      if (!v5) {
        goto LABEL_5;
      }
    }

    else
    {
      uint64_t v3 = (char *)abort_report_np("%s", v5);
    }

    free(v3);
    goto LABEL_5;
  }

  uint64_t v2 = (void *)qword_100066E20;
LABEL_5:
  result = dlsym(v2, "reauthenticateBattery");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  qword_100066E28 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  return result;
}

void sub_1000055AC( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

void sub_1000055D0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

uint64_t sub_100005708(const __CFDictionary *a1, int a2)
{
  value = 0LL;
  int valuePtr = -1;
  uint64_t result = CFDictionaryGetValueIfPresent(a1, @"Format Version", (const void **)&value);
  if ((_DWORD)result)
  {
    uint64_t v4 = value;
    CFTypeID TypeID = CFNumberGetTypeID();
    if (v4 && CFGetTypeID(v4) == TypeID)
    {
      CFNumberGetValue((CFNumberRef)value, kCFNumberIntType, &valuePtr);
      int v6 = valuePtr;
    }

    else
    {
      int v6 = -1;
    }

    return v6 >= a2;
  }

  return result;
}

const void *sub_100005798(const void *a1)
{
  CFTypeID TypeID = CFNumberGetTypeID();
  if (!a1) {
    return 0LL;
  }
  if (CFGetTypeID(a1) == TypeID) {
    return a1;
  }
  return 0LL;
}

BOOL sub_1000057D8(const __CFDictionary *a1)
{
  if (!a1)
  {
    BOOL result = os_log_type_enabled((os_log_t)qword_1000678E0, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    sub_10003E8FC();
    return 0LL;
  }

  if (!CFDictionaryGetValueIfPresent(a1, @"Serial", (const void **)&value))
  {
    BOOL result = os_log_type_enabled((os_log_t)qword_1000678E0, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    sub_10003E928();
    return 0LL;
  }

  os_log_t v1 = (const __CFString *)sub_1000155E0();
  if (CFStringCompare(v1, (CFStringRef)value, 0LL))
  {
    BOOL result = os_log_type_enabled((os_log_t)qword_1000678E0, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    sub_10003E954();
    return 0LL;
  }

  return 1LL;
}

CFMutableDictionaryRef sub_1000058A4()
{
  int valuePtr = 3;
  uint64_t v0 = (const __CFDictionary *)_CFPreferencesCopyMultipleWithContainer( 0LL,  @"com.apple.batterydata.cyclecount",  kCFPreferencesCurrentUser,  kCFPreferencesCurrentHost,  @"/var/MobileSoftwareUpdate/Hardware/Battery");
  if (v0)
  {
    os_log_t v1 = v0;
    CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(0LL, 0LL, v0);
    CFRelease(v1);
  }

  else
  {
    CFMutableDictionaryRef MutableCopy = 0LL;
  }

  if (!sub_1000057D8(MutableCopy) || (sub_100005708(MutableCopy, 3) & 1) == 0)
  {
    if (MutableCopy) {
      CFRelease(MutableCopy);
    }
    uint64_t v3 = CFPreferencesCopyMultiple( 0LL,  @"com.apple.batterydata.cyclecount",  kCFPreferencesAnyUser,  kCFPreferencesCurrentHost);
    if (v3)
    {
      uint64_t v4 = v3;
      CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(0LL, 0LL, v3);
      CFRelease(v4);
      sub_100005DC0(MutableCopy, @"com.apple.batterydata.cyclecount");
      CFIndex Count = CFDictionaryGetCount(MutableCopy);
      if (Count)
      {
        CFIndex v6 = Count;
        uint64_t v7 = (const void **)malloc(8 * Count);
        if (v7)
        {
          v8 = v7;
          CFDictionaryGetKeysAndValues(MutableCopy, v7, 0LL);
          Mutable = CFArrayCreateMutable(0LL, v6, &kCFTypeArrayCallBacks);
          if (v6 >= 1)
          {
            v10 = v8;
            do
            {
              v11 = *v10++;
              CFArrayAppendValue(Mutable, v11);
              --v6;
            }

            while (v6);
          }

          free(v8);
          if (Mutable)
          {
            CFPreferencesSetMultiple( 0LL,  Mutable,  @"com.apple.batterydata.cyclecount",  kCFPreferencesAnyUser,  kCFPreferencesCurrentHost);
            CFRelease(Mutable);
          }
        }
      }
    }

    if (!sub_1000057D8(MutableCopy) || (sub_100005708(MutableCopy, 3) & 1) == 0)
    {
      CFIndex v13 = CFDictionaryGetCount(MutableCopy);
      if (v13)
      {
        CFIndex v14 = v13;
        v15 = (const void **)malloc(8 * v13);
        if (v15)
        {
          v16 = v15;
          CFDictionaryGetKeysAndValues(MutableCopy, v15, 0LL);
          v17 = CFArrayCreateMutable(0LL, v14, &kCFTypeArrayCallBacks);
          if (v14 >= 1)
          {
            v18 = v16;
            do
            {
              v19 = *v18++;
              CFArrayAppendValue(v17, v19);
              --v14;
            }

            while (v14);
          }

          free(v16);
          if (v17)
          {
            if (CFArrayGetCount(v17))
            {
              unint64_t v20 = 0LL;
              do
              {
                ValueAtIndex = CFArrayGetValueAtIndex(v17, v20);
                _CFPreferencesSetValueWithContainer( ValueAtIndex,  0LL,  @"com.apple.batterydata.cyclecount",  kCFPreferencesCurrentUser,  kCFPreferencesCurrentHost,  @"/var/MobileSoftwareUpdate/Hardware/Battery");
                ++v20;
              }

              while (v20 < CFArrayGetCount(v17));
            }

            CFRelease(v17);
          }
        }
      }

      v12 = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      v22 = (const void *)sub_1000155E0();
      CFDictionarySetValue(v12, @"Serial", v22);
      CFNumberRef v23 = CFNumberCreate(0LL, kCFNumberIntType, &valuePtr);
      CFDictionarySetValue(v12, @"Format Version", v23);
      CFRelease(v23);
      if (sub_1000057D8(MutableCopy) && sub_100005708(MutableCopy, 2))
      {
        if (MutableCopy)
        {
          if (v12)
          {
            CFDictionaryGetValueIfPresent(MutableCopy, @"Index", (const void **)&value);
            v24 = value;
            CFTypeID TypeID = CFArrayGetTypeID();
            if (v24)
            {
              if (CFGetTypeID(v24) == TypeID)
              {
                CFDictionaryGetValueIfPresent(MutableCopy, @"Cycles", (const void **)&theArray);
                CFArrayRef v26 = theArray;
                CFTypeID v27 = CFArrayGetTypeID();
                if (v26)
                {
                  if (CFGetTypeID(v26) == v27)
                  {
                    CFMutableArrayRef v28 = CFArrayCreateMutable(0LL, 0LL, &kCFTypeArrayCallBacks);
                    if (v28)
                    {
                      v29 = v28;
                      if (CFArrayGetCount(theArray))
                      {
                        unint64_t v30 = 0LL;
                        do
                        {
                          v31 = (const __CFArray *)CFArrayGetValueAtIndex(theArray, v30);
                          CFTypeID v32 = CFArrayGetTypeID();
                          if (v31)
                          {
                            if (CFGetTypeID(v31) == v32)
                            {
                              CFMutableDictionaryRef v33 = CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
                              if (v33)
                              {
                                v34 = v33;
                                if (CFArrayGetCount(v31))
                                {
                                  unint64_t v35 = 0LL;
                                  do
                                  {
                                    v36 = CFArrayGetValueAtIndex((CFArrayRef)value, v35);
                                    v37 = CFArrayGetValueAtIndex(v31, v35);
                                    CFDictionarySetValue(v34, v36, v37);
                                    ++v35;
                                  }

                                  while (v35 < CFArrayGetCount(v31));
                                }

                                CFArrayAppendValue(v29, v34);
                                CFRelease(v34);
                              }
                            }
                          }

                          ++v30;
                        }

                        while (v30 < CFArrayGetCount(theArray));
                      }

                      CFDictionarySetValue(v12, @"Cycles", v29);
                      CFRelease(v29);
                      sub_100005DC0(v12, @"com.apple.batterydata.cyclecount");
                      goto LABEL_51;
                    }
                  }
                }
              }
            }
          }
        }

        if (os_log_type_enabled((os_log_t)qword_1000678E0, OS_LOG_TYPE_ERROR))
        {
          sub_10003E980();
          if (!MutableCopy) {
            return v12;
          }
          goto LABEL_51;
        }
      }

      if (!MutableCopy) {
        return v12;
      }
LABEL_51:
      CFRelease(MutableCopy);
      return v12;
    }
  }

  return MutableCopy;
}

void sub_100005DC0(const __CFDictionary *a1, void *context)
{
  int v3 = _CFPreferencesSynchronizeWithContainer( context,  kCFPreferencesCurrentUser,  kCFPreferencesCurrentHost,  @"/var/MobileSoftwareUpdate/Hardware/Battery");
  uint64_t v4 = (os_log_s *)qword_1000678E0;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)qword_1000678E0, OS_LOG_TYPE_DEBUG)) {
      sub_10003EA10();
    }
  }

  else if (os_log_type_enabled((os_log_t)qword_1000678E0, OS_LOG_TYPE_ERROR))
  {
    sub_10003E9AC((uint64_t)context, v4, v5, v6, v7, v8, v9, v10);
  }

__CFDictionary *sub_100005E74(const __CFDictionary *a1)
{
  CFDictionaryRef v25 = 0LL;
  CFDictionaryRef theDict = 0LL;
  Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (Mutable)
  {
    int v3 = @"CycleCount";
    uint64_t v4 = off_100058FD8;
    do
    {
      if (CFDictionaryGetValueIfPresent(a1, v3, (const void **)&value))
      {
        CFDictionarySetValue(Mutable, *v4, value);
      }

      else
      {
        uint64_t v5 = (os_log_s *)qword_1000678E0;
        if (os_log_type_enabled((os_log_t)qword_1000678E0, OS_LOG_TYPE_ERROR))
        {
          uint64_t v7 = *v4;
          *(_DWORD *)buf = 138412290;
          v29 = v7;
          _os_log_error_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "Failed to read data for key %@\n",  buf,  0xCu);
        }
      }

      uint64_t v6 = v4[1];
      ++v4;
      int v3 = v6;
    }

    while (v6);
    if (CFDictionaryGetValueIfPresent(a1, @"BatteryData", (const void **)&theDict)
      && (v8 = theDict, CFTypeID TypeID = CFDictionaryGetTypeID(), v8)
      && CFGetTypeID(v8) == TypeID)
    {
      uint64_t v10 = theDict;
      v11 = @"Flags";
      v12 = off_100058FF8;
      do
      {
        if (CFDictionaryGetValueIfPresent(v10, v11, (const void **)&value))
        {
          CFDictionarySetValue(Mutable, *v12, value);
        }

        else
        {
          CFIndex v13 = (os_log_s *)qword_1000678E0;
          if (os_log_type_enabled((os_log_t)qword_1000678E0, OS_LOG_TYPE_ERROR))
          {
            v15 = *v12;
            *(_DWORD *)buf = 138412290;
            v29 = v15;
            _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "Failed to read data for key %@\n",  buf,  0xCu);
          }
        }

        CFIndex v14 = v12[1];
        ++v12;
        v11 = v14;
      }

      while (v14);
    }

    else if (os_log_type_enabled((os_log_t)qword_1000678E0, OS_LOG_TYPE_ERROR))
    {
      sub_10003EAD8();
    }

    if (CFDictionaryGetValueIfPresent(theDict, @"LifetimeData", (const void **)&v25)
      && (CFDictionaryRef v16 = v25, v17 = CFDictionaryGetTypeID(), v16)
      && CFGetTypeID(v16) == v17)
    {
      v18 = v25;
      v19 = @"MaximumTemperature";
      unint64_t v20 = off_100059098;
      do
      {
        if (CFDictionaryGetValueIfPresent(v18, v19, (const void **)&value))
        {
          CFDictionarySetValue(Mutable, *v20, value);
        }

        else
        {
          v21 = (os_log_s *)qword_1000678E0;
          if (os_log_type_enabled((os_log_t)qword_1000678E0, OS_LOG_TYPE_ERROR))
          {
            CFNumberRef v23 = *v20;
            *(_DWORD *)buf = 138412290;
            v29 = v23;
            _os_log_error_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "Failed to read data for key %@\n",  buf,  0xCu);
          }
        }

        v22 = v20[1];
        ++v20;
        v19 = v22;
      }

      while (v22);
    }

    else if (os_log_type_enabled((os_log_t)qword_1000678E0, OS_LOG_TYPE_ERROR))
    {
      sub_10003EAAC();
    }
  }

  else if (os_log_type_enabled((os_log_t)qword_1000678E0, OS_LOG_TYPE_ERROR))
  {
    sub_10003EA80();
  }

  return Mutable;
}

void sub_1000061B8()
{
  value = 0LL;
  int valuePtr = 1800;
  qword_100066E30 = (uint64_t)dispatch_queue_create("com.apple.powerManagement.batteryDataQ", 0LL);
  dispatch_sync((dispatch_queue_t)qword_100066E30, &stru_100059130);
  uint64_t v0 = (const __CFDictionary *)IOPMCopySystemPowerSettings();
  if (v0)
  {
    os_log_t v1 = v0;
    int v2 = 108000;
    if (CFDictionaryGetValueIfPresent(v0, @"HeatMapInterval", (const void **)&value))
    {
      int v3 = value;
      CFTypeID TypeID = CFNumberGetTypeID();
      if (v3)
      {
        if (CFGetTypeID(v3) == TypeID)
        {
          CFNumberGetValue((CFNumberRef)value, kCFNumberIntType, &valuePtr);
          int v2 = 60 * valuePtr;
        }
      }
    }

    int valuePtr = v2;
    CFRelease(v1);
  }

  uint64_t v5 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)qword_100066E30);
  qword_100066E38 = (uint64_t)v5;
  dispatch_time_t v6 = dispatch_walltime(0LL, 0LL);
  dispatch_source_set_timer(v5, v6, 1000000000LL * valuePtr, 0LL);
  dispatch_source_set_event_handler((dispatch_source_t)qword_100066E38, &stru_100059170);
  dispatch_resume((dispatch_object_t)qword_100066E38);
  if (os_log_type_enabled((os_log_t)qword_1000678E0, OS_LOG_TYPE_DEBUG)) {
    sub_10003EB04();
  }
}

void sub_100006318(id a1)
{
  char v17 = 1;
  uint64_t v1 = sub_100039CB0(1112036428, &v17, 1u);
  int v2 = (os_log_s *)qword_1000678E0;
  if ((_DWORD)v1)
  {
    uint64_t v3 = v1;
    if (os_log_type_enabled((os_log_t)qword_1000678E0, OS_LOG_TYPE_ERROR)) {
      sub_10003EBA0(v3, v2, v4, v5, v6, v7, v8, v9);
    }
  }

  else if (os_log_type_enabled((os_log_t)qword_1000678E0, OS_LOG_TYPE_DEBUG))
  {
    sub_10003EB30(v2, v10, v11, v12, v13, v14, v15, v16);
  }

void sub_1000063A8()
{
  unsigned __int8 v65 = 25;
  value = 0LL;
  uint64_t v0 = (const void *)sub_1000155E0();
  CFTypeID TypeID = CFStringGetTypeID();
  if (v0 && CFGetTypeID(v0) == TypeID)
  {
    v61 = sub_100008368(dword_100066800);
    int v2 = dword_100066800;
    int valuePtr = 4;
    uint64_t v3 = sub_100007EDC(dword_100066800);
    if (sub_1000057D8(v3) && (sub_100005708(v3, 4) & 1) != 0)
    {
      uint64_t v4 = 25LL;
    }

    else
    {
      if (!sub_100005708(v3, 3) || !sub_1000057D8(v3))
      {
        uint64_t v5 = sub_100008368(dword_100066800);
        CFIndex Count = CFDictionaryGetCount(v3);
        if (Count)
        {
          CFIndex v7 = Count;
          uint64_t v8 = (const void **)malloc(8 * Count);
          if (v8)
          {
            uint64_t v9 = v8;
            CFDictionaryGetKeysAndValues(v3, v8, 0LL);
            Mutable = CFArrayCreateMutable(0LL, v7, &kCFTypeArrayCallBacks);
            if (v7 >= 1)
            {
              uint64_t v11 = v9;
              do
              {
                uint64_t v12 = *v11++;
                CFArrayAppendValue(Mutable, v12);
                --v7;
              }

              while (v7);
            }

            free(v9);
            if (Mutable)
            {
              CFPreferencesSetMultiple(0LL, Mutable, v5, kCFPreferencesAnyUser, kCFPreferencesCurrentHost);
              CFRelease(Mutable);
            }
          }
        }

        if (v3) {
          CFRelease(v3);
        }
        uint64_t v13 = (os_log_s *)qword_1000678E0;
        if (os_log_type_enabled((os_log_t)qword_1000678E0, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          int v71 = v2;
          _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Creating a new heat map for state %d\n",  buf,  8u);
        }

        uint64_t v3 = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      }

      uint64_t v14 = (const void *)sub_1000155E0();
      CFDictionarySetValue(v3, @"Serial", v14);
      CFNumberRef v15 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
      if (v15)
      {
        CFNumberRef v16 = v15;
        CFDictionarySetValue(v3, @"Format Version", v15);
        CFRelease(v16);
      }

      LOBYTE(v62) = 0;
      char v66 = 1;
      *(_DWORD *)buf = 0;
      int v17 = sub_10003A3EC(1111905072, &v62);
      v18 = (os_log_s *)qword_1000678E0;
      if (v17 && os_log_type_enabled((os_log_t)qword_1000678E0, OS_LOG_TYPE_ERROR))
      {
        LOWORD(values) = 0;
        _os_log_error_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "failed to read battery feature flags\n",  (uint8_t *)&values,  2u);
        v18 = (os_log_s *)qword_1000678E0;
      }

      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        sub_10003ED30((uint64_t)&v62, v18, v19, v20, v21, v22, v23, v24);
      }
      if ((v62 & 1) != 0)
      {
        *(_DWORD *)buf = 0;
      }

      else if ((v62 & 2) != 0)
      {
        *(_DWORD *)buf = 1;
      }

      CFNumberRef v25 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, buf);
      if (v25)
      {
        CFNumberRef v26 = v25;
        CFDictionarySetValue(v3, @"HeatMapType", v25);
        CFRelease(v26);
      }

      uint64_t v4 = v65;
    }

    __memset_chk(buf, 0LL, v4, 25LL);
    if (off_100066798[0])
    {
      unint64_t v27 = 0LL;
      CFMutableArrayRef v28 = off_100066798;
      while (1)
      {
        unsigned __int8 v29 = v27;
        if (v27 >= 0xA)
        {
          if (v27 > 0xF)
          {
            if (os_log_type_enabled((os_log_t)qword_1000678E0, OS_LOG_TYPE_ERROR)) {
              sub_10003ED04();
            }
            return;
          }

          unsigned __int8 v29 = v27 + 7;
        }

        int v30 = v29 + 1112036400;
        int v31 = sub_10003A3EC(v30, buf);
        if (!v31) {
          break;
        }
        int v32 = v31;
        uint64_t v33 = qword_1000678E0;
        if (os_log_type_enabled((os_log_t)qword_1000678E0, OS_LOG_TYPE_ERROR))
        {
          int valuePtr = 67109376;
          *(_DWORD *)v68 = v27;
          *(_WORD *)&v68[4] = 1024;
          *(_DWORD *)&v68[6] = v32;
          v34 = (os_log_s *)v33;
          unint64_t v35 = "Failed to read Heatmap at index %d.(rc:0x%x)\n";
LABEL_45:
          _os_log_error_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, v35, (uint8_t *)&valuePtr, 0xEu);
        }

LABEL_73:
        CFMutableArrayRef v28 = &off_100066798[++v27];
        if (!*v28) {
          goto LABEL_76;
        }
      }

      if (v65)
      {
        uint64_t v36 = 0LL;
        while (!buf[v36])
        {
          if (v65 == ++v36) {
            goto LABEL_53;
          }
        }
      }

      else
      {
        LODWORD(v36) = 0;
      }

      if ((_DWORD)v36 == v65)
      {
LABEL_53:
        v37 = (os_log_s *)qword_1000678E0;
        if (os_log_type_enabled((os_log_t)qword_1000678E0, OS_LOG_TYPE_DEBUG))
        {
          int valuePtr = 67109120;
          *(_DWORD *)v68 = v27;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEBUG,  "Avoid saving data from index %d",  (uint8_t *)&valuePtr,  8u);
        }

        goto LABEL_73;
      }

      v38 = *v28;
      value = 0LL;
      values = v38;
      if (CFDictionaryGetValueIfPresent(v3, v38, (const void **)&value))
      {
        value = CFArrayCreateMutableCopy(0LL, 25LL, (CFArrayRef)value);
      }

      else
      {
        value = CFArrayCreateMutable(0LL, 25LL, &kCFTypeArrayCallBacks);
        int valuePtr = 0;
        CFNumberRef v39 = CFNumberCreate(0LL, kCFNumberIntType, &valuePtr);
        for (CFIndex i = 0LL; i != 25; ++i)
          CFArraySetValueAtIndex((CFMutableArrayRef)value, i, v39);
        CFRelease(v39);
      }

      for (CFIndex j = 0LL; j != 25; ++j)
      {
        int v62 = 0;
        ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex((CFArrayRef)value, j);
        CFTypeID v43 = CFNumberGetTypeID();
        if (ValueAtIndex && CFGetTypeID(ValueAtIndex) == v43)
        {
          CFNumberGetValue(ValueAtIndex, kCFNumberIntType, &v62);
        }

        else
        {
          v44 = (os_log_s *)qword_1000678E0;
          if (os_log_type_enabled((os_log_t)qword_1000678E0, OS_LOG_TYPE_ERROR))
          {
            int valuePtr = 67109120;
            *(_DWORD *)v68 = j;
            _os_log_error_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_ERROR,  "Unexpected data type in the row at index %d\n",  (uint8_t *)&valuePtr,  8u);
          }
        }

        v62 += buf[j];
        CFNumberRef v45 = CFNumberCreate(0LL, kCFNumberIntType, &v62);
        CFArraySetValueAtIndex((CFMutableArrayRef)value, j, v45);
        CFRelease(v45);
      }

      v46 = CFArrayCreate(0LL, (const void **)&values, 1LL, &kCFTypeArrayCallBacks);
      if (v46)
      {
        v47 = v46;
        CFPreferencesSetMultiple(0LL, v46, v61, kCFPreferencesAnyUser, kCFPreferencesCurrentHost);
        CFRelease(v47);
      }

      CFDictionarySetValue(v3, values, value);
      CFRelease(value);
      v48 = (os_log_s *)qword_1000678E0;
      if (os_log_type_enabled((os_log_t)qword_1000678E0, OS_LOG_TYPE_DEBUG))
      {
        int valuePtr = 138412546;
        *(void *)v68 = v61;
        *(_WORD *)&v68[8] = 2112;
        v69 = values;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_DEBUG,  "Updated values for path %@. key:%@\n",  (uint8_t *)&valuePtr,  0x16u);
      }

      unsigned int v49 = v65;
      __memset_chk(buf, 0LL, v65, 25LL);
      int v50 = sub_100039CB0(v30, buf, v49);
      if (!v50) {
        goto LABEL_73;
      }
      int v51 = v50;
      uint64_t v52 = qword_1000678E0;
      if (!os_log_type_enabled((os_log_t)qword_1000678E0, OS_LOG_TYPE_ERROR)) {
        goto LABEL_73;
      }
      int valuePtr = 67109376;
      *(_DWORD *)v68 = v27;
      *(_WORD *)&v68[4] = 1024;
      *(_DWORD *)&v68[6] = v51;
      v34 = (os_log_s *)v52;
      unint64_t v35 = "Failed to clear Heatmap at index %d.(rc:0x%x\n)";
      goto LABEL_45;
    }

LABEL_76:
    CFPreferencesSetMultiple(v3, 0LL, v61, kCFPreferencesAnyUser, kCFPreferencesCurrentHost);
    int v53 = CFPreferencesSynchronize(v61, kCFPreferencesAnyUser, kCFPreferencesCurrentHost);
    v54 = (os_log_s *)qword_1000678E0;
    if (v53)
    {
      if (os_log_type_enabled((os_log_t)qword_1000678E0, OS_LOG_TYPE_DEBUG))
      {
        sub_10003EC94((uint64_t)v61, v54);
        if (!v3) {
          return;
        }
LABEL_82:
        CFRelease(v3);
        return;
      }
    }

    else if (os_log_type_enabled((os_log_t)qword_1000678E0, OS_LOG_TYPE_ERROR))
    {
      sub_10003EC30((uint64_t)v61, v54, v55, v56, v57, v58, v59, v60);
      if (!v3) {
        return;
      }
      goto LABEL_82;
    }

    if (!v3) {
      return;
    }
    goto LABEL_82;
  }

  if (os_log_type_enabled((os_log_t)qword_1000678E0, OS_LOG_TYPE_ERROR)) {
    sub_10003EC04();
  }
}

void sub_100006BEC(CFDictionaryRef theDict)
{
  if (qword_100066E30)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 0x40000000LL;
    block[2] = sub_100006C90;
    block[3] = &unk_100059190;
    block[4] = CFDictionaryCreateCopy(0LL, theDict);
    dispatch_async((dispatch_queue_t)qword_100066E30, block);
  }

  else if (os_log_type_enabled((os_log_t)qword_1000678E0, OS_LOG_TYPE_DEBUG))
  {
    sub_10003ED98();
  }

void sub_100006C90(uint64_t a1)
{
  if (dword_100066800 == 3) {
    dword_100066800 = sub_100007B0C(*(const __CFDictionary **)(a1 + 32));
  }
  int v2 = (const void *)sub_1000155E0();
  CFTypeID TypeID = CFStringGetTypeID();
  if (!v2 || CFGetTypeID(v2) != TypeID)
  {
    if (os_log_type_enabled((os_log_t)qword_1000678E0, OS_LOG_TYPE_ERROR)) {
      sub_10003EC04();
    }
    goto LABEL_14;
  }

  int v4 = sub_100007B0C(*(const __CFDictionary **)(a1 + 32));
  if (v4 != dword_100066800)
  {
    int v5 = v4;
    sub_1000063A8();
    dword_100066800 = v5;
  }

  uint64_t v6 = *(const __CFDictionary **)(a1 + 32);
  LODWORD(valuePtr) = -1;
  if (dword_100066804 == -1)
  {
    CFIndex v7 = sub_1000058A4();
    Value = (const __CFArray *)CFDictionaryGetValue(v7, @"Cycles");
    CFTypeID v19 = CFArrayGetTypeID();
    if (Value && CFGetTypeID(Value) == v19) {
      CFMutableDictionaryRef MutableCopy = CFArrayCreateMutableCopy(0LL, 0LL, Value);
    }
    else {
      CFMutableDictionaryRef MutableCopy = CFArrayCreateMutable(0LL, 0LL, &kCFTypeArrayCallBacks);
    }
    uint64_t v8 = MutableCopy;
    CFIndex Count = CFArrayGetCount(MutableCopy);
    if (Count >= 1)
    {
      ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v8, Count - 1);
      CFTypeID v23 = CFDictionaryGetTypeID();
      if (ValueAtIndex)
      {
        if (CFGetTypeID(ValueAtIndex) == v23)
        {
          CFDictionaryGetValueIfPresent(ValueAtIndex, @"CycleCount", (const void **)number);
          CFNumberRef v24 = number[0];
          CFTypeID v25 = CFNumberGetTypeID();
          if (v24)
          {
            if (CFGetTypeID(v24) == v25) {
              CFNumberGetValue(number[0], kCFNumberIntType, &dword_100066804);
            }
          }
        }
      }
    }
  }

  else
  {
    CFIndex v7 = 0LL;
    uint64_t v8 = 0LL;
  }

  uint64_t v9 = (const __CFNumber *)CFDictionaryGetValue(v6, @"CycleCount");
  number[0] = v9;
  CFTypeID v10 = CFNumberGetTypeID();
  if (v9 && CFGetTypeID(v9) == v10)
  {
    CFNumberGetValue(number[0], kCFNumberIntType, &valuePtr);
    int v11 = (int)valuePtr;
  }

  else
  {
    int v11 = -1;
  }

  int v12 = dword_100066804;
  if (dword_100066804 != -1 && dword_100066804 / 10 == v11 / 10)
  {
    uint64_t v13 = (os_log_s *)qword_1000678E0;
    if (os_log_type_enabled((os_log_t)qword_1000678E0, OS_LOG_TYPE_DEBUG)) {
      sub_10003EEB4(v11, v12, v13);
    }
    uint64_t v14 = 0LL;
    if (!v7) {
      goto LABEL_42;
    }
LABEL_41:
    CFRelease(v7);
    goto LABEL_42;
  }

  dword_100066804 = v11;
  if (!v7)
  {
    if (v8) {
      CFRelease(v8);
    }
    CFIndex v7 = sub_1000058A4();
    CFNumberRef v15 = (const __CFArray *)CFDictionaryGetValue(v7, @"Cycles");
    CFTypeID v16 = CFArrayGetTypeID();
    if (v15 && CFGetTypeID(v15) == v16) {
      CFMutableArrayRef Mutable = CFArrayCreateMutableCopy(0LL, 0LL, v15);
    }
    else {
      CFMutableArrayRef Mutable = CFArrayCreateMutable(0LL, 0LL, &kCFTypeArrayCallBacks);
    }
    uint64_t v8 = Mutable;
  }

  uint64_t v14 = sub_100005E74(v6);
  CFArrayAppendValue(v8, v14);
  CFDictionarySetValue(v7, @"Cycles", v8);
  sub_100005DC0(v7, @"com.apple.batterydata.cyclecount");
  if (v7) {
    goto LABEL_41;
  }
LABEL_42:
  if (v14) {
    CFRelease(v14);
  }
  if (v8) {
    CFRelease(v8);
  }
  CFNumberRef v26 = *(const __CFDictionary **)(a1 + 32);
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  unint64_t v27 = (const __CFDictionary *)CFDictionaryGetValue(v26, @"KioskMode");
  CFTypeID v28 = CFDictionaryGetTypeID();
  if (v27 && CFGetTypeID(v27) == v28)
  {
    unsigned __int8 v29 = (const __CFNumber *)CFDictionaryGetValue(v27, @"KioskModeMode");
    if (v29)
    {
      CFNumberGetValue(v29, kCFNumberIntType, &v102);
      if (!qword_100066E40)
      {
        int v30 = (const __CFDictionary *)_CFPreferencesCopyMultipleWithContainer( 0LL,  @"com.apple.batterydata.kioskmode",  kCFPreferencesCurrentUser,  kCFPreferencesCurrentHost,  @"/var/MobileSoftwareUpdate/Hardware/Battery");
        qword_100066E40 = (uint64_t)CFDictionaryCreateMutableCopy(0LL, 0LL, v30);
        CFRelease(v30);
        if (!sub_100005708((const __CFDictionary *)qword_100066E40, 1)
          || !sub_1000057D8((const __CFDictionary *)qword_100066E40))
        {
          int v31 = (const void *)qword_100066E40;
          CFTypeID v32 = CFDictionaryGetTypeID();
          if (v31 && CFGetTypeID(v31) == v32) {
            CFRelease((CFTypeRef)qword_100066E40);
          }
          uint64_t v33 = CFPreferencesCopyMultiple( 0LL,  @"com.apple.batterydata.kioskmode",  kCFPreferencesAnyUser,  kCFPreferencesCurrentHost);
          qword_100066E40 = (uint64_t)CFDictionaryCreateMutableCopy(0LL, 0LL, v33);
          CFRelease(v33);
          CFIndex v34 = CFDictionaryGetCount((CFDictionaryRef)qword_100066E40);
          if (qword_100066E40)
          {
            if (v34)
            {
              sub_100005DC0((const __CFDictionary *)qword_100066E40, @"com.apple.batterydata.kioskmode");
              unint64_t v35 = (const void **)malloc(8 * v34);
              if (v35)
              {
                uint64_t v36 = v35;
                CFDictionaryGetKeysAndValues((CFDictionaryRef)qword_100066E40, v35, 0LL);
                for (uint64_t i = 0LL; i != v34; ++i)
                  CFPreferencesSetValue( (CFStringRef)v36[i],  0LL,  @"com.apple.batterydata.kioskmode",  kCFPreferencesAnyUser,  kCFPreferencesCurrentHost);
                free(v36);
              }
            }
          }
        }

        if (sub_100005708((const __CFDictionary *)qword_100066E40, 1)
          && sub_1000057D8((const __CFDictionary *)qword_100066E40))
        {
          if (CFDictionaryGetValueIfPresent( (CFDictionaryRef)qword_100066E40,  @"KioskModeMode",  (const void **)number))
          {
            CFNumberRef v38 = number[0];
            CFTypeID v39 = CFNumberGetTypeID();
            if (v38)
            {
              if (CFGetTypeID(v38) == v39) {
                CFNumberGetValue(number[0], kCFNumberIntType, &dword_100066808);
              }
            }
          }

          if (CFDictionaryGetValueIfPresent( (CFDictionaryRef)qword_100066E40,  @"lastUpdateTs",  (const void **)number))
          {
            CFNumberRef v40 = number[0];
            CFTypeID v41 = CFNumberGetTypeID();
            if (v40)
            {
              if (CFGetTypeID(v40) == v41) {
                CFNumberGetValue(number[0], kCFNumberDoubleType, &qword_100066E48);
              }
            }
          }
        }

        else
        {
          v42 = (__CFDictionary *)qword_100066E40;
          CFTypeID v43 = (const void *)sub_1000155E0();
          CFDictionarySetValue(v42, @"Serial", v43);
          LODWORD(number[0]) = 1;
          CFNumberRef v44 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, number);
          if (v44)
          {
            CFNumberRef v45 = v44;
            CFDictionarySetValue((CFMutableDictionaryRef)qword_100066E40, @"Format Version", v44);
            CFRelease(v45);
          }

          CFNumberRef v46 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &v102);
          if (v46)
          {
            CFNumberRef v47 = v46;
            CFDictionarySetValue((CFMutableDictionaryRef)qword_100066E40, @"KioskModeMode", v46);
            CFRelease(v47);
          }

          LODWORD(valuePtr) = 0;
          CFNumberRef v48 = CFNumberCreate(0LL, kCFNumberIntType, &valuePtr);
          CFDictionarySetValue((CFMutableDictionaryRef)qword_100066E40, @"KioskModeResidency0", v48);
          CFDictionarySetValue((CFMutableDictionaryRef)qword_100066E40, @"KioskModeResidency1", v48);
          CFDictionarySetValue((CFMutableDictionaryRef)qword_100066E40, @"KioskModeResidency2", v48);
          CFDictionarySetValue((CFMutableDictionaryRef)qword_100066E40, @"KioskModeResidency3", v48);
          CFDictionarySetValue((CFMutableDictionaryRef)qword_100066E40, @"KioskModeHighSocResidency0", v48);
          CFDictionarySetValue((CFMutableDictionaryRef)qword_100066E40, @"KioskModeHighSocResidency1", v48);
          CFDictionarySetValue((CFMutableDictionaryRef)qword_100066E40, @"KioskModeHighSocResidency2", v48);
          CFDictionarySetValue((CFMutableDictionaryRef)qword_100066E40, @"KioskModeHighSocResidency3", v48);
          CFDictionarySetValue((CFMutableDictionaryRef)qword_100066E40, @"KioskModeEntries", v48);
          CFDictionarySetValue((CFMutableDictionaryRef)qword_100066E40, @"KioskModeExits", v48);
          CFRelease(v48);
          CFNumberRef v49 = CFNumberCreate(kCFAllocatorDefault, kCFNumberDoubleType, &Current);
          if (v49)
          {
            CFNumberRef v50 = v49;
            CFDictionarySetValue((CFMutableDictionaryRef)qword_100066E40, @"lastUpdateTs", v49);
            CFRelease(v50);
          }
        }
      }

      int v51 = (os_log_s *)qword_1000678E0;
      if (os_log_type_enabled((os_log_t)qword_1000678E0, OS_LOG_TYPE_DEBUG)) {
        sub_10003EE1C((int *)&v102, v51);
      }
      unsigned int v52 = v102;
      if (dword_100066808 <= 1 && v102 < 2) {
        goto LABEL_142;
      }
      if (dword_100066808 <= 1 && v102 >= 2)
      {
        qword_100066E48 = *(void *)&Current;
        LODWORD(valuePtr) = 0;
        if (CFDictionaryGetValueIfPresent( (CFDictionaryRef)qword_100066E40,  @"KioskModeEntries",  (const void **)number))
        {
          CFNumberRef v53 = number[0];
          CFTypeID v54 = CFNumberGetTypeID();
          if (v53)
          {
            if (CFGetTypeID(v53) == v54) {
              CFNumberGetValue(number[0], kCFNumberIntType, &valuePtr);
            }
          }
        }

        if ((_DWORD)valuePtr != -1) {
          LODWORD(valuePtr) = (_DWORD)valuePtr + 1;
        }
        CFNumberRef v55 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
        if (!v55) {
          goto LABEL_142;
        }
        CFNumberRef v56 = v55;
        CFDictionarySetValue((CFMutableDictionaryRef)qword_100066E40, @"KioskModeEntries", v55);
        CFNumberRef v57 = v56;
LABEL_93:
        CFRelease(v57);
LABEL_142:
        if (v102 != dword_100066808)
        {
          CFNumberRef v83 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &v102);
          if (v83)
          {
            CFNumberRef v84 = v83;
            CFDictionarySetValue((CFMutableDictionaryRef)qword_100066E40, @"KioskModeMode", v83);
            CFRelease(v84);
          }
        }

        qword_100066E48 = *(void *)&Current;
        CFNumberRef v85 = CFNumberCreate(kCFAllocatorDefault, kCFNumberDoubleType, &qword_100066E48);
        if (v85)
        {
          CFNumberRef v86 = v85;
          CFDictionarySetValue((CFMutableDictionaryRef)qword_100066E40, @"lastUpdateTs", v85);
          CFRelease(v86);
        }

        sub_100005DC0((const __CFDictionary *)qword_100066E40, @"com.apple.batterydata.kioskmode");
        v87 = (const __CFDictionary *)qword_100066E40;
        *(_OWORD *)number = 0u;
        __int128 v106 = 0u;
        if (CFDictionaryGetValueIfPresent( (CFDictionaryRef)qword_100066E40,  @"KioskModeHighSocResidency0",  (const void **)&valuePtr))
        {
          v88 = valuePtr;
          CFTypeID v89 = CFNumberGetTypeID();
          if (v88)
          {
            if (CFGetTypeID(v88) == v89) {
              CFNumberGetValue(valuePtr, kCFNumberDoubleType, number);
            }
          }
        }

        if (CFDictionaryGetValueIfPresent(v87, @"KioskModeHighSocResidency1", (const void **)&valuePtr))
        {
          v90 = valuePtr;
          CFTypeID v91 = CFNumberGetTypeID();
          if (v90)
          {
            if (CFGetTypeID(v90) == v91) {
              CFNumberGetValue(valuePtr, kCFNumberDoubleType, &number[1]);
            }
          }
        }

        if (CFDictionaryGetValueIfPresent(v87, @"KioskModeHighSocResidency2", (const void **)&valuePtr))
        {
          v92 = valuePtr;
          CFTypeID v93 = CFNumberGetTypeID();
          if (v92)
          {
            if (CFGetTypeID(v92) == v93) {
              CFNumberGetValue(valuePtr, kCFNumberDoubleType, &v106);
            }
          }
        }

        if (CFDictionaryGetValueIfPresent(v87, @"KioskModeHighSocResidency3", (const void **)&valuePtr))
        {
          v94 = valuePtr;
          CFTypeID v95 = CFNumberGetTypeID();
          if (v94)
          {
            if (CFGetTypeID(v94) == v95) {
              CFNumberGetValue(valuePtr, kCFNumberDoubleType, (char *)&v106 + 8);
            }
          }
        }

        for (uint64_t j = 0LL; j != 4; ++j)
        {
          double v97 = *(double *)&number[j] / 3600.0;
          if (v97 >= 65535.0) {
            double v97 = 65535.0;
          }
          *((_WORD *)&number[-1] + j) = (int)v97;
        }

        if (sub_100039CB0(1128811336, &valuePtr, 8u)
          && os_log_type_enabled((os_log_t)qword_1000678E0, OS_LOG_TYPE_ERROR))
        {
          sub_10003EDF0();
        }

        dword_100066808 = v102;
        goto LABEL_14;
      }

      if (dword_100066808 >= 2 && v102 <= 1)
      {
        LODWORD(valuePtr) = 0;
        if (CFDictionaryGetValueIfPresent( (CFDictionaryRef)qword_100066E40,  @"KioskModeExits",  (const void **)number))
        {
          CFNumberRef v58 = number[0];
          CFTypeID v59 = CFNumberGetTypeID();
          if (v58)
          {
            if (CFGetTypeID(v58) == v59) {
              CFNumberGetValue(number[0], kCFNumberIntType, &valuePtr);
            }
          }
        }

        if ((_DWORD)valuePtr != -1) {
          LODWORD(valuePtr) = (_DWORD)valuePtr + 1;
        }
        CFNumberRef v60 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
        if (v60)
        {
          CFNumberRef v61 = v60;
          CFDictionarySetValue((CFMutableDictionaryRef)qword_100066E40, @"KioskModeExits", v60);
          CFRelease(v61);
        }

        unsigned int v52 = v102;
      }

      double v62 = *(double *)&qword_100066E48;
      double v63 = Current;
      unsigned int v101 = 2000;
      if (CFDictionaryGetValueIfPresent(v26, @"Temperature", (const void **)number))
      {
        CFNumberRef v64 = number[0];
        CFTypeID v65 = CFNumberGetTypeID();
        if (v64)
        {
          if (CFGetTypeID(v64) == v65) {
            CFNumberGetValue(number[0], kCFNumberIntType, &v101);
          }
        }
      }

      int v99 = 0;
      int v100 = 100;
      if (CFDictionaryGetValueIfPresent(v26, @"AppleRawMaxCapacity", (const void **)number))
      {
        CFNumberRef v66 = number[0];
        CFTypeID v67 = CFNumberGetTypeID();
        if (v66)
        {
          if (CFGetTypeID(v66) == v67) {
            CFNumberGetValue(number[0], kCFNumberIntType, &v100);
          }
        }
      }

      if (CFDictionaryGetValueIfPresent(v26, @"AppleRawCurrentCapacity", (const void **)number))
      {
        CFNumberRef v68 = number[0];
        CFTypeID v69 = CFNumberGetTypeID();
        if (v68)
        {
          if (CFGetTypeID(v68) == v69) {
            CFNumberGetValue(number[0], kCFNumberIntType, &v99);
          }
        }
      }

      if ((int)v101 >= 2500)
      {
        if (v101 >= 0xDAC)
        {
          if (v101 >= 0xFA0) {
            v72 = @"KioskModeHighSocResidency3";
          }
          else {
            v72 = @"KioskModeHighSocResidency2";
          }
          key = v72;
          if (v101 >= 0xFA0) {
            v70 = @"KioskModeResidency3";
          }
          else {
            v70 = @"KioskModeResidency2";
          }
          goto LABEL_130;
        }

        v70 = @"KioskModeResidency1";
        int v71 = @"KioskModeHighSocResidency1";
      }

      else
      {
        v70 = @"KioskModeResidency0";
        int v71 = @"KioskModeHighSocResidency0";
      }

      key = v71;
LABEL_130:
      int v73 = 100 * v99;
      int v74 = v100;
      double v75 = v63 - v62;
      number[0] = 0LL;
      if (CFDictionaryGetValueIfPresent((CFDictionaryRef)qword_100066E40, v70, (const void **)&valuePtr))
      {
        v76 = valuePtr;
        CFTypeID v77 = CFNumberGetTypeID();
        if (v76)
        {
          if (CFGetTypeID(v76) == v77) {
            CFNumberGetValue(valuePtr, kCFNumberDoubleType, number);
          }
        }
      }

      int v78 = v73 / v74;
      *(double *)number = v75 + *(double *)number;
      CFNumberRef v79 = CFNumberCreate(kCFAllocatorDefault, kCFNumberDoubleType, number);
      if (v79)
      {
        CFNumberRef v80 = v79;
        CFDictionarySetValue((CFMutableDictionaryRef)qword_100066E40, v70, v79);
        CFRelease(v80);
      }

      if (v78 < 95) {
        goto LABEL_142;
      }
      number[0] = 0LL;
      if (CFDictionaryGetValueIfPresent((CFDictionaryRef)qword_100066E40, key, (const void **)&valuePtr)
        && sub_100005798(valuePtr))
      {
        CFNumberGetValue(valuePtr, kCFNumberDoubleType, number);
      }

      *(double *)number = v75 + *(double *)number;
      CFNumberRef v81 = CFNumberCreate(kCFAllocatorDefault, kCFNumberDoubleType, number);
      if (!v81) {
        goto LABEL_142;
      }
      CFNumberRef v82 = v81;
      CFDictionarySetValue((CFMutableDictionaryRef)qword_100066E40, key, v81);
      CFNumberRef v57 = v82;
      goto LABEL_93;
    }

    if (os_log_type_enabled((os_log_t)qword_1000678E0, OS_LOG_TYPE_ERROR)) {
      sub_10003EDC4();
    }
  }

LABEL_14:
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

  return p_super;
}

uint64_t sub_100007B0C(const __CFDictionary *a1)
{
  int valuePtr = 0;
  if (CFDictionaryGetValue(a1, @"ExternalConnected") == kCFBooleanFalse)
  {
    uint64_t v5 = 2LL;
    if (os_log_type_enabled((os_log_t)qword_1000678E0, OS_LOG_TYPE_DEBUG)) {
      sub_10003EF34();
    }
  }

  else
  {
    Value = (const __CFDictionary *)CFDictionaryGetValue(a1, @"AdapterDetails");
    if (Value)
    {
      uint64_t v3 = (const __CFNumber *)CFDictionaryGetValue(Value, @"FamilyCode");
      CFTypeID TypeID = CFNumberGetTypeID();
      if (v3 && CFGetTypeID(v3) == TypeID)
      {
        CFNumberGetValue(v3, kCFNumberIntType, &valuePtr);
        return (valuePtr + 536723453) < 2;
      }

      else
      {
        if (os_log_type_enabled((os_log_t)qword_1000678E0, OS_LOG_TYPE_ERROR)) {
          sub_10003EF8C();
        }
        return 0LL;
      }
    }

    else
    {
      if (os_log_type_enabled((os_log_t)qword_1000678E0, OS_LOG_TYPE_ERROR)) {
        sub_10003EF60();
      }
      return 2LL;
    }
  }

  return v5;
}

void sub_100007C4C(xpc_object_t object, void *a2)
{
  if (object && a2)
  {
    if (qword_100066E30)
    {
      xpc_retain(object);
      xpc_retain(a2);
      if (os_log_type_enabled((os_log_t)qword_1000678E0, OS_LOG_TYPE_DEBUG)) {
        sub_10003EFE4();
      }
      v4[0] = _NSConcreteStackBlock;
      v4[1] = 0x40000000LL;
      v4[2] = sub_100007E28;
      v4[3] = &unk_1000591B0;
      v4[4] = a2;
      v4[5] = object;
      dispatch_async((dispatch_queue_t)qword_100066E30, v4);
    }

    else
    {
      if (os_log_type_enabled((os_log_t)qword_1000678E0, OS_LOG_TYPE_DEBUG)) {
        sub_10003EFB8();
      }
      sub_100007D78((_xpc_connection_s *)object, a2, "batteryHeatMapData", 0LL);
    }
  }

  else if (os_log_type_enabled((os_log_t)qword_1000678E0, OS_LOG_TYPE_ERROR))
  {
    sub_10003F010();
  }

void sub_100007D78(_xpc_connection_s *a1, xpc_object_t original, const char *a3, void *a4)
{
  xpc_object_t reply = xpc_dictionary_create_reply(original);
  if (reply)
  {
    uint64_t v8 = reply;
    if (a4) {
      a4 = (void *)_CFXPCCreateXPCObjectFromCFObject(a4);
    }
    xpc_dictionary_set_value(v8, a3, a4);
    xpc_connection_send_message(a1, v8);
    if (a4) {
      xpc_release(a4);
    }
    xpc_release(v8);
  }

  else if (os_log_type_enabled((os_log_t)qword_1000678E0, OS_LOG_TYPE_ERROR))
  {
    sub_10003F070();
  }

void sub_100007E28(uint64_t a1)
{
  uint64_t uint64 = xpc_dictionary_get_uint64(*(xpc_object_t *)(a1 + 32), "batteryHeatMapData");
  uint64_t v3 = uint64;
  else {
    int v4 = sub_100007EDC(uint64);
  }
  sub_100007D78(*(_xpc_connection_s **)(a1 + 40), *(xpc_object_t *)(a1 + 32), "batteryHeatMapData", v4);
  uint64_t v5 = (os_log_s *)qword_1000678E0;
  if (os_log_type_enabled((os_log_t)qword_1000678E0, OS_LOG_TYPE_DEBUG))
  {
    sub_10003F09C(v3, v5, v6, v7, v8, v9, v10, v11);
    if (!v4) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }

  if (v4) {
LABEL_6:
  }
    CFRelease(v4);
LABEL_7:
  xpc_release(*(xpc_object_t *)(a1 + 40));
  xpc_release(*(xpc_object_t *)(a1 + 32));
}

CFDictionaryRef sub_100007EDC(unsigned int a1)
{
  uint64_t v1 = sub_100008368(a1);
  BOOL result = CFPreferencesCopyMultiple(0LL, v1, kCFPreferencesAnyUser, kCFPreferencesCurrentHost);
  if (result)
  {
    uint64_t v3 = result;
    CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(0LL, 0LL, result);
    CFRelease(v3);
    return MutableCopy;
  }

  return result;
}

void sub_100007F44(xpc_object_t object, void *a2)
{
  if (object && a2)
  {
    if (qword_100066E30)
    {
      xpc_retain(object);
      xpc_retain(a2);
      if (os_log_type_enabled((os_log_t)qword_1000678E0, OS_LOG_TYPE_DEBUG)) {
        sub_10003F100();
      }
      v4[0] = _NSConcreteStackBlock;
      v4[1] = 0x40000000LL;
      v4[2] = sub_100008070;
      v4[3] = &unk_1000591D0;
      v4[4] = object;
      v4[5] = a2;
      dispatch_async((dispatch_queue_t)qword_100066E30, v4);
    }

    else
    {
      if (os_log_type_enabled((os_log_t)qword_1000678E0, OS_LOG_TYPE_DEBUG)) {
        sub_10003EFB8();
      }
      sub_100007D78((_xpc_connection_s *)object, a2, "batteryCycleCountData", 0LL);
    }
  }

  else if (os_log_type_enabled((os_log_t)qword_1000678E0, OS_LOG_TYPE_ERROR))
  {
    sub_10003F010();
  }

void sub_100008070(uint64_t a1)
{
  int v2 = (void *)_CFPreferencesCopyMultipleWithContainer( 0LL,  @"com.apple.batterydata.cyclecount",  kCFPreferencesCurrentUser,  kCFPreferencesCurrentHost,  @"/var/MobileSoftwareUpdate/Hardware/Battery");
  sub_100007D78(*(_xpc_connection_s **)(a1 + 32), *(xpc_object_t *)(a1 + 40), "batteryCycleCountData", v2);
  if (os_log_type_enabled((os_log_t)qword_1000678E0, OS_LOG_TYPE_DEBUG))
  {
    sub_10003F12C();
    if (!v2) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  if (v2) {
LABEL_3:
  }
    CFRelease(v2);
LABEL_4:
  xpc_release(*(xpc_object_t *)(a1 + 40));
  xpc_release(*(xpc_object_t *)(a1 + 32));
}

void sub_100008124(xpc_connection_t connection, void *a2)
{
  if (connection && a2)
  {
    if (qword_100066E30)
    {
      if (sub_100038E28(connection, @"com.apple.private.iokit.batterydata", 0))
      {
        xpc_retain(connection);
        xpc_retain(a2);
        if (os_log_type_enabled((os_log_t)qword_1000678E0, OS_LOG_TYPE_DEBUG)) {
          sub_10003F158();
        }
        v4[0] = _NSConcreteStackBlock;
        v4[1] = 0x40000000LL;
        v4[2] = sub_100008290;
        v4[3] = &unk_1000591F0;
        v4[4] = connection;
        v4[5] = a2;
        dispatch_async((dispatch_queue_t)qword_100066E30, v4);
        return;
      }

      if (os_log_type_enabled((os_log_t)qword_1000678E0, OS_LOG_TYPE_DEBUG)) {
        sub_10003F184();
      }
    }

    else if (os_log_type_enabled((os_log_t)qword_1000678E0, OS_LOG_TYPE_DEBUG))
    {
      sub_10003EFB8();
    }

    sub_100007D78(connection, a2, "batteryKioskModeData", 0LL);
    return;
  }

  if (os_log_type_enabled((os_log_t)qword_1000678E0, OS_LOG_TYPE_ERROR)) {
    sub_10003F010();
  }
}

void sub_100008290(uint64_t a1)
{
  int v2 = (void *)_CFPreferencesCopyMultipleWithContainer( 0LL,  @"com.apple.batterydata.kioskmode",  kCFPreferencesCurrentUser,  kCFPreferencesCurrentHost,  @"/var/MobileSoftwareUpdate/Hardware/Battery");
  sub_100007D78(*(_xpc_connection_s **)(a1 + 32), *(xpc_object_t *)(a1 + 40), "batteryKioskModeData", v2);
  if (os_log_type_enabled((os_log_t)qword_1000678E0, OS_LOG_TYPE_DEBUG))
  {
    sub_10003F1B0();
    if (!v2) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  if (v2) {
LABEL_3:
  }
    CFRelease(v2);
LABEL_4:
  xpc_release(*(xpc_object_t *)(a1 + 40));
  xpc_release(*(xpc_object_t *)(a1 + 32));
}

uint64_t sub_100008344(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _CFPreferencesSetValueWithContainer( a1,  a2,  a3,  kCFPreferencesCurrentUser,  kCFPreferencesCurrentHost,  @"/var/MobileSoftwareUpdate/Hardware/Battery");
}

CFStringRef sub_100008368(unsigned int a1)
{
  if (a1 >= 3)
  {
    int v2 = (os_log_s *)qword_1000678E0;
    if (os_log_type_enabled((os_log_t)qword_1000678E0, OS_LOG_TYPE_ERROR)) {
      sub_10003F1DC(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }

  uint64_t v10 = @"com.apple.batterydata.discharging";
  if (a1 == 1) {
    uint64_t v10 = @"com.apple.batterydata.wireless";
  }
  if (a1) {
    return v10;
  }
  else {
    return @"com.apple.batterydata.wired";
  }
}

void sub_1000083DC( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

void sub_10000840C(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

void sub_100008420( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_100008430( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

id sub_1000087FC()
{
  size_t __size = 0LL;
  if (sysctlbyname("kern.bootsessionuuid", 0LL, &__size, 0LL, 0LL))
  {
    if (os_log_type_enabled((os_log_t)qword_100067738, OS_LOG_TYPE_ERROR)) {
      goto LABEL_6;
    }
    goto LABEL_7;
  }

  uint64_t v0 = malloc(__size);
  if (sysctlbyname("kern.bootsessionuuid", v0, &__size, 0LL, 0LL))
  {
    if (os_log_type_enabled((os_log_t)qword_100067738, OS_LOG_TYPE_ERROR)) {
LABEL_6:
    }
      sub_10003F2AC();
LABEL_7:
    uint64_t v1 = 0LL;
    return v1;
  }

  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v0));
  free(v0);
  uint64_t v3 = (os_log_s *)qword_100067738;
  if (os_log_type_enabled((os_log_t)qword_100067738, OS_LOG_TYPE_DEBUG)) {
    sub_10003F248((uint64_t)v1, v3, v4, v5, v6, v7, v8, v9);
  }
  return v1;
}

void sub_100008914(char a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100008970;
  block[3] = &unk_100059210;
  char v2 = a1;
  dispatch_async((dispatch_queue_t)qword_100066E50, block);
}

void sub_100008970(uint64_t a1)
{
  char v2 = (os_log_s *)qword_100067738;
  if (os_log_type_enabled((os_log_t)qword_100067738, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(unsigned __int8 *)(a1 + 32);
    v4[0] = 67109120;
    v4[1] = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "chargeControl charge to full requested:%d\n",  (uint8_t *)v4,  8u);
  }

  byte_100066E58 = *(_BYTE *)(a1 + 32);
  sub_100008A28(0LL, 0LL);
}

void sub_100008A28(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  dispatch_assert_queue_V2((dispatch_queue_t)qword_100066E50);
  if (![(id)qword_100066E60 count] || !objc_msgSend((id)qword_100066E60, "count")) {
    goto LABEL_15;
  }
  unsigned __int8 v5 = 0;
  unsigned __int8 v6 = 0;
  unint64_t v7 = 0LL;
  unint64_t v8 = 100LL;
  do
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100066E60 objectAtIndex:v7]);
    id v10 = [v9 socLimit];
    if ((v5 & 1) != 0)
    {
      unsigned __int8 v5 = 1;
      if ((v6 & 1) == 0) {
        goto LABEL_9;
      }
    }

    else
    {
      unsigned __int8 v5 = [v9 drain];
      if ((v6 & 1) == 0)
      {
LABEL_9:
        unsigned __int8 v6 = [v9 noChargeToFull];
        goto LABEL_12;
      }
    }

    unsigned __int8 v6 = 1;
LABEL_12:

    ++v7;
  }

  while (v7 < (unint64_t)[(id)qword_100066E60 count]);
  if (v8 >= 0x64)
  {
LABEL_15:
    uint64_t v11 = 0LL;
    goto LABEL_16;
  }

  uint64_t v11 = -[ChargeCtrlPolicy initWithSocLimit:andDrain:andNoChargeToFull:andOwner:]( objc_alloc(&OBJC_CLASS___ChargeCtrlPolicy),  "initWithSocLimit:andDrain:andNoChargeToFull:andOwner:",  v8,  v5 & 1,  v6 & 1,  0LL);
LABEL_16:
  int v12 = (dispatch_queue_s *)qword_100066E50;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100009480;
  block[3] = &unk_1000592E0;
  int v17 = v11;
  id v18 = v3;
  id v19 = v4;
  id v13 = v4;
  id v14 = v3;
  CFNumberRef v15 = v11;
  dispatch_barrier_async(v12, block);
}

void sub_100008BE0(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  unsigned __int8 v5 = v4;
  if (v3)
  {
    if (v4)
    {
      unsigned __int8 v6 = (dispatch_queue_s *)qword_100066E50;
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472LL;
      v7[2] = sub_100008CD8;
      v7[3] = &unk_100059238;
      id v8 = v3;
      id v9 = v5;
      dispatch_async(v6, v7);
    }

    else if (os_log_type_enabled((os_log_t)qword_100067738, OS_LOG_TYPE_ERROR))
    {
      sub_10003F338();
    }
  }

  else if (os_log_type_enabled((os_log_t)qword_100067738, OS_LOG_TYPE_ERROR))
  {
    sub_10003F30C();
  }
}

void sub_100008CD8(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 40);
  char v2 = (_xpc_connection_s *)*(id *)(a1 + 32);
  id v3 = v1;
  dispatch_assert_queue_V2((dispatch_queue_t)qword_100066E50);
  if (qword_100066E90 != -1) {
    dispatch_once(&qword_100066E90, &stru_100059348);
  }
  xpc_object_t reply = xpc_dictionary_create_reply(v3);
  if (reply)
  {
    int v5 = -536870206;
    if (sub_100038E28(v2, @"com.apple.private.iokit.soc-limit", 0))
    {
      if (byte_100066E88)
      {
        if (byte_100066E68 == 1)
        {
          xpc_object_t dictionary = xpc_dictionary_get_dictionary(v3, "chargeSocLimit");
          uint64_t v7 = objc_claimAutoreleasedReturnValue(dictionary);
          if (v7)
          {
            id v8 = (void *)v7;
            uint64_t v9 = _CFXPCCreateCFObjectFromXPCObject(v7);
            if (v9)
            {
              id v10 = (id)v9;
              pid_t pid = xpc_connection_get_pid(v2);
              int v12 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"chargeSocLimitAction"]);
              unsigned int v13 = [v12 unsignedIntValue];

              id v14 = (os_log_s *)qword_100067738;
              if (os_log_type_enabled((os_log_t)qword_100067738, OS_LOG_TYPE_DEFAULT))
              {
                LODWORD(v19) = 67109378;
                HIDWORD(v19) = pid;
                LOWORD(v20) = 2112;
                *(void *)((char *)&v20 + 2) = v10;
                _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "received SOC limit from %d: %@\n",  (uint8_t *)&v19,  0x12u);
              }

              switch(v13)
              {
                case 1u:
                  CFNumberRef v15 = (dispatch_queue_s *)qword_100066E50;
                  id v19 = _NSConcreteStackBlock;
                  *(void *)&__int128 v20 = 3221225472LL;
                  *((void *)&v20 + 1) = sub_100009A5C;
                  uint64_t v21 = &unk_100059328;
                  LODWORD(v24) = pid;
                  uint64_t v22 = v2;
                  CFTypeID v23 = reply;
                  dispatch_barrier_async(v15, &v19);
                  break;
                case 2u:
                  CFTypeID v16 = (dispatch_queue_s *)qword_100066E50;
                  id v19 = _NSConcreteStackBlock;
                  *(void *)&__int128 v20 = 3221225472LL;
                  int v17 = sub_100009B6C;
                  goto LABEL_29;
                case 3u:
                  CFTypeID v16 = (dispatch_queue_s *)qword_100066E50;
                  id v19 = _NSConcreteStackBlock;
                  *(void *)&__int128 v20 = 3221225472LL;
                  int v17 = sub_100009CE8;
LABEL_29:
                  *((void *)&v20 + 1) = v17;
                  uint64_t v21 = &unk_100059370;
                  pid_t v25 = pid;
                  uint64_t v22 = (_xpc_connection_s *)v10;
                  CFTypeID v23 = v2;
                  id v24 = reply;
                  id v10 = v10;
                  dispatch_async(v16, &v19);

                  break;
                case 4u:
                  id v18 = (dispatch_queue_s *)qword_100066E50;
                  id v19 = _NSConcreteStackBlock;
                  *(void *)&__int128 v20 = 3221225472LL;
                  *((void *)&v20 + 1) = sub_100009EFC;
                  uint64_t v21 = &unk_100059238;
                  uint64_t v22 = v2;
                  CFTypeID v23 = reply;
                  dispatch_async(v18, &v19);
                  break;
                default:
                  goto LABEL_24;
              }

              goto LABEL_25;
            }

            if (os_log_type_enabled((os_log_t)qword_100067738, OS_LOG_TYPE_ERROR)) {
              sub_10003F3BC();
            }
          }

          else
          {
            if (os_log_type_enabled((os_log_t)qword_100067738, OS_LOG_TYPE_ERROR)) {
              sub_10003F390();
            }
            id v8 = 0LL;
          }

          id v10 = 0LL;
        }

        else
        {
          id v8 = 0LL;
          id v10 = 0LL;
          int v5 = -536870187;
        }
      }

      else
      {
        id v8 = 0LL;
        id v10 = 0LL;
        int v5 = -536870201;
      }
    }

    else
    {
      id v8 = 0LL;
      id v10 = 0LL;
      int v5 = -536870207;
    }

LABEL_24:
    sub_1000097F0(v2, reply, v5);
LABEL_25:

    goto LABEL_26;
  }

  if (os_log_type_enabled((os_log_t)qword_100067738, OS_LOG_TYPE_ERROR)) {
    sub_10003F364();
  }
LABEL_26:
}

void sub_1000090CC()
{
  os_log_t v0 = os_log_create("com.apple.powerd", "charging");
  uint64_t v1 = (void *)qword_100067738;
  qword_100067738 = (uint64_t)v0;

  dispatch_queue_t v2 = dispatch_queue_create("com.apple.private.powerd.chargeCtrlQ", 0LL);
  id v3 = (void *)qword_100066E50;
  qword_100066E50 = (uint64_t)v2;

  dispatch_async((dispatch_queue_t)qword_100066E50, &stru_100059258);
}

void sub_100009134(id a1)
{
  CFDictionaryRef v1 = CFPreferencesCopyMultiple( 0LL,  @"com.apple.powerd.charging",  kCFPreferencesAnyUser,  kCFPreferencesCurrentHost);
  if (v1)
  {
    id v2 = sub_1000087FC();
    id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKeyedSubscript:](v1, "objectForKeyedSubscript:", @"bootSessionUUID"));
    id v5 = [v3 caseInsensitiveCompare:v4];

    if (!v5)
    {
      unsigned __int8 v6 = (os_log_s *)qword_100067738;
      if (os_log_type_enabled((os_log_t)qword_100067738, OS_LOG_TYPE_DEBUG)) {
        sub_10003F3E8((uint64_t)v1, v6, v7, v8, v9, v10, v11, v12);
      }
      unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKeyedSubscript:](v1, "objectForKeyedSubscript:", @"policies"));
      uint64_t v14 = objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchiveObjectWithData:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchiveObjectWithData:",  v13));
      CFNumberRef v15 = (void *)qword_100066E60;
      qword_100066E60 = v14;

      sub_100008A28(0LL, 0LL);
      if ([(id)qword_100066E60 count])
      {
        unint64_t v16 = 0LL;
        do
        {
          int v17 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100066E60 objectAtIndex:v16]);

          ++v16;
        }

        while (v16 < (unint64_t)[(id)qword_100066E60 count]);
      }
    }
  }

  byte_100066E68 = 1;
}

void sub_1000092C0(id a1, int a2)
{
}

void sub_1000092F0(id a1)
{
  CFDictionaryRef v1 = (char *)[(id)qword_100066E60 count];
  if (v1)
  {
    id v2 = v1;
    char v3 = 0;
LABEL_3:
    --v2;
    do
    {
      id v4 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100066E60 objectAtIndex:v2]);
      if ([v4 terminated])
      {
        [(id)qword_100066E60 removeObject:v4];

        char v3 = 1;
        if (v2) {
          goto LABEL_3;
        }
        goto LABEL_10;
      }

      --v2;
    }

    while (v2 != (char *)-1LL);
    if ((v3 & 1) == 0) {
      return;
    }
LABEL_10:
    dispatch_async((dispatch_queue_t)qword_100066E50, &stru_1000593E0);
  }

void sub_1000093B0(int a1)
{
  id v2 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_proc,  a1,  0x80000000uLL,  (dispatch_queue_t)qword_100066E50);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_10000A604;
  handler[3] = &unk_100059400;
  int v7 = a1;
  dispatch_source_set_cancel_handler(v2, handler);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  _DWORD v4[2] = sub_10000A770;
  v4[3] = &unk_100058F38;
  id v5 = v2;
  char v3 = v2;
  dispatch_source_set_event_handler(v3, v4);
  dispatch_activate(v3);
}

void sub_100009480(uint64_t a1)
{
  CFDictionaryRef v1 = *(void **)(a1 + 40);
  id v2 = *(void **)(a1 + 48);
  id v3 = *(id *)(a1 + 32);
  id v4 = v1;
  id v5 = v2;
  dispatch_assert_queue_barrier((dispatch_queue_t)qword_100066E50);
  unsigned __int8 v6 = (void *)qword_100066E70;
  qword_100066E70 = (uint64_t)v3;
  id v7 = v3;

  uint64_t v8 = (dispatch_queue_s *)qword_100066E50;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100009560;
  v11[3] = &unk_100059238;
  id v12 = v4;
  id v13 = v5;
  id v9 = v4;
  id v10 = v5;
  dispatch_async(v8, v11);
}

void sub_100009560(uint64_t a1)
{
  CFDictionaryRef v1 = *(void **)(a1 + 40);
  id v2 = *(id *)(a1 + 32);
  id v3 = v1;
  dispatch_assert_queue_V2((dispatch_queue_t)qword_100066E50);
  __int16 v17 = 0;
  id v4 = (void *)qword_100066E70;
  if (!byte_100066E58)
  {
    if (qword_100066E70) {
      goto LABEL_7;
    }
    unsigned int v7 = 0;
LABEL_14:
    uint64_t v15 = qword_100067738;
    if (!os_log_type_enabled((os_log_t)qword_100067738, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_17;
    }
    *(_WORD *)buf = 0;
    uint64_t v8 = "SOC limit disabled\n";
    id v9 = (os_log_s *)v15;
    uint32_t v10 = 2;
    goto LABEL_16;
  }

  unsigned int v5 = [(id)qword_100066E70 noChargeToFull];
  id v4 = (void *)qword_100066E70;
  if (!qword_100066E70)
  {
    unsigned int v7 = v5 ^ 1;
    goto LABEL_14;
  }

  if ((v5 & 1) == 0)
  {
    uint64_t v6 = qword_100067738;
    unsigned int v7 = 1;
    if (!os_log_type_enabled((os_log_t)qword_100067738, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_17;
    }
    *(_DWORD *)buf = 67109120;
    LODWORD(v19) = 1;
    uint64_t v8 = "SOC limit policy suspend due to mitigation active:%d\n";
    id v9 = (os_log_s *)v6;
    uint32_t v10 = 8;
LABEL_16:
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
    goto LABEL_17;
  }

LABEL_7:
  unsigned __int8 v11 = [v4 socLimit];
  unsigned __int8 v12 = [(id)qword_100066E70 drain];
  LOBYTE(v17) = v11;
  else {
    char v13 = 0;
  }
  HIBYTE(v17) = v13 | v12;
  uint64_t v14 = (os_log_s *)qword_100067738;
  unsigned int v7 = 0;
  if (os_log_type_enabled((os_log_t)qword_100067738, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v19 = qword_100066E70;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "SOC limit policy:%@\n", buf, 0xCu);
    unsigned int v7 = 0;
  }

LABEL_17:
  if (byte_100066E78 != v7)
  {
    byte_100066E78 = v7;
    if (qword_100066E80 != -1) {
      dispatch_once(&qword_100066E80, &stru_100059300);
    }
    notify_set_state(dword_100066870, v7);
    notify_post("com.apple.system.powersources.gaugingmitigation");
  }

  int v16 = sub_100039CB0(1128811603, &v17, 2u);
  if (v16 && os_log_type_enabled((os_log_t)qword_100067738, OS_LOG_TYPE_ERROR)) {
    sub_10003F44C();
  }
  sub_1000097F0(v2, v3, v16);
}

void sub_1000097F0(void *a1, void *a2, int a3)
{
  id v5 = a1;
  id v6 = a2;
  if (qword_100066E60)
  {
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:"));
    v16[0] = @"bootSessionUUID";
    id v8 = sub_1000087FC();
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v16[1] = @"policies";
    v17[0] = v9;
    v17[1] = v7;
    uint32_t v10 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v17,  v16,  2LL));

    CFPreferencesSetMultiple( v10,  0LL,  @"com.apple.powerd.charging",  kCFPreferencesAnyUser,  kCFPreferencesCurrentHost);
  }

  if (v5 && v6)
  {
    unsigned __int8 v11 = (dispatch_queue_s *)qword_100066E50;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1000099D4;
    v12[3] = &unk_100059328;
    id v13 = v6;
    int v15 = a3;
    id v14 = v5;
    dispatch_barrier_async(v11, v12);
  }
}

void sub_100009978(id a1)
{
  if (notify_register_check("com.apple.system.powersources.gaugingmitigation", &dword_100066870))
  {
    if (os_log_type_enabled((os_log_t)qword_100067738, OS_LOG_TYPE_ERROR)) {
      sub_10003F4AC();
    }
  }

void sub_1000099D4(uint64_t a1)
{
  xpc_dictionary_set_uint64(*(xpc_object_t *)(a1 + 32), "returnCode", *(int *)(a1 + 48));
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 32));
}

void sub_100009A08(id a1)
{
  __int16 v1 = 0;
  byte_100066E88 = sub_10003A3EC(1128811603, &v1) != -536870160;
}

void sub_100009A5C(uint64_t a1)
{
  uint64_t v1 = *(int *)(a1 + 48);
  id v2 = *(void **)(a1 + 32);
  id v3 = (dispatch_queue_s *)qword_100066E50;
  id v4 = *(id *)(a1 + 40);
  id v5 = v2;
  dispatch_assert_queue_barrier(v3);
  if (!qword_100066E60)
  {
    id v6 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", 1LL);
    unsigned int v7 = (void *)qword_100066E60;
    qword_100066E60 = (uint64_t)v6;
  }

  uint32_t v10 = -[ChargeCtrlPolicy initWithSocLimit:andDrain:andNoChargeToFull:andOwner:]( objc_alloc(&OBJC_CLASS___ChargeCtrlPolicy),  "initWithSocLimit:andDrain:andNoChargeToFull:andOwner:",  101LL,  0LL,  0LL,  v1);
  [(id)qword_100066E60 addObject:v10];
  sub_1000093B0(v1);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[ChargeCtrlPolicy token](v10, "token"));
  id v9 = objc_claimAutoreleasedReturnValue([v8 UUIDString]);
  xpc_dictionary_set_string(v4, "chargeSocLimitToken", (const char *)[v9 UTF8String]);

  sub_1000097F0(v5, v4, 0);
}

void sub_100009B6C(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 56);
  id v2 = *(void **)(a1 + 32);
  id v3 = *(void **)(a1 + 48);
  id v4 = *(id *)(a1 + 40);
  id v5 = v3;
  id v6 = (dispatch_queue_s *)qword_100066E50;
  id v7 = v2;
  dispatch_assert_queue_V2(v6);
  id v8 = objc_alloc(&OBJC_CLASS___NSUUID);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"chargeSocLimitToken"]);

  uint32_t v10 = -[NSUUID initWithUUIDString:](v8, "initWithUUIDString:", v9);
  if (v10)
  {
    id v11 = [(id)qword_100066E60 count];
    unsigned __int8 v12 = (dispatch_queue_s *)qword_100066E50;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10000A0C4;
    block[3] = &unk_100059398;
    id v17 = v11;
    id v14 = v10;
    int v18 = v1;
    id v15 = v4;
    id v16 = v5;
    dispatch_barrier_async(v12, block);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)qword_100067738, OS_LOG_TYPE_ERROR)) {
      sub_10003F50C();
    }
    sub_1000097F0(v4, v5, -536870206);
  }
}

void sub_100009CE8(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 56);
  id v2 = *(void **)(a1 + 40);
  id v3 = *(void **)(a1 + 48);
  id v4 = *(id *)(a1 + 32);
  id v5 = v2;
  id v6 = v3;
  dispatch_assert_queue_V2((dispatch_queue_t)qword_100066E50);
  id v7 = objc_alloc(&OBJC_CLASS___NSUUID);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"chargeSocLimitToken"]);
  id v9 = -[NSUUID initWithUUIDString:](v7, "initWithUUIDString:", v8);

  if (v9)
  {
    uint32_t v10 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"chargeSocLimitSoc"]);
    unsigned int v11 = [v10 unsignedIntValue];

    unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"chargeSocLimitDrain"]);
    unsigned __int8 v13 = [v12 BOOLValue];

    id v14 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"chargeSocLimitNoChargeToFull"]);
    unsigned __int8 v15 = [v14 BOOLValue];

    id v16 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"chargeSocLimitReason"]);
    id v17 = (dispatch_queue_s *)qword_100066E50;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_10000A214;
    v19[3] = &unk_1000593C0;
    __int128 v20 = v9;
    int v24 = v1;
    id v21 = v5;
    unsigned int v25 = v11;
    unsigned __int8 v26 = v13;
    unsigned __int8 v27 = v15;
    id v22 = v6;
    id v23 = v16;
    id v18 = v16;
    dispatch_barrier_async(v17, v19);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)qword_100067738, OS_LOG_TYPE_ERROR)) {
      sub_10003F50C();
    }
    sub_1000097F0(v5, v6, -536870206);
  }
}

void sub_100009EFC(uint64_t a1)
{
  int v1 = *(void **)(a1 + 40);
  id v2 = *(id *)(a1 + 32);
  id v3 = v1;
  dispatch_assert_queue_V2((dispatch_queue_t)qword_100066E50);
  id v4 = objc_alloc(&OBJC_CLASS___NSMutableArray);
  id v5 = -[NSMutableArray initWithCapacity:]( v4,  "initWithCapacity:",  (char *)[(id)qword_100066E60 count] + 1);
  if ([(id)qword_100066E60 count])
  {
    unint64_t v6 = 0LL;
    do
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100066E60 objectAtIndex:v6]);
      id v8 = sub_10000A3D4(v7);
      id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      -[NSMutableArray addObject:](v5, "addObject:", v9);

      ++v6;
    }

    while (v6 < (unint64_t)[(id)qword_100066E60 count]);
  }

  if (qword_100066E70)
  {
    uint32_t v10 = sub_10000A3D4((void *)qword_100066E70);
    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    -[NSMutableArray addObject:](v5, "addObject:", v11);
  }

  unsigned __int8 v12 = (os_log_s *)qword_100067738;
  if (os_log_type_enabled((os_log_t)qword_100067738, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412290;
    unsigned __int8 v15 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "sending current policies:%@\n",  (uint8_t *)&v14,  0xCu);
  }

  if (-[NSMutableArray count](v5, "count"))
  {
    unsigned __int8 v13 = (void *)_CFXPCCreateXPCObjectFromCFObject(v5);
    xpc_dictionary_set_value(v3, "chargeSocLimit", v13);
  }

  sub_1000097F0(v2, v3, 0);
}

void sub_10000A0C4(uint64_t a1)
{
  if (!*(void *)(a1 + 56)) {
    goto LABEL_12;
  }
  unint64_t v2 = 0LL;
  do
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100066E60 objectAtIndex:v2]);
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 token]);
    id v5 = [v4 compare:*(void *)(a1 + 32)];

    unint64_t v6 = *(void *)(a1 + 56);
    if (!v5) {
      break;
    }
    ++v2;
  }

  while (v2 < v6);
  if (v6 != v2)
  {
    [(id)qword_100066E60 removeObjectAtIndex:v2];
    id v7 = (dispatch_queue_s *)qword_100066E50;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10000A208;
    v8[3] = &unk_100059238;
    id v9 = *(id *)(a1 + 40);
    id v10 = *(id *)(a1 + 48);
    dispatch_async(v7, v8);
  }

  else
  {
LABEL_12:
    if (os_log_type_enabled((os_log_t)qword_100067738, OS_LOG_TYPE_ERROR)) {
      sub_10003F56C();
    }
    sub_1000097F0(*(void **)(a1 + 40), *(void **)(a1 + 48), -536870206);
  }

void sub_10000A208(uint64_t a1)
{
}

void sub_10000A214(uint64_t a1)
{
  if ([(id)qword_100066E60 count])
  {
    uint64_t v2 = 0LL;
    while (1)
    {
      id v3 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100066E60 objectAtIndex:v2]);
      id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 token]);
      id v5 = [v4 compare:*(void *)(a1 + 32)];

      if (!v5) {
        break;
      }
    }

    if (v3)
    {
      [v3 setSocLimit:*(unsigned int *)(a1 + 68)];
      [v3 setDrain:*(unsigned __int8 *)(a1 + 72)];
      [v3 setNoChargeToFull:*(unsigned __int8 *)(a1 + 73)];
      [v3 setReason:*(void *)(a1 + 56)];
      id v6 = [v3 owner];
      id v7 = (id)*(int *)(a1 + 64);
      if (v6 == v7)
      {
        if (![v3 terminated])
        {
LABEL_11:
          id v8 = (dispatch_queue_s *)qword_100066E50;
          v9[0] = _NSConcreteStackBlock;
          v9[1] = 3221225472LL;
          v9[2] = sub_10000A3C8;
          v9[3] = &unk_100059238;
          id v10 = *(id *)(a1 + 40);
          id v11 = *(id *)(a1 + 48);
          dispatch_async(v8, v9);

          return;
        }

        id v7 = (id)*(int *)(a1 + 64);
      }

      [v3 setOwner:v7];
      [v3 setTerminated:0];
      sub_1000093B0(*(_DWORD *)(a1 + 64));
      goto LABEL_11;
    }
  }

LABEL_12:
  if (os_log_type_enabled((os_log_t)qword_100067738, OS_LOG_TYPE_ERROR)) {
    sub_10003F56C();
  }
  sub_1000097F0(*(void **)(a1 + 40), *(void **)(a1 + 48), -536870206);
}
}

void sub_10000A3C8(uint64_t a1)
{
}

NSMutableDictionary *sub_10000A3D4(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    uint64_t v2 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  6LL);
    id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v1 owner]));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", v3, @"Owner");

    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( NSNumber,  "numberWithLongLong:",  [v1 socLimit]));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  v4,  @"chargeSocLimitSoc");

    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v1 drain]));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  v5,  @"chargeSocLimitDrain");

    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v1 noChargeToFull]));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  v6,  @"chargeSocLimitNoChargeToFull");

    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v1 terminated]));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", v7, @"Terminated");

    id v8 = (void *)objc_claimAutoreleasedReturnValue([v1 reason]);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  v8,  @"chargeSocLimitReason");

    id v9 = (os_log_s *)qword_100067738;
    if (os_log_type_enabled((os_log_t)qword_100067738, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412546;
      id v12 = v1;
      __int16 v13 = 2112;
      int v14 = v2;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "converted policy:%@ to dict:%@\n",  (uint8_t *)&v11,  0x16u);
    }
  }

  else
  {
    uint64_t v2 = 0LL;
  }

  return v2;
}

void sub_10000A5F8(id a1)
{
}

void sub_10000A604(uint64_t a1)
{
  uint64_t v2 = (os_log_s *)qword_100067738;
  if (os_log_type_enabled((os_log_t)qword_100067738, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(_DWORD *)(a1 + 32);
    *(_DWORD *)buf = 67109120;
    int v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Mark %u as terminated\n", buf, 8u);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000A6E8;
  block[3] = &unk_100059400;
  int v5 = *(_DWORD *)(a1 + 32);
  dispatch_barrier_async((dispatch_queue_t)qword_100066E50, block);
}

id sub_10000A6E8(uint64_t a1)
{
  id v1 = (id)*(int *)(a1 + 32);
  dispatch_assert_queue_barrier((dispatch_queue_t)qword_100066E50);
  id result = [(id)qword_100066E60 count];
  if (result)
  {
    for (unint64_t i = 0LL; i < (unint64_t)result; ++i)
    {
      id v4 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100066E60 objectAtIndex:i]);
      if ([v4 owner] == v1) {
        [v4 setTerminated:1];
      }

      id result = [(id)qword_100066E60 count];
    }
  }

  return result;
}

void sub_10000A770(uint64_t a1)
{
}

  ;
}

  ;
}

void sub_10000A79C( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_10000A7AC( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

BOOL sub_10000A7BC(mach_port_t *a1)
{
  mach_port_t sp = 0;
  if (!a1)
  {
    if (!task_get_special_port(mach_task_self_, 4, &special_port))
    {
      mach_port_t v2 = special_port;
      return bootstrap_look_up(v2, "com.apple.IOUPSPlugInServer", &sp) == 0;
    }

    return 0LL;
  }

  mach_port_t v2 = *a1;
  if (!v2)
  {
    if (!task_get_special_port(mach_task_self_, 4, &special_port))
    {
      mach_port_t v2 = special_port;
      *a1 = special_port;
      return bootstrap_look_up(v2, "com.apple.IOUPSPlugInServer", &sp) == 0;
    }

    return 0LL;
  }

  mach_port_t special_port = v2;
  return bootstrap_look_up(v2, "com.apple.IOUPSPlugInServer", &sp) == 0;
}

uint64_t sub_10000A860(mach_port_t a1, int a2, CFTypeRef object)
{
  uint64_t result = 3758097090LL;
  if (a1 && object)
  {
    id v6 = IOCFSerialize(object, 0LL);
    if (v6)
    {
      int v7 = v6;
      BytePtr = CFDataGetBytePtr(v6);
      int Length = CFDataGetLength(v7);
      uint64_t v10 = sub_10003BF90(a1, a2, (uint64_t)BytePtr, Length);
      CFRelease(v7);
      return v10;
    }

    else
    {
      return 3758097084LL;
    }
  }

  return result;
}

uint64_t sub_10000A8F0(mach_port_t a1, int a2, CFTypeRef *a3)
{
  buffer = 0LL;
  uint64_t result = 3758097090LL;
  if (a1 && a3)
  {
    uint64_t result = sub_10003C104(a1, a2, &buffer, &v6);
    if (!(_DWORD)result)
    {
      *a3 = IOCFUnserialize(buffer, kCFAllocatorDefault, 0LL, 0LL);
      vm_deallocate(mach_task_self_, (vm_address_t)buffer, v6);
      return 0LL;
    }
  }

  return result;
}

uint64_t sub_10000A978(mach_port_t a1, int a2, CFTypeRef *a3)
{
  buffer = 0LL;
  uint64_t result = 3758097090LL;
  if (a1 && a3)
  {
    uint64_t result = sub_10003C2C8(a1, a2, &buffer, &v6);
    if (!(_DWORD)result)
    {
      *a3 = IOCFUnserialize(buffer, kCFAllocatorDefault, 0LL, 0LL);
      vm_deallocate(mach_task_self_, (vm_address_t)buffer, v6);
      return 0LL;
    }
  }

  return result;
}

id sub_10000AB14(uint64_t a1)
{
  v4[0] = @"state";
  v4[1] = @"batteryLevel";
  uint64_t v1 = *(void *)(a1 + 40);
  v5[0] = *(void *)(a1 + 32);
  v5[1] = v1;
  __int128 v2 = *(_OWORD *)(a1 + 48);
  _DWORD v4[2] = @"source";
  v4[3] = @"pluggedIn";
  __int128 v6 = v2;
  void v4[4] = @"durationInMinutes";
  uint64_t v7 = *(void *)(a1 + 64);
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v5,  v4,  5LL));
}

id sub_10000AC44(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  int v3 = @"wasEnabledToday";
  uint64_t v4 = v1;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v4,  &v3,  1LL));
}

const char *sub_10000ACB4()
{
  return "OK";
}

const char *sub_10000ACC0(unsigned int a1)
{
  if (a1 > 0x32) {
    return "";
  }
  else {
    return (&off_100059470)[(char)a1];
  }
}

double sub_10000ACE8(uint64_t a1)
{
  return (double)a1 / 1000.0 + (double)HIDWORD(a1) - kCFAbsoluteTimeIntervalSince1970;
}

uint64_t sub_10000AD18()
{
  uint64_t result = dword_100066E98;
  if (!dword_100066E98)
  {
    uint64_t result = IORegistryEntryFromPath(kIOMainPortDefault, "IOPower:/IOPowerConnection/IOPMrootDomain");
    dword_100066E98 = result;
  }

  return result;
}

uint64_t sub_10000AD58()
{
  uint64_t result = dword_100066E9C;
  if (!dword_100066E9C)
  {
    uint64_t v1 = IOServiceMatching("IOPMPowerSource");
    uint64_t result = IOServiceGetMatchingService(kIOMainPortDefault, v1);
    dword_100066E9C = result;
  }

  return result;
}

uint64_t sub_10000ADA4()
{
  uint64_t result = dword_100066EA0;
  if (!dword_100066EA0)
  {
    uint64_t v1 = IOServiceMatching("AppleSmartBattery");
    uint64_t result = IOServiceGetMatchingService(kIOMainPortDefault, v1);
    dword_100066EA0 = result;
  }

  return result;
}

CFCalendarRef sub_10000ADF0()
{
  CFCalendarRef result = (CFCalendarRef)qword_100066EA8;
  if (!qword_100066EA8)
  {
    CFCalendarRef result = CFCalendarCreateWithIdentifier(0LL, kCFGregorianCalendar);
    qword_100066EA8 = (uint64_t)result;
  }

  return result;
}

__asl_object_s *sub_10000AE28(const char *a1)
{
  if (!a1) {
    return 0LL;
  }
  asl_object_t v2 = asl_new(2u);
  if (!v2) {
    return 0LL;
  }
  int v3 = v2;
  uint64_t v4 = asl_new(1u);
  int v5 = v4;
  if (v4)
  {
    asl_set_query(v4, "Facility", "com.apple.iokit.power", 1u);
    asl_append(v3, v5);
    asl_release(v5);
    __int128 v6 = asl_open_path(a1, 0);
    uint64_t v7 = v6;
    if (v6) {
      int v5 = asl_match(v6, v3, &last, 0LL, 0LL, 0, 1);
    }
    else {
      int v5 = 0LL;
    }
    asl_release(v7);
  }

  asl_release(v3);
  return v5;
}

uint64_t sub_10000AF04(double a1)
{
  int times = mach_get_times(&v8, 0LL, v7);
  if (times)
  {
    int v3 = times;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10003F5D4(v3);
    }
    return 0LL;
  }

  else
  {
    double v5 = (double)v7[0] - kCFAbsoluteTimeIntervalSince1970 + (double)v7[1] / 1000000000.0 - a1;
    mach_timebase_info(&v6);
    return v8 - (unint64_t)(v5 * 1000000000.0 * (double)(v6.denom / v6.numer));
  }

unint64_t sub_10000AFC8(uint64_t a1, uint64_t a2)
{
  return (a2 - a1) * (unint64_t)info.numer / info.denom;
}

const char *sub_10000B008(int a1)
{
  uint64_t v2 = 0LL;
  CFCalendarRef result = "";
  while (LODWORD((&off_100066878)[v2 + 1]) != a1)
  {
    v2 += 2LL;
    if (v2 == 16) {
      return result;
    }
  }

  return (&off_100066878)[v2];
}

const char *sub_10000B048(__int16 a1)
{
  uint64_t v1 = "CPU";
  if ((a1 & 1) == 0) {
    uint64_t v1 = "";
  }
  if ((a1 & 4) != 0) {
    uint64_t v1 = "USB";
  }
  if ((a1 & 8) != 0) {
    uint64_t v1 = "BT-HID";
  }
  if ((a1 & 0x10) != 0) {
    uint64_t v1 = "MEDIA";
  }
  if ((a1 & 0x20) != 0) {
    uint64_t v1 = "THNDR";
  }
  if ((a1 & 0x40) != 0) {
    uint64_t v1 = "DSPLY";
  }
  if ((a1 & 0x80) != 0) {
    uint64_t v1 = "STORAGE";
  }
  if ((a1 & 0x100) != 0) {
    uint64_t v1 = "MAGICWAKE";
  }
  if ((a1 & 0x200) != 0) {
    return "NETWORK";
  }
  else {
    return v1;
  }
}

void sub_10000B0E4()
{
  io_iterator_t notification = 0;
  qword_100066EB0 = (uint64_t)os_log_create("com.apple.powerd", "batteryAuth");
  qword_100067740 = (uint64_t)dispatch_queue_create("Battery Auth", 0LL);
  if (!qword_100067740) {
    sub_10003F650();
  }
  IONotificationPortRef v0 = IONotificationPortCreate(kIOMainPortDefault);
  if (!v0) {
    sub_10003F678();
  }
  uint64_t v1 = v0;
  char v2 = MGGetBoolAnswer(@"D6/BMDrlb8V3WSiqL8gL+w");
  int v3 = (os_log_s *)qword_100066EB0;
  BOOL v4 = os_log_type_enabled((os_log_t)qword_100066EB0, OS_LOG_TYPE_DEFAULT);
  if ((v2 & 1) != 0)
  {
    if (v4)
    {
      *(_WORD *)unsigned __int8 v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "supported", v15, 2u);
    }

    CFMutableDictionaryRef v5 = IOServiceMatching("IOPMPowerSource");
    mach_timebase_info v6 = IOServiceMatching("AppleAuthCPRelay");
    uint64_t v7 = v6;
    if (v5 && v6)
    {
      CFDictionarySetValue(v6, @"IOParentMatch", v5);
      if (IOServiceAddMatchingNotification( v1,  "IOServicePublish",  v7,  (IOServiceMatchingCallback)sub_10000B2D8,  v1,  &notification))
      {
        uint64_t v8 = (os_log_s *)qword_100066EB0;
        if (os_log_type_enabled((os_log_t)qword_100066EB0, OS_LOG_TYPE_ERROR)) {
          sub_10003F6A0(v8, v9, v10);
        }
      }

      else
      {
        sub_10000B2D8(0, notification);
        IONotificationPortSetDispatchQueue(v1, (dispatch_queue_t)qword_100067740);
      }

      CFMutableDictionaryRef v14 = v5;
LABEL_21:
      CFRelease(v14);
      return;
    }

    int v11 = (os_log_s *)qword_100066EB0;
    if (os_log_type_enabled((os_log_t)qword_100066EB0, OS_LOG_TYPE_ERROR))
    {
      sub_10003F6D8(v11, v12, v13);
      if (!v5) {
        goto LABEL_17;
      }
    }

    else if (!v5)
    {
LABEL_17:
      if (!v7) {
        return;
      }
      CFMutableDictionaryRef v14 = v7;
      goto LABEL_21;
    }

    CFRelease(v5);
    goto LABEL_17;
  }

  if (v4)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "not supported", buf, 2u);
  }

  dword_1000668F8 = 2;
}

uint64_t sub_10000B2D8(int a1, io_iterator_t iterator)
{
  uint64_t result = IOIteratorNext(iterator);
  if ((_DWORD)result)
  {
    io_registry_entry_t v4 = result;
    do
    {
      CFProperty = (const __CFBoolean *)IORegistryEntryCreateCFProperty( v4,  @"isTrustedForUI",  kCFAllocatorDefault,  0);
      if (CFProperty)
      {
        CFBooleanRef v6 = CFProperty;
        CFTypeID TypeID = CFBooleanGetTypeID();
        CFTypeID v8 = CFGetTypeID(v6);
        uint64_t v9 = (os_log_s *)qword_100066EB0;
        if (v8 == TypeID)
        {
          if (os_log_type_enabled((os_log_t)qword_100066EB0, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 67109120;
            BOOL v13 = v6 == kCFBooleanTrue;
            _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "isTrustedForUI: %d", buf, 8u);
          }

          dword_1000668F8 = v6 != kCFBooleanFalse;
          CFRelease(v6);
          IOObjectRelease(v4);
        }

        else
        {
          if (os_log_type_enabled((os_log_t)qword_100066EB0, OS_LOG_TYPE_ERROR)) {
            sub_10003F710(&v10, v11, v9);
          }
          CFRelease(v6);
        }
      }

      uint64_t result = IOIteratorNext(iterator);
      io_registry_entry_t v4 = result;
    }

    while ((_DWORD)result);
  }

  return result;
}

uint64_t sub_10000B490()
{
  uint64_t v3 = 0LL;
  io_registry_entry_t v4 = &v3;
  uint64_t v5 = 0x2020000000LL;
  int v6 = -1;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000B524;
  block[3] = &unk_100058F60;
  void block[4] = &v3;
  dispatch_sync((dispatch_queue_t)qword_100067740, block);
  uint64_t v0 = *((unsigned int *)v4 + 6);
  _Block_object_dispose(&v3, 8);
  return v0;
}

uint64_t sub_10000B524(uint64_t result)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = dword_1000668F8;
  return result;
}

void sub_10000B53C(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

NSString *sub_10000B548()
{
  uint64_t v0 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
  -[NSDateFormatter setDateFormat:](v0, "setDateFormat:", @"yyyy-MM-dd HH:mm:ss");
  -[NSDateFormatter setTimeZone:]( v0,  "setTimeZone:",  +[NSTimeZone timeZoneWithAbbreviation:](&OBJC_CLASS___NSTimeZone, "timeZoneWithAbbreviation:", @"GMT"));
  uint64_t v1 = -[NSDateFormatter stringFromDate:](v0, "stringFromDate:", sub_10000B5B8());

  return v1;
}

NSDate *sub_10000B5B8()
{
  uint64_t v0 = +[NSDate now](&OBJC_CLASS___NSDate, "now");
  if (qword_100066EC8) {
    BOOL v1 = off_100066ED0 == 0LL;
  }
  else {
    BOOL v1 = 1;
  }
  if (!v1)
  {
    [(id)qword_100066EB8 doubleForKey:@"ReferenceRTCTicks"];
    double v3 = v2;
    id v4 = [(id)qword_100066EB8 objectForKey:@"ReferenceWalltime"];
    [(id)qword_100066EB8 doubleForKey:@"RTCTicksDelta"];
    double v6 = v5;
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSDate);
    if ((objc_opt_isKindOfClass(v4, v7) & 1) != 0
      && (objc_opt_respondsToSelector(v4, "dateByAddingTimeInterval:") & 1) != 0)
    {
      sub_10000EC24();
      double v9 = v8;
      double v10 = v8 - v3;
      double v11 = v6 + v10;
      if (v6 + v10 >= 0.0)
      {
        uint64_t v0 = (NSDate *)[v4 dateByAddingTimeInterval:v6 + v10];
        uint64_t v12 = (void *)qword_100066EB8;
        objc_sync_enter((id)qword_100066EB8);
        [(id)qword_100066EB8 setDouble:@"LastKnownRTCTicks" forKey:v9];
        if (([(id)qword_100066EB8 BOOLForKey:@"NeedSystemTimeUpdate"] & 1) == 0)
        {
          int v24 = +[NSDate now](&OBJC_CLASS___NSDate, "now");
          [(id)qword_100066EB8 setObject:v24 forKey:@"LastKnownWalltime"];
        }
      }

      else
      {
        uint64_t v12 = (void *)qword_100066EB8;
        objc_sync_enter((id)qword_100066EB8);
        unsigned int v13 = [(id)qword_100066EB8 BOOLForKey:@"NeedSystemTimeUpdate"];
        CFMutableDictionaryRef v14 = (os_log_s *)qword_100067748;
        BOOL v15 = os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_ERROR);
        if (v13)
        {
          if (v15) {
            sub_10003F744(v14, v16, v17, v18, v19, v20, v21, v22);
          }
        }

        else
        {
          if (v15)
          {
            int v26 = 134218752;
            double v27 = v9;
            __int16 v28 = 2048;
            double v29 = v3;
            __int16 v30 = 2048;
            double v31 = v11;
            __int16 v32 = 2048;
            double v33 = v6;
            _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "Unhandled RTC reset detected. Resetting timeline and falling back to system wall time. Current ticks %lf saved ticks %lf total delta %lf saved delta %lf",  (uint8_t *)&v26,  0x2Au);
          }

          [(id)qword_100066EB8 setDouble:@"ReferenceRTCTicks" forKey:v9];
          [(id)qword_100066EB8 setDouble:@"LastKnownRTCTicks" forKey:v9];
          [(id)qword_100066EB8 setObject:v0 forKey:@"ReferenceWalltime"];
          [(id)qword_100066EB8 setObject:v0 forKey:@"LastKnownWalltime"];
          [(id)qword_100066EB8 setDouble:@"RTCTicksDelta" forKey:0.0];
        }
      }

      objc_sync_exit(v12);
    }

    else
    {
      id v23 = (objc_class *)objc_opt_class(v4);
      NSStringFromClass(v23);
      if (os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_ERROR)) {
        sub_10003F7B4();
      }
    }
  }

  return v0;
}

void sub_10000B880(_Unwind_Exception *a1)
{
}

_xpc_connection_s *sub_10000B8A4(const char *a1, dispatch_queue_s *a2)
{
  mach_service = xpc_connection_create_mach_service(a1, a2, 0LL);
  id v4 = mach_service;
  if (mach_service)
  {
    xpc_connection_set_target_queue(mach_service, a2);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_10000B92C;
    handler[3] = &unk_100059610;
    void handler[4] = v4;
    xpc_connection_set_event_handler(v4, handler);
    xpc_connection_activate(v4);
  }

  return v4;
}

void sub_10000B92C(uint64_t a1, xpc_object_t object)
{
  if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_error)
  {
    id v4 = xpc_copy_description(object);
    if (os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_ERROR)) {
      sub_10003F874();
    }
    free(v4);
    double v5 = (void *)xpc_connection_copy_invalidation_reason(*(void *)(a1 + 32));
    if (os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_ERROR)) {
      sub_10003F814();
    }
    free(v5);
  }

LABEL_46:
    return 0LL;
  }

  CFTypeID v39 = objc_autoreleasePoolPush();
  if ((objc_msgSend( objc_msgSend((id)qword_100066EB8, "stringForKey:", @"DataFormatVersion"),  "isEqualToString:",  @"2.9") & 1) == 0) {
    [(id)qword_100066EB8 setObject:@"2.9" forKey:@"DataFormatVersion"];
  }
  CFNumberRef v40 = (void *)sub_1000155E0();
  if (!v40 || (CFTypeID v41 = v40, ![v40 length]))
  {
    CFNumberRef v46 = (os_log_s *)qword_100067748;
    if (!os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_DEFAULT))
    {
LABEL_45:
      objc_autoreleasePoolPop(v39);
      goto LABEL_46;
    }

    *(_WORD *)buf = 0;
    CFNumberRef v47 = "NULL serial number returned by BTR";
LABEL_44:
    _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, v47, buf, 2u);
    goto LABEL_45;
  }

  v42 = [(id)qword_100066EB8 stringForKey:@"BatterySerialNumber"];
  if (v42)
  {
    CFTypeID v43 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v42, v43) & 1) == 0)
    {
      if (os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_ERROR)) {
        sub_10003F9C0();
      }
      goto LABEL_50;
    }
  }

  if ([v42 isEqualToString:v41])
  {
LABEL_50:
    CFNumberRef v45 = 0LL;
    goto LABEL_51;
  }

  [(id)qword_100066EB8 setObject:v41 forKey:@"BatterySerialNumber"];
  CFNumberRef v44 = (os_log_s *)qword_100067748;
  if (os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "Battery change detected", buf, 2u);
  }

  CFNumberRef v45 = 1LL;
LABEL_51:
  CFNumberRef v48 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  v72->_agents = v48;
  if (!v48)
  {
    CFNumberRef v46 = (os_log_s *)qword_100067748;
    if (!os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_45;
    }
    *(_WORD *)buf = 0;
    CFNumberRef v47 = "Agent alloc failed";
    goto LABEL_44;
  }

  context = v39;
  v101[0] = @"BDC_Once";
  v100[0] = @"DataGroupName";
  v100[1] = @"DataFilePath";
  v101[1] = sub_10000D740((uint64_t)@"BDC_Data_Storage_Path", 3u);
  v100[2] = @"DataFormatVersion";
  v101[2] = sub_10000D740((uint64_t)@"BDC_Data_Format_Version", 3u);
  v100[3] = @"DataCollectionPeriod";
  v101[3] = sub_10000D740((uint64_t)@"BDC_Once", 0);
  v100[4] = @"DataRetentionPeriod";
  v101[4] = sub_10000D740((uint64_t)@"BDC_Once", 1u);
  v100[5] = @"DataCollationPeriod";
  v101[5] = sub_10000D740((uint64_t)@"BDC_Once", 2u);
  v100[6] = @"BatteryChanged";
  v101[6] = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v45);
  v101[7] = &__kCFBooleanTrue;
  v100[7] = @"DataCollectionOnce";
  v100[8] = @"DataNeverPrune";
  v101[8] = &__kCFBooleanTrue;
  v99[0] = @"ChemID";
  v99[1] = @"AlgoChemID";
  v100[9] = @"DataColumnNames";
  v99[2] = @"EEEE";
  v99[3] = @"YWW";
  v99[4] = @"DesignCapacity";
  v99[5] = @"GasGaugeFirmwareVersion";
  v101[9] = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v99, 6LL);
  v102[0] = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v101,  v100,  10LL);
  v98[0] = @"BDC_Daily";
  v97[0] = @"DataGroupName";
  v97[1] = @"DataFilePath";
  v98[1] = sub_10000D740((uint64_t)@"BDC_Data_Storage_Path", 3u);
  v97[2] = @"DataFormatVersion";
  v98[2] = sub_10000D740((uint64_t)@"BDC_Data_Format_Version", 3u);
  v97[3] = @"DataCollectionPeriod";
  v98[3] = sub_10000D740((uint64_t)@"BDC_Daily", 0);
  v97[4] = @"DataRetentionPeriod";
  v98[4] = sub_10000D740((uint64_t)@"BDC_Daily", 1u);
  v97[5] = @"DataCollationPeriod";
  v98[5] = sub_10000D740((uint64_t)@"BDC_Daily", 2u);
  v97[6] = @"BatteryChanged";
  v98[6] = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v45);
  v97[7] = @"DataColumnNames";
  v96[0] = @"WeightedRa";
  v96[1] = @"Qmax";
  v96[2] = @"CycleCount";
  v96[3] = @"NominalChargeCapacity";
  v96[4] = @"TimeAtHighSoc";
  v96[5] = @"ChargingVoltage";
  v98[7] = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v96, 6LL);
  v102[1] = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v98,  v97,  8LL);
  v95[0] = @"BDC_Weekly";
  v94[0] = @"DataGroupName";
  v94[1] = @"DataFilePath";
  v95[1] = sub_10000D740((uint64_t)@"BDC_Data_Storage_Path", 3u);
  v94[2] = @"DataFormatVersion";
  v95[2] = sub_10000D740((uint64_t)@"BDC_Data_Format_Version", 3u);
  v94[3] = @"DataCollectionPeriod";
  v95[3] = sub_10000D740((uint64_t)@"BDC_Weekly", 0);
  v94[4] = @"DataRetentionPeriod";
  v95[4] = sub_10000D740((uint64_t)@"BDC_Weekly", 1u);
  v94[5] = @"DataCollationPeriod";
  v95[5] = sub_10000D740((uint64_t)@"BDC_Weekly", 2u);
  v94[6] = @"BatteryChanged";
  v95[6] = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v45);
  v94[7] = @"DataColumnNames";
  v93[0] = @"RaTableRaw";
  v93[1] = @"TotalOperatingTime";
  v93[2] = @"GasGaugeFirmwareVersion";
  v93[3] = @"LowVoltageResidencyCounters";
  v93[4] = @"BatteryAuth";
  v95[7] = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v93, 5LL);
  v102[2] = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v95,  v94,  8LL);
  v92[0] = @"BDC_SBC";
  v91[0] = @"DataGroupName";
  v91[1] = @"DataFilePath";
  v92[1] = sub_10000D740((uint64_t)@"BDC_Data_Storage_Path", 3u);
  v91[2] = @"DataFormatVersion";
  v92[2] = sub_10000D740((uint64_t)@"BDC_Data_Format_Version", 3u);
  v91[3] = @"DataCollectionPeriod";
  v92[3] = sub_10000D740((uint64_t)@"BDC_SBC", 0);
  v91[4] = @"DataRetentionPeriod";
  v92[4] = sub_10000D740((uint64_t)@"BDC_SBC", 1u);
  v91[5] = @"DataCollationPeriod";
  v92[5] = sub_10000D740((uint64_t)@"BDC_SBC", 2u);
  v91[6] = @"BatteryChanged";
  v92[6] = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v45);
  v92[7] = &__kCFBooleanTrue;
  v91[7] = @"DataCollectionAtSBC";
  v91[8] = @"DataColumnNames";
  v90[0] = @"PresentDOD";
  v90[1] = @"CurrentCapacity";
  v90[2] = @"IsCharging";
  v90[3] = @"Temperature";
  v90[4] = @"Amperage";
  v90[5] = @"InstantAmperage";
  v90[6] = @"Voltage";
  v90[7] = @"StateOfCharge";
  v90[8] = @"ChargeAccum";
  v90[9] = @"ResScale";
  v90[10] = @"RSS";
  v90[11] = @"ITMiscStatus";
  v90[12] = @"AccumulatedSystemLoad";
  v90[13] = @"AccumulatedSystemPowerIn";
  v90[14] = @"VirtualTemperature";
  v90[15] = @"SystemVoltageIn";
  v90[16] = @"SystemCurrentIn";
  v90[17] = @"Watts";
  v92[8] = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v90, 18LL);
  v102[3] = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v92,  v91,  9LL);
  v89[0] = @"BDC_OBC";
  v88[0] = @"DataGroupName";
  v88[1] = @"DataFilePath";
  v89[1] = sub_10000D740((uint64_t)@"BDC_Data_Storage_Path", 3u);
  v88[2] = @"DataFormatVersion";
  v89[2] = sub_10000D740((uint64_t)@"BDC_Data_Format_Version", 3u);
  v88[3] = @"DataCollectionPeriod";
  v89[3] = sub_10000D740((uint64_t)@"BDC_OBC", 0);
  v88[4] = @"DataRetentionPeriod";
  v89[4] = sub_10000D740((uint64_t)@"BDC_OBC", 1u);
  v88[5] = @"DataCollationPeriod";
  v89[5] = sub_10000D740((uint64_t)@"BDC_OBC", 2u);
  v88[6] = @"BatteryChanged";
  v89[6] = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v45);
  v89[7] = &__kCFBooleanTrue;
  v88[7] = @"DataCollectAtPowerSourceChange";
  v88[8] = @"DataColumnNames";
  v87[0] = @"FamilyCode";
  v87[1] = @"ExternalConnected";
  v87[2] = @"AppleRawExternalConnected";
  v87[3] = @"ChargingOverride";
  v87[4] = @"NotChargingReason";
  v87[5] = @"VacVoltageLimit";
  v89[8] = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v87, 6LL);
  v102[4] = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v89,  v88,  9LL);
  v86[0] = @"BDC_AMA";
  v85[0] = @"DataGroupName";
  v85[1] = @"DataFilePath";
  v86[1] = sub_10000D740((uint64_t)@"BDC_Data_Storage_Path", 3u);
  v85[2] = @"DataFormatVersion";
  v86[2] = sub_10000D740((uint64_t)@"BDC_Data_Format_Version", 3u);
  v85[3] = @"DataCollectionPeriod";
  v86[3] = sub_10000D740((uint64_t)@"BDC_AMA", 0);
  v85[4] = @"DataRetentionPeriod";
  v86[4] = sub_10000D740((uint64_t)@"BDC_AMA", 1u);
  v85[5] = @"DataCollationPeriod";
  v86[5] = sub_10000D740((uint64_t)@"BDC_AMA", 2u);
  v85[6] = @"BatteryChanged";
  v86[6] = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v45);
  v86[7] = &__kCFBooleanTrue;
  v85[7] = @"SkipCSVUsePowerlog";
  v85[8] = @"useBTM";
  v86[8] = &__kCFBooleanTrue;
  v85[9] = @"DataColumnNames";
  v84[0] = @"Voltage";
  v84[1] = @"InstantAmperage";
  v84[2] = @"ChargeAccum";
  v84[3] = @"PresentDOD";
  v84[4] = @"AlgoTemperature";
  v84[5] = @"VirtualTemperature";
  v86[9] = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v84, 6LL);
  v102[5] = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v86,  v85,  10LL);
  v83[0] = @"BDC_SmartCharging";
  v82[0] = @"DataGroupName";
  v82[1] = @"DataFilePath";
  v83[1] = sub_10000D740((uint64_t)@"BDC_Data_Storage_Path", 3u);
  v82[2] = @"DataFormatVersion";
  v83[2] = sub_10000D740((uint64_t)@"BDC_Data_Format_Version", 3u);
  v82[3] = @"DataCollectionPeriod";
  v83[3] = sub_10000D740((uint64_t)@"BDC_SmartCharging", 0);
  v82[4] = @"DataRetentionPeriod";
  v83[4] = sub_10000D740((uint64_t)@"BDC_SmartCharging", 1u);
  v82[5] = @"DataCollationPeriod";
  v83[5] = sub_10000D740((uint64_t)@"BDC_SmartCharging", 2u);
  v82[6] = @"BatteryChanged";
  v83[6] = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v45);
  v83[7] = &__kCFBooleanTrue;
  v82[7] = @"useSC";
  v82[8] = @"DataColumnNames";
  v81[0] = @"ChargingState";
  v81[1] = @"InflowState";
  v81[2] = @"ChargeLimit";
  v81[3] = @"CheckPoint";
  v81[4] = @"DecisionMaker";
  v81[5] = @"ModeOfOperation";
  v83[8] = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v81, 6LL);
  v102[6] = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v83,  v82,  9LL);
  CFNumberRef v49 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v102, 7LL);
  double v75 = 0u;
  v76 = 0u;
  CFTypeID v77 = 0u;
  int v78 = 0u;
  CFNumberRef v50 = -[NSArray countByEnumeratingWithState:objects:count:]( v49,  "countByEnumeratingWithState:objects:count:",  &v75,  v80,  16LL);
  if (v50)
  {
    int v51 = v50;
    unsigned int v52 = *(void *)v76;
    do
    {
      for (unint64_t i = 0LL; i != v51; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v76 != v52) {
          objc_enumerationMutation(v49);
        }
        CFTypeID v54 = *(void **)(*((void *)&v75 + 1) + 8LL * (void)i);
        CFNumberRef v55 = &stru_100059820;
        if ((objc_msgSend(objc_msgSend(v54, "objectForKeyedSubscript:", @"useBTM"), "BOOLValue") & 1) == 0)
        {
          else {
            CFNumberRef v55 = &stru_100059888;
          }
        }

        CFNumberRef v56 = -[BatteryDataCollectionAgent initWithParams:collectionBlock:]( objc_alloc(&OBJC_CLASS___BatteryDataCollectionAgent),  "initWithParams:collectionBlock:",  v54,  v55);
        if (v56)
        {
          CFNumberRef v57 = v56;
          -[NSMutableArray addObject:](v72->_agents, "addObject:", v56);
        }
      }

      int v51 = -[NSArray countByEnumeratingWithState:objects:count:]( v49,  "countByEnumeratingWithState:objects:count:",  &v75,  v80,  16LL);
    }

    while (v51);
  }

  +[NSError _setFileNameLocalizationEnabled:](&OBJC_CLASS___NSError, "_setFileNameLocalizationEnabled:", 0LL);
  CFNumberRef v38 = v72;
  dispatch_async((dispatch_queue_t)v72->_managerQueue, &stru_100059630);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_10000D884;
  handler[3] = &unk_1000596C0;
  void handler[4] = v72;
  int v73 = 0LL;
  CFNumberRef v58 = sub_10000D740((uint64_t)@"BDC_Data_Storage_Path", 3u);
  CFTypeID v59 = -[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "createDirectoryAtPath:withIntermediateDirectories:attributes:error:",  v58,  1LL,  0LL,  &v73);
  CFNumberRef v60 = (os_log_s *)qword_100067748;
  if ((v59 & 1) == 0)
  {
    CFTypeID v39 = context;
    if (os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_ERROR)) {
      sub_10003F960();
    }
    goto LABEL_45;
  }

  if (os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v58;
    _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "BDC data path %@", buf, 0xCu);
  }

  CFNumberRef v61 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)v72->_managerQueue);
  v72->_pruningTimer = (OS_dispatch_source *)v61;
  if (!v61)
  {
    CFTypeID v39 = context;
    if (os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_ERROR)) {
      sub_10003F8D4();
    }
    goto LABEL_45;
  }

  double v62 = -[NSNull intValue](sub_10000D740((uint64_t)@"BDC_Pruning_Period", 3u), "intValue");
  dispatch_source_set_event_handler((dispatch_source_t)v72->_pruningTimer, handler);
  pruningTimer = (dispatch_source_s *)v72->_pruningTimer;
  CFNumberRef v64 = dispatch_time(0x8000000000000000LL, 1000LL);
  dispatch_source_set_timer(pruningTimer, v64, 1000000000LL * v62, 0xF4240uLL);
  CFTypeID v65 = (os_log_s *)qword_100067748;
  if (os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = v62;
    _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEFAULT, "Pruning timer %d s", buf, 8u);
  }

  -[NSNotificationCenter addObserver:selector:name:object:]( +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"),  "addObserver:selector:name:object:",  v72,  "systemTimeChanged",  NSSystemClockDidChangeNotification,  0LL);
  managerQueue = (dispatch_queue_s *)v72->_managerQueue;
  out_token[0] = -1;
  *(void *)buf = _NSConcreteStackBlock;
  *(void *)&buf[8] = 3221225472LL;
  *(void *)&buf[16] = sub_1000120E4;
  v104 = COERCE_DOUBLE(&unk_1000598A8);
  *(_DWORD *)v105 = 0;
  if (notify_register_dispatch("com.apple.powerd.bdc.get_current_time", out_token, managerQueue, buf)
    && os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_ERROR))
  {
    sub_10003F900();
  }

  objc_autoreleasePoolPop(context);
  return v38;
}

    __int16 v28 = v8;
    double v29 = v7;
    if (v73 < CFAbsoluteTimeGetCurrent() + 60.0) {
      int v73 = CFAbsoluteTimeGetCurrent() + 60.0;
    }
    __int16 v30 = sub_100014374();
    if (!v30)
    {
      LOBYTE(v34) = 0;
      CFTypeID v41 = 0LL;
      goto LABEL_75;
    }

    double v31 = v30;
    __int16 v32 = sub_100013FEC(v30);
    double v33 = getpid();
    CFIndex v34 = sub_10001DF84(v33, v32);
    if (!v34)
    {
      CFTypeID v41 = 0LL;
LABEL_74:
      CFRelease(v31);
LABEL_75:
      CFTypeID v43 = sub_1000140B8();
      if (v43)
      {
        CFNumberRef v44 = v43;
        CFNumberRef v45 = sub_100013FEC(v43);
        CFNumberRef v46 = getpid();
        if (sub_10001DF84(v46, v45))
        {
          Value = CFDictionaryGetValue(v44, @"scheduledby");
          CFNumberRef v48 = CFDictionaryGetValue(v44, @"appPID");
          CFNumberRef v49 = CFStringGetTypeID();
          if (Value && CFGetTypeID(Value) == v49 && (CFNumberRef v50 = CFNumberGetTypeID(), v48) && CFGetTypeID(v48) == v50)
          {
            CFMutableArrayRef Mutable = CFStringCreateMutable(0LL, 1024LL);
            CFStringAppendFormat(Mutable, 0LL, @"%@,%@", Value, v48);
          }

          else
          {
            CFMutableArrayRef Mutable = 0LL;
          }

          if (v45 <= v73)
          {
            int v73 = v45;
            unsigned int v52 = getpid();
            double v29 = sub_10001F350(v29, v52, "Shutdown/Restart", Mutable, v45);
            int valuePtr = getpid();
            strcpy(buffer, "powerd");
            if (Mutable) {
              CFStringGetCString(Mutable, cStr, 128LL, 0x8000100u);
            }
            CFTypeID v41 = (const __CFString *)CFDictionaryGetValue(v44, @"eventtype");
            double v9 = 1;
          }

          else
          {
            double v5 = v28;
          }

          uint64_t v7 = v29;
          if (Mutable) {
            CFRelease(Mutable);
          }
          LOBYTE(v34) = 1;
        }

        else
        {
          double v5 = v28;
          uint64_t v7 = v29;
        }

        CFRelease(v44);
        __int16 v28 = v5;
      }

      else
      {
        uint64_t v7 = v29;
      }

      if (*(double *)&qword_100067910 != 0.0)
      {
        else {
          CFNumberRef v53 = kCFBooleanFalse;
        }
        sub_1000384DC(@"UserWakeAlarmScheduled", v53);
      }

      if (v7)
      {
        snprintf(__str, 5uLL, "%d", v28);
        asl_set(v7, "WakeRequestChosen", __str);
        asl_send(0LL, v7);
      }

      if (v73 == kCFAbsoluteTimeIntervalSince1904)
      {
        if (qword_1000679C8)
        {
          CFRelease((CFTypeRef)qword_1000679C8);
          qword_1000679C8 = 0LL;
        }
      }

      else
      {
        CFTypeID v54 = CFNumberCreate(0LL, kCFNumberDoubleType, &v73);
        CFDictionarySetValue((CFMutableDictionaryRef)qword_1000679C8, @"time", v54);
        CFNumberRef v55 = CFNumberCreate(0LL, kCFNumberIntType, &valuePtr);
        CFDictionarySetValue((CFMutableDictionaryRef)qword_1000679C8, @"appPID", v55);
        CFNumberRef v56 = CFStringCreateWithCString(0LL, buffer, 0x8000100u);
        if (v56)
        {
          CFNumberRef v57 = v56;
          CFDictionarySetValue((CFMutableDictionaryRef)qword_1000679C8, @"scheduledby", v56);
          CFRelease(v57);
        }

        if (v41) {
          CFNumberRef v58 = v41;
        }
        else {
          CFNumberRef v58 = @"wake";
        }
        CFDictionarySetValue((CFMutableDictionaryRef)qword_1000679C8, @"eventtype", v58);
        CFTypeID v59 = CFStringCreateWithCString(0LL, cStr, 0x8000100u);
        if (v59)
        {
          CFNumberRef v60 = v59;
          CFDictionarySetValue((CFMutableDictionaryRef)qword_1000679C8, @"wakeInfo", v59);
          CFRelease(v60);
        }

        if (v54) {
          CFRelease(v54);
        }
        if (v55) {
          CFRelease(v55);
        }
      }

      if (qword_1000679C0)
      {
        CFRelease((CFTypeRef)qword_1000679C0);
        qword_1000679C0 = 0LL;
      }

      *(void *)__str = -1LL;
      int v74 = 0;
      if (v73 == 0.0) {
        CFNumberRef v61 = kCFAbsoluteTimeIntervalSince1904;
      }
      else {
        CFNumberRef v61 = v73;
      }
      if (*(double *)&qword_100067910 != 0.0)
      {
        if (*(double *)&qword_100067910 >= v61 + 0.0)
        {
          double v62 = 0;
        }

        else
        {
          sub_10001D52C(&v74, 0LL);
          double v62 = v74 == 6;
        }

        CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
        CFNumberRef v64 = (unint64_t)(*(double *)&qword_100067910 - Current);
        *(void *)__str = v64;
        CFTypeID v65 = CFNumberCreate(0LL, kCFNumberLongType, __str);
        if (v65)
        {
          CFNumberRef v66 = v65;
          sub_1000384DC(@"AutoPowerOff Timer", v65);
          CFRelease(v66);
        }

        if (v62)
        {
          if ((dword_100066D38 & 4) != 0) {
            asl_log( 0LL,  0LL,  3,  "Not scheduling other wakes to allow AutoPower off. APO timer:%lld\n",  *(void *)__str);
          }
          goto LABEL_134;
        }

        if ((dword_100066D38 & 4) != 0) {
          asl_log(0LL, 0LL, 3, "sleepType:%d APO timer:%lld secs\n", v74, *(void *)__str);
        }
      }

      if (v61 == kCFAbsoluteTimeIntervalSince1904) {
        goto LABEL_134;
      }
      if ((v9 & 0xFFFFFFFD) == 1)
      {
        CFTypeID v67 = @"MaintenanceImmediate";
      }

      else if (v9)
      {
        if (v9 != 2) {
          goto LABEL_134;
        }
        CFTypeID v67 = @"SleepServiceImmediate";
      }

      else
      {
        CFTypeID v67 = @"WakeImmediate";
      }

      if (v61 != 0.0)
      {
        CFNumberRef v68 = CFDateCreate(0LL, v61);
        if (v68)
        {
          CFTypeID v69 = v68;
          IOPMSchedulePowerEvent(v68, 0LL, v67);
          CFRelease(v69);
        }
      }

  free(v52);
  CFRelease(v8);
  return Count;
}

NSNull *sub_10000D740(uint64_t a1, unsigned int a2)
{
  if (a2 == 3) {
    id v2 = [(id)qword_100066EF0 objectForKeyedSubscript:a1];
  }
  else {
    id v2 = objc_msgSend( objc_msgSend((id)qword_100066EE8, "objectForKeyedSubscript:", a1),  "objectAtIndexedSubscript:",  a2);
  }
  double v3 = v2;
  id v4 = [v2 objectAtIndex:0];
  uint64_t result = (NSNull *)[(id)qword_100066EB8 objectForKey:v4];
  if (!result) {
    return (NSNull *)[v3 objectAtIndex:1];
  }
  return result;
}

void sub_10000D800(id a1)
{
  uint64_t v4 = 0LL;
  BOOL v1 = +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager");
  if (-[NSFileManager fileExistsAtPath:]( v1,  "fileExistsAtPath:",  @"/var/MobileSoftwareUpdate/Hardware/Battery/BDC")
    && !-[NSFileManager removeItemAtPath:error:]( v1,  "removeItemAtPath:error:",  @"/var/MobileSoftwareUpdate/Hardware/Battery/BDC",  &v4))
  {
    id v2 = (os_log_s *)qword_100067748;
    if (os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_ERROR)) {
      sub_10003FAA4(&v4, v2, v3);
    }
  }

void sub_10000D884(uint64_t a1)
{
  id v2 = +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager");
  if (!v2)
  {
    if (os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_ERROR)) {
      sub_10003FB24();
    }
    return;
  }

  uint64_t v3 = v2;
  uint64_t v4 = sub_10000D740((uint64_t)@"BDC_Data_Storage_Path", 3u);
  NSURLResourceKey v71 = NSURLFileSizeKey;
  double v5 = -[NSFileManager enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:]( v3,  "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:",  +[NSURL fileURLWithPath:isDirectory:](&OBJC_CLASS___NSURL, "fileURLWithPath:isDirectory:", v4, 1LL),  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v71, 1LL),  5LL,  0LL);
  if (!v5)
  {
    if (os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_ERROR)) {
      sub_10003FB50();
    }
    goto LABEL_52;
  }

  double v6 = v5;
  v42 = v4;
  unsigned int v7 = -[NSNull unsignedIntValue]( sub_10000D740((uint64_t)@"TotalDataSizeUpperBound", 3u),  "unsignedIntValue");
  __int128 v59 = 0u;
  __int128 v60 = 0u;
  __int128 v61 = 0u;
  __int128 v62 = 0u;
  id v8 = -[NSDirectoryEnumerator countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v59,  v70,  16LL);
  if (!v8)
  {
    int v16 = 0;
    float v11 = 0.0;
    goto LABEL_27;
  }

  id v9 = v8;
  uint64_t v10 = *(void *)v60;
  float v11 = 0.0;
  uint64_t v43 = a1;
  while (2)
  {
    for (unint64_t i = 0LL; i != v9; unint64_t i = (char *)i + 1)
    {
      if (*(void *)v60 != v10) {
        objc_enumerationMutation(v6);
      }
      unsigned int v13 = *(void **)(*((void *)&v59 + 1) + 8LL * (void)i);
      CFMutableDictionaryRef v14 = objc_autoreleasePoolPush();
      id v57 = 0LL;
      uint64_t v58 = 0LL;
      else {
        BOOL v15 = 0;
      }
      if (!v15)
      {
        [v13 path];
        if (os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_ERROR)) {
          sub_10003FC68();
        }
LABEL_26:
        objc_autoreleasePoolPop(v14);
        int v16 = 1;
        a1 = v43;
        goto LABEL_27;
      }

      float v11 = v11 + (float)((float)[v57 unsignedIntValue] * 0.00097656);
      if (v11 >= (float)v7)
      {
        uint64_t v18 = (os_log_s *)qword_100067748;
        if (os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218240;
          double v67 = v11;
          __int16 v68 = 1024;
          unsigned int v69 = v7;
          _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Cumulative file size %f kB >= high water mark %u kB",  buf,  0x12u);
        }

        goto LABEL_26;
      }

      objc_autoreleasePoolPop(v14);
    }

    id v9 = -[NSDirectoryEnumerator countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v59,  v70,  16LL);
    int v16 = 0;
    a1 = v43;
    if (v9) {
      continue;
    }
    break;
  }

LABEL_27:
  uint64_t v19 = (os_log_s *)qword_100067748;
  if (os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    double v67 = v11;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Cumulative data file size %f kB", buf, 0xCu);
  }

  if (!v16)
  {
LABEL_52:
    __int128 v47 = 0u;
    __int128 v48 = 0u;
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    unint64_t v35 = *(void **)(*(void *)(a1 + 32) + 8LL);
    id v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v45, v63, 16, v42);
    if (v36)
    {
      id v37 = v36;
      uint64_t v38 = *(void *)v46;
      do
      {
        for (uint64_t j = 0LL; j != v37; uint64_t j = (char *)j + 1)
        {
          if (*(void *)v46 != v38) {
            objc_enumerationMutation(v35);
          }
          CFNumberRef v40 = *(void **)(*((void *)&v45 + 1) + 8LL * (void)j);
          if (([v40 neverPrune] & 1) == 0)
          {
            CFTypeID v41 = (dispatch_queue_s *)[v40 collectionQueue];
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472LL;
            block[2] = sub_10000DF1C;
            block[3] = &unk_100059698;
            void block[4] = v40;
            void block[5] = v3;
            dispatch_async(v41, block);
          }
        }

        id v37 = [v35 countByEnumeratingWithState:&v45 objects:v63 count:16];
      }

      while (v37);
    }

    return;
  }

  uint64_t v58 = 0LL;
  __int128 v53 = 0u;
  __int128 v54 = 0u;
  __int128 v55 = 0u;
  __int128 v56 = 0u;
  uint64_t v20 = *(void **)(*(void *)(a1 + 32) + 8LL);
  id v21 = [v20 countByEnumeratingWithState:&v53 objects:v65 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v54;
    do
    {
      for (k = 0LL; k != v22; k = (char *)k + 1)
      {
        if (*(void *)v54 != v23) {
          objc_enumerationMutation(v20);
        }
        objc_msgSend(*(id *)(*((void *)&v53 + 1) + 8 * (void)k), "stop", v42);
      }

      id v22 = [v20 countByEnumeratingWithState:&v53 objects:v65 count:16];
    }

    while (v22);
  }

  double v25 = *(double *)&v42;
  unsigned __int8 v26 = -[NSFileManager removeItemAtURL:error:]( v3,  "removeItemAtURL:error:",  +[NSURL fileURLWithPath:isDirectory:](&OBJC_CLASS___NSURL, "fileURLWithPath:isDirectory:", v42, 1LL, v42),  &v58);
  double v27 = (os_log_s *)qword_100067748;
  if (v58 || (v26 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_ERROR)) {
      sub_10003FC08();
    }
  }

  else
  {
    if (os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      double v67 = v25;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Removed dir %@", buf, 0xCu);
    }

    unsigned int v28 = -[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:]( v3,  "createDirectoryAtPath:withIntermediateDirectories:attributes:error:",  *(void *)&v25,  1LL,  0LL,  &v58);
    double v29 = (os_log_s *)qword_100067748;
    if (v28 && !v58)
    {
      if (os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        double v67 = v25;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "BDC data path recreated %@", buf, 0xCu);
      }

      __int128 v51 = 0u;
      __int128 v52 = 0u;
      __int128 v49 = 0u;
      __int128 v50 = 0u;
      __int16 v30 = *(void **)(*(void *)(a1 + 32) + 8LL);
      id v31 = [v30 countByEnumeratingWithState:&v49 objects:v64 count:16];
      if (v31)
      {
        id v32 = v31;
        uint64_t v33 = *(void *)v50;
        do
        {
          for (m = 0LL; m != v32; m = (char *)m + 1)
          {
            if (*(void *)v50 != v33) {
              objc_enumerationMutation(v30);
            }
            [*(id *)(*((void *)&v49 + 1) + 8 * (void)m) start];
          }

          id v32 = [v30 countByEnumeratingWithState:&v49 objects:v64 count:16];
        }

        while (v32);
      }

      goto LABEL_52;
    }

    if (os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_ERROR)) {
      sub_10003FBA8();
    }
  }

  if (os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_ERROR)) {
    sub_10003FB7C();
  }
}

    CFRelease(v4);
    return vm_deallocate(mach_task_self_, *(void *)(a1 + 40), *(unsigned int *)(a1 + 84));
  }

  id v22 = (const void *)v8[3];
  if (v22)
  {
    CFRelease(v22);
  }

  else
  {
    sub_100018080("com.apple.system.powersources.attach");
    id v32 = (os_log_s *)qword_1000678E0;
    if (os_log_type_enabled((os_log_t)qword_1000678E0, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v33 = *v6;
      atoken.val[0] = 136315394;
      *(void *)&atoken.val[1] = "com.apple.system.powersources.attach";
      LOWORD(atoken.val[3]) = 1024;
      *(unsigned int *)((char *)&atoken.val[3] + 2) = v33;
      _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "Posted %s for new power source id %d\n",  (uint8_t *)&atoken,  0x12u);
    }
  }

  v8[3] = (uint64_t)v4;
  dispatch_async((dispatch_queue_t)qword_100066F78, &stru_1000599D0);
  **(_DWORD **)(a1 + 32) = 0;
  return vm_deallocate(mach_task_self_, *(void *)(a1 + 40), *(unsigned int *)(a1 + 84));
}

  CFMutableArrayRef Mutable = CFArrayCreateMutable(0LL, 512LL, &kCFTypeArrayCallBacks);
  float v11 = Mutable;
  if (Mutable)
  {
    if (v13 > v14)
    {
      if (Count == (char *)512)
      {
        v17.length = 512 - v13;
        v17.location = v13;
        CFArrayAppendArray(Mutable, (CFArrayRef)qword_1000679F0, v17);
        unsigned int v13 = 0LL;
      }

      else
      {
        asl_log(0LL, 0LL, 3, "arrCnt is %ld. expected %d\n", Count, 512);
        asl_log( 0LL,  0LL,  3,  "startIdx: %ld endIdx: %ld refCnt: 0x%x readFromIdx: 0x%x writeToIdx: 0x%x\n",  v13,  v14,  *a1,  v6,  v7);
        unsigned int v13 = 0LL;
        *a2 = 1;
      }
    }

    if ((uint64_t)Count <= v14)
    {
      asl_log(0LL, 0LL, 3, "final: arrCnt is %ld. expected >= %ld\n", Count, v14 + 1);
      *a2 = 1;
    }

    else
    {
      v18.length = v14 + 1 - v13;
      v18.location = v13;
      CFArrayAppendArray(v11, (CFArrayRef)qword_1000679F0, v18);
    }

    *a1 = dword_1000679E8;
  }

  return v11;
}

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v35, 8);
  return v2;
}

  uint64_t result = CFDictionaryGetValueIfPresent( *(CFDictionaryRef *)(*(void *)(a1 + 32) + 16LL),  @"ActivityBudgeted",  (const void **)&value);
  if ((_DWORD)result)
  {
    if (value == kCFBooleanTrue)
    {
      *(_WORD *)(*(void *)(a1 + 32) + 104LL) |= 0x200u;
      ++dword_10006872C;
    }
  }

  return result;
}

void sub_10000DF1C(uint64_t a1)
{
  context = objc_autoreleasePoolPush();
  double v42 = 0.0;
  id v2 = +[NSURL fileURLWithPath:isDirectory:]( NSURL,  "fileURLWithPath:isDirectory:",  [*(id *)(a1 + 32) dirPath],  1);
  uint64_t v3 = *(void **)(a1 + 40);
  NSURLResourceKey v52 = NSURLCreationDateKey;
  id v4 = objc_msgSend( v3,  "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:",  v2,  +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v52, 1),  5,  &stru_100059670);
  if (v4)
  {
    double v5 = v4;
    uint64_t v36 = a1;
    double v6 = +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@%@",  [*(id *)(a1 + 32) dataGroupName],  @"_");
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    id v7 = [v5 countByEnumeratingWithState:&v38 objects:v51 count:16];
    if (!v7) {
      goto LABEL_37;
    }
    id v8 = v7;
    uint64_t v9 = *(void *)v39;
    while (1)
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v39 != v9) {
          objc_enumerationMutation(v5);
        }
        float v11 = *(void **)(*((void *)&v38 + 1) + 8LL * (void)v10);
        uint64_t v12 = objc_autoreleasePoolPush();
        if (objc_msgSend(objc_msgSend(v11, "lastPathComponent"), "containsString:", v6))
        {
          unsigned int v13 = v5;
          id v14 = [v11 path];
          id v37 = 0LL;
          unsigned int v15 = [v11 getResourceValue:&v37 forKey:NSURLCreationDateKey error:&v42];
          if (v37) {
            unsigned int v16 = v15;
          }
          else {
            unsigned int v16 = 0;
          }
          if ((v16 & 1) == 0)
          {
            char v17 = v15;
            uint64_t v18 = qword_100067748;
            BOOL v19 = os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_ERROR);
            if ((v17 & 1) != 0)
            {
              if (v19)
              {
                *(_DWORD *)buf = 138412290;
                id v44 = v14;
                uint64_t v20 = (os_log_s *)v18;
                id v21 = "Creation time not available for file %@";
                uint32_t v22 = 12;
                goto LABEL_32;
              }
            }

            else if (v19)
            {
              *(_DWORD *)buf = 138412546;
              id v44 = v14;
              __int16 v45 = 2112;
              double v46 = v42;
              uint64_t v20 = (os_log_s *)v18;
              id v21 = "getResourceValue call for file %@ failed. Error %@";
              uint32_t v22 = 22;
LABEL_32:
              _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, v21, buf, v22);
            }

            id v37 = +[NSDate distantPast](&OBJC_CLASS___NSDate, "distantPast");
          }

          uint64_t v23 = +[NSDate now](&OBJC_CLASS___NSDate, "now");
          -[NSDate timeIntervalSinceDate:](v23, "timeIntervalSinceDate:", v37);
          double v25 = v24;
          unsigned int v26 = objc_msgSend(objc_msgSend(*(id *)(v36 + 32), "collationPeriod"), "unsignedIntValue");
          double v27 = (double)(objc_msgSend( objc_msgSend(*(id *)(v36 + 32), "retentionPeriod"),  "unsignedIntValue")
                       + v26);
          unsigned int v28 = (os_log_s *)qword_100067748;
          if (os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_DEFAULT))
          {
            unsigned int v29 = objc_msgSend(objc_msgSend(*(id *)(v36 + 32), "retentionPeriod"), "unsignedIntValue");
            *(_DWORD *)buf = 138413058;
            id v44 = v14;
            __int16 v45 = 2048;
            double v46 = v25;
            __int16 v47 = 1024;
            unsigned int v48 = v29;
            __int16 v49 = 2048;
            double v50 = v27;
            _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "File %@. Seconds elapsed %lf. Retention period %u s adjusted %lf s",  buf,  0x26u);
          }

          if (v25 < v27) {
            char v30 = v16;
          }
          else {
            char v30 = 0;
          }
          if ((v30 & 1) == 0)
          {
            id v31 = (os_log_s *)qword_100067748;
            if (os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              id v44 = v14;
              __int16 v45 = 1024;
              LODWORD(v46) = v16 ^ 1;
              _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "Pruning file %@. Force delete %u",  buf,  0x12u);
            }

            -[NSFileManager removeItemAtPath:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "removeItemAtPath:error:",  v14,  &v42);
            double v32 = v42;
            if (v42 != 0.0)
            {
              uint64_t v33 = (os_log_s *)qword_100067748;
              if (os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                id v44 = v14;
                __int16 v45 = 2112;
                double v46 = v32;
                _os_log_error_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_ERROR,  "Failed to delete file %@ with error %@",  buf,  0x16u);
              }
            }
          }

          double v5 = v13;
        }

        objc_autoreleasePoolPop(v12);
        uint64_t v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v34 = [v5 countByEnumeratingWithState:&v38 objects:v51 count:16];
      id v8 = v34;
      if (!v34) {
        goto LABEL_37;
      }
    }
  }

  if (os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_ERROR)) {
    sub_10003FCC8();
  }
LABEL_37:
  objc_autoreleasePoolPop(context);
}

BOOL sub_10000E3BC(id a1, NSURL *a2, NSError *a3)
{
  double v5 = (os_log_s *)qword_100067748;
  if (os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_ERROR)) {
    sub_10003FD28(a2, (uint64_t)a3, v5);
  }
  return 1;
}

void sub_10000E538(uint64_t a1)
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  id v2 = *(void **)(*(void *)(a1 + 32) + 8LL);
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      double v6 = 0LL;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * (void)v6) start];
        double v6 = (char *)v6 + 1;
      }

      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v4);
  }

  id v7 = (os_log_s *)qword_100067748;
  if (os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Started bdcm", v8, 2u);
  }

void sub_10000E6C4(uint64_t a1)
{
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v2 = *(void **)(*(void *)(a1 + 32) + 8LL);
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      for (unint64_t i = 0LL; i != v4; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * (void)i) stop];
      }

      id v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v4);
  }

  dispatch_suspend(*(dispatch_object_t *)(*(void *)(a1 + 32) + 16LL));
  id v7 = (os_log_s *)qword_100067748;
  if (os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Stopped bdcm", v8, 2u);
  }

void sub_10000EBF8(_Unwind_Exception *a1)
{
}

void sub_10000EC24()
{
  if (off_100066ED0)
  {
    id v0 = [(id)qword_100066EB8 objectForKey:@"CurrentRTCTicksOverride"];
    if (v0)
    {
      [v0 doubleValue];
      BOOL v1 = (os_log_s *)qword_100067748;
      if (os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_ERROR)) {
        sub_10003FEFC(v1, v2, v3, v4, v5, v6, v7, v8);
      }
    }

    else
    {
      off_100066ED0();
    }
  }

void sub_10000F338( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
}

void sub_10000F378(uint64_t a1)
{
  uint64_t v2 = objc_autoreleasePoolPush();
  uint64_t v3 = +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager");
  uint64_t v4 = (void *)os_transaction_create("com.apple.powerd.bdc.collectionevenhandler");
  uint64_t v5 = (id *)(a1 + 40);
  if ([objc_loadWeak((id *)(a1 + 40)) collectAtSBC])
  {
    int v6 = sub_100015DD4();
    uint64_t v7 = (os_log_s *)qword_100067748;
    if (os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)&uint8_t buf[4] = dword_1000668FC;
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Battery percentage last %d now %d", buf, 0xEu);
    }

    if (dword_1000668FC == v6) {
      goto LABEL_35;
    }
    dword_1000668FC = v6;
  }

  uint64_t v8 = (uint64_t (**)(id, NSDictionary *))[objc_loadWeak((id *)(a1 + 40)) createDataDictCollectionBlock];
  char v30 = @"DataColumnNames";
  id v31 = [objc_loadWeak((id *)(a1 + 40)) columnNames];
  uint64_t v9 = v8[2]( v8,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v31,  &v30,  1LL));
  if (!v9)
  {
    if (os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_ERROR)) {
      sub_10004004C();
    }
LABEL_35:
    id v24 = 0LL;
    __int128 v10 = 0LL;
LABEL_39:
    __int128 v11 = 0LL;
    __int128 v12 = 0LL;
    goto LABEL_30;
  }

  __int128 v10 = (void *)v9;
  if ([*(id *)(a1 + 32) skipCSVAndUsePowerlog])
  {
    __int128 v11 = 0LL;
    __int128 v12 = 0LL;
    goto LABEL_28;
  }

  unsigned int v13 = (NSString *)objc_msgSend( (id)qword_100066EB8,  "stringForKey:",  objc_msgSend(objc_loadWeak((id *)(a1 + 40)), "getLastUsedDataFileNameDefaultsKey"));
  if (!-[NSFileManager fileExistsAtPath:](v3, "fileExistsAtPath:", v13)) {
    goto LABEL_12;
  }
  unsigned int v14 = -[NSString containsString:]( v13,  "containsString:",  +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"version%@",  [objc_loadWeak((id *)(a1 + 40)) formatVersion]));
  if (([objc_loadWeak((id *)(a1 + 40)) collectOnce] & 1) == 0)
  {
    -[NSDate timeIntervalSinceDate:]( +[NSDate now](&OBJC_CLASS___NSDate, "now"),  "timeIntervalSinceDate:",  -[NSDictionary objectForKeyedSubscript:]( -[NSFileManager attributesOfItemAtPath:error:](v3, "attributesOfItemAtPath:error:", v13, 0LL),  "objectForKeyedSubscript:",  NSFileCreationDate));
    BOOL v15 = objc_msgSend( objc_msgSend(objc_loadWeak((id *)(a1 + 40)), "collationPeriod"),  "unsignedIntValue") <= v17;
    if (!v14) {
      goto LABEL_12;
    }
LABEL_14:
    unsigned int v16 = [objc_loadWeak((id *)(a1 + 40)) batteryChanged] | v15;
    goto LABEL_15;
  }

  BOOL v15 = 0;
  if (v14) {
    goto LABEL_14;
  }
LABEL_12:
  unsigned int v16 = 1;
LABEL_15:
  if ([objc_loadWeak((id *)(a1 + 40)) collectOnce] && !v16)
  {
    double v25 = (os_log_s *)qword_100067748;
    if (os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_DEFAULT))
    {
      id v26 = [objc_loadWeak(v5) dataGroupName];
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v26;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Data already collected for %@", buf, 0xCu);
    }

    id v24 = 0LL;
    goto LABEL_39;
  }

  double v27 = v2;
  if (v16)
  {
    __int128 v11 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
    -[NSDateFormatter setDateFormat:](v11, "setDateFormat:", @"yyyy-MM-dd_HH:mm:ss");
    -[NSDateFormatter setTimeZone:]( v11,  "setTimeZone:",  +[NSTimeZone timeZoneWithAbbreviation:](&OBJC_CLASS___NSTimeZone, "timeZoneWithAbbreviation:", @"GMT"));
    id v18 = [objc_loadWeak((id *)(a1 + 40)) dirPath];
    id v19 = [objc_loadWeak((id *)(a1 + 40)) dataGroupName];
    id v20 = [objc_loadWeak((id *)(a1 + 40)) formatVersion];
    unsigned int v13 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/%@_version%@_%@.csv",  v18,  v19,  v20,  -[NSDateFormatter stringFromDate:](v11, "stringFromDate:", sub_10000B5B8()));
    id v21 = (os_log_s *)qword_100067748;
    if (os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_DEFAULT))
    {
      id v22 = [objc_loadWeak((id *)(a1 + 40)) dataGroupName];
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v22;
      *(_WORD *)&uint8_t buf[12] = 2112;
      unsigned int v29 = v13;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%@ Rolling over to new file %@", buf, 0x16u);
    }
  }

  else
  {
    __int128 v11 = 0LL;
  }

  if (!-[NSFileManager fileExistsAtPath:](v3, "fileExistsAtPath:", v13))
  {
    *(void *)buf = 0LL;
    if (-[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:]( v3,  "createDirectoryAtPath:withIntermediateDirectories:attributes:error:",  sub_10000D740((uint64_t)@"BDC_Data_Storage_Path", 3u),  1LL,  0LL,  buf))
    {
      if (-[NSFileManager createFileAtPath:contents:attributes:]( v3,  "createFileAtPath:contents:attributes:",  v13,  0LL,  0LL))
      {
        objc_msgSend( (id)qword_100066EB8,  "setObject:forKey:",  v13,  objc_msgSend(objc_loadWeak((id *)(a1 + 40)), "getLastUsedDataFileNameDefaultsKey"));
        -[NSString writeToFile:atomically:encoding:error:]( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@%@",  objc_msgSend( objc_msgSend(v10, "objectForKeyedSubscript:", @"OrderedKeys"),  "componentsJoinedByString:",  @","),  @"\n"),  "writeToFile:atomically:encoding:error:",  v13,  1,  4,  0);
        goto LABEL_26;
      }

      if (os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_ERROR)) {
        sub_10003FDB0();
      }
    }

    else if (os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_ERROR))
    {
      sub_10003F960();
    }

    id v24 = 0LL;
    __int128 v12 = 0LL;
    uint64_t v2 = v27;
    goto LABEL_30;
  }

LABEL_26:
  __int128 v12 = +[NSFileHandle fileHandleForWritingAtPath:](&OBJC_CLASS___NSFileHandle, "fileHandleForWritingAtPath:", v13);
  -[NSFileHandle seekToEndOfFile](v12, "seekToEndOfFile");
  uint64_t v23 = +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@%@",  objc_msgSend( objc_msgSend( v10,  "objectsForKeys:notFoundMarker:",  objc_msgSend(v10, "objectForKeyedSubscript:", @"OrderedKeys"),  &stru_10005AC58),  "componentsJoinedByString:",  @","),  @"\n");
  *(void *)buf = 0LL;
  if (-[NSFileHandle writeData:error:]( v12,  "writeData:error:",  -[NSString dataUsingEncoding:](v23, "dataUsingEncoding:", 4LL),  buf))
  {
    uint64_t v2 = v27;
LABEL_28:
    id v24 = [v10 mutableCopy];
    [v24 removeObjectForKey:@"OrderedKeys"];
    [v24 removeObjectForKey:@"TimeStamp"];
    [objc_loadWeak((id *)(a1 + 40)) dataGroupName];
    [objc_loadWeak((id *)(a1 + 40)) collectionQueue];
    objc_msgSend( (id)qword_100066EB8,  "setObject:forKey:",  sub_10000B5B8(),  objc_msgSend(*(id *)(a1 + 32), "getLastDataLoggedTimestampDefaultsKey"));
    goto LABEL_30;
  }

  uint64_t v2 = v27;
  if (os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_ERROR)) {
    sub_100040078();
  }
  id v24 = 0LL;
LABEL_30:

  -[NSFileHandle closeFile](v12, "closeFile");
  if (v4) {

  }
  objc_autoreleasePoolPop(v2);
}

          if (v5 == ++v6) {
            goto LABEL_27;
          }
        }

        *(_WORD *)(v9 + 104) |= 2u;
        __int128 v10 = &dword_100068710;
LABEL_25:
        ++*v10;
        goto LABEL_26;
      }
    }
  }

void sub_1000101B0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
}

BOOL sub_1000101E8(id a1, unint64_t a2)
{
  uint64_t state64 = 0LL;
  notify_register_check("com.apple.system.powersources.timeremaining", &out_token);
  if (notify_is_valid_token(out_token))
  {
    notify_get_state(out_token, &state64);
    uint64_t v3 = (os_log_s *)qword_100067748;
    if (os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v9 = state64;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "kIOPSNotifyTimeRemaining state %llu",  buf,  0xCu);
    }

    notify_cancel(out_token);
    uint64_t v4 = state64;
  }

  else
  {
    if (os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_ERROR)) {
      sub_100040330();
    }
    uint64_t v4 = 0LL;
  }

  return (v4 & a2) != 0;
}

uint64_t sub_1000102F4(uint64_t a1)
{
  else {
    int v2 = 0;
  }
  return v2 | (*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

BOOL sub_100010340(id a1, unsigned __int8 a2)
{
  return a2 == 2;
}

void sub_10001034C(uint64_t a1, uint64_t a2)
{
}

void sub_10001035C(uint64_t a1)
{
}

void sub_100010368(uint64_t a1, uint64_t a2)
{
  int v3 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
  uint64_t v4 = +[NSDate now](&OBJC_CLASS___NSDate, "now");
  -[NSDate timeIntervalSinceDate:]( v4,  "timeIntervalSinceDate:",  *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL));
  double v6 = v5;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 48) + 16LL))())
  {
    uint64_t v7 = (os_log_s *)qword_100067748;
    if (os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 67109120;
      int v12 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Ignoring connection state %u",  (uint8_t *)&v11,  8u);
    }
  }

  else if (v3 != *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) && v6 > 2.0)
  {

    *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 4sub_100008A28(0LL, 0LL) = v4;
    *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = v3;
    uint64_t v9 = (os_log_s *)qword_100067748;
    if (os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL);
      int v11 = 67109120;
      int v12 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Connected state changed to %u",  (uint8_t *)&v11,  8u);
    }

    objc_msgSend( (id)qword_100066EB8,  "setObject:forKey:",  +[NSNumber numberWithUnsignedChar:]( NSNumber,  "numberWithUnsignedChar:",  *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)),  @"LastConnectedState");
    (*((void (**)(void))[*(id *)(a1 + 32) collectionEventHandler] + 2))();
  }

void sub_100010550(uint64_t a1, uint64_t a2)
{
  int v3 = (os_log_s *)qword_100067748;
  if (os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v7 = "com.apple.smartcharging.charging";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Received notification for %s.", buf, 0xCu);
  }

  uint64_t v4 = (dispatch_queue_s *)[*(id *)(a1 + 32) collectionQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100010644;
  block[3] = &unk_1000596C0;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(v4, block);
}

uint64_t sub_100010644(uint64_t a1)
{
  return (*((uint64_t (**)(void))[*(id *)(a1 + 32) collectionEventHandler] + 2))();
}

const void *sub_100010660(const __CFString *a1, uint64_t a2)
{
  uint64_t v4 = IOServiceMatching("AppleBTM");
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v4);
  if (MatchingService)
  {
    io_object_t v6 = MatchingService;
    if (a1)
    {
      CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(MatchingService, a1, kCFAllocatorDefault, 0);
      uint64_t v8 = CFProperty;
      if (CFProperty && CFGetTypeID(CFProperty) == a2) {
        goto LABEL_9;
      }
      if (os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_ERROR))
      {
        sub_100040388();
        if (!v8) {
          goto LABEL_9;
        }
      }

      else if (!v8)
      {
LABEL_9:
        IOObjectRelease(v6);
        return v8;
      }

      CFRelease(v8);
    }

    else if (os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_ERROR))
    {
      sub_10004035C();
    }

    uint64_t v8 = 0LL;
    goto LABEL_9;
  }

  if (os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_ERROR)) {
    sub_1000402AC();
  }
  return 0LL;
}

void sub_100010B44()
{
  qword_100067748 = (uint64_t)os_log_create("com.apple.powerd", "BDC");
  id v0 = (const __CFString *)sub_1000155E0();
  if (v0 && CFStringGetLength(v0))
  {
    qword_100066EC0 = objc_alloc_init(&OBJC_CLASS___BatteryDataCollectionManager);
    [(id)qword_100066EC0 start];
    uint64_t v1 = qword_100067748;
    if (!os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    if (qword_100066EC0) {
      int v2 = "started";
    }
    else {
      int v2 = "not started";
    }
    int v7 = 136315138;
    uint64_t v8 = v2;
    int v3 = "BDC %s";
    uint64_t v4 = (os_log_s *)v1;
    uint32_t v5 = 12;
  }

  else
  {
    uint64_t v6 = qword_100067748;
    if (!os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    LOWORD(v7) = 0;
    int v3 = "No battery serial number. Can't start BDC";
    uint64_t v4 = (os_log_s *)v6;
    uint32_t v5 = 2;
  }

  _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, v3, (uint8_t *)&v7, v5);
}

void sub_100010C74(_xpc_connection_s *a1, void *a2)
{
  uint64_t v4 = objc_autoreleasePoolPush();
  if (a1 && a2)
  {
    xpc_object_t reply = xpc_dictionary_create_reply(a2);
    if (reply)
    {
      uint64_t v6 = reply;
      if (sub_100038E28(a1, @"com.apple.private.bdc.tasking", 0))
      {
        if (qword_100066EC0 && qword_100066EB8)
        {
          id v7 = objc_msgSend(objc_msgSend((id)qword_100066EB8, "dictionaryRepresentation"), "mutableCopy");
          if (v7)
          {
            uint64_t v8 = v7;
            [v7 removeObjectForKey:@"BatterySerialNumber"];
            uint64_t v9 = _CFXPCCreateXPCObjectFromCFObject(v8);
            if (v9)
            {
              int v10 = (void *)v9;
              xpc_dictionary_set_int64(v6, "returnCode", 0LL);
              xpc_dictionary_set_value(v6, "BDCXPCCopyDefaults", v10);
              xpc_release(v10);
            }

            else
            {
              xpc_dictionary_set_int64(v6, "returnCode", -536870212LL);
              if (os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_ERROR)) {
                sub_10004044C();
              }
            }
          }

          else
          {
            xpc_dictionary_set_int64(v6, "returnCode", -536870160LL);
          }
        }

        else if (os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_ERROR))
        {
          sub_100040420();
        }
      }

      else
      {
        if (os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_ERROR)) {
          sub_100040478();
        }
        xpc_dictionary_set_uint64(v6, "returnCode", 0xFFFFFFFFE00002C1LL);
      }

      xpc_connection_send_message(a1, v6);
      xpc_release(v6);
    }

    else if (os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_ERROR))
    {
      sub_1000403F4();
    }
  }

  else if (os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_ERROR))
  {
    sub_1000404A4();
  }

  objc_autoreleasePoolPop(v4);
}

NSDictionary *__cdecl sub_100010E88(id a1, NSDictionary *a2)
{
  CFTypeID TypeID = CFArrayGetTypeID();
  obuint64_t j = (id)sub_100010660(@"BatteryData", TypeID);
  if (!obj)
  {
    double v17 = (os_log_s *)qword_100067748;
    if (os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_ERROR)) {
      sub_100040504(v17, v18, v19, v20, v21, v22, v23, v24);
    }
    goto LABEL_19;
  }

  int v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v4 = (os_log_s *)qword_100067748;
  if (!v3)
  {
    if (os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_ERROR)) {
      sub_100040574();
    }
LABEL_19:
    p_super = 0LL;
    goto LABEL_14;
  }

  p_super = &v3->super;
  if (os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_DEBUG)) {
    sub_1000405A0(obj, v4);
  }
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id v6 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v6)
  {
    id v7 = v6;
    id v8 = 0LL;
    uint64_t v9 = *(void *)v27;
    char v10 = 1;
    do
    {
      for (unint64_t i = 0LL; i != v7; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(obj);
        }
        int v12 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)i);
        if ((v10 & 1) != 0)
        {
          id v8 = [*(id *)(*((void *)&v26 + 1) + 8 * (void)i) objectForKeyedSubscript:@"Timestamp"];
          -[NSDictionary setObject:forKeyedSubscript:]( p_super,  "setObject:forKeyedSubscript:",  v8,  @"StartTimestamp");
        }

        unsigned int v13 = objc_msgSend(objc_msgSend(v12, "objectForKeyedSubscript:", @"Timestamp"), "unsignedLongLongValue");
        unint64_t v14 = (v13 - (_BYTE *)[v8 unsignedLongLongValue]) / 0xF4240uLL;
        id v15 = [v12 mutableCopy];
        [v15 removeObjectForKey:@"Timestamp"];
        -[NSDictionary setObject:forKeyedSubscript:]( p_super,  "setObject:forKeyedSubscript:",  v15,  +[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v14));

        char v10 = 0;
      }

      id v7 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
      char v10 = 0;
    }

    while (v7);
  }

NSDictionary *__cdecl sub_1000110CC(id a1, NSDictionary *a2)
{
  uint64_t v30 = 0LL;
  id v31 = &v30;
  uint64_t v32 = 0x3052000000LL;
  uint64_t v33 = sub_10001034C;
  id v34 = sub_10001035C;
  uint64_t v35 = 0LL;
  int v3 = dispatch_semaphore_create(0LL);
  uint64_t v4 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  uint32_t v5 = dispatch_queue_create("smartChargingQueue", v4);
  if (!v5)
  {
    if (os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_ERROR)) {
      sub_100040614();
    }
    goto LABEL_37;
  }

  id v6 = sub_10000B8A4("com.apple.powerui.bdcdata", v5);
  if (!v6)
  {
    if (os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_ERROR)) {
      sub_100040640();
    }
LABEL_37:
    id v6 = 0LL;
LABEL_38:
    id v8 = 0LL;
LABEL_9:
    int v12 = 0LL;
    goto LABEL_22;
  }

  xpc_object_t v7 = xpc_dictionary_create(0LL, 0LL, 0LL);
  id v8 = v7;
  if (!v7)
  {
    if (os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_ERROR)) {
      sub_10004066C();
    }
    goto LABEL_38;
  }

  xpc_dictionary_set_BOOL(v7, "currentSmartChargingStateRequest", 1);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_10001154C;
  handler[3] = &unk_100059868;
  void handler[4] = v3;
  void handler[5] = &v30;
  xpc_connection_send_message_with_reply(v6, v8, v5, handler);
  dispatch_time_t v9 = dispatch_time(0x8000000000000000LL, 10000000000LL);
  dispatch_semaphore_wait(v3, v9);
  char v10 = (void *)v31[5];
  if (!v10)
  {
    if (os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_ERROR)) {
      sub_100040698();
    }
    goto LABEL_9;
  }

  if (xpc_get_type(v10) != (xpc_type_t)&_xpc_type_dictionary)
  {
    int v11 = xpc_copy_description((xpc_object_t)v31[5]);
    if (os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_ERROR)) {
      sub_10003F874();
    }
    free(v11);
    goto LABEL_9;
  }

  id v13 = -[NSDictionary objectForKeyedSubscript:](a2, "objectForKeyedSubscript:", @"DataColumnNames");
  unint64_t v14 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v15 = (void *)_CFXPCCreateCFObjectFromXPCObject(v31[5]);
  if (os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_DEBUG)) {
    sub_1000406C4();
  }
  int v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v12,  "setObject:forKeyedSubscript:",  sub_10000B548(),  @"TimeStamp");
  -[NSMutableArray addObject:](v14, "addObject:", @"TimeStamp");
  uint64_t v23 = v6;
  uint64_t v24 = v3;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v16 = [v13 countByEnumeratingWithState:&v25 objects:v36 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v26;
    do
    {
      for (unint64_t i = 0LL; i != v16; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v26 != v17) {
          objc_enumerationMutation(v13);
        }
        uint64_t v19 = *(void *)(*((void *)&v25 + 1) + 8LL * (void)i);
        uint64_t v20 = (NSNull *)[v15 objectForKeyedSubscript:v19];
        if (!v20) {
          uint64_t v20 = +[NSNull null](&OBJC_CLASS___NSNull, "null");
        }
        -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v20, v19);
        -[NSMutableArray addObject:](v14, "addObject:", v19);
      }

      id v16 = [v13 countByEnumeratingWithState:&v25 objects:v36 count:16];
    }

    while (v16);
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v14, @"OrderedKeys");
  int v3 = v24;
  id v6 = v23;

LABEL_22:
  if (v3) {
    dispatch_release(v3);
  }
  uint64_t v21 = (void *)v31[5];
  if (v21) {
    xpc_release(v21);
  }
  if (v8) {
    xpc_release(v8);
  }
  if (v6)
  {
    xpc_connection_cancel(v6);
    xpc_release(v6);
  }

  if (v5) {
    dispatch_release(v5);
  }
  _Block_object_dispose(&v30, 8);
  return &v12->super;
}

void sub_10001150C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, char a27)
{
}

uint64_t sub_10001154C(uint64_t a1, xpc_object_t object)
{
  if (object)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 4sub_100008A28(0LL, 0LL) = xpc_copy(object);
  }

  else if (os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_ERROR))
  {
    sub_100040728();
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

NSDictionary *__cdecl sub_1000115B0(id a1, NSDictionary *a2)
{
  int v3 = (void *)sub_100015454();
  if (!v3)
  {
    if (os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_ERROR)) {
      sub_100040754();
    }
    goto LABEL_90;
  }

  __int128 v62 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  if (!v62)
  {
    if (os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_ERROR)) {
      sub_100040780();
    }
LABEL_90:
    __int128 v62 = 0LL;
    goto LABEL_85;
  }

  context = objc_autoreleasePoolPush();
  id v4 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  id v5 = -[NSDictionary objectForKeyedSubscript:](a2, "objectForKeyedSubscript:", @"DataColumnNames");
  if ([v5 count])
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v62,  "setObject:forKeyedSubscript:",  sub_10000B548(),  @"TimeStamp");
    [v4 addObject:@"TimeStamp"];
  }

  __int128 v69 = 0u;
  __int128 v70 = 0u;
  __int128 v67 = 0u;
  __int128 v68 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v67 objects:v79 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v68;
    id v59 = v5;
    __int128 v60 = v3;
    uint64_t v58 = *(void *)v68;
    do
    {
      dispatch_time_t v9 = 0LL;
      id v61 = v7;
      do
      {
        if (*(void *)v68 != v8) {
          objc_enumerationMutation(v5);
        }
        char v10 = *(NSNumber **)(*((void *)&v67 + 1) + 8LL * (void)v9);
        if ((-[NSNumber isEqualToString:](v10, "isEqualToString:", @"EEEE") & 1) != 0
          || -[NSNumber isEqualToString:](v10, "isEqualToString:", @"YWW"))
        {
          id v11 = sub_100011F50(v3, (uint64_t)@"Serial", 0LL);
          uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSString);
          if ((objc_opt_isKindOfClass(v11, v12) & 1) == 0)
          {
            uint64_t v18 = qword_100067748;
            if (!os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_ERROR)) {
              goto LABEL_82;
            }
            *(_DWORD *)buf = 138412290;
            double v75 = v10;
            id v15 = (os_log_s *)v18;
            id v16 = "Value for key %@ is not of string type";
            uint32_t v17 = 12;
            goto LABEL_18;
          }

          unsigned int v13 = [v11 length];
          if (v13 - 19 <= 0xFFFFFFFD)
          {
            uint64_t v14 = qword_100067748;
            if (!os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_ERROR)) {
              goto LABEL_82;
            }
            *(_DWORD *)buf = 67109120;
            LODWORD(v75) = v13;
            id v15 = (os_log_s *)v14;
            id v16 = "Unexpected battery serial length %u";
            uint32_t v17 = 8;
LABEL_18:
            _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, v16, buf, v17);
            goto LABEL_82;
          }

          if (-[NSNumber isEqualToString:](v10, "isEqualToString:", @"YWW"))
          {
            CFTypeRef cf = 0LL;
            if (IOPSGetYearAndWeekOfManufactureFromBatterySerial(v11, &cf))
            {
              uint64_t v23 = (NSNumber *)[(id)cf copy];
              CFRelease(cf);
              uint64_t v24 = (os_log_s *)qword_100067748;
              if (os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                double v75 = v23;
                _os_log_debug_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEBUG,  "Fetched yww from IOKit: %@",  buf,  0xCu);
              }

              goto LABEL_75;
            }

            __int16 v45 = (os_log_s *)qword_100067748;
            if (os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_ERROR)) {
              sub_1000407AC(&v71, v72, v45);
            }
LABEL_57:
            uint64_t v23 = 0LL;
            goto LABEL_75;
          }

          if (!-[NSNumber isEqualToString:](v10, "isEqualToString:", @"EEEE"))
          {
            id v44 = (os_log_s *)qword_100067748;
            if (os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              double v75 = v10;
              _os_log_error_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "Unsupported key %@", buf, 0xCu);
            }

            goto LABEL_57;
          }

          if ([v11 length] == (id)17)
          {
            uint64_t v39 = 4LL;
            goto LABEL_65;
          }

          if ([v11 length] == (id)18)
          {
            uint64_t v39 = 7LL;
LABEL_65:
            uint64_t v23 = (NSNumber *)objc_msgSend(v11, "substringWithRange:", 11, v39);
          }

          else
          {
            uint64_t v23 = 0LL;
          }

          __int128 v54 = (os_log_s *)qword_100067748;
          if (os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            double v75 = v23;
            _os_log_impl( (void *)&_mh_execute_header,  v54,  OS_LOG_TYPE_DEFAULT,  "Extracted engineering code %@",  buf,  0xCu);
          }

LABEL_75:
          [v4 addObject:v10];
          uint64_t v22 = v62;
          uint64_t v21 = v23;
LABEL_76:
          -[NSMutableDictionary setObject:forKeyedSubscript:](v22, "setObject:forKeyedSubscript:", v21, v10);
          goto LABEL_82;
        }

        if (-[NSNumber isEqualToString:](v10, "isEqualToString:", @"BatteryAuth"))
        {
          uint64_t v19 = sub_10000B490();
          uint64_t v20 = (os_log_s *)qword_100067748;
          if (os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v75) = v19;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Read battery auth state %d", buf, 8u);
          }

          [v4 addObject:v10];
          uint64_t v21 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v19);
          uint64_t v22 = v62;
          goto LABEL_76;
        }

        CFTypeRef cf = 0LL;
        __int128 v25 = (NSMutableString *)sub_100011F50(v3, (uint64_t)v10, (NSError **)&cf);
        if (v25) {
          BOOL v26 = 1;
        }
        else {
          BOOL v26 = cf == 0LL;
        }
        if (v26)
        {
          __int128 v27 = v25;
          if ([(id)qword_100066EE0 containsObject:v10])
          {
            uint64_t v28 = objc_opt_class(&OBJC_CLASS___NSArray);
            if ((objc_opt_isKindOfClass(v27, v28) & 1) == 0)
            {
              uint64_t v49 = qword_100067748;
              if (!os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_ERROR)) {
                goto LABEL_81;
              }
              *(_DWORD *)buf = 138412290;
              double v75 = v10;
              double v42 = (os_log_s *)v49;
              uint64_t v43 = "Value for key %@ is not an array type";
              goto LABEL_68;
            }

            __int128 v65 = 0u;
            __int128 v66 = 0u;
            __int128 v63 = 0u;
            __int128 v64 = 0u;
            id v29 = -[NSMutableString countByEnumeratingWithState:objects:count:]( v27,  "countByEnumeratingWithState:objects:count:",  &v63,  v78,  16LL);
            if (!v29) {
              goto LABEL_81;
            }
            id v30 = v29;
            uint64_t v31 = 0LL;
            uint64_t v32 = *(void *)v64;
            while (2)
            {
              uint64_t v33 = 0LL;
LABEL_37:
              if (*(void *)v64 != v32) {
                objc_enumerationMutation(v27);
              }
              id v34 = *(NSMutableString **)(*((void *)&v63 + 1) + 8 * v33);
              id v35 = -[NSNumber stringByAppendingFormat:](v10, "stringByAppendingFormat:", @"%d", v31 + v33);
              uint64_t v36 = objc_opt_class(&OBJC_CLASS___NSData);
              if ((objc_opt_isKindOfClass(v34, v36) & 1) != 0)
              {
                uint64_t v37 = (uint64_t)-[NSNumber isEqualToString:](v10, "isEqualToString:", @"RaTableRaw");
                if ((v37 & 1) != 0)
                {
                  id v34 = sub_100011EAC(v37, v34);
                  goto LABEL_42;
                }

                __int128 v38 = (os_log_s *)qword_100067748;
                if (os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  double v75 = v10;
                  _os_log_error_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_ERROR,  "Unhandled NSData for key %@",  buf,  0xCu);
                }
              }

              else
              {
LABEL_42:
                -[NSMutableDictionary setObject:forKeyedSubscript:](v62, "setObject:forKeyedSubscript:", v34, v35);
                [v4 addObject:v35];
              }

              if (v30 == (id)++v33)
              {
                id v30 = -[NSMutableString countByEnumeratingWithState:objects:count:]( v27,  "countByEnumeratingWithState:objects:count:",  &v63,  v78,  16LL);
                uint64_t v31 = (v31 + v33);
                if (!v30) {
                  goto LABEL_81;
                }
                continue;
              }

              goto LABEL_37;
            }
          }

          if ((-[NSNumber isEqualToString:](v10, "isEqualToString:", @"TimeAtHighSoc") & 1) != 0
            || -[NSNumber isEqualToString:](v10, "isEqualToString:", @"LowVoltageResidencyCounters"))
          {
            uint64_t v46 = objc_opt_class(&OBJC_CLASS___NSData);
            uint64_t isKindOfClass = objc_opt_isKindOfClass(v27, v46);
            if ((isKindOfClass & 1) == 0)
            {
              __int128 v51 = (objc_class *)objc_opt_class(v27);
              NSURLResourceKey v52 = NSStringFromClass(v51);
              uint64_t v53 = qword_100067748;
              if (!os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_ERROR)) {
                goto LABEL_81;
              }
              *(_DWORD *)buf = 138412546;
              double v75 = (NSNumber *)v52;
              __int16 v76 = 2112;
              CFTypeID v77 = v10;
              double v42 = (os_log_s *)v53;
              uint64_t v43 = "Unexpected class type %@ for key %@. Expected NSData";
              uint32_t v50 = 22;
LABEL_69:
              _os_log_error_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, v43, buf, v50);
              goto LABEL_81;
            }

            unsigned int v48 = sub_100011EAC(isKindOfClass, v27);
LABEL_62:
            __int128 v27 = v48;
          }

          else if (-[NSNumber isEqualToString:](v10, "isEqualToString:", @"WeightedRa"))
          {
            uint64_t v55 = objc_opt_class(&OBJC_CLASS___NSArray);
            if ((objc_opt_isKindOfClass(v27, v55) & 1) != 0)
            {
              unsigned int v48 = (NSMutableString *)-[NSMutableString firstObject](v27, "firstObject");
              goto LABEL_62;
            }
          }

          -[NSMutableDictionary setObject:forKeyedSubscript:](v62, "setObject:forKeyedSubscript:", v27, v10);
          [v4 addObject:v10];
          goto LABEL_81;
        }

        uint64_t v40 = qword_100067748;
        if (os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          double v75 = v10;
          double v42 = (os_log_s *)v40;
          uint64_t v43 = "Nil value for key %@";
LABEL_68:
          uint32_t v50 = 12;
          goto LABEL_69;
        }

LABEL_81:
        id v5 = v59;
        int v3 = v60;
        id v7 = v61;
        uint64_t v8 = v58;
LABEL_82:
        dispatch_time_t v9 = (char *)v9 + 1;
      }

      while (v9 != v7);
      id v7 = [v5 countByEnumeratingWithState:&v67 objects:v79 count:16];
    }

    while (v7);
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:](v62, "setObject:forKeyedSubscript:", v4, @"OrderedKeys");
  objc_autoreleasePoolPop(context);
LABEL_85:

  return &v62->super;
}

NSMutableString *sub_100011EAC(uint64_t a1, void *a2)
{
  int v3 = +[NSMutableString stringWithCapacity:]( NSMutableString,  "stringWithCapacity:",  2 * (void)[a2 length]);
  id v4 = (unsigned __int8 *)[a2 bytes];
  if ([a2 length])
  {
    unint64_t v5 = 0LL;
    do
      -[NSMutableString appendFormat:](v3, "appendFormat:", @"%02x", v4[v5++]);
    while ((unint64_t)[a2 length] > v5);
  }

  return v3;
}

id sub_100011F50(void *a1, uint64_t a2, NSError **a3)
{
  if (a1 && a2)
  {
    id v5 = a1;
    id v6 = [(id)qword_100066ED8 objectForKeyedSubscript:a2];
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    id v7 = [v6 countByEnumeratingWithState:&v13 objects:v19 count:16];
    if (!v7) {
      return [v5 objectForKeyedSubscript:a2];
    }
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (unint64_t i = 0LL; i != v8; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        id v5 = [v5 objectForKeyedSubscript:*(void *)(*((void *)&v13 + 1) + 8 * (void)i)];
      }

      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v19 count:16];
    }

    while (v8);
    if (v5) {
      return [v5 objectForKeyedSubscript:a2];
    }
  }

  if (!a3) {
    return 0LL;
  }
  NSErrorUserInfoKey v17 = NSUnderlyingErrorKey;
  uint64_t v18 = @"key not found";
  uint64_t v12 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  14LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v18,  &v17,  1LL));
  id result = 0LL;
  *a3 = v12;
  return result;
}

void sub_1000120E4(uint64_t a1, int token)
{
  uint64_t state64 = 0LL;
  notify_get_state(token, &state64);
  int v3 = (os_log_s *)qword_100067748;
  if (os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    __int128 v14 = "com.apple.powerd.bdc.get_current_time";
    __int16 v15 = 2048;
    uint64_t v16 = state64;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Received notification for %s. Value set to %lld\n",  buf,  0x16u);
  }

  id v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472LL;
  uint64_t v9 = sub_1000122AC;
  char v10 = &unk_100059400;
  LODWORD(v11) = *(_DWORD *)(a1 + 32);
  if (qword_100066EF8 != -1) {
    dispatch_once(&qword_100066EF8, &v7);
  }
  if (notify_is_valid_token(dword_100066900))
  {
    -[NSDate timeIntervalSince1970](sub_10000B5B8(), "timeIntervalSince1970", v7, v8, v9, v10, v11);
    unint64_t v5 = (unint64_t)v4;
    notify_set_state(dword_100066900, (unint64_t)v4);
    notify_post("com.apple.powerd.bdc.current_time");
    id v6 = (os_log_s *)qword_100067748;
    if (os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      __int128 v14 = (const char *)v5;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Sent current time notification %llu",  buf,  0xCu);
    }
  }

  else if (os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_ERROR))
  {
    sub_1000407E8();
  }

void sub_1000122AC(uint64_t a1)
{
  if (notify_register_check("com.apple.powerd.bdc.current_time", &dword_100066900))
  {
    int v2 = (os_log_s *)qword_100067748;
    if (os_log_type_enabled((os_log_t)qword_100067748, OS_LOG_TYPE_ERROR)) {
      sub_100040814(a1, v2, v3, v4, v5, v6, v7, v8);
    }
  }

void sub_100012308(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

  ;
}

  ;
}

void sub_100012344(uint64_t a1@<X8>)
{
  *(void *)(v1 - _Block_object_dispose(va, 8) = a1;
}

void sub_100012350(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

void sub_10001235C(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

uint64_t sub_100012368()
{
  values = 0LL;
  keys = 0LL;
  id v0 = (os_log_s *)qword_100066F00;
  if (!qword_100066F00)
  {
    id v0 = os_log_create("com.apple.powerd", "prefs");
    qword_100066F00 = (uint64_t)v0;
  }

  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "Looking for MDM prefs\n", buf, 2u);
  }

  uint64_t v1 = 3758097088LL;
  CFStringRef v2 = CFStringCreateWithFormat( kCFAllocatorDefault,  0LL,  @"%@/%@.plist",  @"/Library/Managed Preferences/mobile",  @"com.apple.powerd.managed");
  if (v2)
  {
    CFStringRef v3 = v2;
    uint64_t v4 = -[NSDictionary initWithContentsOfFile:](objc_alloc(&OBJC_CLASS___NSDictionary), "initWithContentsOfFile:", v2);
    if (!v4)
    {
      __int16 v15 = (os_log_s *)qword_100066F00;
      if (os_log_type_enabled((os_log_t)qword_100066F00, OS_LOG_TYPE_ERROR)) {
        sub_10004087C(v15, v16, v17, v18, v19, v20, v21, v22);
      }
      uint64_t v23 = v3;
      goto LABEL_39;
    }

    uint64_t v5 = (const __CFDictionary *)v4;
    if (CFDictionaryContainsKey((CFDictionaryRef)v4, @"CriticalAcOverride"))
    {
      int valuePtr = -1;
      if (CFDictionaryGetValueIfPresent(v5, @"CriticalAcOverride", (const void **)buf))
      {
        CFNumberRef v6 = *(CFNumberRef *)buf;
        CFTypeID TypeID = CFNumberGetTypeID();
        if (v6)
        {
          if (CFGetTypeID(v6) == TypeID) {
            CFNumberGetValue(*(CFNumberRef *)buf, kCFNumberIntType, &valuePtr);
          }
        }
      }

      uint64_t v8 = (os_log_s *)qword_100066F00;
      if (os_log_type_enabled((os_log_t)qword_100066F00, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = valuePtr;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "CriticalAcOverrideKey found %d in prefs\n",  buf,  8u);
      }

      keys = (void *)CFStringCreateWithCString(kCFAllocatorDefault, "CriticalAcOverride", 0x8000100u);
      if (valuePtr >= 1) {
        uint64_t v9 = (void **)&kCFBooleanTrue;
      }
      else {
        uint64_t v9 = (void **)&kCFBooleanFalse;
      }
      values = *v9;
      CFDictionaryRef v10 = CFDictionaryCreate( kCFAllocatorDefault,  (const void **)&keys,  (const void **)&values,  1LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
      if (v10)
      {
        CFDictionaryRef v11 = v10;
        io_registry_entry_t v12 = sub_10000AD58();
        if (v12)
        {
          uint64_t v1 = IORegistryEntrySetCFProperties(v12, v11);
          if ((_DWORD)v1)
          {
            __int128 v13 = (os_log_s *)qword_100066F00;
            if (os_log_type_enabled((os_log_t)qword_100066F00, OS_LOG_TYPE_ERROR)) {
              sub_10004090C(v1, v13);
            }
          }
        }

        else
        {
          uint64_t v32 = (os_log_s *)qword_100066F00;
          if (os_log_type_enabled((os_log_t)qword_100066F00, OS_LOG_TYPE_ERROR)) {
            sub_1000408DC(v32, v33, v34, v35, v36, v37, v38, v39);
          }
        }
      }

      else
      {
        uint64_t v24 = (os_log_s *)qword_100066F00;
        uint64_t v1 = 3758097085LL;
        if (os_log_type_enabled((os_log_t)qword_100066F00, OS_LOG_TYPE_ERROR)) {
          sub_1000408AC(v24, v25, v26, v27, v28, v29, v30, v31);
        }
        CFDictionaryRef v11 = 0LL;
      }
    }

    else
    {
      CFDictionaryRef v11 = 0LL;
      uint64_t v1 = 3758097095LL;
    }

    CFRelease(v3);
    CFRelease(v5);
    if (keys) {
      CFRelease(keys);
    }
    if (values) {
      CFRelease(values);
    }
    if (v11)
    {
      uint64_t v23 = v11;
LABEL_39:
      CFRelease(v23);
    }
  }

  else
  {
    __int128 v14 = (os_log_s *)qword_100066F00;
    uint64_t v1 = 3758097095LL;
    if (os_log_type_enabled((os_log_t)qword_100066F00, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "No managed preferences found\n", buf, 2u);
    }
  }

  return v1;
}

__CFDictionary *sub_1000126E0(const void *a1)
{
  CFAbsoluteTime at = 0.0;
  uint64_t v29 = 0LL;
  uint64_t v30 = 0LL;
  if (CFEqual(a1, @"sleep") || CFEqual(a1, @"shutdown") || CFEqual(a1, @"restart"))
  {
    CFStringRef v2 = &qword_100066F08;
  }

  else
  {
    if (!CFEqual(a1, @"poweron") && !CFEqual(a1, @"wake")) {
      return 0LL;
    }
    CFStringRef v2 = &qword_100066F10;
  }

  CFStringRef v3 = (const __CFDictionary *)*v2;
  uint64_t v4 = sub_100012A84((const __CFDictionary *)*v2);
  if (!CFEqual(a1, v4)
    && (!CFEqual(v4, @"wakepoweron") || !CFEqual(a1, @"poweron") && !CFEqual(a1, @"wake")))
  {
    return 0LL;
  }

  CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(0LL, 0LL, v3);
  if (MutableCopy)
  {
    CFNumberRef v6 = sub_10000ADF0();
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    CFCalendarDecomposeAbsoluteTime(v6, Current, "E", &v29);
    if ((_DWORD)v29 == 1) {
      int v8 = 7;
    }
    else {
      int v8 = v29 - 1;
    }
    LODWORD(v29) = v8;
    Value = (const __CFNumber *)CFDictionaryGetValue(v3, @"weekdays");
    CFNumberGetValue(Value, kCFNumberIntType, &valuePtr);
    unsigned int v10 = LODWORD(valuePtr);
    if (LODWORD(valuePtr))
    {
      if (!v3) {
        goto LABEL_14;
      }
      CFDictionaryRef v11 = (const __CFNumber *)CFDictionaryGetValue(v3, @"weekdays");
      CFNumberGetValue(v11, kCFNumberIntType, &valuePtr);
      if (((LODWORD(valuePtr) >> (v8 - 1)) & 1) == 0) {
        goto LABEL_14;
      }
      io_registry_entry_t v12 = sub_10000ADF0();
      CFAbsoluteTime v13 = CFAbsoluteTimeGetCurrent();
      CFCalendarDecomposeAbsoluteTime(v12, v13, "Hm", &v34, &v33);
      int v14 = v33 + 60 * v34;
      __int16 v15 = (const __CFNumber *)CFDictionaryGetValue(v3, @"time");
      CFNumberGetValue(v15, kCFNumberIntType, &valuePtr);
      if (60 * LODWORD(valuePtr) >= (60 * v14 + 5))
      {
        uint64_t v19 = 0LL;
      }

      else
      {
LABEL_14:
        int v16 = v8;
        do
        {
          int v17 = v16 % 7;
          int v16 = v16 % 7 + 1;
        }

        while (((v10 >> v17) & 1) == 0);
        unsigned int v18 = (v17 - v8 + 8) % 7;
        if (v18) {
          uint64_t v19 = v18;
        }
        else {
          uint64_t v19 = 7LL;
        }
      }
    }

    else
    {
      uint64_t v19 = 0xFFFFFFFFLL;
    }

    CFAbsoluteTime valuePtr = CFAbsoluteTimeGetCurrent();
    uint64_t v20 = sub_10000ADF0();
    CFCalendarAddComponents(v20, &valuePtr, 0LL, "d", v19);
    uint64_t v21 = sub_10000ADF0();
    CFCalendarDecomposeAbsoluteTime(v21, valuePtr, "yMd", (char *)&v30 + 4, &v30, (char *)&v29 + 4);
    uint64_t v22 = (const __CFNumber *)CFDictionaryGetValue(v3, @"time");
    CFNumberGetValue(v22, kCFNumberIntType, &v34);
    uint64_t v23 = (v34 / 60);
    uint64_t v24 = (v34 % 60);
    uint64_t v25 = sub_10000ADF0();
    CFCalendarComposeAbsoluteTime(v25, &at, "yMdHms", HIDWORD(v30), v30, HIDWORD(v29), v23, v24, 0LL);
    CFDateRef v26 = CFDateCreate(0LL, at);
    if (v26)
    {
      CFDateRef v27 = v26;
      CFDictionarySetValue(MutableCopy, @"time", v26);
      CFDictionarySetValue(MutableCopy, @"scheduledby", @"Repeating");
      CFRelease(v27);
    }
  }

  return MutableCopy;
}

CFStringRef sub_100012A84(const __CFDictionary *a1)
{
  uint64_t v1 = &stru_10005AC58;
  if (a1)
  {
    Value = CFDictionaryGetValue(a1, @"eventtype");
    CFTypeID TypeID = CFStringGetTypeID();
    if (Value)
    {
      if (CFGetTypeID(Value) == TypeID) {
        uint64_t v4 = Value;
      }
      else {
        uint64_t v4 = 0LL;
      }
    }

    else
    {
      uint64_t v4 = 0LL;
    }

    if (v4) {
      return (const __CFString *)v4;
    }
  }

  return v1;
}

void sub_100012AF0()
{
  SCPreferencesRef v0 = SCPreferencesCreate(0LL, @"PM-configd-AutoWake", @"com.apple.AutoWake.xml");
  if (v0)
  {
    uint64_t v1 = v0;
    if (qword_100066F08) {
      CFRelease((CFTypeRef)qword_100066F08);
    }
    if (qword_100066F10) {
      CFRelease((CFTypeRef)qword_100066F10);
    }
    Value = (const __CFDictionary *)SCPreferencesGetValue(v1, @"RepeatingPowerOff");
    if (Value)
    {
      CFStringRef v3 = Value;
      CFTypeID TypeID = CFDictionaryGetTypeID();
      if (CFGetTypeID(v3) == TypeID) {
        qword_100066F08 = (uint64_t)CFDictionaryCreateMutableCopy(0LL, 0LL, v3);
      }
    }

    uint64_t v5 = (const __CFDictionary *)SCPreferencesGetValue(v1, @"RepeatingPowerOn");
    if (v5)
    {
      CFNumberRef v6 = v5;
      CFTypeID v7 = CFDictionaryGetTypeID();
      if (CFGetTypeID(v6) == v7) {
        qword_100066F10 = (uint64_t)CFDictionaryCreateMutableCopy(0LL, 0LL, v6);
      }
    }

    CFRelease(v1);
  }

uint64_t sub_100012BF8(uint64_t a1, _OWORD *a2, const UInt8 *a3, unsigned int a4, uint64_t a5, _DWORD *a6)
{
  SCPreferencesRef prefs = 0LL;
  *a6 = 0;
  __int128 v9 = a2[1];
  *(_OWORD *)atoken.val = *a2;
  *(_OWORD *)&atoken.val[4] = v9;
  audit_token_to_au32(&atoken, 0LL, &euidp, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  unsigned int v10 = CFDataCreate(0LL, a3, a4);
  if (v10)
  {
    CFDictionaryRef v11 = v10;
    io_registry_entry_t v12 = (const __CFDictionary *)CFPropertyListCreateWithData(0LL, v10, 0LL, 0LL, 0LL);
    if (v12)
    {
      CFAbsoluteTime v13 = v12;
      Value = (const __CFDictionary *)CFDictionaryGetValue(v12, @"RepeatingPowerOff");
      CFTypeID TypeID = CFDictionaryGetTypeID();
      if (Value)
      {
        if (CFGetTypeID(Value) == TypeID) {
          int v16 = Value;
        }
        else {
          int v16 = 0LL;
        }
      }

      else
      {
        int v16 = 0LL;
      }

      int v17 = (const __CFDictionary *)CFDictionaryGetValue(v13, @"RepeatingPowerOn");
      CFTypeID v18 = CFDictionaryGetTypeID();
      if (v17)
      {
        if (CFGetTypeID(v17) == v18) {
          uint64_t v19 = v17;
        }
        else {
          uint64_t v19 = 0LL;
        }
      }

      else
      {
        uint64_t v19 = 0LL;
      }

      if (sub_100012F18(v16) && (sub_100012F18(v19) & 1) != 0)
      {
        int v20 = sub_1000144BC();
        *a6 = v20;
        if (!v20)
        {
          CFTypeRef cf = sub_100012A84((const __CFDictionary *)qword_100066F08);
          CFRetain(cf);
          uint64_t v21 = sub_100012A84((const __CFDictionary *)qword_100066F10);
          CFRetain(v21);
          uint64_t v22 = (const void *)qword_100066F08;
          if (qword_100066F08)
          {
            CFTypeID v23 = CFDictionaryGetTypeID();
            if (CFGetTypeID(v22) == v23) {
              CFRelease((CFTypeRef)qword_100066F08);
            }
          }

          uint64_t v24 = (const void *)qword_100066F10;
          if (qword_100066F10)
          {
            CFTypeID v25 = CFDictionaryGetTypeID();
            if (CFGetTypeID(v24) == v25) {
              CFRelease((CFTypeRef)qword_100066F10);
            }
          }

          qword_100066F10 = 0LL;
          qword_100066F08 = 0LL;
          if (v16) {
            qword_100066F08 = (uint64_t)CFDictionaryCreateMutableCopy(0LL, 0LL, v16);
          }
          if (v19) {
            qword_100066F10 = (uint64_t)CFDictionaryCreateMutableCopy(0LL, 0LL, v19);
          }
          int v26 = sub_100013074(prefs);
          *a6 = v26;
          if (!v26)
          {
            CFDateRef v27 = sub_100012A84((const __CFDictionary *)qword_100066F08);
            uint64_t v28 = sub_100012A84((const __CFDictionary *)qword_100066F10);
            sub_100013F60(cf);
            sub_100013F60(v21);
            if (!CFEqual(cf, v27)) {
              sub_100013F60(v27);
            }
            if (!CFEqual(v21, v28)) {
              sub_100013F60(v28);
            }
          }

          CFRelease(cf);
          CFRelease(v21);
        }
      }

      else
      {
        syslog(6, "PMCFGD: Invalid formatted repeating power event dictionary\n");
        *a6 = -536870206;
      }

      CFRelease(v11);
      CFRelease(v13);
      unsigned int v10 = prefs;
    }

    else
    {
      *a6 = -536870206;
      CFRelease(v11);
      unsigned int v10 = 0LL;
    }
  }

  else
  {
    *a6 = -536870206;
  }

  nullsub_4(v10, 1LL);
  vm_deallocate(mach_task_self_, (vm_address_t)a3, a4);
  return 0LL;
}

uint64_t sub_100012F18(const void *a1)
{
  if (!a1) {
    return 1LL;
  }
  CFTypeID TypeID = CFDictionaryGetTypeID();
  if (CFGetTypeID(a1) != TypeID) {
    return 0LL;
  }
  Value = CFDictionaryGetValue((CFDictionaryRef)a1, @"time");
  CFTypeID v4 = CFNumberGetTypeID();
  if (!Value) {
    return 0LL;
  }
  if (CFGetTypeID(Value) != v4) {
    return 0LL;
  }
  uint64_t v5 = CFDictionaryGetValue((CFDictionaryRef)a1, @"weekdays");
  CFTypeID v6 = CFNumberGetTypeID();
  if (!v5) {
    return 0LL;
  }
  if (CFGetTypeID(v5) != v6) {
    return 0LL;
  }
  CFTypeID v7 = CFDictionaryGetValue((CFDictionaryRef)a1, @"eventtype");
  CFTypeID v8 = CFStringGetTypeID();
  if (!v7 || CFGetTypeID(v7) != v8) {
    return 0LL;
  }
  if (CFEqual(v7, @"sleep")) {
    return 1LL;
  }
  if (CFEqual(v7, @"shutdown")) {
    return 1LL;
  }
  if (CFEqual(v7, @"wakepoweron")) {
    return 1LL;
  }
  if (CFEqual(v7, @"poweron")) {
    return 1LL;
  }
  if (CFEqual(v7, @"wake")) {
    return 1LL;
  }
  uint64_t result = CFEqual(v7, @"restart");
  if ((_DWORD)result) {
    return 1LL;
  }
  return result;
}

uint64_t sub_100013074(SCPreferencesRef prefs)
{
  uint64_t v2 = 3758097084LL;
  if (qword_100066F10)
  {
    if (!SCPreferencesSetValue(prefs, @"RepeatingPowerOn", (CFPropertyListRef)qword_100066F10)) {
      return v2;
    }
  }

  else
  {
    SCPreferencesRemoveValue(prefs, @"RepeatingPowerOn");
  }

  if (qword_100066F08)
  {
    if (!SCPreferencesSetValue(prefs, @"RepeatingPowerOff", (CFPropertyListRef)qword_100066F08)) {
      return v2;
    }
  }

  else
  {
    SCPreferencesRemoveValue(prefs, @"RepeatingPowerOff");
  }

  if (SCPreferencesCommitChanges(prefs)) {
    return 0LL;
  }
  else {
    return 3758097084LL;
  }
}

uint64_t sub_100013114(uint64_t a1, _OWORD *a2, _DWORD *a3)
{
  SCPreferencesRef prefs = 0LL;
  *a3 = 0;
  __int128 v4 = a2[1];
  *(_OWORD *)atoken.val = *a2;
  *(_OWORD *)&atoken.val[4] = v4;
  audit_token_to_au32(&atoken, 0LL, &euidp, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  int v5 = sub_1000144BC();
  *a3 = v5;
  if (!v5)
  {
    CFTypeID v6 = sub_100012A84((const __CFDictionary *)qword_100066F08);
    CFRetain(v6);
    CFTypeID v7 = sub_100012A84((const __CFDictionary *)qword_100066F10);
    CFRetain(v7);
    CFTypeID v8 = (const void *)qword_100066F08;
    if (qword_100066F08)
    {
      CFTypeID TypeID = CFDictionaryGetTypeID();
      if (CFGetTypeID(v8) == TypeID) {
        CFRelease((CFTypeRef)qword_100066F08);
      }
    }

    unsigned int v10 = (const void *)qword_100066F10;
    if (qword_100066F10)
    {
      CFTypeID v11 = CFDictionaryGetTypeID();
      if (CFGetTypeID(v10) == v11) {
        CFRelease((CFTypeRef)qword_100066F10);
      }
    }

    qword_100066F10 = 0LL;
    qword_100066F08 = 0LL;
    int v12 = sub_100013074(prefs);
    *a3 = v12;
    if (!v12)
    {
      sub_100013F60(v6);
      sub_100013F60(v7);
    }

    CFRelease(v6);
    CFRelease(v7);
  }

  nullsub_4(prefs, 1LL);
  return 0LL;
}

__CFDictionary *sub_100013260()
{
  CFMutableArrayRef Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  2LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  uint64_t v1 = (const void *)qword_100066F10;
  if (qword_100066F10)
  {
    CFTypeID TypeID = CFDictionaryGetTypeID();
    if (CFGetTypeID(v1) == TypeID) {
      CFDictionaryAddValue(Mutable, @"RepeatingPowerOn", (const void *)qword_100066F10);
    }
  }

  CFStringRef v3 = (const void *)qword_100066F08;
  if (qword_100066F08)
  {
    CFTypeID v4 = CFDictionaryGetTypeID();
    if (CFGetTypeID(v3) == v4) {
      CFDictionaryAddValue(Mutable, @"RepeatingPowerOff", (const void *)qword_100066F08);
    }
  }

  return Mutable;
}

uint64_t sub_10001331C()
{
  if (!qword_100066F18)
  {
    uint64_t v1 = MGCopyAnswer(@"DeviceClass", 0LL);
    qword_100066F18 = v1;
    if (v1)
    {
      uint64_t v2 = v1;
      if (os_log_type_enabled(0LL, OS_LOG_TYPE_DEFAULT))
      {
        int v3 = 138412290;
        uint64_t v4 = v2;
        _os_log_impl((void *)&_mh_execute_header, 0LL, OS_LOG_TYPE_DEFAULT, "Device class: %@", (uint8_t *)&v3, 0xCu);
      }
    }

    else if (os_log_type_enabled(0LL, OS_LOG_TYPE_ERROR))
    {
      sub_10004097C();
    }
  }

  return qword_100066F18;
}

uint64_t sub_1000133F0()
{
  uint64_t result = sub_10001331C();
  if (result)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100013474;
    block[3] = &unk_1000596C0;
    void block[4] = result;
    if (qword_100066F20 != -1) {
      dispatch_once(&qword_100066F20, block);
    }
    return byte_100066F28 != 0;
  }

  return result;
}

id sub_100013474(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) isEqualToString:@"iPhone"];
  byte_100066F28 = (char)result;
  return result;
}

uint64_t sub_10001349C()
{
  uint64_t result = sub_10001331C();
  if (result)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100013520;
    block[3] = &unk_1000596C0;
    void block[4] = result;
    if (qword_100066F30 != -1) {
      dispatch_once(&qword_100066F30, block);
    }
    return byte_100066F38 != 0;
  }

  return result;
}

id sub_100013520(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) isEqualToString:@"iPad"];
  byte_100066F38 = (char)result;
  return result;
}

uint64_t sub_100013548()
{
  uint64_t result = sub_10001331C();
  if (result)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000135CC;
    block[3] = &unk_1000596C0;
    void block[4] = result;
    if (qword_100066F40 != -1) {
      dispatch_once(&qword_100066F40, block);
    }
    return byte_100066F48 != 0;
  }

  return result;
}

id sub_1000135CC(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) isEqualToString:@"Watch"];
  byte_100066F48 = (char)result;
  return result;
}

uint64_t sub_1000135F4()
{
  os_log_t v0 = os_log_create("com.apple.powerd", "wakeRequests");
  uint64_t v1 = 0LL;
  qword_100067750 = (uint64_t)v0;
  do
  {
    uint64_t v2 = *(_UNKNOWN **)((char *)&off_100066908 + v1);
    v2[2] = 0uLL;
    v2[3] = 0uLL;
    *uint64_t v2 = 0uLL;
    v2[1] = 0uLL;
    v1 += 8LL;
  }

  while (v1 != 48);
  qword_1000678B0 = (uint64_t)@"wakepoweron";
  qword_100067770 = (uint64_t)@"sleep";
  qword_1000677B0 = (uint64_t)@"shutdown";
  qword_1000677F0 = (uint64_t)@"restart";
  qword_100067840 = (uint64_t)nullsub_3;
  qword_100067780 = (uint64_t)sub_100013840;
  qword_1000677C0 = (uint64_t)j_nullsub_4;
  qword_100067800 = (uint64_t)j_nullsub_4_0;
  qword_100067888 = (uint64_t)sub_100013988;
  unk_100067890 = sub_100013988;
  qword_100067870 = (uint64_t)@"poweron";
  unk_100067878 = &unk_100067898;
  qword_100067830 = (uint64_t)@"wake";
  *(void *)algn_100067838 = &unk_100067898;
  sub_100012AF0();
  for (uint64_t i = 0LL; i != 6; ++i)
  {
    uint64_t v4 = (uint64_t)*(&off_100066908 + i);
    if (v4)
    {
      sub_1000139AC((uint64_t *)*(&off_100066908 + i));
      if (*(void *)v4)
      {
        CFIndex Count = CFArrayGetCount(*(CFArrayRef *)v4);
        if (Count >= 1)
        {
          unint64_t v6 = Count + 1;
          do
          {
            ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(*(CFArrayRef *)v4, v6 - 2);
            Value = CFDictionaryGetValue(ValueAtIndex, @"scheduledby");
            if (CFEqual(Value, @"Repeating"))
            {
              __int128 v9 = *(const void **)(v4 + 8);
              if (v9 && CFEqual(ValueAtIndex, v9))
              {
                CFRelease(*(CFTypeRef *)(v4 + 8));
                *(void *)(v4 + _Block_object_dispose(va, 8) = 0LL;
              }

              CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)v4, v6 - 2);
              --dword_100066F50;
            }

            --v6;
          }

          while (v6 > 1);
        }
      }

      if (!CFEqual(*(CFTypeRef *)(v4 + 24), @"wakepoweron")) {
        sub_100013B30(v4);
      }
    }
  }

  uint64_t result = sub_10003A3F0("pm-min-schedule-time", &v11);
  return result;
}

void sub_100013840(const __CFDictionary *a1)
{
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  CFDateRef v3 = CFDateCreate(0LL, Current);
  uint64_t v4 = (const __CFDate *)sub_100014470(a1);
  CFAbsoluteTime AbsoluteTime = CFDateGetAbsoluteTime(v4);
  CFDateRef v6 = CFDateCreate(0LL, AbsoluteTime + 5.0);
  if (CFDateCompare(v6, v3, 0LL) == kCFCompareLessThan)
  {
    __int128 v9 = (os_log_s *)qword_100067750;
    if (os_log_type_enabled((os_log_t)qword_100067750, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412546;
      CFDateRef v11 = v6;
      __int16 v12 = 2112;
      CFDateRef v13 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "timer fired for an event which is on %@. Time now is %@.",  (uint8_t *)&v10,  0x16u);
    }

    CFRelease(v3);
    CFRelease(v6);
  }

  else
  {
    CFRelease(v3);
    CFRelease(v6);
    nullsub_4(v7, v8);
  }

uint64_t sub_100013988(const __CFDictionary *a1)
{
  if (a1) {
    a1 = (const __CFDictionary *)sub_100014470(a1);
  }
  return IOPMSchedulePowerEvent(a1, 0LL, @"PowerOnImmediate");
}

void sub_1000139AC(uint64_t *a1)
{
  if (a1)
  {
    if (((a1 == &qword_100067818) & byte_100066F60) == 0)
    {
      if (a1[3])
      {
        uint64_t v2 = (const __CFArray *)*a1;
        if (*a1)
        {
          if (CFArrayGetCount(v2))
          {
            CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
            uint64_t v4 = CFDateCreate(0LL, Current);
            if (CFArrayGetCount((CFArrayRef)*a1) >= 1)
            {
              do
              {
                ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex((CFArrayRef)*a1, 0LL);
                if (sub_100014FD0(ValueAtIndex, v4)) {
                  break;
                }
                CFDateRef v6 = CFArrayGetValueAtIndex((CFArrayRef)*a1, 0LL);
                uint64_t v7 = (os_log_s *)qword_100067750;
                if (os_log_type_enabled((os_log_t)qword_100067750, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138543362;
                  __int128 v9 = v6;
                  _os_log_debug_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "Purged past event: %{public}@\n",  buf,  0xCu);
                }

                CFArrayRemoveValueAtIndex((CFMutableArrayRef)*a1, 0LL);
                --dword_100066F50;
              }

              while (CFArrayGetCount((CFArrayRef)*a1) > 0);
            }

            CFRelease(v4);
          }
        }
      }
    }
  }

void sub_100013B30(uint64_t a1)
{
  uint64_t v2 = *(dispatch_object_s **)(a1 + 16);
  if (v2)
  {
    dispatch_release(v2);
    *(void *)(a1 + 16) = 0LL;
  }

  CFDateRef v3 = *(CFArrayRef **)(a1 + 32);
  if (v3)
  {
    uint64_t v4 = sub_100014380((const __CFArray **)a1, v3);
    if (!v4) {
      goto LABEL_13;
    }
  }

  else
  {
    uint64_t v4 = *(__CFArray **)a1;
    if (!*(void *)a1)
    {
LABEL_13:
      CFDateRef v11 = 0LL;
      goto LABEL_14;
    }
  }

  CFIndex Count = CFArrayGetCount(v4);
  if (!Count) {
    goto LABEL_13;
  }
  uint64_t v6 = Count;
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  CFDateRef v8 = CFDateCreate(0LL, Current + *(double *)&qword_100066938);
  if (v6 < 1)
  {
LABEL_12:
    CFRelease(v8);
    goto LABEL_13;
  }

  CFIndex v9 = 0LL;
  while (1)
  {
    ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v4, v9);
    if (sub_100014FD0(ValueAtIndex, v8)) {
      break;
    }
    if (v6 == ++v9) {
      goto LABEL_12;
    }
  }

  CFRelease(v8);
  CFDateRef v11 = CFArrayGetValueAtIndex(v4, v9);
  CFRetain(v11);
LABEL_14:
  __int16 v12 = sub_1000126E0(*(const void **)(a1 + 24));
  if (!v12)
  {
    CFDateRef v13 = (const __CFDictionary *)v11;
    goto LABEL_19;
  }

  CFDateRef v13 = v12;
  if ((unint64_t)(sub_100015068(v12, v11) + 1) > 1)
  {
    int v14 = v13;
    CFDateRef v13 = (const __CFDictionary *)v11;
  }

  else
  {
    int v14 = (const __CFDictionary *)v11;
    if (!v11)
    {
LABEL_19:
      if (!v4) {
        goto LABEL_25;
      }
      goto LABEL_23;
    }
  }

  CFRelease(v14);
  if (!v4) {
    goto LABEL_25;
  }
LABEL_23:
  if (*(void *)(a1 + 32)) {
    CFRelease(v4);
  }
LABEL_25:
  if (v13)
  {
    __int16 v15 = *(void (**)(const __CFDictionary *))(a1 + 48);
    if (v15) {
      v15(v13);
    }
    int v17 = (uint64_t *)(a1 + 8);
    int v16 = *(const void **)(a1 + 8);
    if (v16) {
      CFRelease(v16);
    }
    uint64_t *v17 = (uint64_t)v13;
    CFTypeID v18 = (const __CFDate *)sub_100014470(v13);
    if (v18)
    {
      uint64_t v19 = v18;
      CFAbsoluteTime v20 = CFAbsoluteTimeGetCurrent();
      uint64_t v21 = CFDateCreate(0LL, v20);
      if (v21)
      {
        uint64_t v22 = v21;
        double TimeIntervalSinceDate = CFDateGetTimeIntervalSinceDate(v19, v21);
        if (TimeIntervalSinceDate <= 0.001 || TimeIntervalSinceDate >= 9223372040.0)
        {
          uint64_t v37 = (os_log_s *)qword_100067750;
          if (os_log_type_enabled((os_log_t)qword_100067750, OS_LOG_TYPE_ERROR)) {
            sub_100040A24(v17, v37);
          }
        }

        else
        {
          uint64_t v24 = sub_100038248();
          CFTypeID v25 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, v24);
          *(void *)(a1 + 16) = v25;
          handler[0] = _NSConcreteStackBlock;
          handler[1] = 0x40000000LL;
          handler[2] = sub_100014EE4;
          handler[3] = &unk_1000598C8;
          void handler[4] = a1;
          dispatch_source_set_event_handler(v25, handler);
          int v26 = *(dispatch_object_s **)(a1 + 16);
          if (v26)
          {
            dispatch_resume(v26);
            CFDateRef v27 = *(dispatch_source_s **)(a1 + 16);
            dispatch_time_t v28 = dispatch_time(0xFFFFFFFFFFFFFFFELL, (uint64_t)(TimeIntervalSinceDate * 1000000000.0));
            dispatch_source_set_timer(v27, v28, 0xFFFFFFFFFFFFFFFFLL, 0LL);
            uint64_t v29 = (os_log_s *)qword_100067750;
            if (os_log_type_enabled((os_log_t)qword_100067750, OS_LOG_TYPE_DEBUG)) {
              sub_1000409BC((uint64_t)v17, v29, v30, v31, v32, v33, v34, v35);
            }
          }
        }

        CFRelease(v22);
      }
    }
  }

  else
  {
    uint64_t v36 = *(void (**)(void))(a1 + 56);
    if (v36) {
      v36(0LL);
    }
  }

void sub_100013E14(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 8);
  if ((v1 & 2) != 0 && (*(_BYTE *)(a1 + 16) & 1) == 0 && (*(_BYTE *)(a1 + 20) & 1) != 0)
  {
    int v10 = (os_log_s *)qword_100067750;
    if (os_log_type_enabled((os_log_t)qword_100067750, OS_LOG_TYPE_DEBUG)) {
      sub_100040ACC(v10, v11, v12, v13, v14, v15, v16, v17);
    }
    for (uint64_t i = 0LL; i != 48; i += 8LL)
    {
      uint64_t v19 = *(uint64_t **)((char *)&off_100066908 + i);
      if (v19)
      {
        sub_1000139AC(v19);
      }
    }
  }

  else if ((v1 & 1) != 0 && (*(_BYTE *)(a1 + 16) & 1) != 0 && (*(_BYTE *)(a1 + 20) & 1) == 0)
  {
    uint64_t v2 = (os_log_s *)qword_100067750;
    if (os_log_type_enabled((os_log_t)qword_100067750, OS_LOG_TYPE_DEBUG)) {
      sub_100040A98(v2, v3, v4, v5, v6, v7, v8, v9);
    }
    sub_100013B30((uint64_t)&qword_100067818);
  }

void sub_100013F00()
{
  for (uint64_t i = 0LL; i != 48; i += 8LL)
  {
    uint64_t v1 = *(uint64_t *)((char *)&off_100066908 + i);
    if (v1)
    {
      if (!CFEqual(*(CFTypeRef *)(v1 + 24), @"wakepoweron")) {
        sub_100013B30(v1);
      }
    }
  }

void sub_100013F60(const void *a1)
{
  if (CFEqual(a1, @"wakepoweron"))
  {
    sub_100013B30((uint64_t)&qword_100067818);
    uint64_t v2 = &unk_100067858;
  }

  else
  {
    uint64_t v3 = 0LL;
    while (!CFEqual(a1, (*(CFTypeRef **)((char *)&off_100066908 + v3))[3]))
    {
      v3 += 8LL;
      if (v3 == 48) {
        return;
      }
    }

    uint64_t v2 = *(_UNKNOWN **)((char *)&off_100066908 + v3);
  }

  sub_100013B30((uint64_t)v2);
}

double sub_100013FEC(const __CFDictionary *a1)
{
  int valuePtr = 0;
  Value = (const __CFDate *)CFDictionaryGetValue(a1, @"time");
  CFTypeID TypeID = CFDateGetTypeID();
  double v4 = 0.0;
  if (Value && CFGetTypeID(Value) == TypeID)
  {
    double AbsoluteTime = CFDateGetAbsoluteTime(Value);
    uint64_t v6 = (const __CFNumber *)CFDictionaryGetValue(a1, @"leeway");
    CFTypeID v7 = CFNumberGetTypeID();
    double v8 = 0.0;
    if (v6 && CFGetTypeID(v6) == v7)
    {
      CFNumberGetValue(v6, kCFNumberIntType, &valuePtr);
      double v8 = (double)(valuePtr & ~(valuePtr >> 31));
    }

    return AbsoluteTime + v8;
  }

  return v4;
}

CFDictionaryRef sub_1000140B8()
{
  os_log_t v0 = sub_100014148((uint64_t)&unk_100067798);
  uint64_t v1 = sub_100014148((uint64_t)&unk_1000677D8);
  uint64_t v2 = v1;
  if (v0) {
    BOOL v3 = v1 == 0LL;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (!v0) {
      return v1;
    }
  }

  else
  {
    double v4 = sub_100013FEC(v0);
    if (v4 >= sub_100013FEC(v2))
    {
      CFRelease(v0);
      return v2;
    }

    else
    {
      CFRelease(v2);
    }
  }

  return v0;
}

CFDictionaryRef sub_100014148(uint64_t a1)
{
  double Current = CFAbsoluteTimeGetCurrent();
  BOOL v3 = *(CFArrayRef **)(a1 + 32);
  if (v3) {
    double v4 = sub_100014380((const __CFArray **)a1, v3);
  }
  else {
    double v4 = *(__CFArray **)a1;
  }
  CFTypeID TypeID = CFArrayGetTypeID();
  if (!v4) {
    return 0LL;
  }
  if (CFGetTypeID(v4) == TypeID && (CFIndex Count = CFArrayGetCount(v4), Count >= 1))
  {
    CFIndex v7 = Count;
    CFIndex v8 = 0LL;
    Copy = 0LL;
    double v10 = 0.0;
    do
    {
      ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v4, v8);
      CFTypeID v12 = CFDictionaryGetTypeID();
      if (ValueAtIndex && CFGetTypeID(ValueAtIndex) == v12)
      {
        uint64_t v13 = (os_log_s *)qword_100067750;
        if (os_log_type_enabled((os_log_t)qword_100067750, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v19 = ValueAtIndex;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "Active wake request: %{public}@\n",  buf,  0xCu);
        }

        double v14 = sub_100013FEC(ValueAtIndex);
        if (v14 != 0.0 && v14 >= Current + *(double *)&qword_100066938)
        {
          BOOL v15 = v10 == 0.0;
          if (v14 < v10) {
            BOOL v15 = 1;
          }
          if (v15)
          {
            double v10 = v14;
            Copy = ValueAtIndex;
          }
        }
      }

      ++v8;
    }

    while (v7 != v8);
    if (Copy)
    {
      Copy = CFDictionaryCreateCopy(0LL, Copy);
      uint64_t v17 = (os_log_s *)qword_100067750;
      if (os_log_type_enabled((os_log_t)qword_100067750, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v19 = Copy;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Selected RTC wake request: %{public}@\n",  buf,  0xCu);
      }
    }
  }

  else
  {
    Copy = 0LL;
  }

  if (*(void *)(a1 + 32)) {
    CFRelease(v4);
  }
  return Copy;
}

CFDictionaryRef sub_100014374()
{
  return sub_100014148((uint64_t)&qword_100067818);
}

__CFArray *sub_100014380(const __CFArray **a1, CFArrayRef *a2)
{
  if (!a1) {
    return 0LL;
  }
  BOOL v3 = *a1;
  CFArrayRef v4 = *a2;
  if (!v3)
  {
    if (v4) {
      return (__CFArray *)CFRetain(v4);
    }
    return 0LL;
  }

  if (v4)
  {
    CFMutableDictionaryRef MutableCopy = CFArrayCreateMutableCopy(0LL, 0LL, v3);
    v8.length = CFArrayGetCount(*a2);
    v8.location = 0LL;
    CFArrayAppendArray(MutableCopy, *a2, v8);
    v7.length = CFArrayGetCount(MutableCopy);
    v7.location = 0LL;
    CFArraySortValues(MutableCopy, v7, (CFComparatorFunction)sub_100015068, 0LL);
    return MutableCopy;
  }

  CFArrayRef v4 = v3;
  return (__CFArray *)CFRetain(v4);
}

void sub_100014420()
{
  os_log_t v0 = sub_100014148((uint64_t)&qword_100067818);
  if (v0)
  {
    uint64_t v1 = v0;
    sub_100013FEC(v0);
    CFRelease(v1);
  }

const void *sub_100014470(const __CFDictionary *a1)
{
  Value = CFDictionaryGetValue(a1, @"time");
  CFTypeID TypeID = CFDateGetTypeID();
  if (!Value) {
    return 0LL;
  }
  if (CFGetTypeID(Value) == TypeID) {
    return Value;
  }
  return 0LL;
}

uint64_t sub_1000144BC()
{
  return 0LL;
}

uint64_t sub_1000144C8(uint64_t a1, _OWORD *a2, const UInt8 *a3, unsigned int a4, int a5, int *a6)
{
  *a6 = 0;
  __int128 v11 = a2[1];
  *(_OWORD *)atoken.val = *a2;
  *(_OWORD *)&atoken.val[4] = v11;
  audit_token_to_au32(&atoken, 0LL, &euidp, 0LL, 0LL, 0LL, &pidp, 0LL, 0LL);
  __int128 v12 = a2[1];
  *(_OWORD *)atoken.val = *a2;
  *(_OWORD *)&atoken.val[4] = v12;
  if (sub_1000382AC(&atoken, @"com.apple.iokit.wakerequest")) {
    uid_t euidp = 0;
  }
  if (dword_100066F50 >= 0x3E8)
  {
    *a6 = -536870181;
    goto LABEL_37;
  }

  if (a5 != 2)
  {
    CFDataRef v20 = CFDataCreate(0LL, a3, a4);
    if (v20 && (uint64_t v21 = (const __CFDictionary *)CFPropertyListCreateWithData(0LL, v20, 1uLL, 0LL, 0LL)) != 0LL)
    {
      uint64_t v22 = v21;
      Value = CFDictionaryGetValue(v21, @"scheduledby");
      if (!Value
        || (v24 = Value, CFTypeID TypeID = CFStringGetTypeID(), CFGetTypeID(v24) != TypeID)
        || CFEqual(v24, &stru_10005AC58))
      {
        if (proc_name(pidp, &atoken, 0x400u))
        {
          CFStringRef v26 = CFStringCreateWithCString(0LL, (const char *)&atoken, 0);
          if (v26)
          {
            CFStringRef v27 = v26;
            CFDictionarySetValue(v22, @"scheduledby", v26);
            CFRelease(v27);
          }
        }
      }

      CFNumberRef v28 = CFNumberCreate(0LL, kCFNumberIntType, &pidp);
      if (v28)
      {
        CFNumberRef v29 = v28;
        CFDictionarySetValue(v22, @"appPID", v28);
        CFRelease(v29);
      }

      uint64_t v30 = CFDictionaryGetValue(v22, @"eventtype");
      if (!v30)
      {
        *a6 = -536870206;
        goto LABEL_52;
      }

      uint64_t v31 = v30;
      uint64_t v32 = 0LL;
      while (!CFEqual(v31, (*(CFTypeRef **)((char *)&off_100066908 + v32))[3]))
      {
        v32 += 8LL;
        if (v32 == 48) {
          goto LABEL_33;
        }
      }

      *a6 = 0;
      if (a5)
      {
        if (a5 == 1)
        {
          sub_100014980(*(uint64_t **)((char *)&off_100066908 + v32), v22);
          *a6 = 0;
          uint64_t v35 = (os_log_s *)qword_100067750;
          if (os_log_type_enabled((os_log_t)qword_100067750, OS_LOG_TYPE_DEBUG)) {
            sub_100040B00((uint64_t)v22, v35, v36, v37, v38, v39, v40, v41);
          }
          if (CFDictionaryGetValue(v22, @"UserVisible") == kCFBooleanTrue) {
            notify_post("com.apple.system.powermanagement.uservisiblepowerevent");
          }
        }

        goto LABEL_48;
      }

      if ((sub_100014A38(*(CFArrayRef **)((char *)&off_100066908 + v32), v22) & 1) != 0)
      {
        double v42 = (os_log_s *)qword_100067750;
        if (os_log_type_enabled((os_log_t)qword_100067750, OS_LOG_TYPE_DEBUG)) {
          sub_100040B64((uint64_t)v22, v42, v43, v44, v45, v46, v47, v48);
        }
LABEL_48:
        if (CFEqual(v31, @"wakepoweron"))
        {
          sub_100013B30((uint64_t)&qword_100067818);
          uint64_t v49 = &unk_100067858;
        }

        else
        {
          uint64_t v49 = *(_UNKNOWN **)((char *)&off_100066908 + v32);
        }

        sub_100013B30((uint64_t)v49);
        if (v20)
        {
LABEL_52:
          CFRelease(v20);
          if (!v22) {
            goto LABEL_37;
          }
          goto LABEL_36;
        }

LABEL_35:
        if (!v22) {
          goto LABEL_37;
        }
LABEL_36:
        CFRelease(v22);
        goto LABEL_37;
      }

      int v33 = -536870160;
    }

    else
    {
      uint64_t v22 = 0LL;
LABEL_33:
      int v33 = -536870206;
    }

    *a6 = v33;
    if (v20) {
      goto LABEL_52;
    }
    goto LABEL_35;
  }

  __int128 v13 = a2[1];
  *(_OWORD *)atoken.val = *a2;
  *(_OWORD *)&atoken.val[4] = v13;
  audit_token_to_au32(&atoken, 0LL, &v52, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  for (uint64_t i = 0LL; i != 48; i += 8LL)
  {
    uint64_t v15 = *(uint64_t *)((char *)&off_100066908 + i);
    uint64_t v16 = *(__CFArray **)v15;
    if (*(void *)v15)
    {
      uint64_t v17 = *(const void **)(v15 + 8);
      if (v17)
      {
        CFRelease(v17);
        (*(void **)((char *)&off_100066908 + i))[1] = 0LL;
        uint64_t v16 = **(__CFArray ***)((char *)&off_100066908 + i);
      }

      CFArrayRemoveAllValues(v16);
      **(void **)((char *)&off_100066908 + i) = 0LL;
      if (CFEqual((*(CFTypeRef **)((char *)&off_100066908 + i))[3], @"wakepoweron"))
      {
        sub_100013B30((uint64_t)&qword_100067818);
        CFTypeID v18 = &unk_100067858;
      }

      else
      {
        CFTypeID v18 = *(_UNKNOWN **)((char *)&off_100066908 + i);
      }

      sub_100013B30((uint64_t)v18);
    }
  }

  dword_100066F50 = 0;
  *a6 = 0;
  uint64_t v19 = (os_log_s *)qword_100067750;
  if (os_log_type_enabled((os_log_t)qword_100067750, OS_LOG_TYPE_DEFAULT))
  {
    atoken.val[0] = 67109120;
    atoken.val[1] = pidp;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Removed all wake request based on request from pid %d\n",  (uint8_t *)&atoken,  8u);
  }

        double v10 = v9 & 0xFFFFFFFD;
LABEL_36:
        *(_DWORD *)(a3 + 24) = v10;
        CFTypeID v23 = 2;
        goto LABEL_37;
      }
    }

    else
    {
      __int128 v11 = (char *)&unk_100067A90 + 160 * v7;
      if (CFEqual(a1, @"TimeoutSeconds"))
      {
        __int128 v12 = CFNumberGetTypeID();
        if (a2 && CFGetTypeID(a2) == v12)
        {
          CFNumberGetValue(a2, kCFNumberDoubleType, &v32);
          __int128 v13 = v32;
          if ((*v11 & 0x10) != 0)
          {
            double v14 = (unint64_t *)((char *)&unk_100067A90 + 160 * v7);
            uint64_t v15 = (double)v14[12];
            if (v32 == 0.0 || v32 > v15)
            {
              uint64_t v32 = (double)v14[12];
              __int128 v13 = v15;
            }
          }

          if (v13 == 0.0) {
            uint64_t v16 = 0LL;
          }
          else {
            uint64_t v16 = sub_100039ACC() + (unint64_t)v13;
          }
          *(void *)(a3 + 40) = v16;
          uint64_t v9 = *(_DWORD *)(a3 + 24);
          if ((v9 & 2) == 0)
          {
            CFTypeID v23 = 1;
LABEL_37:
            *(_DWORD *)(a3 + 56) |= v23;
            goto LABEL_38;
          }

          goto LABEL_35;
        }
      }

      else if (CFEqual(a1, @"AppliesToLimitedPower"))
      {
        uint64_t v17 = CFBooleanGetTypeID();
        if (a2 && CFGetTypeID(a2) == v17 && (*v11 & 1) != 0)
        {
          if (kCFBooleanTrue != a2 || (CFTypeID v18 = *(_DWORD *)(a3 + 24), (v18 & 4) != 0))
          {
            if (kCFBooleanFalse != a2) {
              goto LABEL_38;
            }
            CFTypeID v25 = *(_DWORD *)(a3 + 24);
            if ((v25 & 4) == 0) {
              goto LABEL_38;
            }
            CFStringRef v26 = (char *)&unk_100067A90 + 160 * v7;
            CFNumberRef v29 = *((_DWORD *)v26 + 38);
            CFStringRef v27 = v26 + 152;
            CFNumberRef v28 = v29;
            if (v29) {
              *CFStringRef v27 = v28 - 1;
            }
            uint64_t v19 = v25 & 0xFFFFFFFB;
          }

          else
          {
            ++*((_DWORD *)&unk_100067A90 + 40 * v7 + 38);
            uint64_t v19 = v18 | 4;
          }

          *(_DWORD *)(a3 + 24) = v19;
          CFTypeID v23 = 8;
          goto LABEL_37;
        }
      }

      else if (CFEqual(a1, @"AppliesOnLidClose"))
      {
        CFDataRef v20 = CFBooleanGetTypeID();
        if (a2 && CFGetTypeID(a2) == v20)
        {
          if (kCFBooleanTrue != a2 || (uint64_t v21 = *(_DWORD *)(a3 + 24), (v21 & 8) != 0))
          {
            if (kCFBooleanFalse != a2) {
              goto LABEL_38;
            }
            uint64_t v30 = *(_DWORD *)(a3 + 24);
            if ((v30 & 8) == 0) {
              goto LABEL_38;
            }
            uint64_t v22 = v30 & 0xFFFFFFF7;
          }

          else
          {
            uint64_t v22 = v21 | 8;
          }

          *(_DWORD *)(a3 + 24) = v22;
          CFTypeID v23 = 16;
          goto LABEL_37;
        }
      }

      else if (CFEqual(a1, @"ExitSilentRunning"))
      {
        if (sub_10002DAC8(a2))
        {
          if (kCFBooleanTrue != a2) {
            goto LABEL_38;
          }
          uint64_t v24 = *(_DWORD *)(a3 + 24);
          if ((v24 & 0x200) != 0) {
            goto LABEL_38;
          }
          *(_DWORD *)(a3 + 24) = v24 | 0x200;
          CFTypeID v23 = 128;
          goto LABEL_37;
        }
      }

      else if (CFEqual(a1, @"AssertionOnBehalfOfPID"))
      {
        if (sub_100005798(a2))
        {
          CFTypeID v23 = 256;
          goto LABEL_37;
        }
      }

      else if (!CFEqual(a1, @"AssertType"))
      {
        if (CFEqual(a1, @"AssertName"))
        {
          CFTypeID v23 = 32;
        }

        else if (CFEqual(a1, @"ResourcesUsed") || CFEqual(a1, @"AllowsDeviceRestart"))
        {
          CFTypeID v23 = 64;
        }

        else
        {
          if (!CFEqual(a1, @"FrameworkBundleID")) {
            goto LABEL_38;
          }
          CFTypeID v23 = 512;
        }

        goto LABEL_37;
      }
    }
  }

LABEL_37:
  vm_deallocate(mach_task_self_, (vm_address_t)a3, a4);
  return 0LL;
}

void sub_100014980(uint64_t *a1, const void *a2)
{
  CFArrayRef v4 = (const void *)*a1;
  CFTypeID TypeID = CFArrayGetTypeID();
  if (v4 && CFGetTypeID(v4) == TypeID)
  {
    sub_1000139AC(a1);
    CFArrayAppendValue((CFMutableArrayRef)*a1, a2);
    uint64_t v6 = (__CFArray *)*a1;
    v8.length = CFArrayGetCount((CFArrayRef)*a1);
    v8.location = 0LL;
    CFArraySortValues(v6, v8, (CFComparatorFunction)sub_100015068, 0LL);
  }

  else
  {
    CFMutableArrayRef Mutable = CFArrayCreateMutable(0LL, 0LL, &kCFTypeArrayCallBacks);
    *a1 = (uint64_t)Mutable;
    CFArrayAppendValue(Mutable, a2);
  }

  ++dword_100066F50;
}

uint64_t sub_100014A38(CFArrayRef *a1, const void *a2)
{
  CFArrayRef v2 = *a1;
  if (!*a1) {
    return 0LL;
  }
  CFTypeID TypeID = CFArrayGetTypeID();
  if (CFGetTypeID(v2) != TypeID) {
    return 0LL;
  }
  CFIndex Count = CFArrayGetCount(*a1);
  if (Count < 1) {
    return 0LL;
  }
  CFIndex v7 = Count;
  CFIndex v8 = 0LL;
  while (1)
  {
    ValueAtIndex = CFArrayGetValueAtIndex(*a1, v8);
    CFComparisonResult v10 = sub_100015068(a2, ValueAtIndex);
    if (v10)
    {
      if (v10 == kCFCompareLessThan) {
        return 0LL;
      }
      goto LABEL_9;
    }

    Value = CFDictionaryGetValue((CFDictionaryRef)a2, @"scheduledby");
    __int128 v12 = CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, @"scheduledby");
    if (CFEqual(Value, v12)) {
      break;
    }
LABEL_9:
    if (v7 == ++v8) {
      return 0LL;
    }
  }

  for (uint64_t i = 0LL; i != 48; i += 8LL)
  {
    uint64_t v15 = (const void *)(*(void **)((char *)&off_100066908 + i))[1];
    if (v15 && CFEqual(ValueAtIndex, v15))
    {
      CFRelease((*(CFTypeRef **)((char *)&off_100066908 + i))[1]);
      (*(void **)((char *)&off_100066908 + i))[1] = 0LL;
    }
  }

  if (CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, @"UserVisible") == kCFBooleanTrue) {
    notify_post("com.apple.system.powermanagement.uservisiblepowerevent");
  }
  CFArrayRemoveValueAtIndex(*a1, v8);
  --dword_100066F50;
  return 1LL;
}

__CFArray *sub_100014BB0()
{
  CFMutableArrayRef Mutable = CFArrayCreateMutable(0LL, 0LL, &kCFTypeArrayCallBacks);
  for (uint64_t i = 0LL; i != 48; i += 8LL)
  {
    CFArrayRef v2 = *(CFArrayRef **)((char *)&off_100066908 + i);
    CFArrayRef v3 = *v2;
    if (*v2)
    {
      CFTypeID TypeID = CFArrayGetTypeID();
      if (CFGetTypeID(v3) == TypeID)
      {
        v6.length = CFArrayGetCount(*v2);
        v6.location = 0LL;
        CFArrayAppendArray(Mutable, *v2, v6);
      }
    }
  }

  return Mutable;
}

uint64_t sub_100014C4C(unsigned int a1)
{
  double Current = CFAbsoluteTimeGetCurrent();
  if ((a1 & 4) != 0)
  {
    sub_1000139AC(&qword_100067818);
    byte_100066F60 = 1;
    qword_100066F58 = *(void *)&Current;
    double v3 = Current;
  }

  else
  {
    double v3 = *(double *)&qword_100066F58;
  }

  if ((a1 & 1) != 0) {
    double v4 = Current + 15.0;
  }
  else {
    double v4 = Current;
  }
  if (((v3 != 0.0) & (a1 >> 1)) != 0) {
    double v5 = v3;
  }
  else {
    double v5 = Current;
  }
  if (v4 == v5) {
    goto LABEL_23;
  }
  CFDateRef v6 = (CFDateRef)qword_100067818;
  CFTypeID TypeID = CFArrayGetTypeID();
  if (!v6) {
    goto LABEL_26;
  }
  if (CFGetTypeID(v6) != TypeID || (CFIndex Count = CFArrayGetCount((CFArrayRef)qword_100067818), Count < 1))
  {
LABEL_23:
    uint64_t v15 = 0LL;
    CFDateRef v6 = 0LL;
    if ((a1 & 8) == 0) {
      goto LABEL_28;
    }
LABEL_27:
    byte_100066F60 = 0;
    qword_100066F58 = 0LL;
    sub_1000139AC(&qword_100067818);
    goto LABEL_28;
  }

  CFIndex v9 = Count;
  CFIndex v10 = 0LL;
  while (1)
  {
    ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex((CFArrayRef)qword_100067818, v10);
    CFTypeID v12 = CFDictionaryGetTypeID();
    if (ValueAtIndex)
    {
      if (CFGetTypeID(ValueAtIndex) == v12)
      {
        double v13 = sub_100013FEC(ValueAtIndex);
        if (v13 != 0.0 && v13 >= v5) {
          break;
        }
      }
    }

    if (v9 == ++v10) {
      goto LABEL_23;
    }
  }

  double v16 = v13;
  CFDateRef v6 = CFDateCreate(0LL, v13);
  if (v16 > v4)
  {
LABEL_26:
    uint64_t v15 = 0LL;
    if ((a1 & 8) == 0) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }

  CFTypeID v18 = CFDictionaryGetTypeID();
  if (CFGetTypeID(ValueAtIndex) == v18)
  {
    CFTypeID v19 = CFDateGetTypeID();
    if (v6)
    {
      if (CFGetTypeID(v6) == v19)
      {
        Value = CFDictionaryGetValue(ValueAtIndex, @"scheduledby");
        CFTypeID v21 = CFStringGetTypeID();
        if (Value)
        {
          if (CFGetTypeID(Value) == v21) {
            uint64_t v22 = Value;
          }
          else {
            uint64_t v22 = 0LL;
          }
        }

        else
        {
          uint64_t v22 = 0LL;
        }

        CFTypeID v23 = CFDateFormatterCreate(0LL, 0LL, kCFDateFormatterShortStyle, kCFDateFormatterMediumStyle);
        CFStringRef StringWithDate = CFDateFormatterCreateStringWithDate(0LL, v23, v6);
        CFStringRef v25 = CFStringCreateWithFormat( 0LL,  0LL,  @"Delay sleep for wake request %@ at %@",  v22,  StringWithDate);
        unsigned int v26 = vcvtpd_s64_f64(v16 - Current);
        if (v16 - Current <= 1.0) {
          int v27 = 1;
        }
        else {
          int v27 = v26;
        }
        sub_100027504(@"PreventUserIdleSystemSleep", v25, v27, &v28);
        if (v23) {
          CFRelease(v23);
        }
        if (StringWithDate) {
          CFRelease(StringWithDate);
        }
        if (v25) {
          CFRelease(v25);
        }
      }
    }
  }

  uint64_t v15 = 1LL;
  if ((a1 & 8) != 0) {
    goto LABEL_27;
  }
LABEL_28:
  if (v6) {
    CFRelease(v6);
  }
  return v15;
}

uint64_t sub_100014EE4(uint64_t result)
{
  uint64_t v1 = *(void **)(result + 32);
  if (v1)
  {
    CFArrayRef v2 = (dispatch_object_s *)v1[2];
    if (v2)
    {
      dispatch_release(v2);
      v1[2] = 0LL;
    }

    double v3 = (void (*)(void))v1[5];
    if (v3) {
      v3(v1[1]);
    }
    double v4 = (const void *)v1[1];
    if (v4)
    {
      double v5 = (os_log_s *)qword_100067750;
      if (os_log_type_enabled((os_log_t)qword_100067750, OS_LOG_TYPE_DEBUG))
      {
        int v6 = 138543362;
        CFIndex v7 = v4;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "AutoWakeScheduler: Handled timer expiration for: %{public}@\n",  (uint8_t *)&v6,  0xCu);
        double v4 = (const void *)v1[1];
      }

      CFRelease(v4);
    }

    v1[1] = 0LL;
    return sub_100013B30(v1);
  }

  return result;
}

BOOL sub_100014FD0(const __CFDictionary *a1, const __CFDate *a2)
{
  CFTypeID TypeID = CFDictionaryGetTypeID();
  BOOL result = 0;
  if (a1)
  {
    if (CFGetTypeID(a1) == TypeID)
    {
      Value = CFDictionaryGetValue(a1, @"time");
      CFTypeID v6 = CFDateGetTypeID();
      if (Value)
      {
        if (CFGetTypeID(Value) == v6 && CFDateCompare((CFDateRef)Value, a2, 0LL) != kCFCompareLessThan) {
          return 1;
        }
      }
    }
  }

  return result;
}

CFComparisonResult sub_100015068(const void *Value, const void *a2)
{
  CFTypeID TypeID = CFDictionaryGetTypeID();
  if (Value)
  {
    if (CFGetTypeID(Value) != TypeID) {
      Value = 0LL;
    }
    CFTypeID v5 = CFDictionaryGetTypeID();
    if (!a2) {
      goto LABEL_23;
    }
    CFTypeID v6 = v5;
  }

  else
  {
    CFTypeID v7 = CFDictionaryGetTypeID();
    if (!a2) {
      return 1LL;
    }
    CFTypeID v6 = v7;
    Value = 0LL;
  }

  if (CFGetTypeID(a2) != v6) {
    a2 = 0LL;
  }
  if (!Value) {
    return 1LL;
  }
  if (!a2) {
    return -1LL;
  }
  Value = CFDictionaryGetValue((CFDictionaryRef)Value, @"time");
  CFTypeID v8 = CFDateGetTypeID();
  if (Value && CFGetTypeID(Value) != v8) {
    Value = 0LL;
  }
  CFIndex v9 = (const __CFDate *)CFDictionaryGetValue((CFDictionaryRef)a2, @"time");
  CFTypeID v10 = CFDateGetTypeID();
  if (v9)
  {
    if (CFGetTypeID(v9) == v10) {
      __int128 v11 = v9;
    }
    else {
      __int128 v11 = 0LL;
    }
    if (Value)
    {
      if (v11) {
        return CFDateCompare((CFDateRef)Value, v11, 0LL);
      }
      return -1LL;
    }

    return 1LL;
  }

LABEL_23:
  if (Value) {
    return -1LL;
  }
  else {
    return 1LL;
  }
}

id sub_100015180()
{
  return (id)qword_100066F78;
}

void sub_10001518C(uint64_t a1)
{
  if (a1)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000151EC;
    block[3] = &unk_1000598E8;
    void block[4] = a1;
    dispatch_barrier_sync((dispatch_queue_t)qword_100066F78, block);
  }

void sub_1000151EC(uint64_t a1)
{
  if (qword_100066F80) {
    CFRelease((CFTypeRef)qword_100066F80);
  }
  CFArrayRef v2 = (os_log_s *)qword_1000678E0;
  if (os_log_type_enabled((os_log_t)qword_1000678E0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v3 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "System updated to use custom battery properties\n",  v3,  2u);
  }

  sub_100015280(1LL);
  qword_100066F80 = (uint64_t)CFRetain(*(CFTypeRef *)(a1 + 32));
  sub_1000152FC();
}

void sub_100015280(uint64_t a1)
{
  if (byte_100067234 != (_DWORD)a1)
  {
    byte_100067234 = a1;
    if ((a1 & 1) != 0) {
      sub_100015EC4(0LL);
    }
    else {
      sub_1000158D4(1);
    }
    CFArrayRef v2 = (os_log_s *)qword_1000678E0;
    if (os_log_type_enabled((os_log_t)qword_1000678E0, OS_LOG_TYPE_ERROR)) {
      sub_100040BC8(a1, v2, v3, v4, v5, v6, v7, v8);
    }
  }

void sub_1000152FC()
{
  uint64_t v0 = qword_100066F90;
  io_iterator_t existing = 0;
  if (qword_100066F90 && *(void *)qword_100066F90)
  {
    uint64_t v1 = IOServiceMatching("IOPMPowerSource");
    if (IOServiceGetMatchingServices(kIOMainPortDefault, v1, &existing)) {
      BOOL v2 = 1;
    }
    else {
      BOOL v2 = existing == 0;
    }
    if (v2)
    {
      if (os_log_type_enabled((os_log_t)qword_1000678E0, OS_LOG_TYPE_ERROR)) {
        sub_100040C44();
      }
    }

    else
    {
      v3[0] = _NSConcreteStackBlock;
      v3[1] = 3221225472LL;
      v3[2] = sub_10001AF0C;
      v3[3] = &unk_100059B40;
      io_iterator_t v4 = existing;
      v3[4] = v0;
      dispatch_async((dispatch_queue_t)qword_100066F78, v3);
    }
  }

void sub_1000153EC()
{
  if (qword_100066F80) {
    dispatch_async((dispatch_queue_t)qword_100066F78, &stru_100059908);
  }
}

void sub_100015410(id a1)
{
  if (qword_100066F88)
  {
    CFRelease((CFTypeRef)qword_100066F88);
    qword_100066F88 = 0LL;
  }

  CFRelease((CFTypeRef)qword_100066F80);
  qword_100066F80 = 0LL;
  sub_100015280(0LL);
  sub_1000152FC();
}

uint64_t sub_100015454()
{
  uint64_t v3 = 0LL;
  io_iterator_t v4 = &v3;
  uint64_t v5 = 0x2020000000LL;
  uint64_t v6 = 0LL;
  dispatch_assert_queue_not_V2((dispatch_queue_t)qword_100066F78);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100015534;
  block[3] = &unk_100058F60;
  void block[4] = &v3;
  dispatch_sync((dispatch_queue_t)qword_100066F78, block);
  uint64_t v0 = v4[3];
  if (!v0)
  {
    if (os_log_type_enabled((os_log_t)qword_1000678E0, OS_LOG_TYPE_ERROR)) {
      sub_100040C70();
    }
    uint64_t v0 = v4[3];
  }

  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_10001551C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_100015534(uint64_t a1)
{
  uint64_t v2 = qword_100066F90;
  if (qword_100066F90)
  {
    if (*(void *)qword_100066F90)
    {
      uint64_t v3 = *(const void **)(*(void *)qword_100066F90 + 8LL);
      CFTypeID TypeID = CFDictionaryGetTypeID();
      if (v3)
      {
        if (CFGetTypeID(v3) == TypeID) {
          *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = CFDictionaryCreateCopy( kCFAllocatorDefault,  *(CFDictionaryRef *)(*(void *)v2 + 8LL));
        }
      }
    }
  }

uint64_t sub_1000155BC()
{
  return qword_100066F90;
}

uint64_t sub_1000155E0()
{
  return qword_100066F88;
}

void sub_1000155EC()
{
  os_log_t v0 = os_log_create("com.apple.powerd", "battery");
  uint64_t v1 = (void *)qword_1000678E0;
  qword_1000678E0 = (uint64_t)v0;

  os_log_t v2 = os_log_create("com.apple.powerd", "batteryhealth");
  uint64_t v3 = (void *)qword_1000678D8;
  qword_1000678D8 = (uint64_t)v2;

  bzero(qword_100066F98, 0x280uLL);
  qword_100067238 = 0LL;
  xmmword_100067218 = 0u;
  *(_OWORD *)&word_100067228 = 0u;
  dispatch_queue_t v4 = dispatch_queue_create("com.apple.private.powerd.batteryTimeRemainingQ", 0LL);
  uint64_t v5 = (void *)qword_100066F78;
  qword_100066F78 = (uint64_t)v4;

  if (qword_100066F78)
  {
    notify_register_check("com.apple.system.powersources.timeremaining", &dword_10006722C);
    notify_register_check("com.apple.system.powersources.percent", &dword_100067230);
    xpc_activity_unregister("com.apple.powerd.dofu-monitor");
    sub_1000156FC(1);
    dispatch_sync((dispatch_queue_t)qword_100066F78, &stru_100059928);
    dispatch_async((dispatch_queue_t)qword_100066F78, &stru_100059948);
  }

void sub_1000156FC(int a1)
{
  dispatch_queue_t v2 = sub_100038248();
  uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v2);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100019DFC;
  block[3] = &unk_100059A80;
  int v5 = a1;
  char v6 = 0;
  dispatch_async(v3, block);
}

void sub_10001576C(id a1)
{
  uint64_t v1 = IONotificationPortCreate(0);
  if (v1)
  {
    dispatch_queue_t v2 = v1;
    IONotificationPortSetDispatchQueue(v1, (dispatch_queue_t)qword_100066F78);
    io_iterator_t notification = 0;
    uint64_t v3 = IOServiceMatching("IOPMPowerSource");
    uint64_t v4 = IOServiceAddMatchingNotification( v2,  "IOServiceFirstMatch",  v3,  (IOServiceMatchingCallback)sub_100019E0C,  v2,  &notification);
    if ((_DWORD)v4)
    {
      uint64_t v5 = v4;
      char v6 = (os_log_s *)qword_1000678E0;
      if (os_log_type_enabled((os_log_t)qword_1000678E0, OS_LOG_TYPE_ERROR)) {
        sub_100040C9C(v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }

    else
    {
      sub_100019E0C(v2, notification);
    }

    double v13 = IONotificationPortCreate(kIOMainPortDefault);
    IONotificationPortSetDispatchQueue(v13, (dispatch_queue_t)qword_100066F78);
    double v14 = IOServiceMatching("AppleSMC");
    if (!IOServiceAddMatchingNotification( v13,  "IOServiceFirstMatch",  v14,  (IOServiceMatchingCallback)sub_10001A160,  v13,  &v18)) {
      sub_10001A160(0, v18);
    }
    uint64_t v15 = IONotificationPortCreate(kIOMainPortDefault);
    IONotificationPortSetDispatchQueue(v15, (dispatch_queue_t)qword_100066F78);
    double v16 = IOServiceMatching("AppleARMPMUPowerSource");
    if (!IOServiceAddMatchingNotification( v15,  "IOServiceFirstMatch",  v16,  (IOServiceMatchingCallback)sub_10001A228,  v15,  &iterator)) {
      sub_10001A228(0, iterator);
    }
  }

void sub_1000158CC(id a1)
{
}

void sub_1000158D4(int a1)
{
  double Current = CFAbsoluteTimeGetCurrent();
  dispatch_assert_queue_V2((dispatch_queue_t)qword_100066F78);
  dispatch_assert_queue_V2((dispatch_queue_t)qword_100066F78);
  if (!qword_100066F90)
  {
    if (os_log_type_enabled((os_log_t)qword_1000678E0, OS_LOG_TYPE_ERROR)) {
      sub_100040D00();
    }
    return;
  }

  if (byte_100067234)
  {
    if (os_log_type_enabled((os_log_t)qword_1000678E0, OS_LOG_TYPE_ERROR)) {
      sub_100040D84();
    }
    return;
  }

  if (!qword_100067240)
  {
    dispatch_source_t v3 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)qword_100066F78);
    uint64_t v4 = (void *)qword_100067240;
    qword_100067240 = (uint64_t)v3;

    dispatch_source_set_event_handler((dispatch_source_t)qword_100067240, &stru_100059B60);
    dispatch_resume((dispatch_object_t)qword_100067240);
  }

  if (a1 == 1) {
    goto LABEL_44;
  }
  double v5 = sub_10001AF5C(@"BootPathUpdated");
  if (v5 >= Current) {
    double v6 = 0.0;
  }
  else {
    double v6 = v5;
  }
  double v7 = sub_10001AF5C(@"FullPathUpdated");
  if (v7 >= Current) {
    double v8 = 0.0;
  }
  else {
    double v8 = v7;
  }
  double v9 = sub_10001AF5C(@"UserVisiblePathUpdated");
  if (v9 >= Current) {
    double v9 = 0.0;
  }
  if (v6 < v8 || (v6 != 0.0 ? (BOOL v10 = v6 < v9) : (BOOL v10 = 1), v10))
  {
    if (v8 < v6 || (v8 != 0.0 ? (BOOL v11 = v8 < v9) : (BOOL v11 = 1), v12 = v8, v11)) {
      double v12 = v9;
    }
    double v13 = Current - v12;
    BOOL v14 = Current - v12 > 15.0;
    double v15 = -kCFAbsoluteTimeIntervalSince1970;
    if (v6 < v8) {
      goto LABEL_37;
    }
  }

  else
  {
    double v13 = Current - v6;
    BOOL v14 = Current - v6 > 15.0;
    double v15 = -kCFAbsoluteTimeIntervalSince1970;
  }

  if (v6 == 0.0 || v6 < v15)
  {
LABEL_37:
    if (v8 >= v6 && v8 != 0.0 && v8 >= v15) {
      double v15 = v8;
    }
    goto LABEL_43;
  }

  double v15 = v6;
LABEL_43:
  if (Current - v15 > 595.0)
  {
LABEL_44:
    if (os_log_type_enabled((os_log_t)qword_1000678E0, OS_LOG_TYPE_DEBUG)) {
      sub_100040D2C();
    }
    uint64_t v18 = 2LL;
LABEL_47:
    IOPSRequestBatteryUpdate(v18);
    CFTypeID v19 = (dispatch_source_s *)qword_100067240;
    dispatch_time_t v20 = dispatch_time(0LL, 20000000000LL);
    dispatch_source_set_timer(v19, v20, 0x4A817C800uLL, 0LL);
    return;
  }

  if (v14)
  {
    if (os_log_type_enabled((os_log_t)qword_1000678E0, OS_LOG_TYPE_DEBUG)) {
      sub_100040D58();
    }
    uint64_t v18 = 4LL;
    goto LABEL_47;
  }

  double v21 = v13 * -1000000000.0 + 2.0e10;
  else {
    int64_t v22 = (unint64_t)v21;
  }
  CFTypeID v23 = (dispatch_source_s *)qword_100067240;
  dispatch_time_t v24 = dispatch_time(0LL, v22);
  dispatch_source_set_timer(v23, v24, 0x4A817C800uLL, 0LL);
}

void sub_100015BC8()
{
}

void sub_100015BE0()
{
}

void sub_100015BF4(id a1)
{
  word_100067228 = 257;
  sub_100015C08(1);
}

void sub_100015C08(char a1)
{
  if (qword_1000678E8) {
    *(void *)qword_1000678E8 = 0LL;
  }
  *(void *)&xmmword_100067218 = CFAbsoluteTimeGetCurrent();
  BYTE8(xmmword_10006721_Block_object_dispose(va, 8) = a1;
  sub_1000158D4(1);
}

uint64_t sub_100015C58()
{
  uint64_t v3 = 0LL;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000LL;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100015CE4;
  block[3] = &unk_100058F60;
  void block[4] = &v3;
  dispatch_sync((dispatch_queue_t)qword_100066F78, block);
  uint64_t v0 = v4[3];
  _Block_object_dispose(&v3, 8);
  return v0;
}

CFTypeRef sub_100015CE4(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = sub_100015D2C();
  CFTypeRef result = *(CFTypeRef *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  if (result) {
    return CFRetain(result);
  }
  return result;
}

uint64_t sub_100015D2C()
{
  uint64_t v0 = &dword_100000018;
  while (1)
  {
    uint64_t v1 = *(const __CFDictionary **)((char *)&qword_100066F98 + v0);
    if (v1)
    {
      Value = CFDictionaryGetValue(v1, @"Transport Type");
      CFTypeID TypeID = CFStringGetTypeID();
      if (Value)
      {
        if (CFGetTypeID(Value) == TypeID && CFEqual(Value, @"Internal")) {
          break;
        }
      }
    }

    v0 += 40LL;
    if (v0 == 664) {
      return 0LL;
    }
  }

  return *(uint64_t *)((char *)&qword_100066F98 + v0);
}

uint64_t sub_100015DD4()
{
  return dword_100067248;
}

uint64_t sub_100015DE0()
{
  uint64_t v3 = 0LL;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000LL;
  char v6 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100015E70;
  block[3] = &unk_100058F60;
  void block[4] = &v3;
  dispatch_sync((dispatch_queue_t)qword_100066F78, block);
  uint64_t v0 = *((unsigned __int8 *)v4 + 24);
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_100015E70(uint64_t a1)
{
  if (qword_100066F90 && *(void *)qword_100066F90)
  {
    __int16 v2 = *(_WORD *)(*(void *)qword_100066F90 + 16LL);
    if ((v2 & 0x40) != 0) {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = (v2 & 0x800) != 0;
    }
  }

void sub_100015EC4(uint64_t a1)
{
  uint64_t v2 = qword_100066F90;
  sub_1000158D4(0);
  dispatch_assert_queue_V2((dispatch_queue_t)qword_100066F78);
  if (!(_DWORD)qword_100067258) {
    return;
  }
  if (a1 || (a1 = *(void *)v2) != 0)
  {
    if (*(void *)(a1 + 8))
    {
      unsigned int v3 = *(unsigned __int16 *)(a1 + 16);
      int v4 = v3 & 1;
      int v5 = (v3 >> 1) & 1;
      if (dword_100066948 != v4) {
        byte_100067235 = 1;
      }
      int v6 = *(_WORD *)(a1 + 16) & 1;
      double v7 = (void *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 8), @"AdapterDetails");
      sub_1000175B4(v6, v7);
      dispatch_assert_queue_barrier((dispatch_queue_t)qword_100066F78);
      dispatch_assert_queue_V2((dispatch_queue_t)qword_100066F78);
      if ((int)qword_100067258 >= 1)
      {
        uint64_t v8 = qword_100067258;
        uint64_t v9 = v2;
        do
        {
          uint64_t v10 = *(void *)v9;
          unsigned int v11 = *(_DWORD *)(*(void *)v9 + 96LL);
          if ((v11 & 0x80000000) == 0 && (*(_WORD *)(v10 + 16) & 0x40) != 0)
          {
            if (v11 < 0x4B1) {
              goto LABEL_16;
            }
            int v12 = 1200;
          }

          else
          {
            int v12 = -1;
          }

          *(_DWORD *)(v10 + 96) = v12;
LABEL_16:
          v9 += 8LL;
          --v8;
        }

        while (v8);
      }

      *(_WORD *)(*(void *)v2 + 16LL) = *(_WORD *)(*(void *)v2 + 16LL) & 0xFEFF | ((*(_DWORD *)(*(void *)v2 + 96LL) == -1) << 8);
      int v13 = *(_DWORD *)(a1 + 36);
      if (v13)
      {
        int v13 = llround((double)(100 * *(_DWORD *)(a1 + 32)) / (double)v13);
        if (v13 >= 100) {
          int v13 = 100;
        }
      }

      if (v13 <= 1) {
        int v14 = 1;
      }
      else {
        int v14 = v13;
      }
      if (v5 || BYTE8(xmmword_100067218) || dword_10006694C || (int v15 = dword_100066950, v14 <= dword_100066950))
      {
        int v15 = v14;
      }

      *(_DWORD *)(a1 + 100) = v15;
      dword_100066950 = v15;
      dword_100066948 = v4;
      dword_10006694C = v5;
      dword_100066954 = (*(unsigned __int16 *)(a1 + 16) >> 3) & 1;
      uint64_t v16 = qword_100067238;
      if (!qword_100067238
        || (dispatch_assert_queue_barrier((dispatch_queue_t)qword_100066F78),
            (CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks)) == 0LL))
      {
LABEL_145:
        dispatch_assert_queue_barrier((dispatch_queue_t)qword_100066F78);
        dispatch_assert_queue_V2((dispatch_queue_t)qword_100066F78);
        uint64_t v88 = qword_100066F90;
        int v89 = dword_100067248;
        HIDWORD(v18_Block_object_dispose(va, 8) = -1;
        int v189 = -1;
        dispatch_assert_queue_V2((dispatch_queue_t)qword_100066F78);
        uint64_t v90 = sub_10001AFFC(@"UPS");
        dispatch_assert_queue_V2((dispatch_queue_t)qword_100066F78);
        if ((_DWORD)qword_100067258)
        {
          else {
            uint64_t v91 = 0LL;
          }
        }

        else
        {
          uint64_t v91 = 0LL;
        }

        if (!(v91 | v90)) {
          return;
        }
        int v183 = v89;
        dispatch_assert_queue_V2((dispatch_queue_t)qword_100066F78);
        if ((int)qword_100067258 < 1)
        {
          uint64_t v93 = 0LL;
        }

        else
        {
          uint64_t v92 = 0LL;
          uint64_t v93 = 0LL;
          do
          {
            uint64_t v94 = *(void *)(v88 + 8 * v92);
            if ((*(_WORD *)(v94 + 16) & 0x40) != 0) {
              uint64_t v93 = (*(_DWORD *)(v94 + 96) + v93);
            }
            ++v92;
            dispatch_assert_queue_V2((dispatch_queue_t)qword_100066F78);
          }

          while (v92 < (int)qword_100067258);
        }

        CFTypeID v95 = (const __CFDictionary *)sub_10001AFFC(@"Battery Case");
        v96 = v95;
        if (v95)
        {
          int valuePtr = 0;
          *(_DWORD *)value = 0;
          double v97 = (const __CFNumber *)CFDictionaryGetValue(v95, @"Current Capacity");
          v98 = (const __CFNumber *)CFDictionaryGetValue(v96, @"Max Capacity");
          int v99 = 0;
          if (v97)
          {
            int v100 = v98;
            if (v98)
            {
              CFNumberGetValue(v97, kCFNumberIntType, value);
              CFNumberGetValue(v100, kCFNumberIntType, &valuePtr);
              if (valuePtr) {
                int v99 = 100 * *(_DWORD *)value / valuePtr;
              }
              else {
                int v99 = 0;
              }
            }
          }

          CFDictionaryGetValueIfPresent(v96, @"Is Charging", (const void **)((char *)&v188 + 4));
          if (dword_100067274) {
            int v110 = 100 * dword_100067270 / dword_100067274;
          }
          else {
            int v110 = 0;
          }
          if (HIDWORD(v188) != dword_100066D28 || v99 != v110 || (LODWORD(v96) = 0, !dword_100067274) && valuePtr) {
            LODWORD(v96) = 1;
          }
          dword_100066D28 = HIDWORD(v188);
          dword_100067274 = valuePtr;
          dword_100067270 = *(_DWORD *)value;
          if (v90) {
            goto LABEL_185;
          }
        }

        else
        {
          dword_100066D28 = -1;
          dword_100067274 = 0;
          dword_100067270 = 0;
          if (v90)
          {
LABEL_185:
            v111 = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)v90, @"Time to Empty");
            if (v111)
            {
              CFNumberGetValue(v111, kCFNumberIntType, &v189);
              int v112 = v189;
              if (v189 == -1) {
                int v112 = 0;
              }
              uint64_t v93 = (v112 + v93);
            }

            v113 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)v90, @"Power Source State");
            if (v113) {
              int v101 = CFStringCompare(v113, @"AC Power", 0LL) == kCFCompareEqualTo;
            }
            else {
              int v101 = 0;
            }
            if (dword_100066D24 != v101)
            {
              byte_100067235 = 1;
              dword_100066D24 = v101;
            }

LABEL_194:
            int v181 = (int)v96;
            if (v91)
            {
              unsigned int v114 = *(unsigned __int16 *)(v91 + 16);
              int v177 = (v114 >> 8) & 1;
              unsigned int v115 = (v114 >> 3) & 1;
              int v116 = *(_DWORD *)(v91 + 100);
              int v117 = *(_DWORD *)(v91 + 36);
              if (v117) {
                char v178 = *(_BYTE *)(v91 + 24) | ((100 * *(_DWORD *)(v91 + 32) / v117) > 0x63);
              }
              else {
                char v178 = 0;
              }
              if (v90) {
                int v130 = (v101 != 0) & v114;
              }
              else {
                int v130 = v114 & 1;
              }
              int v123 = (v114 >> 1) & 1;
              int v126 = (v114 >> 4) & 1;
              int v124 = (v114 >> 5) & 1;
              BOOL v125 = *(_DWORD *)(v91 + 20) != 0;
            }

            else
            {
              int valuePtr = 0;
              *(_DWORD *)value = 0;
              BOOL v185 = v101 != 0;
              BOOL v118 = v189 != -1 || v101 != 0;
              int v177 = v118;
              CFBooleanRef v119 = (CFBooleanRef)CFDictionaryGetValue((CFDictionaryRef)v90, @"Is Charging");
              v120 = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)v90, @"Current Capacity");
              if (v120) {
                CFNumberGetValue(v120, kCFNumberIntType, &valuePtr);
              }
              v121 = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)v90, @"Max Capacity");
              if (v121) {
                CFNumberGetValue(v121, kCFNumberIntType, value);
              }
              int v122 = 0;
              if (valuePtr && *(_DWORD *)value) {
                int v122 = 100 * valuePtr / *(_DWORD *)value;
              }
              int v123 = 0;
              int v124 = 0;
              BOOL v125 = 0;
              BOOL v42 = v101 == 0;
              int v126 = 0;
              int v116 = v122;
              char v129 = !v42 && v122 > 94 && v119 != kCFBooleanTrue;
              char v178 = v129;
              unsigned int v115 = v119 == kCFBooleanTrue;
              int v130 = v185;
            }

            dispatch_assert_queue_V2((dispatch_queue_t)qword_100066F78);
            uint64_t v131 = (unsigned __int16)v93 | 0x80000u;
            unsigned int v186 = v130;
            if (v130) {
              uint64_t v131 = (unsigned __int16)v93 | 0x90000LL;
            }
            if (v123) {
              v131 |= 0x4000000uLL;
            }
            unsigned int v176 = v126;
            if (v126) {
              v131 |= 0x8000000uLL;
            }
            unsigned int v179 = v124;
            if (v124) {
              v131 |= 0x10000000uLL;
            }
            if (v177) {
              v131 |= 0x40000uLL;
            }
            if (v115) {
              v131 |= 0x20000uLL;
            }
            if (byte_100067234) {
              v131 |= 0x100000uLL;
            }
            if (v125) {
              uint64_t v132 = v131 | 0x20000000;
            }
            else {
              uint64_t v132 = v131;
            }
            if (sub_100015D2C()) {
              v132 |= 0x400000uLL;
            }
            dispatch_assert_queue_V2((dispatch_queue_t)qword_100066F78);
            if (sub_10001AFFC(@"UPS")) {
              v132 |= 0x800000uLL;
            }
            uint64_t v133 = v132 | (sub_100017A3C() << 56);
            uint64_t v134 = qword_100067278;
            int v135 = v116;
            if (qword_100067278 != v133)
            {
              qword_100067278 = v133;
              notify_set_state(dword_10006722C, v133);
              uint64_t v136 = notify_post("com.apple.system.powersources.timeremaining");
              v137 = (os_log_s *)qword_1000678E0;
              if ((_DWORD)v136)
              {
                uint64_t v138 = v136;
                if (os_log_type_enabled((os_log_t)qword_1000678E0, OS_LOG_TYPE_ERROR)) {
                  sub_100040DDC(v138, v137, v139, v140, v141, v142, v143, v144);
                }
              }

              else if (os_log_type_enabled((os_log_t)qword_1000678E0, OS_LOG_TYPE_DEFAULT))
              {
                v145 = "Batt";
                *(_DWORD *)value = 134218498;
                *(void *)&value[4] = v133;
                if (v186) {
                  v145 = "AC";
                }
                *(_WORD *)&value[12] = 1024;
                int v192 = v93;
                __int16 v193 = 2082;
                v194 = v145;
                _os_log_impl( (void *)&_mh_execute_header,  v137,  OS_LOG_TYPE_DEFAULT,  "Battery time remaining posted(0x%llx) Time:%d Source:%{public}s\n",  value,  0x1Cu);
              }
            }

            if (!v91) {
              goto LABEL_270;
            }
            int valuePtr = 1;
            dispatch_assert_queue_barrier((dispatch_queue_t)qword_100066F78);
            if ((_BYTE)word_100067228 || (*(_WORD *)(v91 + 16) & 1) != 0)
            {
              LOBYTE(word_10006722_Block_object_dispose(va, 8) = 0;
              int v146 = 1;
              if (HIDWORD(xmmword_100067218) == 1) {
                goto LABEL_259;
              }
              HIDWORD(xmmword_10006721_Block_object_dispose(va, 8) = 0;
            }

            else
            {
              if (BYTE8(xmmword_100067218))
              {
LABEL_255:
                int v146 = 1;
                goto LABEL_259;
              }

              if (v135 > 2)
              {
                int v146 = 2;
              }

              else
              {
                int v146 = 3;
              }
            }

            int valuePtr = v146;
LABEL_259:
            if (v146 > SHIDWORD(xmmword_100067218))
            {
              CFNumberRef v147 = CFNumberCreate(0LL, kCFNumberIntType, &valuePtr);
              if (v147)
              {
                CFNumberRef v148 = v147;
                v149 = (const __CFString *)qword_100067280;
                if (qword_100067280
                  || (v149 = SCDynamicStoreKeyCreate( kCFAllocatorDefault,  @"%@%@",  kSCDynamicStoreDomainState,  @"/IOKit/LowBatteryWarning"),  (qword_100067280 = (uint64_t)v149) != 0))
                {
                  sub_100038120(v149, v148);
                }

                else if (os_log_type_enabled((os_log_t)qword_1000678E0, OS_LOG_TYPE_ERROR))
                {
                  sub_100040DB0();
                }

                CFRelease(v148);
                sub_100018080("com.apple.system.powersources.lowbattery");
                uint64_t v150 = valuePtr;
                if (valuePtr != dword_100066D2C)
                {
                  v151 = (os_log_s *)qword_1000678E0;
                  if (os_log_type_enabled((os_log_t)qword_1000678E0, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)value = 67109376;
                    *(_DWORD *)&value[4] = v150;
                    *(_WORD *)&value[8] = 1024;
                    *(_DWORD *)&value[10] = v135;
                    _os_log_impl( (void *)&_mh_execute_header,  v151,  OS_LOG_TYPE_DEFAULT,  "Warning level: %d cap: %d\n",  value,  0xEu);
                    uint64_t v150 = valuePtr;
                  }

                  nullsub_4(v150, v93);
                  LODWORD(v150) = valuePtr;
                  dword_100066D2C = valuePtr;
                }
              }

              else
              {
                LODWORD(v150) = valuePtr;
              }

              HIDWORD(xmmword_10006721_Block_object_dispose(va, 8) = v150;
            }

LABEL_270:
            dispatch_assert_queue_V2((dispatch_queue_t)qword_100066F78);
            LODWORD(v152) = v135 | 0x80000;
            else {
              uint64_t v152 = v152;
            }
            if (v186) {
              v152 |= 0x10000uLL;
            }
            if (v115) {
              v152 |= 0x20000uLL;
            }
            if ((v178 & 1) != 0) {
              uint64_t v153 = v152 | 0x200000;
            }
            else {
              uint64_t v153 = v152;
            }
            if (v91) {
              v153 |= (unint64_t)(*(_WORD *)(v91 + 16) & 0x200) << 15;
            }
            uint64_t v154 = qword_100067288 ^ v153;
            if (qword_100067288 != v153)
            {
              qword_100067288 = v153;
              notify_set_state(dword_100067230, v153);
              if ((v154 & 0xFFFFFFFFFEDDFFFFLL) != 0)
              {
                notify_post("com.apple.system.powersources.percent");
                v155 = (os_log_s *)qword_1000678E0;
                if (os_log_type_enabled((os_log_t)qword_1000678E0, OS_LOG_TYPE_DEFAULT))
                {
                  v156 = "Batt";
                  *(_DWORD *)value = 134218498;
                  *(void *)&value[4] = v153;
                  if (v186) {
                    v156 = "AC";
                  }
                  *(_WORD *)&value[12] = 1024;
                  int v192 = v135;
                  __int16 v193 = 2082;
                  v194 = v156;
                  _os_log_impl( (void *)&_mh_execute_header,  v155,  OS_LOG_TYPE_DEFAULT,  "Battery capacity change posted(0x%llx). Capacity:%d Source:%{public}s\n",  value,  0x1Cu);
                }
              }

              if ((v154 & 0x1000000) != 0) {
                sub_100018080("com.apple.system.powersources.criticallevel");
              }
            }

            if (((v135 == v183) & ~v181) == 0 && v134 == v133) {
              sub_100018080("com.apple.system.powersources.timeremaining");
            }
            dword_100067248 = v135;
            sub_1000322A4();
            if (byte_100067235)
            {
              byte_100067235 = 0;
              sub_1000156FC(2);
              v157 = (os_log_s *)qword_1000678E0;
              if (os_log_type_enabled((os_log_t)qword_1000678E0, OS_LOG_TYPE_DEFAULT))
              {
                v158 = "Batt";
                if (v186) {
                  v158 = "AC";
                }
                *(_DWORD *)value = 136446210;
                *(void *)&value[4] = v158;
                _os_log_impl( (void *)&_mh_execute_header,  v157,  OS_LOG_TYPE_DEFAULT,  "Power Source change. Source:%{public}s",  value,  0xCu);
              }

              notify_post("com.apple.system.powersources.source");
              kdebug_trace(728173060LL, v186, v115, v176, v179);
            }

            notify_post("com.apple.system.powersources");
            sub_1000156FC(32);
            return;
          }
        }

        int v101 = 0;
        goto LABEL_194;
      }

      uint64_t v18 = Mutable;
      CFTypeID v19 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      if (!v19)
      {
LABEL_144:

        goto LABEL_145;
      }

      CFBooleanRef v20 = kCFBooleanTrue;
      CFDictionarySetValue(v18, @"Battery Provides Time Remaining", kCFBooleanTrue);
      double v21 = *(const void **)(a1 + 128);
      if (v21) {
        CFDictionarySetValue(v18, @"Failure", v21);
      }
      v184 = (unsigned __int16 *)v16;
      int64_t v22 = *(const void **)(a1 + 152);
      if (v22) {
        CFDictionarySetValue(v18, @"ChargeStatus", v22);
      }
      CFDictionarySetValue(v18, @"Transport Type", @"Internal");
      CFDictionarySetValue(v18, @"Type", @"InternalBattery");
      if ((*(_WORD *)(a1 + 16) & 1) != 0) {
        CFTypeID v23 = @"AC Power";
      }
      else {
        CFTypeID v23 = @"Battery Power";
      }
      CFDictionarySetValue(v18, @"Power Source State", v23);
      CFBooleanRef v24 = kCFBooleanFalse;
      if ((*(_WORD *)(a1 + 16) & 0x800) != 0) {
        CFBooleanRef v25 = kCFBooleanTrue;
      }
      else {
        CFBooleanRef v25 = kCFBooleanFalse;
      }
      CFDictionarySetValue(v18, @"Optimized Battery Charging Engaged", v25);
      unsigned int v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
      else {
        CFBooleanRef v27 = kCFBooleanFalse;
      }
      CFDictionarySetValue(v18, @"LPM Active", v27);

      if ((*(_WORD *)(a1 + 16) & 2) != 0) {
        CFBooleanRef v28 = kCFBooleanTrue;
      }
      else {
        CFBooleanRef v28 = kCFBooleanFalse;
      }
      CFDictionarySetValue(v18, @"Raw External Connected", v28);
      CFNumberRef v29 = (const __CFDictionary *)sub_10001AFFC(@"Battery Case");
      uint64_t v30 = v29;
      if (!v29)
      {
        int v36 = 0;
        BOOL v37 = 0;
        goto LABEL_89;
      }

      v180 = v19;
      int valuePtr = 0;
      if (CFDictionaryGetValueIfPresent(v29, @"Current Capacity", (const void **)value))
      {
        uint64_t v31 = *(const void **)value;
        CFTypeID TypeID = CFNumberGetTypeID();
        if (v31)
        {
          if (CFGetTypeID(v31) == TypeID) {
            CFNumberGetValue(*(CFNumberRef *)value, kCFNumberIntType, &valuePtr);
          }
        }
      }

      int v189 = 0;
      if (CFDictionaryGetValueIfPresent(v30, @"Max Capacity", (const void **)value))
      {
        int v33 = *(const void **)value;
        CFTypeID v34 = CFNumberGetTypeID();
        if (v33)
        {
          if (CFGetTypeID(v33) == v34) {
            CFNumberGetValue(*(CFNumberRef *)value, kCFNumberIntType, &v189);
          }
        }
      }

      BOOL v182 = v189 && v189 >= valuePtr && 100 * valuePtr / v189 != 0;
      v188 = 0LL;
      if (CFDictionaryGetValueIfPresent(v30, @"Vendor ID", (const void **)value))
      {
        uint64_t v38 = *(const void **)value;
        CFTypeID v39 = CFNumberGetTypeID();
        if (v38)
        {
          if (CFGetTypeID(v38) == v39) {
            CFNumberGetValue(*(CFNumberRef *)value, kCFNumberIntType, (char *)&v188 + 4);
          }
        }
      }

      if (CFDictionaryGetValueIfPresent(v30, @"Product ID", (const void **)value))
      {
        uint64_t v40 = *(const void **)value;
        CFTypeID v41 = CFNumberGetTypeID();
        if (v40)
        {
          if (CFGetTypeID(v40) == v41) {
            CFNumberGetValue(*(CFNumberRef *)value, kCFNumberIntType, &v188);
          }
        }
      }

      BOOL v42 = HIDWORD(v188) == 10522 && (_DWORD)v188 == 405;
      int v36 = v42;
      uint64_t v30 = *(const __CFDictionary **)(a1 + 8);
      CFTypeID v43 = CFDictionaryGetTypeID();
      if (v30)
      {
        if (CFGetTypeID(v30) != v43) {
          goto LABEL_87;
        }
        uint64_t v30 = (const __CFDictionary *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 8), @"AdapterDetails");
        CFTypeID v44 = CFDictionaryGetTypeID();
        if (v30)
        {
          if (CFGetTypeID(v30) == v44)
          {
            LODWORD(v30) = CFDictionaryGetValue(v30, @"IsWireless") == kCFBooleanTrue;
            goto LABEL_88;
          }

LABEL_87:
          LODWORD(v30) = 0;
        }
      }

LABEL_88:
      CFTypeID v19 = v180;
      BOOL v37 = v182;
LABEL_89:
      __int16 v45 = *(_WORD *)(a1 + 16);
      else {
        __int16 v46 = 0;
      }
      *(_WORD *)(a1 + 16) = v46 | v45 & 0xFFEF;
      else {
        CFBooleanRef v47 = kCFBooleanFalse;
      }
      CFDictionarySetValue(v18, @"Show Charging UI", v47);
      __int16 v48 = *(_WORD *)(a1 + 16);
      if ((v48 & 1) != 0 || (v36 | v30) == 1)
      {
        __int16 v49 = v48 | 0x20;
        CFBooleanRef v50 = kCFBooleanTrue;
      }

      else
      {
        __int16 v49 = v48 & 0xFFDF;
        CFBooleanRef v50 = kCFBooleanFalse;
      }

      *(_WORD *)(a1 + 16) = v49;
      CFDictionarySetValue(v18, @"Play Charging Chime", v50);
      unsigned int v51 = *(_DWORD *)(a1 + 36);
      if (v51)
      {
        unsigned int v51 = *(_DWORD *)(a1 + 100);
        int v52 = 100;
      }

      else
      {
        int v52 = 0;
      }

      v188 = (void *)__PAIR64__(v52, v51);
      CFNumberRef v53 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, (char *)&v188 + 4);
      if (v53)
      {
        CFNumberRef v54 = v53;
        CFDictionarySetValue(v18, @"Max Capacity", v53);
        CFRelease(v54);
      }

      CFNumberRef v55 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &v188);
      if (v55)
      {
        CFNumberRef v56 = v55;
        CFDictionarySetValue(v18, @"Current Capacity", v55);
        CFRelease(v56);
      }

      if ((*(_WORD *)(a1 + 16) & 0x40) != 0) {
        CFBooleanRef v57 = kCFBooleanTrue;
      }
      else {
        CFBooleanRef v57 = kCFBooleanFalse;
      }
      CFDictionarySetValue(v18, @"Is Present", v57);
      int v189 = *(_DWORD *)(a1 + 96);
      int valuePtr = 0;
      CFNumberRef v58 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
      __int16 v59 = *(_WORD *)(a1 + 16);
      if ((v59 & 0x40) != 0)
      {
        if ((v59 & 8) == 0)
        {
          CFDictionarySetValue(v18, @"Is Charging", kCFBooleanFalse);
          if ((*(_WORD *)(a1 + 16) & 1) != 0)
          {
            CFDictionarySetValue(v18, @"Time to Full Charge", v58);
            CFDictionarySetValue(v18, @"Time to Empty", v58);
            int v159 = *(_DWORD *)(a1 + 36);
            __int128 v62 = @"Is Charged";
            __int128 v66 = v18;
            CFBooleanRef v67 = v24;
LABEL_123:
            CFDictionarySetValue(v66, v62, v67);
            CFRelease(v58);
            if (*(void *)(a1 + 136)) {
              __int128 v68 = *(const __CFString **)(a1 + 136);
            }
            else {
              __int128 v68 = @"Unnamed";
            }
            CFDictionarySetValue(v18, @"Name", v68);
            __int128 v69 = (id *)v184;
            if (*((_DWORD *)v184 + 1) != 2)
            {
              int v187 = *v184 | (*((_DWORD *)v184 + 2) << 16);
              CFNumberRef v70 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &v187);
              if (v70)
              {
                CFNumberRef v71 = v70;
                CFDictionarySetValue(v18, @"Power Source ID", v70);
                CFRelease(v71);
              }
            }

            id v72 = sub_1000051BC();
            int v73 = (void *)objc_claimAutoreleasedReturnValue(v72);
            int v74 = v19;
            -[NSMutableDictionary setObject:forKeyedSubscript:]( v19,  "setObject:forKeyedSubscript:",  v73,  @"Trusted Battery Data");
            double v75 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *(unsigned int *)(a1 + 60)));
            id v76 = v73;
            id v77 = v75;
            if (v76)
            {
              uint64_t v78 = objc_claimAutoreleasedReturnValue([v76 objectForKeyedSubscript:@"Trusted Data Enabled"]);
              if (v78)
              {
                CFNumberRef v79 = (void *)v78;
                CFNumberRef v80 = (void *)objc_claimAutoreleasedReturnValue([v76 objectForKeyedSubscript:@"Trusted Data Enabled"]);
                if ([v80 intValue])
                {
                  CFNumberRef v81 = (void *)objc_claimAutoreleasedReturnValue([v76 objectForKeyedSubscript:@"Trusted Cycle Count"]);

                  __int128 v69 = (id *)v184;
                  if (v81)
                  {
                    id v82 = (id)objc_claimAutoreleasedReturnValue([v76 objectForKeyedSubscript:@"Trusted Cycle Count"]);
LABEL_136:
                    CFNumberRef v83 = v82;

                    CFTypeID v19 = v74;
                    -[NSMutableDictionary setObject:forKeyedSubscript:]( v74,  "setObject:forKeyedSubscript:",  v83,  @"Cycle count");

                    unint64_t v84 = *(void *)(a1 + 80);
                    if (v84)
                    {
                      CFNumberRef v85 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  (double)v84));
                      -[NSMutableDictionary setObject:forKeyedSubscript:]( v74,  "setObject:forKeyedSubscript:",  v85,  @"Date of first use");
                    }

                    if (qword_100067290)
                    {
                      id v86 = (id)qword_100067290;
LABEL_140:
                      -[NSMutableDictionary setObject:forKeyedSubscript:]( v19,  "setObject:forKeyedSubscript:",  v86,  @"Date of manufacture");
LABEL_141:
                      objc_storeStrong(v69 + 4, v19);
                      id v87 = v69[3];
                      if (v87) {
                        CFRelease(v87);
                      }
                      v69[3] = v18;

                      goto LABEL_144;
                    }

                    id v102 = (id)qword_100066F88;
                    if (!v102)
                    {
                      id v86 = 0LL;
                      goto LABEL_141;
                    }

                    v103 = v102;
                    if ([v102 length] != (id)18)
                    {
                      if ([v103 length] == (id)17)
                      {
                        id v160 = v103;
                        id v161 = objc_claimAutoreleasedReturnValue([v160 uppercaseString]);
                        unsigned int v162 = *((char *)[v161 UTF8String] + 3);

                        id v163 = objc_claimAutoreleasedReturnValue([v160 uppercaseString]);
                        int v164 = *((char *)[v163 UTF8String] + 6);

                        value[2] = 0;
                        v165 = (void *)objc_claimAutoreleasedReturnValue([v160 uppercaseString]);

                        id v166 = v165;
                        *(_WORD *)value = *((_WORD *)[v166 UTF8String] + 2);

                        if ((v164 - 56) >= 0xFFFFFFF9 && v162 - 58 >= 0xFFFFFFF6)
                        {
                          unint64_t v168 = strtoul(value, 0LL, 10);
                          v109 = 0LL;
                          if (v168 - 54 >= 0xFFFFFFFFFFFFFFCBLL)
                          {
                            unint64_t v169 = v168;
                            uint64_t v170 = (v164 - 48);
                            if (v162 >= 0x32) {
                              int v171 = 1972;
                            }
                            else {
                              int v171 = 1982;
                            }
                            uint64_t v172 = v171 + v162;
                            v173 = objc_alloc_init(&OBJC_CLASS___NSDateComponents);
                            -[NSDateComponents setWeekday:](v173, "setWeekday:", v170);
                            -[NSDateComponents setWeekOfYear:](v173, "setWeekOfYear:", v169);
                            -[NSDateComponents setYearForWeekOfYear:](v173, "setYearForWeekOfYear:", v172);
                            v174 = -[NSCalendar initWithCalendarIdentifier:]( objc_alloc(&OBJC_CLASS___NSCalendar),  "initWithCalendarIdentifier:",  NSCalendarIdentifierGregorian);
                            v175 = (void *)objc_claimAutoreleasedReturnValue( +[NSTimeZone timeZoneWithAbbreviation:]( &OBJC_CLASS___NSTimeZone,  "timeZoneWithAbbreviation:",  @"UTC"));
                            -[NSCalendar setTimeZone:](v174, "setTimeZone:", v175);

                            v109 = (NSDate *)objc_claimAutoreleasedReturnValue(-[NSCalendar dateFromComponents:](v174, "dateFromComponents:", v173));
                          }
                        }

                        else
                        {
                          v109 = 0LL;
                        }

                        __int128 v69 = (id *)v184;
                        CFTypeID v19 = v74;
LABEL_311:
                        v167 = (void *)qword_100067290;
                        qword_100067290 = (uint64_t)v109;
                      }

                      id v86 = (id)qword_100067290;

                      if (!v86) {
                        goto LABEL_141;
                      }
                      goto LABEL_140;
                    }

                    *(_DWORD *)value = 0;
                    id v104 = objc_claimAutoreleasedReturnValue([v103 uppercaseString]);
                    v105 = (char *)[v104 UTF8String];
                    *(_WORD *)value = *(_WORD *)(v105 + 3);
                    value[2] = v105[5];

                    uint64_t v106 = 0LL;
                    while (1)
                    {
                      int v107 = (char)value[v106];
                      if (v107 > 79) {
                        break;
                      }
                      if (v107 >= 74)
                      {
                        char v108 = -1;
                        goto LABEL_172;
                      }

LABEL_173:
                      if (++v106 == 3)
                      {
                        v109 =  +[NSDate dateWithTimeIntervalSince1970:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSince1970:",  (double)(86400 * strtoull(value, 0LL, 34)));
                        goto LABEL_311;
                      }
                    }

                    char v108 = -2;
LABEL_172:
                    value[v106] = v108 + v107;
                    goto LABEL_173;
                  }
                }

                else
                {

                  __int128 v69 = (id *)v184;
                }
              }
            }

            id v82 = v77;
            goto LABEL_136;
          }

          CFNumberRef v60 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &v189);
          if (v60)
          {
            CFNumberRef v61 = v60;
            CFDictionarySetValue(v18, @"Time to Empty", v60);
            CFRelease(v61);
          }

          __int128 v62 = @"Time to Full Charge";
LABEL_122:
          __int128 v66 = v18;
          CFBooleanRef v67 = v58;
          goto LABEL_123;
        }

        CFDictionarySetValue(v18, @"Is Charging", kCFBooleanTrue);
        int v63 = *(_DWORD *)(a1 + 36);
        if (!v63 || 100 * *(_DWORD *)(a1 + 32) / v63 <= 98) {
          CFBooleanRef v20 = kCFBooleanFalse;
        }
        CFDictionarySetValue(v18, @"Is Finishing Charge", v20);
        CFNumberRef v64 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &v189);
        if (v64)
        {
          CFNumberRef v65 = v64;
          CFDictionarySetValue(v18, @"Time to Full Charge", v64);
          CFRelease(v65);
        }
      }

      else
      {
        CFDictionarySetValue(v18, @"Is Charging", kCFBooleanFalse);
        CFDictionarySetValue(v18, @"Time to Full Charge", v58);
      }

      __int128 v62 = @"Time to Empty";
      goto LABEL_122;
    }
  }

  uint64_t v35 = (os_log_s *)qword_1000678E0;
  if (os_log_type_enabled((os_log_t)qword_1000678E0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)value = 0;
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "No batteries found yet..\n", value, 2u);
  }

void sub_1000175B4(int a1, void *a2)
{
  obuint64_t j = a2;
  dispatch_assert_queue_barrier((dispatch_queue_t)qword_100066F78);
  unsigned int v3 = (void *)qword_100066F68;
  if ((a1 & 1) != 0 || qword_100066F68)
  {
    if (HIBYTE(word_100067228))
    {
      HIBYTE(word_10006722_Block_object_dispose(va, 8) = 0;
      if (qword_100066F68)
      {
        qword_100066F68 = 0LL;
      }
    }

    if (a1)
    {
      if (!obj)
      {
        int v5 = 0LL;
        goto LABEL_21;
      }

      unsigned __int8 v4 = [obj isEqual:qword_100066F68];
      int v5 = obj;
      if ((v4 & 1) != 0) {
        goto LABEL_21;
      }
    }

    else
    {

      int v5 = 0LL;
    }

    int v6 = (void *)qword_100066F68;
    obuint64_t j = v5;
    if (qword_100066F68)
    {
      qword_100066F68 = 0LL;

      int v5 = obj;
    }

    if (v5) {
      objc_storeStrong((id *)&qword_100066F68, v5);
    }
    sub_100018080("com.apple.system.powermanagement.poweradapter");
    dispatch_assert_queue_V2((dispatch_queue_t)qword_100066F78);
    uint64_t v7 = qword_100066F90;
    if (qword_100066F90)
    {
      if (*(void *)qword_100066F90)
      {
        uint64_t v8 = *(const void **)(*(void *)qword_100066F90 + 8LL);
        CFTypeID TypeID = CFDictionaryGetTypeID();
        if (v8)
        {
          if (CFGetTypeID(v8) == TypeID) {
            sub_100006BEC(*(CFDictionaryRef *)(*(void *)v7 + 8LL));
          }
        }
      }
    }
  }

  int v5 = obj;
LABEL_21:
}

uint64_t sub_1000176D4(uint64_t a1)
{
  if (a1)
  {
    int v1 = *(_DWORD *)(a1 + 36);
    if (v1) {
      LOBYTE(v1) = *(_BYTE *)(a1 + 24) | ((100 * *(_DWORD *)(a1 + 32) / v1) > 0x63);
    }
  }

  else
  {
    LOBYTE(v1) = 0;
  }

  return v1 & 1;
}

void sub_100017710(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  int v5 = v4;
  if (v3 && v4)
  {
    xpc_object_t reply = xpc_dictionary_create_reply(v4);
    uint64_t v7 = reply;
    if (reply)
    {
      uint64_t v8 = (dispatch_queue_s *)qword_100066F78;
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472LL;
      v9[2] = sub_100017824;
      v9[3] = &unk_100059238;
      id v10 = reply;
      id v11 = v3;
      dispatch_sync(v8, v9);
    }

    else if (os_log_type_enabled((os_log_t)qword_1000678E0, OS_LOG_TYPE_ERROR))
    {
      sub_100040E40();
    }
  }

  else if (os_log_type_enabled((os_log_t)qword_1000678E0, OS_LOG_TYPE_ERROR))
  {
    sub_10003F010();
  }
}

void sub_100017824(uint64_t a1)
{
  uint64_t v2 = (void *)_CFXPCCreateXPCObjectFromCFObject(qword_100066F68);
  xpc_dictionary_set_value(*(xpc_object_t *)(a1 + 32), "adapterDetails", v2);
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 32));
  id v3 = (os_log_s *)qword_1000678E0;
  if (os_log_type_enabled((os_log_t)qword_1000678E0, OS_LOG_TYPE_DEBUG)) {
    sub_100040E6C(v3, v4, v5, v6, v7, v8, v9, v10);
  }
}

uint64_t sub_100017894()
{
  uint64_t v3 = 0LL;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000LL;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100017920;
  block[3] = &unk_100058F60;
  void block[4] = &v3;
  dispatch_sync((dispatch_queue_t)qword_100066F78, block);
  uint64_t v0 = v4[3];
  _Block_object_dispose(&v3, 8);
  return v0;
}

CFTypeRef sub_100017920(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = sub_10001AFFC(@"UPS");
  CFTypeRef result = *(CFTypeRef *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  if (result) {
    return CFRetain(result);
  }
  return result;
}

uint64_t sub_10001797C()
{
  uint64_t v3 = 0LL;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000LL;
  int v6 = 1;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100017A10;
  block[3] = &unk_100058F60;
  void block[4] = &v3;
  dispatch_sync((dispatch_queue_t)qword_100066F78, block);
  uint64_t v0 = *((unsigned int *)v4 + 6);
  _Block_object_dispose(&v3, 8);
  return v0;
}

uint64_t sub_100017A10(uint64_t a1)
{
  uint64_t result = sub_100017A3C();
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  return result;
}

uint64_t sub_100017A3C()
{
  uint64_t v0 = (const __CFDictionary *)sub_100015D2C();
  dispatch_assert_queue_V2((dispatch_queue_t)qword_100066F78);
  int v1 = (const __CFDictionary *)sub_10001AFFC(@"UPS");
  uint64_t v2 = v1;
  if (v0)
  {
    Value = CFDictionaryGetValue(v0, @"Power Source State");
    if (Value && CFEqual(Value, @"Battery Power")) {
      return 2LL;
    }
    if (v2)
    {
      uint64_t v5 = CFDictionaryGetValue(v2, @"Power Source State");
      if (v5)
      {
        int v6 = v5;
        if (CFEqual(v5, @"Battery Power")) {
          return 3LL;
        }
        CFEqual(v6, @"AC Power");
      }
    }

    return 1LL;
  }

  if (!v1) {
    return 1LL;
  }
  uint64_t v7 = CFDictionaryGetValue(v1, @"Power Source State");
  if (!v7) {
    return 1LL;
  }
  uint64_t v8 = v7;
  if (CFEqual(v7, @"AC Power")) {
    return 1LL;
  }
  if (CFEqual(v8, @"Battery Power")) {
    return 3LL;
  }
  else {
    return 1LL;
  }
}

uint64_t sub_100017B44(uint64_t a1, _OWORD *a2, uint64_t a3, _DWORD *a4)
{
  v11[0] = 0LL;
  v11[1] = v11;
  v11[2] = 0x2020000000LL;
  __int128 v6 = a2[1];
  *(_OWORD *)atoken.val = *a2;
  *(_OWORD *)&atoken.val[4] = v6;
  audit_token_to_au32(&atoken, 0LL, 0LL, 0LL, 0LL, 0LL, &pidp, 0LL, 0LL);
  *a4 = -536870212;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100017C38;
  block[3] = &unk_1000599B0;
  pid_t v9 = pidp;
  void block[4] = v11;
  void block[5] = a4;
  void block[6] = a3;
  dispatch_barrier_sync((dispatch_queue_t)qword_100066F78, block);
  _Block_object_dispose(v11, 8);
  return 0LL;
}

void sub_100017C20(_Unwind_Exception *a1)
{
}

void sub_100017C38(uint64_t a1)
{
  int v2 = dword_100066958;
  if (dword_100066958 == 0x7FFFFFFF)
  {
    int v2 = 5000;
    dword_100066958 = 5000;
  }

  int v3 = *(_DWORD *)(a1 + 56);
  dispatch_assert_queue_barrier((dispatch_queue_t)qword_100066F78);
  if (v2 == 99)
  {
    uint64_t v4 = 0LL;
  }

  else
  {
    __int128 v6 = &dword_100066FC0;
    uint64_t v4 = 1LL;
    while (1)
    {
      int v7 = *v6;
      v6 += 10;
      if (!v7) {
        break;
      }
      if (++v4 == 16)
      {
        uint64_t v5 = 0LL;
        goto LABEL_10;
      }
    }
  }

  uint64_t v5 = &qword_100066F98[5 * v4];
  v5[4] = 0LL;
  *(_OWORD *)uint64_t v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *((_DWORD *)v5 + 2) = v3;
  *(_DWORD *)uint64_t v5 = v2;
LABEL_10:
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v5;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    int v8 = dword_100066958++;
    **(_DWORD **)(a1 + 4_Block_object_dispose((const void *)(v1 - 72), 8) = v8;
    dispatch_source_t v9 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_proc,  *(int *)(a1 + 56),  0x80000000uLL,  (dispatch_queue_t)qword_100066F78);
    uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
    id v11 = *(void **)(v10 + 16);
    *(void *)(v10 + 16) = v9;

    uint64_t v12 = *(void *)(a1 + 32);
    int v13 = *(dispatch_source_s **)(*(void *)(*(void *)(v12 + 8) + 24LL) + 16LL);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_100017F3C;
    handler[3] = &unk_100058F60;
    void handler[4] = v12;
    dispatch_source_set_cancel_handler(v13, handler);
    uint64_t v14 = *(void *)(a1 + 32);
    int v15 = *(dispatch_source_s **)(*(void *)(*(void *)(v14 + 8) + 24LL) + 16LL);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_100018154;
    v25[3] = &unk_100058F60;
    v25[4] = v14;
    dispatch_source_set_event_handler(v15, v25);
    dispatch_resume(*(dispatch_object_t *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) + 16LL));
    **(_DWORD **)(a1 + 40) = 0;
    uint64_t v16 = (os_log_s *)qword_1000678E0;
    if (os_log_type_enabled((os_log_t)qword_1000678E0, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = **(_DWORD **)(a1 + 48);
      int v18 = *(_DWORD *)(a1 + 56);
      *(_DWORD *)buf = 67109376;
      int v28 = v17;
      __int16 v29 = 1024;
      int v30 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Created new power source id %d for pid %d\n",  buf,  0xEu);
    }
  }

  else
  {
    uint64_t v19 = 0LL;
    **(_DWORD **)(a1 + 40) = -536870181;
    CFBooleanRef v20 = (os_log_s *)qword_1000678E0;
    do
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        int v22 = HIDWORD(qword_100066F98[v19]);
        int v21 = qword_100066F98[v19 + 1];
        int v23 = qword_100066F98[v19];
        uint64_t v24 = qword_100066F98[v19 + 3];
        *(_DWORD *)buf = 67109890;
        int v28 = v23;
        __int16 v29 = 1024;
        int v30 = v21;
        __int16 v31 = 1024;
        int v32 = v22;
        __int16 v33 = 2112;
        uint64_t v34 = v24;
        _os_log_error_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "id:%d pid:%d type:%d desc:%@\n",  buf,  0x1Eu);
        CFBooleanRef v20 = (os_log_s *)qword_1000678E0;
      }

      v19 += 5LL;
    }

    while (v19 != 80);
  }

void sub_100017F3C(uint64_t a1)
{
  int v2 = *(_DWORD *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) + 4LL);
  if (v2 == 3) {
    int v3 = "com.apple.system.accpowersources.timeremaining";
  }
  else {
    int v3 = "com.apple.system.powersources.timeremaining";
  }
  if (v2 == 3) {
    uint64_t v4 = "com.apple.system.accpowersources.attach";
  }
  else {
    uint64_t v4 = "com.apple.system.powersources.attach";
  }
  sub_100018080(v3);
  sub_100018080(v4);
  uint64_t v5 = (os_log_s *)qword_1000678E0;
  if (os_log_type_enabled((os_log_t)qword_1000678E0, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = **(_DWORD **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
    v11[0] = 67109120;
    v11[1] = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Posted notifications for loss of power source id %d\n",  (uint8_t *)v11,  8u);
  }

  uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  int v8 = *(void **)(v7 + 16);
  *(void *)(v7 + 16) = 0LL;

  uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  uint64_t v10 = *(const void **)(v9 + 24);
  if (v10)
  {
    CFRelease(v10);
    uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  }

  *(void *)(v9 + 32) = 0LL;
  *(_OWORD *)uint64_t v9 = 0u;
  *(_OWORD *)(v9 + 16) = 0u;
  sub_100015EC4(0LL);
}

void sub_100018080(const char *a1)
{
  uint32_t v2 = notify_post(a1);
  int v3 = (os_log_s *)qword_1000678E0;
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)qword_1000678E0, OS_LOG_TYPE_ERROR)) {
      sub_100040EDC();
    }
  }

  else if (os_log_type_enabled((os_log_t)qword_1000678E0, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    uint64_t v5 = a1;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "posted '%s'\n", (uint8_t *)&v4, 0xCu);
  }

void sub_100018154(uint64_t a1)
{
}

uint64_t sub_100018168(uint64_t a1, __int128 *a2, int a3, uint64_t a4, int a5, uint64_t a6)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000181D4;
  block[3] = &unk_1000599F0;
  __int128 v6 = a2[1];
  __int128 v9 = *a2;
  __int128 v10 = v6;
  void block[4] = a6;
  void block[5] = a4;
  int v11 = a3;
  int v12 = a5;
  dispatch_sync((dispatch_queue_t)qword_100066F78, block);
  return 0LL;
}

uint64_t sub_1000181D4(uint64_t a1)
{
  int v2 = -536870206;
  int valuePtr = 0;
  __int128 v3 = *(_OWORD *)(a1 + 64);
  *(_OWORD *)atoken.val = *(_OWORD *)(a1 + 48);
  *(_OWORD *)&atoken.val[4] = v3;
  audit_token_to_au32(&atoken, 0LL, 0LL, 0LL, 0LL, 0LL, &pidp, 0LL, 0LL);
  **(_DWORD **)(a1 + 32) = -536870212;
  int v4 = (void *)IOCFUnserialize(*(const char **)(a1 + 40), 0LL, 0LL, 0LL);
  CFTypeID TypeID = CFDictionaryGetTypeID();
  if (!v4) {
    goto LABEL_126;
  }
  if (CFGetTypeID(v4) != TypeID)
  {
    **(_DWORD **)(a1 + 32) = -536870206;
    goto LABEL_27;
  }

  __int128 v6 = (unsigned int *)(a1 + 80);
  uint64_t v7 = sub_100018CB0(pidp, *(_DWORD *)(a1 + 80));
  if (!v7)
  {
    int v23 = (os_log_s *)qword_1000678E0;
    if (os_log_type_enabled((os_log_t)qword_1000678E0, OS_LOG_TYPE_ERROR)) {
      sub_100040F58((int *)(a1 + 80), &pidp, v23);
    }
    **(_DWORD **)(a1 + 32) = -536870160;
    goto LABEL_27;
  }

  int v8 = v7;
  __int128 v9 = CFDictionaryGetValue((CFDictionaryRef)v4, @"Power Source ID");
  CFTypeID v10 = CFNumberGetTypeID();
  if (!v9 || CFGetTypeID(v9) != v10)
  {
    int valuePtr = *(unsigned __int16 *)v8 | (*((_DWORD *)v8 + 2) << 16);
    CFNumberRef v11 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
    if (v11)
    {
      CFNumberRef v12 = v11;
      CFDictionarySetValue((CFMutableDictionaryRef)v4, @"Power Source ID", v11);
      CFRelease(v12);
    }
  }

  if (!*((_DWORD *)v8 + 1))
  {
    __int16 v29 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)v4, @"Type");
    CFTypeID v30 = CFStringGetTypeID();
    if (v29)
    {
      if (CFGetTypeID(v29) == v30)
      {
        if (CFStringCompare(v29, @"Accessory Source", 0LL))
        {
          if (CFStringCompare(v29, @"UPS", 0LL) && CFStringCompare(v29, @"Battery Case", 0LL))
          {
            if (CFStringCompare(v29, @"InternalBattery", 0LL)) {
              goto LABEL_9;
            }
            int v31 = 1;
          }

          else
          {
            int v31 = 2;
          }
        }

        else
        {
          int v31 = 3;
        }

        *((_DWORD *)v8 + 1) = v31;
      }
    }
  }

LABEL_9:
  unsigned int v13 = *v6;
  pid_t v14 = pidp;
  int v15 = CFDictionaryGetValue((CFDictionaryRef)v4, @"Debug Information");
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(kCFAllocatorDefault, 0LL, (CFDictionaryRef)v4);
  -[__CFDictionary removeObjectForKey:](MutableCopy, "removeObjectForKey:", @"Debug Information");
  int v18 = (os_log_s *)qword_1000678E0;
  if (os_log_type_enabled((os_log_t)qword_1000678E0, OS_LOG_TYPE_DEFAULT))
  {
    atoken.val[0] = 67109634;
    atoken.val[1] = v13;
    LOWORD(atoken.val[2]) = 1024;
    *(unsigned int *)((char *)&atoken.val[2] + 2) = v14;
    HIWORD(atoken.val[3]) = 2112;
    *(void *)&atoken.val[4] = MutableCopy;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Received power source(psid:%d) update from pid %d: %@\n",  (uint8_t *)&atoken,  0x18u);
  }

  if (v16)
  {
    uint64_t v19 = (os_log_s *)qword_1000678E0;
    if (os_log_type_enabled((os_log_t)qword_1000678E0, OS_LOG_TYPE_DEBUG))
    {
      atoken.val[0] = 67109634;
      atoken.val[1] = v13;
      LOWORD(atoken.val[2]) = 1024;
      *(unsigned int *)((char *)&atoken.val[2] + 2) = v14;
      HIWORD(atoken.val[3]) = 2112;
      *(void *)&atoken.val[4] = v16;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEBUG,  "Received power source(psid:%d) update from pid %d: %@\n",  (uint8_t *)&atoken,  0x18u);
    }
  }

  CFBooleanRef v20 = (CFDictionaryRef *)v8;
  int v21 = *((_DWORD *)v8 + 1);
  if ((v21 - 1) >= 2)
  {
    if (v21 == 3)
    {
      uint64_t v94 = 0LL;
      uint64_t v24 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)v4, @"Power Source State");
      CFBooleanRef v25 = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)v4, @"Current Capacity");
      if (!v25 || (CFNumberGetValue(v25, kCFNumberIntType, &v94), !v24))
      {
        if (os_log_type_enabled((os_log_t)qword_1000678E0, OS_LOG_TYPE_ERROR)) {
          sub_100040FE0();
        }
        CFRelease(v4);
        goto LABEL_126;
      }

      unsigned int v26 = (const __CFDictionary *)v8[3];
      if (!v26)
      {
        sub_100018080("com.apple.system.accpowersources.attach");
        sub_100018080("com.apple.system.accpowersources.timeremaining");
        uint64_t v34 = (os_log_s *)qword_1000678E0;
        if (os_log_type_enabled((os_log_t)qword_1000678E0, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v35 = *(_DWORD *)v8;
          atoken.val[0] = 67109120;
          atoken.val[1] = v35;
          _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "Posted notifications for new power source id %d\n",  (uint8_t *)&atoken,  8u);
        }

        goto LABEL_125;
      }

      CFBooleanRef v27 = (const __CFString *)CFDictionaryGetValue(v26, @"Power Source State");
      if (v27) {
        BOOL v28 = CFStringCompare(v24, v27, 0LL) != kCFCompareEqualTo;
      }
      else {
        BOOL v28 = 0;
      }
      int v36 = (const __CFNumber *)CFDictionaryGetValue(v20[3], @"Current Capacity");
      if (v36) {
        CFNumberGetValue(v36, kCFNumberIntType, (char *)&v94 + 4);
      }
      int v37 = v94;
      int v38 = HIDWORD(v94);
      uint64_t v89 = 0LL;
      CFTypeID v39 = (const __CFNumber *)CFDictionaryGetValue(v20[3], @"Is Charging");
      if (v39) {
        CFNumberGetValue(v39, kCFNumberIntType, (char *)&v89 + 4);
      }
      uint64_t v40 = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)v4, @"Is Charging");
      if (v40) {
        CFNumberGetValue(v40, kCFNumberIntType, &v89);
      }
      int v41 = HIDWORD(v89) != (_DWORD)v89 || v28;
      uint64_t v92 = 0LL;
      value = 0LL;
      BOOL v42 = CFDictionaryGetValueIfPresent(v20[3], @"Name", (const void **)&value) == 0;
      if (v42 == (CFDictionaryGetValueIfPresent((CFDictionaryRef)v4, @"Name", (const void **)&v92) != 0)
        || (CFTypeID v43 = value, v44 = CFStringGetTypeID(), v43)
        && CFGetTypeID(v43) == v44
        && (__int16 v45 = v92, v46 = CFStringGetTypeID(), v45)
        && CFGetTypeID(v45) == v46
        && !CFEqual(value, v92))
      {
        int v41 = 1;
      }

      uint64_t v90 = 0LL;
      uint64_t v91 = 0LL;
      BOOL v47 = CFDictionaryGetValueIfPresent(v20[3], @"Part Name", (const void **)&v91) == 0;
      if (v47 == (CFDictionaryGetValueIfPresent((CFDictionaryRef)v4, @"Part Name", (const void **)&v90) != 0)
        || (v48 = v91, CFTypeID v49 = CFStringGetTypeID(), v48)
        && CFGetTypeID(v48) == v49
        && (CFBooleanRef v50 = v90, v51 = CFStringGetTypeID(), v50)
        && CFGetTypeID(v50) == v51
        && !CFEqual(v91, v90))
      {
        int v41 = 1;
      }

      int v52 = (const __CFArray *)CFDictionaryGetValue(v20[3], @"LEDs");
      CFNumberRef v53 = (const __CFArray *)CFDictionaryGetValue((CFDictionaryRef)v4, @"LEDs");
      if ((unint64_t)v52 | (unint64_t)v53)
      {
        CFNumberRef v54 = v53;
        if ((v52 != 0LL) == (v53 != 0LL))
        {
          CFIndex Count = CFArrayGetCount(v52);
          CFIndex v56 = CFArrayGetCount(v54);
          if (!(Count | v56)) {
            goto LABEL_89;
          }
          if (Count == v56)
          {
            if (Count)
            {
              int v84 = v37;
              int v85 = v38;
              CFIndex v57 = 0LL;
              int v86 = v41;
              while (1)
              {
                ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v52, v57);
                __int16 v59 = (const __CFDictionary *)CFArrayGetValueAtIndex(v54, v57);
                CFNumberRef v60 = CFDictionaryGetValue(ValueAtIndex, @"State");
                CFNumberRef v61 = CFDictionaryGetValue(v59, @"State");
                if ((v60 != 0LL) != (v61 != 0LL) || v60 && v61 && !CFEqual(v60, v61)) {
                  break;
                }
                __int128 v62 = CFDictionaryGetValue(ValueAtIndex, @"Color");
                int v63 = CFDictionaryGetValue(v59, @"Color");
                if ((v62 != 0LL) != (v63 != 0LL)) {
                  break;
                }
                int v41 = v86;
                if (v62)
                {
                  if (v63 && !CFEqual(v62, v63)) {
                    break;
                  }
                }

                if (Count == ++v57) {
                  goto LABEL_88;
                }
              }

              int v41 = 1;
LABEL_88:
              int v37 = v84;
              int v38 = v85;
            }

            goto LABEL_89;
          }
        }

        int v41 = 1;
      }

LABEL_89:
      CFNumberRef v64 = (const __CFDictionary *)CFDictionaryGetValue(v20[3], @"AdapterDetails");
      CFNumberRef v65 = (const __CFDictionary *)CFDictionaryGetValue((CFDictionaryRef)v4, @"AdapterDetails");
      if ((unint64_t)v64 | (unint64_t)v65)
      {
        __int128 v66 = v65;
        if ((v64 != 0LL) != (v65 != 0LL))
        {
          int v41 = 1;
        }

        else
        {
          uint64_t v95 = 0LL;
          if (CFDictionaryGetValueIfPresent(v64, @"FamilyCode", (const void **)&atoken))
          {
            CFBooleanRef v67 = *(const void **)atoken.val;
            CFTypeID v68 = CFNumberGetTypeID();
            if (v67)
            {
              if (CFGetTypeID(v67) == v68) {
                CFNumberGetValue(*(CFNumberRef *)atoken.val, kCFNumberIntType, (char *)&v95 + 4);
              }
            }
          }

          if (CFDictionaryGetValueIfPresent(v66, @"FamilyCode", (const void **)&atoken)
            && (__int128 v69 = *(const void **)atoken.val, v70 = CFNumberGetTypeID(), v69)
            && CFGetTypeID(v69) == v70)
          {
            CFNumberGetValue(*(CFNumberRef *)atoken.val, kCFNumberIntType, &v95);
            int v71 = v95;
          }

          else
          {
            int v71 = 0;
          }

          if (HIDWORD(v95) != v71) {
            int v41 = 1;
          }
        }
      }

      CFBooleanRef v72 = (CFBooleanRef)CFDictionaryGetValue(v20[3], @"LPM Active");
      if (v72) {
        BOOL v73 = v72 == kCFBooleanTrue;
      }
      else {
        BOOL v73 = 0;
      }
      int v74 = v73;
      CFBooleanRef v75 = (CFBooleanRef)CFDictionaryGetValue((CFDictionaryRef)v4, @"LPM Active");
      if (v75) {
        BOOL v76 = v75 == kCFBooleanTrue;
      }
      else {
        BOOL v76 = 0;
      }
      int v77 = v76;
      if (v74 != v77 || v41 != 0)
      {
        sub_100018080("com.apple.system.accpowersources.source");
        CFNumberRef v79 = (os_log_s *)qword_1000678E0;
        if (os_log_type_enabled((os_log_t)qword_1000678E0, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v80 = *(_DWORD *)v20;
          atoken.val[0] = 136315394;
          *(void *)&atoken.val[1] = "com.apple.system.accpowersources.source";
          LOWORD(atoken.val[3]) = 1024;
          *(unsigned int *)((char *)&atoken.val[3] + 2) = v80;
          _os_log_impl( (void *)&_mh_execute_header,  v79,  OS_LOG_TYPE_DEFAULT,  "Posted %s for power source id %d\n",  (uint8_t *)&atoken,  0x12u);
        }
      }

      if (v37 != v38)
      {
        sub_100018080("com.apple.system.accpowersources.timeremaining");
        CFNumberRef v81 = (os_log_s *)qword_1000678E0;
        if (os_log_type_enabled((os_log_t)qword_1000678E0, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v82 = *(_DWORD *)v20;
          atoken.val[0] = 136315394;
          *(void *)&atoken.val[1] = "com.apple.system.accpowersources.timeremaining";
          LOWORD(atoken.val[3]) = 1024;
          *(unsigned int *)((char *)&atoken.val[3] + 2) = v82;
          _os_log_impl( (void *)&_mh_execute_header,  v81,  OS_LOG_TYPE_DEFAULT,  "Posted %s for power source id %d\n",  (uint8_t *)&atoken,  0x12u);
        }
      }

      CFRelease(v20[3]);
LABEL_125:
      int v2 = 0;
      v20[3] = (CFDictionaryRef)v4;
LABEL_126:
      **(_DWORD **)(a1 + 32) = v2;
      return vm_deallocate(mach_task_self_, *(void *)(a1 + 40), *(unsigned int *)(a1 + 84));
    }

uint64_t *sub_100018CB0(int a1, int a2)
{
  uint64_t v4 = 0LL;
  while (1)
  {
    if (LODWORD(qword_100066F98[v4]) == a2)
    {
      uint64_t result = &qword_100066F98[v4];
      if (LODWORD(qword_100066F98[v4 + 1]) == a1) {
        break;
      }
    }

    v4 += 5LL;
    if (v4 == 80) {
      return 0LL;
    }
  }

  return result;
}

void sub_100018D14(id a1)
{
}

uint64_t sub_100018D1C(uint64_t a1, _OWORD *a2, int a3)
{
  __int128 v4 = a2[1];
  *(_OWORD *)atoken.val = *a2;
  *(_OWORD *)&atoken.val[4] = v4;
  audit_token_to_au32(&atoken, 0LL, 0LL, 0LL, 0LL, 0LL, &pidp, 0LL, 0LL);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100018DB8;
  block[3] = &unk_1000598E8;
  int v7 = a3;
  pid_t v8 = pidp;
  dispatch_async((dispatch_queue_t)qword_100066F78, block);
  return 0LL;
}

void sub_100018DB8(uint64_t a1)
{
  int v2 = (os_log_s *)qword_1000678E0;
  if (os_log_type_enabled((os_log_t)qword_1000678E0, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(_DWORD *)(a1 + 32);
    v5[0] = 67109120;
    v5[1] = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "Releasing power source id = %d\n",  (uint8_t *)v5,  8u);
  }

  __int128 v4 = sub_100018CB0(*(_DWORD *)(a1 + 36), *(_DWORD *)(a1 + 32));
  if (v4) {
    dispatch_source_cancel((dispatch_source_t)v4[2]);
  }
}

void sub_100018E6C(void *a1, void *a2)
{
  int v3 = a1;
  id v4 = a2;
  uint64_t v5 = v4;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  if (v4)
  {
    xpc_object_t reply = xpc_dictionary_create_reply(v4);
    if (reply)
    {
      if (sub_100038E28(v3, @"com.apple.private.iokit.batterydataprecise", 0))
      {
        xpc_connection_get_audit_token(v3, &v14);
        int v7 = (dispatch_queue_s *)qword_100066F78;
        v9[0] = _NSConcreteStackBlock;
        v9[1] = 3221225472LL;
        v9[2] = sub_100019008;
        v9[3] = &unk_100059A18;
        id v10 = v5;
        __int128 v12 = v14;
        __int128 v13 = v15;
        id v8 = reply;
        id v11 = v8;
        dispatch_sync(v7, v9);
        xpc_connection_send_message(v3, v8);
      }

      else
      {
        if (os_log_type_enabled((os_log_t)qword_1000678E0, OS_LOG_TYPE_ERROR)) {
          sub_100041064();
        }
        xpc_dictionary_set_uint64(reply, "returnCode", 0xFFFFFFFFE00002C1LL);
        xpc_connection_send_message(v3, reply);
      }
    }

    else if (os_log_type_enabled((os_log_t)qword_1000678E0, OS_LOG_TYPE_ERROR))
    {
      sub_100041038();
    }
  }

  else if (os_log_type_enabled((os_log_t)qword_1000678E0, OS_LOG_TYPE_ERROR))
  {
    sub_10004100C();
  }
}

void sub_100019008(uint64_t a1)
{
  int uint64 = xpc_dictionary_get_uint64(*(xpc_object_t *)(a1 + 32), "powerInfoPrecise");
  __int128 v3 = *(_OWORD *)(a1 + 64);
  v8[0] = *(_OWORD *)(a1 + 48);
  v8[1] = v3;
  id v4 = sub_1000190E4(v8, uint64, 1LL);
  uint64_t v5 = objc_claimAutoreleasedReturnValue(v4);
  __int128 v6 = (void *)v5;
  if (v5)
  {
    int v7 = (void *)_CFXPCCreateXPCObjectFromCFObject(v5);
    xpc_dictionary_set_value(*(xpc_object_t *)(a1 + 40), "powerInfoPrecise", v7);
    xpc_dictionary_set_uint64(*(xpc_object_t *)(a1 + 40), "returnCode", 0LL);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)qword_1000678E0, OS_LOG_TYPE_ERROR)) {
      sub_100041090();
    }
    xpc_dictionary_set_uint64(*(xpc_object_t *)(a1 + 40), "returnCode", 0xFFFFFFFFE00002BCLL);
  }
}

NSMutableArray *sub_1000190E4(_OWORD *a1, int a2, uint64_t a3)
{
  uint64_t v6 = 0LL;
  int v7 = 0LL;
  id v8 = 0LL;
  uint64_t v24 = a1;
  do
  {
    __int128 v9 = &qword_100066F98[v6];
    id v10 = (NSMutableDictionary *)qword_100066F98[v6 + 3];
    switch(a2)
    {
      case 0:
        goto LABEL_10;
      case 1:
        if (HIDWORD(qword_100066F98[v6]) != 1) {
          break;
        }
        goto LABEL_10;
      case 2:
        if (HIDWORD(qword_100066F98[v6]) != 2) {
          break;
        }
        goto LABEL_10;
      case 3:
        goto LABEL_10;
      case 4:
        if (HIDWORD(qword_100066F98[v6]) == 3)
        {
LABEL_10:
          if (!v8)
          {
            id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
            id v10 = (NSMutableDictionary *)v9[3];
          }

          if (HIDWORD(qword_100066F98[v6]) == 1 && v10 != 0LL)
          {
            id v10 = -[NSMutableDictionary initWithDictionary:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithDictionary:",  v9[3]);

            if ((a3 & 1) != 0)
            {
              -[NSMutableDictionary addEntriesFromDictionary:]( v10,  "addEntriesFromDictionary:",  *(void *)(qword_100067238 + 32));
            }

            else
            {
              uint64_t v12 = a3;
              __int128 v13 = v10;
              dispatch_assert_queue_V2((dispatch_queue_t)qword_100066F78);
              if (_os_feature_enabled_impl("privacy", "ImprecisePowerData"))
              {
                __int128 v14 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v13,  "objectForKeyedSubscript:",  @"Current Capacity"));
                __int128 v15 = v14;
                if (v14)
                {
                  signed int v16 = [v14 intValue];
                  int v17 = 5 * (v16 / 5);
                  unsigned int v18 = v16 % 5;
                  if (v16 % 5 < 0) {
                    unsigned int v18 = -v18;
                  }
                  int v19 = v17 + 5 - v16;
                  if (v19 < 0) {
                    int v19 = v16 - (v17 + 5);
                  }
                  if (v18 >= v19) {
                    v17 += 5;
                  }
                  if (v17 <= 1) {
                    int v17 = 1;
                  }
                  else {
                    uint64_t v20 = v17;
                  }
                  int v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v20));
                  -[NSMutableDictionary setObject:forKeyedSubscript:]( v13,  "setObject:forKeyedSubscript:",  v21,  @"Current Capacity");
                }
              }

              a3 = v12;
              a1 = v24;
            }

            __int128 v22 = a1[1];
            __int128 v26 = *a1;
            __int128 v27 = v22;
            dispatch_assert_queue_V2((dispatch_queue_t)qword_100066F78);
            v25[0] = v26;
            v25[1] = v27;
            sub_1000382AC(v25, @"com.apple.private.iokit.batterydata");
            int v7 = v10;
          }

          -[NSMutableArray addObject:](v8, "addObject:", v10);
        }

        break;
      default:
        break;
    }

    v6 += 5LL;
  }

  while (v6 != 80);

  return v8;
}

void sub_100019390(void *a1, void *a2)
{
  __int128 v3 = a1;
  id v4 = a2;
  uint64_t v5 = v4;
  if (v3 && v4)
  {
    xpc_object_t reply = xpc_dictionary_create_reply(v4);
    if (!reply)
    {
      if (os_log_type_enabled((os_log_t)qword_1000678E0, OS_LOG_TYPE_ERROR)) {
        sub_100040E40();
      }
      goto LABEL_18;
    }

    uint64_t v7 = -536870212LL;
    int v8 = pthread_mutex_trylock(&stru_100066960);
    if (v8 > 21)
    {
      if (v8 == 22)
      {
        uint64_t v7 = -536870206LL;
        goto LABEL_17;
      }

      if (v8 != 35)
      {
LABEL_17:
        xpc_dictionary_set_uint64(reply, "returnCode", v7);
        xpc_connection_send_message(v3, reply);
        goto LABEL_18;
      }
    }

    else
    {
      if (!v8)
      {
        __int128 v9 = (dispatch_queue_s *)qword_100066F78;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_10001951C;
        block[3] = &unk_1000592E0;
        id v11 = v3;
        id v12 = v5;
        id v13 = reply;
        dispatch_async(v9, block);

LABEL_18:
        goto LABEL_19;
      }

      if (v8 != 16) {
        goto LABEL_17;
      }
    }

    uint64_t v7 = -536870187LL;
    goto LABEL_17;
  }

  if (os_log_type_enabled((os_log_t)qword_1000678E0, OS_LOG_TYPE_ERROR)) {
    sub_1000410BC();
  }
LABEL_19:
}

void sub_10001951C(uint64_t a1)
{
  uint64_t v2 = -536870207LL;
  if (sub_100038E28(*(xpc_connection_t *)(a1 + 32), @"com.apple.private.iokit.batterydateoffirstuse", 0))
  {
    xpc_object_t value = xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 40), "setBatteryDofu");
    id v4 = (void *)objc_claimAutoreleasedReturnValue(value);
    uint64_t v5 = (void *)_CFXPCCreateCFObjectFromXPCObject(v4);
    if (v5)
    {
      uint64_t v6 = (os_log_s *)qword_1000678E0;
      if (os_log_type_enabled((os_log_t)qword_1000678E0, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 138412290;
        int v8 = v5;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Request set battery DOFU: %@\n",  (uint8_t *)&v7,  0xCu);
      }

      uint64_t v2 = (int)sub_100019658(v5);
    }

    else
    {
      uint64_t v2 = -536870206LL;
    }
  }

  else
  {
    id v4 = 0LL;
    uint64_t v5 = 0LL;
  }

  xpc_dictionary_set_uint64(*(xpc_object_t *)(a1 + 48), "returnCode", v2);
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 32), *(xpc_object_t *)(a1 + 48));
  pthread_mutex_unlock(&stru_100066960);
}

uint64_t sub_100019658(void *a1)
{
  uint64_t v1 = 3758097090LL;
  id v2 = a1;
  if (v2)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)qword_100066F78);
    if (qword_100066F90 && *(void *)qword_100066F90 && *(void *)(*(void *)qword_100066F90 + 80LL))
    {
      uint64_t v1 = 0LL;
      goto LABEL_20;
    }

    __int128 v3 = -[NSCalendar initWithCalendarIdentifier:]( objc_alloc(&OBJC_CLASS___NSCalendar),  "initWithCalendarIdentifier:",  NSCalendarIdentifierGregorian);
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSCalendar components:fromDate:](v3, "components:fromDate:", 252LL, v2));
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSTimeZone timeZoneWithAbbreviation:]( &OBJC_CLASS___NSTimeZone,  "timeZoneWithAbbreviation:",  @"UTC"));
    -[NSCalendar setTimeZone:](v3, "setTimeZone:", v5);

    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSCalendar dateFromComponents:](v3, "dateFromComponents:", v4));
    if (os_log_type_enabled((os_log_t)qword_1000678E0, OS_LOG_TYPE_DEBUG)) {
      sub_1000411E0();
    }
    [v6 timeIntervalSinceReferenceDate];
    if (!(unint64_t)v7)
    {
LABEL_19:

      goto LABEL_20;
    }

    int v8 = -[NSNumber initWithUnsignedLongLong:]( objc_alloc(&OBJC_CLASS___NSNumber),  "initWithUnsignedLongLong:",  (unint64_t)v7);
    __int128 v9 = v8;
    if (v8)
    {
      id v10 = v8;
      io_registry_entry_t v11 = sub_10000ADA4();
      if (v11)
      {
        uint64_t v12 = IORegistryEntrySetCFProperty(v11, @"DateOfFirstUse", v10);
        if (!(_DWORD)v12)
        {

          __int128 v22 = (os_log_s *)qword_1000678E0;
          uint64_t v1 = 0LL;
          if (os_log_type_enabled((os_log_t)qword_1000678E0, OS_LOG_TYPE_DEFAULT))
          {
            int v23 = 138412290;
            uint64_t v24 = v10;
            _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Set battery DOFU: %@\n",  (uint8_t *)&v23,  0xCu);
            uint64_t v1 = 0LL;
          }

          goto LABEL_18;
        }

        uint64_t v13 = v12;
        __int128 v14 = (os_log_s *)qword_1000678E0;
        uint64_t v1 = 3758097097LL;
        if (os_log_type_enabled((os_log_t)qword_1000678E0, OS_LOG_TYPE_ERROR)) {
          sub_10004117C(v13, v14, v15, v16, v17, v18, v19, v20);
        }
      }

      else
      {
        uint64_t v1 = 3758097112LL;
      }

      if (os_log_type_enabled((os_log_t)qword_1000678E0, OS_LOG_TYPE_ERROR)) {
        sub_10004111C();
      }
    }

    else
    {
      uint64_t v1 = 3758097085LL;
    }

LABEL_18:
    goto LABEL_19;
  }

    ++v5;
  }

  while (v4 != v5);
  if (v6 != -1)
  {
    uint64_t v17 = (const __CFDictionary *)CFArrayGetValueAtIndex((CFArrayRef)a1, v6);
    uint64_t v18 = (const __CFString *)CFDictionaryGetValue(v17, @"Name");
    CFTypeID TypeID = CFStringGetTypeID();
    if (v18 && CFGetTypeID(v18) == TypeID)
    {
      if (CFStringGetCString(v18, buffer, 128LL, 0x8000100u)) {
        uint64_t v20 = buffer;
      }
      else {
        uint64_t v20 = 0LL;
      }
    }

    else
    {
      uint64_t v20 = 0LL;
    }

    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_10001DF14;
    v21[3] = &unk_100059C40;
    __int128 v22 = v7;
    v21[4] = v20;
    return analytics_send_event_lazy("com.apple.powerd.sleepdelay", v21);
  }

  return result;
}

  vm_deallocate(mach_task_self_, (vm_address_t)a4, v15);
  return 0LL;
}

  *(NDR_record_t *)(a2 + 24) = v11;
  return result;
}

  *(NDR_record_t *)(a2 + 24) = v11;
  return result;
}

  *(NDR_record_t *)(a2 + 24) = v11;
  return result;
}

uint64_t sub_1000198C4(uint64_t a1, __int128 *a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v8[1] = 3221225472LL;
  __int128 v6 = a2[1];
  __int128 v9 = *a2;
  v8[0] = _NSConcreteStackBlock;
  _OWORD v8[2] = sub_100019934;
  v8[3] = &unk_100059A38;
  __int128 v10 = v6;
  int v11 = a3;
  void v8[4] = a4;
  v8[5] = a5;
  v8[6] = a6;
  dispatch_sync((dispatch_queue_t)qword_100066F78, v8);
  return 0LL;
}

void sub_100019934(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 88);
  __int128 v3 = *(_OWORD *)(a1 + 72);
  v10[0] = *(_OWORD *)(a1 + 56);
  v10[1] = v3;
  id v4 = sub_1000190E4(v10, v2, 0LL);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (v5)
  {
    __int128 v9 = v5;
    CFDataRef Data = CFPropertyListCreateData(0LL, v5, kCFPropertyListBinaryFormat_v1_0, 0LL, 0LL);
    CFDataRef v7 = Data;
    if (Data)
    {
      unsigned int v8 = -[__CFData length](Data, "length");
      **(_DWORD **)(a1 + 40) = v8;
      vm_allocate(mach_task_self_, *(vm_address_t **)(a1 + 32), v8, 1);
      memcpy( **(void ***)(a1 + 32), -[__CFData bytes](v7, "bytes"), **(unsigned int **)(a1 + 40));
    }

    uint64_t v5 = v9;
  }

  else
  {
    **(void **)(a1 + 32) = 0LL;
    **(_DWORD **)(a1 + 40) = 0;
  }

  **(_DWORD **)(a1 + 4_Block_object_dispose((const void *)(v1 - 72), 8) = 0;
}

uint64_t sub_100019A24()
{
  uint64_t v3 = 0LL;
  id v4 = &v3;
  uint64_t v5 = 0x2020000000LL;
  dispatch_assert_queue_not_V2((dispatch_queue_t)qword_100066F78);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100019AD0;
  block[3] = &unk_100058F60;
  void block[4] = &v3;
  dispatch_sync((dispatch_queue_t)qword_100066F78, block);
  uint64_t v0 = *((unsigned int *)v4 + 6);
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_100019AB8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_100019AD0(uint64_t a1)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = qword_100067258;
}

BOOL sub_100019B0C(_DWORD *a1, uint64_t a2)
{
  uint64_t v7 = 0LL;
  unsigned int v8 = &v7;
  uint64_t v9 = 0x2020000000LL;
  char v10 = 0;
  if (qword_100066F78)
  {
    dispatch_assert_queue_not_V2((dispatch_queue_t)qword_100066F78);
    *a1 = 1;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100019BF0;
    block[3] = &unk_100059A60;
    void block[4] = &v7;
    void block[5] = a1;
    void block[6] = a2;
    dispatch_sync((dispatch_queue_t)qword_100066F78, block);
    BOOL v4 = *((_BYTE *)v8 + 24) != 0;
  }

  else
  {
    BOOL v4 = 0LL;
  }

  _Block_object_dispose(&v7, 8);
  return v4;
}

void sub_100019BD8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_100019BF0(void *a1)
{
  int v2 = (int *)a1[5];
  uint64_t v3 = (_DWORD *)a1[6];
  dispatch_assert_queue_V2((dispatch_queue_t)qword_100066F78);
  dispatch_assert_queue_V2((dispatch_queue_t)qword_100066F78);
  uint64_t v4 = qword_100067258;
  dispatch_assert_queue_V2((dispatch_queue_t)qword_100066F78);
  uint64_t v5 = 0LL;
  int v6 = 0;
  int v7 = 0;
  do
  {
    uint64_t v8 = *(void *)(qword_100066F90 + v5);
    if ((*(_WORD *)(v8 + 16) & 0x40) != 0)
    {
      ++v7;
      int v9 = *(_DWORD *)(v8 + 36);
      if (v9) {
        v6 += 100 * *(_DWORD *)(v8 + 32) / v9;
      }
    }

    v5 += 8LL;
  }

  while (8 * v4 != v5);
  if (v7)
  {
    *int v2 = *(_WORD *)(*(void *)qword_100066F90 + 16LL) & 1;
    *uint64_t v3 = v6;
    char v10 = 1;
  }

  else
  {
LABEL_9:
    char v10 = 0;
  }

  *(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL) = v10;
}

uint64_t sub_100019CD0()
{
  uint64_t v3 = 0LL;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000LL;
  dispatch_assert_queue_not_V2((dispatch_queue_t)qword_100066F78);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100019D7C;
  block[3] = &unk_100058F60;
  void block[4] = &v3;
  dispatch_sync((dispatch_queue_t)qword_100066F78, block);
  uint64_t v0 = *((unsigned int *)v4 + 6);
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_100019D64( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_100019D7C(uint64_t a1)
{
  BOOL v2 = 1;
  if ((_DWORD)qword_100067258)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)qword_100066F78);
    if (qword_100066F90)
    {
      if ((*(_WORD *)(*(void *)qword_100066F90 + 16LL) & 0x41) == 0x40) {
        BOOL v2 = 0;
      }
    }
  }

  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v2;
}

uint64_t sub_100019DFC(uint64_t a1)
{
  return nullsub_4(*(unsigned int *)(a1 + 32), *(unsigned __int8 *)(a1 + 36));
}

void sub_100019E0C(IONotificationPort *a1, io_iterator_t a2)
{
  io_object_t v4 = IOIteratorNext(a2);
  if (v4)
  {
    io_object_t v5 = v4;
    do
    {
      dispatch_assert_queue_V2((dispatch_queue_t)qword_100066F78);
      int v6 = calloc(1uLL, 0xB0uLL);
      *int v6 = v5;
      *((void *)v6 + 17) = CFStringCreateWithFormat( kCFAllocatorDefault,  0LL,  @"InternalBattery-%d",  dword_10006724C);
      int v7 = ++dword_10006724C;
      uint64_t v8 = (os_log_s *)qword_1000678E0;
      if (os_log_type_enabled((os_log_t)qword_1000678E0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        int v26 = v7;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Found battery: %d", buf, 8u);
      }

      CFMutableDictionaryRef Mutable = (__CFSet *)qword_100067250;
      if (!qword_100067250)
      {
        CFMutableDictionaryRef Mutable = CFSetCreateMutable(0LL, 1LL, 0LL);
        qword_100067250 = (uint64_t)Mutable;
      }

      CFSetAddValue(Mutable, v6);
      size_t Count = CFSetGetCount((CFSetRef)qword_100067250);
      qword_100067258 = Count;
      if (qword_100066F90)
      {
        free((void *)qword_100066F90);
        qword_100066F90 = 0LL;
      }

      qword_100066F90 = (uint64_t)calloc(Count, 8uLL);
      CFSetGetValues((CFSetRef)qword_100067250, (const void **)qword_100066F90);
      IOServiceAddInterestNotification( a1,  v5,  "IOGeneralInterest",  (IOServiceInterestCallback)sub_10001A278,  v6,  &notification);
      v6[1] = notification;
      sub_10001A2F4(v6, v5);
      IOObjectRelease(v5);
      io_object_t v5 = IOIteratorNext(a2);
    }

    while (v5);
  }

  sub_100027148();
  sub_10001D8AC();
  dispatch_async((dispatch_queue_t)qword_100066F78, &stru_100059AA0);
  uint64_t v11 = MGCopyAnswer(@"DeviceSupportsBatteryInformation", 0LL);
  uint64_t v12 = (void *)qword_100066F70;
  qword_100066F70 = v11;

  uint64_t v13 = qword_100066F70;
  uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v13, v14) & 1) == 0)
  {
    uint64_t v15 = (os_log_s *)qword_1000678E0;
    if (os_log_type_enabled((os_log_t)qword_1000678E0, OS_LOG_TYPE_ERROR)) {
      sub_100041240(v15, v16, v17, v18, v19, v20, v21, v22);
    }
  }

  if ([(id)qword_100066F70 BOOLValue]
    && _os_feature_enabled_impl("powerd", "dossier"))
  {
    if (qword_100067268 != -1) {
      dispatch_once(&qword_100067268, &stru_100059B20);
    }
    if (!byte_100067260)
    {
      xpc_object_t v23 = xpc_dictionary_create(0LL, 0LL, 0LL);
      xpc_dictionary_set_uint64(v23, XPC_ACTIVITY_INTERVAL, XPC_ACTIVITY_INTERVAL_1_HOUR);
      xpc_dictionary_set_string(v23, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
      xpc_dictionary_set_BOOL(v23, XPC_ACTIVITY_REQUIRES_BUDDY_COMPLETE, 1);
      xpc_activity_register("com.apple.powerd.dofu-monitor", v23, &stru_100059AE0);
    }
  }

uint64_t sub_10001A160(int a1, io_iterator_t iterator)
{
  char v5 = 0;
  uint64_t result = IOIteratorNext(iterator);
  if ((_DWORD)result)
  {
    sub_1000061B8();
    byte_1000678F8 = 1;
    if (sub_10003A3EC(1111905072, &v5)
      && os_log_type_enabled((os_log_t)qword_1000678E0, OS_LOG_TYPE_ERROR))
    {
      sub_10004132C();
    }

    byte_100066944 = (v5 & 4) != 0;
    io_object_t v4 = (os_log_s *)qword_1000678E0;
    if (os_log_type_enabled((os_log_t)qword_1000678E0, OS_LOG_TYPE_DEBUG)) {
      sub_1000412B0(v4);
    }
    return IOObjectRelease(iterator);
  }

  return result;
}

void sub_10001A228(int a1, io_iterator_t iterator)
{
  if (IOIteratorNext(iterator))
  {
    byte_100066944 = 0;
    if (os_log_type_enabled((os_log_t)qword_1000678E0, OS_LOG_TYPE_DEBUG)) {
      sub_100041358();
    }
  }

void sub_10001A278(_DWORD *a1, int a2, int a3)
{
  if (a3 == -536723200)
  {
    kdebug_trace(728173056LL, 0LL, 0LL, 0LL, 0LL);
    sub_10001A2F4(a1, a2);
  }

void sub_10001A2F4(_DWORD *a1, int a2)
{
  if (!a1) {
    return;
  }
  dispatch_assert_queue_barrier((dispatch_queue_t)qword_100066F78);
  *a1 = a2;
  CFMutableDictionaryRef properties = 0LL;
  CFBooleanRef v57 = kCFBooleanFalse;
  xpc_object_t value = kCFBooleanFalse;
  dispatch_assert_queue_barrier((dispatch_queue_t)qword_100066F78);
  uint64_t v4 = *((void *)a1 + 1);
  if (v4)
  {
    CFRelease(*((CFTypeRef *)a1 + 1));
    *((void *)a1 + 1) = 0LL;
  }

  char v5 = (const void *)qword_100066F80;
  CFTypeID TypeID = CFDictionaryGetTypeID();
  if (v5 && CFGetTypeID(v5) == TypeID)
  {
    CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(kCFAllocatorDefault, 0LL, (CFDictionaryRef)qword_100066F80);
    CFMutableDictionaryRef properties = MutableCopy;
    goto LABEL_11;
  }

  if (!IORegistryEntryCreateCFProperties(*a1, &properties, kCFAllocatorDefault, 0))
  {
    CFMutableDictionaryRef MutableCopy = properties;
LABEL_11:
    if (!CFDictionaryGetValueIfPresent(MutableCopy, @"BatteryInstalled", (const void **)&v57)
      || (CFBooleanRef v9 = v57, v57 != kCFBooleanTrue))
    {
      number[0] = 0LL;
      if (os_log_type_enabled((os_log_t)qword_1000678E0, OS_LOG_TYPE_DEBUG)) {
        sub_100041384();
      }
      CFDictionaryGetValueIfPresent(properties, @"ExternalConnected", (const void **)&value);
      CFDictionaryGetValueIfPresent(properties, @"AdapterDetails", (const void **)number);
      CFNumberRef v10 = number[0];
      CFTypeID v11 = CFDictionaryGetTypeID();
      if (v10)
      {
        if (CFGetTypeID(v10) == v11) {
          sub_1000175B4(value == kCFBooleanTrue, number[0]);
        }
      }

LABEL_49:
      CFRelease(properties);
      *((void *)a1 + 1) = 0LL;
      return;
    }

    if (!CFDictionaryGetValue(properties, @"CurrentCapacity")
      || !CFDictionaryGetValue(properties, @"MaxCapacity"))
    {
      if (os_log_type_enabled((os_log_t)qword_1000678E0, OS_LOG_TYPE_ERROR)) {
        sub_1000413B0();
      }
      goto LABEL_49;
    }

    uint64_t v12 = properties;
    CFTypeID v13 = CFDictionaryGetTypeID();
    if (v12 && CFGetTypeID(v12) == v13)
    {
      *((_WORD *)a1 + _Block_object_dispose(va, 8) = a1[4] & 0xFFFE | (v9 == CFDictionaryGetValue(v12, @"ExternalConnected"));
      *((_WORD *)a1 + _Block_object_dispose(va, 8) = a1[4] & 0xFFFB | (4 * (v9 == CFDictionaryGetValue(v12, @"ExternalChargeCapable")));
      *((_WORD *)a1 + _Block_object_dispose(va, 8) = a1[4] & 0xFFBF | ((v9 == CFDictionaryGetValue(v12, @"BatteryInstalled")) << 6);
      *((_WORD *)a1 + _Block_object_dispose(va, 8) = a1[4] & 0xFFF7 | (8 * (v9 == CFDictionaryGetValue(v12, @"IsCharging")));
      *((_WORD *)a1 + _Block_object_dispose(va, 8) = a1[4] & 0xFFFD | (2 * (v9 == CFDictionaryGetValue(v12, @"AppleRawExternalConnected")));
      *((_BYTE *)a1 + 24) = a1[6] & 0xFE | (v9 == CFDictionaryGetValue(v12, @"FullyCharged"));
      *((_WORD *)a1 + _Block_object_dispose(va, 8) = a1[4] & 0xFDFF | ((v9 == CFDictionaryGetValue(v12, @"AtCriticalLevel")) << 9);
      *((void *)a1 + 16) = CFDictionaryGetValue(v12, @"ErrorCondition");
      *((void *)a1 + 14) = CFDictionaryGetValue(v12, @"Serial");
      *((void *)a1 + 19) = CFDictionaryGetValue(v12, @"ChargeStatus");
      uint64_t v14 = (const __CFNumber *)CFDictionaryGetValue(v12, @"Voltage");
      if (v14) {
        CFNumberGetValue(v14, kCFNumberIntType, a1 + 11);
      }
      uint64_t v15 = (const __CFNumber *)CFDictionaryGetValue(v12, @"CurrentCapacity");
      if (v15)
      {
        CFNumberGetValue(v15, kCFNumberIntType, a1 + 8);
        *((_WORD *)a1 + 8) &= ~0x400u;
      }

      uint64_t v16 = (const __CFNumber *)CFDictionaryGetValue(v12, @"MaxCapacity");
      if (v16) {
        CFNumberGetValue(v16, kCFNumberIntType, a1 + 9);
      }
      uint64_t v17 = (const __CFNumber *)CFDictionaryGetValue(v12, @"DesignCapacity");
      if (v17) {
        CFNumberGetValue(v17, kCFNumberIntType, a1 + 10);
      }
      uint64_t v18 = (const __CFNumber *)CFDictionaryGetValue(v12, @"TimeRemaining");
      if (v18) {
        CFNumberGetValue(v18, kCFNumberIntType, a1 + 23);
      }
      uint64_t v19 = (const __CFNumber *)CFDictionaryGetValue(v12, @"InstantAmperage");
      if (v19) {
        CFNumberGetValue(v19, kCFNumberIntType, a1 + 13);
      }
      uint64_t v20 = (const __CFNumber *)CFDictionaryGetValue(v12, @"Amperage");
      if (v20) {
        CFNumberGetValue(v20, kCFNumberIntType, a1 + 12);
      }
      uint64_t v21 = (const __CFNumber *)CFDictionaryGetValue(v12, @"MaxErr");
      if (v21) {
        CFNumberGetValue(v21, kCFNumberIntType, a1 + 14);
      }
      uint64_t v22 = (const __CFNumber *)CFDictionaryGetValue(v12, @"CycleCount");
      if (v22) {
        CFNumberGetValue(v22, kCFNumberIntType, a1 + 15);
      }
      xpc_object_t v23 = (const __CFNumber *)CFDictionaryGetValue(v12, @"DesignCycleCount70");
      if (v23) {
        CFNumberGetValue(v23, kCFNumberIntType, a1 + 16);
      }
      uint64_t v24 = (const __CFNumber *)CFDictionaryGetValue(v12, @"DesignCycleCount9C");
      if (v24) {
        CFNumberGetValue(v24, kCFNumberIntType, a1 + 17);
      }
      io_registry_entry_t v25 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/");
      CFTypeRef CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(v25, @"board-id", 0LL, 0);
      *(_OWORD *)number = 0u;
      __int128 v62 = 0u;
      if (CFProperty)
      {
        __int128 v27 = CFProperty;
        BytePtr = CFDataGetBytePtr(CFProperty);
        else {
          CFIndex Length = 32LL;
        }
        __strlcpy_chk(number, BytePtr, Length, 32LL);
        CFRelease(v27);
      }

      IOObjectRelease(v25);
      size_t v30 = strlen((const char *)number);
      for (uint64_t i = 0LL; i != 756; i += 36LL)
      {
        if (!strncmp((const char *)number, &aMacF425bec8[i], v30))
        {
          uint64_t v32 = 0LL;
          unsigned int v33 = &word_1000669C0;
          while (1)
          {
            int v34 = (unsigned __int16)*v33;
            v33 += 18;
            if (a1[10] == v34) {
              goto LABEL_67;
            }
            if (++v32 == 25) {
              goto LABEL_60;
            }
          }
        }
      }

LABEL_60:
      int v35 = a1[16];
      if (v35 != 500 && v35 != 1000)
      {
        int v35 = a1[17];
        if (!v35)
        {
          uint64_t v32 = 0LL;
          int v36 = &word_1000669C0;
          while (1)
          {
            int v37 = (unsigned __int16)*v36;
            v36 += 18;
            if (a1[10] == v37) {
              break;
            }
            if (++v32 == 25)
            {
              int v35 = 300;
              goto LABEL_68;
            }
          }

            __strlcat_chk(v41, " Baseband", 200LL, 200LL);
            uint64_t v19 = *(_WORD *)(a2 + 104);
            if ((v19 & 0x20) == 0)
            {
LABEL_45:
              if ((v19 & 0x80) == 0) {
                goto LABEL_46;
              }
              goto LABEL_62;
            }

LABEL_67:
          int v35 = *(unsigned __int16 *)&aMacF425bec8[36 * v32 + 34];
        }
      }

LABEL_68:
      a1[18] = v35;
      int v38 = (const __CFDictionary *)CFDictionaryGetValue(v12, @"AdapterDetails");
      a1[5] = 0;
      if (v38)
      {
        LODWORD(valuePtr) = 0;
        if (CFDictionaryGetValueIfPresent(v38, @"FamilyCode", (const void **)number)
          && (CFNumberRef v39 = number[0], v40 = CFNumberGetTypeID(), v39)
          && CFGetTypeID(v39) == v40)
        {
          CFNumberGetValue(number[0], kCFNumberIntType, &valuePtr);
          BOOL v41 = (_DWORD)valuePtr == -536870201;
        }

        else
        {
          BOOL v41 = 0;
        }

        a1[5] = v41;
      }

      number[0] = 0LL;
      if (CFDictionaryGetValueIfPresent(v12, @"ChargingOverride", (const void **)&valuePtr)
        && (v42 = valuePtr, CFTypeID v43 = CFNumberGetTypeID(), v42)
        && CFGetTypeID(v42) == v43)
      {
        CFNumberGetValue(valuePtr, kCFNumberSInt64Type, number);
        __int16 v44 = (LOWORD(number[0]) << 10) & 0x800;
      }

      else
      {
        __int16 v44 = 0;
      }

      *((_WORD *)a1 + _Block_object_dispose(va, 8) = a1[4] & 0xF7FF | v44;
      __int16 v45 = CFDictionaryGetValue(v12, @"BatteryData");
      CFTypeID v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
      BOOL v47 = (void *)objc_claimAutoreleasedReturnValue([v46 objectForKeyedSubscript:@"DateOfFirstUse"]);
      *((void *)a1 + 10) = [v47 unsignedLongLongValue];
      __int16 v48 = (const __CFNumber *)CFDictionaryGetValue(v12, @"Location");
      if (v48) {
        CFNumberGetValue(v48, kCFNumberIntType, a1 + 22);
      }
      CFTypeID v49 = (const __CFNumber *)CFDictionaryGetValue(v12, @"BatteryInvalidWakeSeconds");
      CFBooleanRef v50 = a1 + 26;
      if (v49) {
        CFNumberGetValue(v49, kCFNumberIntType, v50);
      }
      else {
        *CFBooleanRef v50 = 16;
      }
      CFTypeID v51 = (const __CFNumber *)CFDictionaryGetValue(v12, @"PermanentFailureStatus");
      int v52 = a1 + 7;
      if (v51) {
        CFNumberGetValue(v51, kCFNumberIntType, v52);
      }
      else {
        *int v52 = 0;
      }
    }

    if (!qword_100066F88)
    {
      CFNumberRef v55 = (const void *)*((void *)a1 + 14);
      CFTypeID v56 = CFStringGetTypeID();
      if (v55)
      {
        if (CFGetTypeID(v55) == v56)
        {
          qword_100066F88 = *((void *)a1 + 14);
          CFRetain((CFTypeRef)qword_100066F88);
        }
      }
    }

    if (qword_100066F80)
    {
      if (qword_100066F88) {
        CFRelease((CFTypeRef)qword_100066F88);
      }
      CFNumberRef v53 = (const void *)*((void *)a1 + 14);
      qword_100066F88 = (uint64_t)v53;
      if (v53) {
        CFRetain(v53);
      }
    }

    if (!v4)
    {
      dispatch_assert_queue_barrier((dispatch_queue_t)qword_100066F78);
      dispatch_assert_queue_V2((dispatch_queue_t)qword_100066F78);
      if ((_DWORD)qword_100067258)
      {
        if (!qword_100067238)
        {
          pid_t v54 = getpid();
          dispatch_assert_queue_barrier((dispatch_queue_t)qword_100066F78);
          *(_OWORD *)&dword_100066FA0 = 0u;
          *(_OWORD *)&qword_100066FB0 = 0u;
          dword_100066FA0 = v54;
          qword_100067238 = (uint64_t)qword_100066F98;
          qword_100066F98[0] = 0x100000063LL;
          *(void *)&xmmword_100067218 = CFAbsoluteTimeGetCurrent();
          sub_100018080("com.apple.system.powersources.attach");
        }
      }
    }
  }

  CFMutableDictionaryRef v8 = properties;
  *((void *)a1 + 1) = properties;
  if (v8)
  {
    sub_100015EC4((uint64_t)a1);
    dispatch_assert_queue_V2((dispatch_queue_t)qword_100066F78);
    sub_100036DAC(qword_100067258);
    sub_100027148();
    sub_10001D8AC();
  }

        if (IOPMFeatureIsAvailableWithSupportedTable(@"Mobile Motion Module", v13, CFProperty))
        {
          if (v55) {
            BOOL v28 = v7;
          }
          else {
            BOOL v28 = v9;
          }
          IORegistryEntrySetCFProperty(v6, @"MobileMotionModule", v28);
        }

        if ((IOPMFeatureIsAvailableWithSupportedTable(@"GPUSwitch", v13, CFProperty) & 1) == 0) {
          goto LABEL_82;
        }
        goto LABEL_79;
      }

void sub_10001AC00(id a1)
{
}

void sub_10001AC08(id a1, OS_xpc_object *a2)
{
  if (!pthread_mutex_trylock(&stru_100066960)) {
    dispatch_async((dispatch_queue_t)qword_100066F78, &stru_100059B00);
  }
}

void sub_10001AC40(id a1)
{
  if (os_log_type_enabled((os_log_t)qword_1000678E0, OS_LOG_TYPE_DEBUG)) {
    sub_1000414C8();
  }
  if (qword_100067268 != -1) {
    dispatch_once(&qword_100067268, &stru_100059B20);
  }
  if (!byte_100067260)
  {
    id v9 = 0LL;
    uint64_t v4 = (void *)MAEGetActivationStateWithError(&v9);
    id v5 = v9;
    if (!v4)
    {
      if (os_log_type_enabled((os_log_t)qword_1000678E0, OS_LOG_TYPE_ERROR)) {
        sub_1000413DC();
      }

      goto LABEL_19;
    }

    if (![v4 isEqualToString:kMAActivationStateActivated])
    {
      if (os_log_type_enabled((os_log_t)qword_1000678E0, OS_LOG_TYPE_ERROR)) {
        sub_100041468();
      }

      uint64_t v3 = 0LL;
      goto LABEL_23;
    }
  }

  int v1 = TMGetReferenceTime(&v8, &v7, &v6);
  BOOL v2 = (os_log_s *)qword_1000678E0;
  if (os_log_type_enabled((os_log_t)qword_1000678E0, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218752;
    double v11 = v8;
    __int16 v12 = 2048;
    uint64_t v13 = v7;
    __int16 v14 = 1024;
    int v15 = v6;
    __int16 v16 = 1024;
    BOOL v17 = v1 != 0;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEBUG,  "DOFU-monitor: time:%f uncertainty:%f reliability:%d ret:%u\n",  buf,  0x22u);
  }

  if (v6 <= 0)
  {
    if (os_log_type_enabled((os_log_t)qword_1000678E0, OS_LOG_TYPE_DEBUG)) {
      sub_10004143C();
    }
LABEL_19:
    uint64_t v3 = 0LL;
    goto LABEL_24;
  }

  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  v8));
  if (!sub_100019658(v3)) {
LABEL_23:
  }
    xpc_activity_unregister("com.apple.powerd.dofu-monitor");
LABEL_24:
  pthread_mutex_unlock(&stru_100066960);
}

void sub_10001AE8C(id a1)
{
  int v1 = (void *)MGCopyAnswer(@"3kmXfug8VcxLI5yEmsqQKw", 0LL);
  if (v1)
  {
    id v5 = v1;
    id v2 = v1;
    uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSNumber);
    char isKindOfClass = objc_opt_isKindOfClass(v2, v3);

    int v1 = v5;
    if ((isKindOfClass & 1) != 0)
    {
      byte_100067260 = [v2 BOOLValue];
      int v1 = v5;
    }
  }
}

uint64_t sub_10001AF0C(uint64_t a1)
{
  io_object_t v2 = IOIteratorNext(*(_DWORD *)(a1 + 40));
  if (v2)
  {
    io_object_t v3 = v2;
    sub_10001A2F4(**(_DWORD ***)(a1 + 32), v2);
    IOObjectRelease(v3);
  }

  return IOObjectRelease(*(_DWORD *)(a1 + 40));
}

void sub_10001AF54(id a1)
{
}

double sub_10001AF5C(const void *a1)
{
  int valuePtr = 0;
  double result = 0.0;
  if (qword_100066F90)
  {
    if (*(void *)qword_100066F90)
    {
      io_object_t v3 = *(const __CFDictionary **)(*(void *)qword_100066F90 + 8LL);
      if (v3)
      {
        Value = (const __CFNumber *)CFDictionaryGetValue(v3, a1);
        if (Value)
        {
          CFNumberGetValue(Value, kCFNumberIntType, &valuePtr);
          LODWORD(v5) = valuePtr;
          return (double)v5 - kCFAbsoluteTimeIntervalSince1970;
        }

        else
        {
          return -kCFAbsoluteTimeIntervalSince1970;
        }
      }
    }
  }

  return result;
}

uint64_t sub_10001AFFC(const void *a1)
{
  uint64_t v2 = &dword_100000018;
  while (1)
  {
    io_object_t v3 = *(const void **)((char *)qword_100066F98 + v2);
    CFTypeID TypeID = CFDictionaryGetTypeID();
    if (v3)
    {
      if (CFGetTypeID(v3) == TypeID)
      {
        Value = CFDictionaryGetValue(*(CFDictionaryRef *)((char *)qword_100066F98 + v2), @"Type");
        CFTypeID v6 = CFStringGetTypeID();
        if (Value)
        {
          if (CFGetTypeID(Value) == v6 && CFEqual(Value, a1)) {
            break;
          }
        }
      }
    }

    v2 += 40LL;
    if (v2 == 664) {
      return 0LL;
    }
  }

  return *(uint64_t *)((char *)qword_100066F98 + v2);
}

uint64_t sub_10001B0BC(uint64_t a1, _OWORD *a2, int a3, BOOL *a4)
{
  double Current = CFAbsoluteTimeGetCurrent();
  BOOL v8 = a3 || (sub_10001D4F0() & 1) == 0;
  *a4 = v8;
  if (qword_100067298 || (qword_100067298 = (uint64_t)CFArrayCreateMutable(0LL, 1LL, &kCFTypeArrayCallBacks)) != 0)
  {
    __int128 v9 = a2[1];
    *(_OWORD *)atoken.val = *a2;
    *(_OWORD *)&atoken.val[4] = v9;
    audit_token_to_au32(&atoken, 0LL, 0LL, 0LL, 0LL, 0LL, &pidp, 0LL, 0LL);
    CFIndex Count = CFArrayGetCount((CFArrayRef)qword_100067298);
    if (Count >= 1)
    {
      CFIndex v11 = Count;
      for (CFIndex i = 0LL; v11 != i; ++i)
      {
        ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex((CFArrayRef)qword_100067298, i);
        if (!ValueAtIndex) {
          break;
        }
        CFMutableDictionaryRef Mutable = ValueAtIndex;
        Value = (const __CFNumber *)CFDictionaryGetValue(ValueAtIndex, @"AppPID");
        if (Value)
        {
          CFNumberGetValue(Value, kCFNumberIntType, &valuePtr);
          if (pidp == valuePtr) {
            goto LABEL_21;
          }
        }
      }
    }

    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0LL, 3LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFArrayAppendValue((CFMutableArrayRef)qword_100067298, Mutable);
    CFRelease(Mutable);
    if (CFArrayGetCount((CFArrayRef)qword_100067298) >= 11) {
      CFArrayRemoveValueAtIndex((CFMutableArrayRef)qword_100067298, 0LL);
    }
    CFNumberRef v16 = CFNumberCreate(0LL, kCFNumberIntType, &pidp);
    if (v16)
    {
      CFNumberRef v17 = v16;
      CFDictionarySetValue(Mutable, @"AppPID", v16);
      CFRelease(v17);
    }

    if (proc_name(pidp, &atoken, 0x400u))
    {
      CFStringRef v18 = CFStringCreateWithCString(0LL, (const char *)&atoken, 0);
      if (v18)
      {
        CFStringRef v19 = v18;
        CFDictionarySetValue(Mutable, @"AppPathString", v18);
        CFRelease(v19);
      }
    }

    if (Mutable)
    {
LABEL_21:
      uint64_t v20 = (__CFArray *)CFDictionaryGetValue(Mutable, @"HIDHistoryArray");
      if (v20
        || (uint64_t v20 = CFArrayCreateMutable(0LL, 1LL, &kCFTypeArrayCallBacks),
            CFDictionarySetValue(Mutable, @"HIDHistoryArray", v20),
            CFRelease(v20),
            v20))
      {
        if (CFArrayGetCount(v20) >= 1
          && (uint64_t v21 = (const __CFData *)CFArrayGetValueAtIndex(v20, 0LL)) != 0LL
          && (BytePtr = CFDataGetBytePtr(v21), Current < *(double *)BytePtr + 300.0))
        {
          if (a3) {
            ++*((_DWORD *)BytePtr + 2);
          }
          else {
            ++*((_DWORD *)BytePtr + 3);
          }
        }

        else
        {
          *(double *)atoken.val = (double)((int)Current / 300) * 300.0;
          *(void *)&atoken.val[2] = 0LL;
          if (a3) {
            atoken.val[2] = 1;
          }
          else {
            atoken.val[3] = 1;
          }
          CFDataRef v23 = CFDataCreate(0LL, (const UInt8 *)&atoken, 16LL);
          if (v23)
          {
            CFDataRef v24 = v23;
            CFArrayInsertValueAtIndex(v20, 0LL, v23);
            CFRelease(v24);
          }

          if (CFArrayGetCount(v20) >= 13)
          {
            do
            {
              CFIndex v25 = CFArrayGetCount(v20);
              CFArrayRemoveValueAtIndex(v20, v25 - 1);
            }

            while (CFArrayGetCount(v20) > 12);
          }
        }
      }
    }
  }

  return 0LL;
}

uint64_t sub_10001B43C(uint64_t a1, vm_address_t *a2, unsigned int *a3, int *a4)
{
  *a2 = 0LL;
  *a3 = 0;
  CFDataRef Data = CFPropertyListCreateData(0LL, (CFPropertyListRef)qword_100067298, kCFPropertyListXMLFormat_v1_0, 0LL, 0LL);
  if (Data)
  {
    BOOL v8 = Data;
    *a2 = (vm_address_t)CFDataGetBytePtr(Data);
    unsigned int Length = CFDataGetLength(v8);
    *a3 = Length;
    vm_allocate(mach_task_self_, a2, Length, 1);
    CFNumberRef v10 = (void *)*a2;
    if (v10)
    {
      BytePtr = CFDataGetBytePtr(v8);
      memcpy(v10, BytePtr, *a3);
      *a4 = 0;
    }

    CFRelease(v8);
    int v12 = 0;
  }

  else
  {
    int v12 = -536870212;
  }

  *a4 = v12;
  return 0LL;
}

uint64_t sub_10001B510(uint64_t a1)
{
  return *(_BYTE *)(a1 + 2) & 1;
}

uint64_t sub_10001B51C(uint64_t a1)
{
  return (*(unsigned __int8 *)(a1 + 1) >> 5) & 1;
}

void sub_10001B528(void *a1, void *a2, unsigned int *a3, int *a4)
{
  if (qword_1000672A0 == -1)
  {
    if (!a1) {
      return;
    }
  }

  else
  {
    dispatch_once(&qword_1000672A0, &stru_100059B80);
    if (!a1) {
      return;
    }
  }

  if (a2 && a3 && a4 && sub_10001349C())
  {
    id v8 = [a1 objectForKeyedSubscript:@"KioskMode"];
    if (v8)
    {
      __int128 v9 = v8;
      if ([v8 objectForKeyedSubscript:@"KioskModeMode"])
      {
        BOOL v10 = objc_msgSend( objc_msgSend(v9, "objectForKeyedSubscript:", @"KioskModeMode"),  "intValue") == 2 || objc_msgSend( objc_msgSend(v9, "objectForKeyedSubscript:", @"KioskModeMode"),  "intValue") == 3;
        int v11 = *a4;
        int v12 = (*a4 >> 13) & 1;
        id v13 = [a1 objectForKeyedSubscript:@"BatteryData"];
        if (v13)
        {
          __int16 v14 = v13;
          id v15 = [v13 objectForKeyedSubscript:@"Qmax"];
          uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSArray);
          if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0)
          {
            id v15 = [v15 firstObject];
          }

          else
          {
            uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSNumber);
            if ((objc_opt_isKindOfClass(v15, v17) & 1) == 0)
            {
              if (os_log_type_enabled((os_log_t)qword_1000672A8, OS_LOG_TYPE_ERROR)) {
                sub_1000415A4();
              }
              return;
            }
          }

          id v18 = [v15 intValue];
          id v19 = [v14 objectForKeyedSubscript:@"LifetimeData"];
          if (v19)
          {
            unsigned int v20 = v11 & 0x2000;
            uint64_t v21 = objc_msgSend( objc_msgSend(v19, "objectForKeyedSubscript:", @"TotalOperatingTime"),  "unsignedLongLongValue");
            uint64_t v22 = (os_log_s *)qword_1000672A8;
            if (os_log_type_enabled((os_log_t)qword_1000672A8, OS_LOG_TYPE_DEFAULT))
            {
              unsigned int v23 = objc_msgSend( objc_msgSend(v9, "objectForKeyedSubscript:", @"KioskModeMode"),  "intValue");
              int v24 = *a4;
              *(_DWORD *)buf = 67110400;
              int v48 = v23;
              __int16 v49 = 1024;
              BOOL v50 = v24;
              __int16 v51 = 1024;
              *(_DWORD *)int v52 = v10;
              *(_WORD *)&v52[4] = 1024;
              *(_DWORD *)&v52[6] = v20 >> 13;
              *(_WORD *)&v52[10] = 1024;
              *(_DWORD *)&v52[12] = (_DWORD)v18;
              *(_WORD *)&v52[16] = 2048;
              v53[0] = v21;
              _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "[ENTER] kiosk mode: %d flags: 0x%x K/Q:%d/%d qmax:%d currentTime:%llu",  buf,  0x2Au);
            }

            if ([a2 objectForKeyedSubscript:@"lastGoodQmax"])
            {
              objc_msgSend(objc_msgSend(a2, "objectForKeyedSubscript:", @"lastGoodQmax"), "intValue");
            }

            else
            {
              CFIndex v25 = (os_log_s *)qword_1000672A8;
              if (os_log_type_enabled((os_log_t)qword_1000672A8, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "No previous Qmax state found, storing first Good Qmax update",  buf,  2u);
              }

              sub_10001BEC0( a2,  (uint64_t)v18,  (uint64_t)v21,  (uint64_t)@"lastGoodQmax",  (uint64_t)@"lastGoodQmaxTimeStamp");
            }

            if (v20) {
              char v26 = 1;
            }
            else {
              char v26 = v10;
            }
            if ((v26 & 1) != 0)
            {
              char v27 = !v10;
              if (v10 && !v20)
              {
                BOOL v28 = objc_msgSend( objc_msgSend(a2, "objectForKeyedSubscript:", @"lastGoodQmaxTimeStamp"),  "unsignedLongLongValue");
                uint64_t v46 = (uint64_t)v21;
                unint64_t v29 = v21 - v28;
                int v12 = v29 >> 7 > 0x2C;
                size_t v30 = (os_log_s *)qword_1000672A8;
                BOOL v31 = os_log_type_enabled((os_log_t)qword_1000672A8, OS_LOG_TYPE_DEFAULT);
                if (v29 >> 7 < 0x2D)
                {
                  if (v31)
                  {
                    *(_DWORD *)buf = 67110144;
                    int v48 = 1;
                    __int16 v49 = 1024;
                    BOOL v50 = 0;
                    __int16 v51 = 2048;
                    *(void *)int v52 = v46;
                    *(_WORD *)&v52[8] = 2048;
                    *(void *)&v52[10] = v28;
                    LOWORD(v53[0]) = 2048;
                    *(void *)((char *)v53 + 2) = v29;
                    uint64_t v32 = "K/Q:%d/%d [UPDATE] timeNow: (%llu) timeStored: (%llu) timediff: (%llu)";
                    goto LABEL_72;
                  }
                }

                else if (v31)
                {
                  *(_DWORD *)buf = 67110144;
                  int v48 = 1;
                  __int16 v49 = 1024;
                  BOOL v50 = 0;
                  __int16 v51 = 2048;
                  *(void *)int v52 = v46;
                  *(_WORD *)&v52[8] = 2048;
                  *(void *)&v52[10] = v28;
                  LOWORD(v53[0]) = 2048;
                  *(void *)((char *)v53 + 2) = v29;
                  uint64_t v32 = "K/Q:%d/%d [EXIT] timeNow: (%llu) timeStored: (%llu) timediff: (%llu)";
LABEL_72:
                  _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, v32, buf, 0x2Cu);
                }

                if (sub_10001BF30(a2, (int)v18))
                {
                  sub_10001BEC0( a2,  (uint64_t)v18,  v46,  (uint64_t)@"lastKioskQmax",  (uint64_t)@"lastKioskQmaxTimeStamp");
                  __int16 v44 = (os_log_s *)qword_1000672A8;
                  if (os_log_type_enabled((os_log_t)qword_1000672A8, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 67109888;
                    int v48 = 1;
                    __int16 v49 = 1024;
                    BOOL v50 = v29 >> 7 > 0x2C;
                    __int16 v51 = 1024;
                    *(_DWORD *)int v52 = (_DWORD)v18;
                    *(_WORD *)&v52[4] = 2048;
                    *(void *)&v52[6] = v46;
LABEL_81:
                    _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_DEFAULT,  "K/Q:%d/%d [UPDATE] kioskQmax: %d kioskQmaxTime: %llu",  buf,  0x1Eu);
                    goto LABEL_50;
                  }
                }

                goto LABEL_50;
              }

              if (!v20) {
                char v27 = 1;
              }
              if ((v27 & 1) == 0)
              {
                __int16 v45 = (os_log_s *)qword_1000672A8;
                if (os_log_type_enabled((os_log_t)qword_1000672A8, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 67109376;
                  int v48 = 1;
                  __int16 v49 = 1024;
                  BOOL v50 = 1;
                  _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "K/Q:%d/%d [UPDATE]", buf, 0xEu);
                }

                sub_10001BEC0( a2,  (uint64_t)v18,  (uint64_t)v21,  (uint64_t)@"lastKioskQmax",  (uint64_t)@"lastKioskQmaxTimeStamp");
                __int16 v44 = (os_log_s *)qword_1000672A8;
                if (!os_log_type_enabled((os_log_t)qword_1000672A8, OS_LOG_TYPE_DEFAULT)) {
                  goto LABEL_50;
                }
                *(_DWORD *)buf = 67109888;
                int v48 = 1;
                __int16 v49 = 1024;
                BOOL v50 = 1;
                __int16 v51 = 1024;
                *(_DWORD *)int v52 = (_DWORD)v18;
                *(_WORD *)&v52[4] = 2048;
                *(void *)&v52[6] = v21;
                goto LABEL_81;
              }

              if (v10 || v20 == 0)
              {
LABEL_50:
                if (v10) {
                  int v35 = 0x10000;
                }
                else {
                  int v35 = 0;
                }
                unsigned int v36 = *a3 & 0xFFFEDFFF | v35;
                if (v12) {
                  int v37 = 0x2000;
                }
                else {
                  int v37 = 0;
                }
                *a3 = v36 | v37;
                int v38 = (os_log_s *)qword_1000672A8;
                if (os_log_type_enabled((os_log_t)qword_1000672A8, OS_LOG_TYPE_DEFAULT))
                {
                  unsigned int v39 = objc_msgSend( objc_msgSend(v9, "objectForKeyedSubscript:", @"KioskModeMode"),  "intValue");
                  unsigned int v40 = *a3;
                  *(_DWORD *)buf = 67109888;
                  int v48 = v39;
                  __int16 v49 = 1024;
                  BOOL v50 = v40;
                  __int16 v51 = 1024;
                  *(_DWORD *)int v52 = v10;
                  *(_WORD *)&v52[4] = 1024;
                  *(_DWORD *)&v52[6] = v12;
                  _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "[EXIT] kiosk mode: %d flags: 0x%x K/Q:%d/%d",  buf,  0x1Au);
                }

                return;
              }

              if (![a2 objectForKeyedSubscript:@"lastBadQmax"]
                || ![a2 objectForKeyedSubscript:@"lastBadQmaxTimeStamp"]
                || (id v41 = objc_msgSend( objc_msgSend(a2, "objectForKeyedSubscript:", @"lastBadQmaxTimeStamp"),  "unsignedLongLongValue"),  v41 < objc_msgSend( objc_msgSend(a2, "objectForKeyedSubscript:", @"lastGoodQmaxTimeStamp"),  "unsignedLongLongValue")))
              {
                BOOL v42 = (os_log_s *)qword_1000672A8;
                if (!os_log_type_enabled((os_log_t)qword_1000672A8, OS_LOG_TYPE_DEFAULT))
                {
LABEL_69:
                  sub_10001BEC0( a2,  (uint64_t)v18,  (uint64_t)v21,  (uint64_t)@"lastBadQmax",  (uint64_t)@"lastBadQmaxTimeStamp");
                  goto LABEL_50;
                }

                *(_DWORD *)buf = 67109376;
                int v48 = 0;
                __int16 v49 = 1024;
                BOOL v50 = 1;
                CFTypeID v43 = "K/Q:%d/%d [ENTER]";
LABEL_68:
                _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, v43, buf, 0xEu);
                goto LABEL_69;
              }

              if ((int)v18 <= (int)objc_msgSend( objc_msgSend(a2, "objectForKeyedSubscript:", @"lastBadQmax"),  "intValue"))
              {
                if ((int)v18 >= (int)objc_msgSend( objc_msgSend(a2, "objectForKeyedSubscript:", @"lastBadQmax"),  "intValue")) {
                  goto LABEL_50;
                }
                BOOL v42 = (os_log_s *)qword_1000672A8;
                if (!os_log_type_enabled((os_log_t)qword_1000672A8, OS_LOG_TYPE_DEFAULT)) {
                  goto LABEL_69;
                }
                *(_DWORD *)buf = 67109376;
                int v48 = 0;
                __int16 v49 = 1024;
                BOOL v50 = 1;
                CFTypeID v43 = "K/Q:%d/%d [UPDATE]";
                goto LABEL_68;
              }

              unsigned int v33 = (os_log_s *)qword_1000672A8;
              if (!os_log_type_enabled((os_log_t)qword_1000672A8, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_48;
              }
              *(_DWORD *)buf = 67109376;
              int v48 = 0;
              __int16 v49 = 1024;
              BOOL v50 = 1;
              int v34 = "K/Q:%d/%d [EXIT]";
            }

            else
            {
              if (!sub_10001BF30(a2, (int)v18))
              {
LABEL_49:
                int v12 = 0;
                goto LABEL_50;
              }

              unsigned int v33 = (os_log_s *)qword_1000672A8;
              if (!os_log_type_enabled((os_log_t)qword_1000672A8, OS_LOG_TYPE_DEFAULT))
              {
LABEL_48:
                sub_10001BEC0( a2,  (uint64_t)v18,  (uint64_t)v21,  (uint64_t)@"lastGoodQmax",  (uint64_t)@"lastGoodQmaxTimeStamp");
                goto LABEL_49;
              }

              *(_DWORD *)buf = 67109376;
              int v48 = 0;
              __int16 v49 = 1024;
              BOOL v50 = 0;
              int v34 = "K/Q:%d/%d [UPDATE]";
            }

            _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, v34, buf, 0xEu);
            goto LABEL_48;
          }

          if (os_log_type_enabled((os_log_t)qword_1000672A8, OS_LOG_TYPE_ERROR)) {
            sub_100041578();
          }
        }

        else if (os_log_type_enabled((os_log_t)qword_1000672A8, OS_LOG_TYPE_ERROR))
        {
          sub_10004154C();
        }
      }

      else if (os_log_type_enabled((os_log_t)qword_1000672A8, OS_LOG_TYPE_ERROR))
      {
        sub_100041520();
      }
    }

    else if (os_log_type_enabled((os_log_t)qword_1000672A8, OS_LOG_TYPE_ERROR))
    {
      sub_1000414F4();
    }
  }

void sub_10001BE94(id a1)
{
  qword_1000672A8 = (uint64_t)os_log_create("com.apple.powerd", "batteryCapacityMonitor");
}

id sub_10001BEC0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend( a1,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3),  a5);
}

BOOL sub_10001BF30(void *a1, int a2)
{
  uint64_t v4 = @"lastGoodQmax";
  if ([a1 objectForKeyedSubscript:@"lastKioskQmaxTimeStamp"])
  {
    id v5 = objc_msgSend( objc_msgSend(a1, "objectForKeyedSubscript:", @"lastGoodQmaxTimeStamp"),  "unsignedLongLongValue");
    if (v5 <= objc_msgSend( objc_msgSend(a1, "objectForKeyedSubscript:", @"lastKioskQmaxTimeStamp"),  "unsignedLongLongValue")) {
      uint64_t v4 = @"lastKioskQmax";
    }
  }

  return objc_msgSend(objc_msgSend(a1, "objectForKeyedSubscript:", v4), "intValue") != a2;
}

void sub_10001BFC4()
{
  io_object_t notification = 0;
  CFMutableDictionaryRef properties = 0LL;
  qword_100067908 = (uint64_t)os_log_create("com.apple.powerd", "sleepWake");
  qword_100067938 = 0LL;
  unk_100067940 = 0LL;
  qword_100067930 = 0LL;
  dword_100067948 = 257;
  qword_1000672B0 = (uint64_t)CFArrayCreateMutable(kCFAllocatorDefault, 100LL, (const CFArrayCallBacks *)&unk_100066D40);
  io_service_t v0 = sub_10000AD18();
  dword_1000672B8 = v0;
  if (!v0)
  {
    int v1 = "Could not find IOPMrootDomain";
    goto LABEL_5;
  }

  if (IOServiceOpen(v0, mach_task_self_, 0, (io_connect_t *)&dword_1000672BC))
  {
    int v1 = "Could not open IOPMrootDomain";
LABEL_5:
    asl_log(0LL, 0LL, 3, "PowerManagement: unable to register with kernel power management. %s %s", "Reason = : ", v1);
    return;
  }

  uint64_t v2 = IONotificationPortCreate(0);
  if (!v2)
  {
    int v1 = "Could not create IONotificationPort";
    goto LABEL_5;
  }

  io_object_t v3 = v2;
  if (IOServiceAddInterestNotification( v2,  dword_1000672B8,  "IOPMSystemCapabilityInterest",  (IOServiceInterestCallback)sub_10001C1C4,  0LL,  &notification))
  {
    int v1 = "Could not add interest notification kIOPMAppPowerStateInterest";
    goto LABEL_5;
  }

  uint64_t v4 = sub_100038248();
  IONotificationPortSetDispatchQueue(v3, v4);
  id v5 = sub_100038248();
  dispatch_async(v5, &stru_100059BA0);
  IORegistryEntryCreateCFProperties(dword_1000672B8, &properties, 0LL, 0);
  CFMutableDictionaryRef v6 = properties;
  CFTypeID TypeID = CFDictionaryGetTypeID();
  if (v6)
  {
    if (CFGetTypeID(v6) == TypeID)
    {
      Value = (const __CFNumber *)CFDictionaryGetValue(properties, @"System Capabilities");
      CFTypeID v9 = CFNumberGetTypeID();
      if (Value)
      {
        if (CFGetTypeID(Value) == v9)
        {
          CFNumberGetValue(Value, kCFNumberIntType, &valuePtr);
          if ((valuePtr & 1) != 0) {
            int v10 = 2;
          }
          else {
            int v10 = 1;
          }
          if ((valuePtr & 6) != 0) {
            int v11 = 64;
          }
          else {
            int v11 = v10;
          }
          dword_1000672C0 = v11;
        }
      }
    }
  }

  if (properties) {
    CFRelease(properties);
  }
}

void sub_10001C1C4(uint64_t a1, uint64_t a2, int a3, unsigned int *a4)
{
  uint64_t v6 = sub_100038630();
  CFStringRef theString = &stru_10005AC58;
  int v48 = &stru_10005AC58;
  if (a3 == -536870288)
  {
    int v10 = sub_1000385A0();
    if (CFEqual(v10, @"Low Power Sleep")
      || CFEqual(v10, @"Thermal Emergency Sleep")
      || sub_100036638() && sub_100036638() != 255)
    {
      byte_100067923 = 1;
    }

    if (CFStringCompare(v10, @"Idle Sleep", 0LL) == kCFCompareEqualTo)
    {
      int v11 = (dword_1000672C0 & 2) != 0 ? 1 : sub_100014C4C(5u) ^ 1;
      int v14 = sub_10002AD04(0xCu);
      if (!v11 || v14) {
        goto LABEL_22;
      }
    }

    qword_100067918 = mach_absolute_time();
    byte_100066D3C = 0;
    io_connect_t v15 = dword_1000672BC;
    intptr_t v16 = (intptr_t)a4;
    goto LABEL_28;
  }

  if (a3 == -536870256)
  {
    byte_100066D3C = 1;
    sub_100014C4C(8u);
    byte_100067923 = 0;
    return;
  }

  if (a3 != -536656880)
  {
    if ((a3 & 0xFFFFFFEF) == 0xE0034420)
    {
      int v12 = sub_100038248();
      v45[0] = _NSConcreteStackBlock;
      v45[1] = 3221225472LL;
      v45[2] = sub_10001F5D0;
      v45[3] = &unk_100059B40;
      int v46 = a3;
      v45[4] = a4;
      dispatch_async(v12, v45);
      return;
    }

    if (a3 != -536870080)
    {
      if (a3 == -536656800)
      {
        id v13 = (os_log_s *)qword_100067908;
        if (os_log_type_enabled((os_log_t)qword_100067908, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          *(void *)&uint8_t buf[4] = a4;
          _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Request user active from kernel driver %s",  buf,  0xCu);
        }
      }

      else
      {
        uint64_t v22 = (os_log_s *)qword_100067908;
        if (os_log_type_enabled((os_log_t)qword_100067908, OS_LOG_TYPE_ERROR)) {
          sub_1000415D0(a3, v22);
        }
      }

      return;
    }

    sub_100013E14((uint64_t)a4);
    sub_10003AC94(a4[4], a4[5], a4[2]);
    uint64_t v17 = sub_100031664(a4);
    unsigned int v19 = a4[4];
    unsigned int v20 = a4[5];
    if ((v19 & 7) == 1 && (a4[5] & 7) != 1)
    {
      nullsub_4(v17, v18);
      unsigned int v19 = a4[4];
      unsigned int v20 = a4[5];
    }

    unsigned int v21 = a4[2];
    if (((v20 ^ v19) & 1) != 0 && (v20 & 1) == 0 && (v21 & 1) != 0)
    {
      byte_100067920 = 0;
      byte_100067921 = 0;
      qword_1000672E0 = 0LL;
      qword_1000672D8 = 0LL;
      byte_100067922 = 0;
      qword_1000672D0 = 0LL;
      sub_10001F6E8(0);
      notify_post("com.apple.powermanagement.systempowerstate");
      sub_10003863C();
      dword_1000672C0 = dword_1000672C0 & 0xFFFFFF08 | 1;
      sub_10003932C("success", 0LL, 0LL, 3);
      byte_100067300 = 1;
      nullsub_4(64LL, 0LL);
      nullsub_4(4LL, 0LL);
      sub_10001E188();
      if (!sub_10001F778(*a4))
      {
        sub_10001E8C0(0LL);
        IOAllowPowerChange(dword_1000672BC, *a4);
      }

      sub_100038284();
      sub_10001DBA4();
      return;
    }

    if ((v20 ^ v19) == 6 && (v20 & 6) == 0 && (v21 & 1) != 0)
    {
      byte_100067920 = 0;
      byte_100067921 = 0;
      qword_1000672E0 = 0LL;
      qword_1000672D8 = 0LL;
      byte_100067922 = 0;
      qword_1000672D0 = 0LL;
      dword_1000672C0 = dword_1000672C0 & 0xFFFFFF3D | 2;
LABEL_57:
      intptr_t v16 = *a4;
      if (!(_DWORD)v16) {
        return;
      }
      io_connect_t v15 = dword_1000672BC;
LABEL_28:
      IOAllowPowerChange(v15, v16);
      return;
    }

    if ((v21 & 2) == 0)
    {
      int v23 = v20 & 1;
      goto LABEL_50;
    }

    int v23 = v20 & 1;
    if (((v19 & 1) != 0 || (v20 & 1) == 0) && ((v19 & 2) != 0 || (v20 & 2) == 0))
    {
LABEL_50:
      if ((v19 & 1) == 0 && (v23 & v21) != 0)
      {
        byte_100067923 = 0;
        byte_100066D3C = 1;
        dword_1000672C0 = 2;
        int v24 = sub_100038248();
        dispatch_async(v24, &stru_100059C80);
        uint64_t v25 = 32793LL;
        if ((a4[4] & 2) == 0)
        {
          if ((a4[5] & 2) != 0) {
            uint64_t v25 = 32799LL;
          }
          else {
            uint64_t v25 = 32793LL;
          }
        }

        sub_10001FAC0(v25);
      }

      goto LABEL_57;
    }

    sub_1000386EC(&theString, &v48);
    uint64_t v26 = mach_absolute_time();
    sub_10001DB00(v26);
    if (CFStringFind(theString, @"RTC", 0LL).location == -1)
    {
      CFIndex location = CFStringFind(theString, @"rtc", 0LL).location;
      BOOL v28 = (const void *)qword_1000679C8;
      if (location == -1 || !qword_1000679C8)
      {
LABEL_76:
        if (v28)
        {
          CFRelease(v28);
          qword_1000679C8 = 0LL;
        }

LABEL_78:
        sub_10001E188();
        byte_100066D3C = 1;
        sub_100015BE0();
        unsigned int v37 = a4[4];
        if ((v37 & 2) != 0 || (a4[5] & 2) == 0)
        {
          if ((v37 & 1) != 0 || (a4[5] & 1) == 0)
          {
            uint64_t v38 = 0LL;
LABEL_101:
            sub_10001F6E8(v38);
            notify_post("com.apple.powermanagement.systempowerstate");
            dword_100066D68 = v38;
            sub_10001FAC0(v38);
            intptr_t v42 = *a4;
            if ((_DWORD)v42) {
              IOAllowPowerChange(dword_1000672BC, v42);
            }
            CFTypeRef v43 = sub_100038508(@"AppStatistics");
            if (v43)
            {
              __int16 v44 = v43;
              nullsub_4(v43, "KernelClientStats");
              sub_10001DC64(v44);
              CFRelease(v44);
            }

            return;
          }

          byte_100067920 = 1;
          dword_1000672C0 = dword_1000672C0 & 0xFFFFFF08 | 2;
          nullsub_4(a4, v36);
          double Current = CFAbsoluteTimeGetCurrent();
          if (qword_1000672C8 && *(double *)&qword_100067910 != 0.0 && Current > *(double *)&qword_100067910)
          {
            dispatch_suspend((dispatch_object_t)qword_1000672C8);
            dispatch_source_set_timer((dispatch_source_t)qword_1000672C8, 0LL, 0xFFFFFFFFFFFFFFFFLL, 0LL);
            dispatch_resume((dispatch_object_t)qword_1000672C8);
          }

          if (byte_100067300 == 1)
          {
            sub_1000395AC("success", 0LL, 0LL, 25, 1);
            byte_100067301 = 1;
            byte_100067300 = 0;
          }

          nullsub_4(1LL, v39);
          nullsub_4(16LL, 1LL);
          uint64_t v38 = 25LL;
LABEL_100:
          byte_100067922 = 1;
          qword_1000672D0 = 0LL;
          sub_10001D8F0();
          goto LABEL_101;
        }

        dword_1000672C0 = dword_1000672C0 & 0xFFFFFF08 | 0x40;
        if ((v37 & 1) == 0)
        {
          if (byte_100067300) {
            sub_1000395AC("success", 0LL, 0LL, 31, 0);
          }
          nullsub_4(0LL, v36);
          goto LABEL_99;
        }

        if ((byte_100067300 & 1) != 0)
        {
          int v41 = 0;
        }

        else
        {
          if (byte_100067301 != 1)
          {
LABEL_99:
            nullsub_4(8LL, (v37 & 1) == 0);
            byte_100067301 = 0;
            byte_100067300 = 0;
            uint64_t v38 = 31LL;
            goto LABEL_100;
          }

          byte_100067921 = 1;
          int v41 = 2;
        }

        sub_1000395AC("success", 0LL, 0LL, 31, v41);
        goto LABEL_99;
      }
    }

    else if (!qword_1000679C8)
    {
      goto LABEL_78;
    }

    double v29 = CFAbsoluteTimeGetCurrent();
    Value = CFDictionaryGetValue((CFDictionaryRef)qword_1000679C8, @"time");
    BOOL v31 = (const __CFNumber *)sub_100005798(Value);
    *(void *)buf = 0LL;
    CFNumberGetValue(v31, kCFNumberDoubleType, buf);
    double v32 = *(double *)buf;
    if (*(double *)buf > v29 && *(double *)buf - v29 >= *(double *)&qword_100066D30)
    {
      int v35 = (os_log_s *)qword_100067908;
      if (os_log_type_enabled((os_log_t)qword_100067908, OS_LOG_TYPE_DEBUG)) {
        sub_100041640(v35, v32, v29);
      }
    }

    else if (!qword_1000679C0)
    {
      qword_1000679C0 = (uint64_t)CFDictionaryCreateMutableCopy(0LL, 0LL, (CFDictionaryRef)qword_1000679C8);
      unsigned int v33 = (const void *)IOPMSleepWakeCopyUUID();
      if (v33)
      {
        int v34 = v33;
        CFDictionarySetValue((CFMutableDictionaryRef)qword_1000679C0, @"SleepWakeUUID", v33);
        CFRelease(v34);
      }
    }

    BOOL v28 = (const void *)qword_1000679C8;
    goto LABEL_76;
  }

  uint64_t v7 = (const __CFString *)v6;
  uint64_t v8 = sub_10002AD04(0xCu);
  if (CFStringCompare(v7, @"Idle Sleep", 0LL)) {
    int v9 = 0;
  }
  else {
    int v9 = sub_100014C4C(0xBu);
  }
  if ((v8 | v9) == 1)
  {
    nullsub_4(0LL, v8);
LABEL_22:
    IOCancelPowerChange(dword_1000672BC, (intptr_t)a4);
    return;
  }

  IOAllowPowerChange(dword_1000672BC, (intptr_t)a4);
  byte_100066D3C = 0;
  qword_100067918 = mach_absolute_time();
}

void sub_10001CAD4(id a1)
{
}

uint64_t sub_10001CAF0(uint64_t a1)
{
  if ((_DWORD)a1) {
    uint64_t v2 = &dword_1000672FC;
  }
  else {
    uint64_t v2 = &dword_1000672F8;
  }
  if ((_DWORD)a1) {
    io_object_t v3 = "com.apple.powermanagement.systemsleeppreventers";
  }
  else {
    io_object_t v3 = "com.apple.powermanagement.idlesleeppreventers";
  }
  if (*v2 || (uint64_t result = notify_register_check(v3, v2), !(_DWORD)result) && *v2)
  {
    uint64_t result = IOPMCopySleepPreventersList(a1, &theArray);
    if (!(_DWORD)result)
    {
      CFIndex Count = theArray;
      CFTypeID TypeID = CFArrayGetTypeID();
      if (Count)
      {
        if (CFGetTypeID(Count) == TypeID)
        {
          CFIndex Count = (const void *)CFArrayGetCount(theArray);
          CFRelease(theArray);
        }

        else
        {
          CFIndex Count = 0LL;
        }
      }

      notify_set_state(*v2, (uint64_t)Count);
      return notify_post(v3);
    }
  }

  else
  {
    *uint64_t v2 = 0;
  }

  return result;
}

uint64_t sub_10001CBD0(uint64_t a1, _OWORD *a2, const char *a3, int a4, _DWORD *a5, int *a6)
{
  *a5 = 0;
  if (dword_100067338 <= 0x3B9ACA00 && (int v11 = calloc(1uLL, 0x38uLL)) != 0LL)
  {
    int v12 = v11;
    int v13 = dword_100067338++;
    v11[6] = v13 + 1000;
    CFArrayAppendValue((CFMutableArrayRef)qword_1000672B0, v11);
    __int128 v14 = a2[1];
    *(_OWORD *)atoken.val = *a2;
    *(_OWORD *)&atoken.val[4] = v14;
    audit_token_to_au32(&atoken, 0LL, 0LL, 0LL, 0LL, 0LL, v12 + 7, 0LL, 0LL);
    if (a3 && *a3) {
      *((void *)v12 + 2) = CFStringCreateWithCString(0LL, a3, 0x8000100u);
    }
    int v15 = 0;
    v12[8] = a4;
    *a5 = v12[6];
  }

  else
  {
    int v15 = -536870212;
  }

  *a6 = v15;
  return 0LL;
}

uint64_t sub_10001CCE8(uint64_t a1, _OWORD *a2, int a3, mach_port_name_t a4, int a5, _DWORD *a6)
{
  pid_t pidp = -1;
  if (a4 && a6)
  {
    uint64_t v10 = 3758097136LL;
    *a6 = -536870212;
    __int128 v11 = a2[1];
    *(_OWORD *)atoken.val = *a2;
    *(_OWORD *)&atoken.val[4] = v11;
    audit_token_to_au32(&atoken, 0LL, 0LL, 0LL, 0LL, 0LL, &pidp, 0LL, 0LL);
    int v12 = sub_10001CF88(a3);
    if (v12)
    {
      int v13 = v12;
      unsigned int v14 = v12[7];
      pid_t v15 = pidp;
      if (v14 == pidp)
      {
        *((_BYTE *)v12 + 36) = a5 == 0;
        if (a5 || *v12)
        {
          mach_port_deallocate(mach_task_self_, a4);
        }

        else
        {
          _DWORD *v12 = a4;
          uintptr_t v18 = pidp;
          unsigned int v19 = sub_100038248();
          unsigned int v20 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_proc, v18, 0x80000000uLL, v19);
          if (v20)
          {
            unsigned int v21 = v20;
            handler[0] = _NSConcreteStackBlock;
            handler[1] = 3221225472LL;
            handler[2] = sub_10001CFEC;
            handler[3] = &unk_100059400;
            int v24 = a3;
            dispatch_source_set_event_handler(v20, handler);
            v22[0] = _NSConcreteStackBlock;
            v22[1] = 3221225472LL;
            v22[2] = sub_10001D010;
            v22[3] = &unk_1000596C0;
            v22[4] = v21;
            dispatch_source_set_cancel_handler(v21, v22);
            dispatch_resume(v21);
            *((void *)v13 + 6) = v21;
          }

          else if (os_log_type_enabled((os_log_t)qword_100067908, OS_LOG_TYPE_ERROR))
          {
            sub_100041724();
          }
        }

        uint64_t v10 = 0LL;
        *a6 = 0;
      }

      else
      {
        intptr_t v16 = (os_log_s *)qword_100067908;
        if (os_log_type_enabled((os_log_t)qword_100067908, OS_LOG_TYPE_ERROR))
        {
          atoken.val[0] = 67109632;
          atoken.val[1] = v15;
          LOWORD(atoken.val[2]) = 1024;
          *(unsigned int *)((char *)&atoken.val[2] + 2) = a3;
          HIWORD(atoken.val[3]) = 1024;
          atoken.val[4] = v14;
          _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "Notification schedule request from unexepcted pid %d for connection %d. Expected pid:%d\n",  (uint8_t *)&atoken,  0x14u);
        }
      }
    }

    else if (os_log_type_enabled((os_log_t)qword_100067908, OS_LOG_TYPE_ERROR))
    {
      sub_1000416C0();
    }
  }

  else
  {
    uint64_t v10 = 0LL;
    if (a6) {
      *a6 = -536870206;
    }
  }

  return v10;
}

const void *sub_10001CF88(int a1)
{
  v6.length = CFArrayGetCount((CFArrayRef)qword_1000672B0);
  int v5 = a1;
  v6.CFIndex location = 0LL;
  CFIndex FirstIndexOfValue = CFArrayGetFirstIndexOfValue((CFArrayRef)qword_1000672B0, v6, value);
  if (FirstIndexOfValue == -1) {
    return 0LL;
  }
  else {
    return CFArrayGetValueAtIndex((CFArrayRef)qword_1000672B0, FirstIndexOfValue);
  }
}

void sub_10001CFEC(uint64_t a1)
{
  int v1 = sub_10001CF88(*(_DWORD *)(a1 + 32));
  if (v1) {
    sub_10001D064((uint64_t)v1);
  }
}

void sub_10001D010(uint64_t a1)
{
}

uint64_t sub_10001D018(uint64_t a1, int a2, int *a3)
{
  uint64_t v4 = sub_10001CF88(a2);
  if (v4)
  {
    sub_10001D064((uint64_t)v4);
    if (a3)
    {
      int v5 = 0;
LABEL_6:
      *a3 = v5;
    }
  }

  else if (a3)
  {
    int v5 = -536870160;
    goto LABEL_6;
  }

  return 0LL;
}

void sub_10001D064(uint64_t a1)
{
  CFIndex Count = CFArrayGetCount((CFArrayRef)qword_1000672B0);
  if (*(_DWORD *)a1)
  {
    mach_port_deallocate(mach_task_self_, *(_DWORD *)a1);
    *(_DWORD *)a1 = 0;
  }

  io_object_t v3 = *(dispatch_source_s **)(a1 + 48);
  if (v3) {
    dispatch_source_cancel(v3);
  }
  uint64_t v4 = *(const void **)(a1 + 16);
  if (v4)
  {
    CFRelease(v4);
    *(void *)(a1 + 16) = 0LL;
  }

  int v5 = *(CFArrayRef **)(a1 + 8);
  if (v5 && *v5)
  {
    CFIndex v6 = CFArrayGetCount(*v5);
    if (v6 >= 1)
    {
      CFIndex v7 = v6;
      CFIndex v8 = 0LL;
      while (1)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(*v5, v8);
        if (ValueAtIndex)
        {
          if (*(void *)ValueAtIndex == a1) {
            break;
          }
        }

        if (v7 == ++v8) {
          goto LABEL_16;
        }
      }

      *(void *)ValueAtIndex = 0LL;
      ValueAtIndex[48] = 257;
    }

LABEL_16:
    sub_10001E76C((uint64_t)v5);
  }

  v11.CFIndex location = 0LL;
  v11.length = Count;
  CFIndex FirstIndexOfValue = CFArrayGetFirstIndexOfValue((CFArrayRef)qword_1000672B0, v11, (const void *)a1);
  if (FirstIndexOfValue != -1) {
    CFArrayRemoveValueAtIndex((CFMutableArrayRef)qword_1000672B0, FirstIndexOfValue);
  }
  free((void *)a1);
}

      CFIndex Count = CFArrayGetCount((CFArrayRef)qword_1000679F0);
      CFIndex v7 = dword_1000679E8 & 0x1FF;
      if (Count <= v7)
      {
        CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  16LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
        if (!Mutable) {
          return;
        }
      }

      else
      {
        CFMutableDictionaryRef Mutable = (void *)CFArrayGetValueAtIndex((CFArrayRef)qword_1000679F0, v7);
        CFRetain(Mutable);
        CFDictionaryRemoveAllValues((CFMutableDictionaryRef)Mutable);
        if (!Mutable) {
          return;
        }
      }

      Value = CFDictionaryGetValue(v3, @"ActivityTime");
      if (Value)
      {
        CFDictionarySetValue((CFMutableDictionaryRef)Mutable, @"ActivityTime", Value);
      }

      else
      {
        double Current = CFAbsoluteTimeGetCurrent();
        int v12 = CFDateCreate(0LL, Current);
        if (!v12)
        {
          CFRelease(Mutable);
          return;
        }

        int v13 = v12;
        CFDictionarySetValue((CFMutableDictionaryRef)Mutable, @"ActivityTime", v12);
        CFRelease(v13);
      }

      unsigned int v14 = CFDictionaryGetValue(v3, @"AssertStartWhen");
      if (v14) {
        CFDictionarySetValue((CFMutableDictionaryRef)Mutable, @"AssertStartWhen", v14);
      }
      pid_t v15 = CFDictionaryGetValue(v3, @"AssertType");
      if (v15) {
        CFDictionarySetValue((CFMutableDictionaryRef)Mutable, @"AssertType", v15);
      }
      intptr_t v16 = CFDictionaryGetValue(v3, @"AssertName");
      if (v16) {
        CFDictionarySetValue((CFMutableDictionaryRef)Mutable, @"AssertName", v16);
      }
      CFDictionarySetValue((CFMutableDictionaryRef)Mutable, @"Action", v5);
      uint64_t v17 = a2[9];
      if (v17)
      {
        uintptr_t v18 = CFNumberCreate(0LL, kCFNumberIntType, (const void *)(v17 + 96));
        if (v18)
        {
          unsigned int v19 = v18;
          CFDictionarySetValue((CFMutableDictionaryRef)Mutable, @"AssertPID", v18);
          CFRelease(v19);
        }

        unsigned int v20 = CFDictionaryGetValue(v3, @"Process Name");
        if (v20) {
          CFDictionarySetValue((CFMutableDictionaryRef)Mutable, @"AssertProcess", v20);
        }
      }

      unsigned int v21 = CFNumberCreate(0LL, kCFNumberIntType, (char *)a2 + 60);
      if (v21)
      {
        uint64_t v22 = v21;
        CFDictionarySetValue((CFMutableDictionaryRef)Mutable, @"RetainCount", v21);
        CFRelease(v22);
      }

      int v23 = CFDictionaryGetValue(v3, @"GlobalUniqueID");
      if (v23) {
        CFDictionarySetValue((CFMutableDictionaryRef)Mutable, @"GlobalUniqueID", v23);
      }
      int v24 = CFDictionaryGetValue(v3, @"AssertionOnBehalfOfPID");
      if (v24) {
        CFDictionarySetValue((CFMutableDictionaryRef)Mutable, @"AssertionOnBehalfOfPID", v24);
      }
      uint64_t v25 = CFDictionaryGetValue(v3, @"AssertionOnBehalfOfPIDReason");
      if (v25) {
        CFDictionarySetValue((CFMutableDictionaryRef)Mutable, @"AssertionOnBehalfOfPIDReason", v25);
      }
      uint64_t v26 = CFDictionaryGetValue(v3, @"AssertionOnBehalfOfBundleID");
      if (v26) {
        CFDictionarySetValue((CFMutableDictionaryRef)Mutable, @"AssertionOnBehalfOfBundleID", v26);
      }
      char v27 = CFDictionaryGetValue(v3, @"FrameworkBundleID");
      if (v27) {
        CFDictionarySetValue((CFMutableDictionaryRef)Mutable, @"FrameworkBundleID", v27);
      }
      BOOL v28 = CFDictionaryGetValue(v3, @"InstanceMetadata");
      if (v28) {
        CFDictionarySetValue((CFMutableDictionaryRef)Mutable, @"InstanceMetadata", v28);
      }
      double v29 = CFDictionaryGetValue(v3, @"Category");
      if (v29) {
        CFDictionarySetValue((CFMutableDictionaryRef)Mutable, @"Category", v29);
      }
      size_t v30 = CFDictionaryGetValue(v3, @"IsCoalesced");
      if (v30) {
        CFDictionarySetValue((CFMutableDictionaryRef)Mutable, @"IsCoalesced", v30);
      }
      if (v4)
      {
        BOOL v31 = CFDictionaryGetValue(v3, @"CreatorBacktrace");
        if (v31) {
          CFDictionarySetValue((CFMutableDictionaryRef)Mutable, @"CreatorBacktrace", v31);
        }
      }

      CFArraySetValueAtIndex((CFMutableArrayRef)qword_1000679F0, dword_1000679E8 & 0x1FF, Mutable);
      ++dword_1000679E8;
      CFRelease(Mutable);
      double v32 = dword_1000679F8;
      if (dword_1000679F8 != -1)
      {
        ++dword_1000679F8;
        if (v32 >= 0x1CC)
        {
          notify_post("com.apple.powermanagement.assertions.logHighWM");
          dword_1000679F8 = -1;
          unsigned int v33 = (os_log_s *)qword_100067A10;
          if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)int v34 = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "Assertion bufffer has reached capacity. Sending high water mark notification",  v34,  2u);
          }
        }
      }

      return;
    case 10:
      uint64_t v4 = 0;
      int v5 = @"Suspended";
      goto LABEL_15;
    case 11:
      uint64_t v4 = 0;
      int v5 = @"Resumed";
      goto LABEL_15;
    case 12:
      uint64_t v4 = 0;
      int v5 = @"SystemTimeOutExpired";
      goto LABEL_15;
    case 13:
      uint64_t v4 = 0;
      ++qword_1000679D0;
      int v5 = @"SessionStarted";
      goto LABEL_15;
    case 14:
      uint64_t v4 = 0;
      int v5 = @"SessionEnded";
      goto LABEL_15;
    default:
      return;
  }

    CFRelease(v9);
  }

  return 0LL;
}

LABEL_17:
      uint64_t v22 = (os_log_s *)qword_100068818;
      if (os_log_type_enabled((os_log_t)qword_100068818, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v38 = 67109120;
        LODWORD(v39) = v15;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Charge To Full Request:%d",  (uint8_t *)&v38,  8u);
      }

      goto LABEL_22;
    }

    p_lastFullChargeDate = &self->_lastFullChargeDate;
    if (!self->_lastFullChargeDate) {
      goto LABEL_17;
    }
    objc_msgSend(v5, "timeIntervalSinceDate:");
    if (v26 <= 1814400.0)
    {
      if (!*p_lastFullChargeDate) {
        goto LABEL_17;
      }
      int v34 = (void *)qword_100068818;
      if (!os_log_type_enabled((os_log_t)qword_100068818, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_17;
      }
      int v35 = *p_lastFullChargeDate;
      uint64_t v17 = v34;
      [v5 timeIntervalSinceDate:v35];
      uint64_t v38 = 134217984;
      uint64_t v39 = v36 / 86400.0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v17,  OS_LOG_TYPE_DEFAULT,  "Last full charge date was %.1f days ago too recent",  (uint8_t *)&v38,  0xCu);
      goto LABEL_16;
    }

    char v27 = (void *)qword_100068818;
    if (os_log_type_enabled((os_log_t)qword_100068818, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v28 = *p_lastFullChargeDate;
      double v29 = v27;
      [v5 timeIntervalSinceDate:v28];
      uint64_t v38 = 134217984;
      uint64_t v39 = v30 / 86400.0;
      _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "Last full charge date was %.1f days ago, try and charge to full",  (uint8_t *)&v38,  0xCu);
    }

    [v5 timeIntervalSinceDate:self->_lastFullChargeDate];
    -[BatteryGaugingAccuracyManager updateAnalyticsMetricsMaxAttribute:interval:]( self,  "updateAnalyticsMetricsMaxAttribute:interval:",  &self->_maxDaysSinceFC);
    if (self->_lastAttemptedFullChargeDate)
    {
      objc_msgSend(v5, "timeIntervalSinceDate:");
      if (v31 > 43200.0)
      {
        objc_storeStrong((id *)&self->_lastFullChargeDate, v5);
        lastAttemptedFullChargeDate = self->_lastAttemptedFullChargeDate;
        self->_lastAttemptedFullChargeDate = 0LL;

        -[NSDate timeIntervalSinceReferenceDate](self->_lastFullChargeDate, "timeIntervalSinceReferenceDate");
        unsigned int v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
        -[BatteryGaugingAccuracyManager writeNSNumberDataToDisk::]( self,  "writeNSNumberDataToDisk::",  @"lastFullChargeDate",  v33);

        -[BatteryGaugingAccuracyManager writeNSNumberDataToDisk::]( self,  "writeNSNumberDataToDisk::",  @"lastAttemptedFullChargeDate",  0LL);
LABEL_35:
        pid_t v15 = 1;
        goto LABEL_17;
      }

      if (self->_lastAttemptedFullChargeDate) {
        goto LABEL_35;
      }
    }

    objc_storeStrong((id *)&self->_lastAttemptedFullChargeDate, v5);
    -[NSDate timeIntervalSinceReferenceDate](self->_lastAttemptedFullChargeDate, "timeIntervalSinceReferenceDate");
    unsigned int v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
    -[BatteryGaugingAccuracyManager writeNSNumberDataToDisk::]( self,  "writeNSNumberDataToDisk::",  @"lastAttemptedFullChargeDate",  v37);

    goto LABEL_35;
  }

  int v23 = (os_log_s *)qword_100068818;
  LOBYTE(v15) = 0;
  if (os_log_type_enabled((os_log_t)qword_100068818, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v3_Block_object_dispose(va, 8) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Invalid batteryProperties, skip gauging mitigation charge to full action",  (uint8_t *)&v38,  2u);
    LOBYTE(v15) = 0;
  }

uint64_t sub_10001D168()
{
  return 5LL;
}

uint64_t sub_10001D170(uint64_t a1, uint64_t a2, _DWORD *a3, _DWORD *a4)
{
  *a3 = dword_100066D68;
  *a4 = 0;
  return 0LL;
}

uint64_t sub_10001D188(uint64_t a1, _OWORD *a2, int a3, int a4, _DWORD *a5, int *a6)
{
  uid_t ruidp = -1;
  pid_t pidp = -1;
  gid_t rgidp = -1;
  __int128 v10 = a2[1];
  *(_OWORD *)atoken.val = *a2;
  *(_OWORD *)&atoken.val[4] = v10;
  audit_token_to_au32(&atoken, 0LL, 0LL, 0LL, &ruidp, &rgidp, &pidp, 0LL, 0LL);
  *a5 = 0;
  if (!sub_100038ED4(ruidp) && !sub_100039B28(ruidp))
  {
    int v11 = -536870207;
    goto LABEL_11;
  }

  *a5 = dword_100066D38;
  if (a4 != 2)
  {
    if (a4 == 1)
    {
      a3 = dword_100066D38 & ~a3;
    }

    else
    {
      if (a4)
      {
        int v11 = 0;
        goto LABEL_11;
      }

      a3 |= dword_100066D38;
    }
  }

  int v11 = 0;
  dword_100066D38 = a3;
LABEL_11:
  *a6 = v11;
  return 0LL;
}

uint64_t sub_10001D270(uint64_t a1, uint64_t a2, uint64_t a3, _DWORD *a4, _DWORD *a5)
{
  *a4 = 0;
  *a5 = 0;
  return 0LL;
}

uint64_t sub_10001D280(uint64_t a1, uint64_t a2, uint64_t a3, _DWORD *a4)
{
  *a4 = -536870201;
  return 0LL;
}

uint64_t sub_10001D294(int a1, int a2, char *buffer, int *a4)
{
  if (a2 == 1001 && qword_100067938 && CFStringGetCString((CFStringRef)qword_100067938, buffer, 1024LL, 0x8000100u))
  {
    int v6 = 0;
  }

  else
  {
    char *buffer = 0;
    int v6 = -536870160;
  }

  *a4 = v6;
  return 0LL;
}

uint64_t sub_10001D2FC(uint64_t a1, uint64_t a2, uint64_t a3, _DWORD *a4)
{
  *a4 = 0;
  return 0LL;
}

void sub_10001D308(int a1)
{
  if ((dword_1000672C0 & 8) != 0)
  {
    dword_1000672C0 &= ~8u;
    sub_1000262C4(10LL, 0LL);
    sub_1000262C4(18LL, 0LL);
    uint64_t v2 = sub_100039218();
    asl_set(v2, "com.apple.iokit.domain", "com.apple.sleepservices.sessionTerminated");
    if (sub_10003853C(value, 100)) {
      asl_set(v2, "uuid", value);
    }
    if (qword_100067938 && CFStringGetCString((CFStringRef)qword_100067938, buffer, 100LL, 0x8000100u)) {
      asl_set(v2, "uuid2", buffer);
    }
    snprintf(__str, 0x1EuLL, "%d", a1);
    asl_set(v2, "value", __str);
    asl_set(v2, "Message", "SleepService: window has terminated.");
    if (a1) {
      io_object_t v3 = "com.apple.sleepserviced.ExitTimeOutAssertions";
    }
    else {
      io_object_t v3 = "com.apple.sleepserviced.ExitCleanAssertions";
    }
    asl_set(v2, "signature", v3);
    asl_send(0LL, v2);
    asl_release(v2);
  }

uint64_t sub_10001D484()
{
  return dword_1000672C0 & 1;
}

uint64_t sub_10001D494()
{
  return (dword_1000672C0 >> 1) & 1;
}

uint64_t sub_10001D4A4()
{
  return (dword_1000672C0 >> 2) & 1;
}

void sub_10001D4B4()
{
  dword_1000672C0 |= 8u;
}

void sub_10001D4C8()
{
  dword_1000672C0 |= 0x80u;
}

void sub_10001D4DC()
{
  dword_1000672C0 &= ~0x80u;
}

uint64_t sub_10001D4F0()
{
  return dword_1000672C0 >> 7;
}

uint64_t sub_10001D500()
{
  return (dword_1000672C0 >> 3) & 1;
}

uint64_t sub_10001D510()
{
  return (dword_1000672C0 >> 6) & 1;
}

uint64_t sub_10001D520()
{
  return byte_100067922;
}

uint64_t sub_10001D52C(_DWORD *a1, _DWORD *a2)
{
  uint32_t outputCnt = 2;
  size_t v5 = 0LL;
  uint64_t result = IOConnectCallMethod(dword_1000672BC, 0xBu, 0LL, 0, 0LL, 0LL, &output, &outputCnt, 0LL, &v5);
  if (!(_DWORD)result)
  {
    if (a1) {
      *a1 = output;
    }
    if (a2) {
      *a2 = v8;
    }
  }

  return result;
}

void sub_10001D5D8()
{
  if (qword_1000672C8) {
    dispatch_source_cancel((dispatch_source_t)qword_1000672C8);
  }
}

void sub_10001D5EC(char a1, double a2)
{
  else {
    BOOL v4 = v16 == 1;
  }
  if (!v4)
  {
    if ((dword_100066D38 & 4) != 0) {
      asl_log(0LL, 0LL, 3, "Failed to get APO enabled key\n");
    }
LABEL_10:
    qword_100067910 = 0LL;
    return;
  }

  if (sub_100030D8C(@"AutoPowerOff Delay", &v15))
  {
    if ((dword_100066D38 & 4) != 0) {
      asl_log(0LL, 0LL, 3, "Failed to get APO delay timer \n");
    }
    goto LABEL_10;
  }

  double Current = CFAbsoluteTimeGetCurrent();
  double v6 = (double)v15;
  if (Current >= a2) {
    double v7 = Current;
  }
  else {
    double v7 = a2;
  }
  double v8 = v7 + v6;
  qword_100067910 = *(void *)&v8;
  if (v15 < 1)
  {
    if ((a1 & 1) != 0)
    {
      sub_10001D7A0();
      return;
    }

    BOOL v10 = Current < a2;
    double v11 = v8 - Current - v6;
    if (v10) {
      uint64_t v9 = (uint64_t)v11;
    }
    else {
      uint64_t v9 = v15;
    }
  }

  else
  {
    uint64_t v9 = (uint64_t)(v8 - Current);
  }

  if (qword_1000672C8)
  {
    dispatch_suspend((dispatch_object_t)qword_1000672C8);
  }

  else
  {
    int v12 = sub_100038248();
    qword_1000672C8 = (uint64_t)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  v12);
    dispatch_source_set_event_handler((dispatch_source_t)qword_1000672C8, &stru_100059BC0);
    dispatch_source_set_cancel_handler((dispatch_source_t)qword_1000672C8, &stru_100059BE0);
  }

  if ((dword_100066D38 & 4) != 0) {
    asl_log(0LL, 0LL, 3, "Set auto power off timer to fire in %lld secs\n", v9);
  }
  int v13 = (dispatch_source_s *)qword_1000672C8;
  dispatch_time_t v14 = dispatch_walltime(0LL, 1000000000 * v9);
  dispatch_source_set_timer(v13, v14, 0xFFFFFFFFFFFFFFFFLL, 0LL);
  dispatch_resume((dispatch_object_t)qword_1000672C8);
}

void sub_10001D7A0()
{
  int v1 = 0;
  if ((dword_1000672C0 & 1) == 0)
  {
    sub_10001D52C(&v1, 0LL);
    sub_100014420();
    if (v1 == 6 && v0 == 0.0)
    {
      if ((dword_100066D38 & 4) != 0) {
        asl_log(0LL, 0LL, 3, "Cancelling assertions for AutoPower Off\n");
      }
      if (qword_1000672C8) {
        dispatch_source_cancel((dispatch_source_t)qword_1000672C8);
      }
    }

    else
    {
      if ((dword_100066D38 & 4) != 0) {
        asl_log(0LL, 0LL, 3, "Resetting APO timer. sleepType:%d nextAutoWake:%f\n", v1, v0);
      }
      sub_10001D5EC(0LL, 0.0);
    }
  }

void sub_10001D858(id a1)
{
  if (qword_1000672C8)
  {
    dispatch_release((dispatch_object_t)qword_1000672C8);
    qword_1000672C8 = 0LL;
  }

uint64_t sub_10001D884()
{
  uint64_t result = sub_100019CD0();
  if ((_DWORD)result != dword_100066D6C) {
    dword_100066D6C = result;
  }
  return result;
}

void sub_10001D8AC()
{
  double v0 = sub_100038248();
  dispatch_async(v0, &stru_100059C00);
}

void sub_10001D8C8(id a1)
{
  int v1 = sub_100019CD0();
  if (v1 != dword_100066D6C) {
    dword_100066D6C = v1;
  }
}

void sub_10001D8F0()
{
  if (byte_100067922)
  {
    if (byte_100067921) {
      BOOL v0 = qword_1000672D0 == 0;
    }
    else {
      BOOL v0 = 0;
    }
    if (v0)
    {
      CFTypeRef cf1 = 0LL;
      sub_100038928(0LL, &cf1);
      if (!cf1 || !CFEqual(cf1, @"Notification"))
      {
        size_t v3 = 8LL;
        uint64_t v4 = 0LL;
        sysctlbyname("kern.useractive_abs_time", &v4, &v3, 0LL, 0LL);
        uint64_t v2 = (os_log_s *)qword_100067908;
        if (os_log_type_enabled((os_log_t)qword_100067908, OS_LOG_TYPE_DEBUG)) {
          sub_1000417B4(&v4, v2);
        }
        qword_1000672D0 = sub_10000AFC8(v4, qword_1000672D8);
        sub_1000398E8(qword_1000672D0);
      }
    }

    else
    {
      if (qword_1000672E0) {
        BOOL v1 = qword_1000672D0 == 0;
      }
      else {
        BOOL v1 = 0;
      }
      if (v1)
      {
        qword_1000672D0 = sub_10000AFC8(qword_1000672E0, qword_1000672D8);
        sub_1000398E8(qword_1000672D0);
      }

      else if (os_log_type_enabled((os_log_t)qword_100067908, OS_LOG_TYPE_DEBUG))
      {
        sub_100041828();
      }
    }
  }

  else if (os_log_type_enabled((os_log_t)qword_100067908, OS_LOG_TYPE_DEBUG))
  {
    sub_100041788();
  }

void sub_10001DA5C(uint64_t a1)
{
  uint64_t v2 = (os_log_s *)qword_100067908;
  if (os_log_type_enabled((os_log_t)qword_100067908, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 134217984;
    uint64_t v4 = a1;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "Updating wake start timestamp to %llu\n",  (uint8_t *)&v3,  0xCu);
  }

  qword_1000672E0 = a1;
}

void sub_10001DB00(uint64_t a1)
{
  uint64_t v2 = (os_log_s *)qword_100067908;
  if (os_log_type_enabled((os_log_t)qword_100067908, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 134217984;
    uint64_t v4 = a1;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "Updating wake end timestamp to %llu\n",  (uint8_t *)&v3,  0xCu);
  }

  qword_1000672D8 = a1;
}

uint64_t sub_10001DBA4()
{
  uint64_t v2 = 0LL;
  double v3 = 0.0;
  uint64_t result = IOPMGetLastWakeTime(&v3, &v2);
  if (!(_DWORD)result)
  {
    v1[0] = _NSConcreteStackBlock;
    v1[1] = 3221225472LL;
    v1[2] = sub_10001DC20;
    v1[3] = &unk_100059C20;
    v1[4] = (unint64_t)(CFAbsoluteTimeGetCurrent() - v3);
    return analytics_send_event_lazy("com.apple.powerd.awaketime", v1);
  }

  return result;
}

xpc_object_t sub_10001DC20(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v2, "WakeTime", *(void *)(a1 + 32));
  return v2;
}

uint64_t sub_10001DC64(const void *a1)
{
  uint64_t result = CFArrayGetTypeID();
  if (!a1) {
    return result;
  }
  uint64_t v3 = result;
  uint64_t result = CFGetTypeID(a1);
  if (result != v3) {
    return result;
  }
  uint64_t result = CFArrayGetCount((CFArrayRef)a1);
  if (result < 1) {
    return result;
  }
  uint64_t v4 = result;
  CFIndex v5 = 0LL;
  CFIndex v6 = -1LL;
  signed int v7 = 0x80000000;
  do
  {
    ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)a1, v5);
    uint64_t result = CFDictionaryGetTypeID();
    if (ValueAtIndex)
    {
      uint64_t v9 = result;
      uint64_t result = CFGetTypeID(ValueAtIndex);
      if (result == v9)
      {
        Value = CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, @"TransitionType");
        uint64_t result = CFStringGetTypeID();
        if (Value)
        {
          uint64_t v11 = result;
          uint64_t result = CFGetTypeID(Value);
          if (result == v11)
          {
            uint64_t result = CFEqual(Value, @"Sleep");
            if ((_DWORD)result)
            {
              int v12 = CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, @"ResponseType");
              uint64_t result = CFStringGetTypeID();
              if (v12)
              {
                uint64_t v13 = result;
                uint64_t result = CFGetTypeID(v12);
                if (result == v13)
                {
                  if (CFEqual(v12, @"ResponseSlow")
                    || (uint64_t result = CFEqual(v12, @"ResponseTimedOut"), (_DWORD)result))
                  {
                    uint64_t result = CFEqual(v12, @"ResponseTimedOut");
                    if ((_DWORD)result)
                    {
                      int v14 = 30000;
                      int valuePtr = 30000;
                    }

                    else
                    {
                      uint64_t v15 = CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, @"TimeMS");
                      uint64_t result = CFNumberGetTypeID();
                      if (!v15) {
                        goto LABEL_18;
                      }
                      uint64_t v16 = result;
                      uint64_t result = CFGetTypeID(v15);
                      if (result != v16) {
                        goto LABEL_18;
                      }
                      uint64_t result = CFNumberGetValue((CFNumberRef)v15, kCFNumberIntType, &valuePtr);
                      if (!(_DWORD)result) {
                        goto LABEL_18;
                      }
                      int v14 = valuePtr;
                    }

                    if (v14 > v7)
                    {
                      CFIndex v6 = v5;
                      signed int v7 = v14;
                    }
                  }
                }
              }
            }
          }
        }
      }
    }

xpc_object_t sub_10001DF14(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v2, "delay_time", *(int *)(a1 + 40));
  uint64_t v3 = *(const char **)(a1 + 32);
  if (v3 && *v3) {
    xpc_dictionary_set_string(v2, "last_responder", v3);
  }
  return v2;
}

uint64_t sub_10001DF78()
{
  return byte_100067923;
}

BOOL sub_10001DF84(int a1, double a2)
{
  if (a2 == 0.0) {
    return 0LL;
  }
  double Current = CFAbsoluteTimeGetCurrent();
  if (Current <= a2) {
    return 1LL;
  }
  double v6 = Current;
  signed int v7 = (os_log_s *)qword_100067908;
  BOOL result = os_log_type_enabled((os_log_t)qword_100067908, OS_LOG_TYPE_ERROR);
  if (result)
  {
    v8[0] = 67109376;
    v8[1] = a1;
    __int16 v9 = 2048;
    double v10 = a2 - v6;
    _os_log_error_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "Process %d scheduled a wake in the past %f\n",  (uint8_t *)v8,  0x12u);
    return 0LL;
  }

  return result;
}

uint64_t sub_10001E068()
{
  if (!dword_100067924) {
    return 0LL;
  }
  uint64_t v0 = 3758097097LL;
  int valuePtr = 0;
  if (sub_1000144BC() != 1)
  {
    uint64_t v0 = 0LL;
    unk_10006794C = 0;
    ++BYTE2(dword_100067948);
    dword_100067924 = 0;
    return v0;
  }

  CFNumberRef v1 = CFNumberCreate(0LL, kCFNumberIntType, &valuePtr);
  if (v1)
  {
    CFNumberRef v2 = v1;
    if (!dword_1000672B8)
    {
      CFRelease(v1);
      return v0;
    }

    IORegistryEntrySetCFProperty(dword_1000672B8, @"SilentRunning", v1);
    dword_100067924 = 0;
    CFRelease(v2);
    return 0LL;
  }

  return v0;
}

uint64_t sub_10001E13C(unsigned int a1)
{
  unk_10006794C = (float)a1;
  ++BYTE2(dword_100067948);
  return 0LL;
}

BOOL sub_10001E160()
{
  return dword_100067924 == 1;
}

BOOL sub_10001E174()
{
  return dword_100067928 == 1;
}

uint64_t sub_10001E188()
{
  if (dword_100067924 == 1) {
    return 0LL;
  }
  dword_100067924 = 1;
  uint64_t result = 0LL;
  unk_10006794C = 1065353216;
  ++BYTE2(dword_100067948);
  return result;
}

uint64_t sub_10001E200(int a1)
{
  CFNumberRef v2 = (os_log_s *)qword_100067908;
  if (os_log_type_enabled((os_log_t)qword_100067908, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = "Restricted";
    if (dword_100067928) {
      uint64_t v4 = "Restricted";
    }
    else {
      uint64_t v4 = "Unrestricted";
    }
    if (!a1) {
      uint64_t v3 = "Unrestricted";
    }
    int v6 = 136315394;
    signed int v7 = v4;
    __int16 v8 = 2080;
    __int16 v9 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "Current PerfMode: %s, Target PerfMode: %s\n",  (uint8_t *)&v6,  0x16u);
  }

  if ((dword_100067928 == 1) != a1) {
    dword_100067928 = a1;
  }
  return 0LL;
}

uint64_t sub_10001E2F4()
{
  if (sub_10002ADA4())
  {
    if (os_log_type_enabled((os_log_t)qword_100067908, OS_LOG_TYPE_DEBUG)) {
      sub_100041854();
    }
  }

  else
  {
    char v0 = sub_100036030();
    if ((v0 & 1) != 0)
    {
      if (os_log_type_enabled((os_log_t)qword_100067908, OS_LOG_TYPE_DEBUG)) {
        sub_1000418AC();
      }
    }

    else
    {
      if ((v0 & 2) == 0) {
        return 0LL;
      }
      if (os_log_type_enabled((os_log_t)qword_100067908, OS_LOG_TYPE_DEBUG)) {
        sub_100041880();
      }
    }
  }

  return 1LL;
}

uint64_t sub_10001E398()
{
  char v0 = sub_100036030();
  unsigned int v1 = ((v0 & 1) == 0LL) & ~sub_10002ADA4();
  if ((v0 & 2) != 0) {
    uint64_t v2 = 0LL;
  }
  else {
    uint64_t v2 = v1;
  }
  if ((_DWORD)v2 == 1 && os_log_type_enabled((os_log_t)qword_100067908, OS_LOG_TYPE_DEBUG)) {
    sub_1000418D8();
  }
  return v2;
}

void sub_10001E400()
{
  char v0 = sub_100038248();
  dispatch_async(v0, &stru_100059C60);
}

void sub_10001E41C(id a1)
{
  int v1 = dword_100067928;
  if (dword_100067928 != 1)
  {
LABEL_5:
    sub_10001E200(v1 != 1);
    return;
  }

  if ((sub_10001E2F4() & 1) != 0) {
    goto LABEL_5;
  }
}

uint64_t sub_10001E468(uint64_t result)
{
  byte_100066D3C = result;
  return result;
}

BOOL sub_10001E474()
{
  size_t v3 = 8LL;
  unint64_t v4 = 0LL;
  int v0 = sysctlbyname("kern.wake_abs_time", &v4, &v3, 0LL, 0LL);
  int v1 = (os_log_s *)qword_100067908;
  if (v0)
  {
    BOOL result = os_log_type_enabled((os_log_t)qword_100067908, OS_LOG_TYPE_ERROR);
    if (result)
    {
      sub_100041904();
      return 0LL;
    }
  }

  else
  {
    if (os_log_type_enabled((os_log_t)qword_100067908, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v6 = v4;
      __int16 v7 = 2048;
      uint64_t v8 = qword_100067918;
      _os_log_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_DEFAULT,  "wake_ts:0x%llx lastcall_ts:0x%llx\n",  buf,  0x16u);
    }

    return v4 > qword_100067918;
  }

  return result;
}

BOOL sub_10001E57C()
{
  if (byte_100066D3C) {
    BOOL v0 = 1LL;
  }
  else {
    BOOL v0 = sub_10001E474();
  }
  int v1 = (os_log_s *)qword_100067908;
  if (os_log_type_enabled((os_log_t)qword_100067908, OS_LOG_TYPE_DEFAULT))
  {
    v3[0] = 67109120;
    v3[1] = v0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "Sleep revert state: %d\n", (uint8_t *)v3, 8u);
  }

  return v0;
}

uint64_t sub_10001E634()
{
  return dword_1000672BC;
}

void sub_10001E640(_xpc_connection_s *a1, xpc_object_t original)
{
  if (a1 && original)
  {
    xpc_object_t reply = xpc_dictionary_create_reply(original);
    if (reply)
    {
      CFIndex v5 = reply;
      if (qword_1000679C0)
      {
        xpc_dictionary_set_int64(reply, "returnCode", 0LL);
        unint64_t v6 = (void *)_CFXPCCreateXPCObjectFromCFObject(qword_1000679C0);
        xpc_dictionary_set_value(v5, "wakeData", v6);
        if (v6) {
          xpc_release(v6);
        }
      }

      else
      {
        xpc_dictionary_set_int64(reply, "returnCode", -536870212LL);
      }

      xpc_connection_send_message(a1, v5);
      xpc_release(v5);
    }

    else if (os_log_type_enabled((os_log_t)qword_100067908, OS_LOG_TYPE_ERROR))
    {
      sub_100041930();
    }
  }

  else
  {
    __int16 v7 = (os_log_s *)qword_100067908;
    if (os_log_type_enabled((os_log_t)qword_100067908, OS_LOG_TYPE_ERROR)) {
      sub_10004195C((uint64_t)a1, (uint64_t)original, v7);
    }
  }

BOOL sub_10001E758(uint64_t a1, uint64_t a2)
{
  return *(_DWORD *)(a1 + 24) == *(_DWORD *)(a2 + 24);
}

void sub_10001E76C(uint64_t a1)
{
  if (sub_10001E8C0(a1))
  {
    uint64_t v2 = *(void *)(a1 + 8);
    if (v2)
    {
      nullsub_4(v2, "PMClientStats");
      CFRelease(*(CFTypeRef *)(a1 + 8));
      *(void *)(a1 + _Block_object_dispose(va, 8) = 0LL;
    }

    size_t v3 = *(dispatch_source_s **)(a1 + 16);
    if (v3)
    {
      dispatch_source_cancel(v3);
      dispatch_release(*(dispatch_object_t *)(a1 + 16));
      *(void *)(a1 + 16) = 0LL;
    }

    intptr_t v4 = *(void *)(a1 + 32);
    if (v4) {
      IOAllowPowerChange(dword_1000672BC, v4);
    }
    if (qword_1000672B0)
    {
      CFIndex Count = CFArrayGetCount((CFArrayRef)qword_1000672B0);
      if (Count >= 1)
      {
        CFIndex v6 = Count;
        for (CFIndex i = 0LL; i != v6; ++i)
        {
          ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)qword_1000672B0, i);
          if (ValueAtIndex[1] == a1) {
            ValueAtIndex[1] = 0LL;
          }
        }
      }

      if (*(void *)a1)
      {
        CFIndex v9 = CFArrayGetCount(*(CFArrayRef *)a1);
        if (v9 >= 1)
        {
          CFIndex v10 = v9;
          for (CFIndex j = 0LL; j != v10; ++j)
          {
            int v12 = CFArrayGetValueAtIndex(*(CFArrayRef *)a1, j);
            uint64_t v13 = (const void *)v12[8];
            if (v13) {
              CFRelease(v13);
            }
            int v14 = (const void *)v12[9];
            if (v14) {
              CFRelease(v14);
            }
            uint64_t v15 = (const void *)v12[10];
            if (v15) {
              CFRelease(v15);
            }
            free(v12);
          }
        }

        CFRelease(*(CFTypeRef *)a1);
      }

      if (qword_1000672F0 == a1) {
        qword_1000672F0 = 0LL;
      }
      free((void *)a1);
    }
  }

BOOL sub_10001E8C0(uint64_t a1)
{
  double v73 = kCFAbsoluteTimeIntervalSince1904;
  pid_t valuePtr = getpid();
  if (a1) {
    CFIndex Count = CFArrayGetCount(*(CFArrayRef *)a1);
  }
  else {
    CFIndex Count = 0LL;
  }
  if (!qword_1000679C8) {
    qword_1000679C8 = (uint64_t)CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  }
  if (Count < 1)
  {
    __int16 v7 = 0LL;
    CFIndex v6 = 0LL;
    int v5 = 0;
    char v70 = 0;
    int v8 = -1;
    int v9 = 4;
    if (!a1) {
      goto LABEL_46;
    }
  }

  else
  {
    ValueAtIndex = (const __CFString **)CFArrayGetValueAtIndex(*(CFArrayRef *)a1, 0LL);
    if (!*((_BYTE *)ValueAtIndex + 96))
    {
      __int16 v7 = 0LL;
      BOOL v25 = 0LL;
      goto LABEL_56;
    }

    intptr_t v4 = ValueAtIndex;
    char v70 = 0;
    int v5 = 0;
    CFIndex v6 = 0LL;
    __int16 v7 = 0LL;
    int v8 = -1;
    int v9 = 4;
    double v10 = v73;
    CFIndex v11 = 1LL;
    double v12 = kCFAbsoluteTimeIntervalSince1904;
    CFIndex v71 = Count;
    while (1)
    {
      if ((*(_BYTE *)(a1 + 40) & 1) == 0 && *v4)
      {
        if (sub_10001DF84(HIDWORD((*v4)->length), *((double *)v4 + 5)))
        {
          __int16 v7 = sub_10001F350(v7, HIDWORD((*v4)->length), "Maintenance", v4[8], *((CFAbsoluteTime *)v4 + 5));
          if (*((double *)v4 + 5) < v12)
          {
            double v10 = *((double *)v4 + 5);
            double v12 = v10;
            int v9 = 1;
            int v8 = v5;
            CFIndex v6 = v4;
          }

          ++v5;
        }

        if (sub_10001DF84(HIDWORD((*v4)->length), *((double *)v4 + 7)))
        {
          uint64_t v13 = v7;
          int v14 = v4[10];
          CFTypeID TypeID = CFStringGetTypeID();
          if (v14 && CFGetTypeID(v14) == TypeID)
          {
            int length_high = HIDWORD((*v4)->length);
            CFAbsoluteTime v17 = *((double *)v4 + 7);
            uintptr_t v18 = v4[10];
          }

          else
          {
            int length_high = HIDWORD((*v4)->length);
            CFAbsoluteTime v17 = *((double *)v4 + 7);
            uintptr_t v18 = v4[8];
          }

          unsigned int v19 = sub_10001F350(v13, length_high, "SleepService", v18, v17);
          if (*((double *)v4 + 7) < v12)
          {
            double v10 = *((double *)v4 + 7);
            int v9 = 2;
            double v12 = v10;
            int v8 = v5;
            CFIndex v6 = v4;
          }

          ++v5;
          char v70 = 1;
          CFIndex Count = v71;
        }

        else
        {
          unsigned int v19 = v7;
        }

        if (sub_10001DF84(HIDWORD((*v4)->length), *((double *)v4 + 6)))
        {
          unsigned int v20 = v4[9];
          CFTypeID v21 = CFStringGetTypeID();
          if (v20 && CFGetTypeID(v20) == v21)
          {
            int v22 = HIDWORD((*v4)->length);
            CFAbsoluteTime v23 = *((double *)v4 + 6);
            int v24 = v4[9];
          }

          else
          {
            int v22 = HIDWORD((*v4)->length);
            CFAbsoluteTime v23 = *((double *)v4 + 6);
            int v24 = v4[8];
          }

          __int16 v7 = sub_10001F350(v19, v22, "TimerPlugin", v24, v23);
          if (*((double *)v4 + 6) < v12)
          {
            double v10 = *((double *)v4 + 6);
            double v12 = v10;
            int v9 = 3;
            int v8 = v5;
            CFIndex v6 = v4;
          }

          ++v5;
          CFIndex Count = v71;
        }

        else
        {
          __int16 v7 = v19;
        }
      }

      if (Count == v11) {
        break;
      }
      intptr_t v4 = (const __CFString **)CFArrayGetValueAtIndex(*(CFArrayRef *)a1, v11++);
      if (!*((_BYTE *)v4 + 96))
      {
        double v73 = v10;
        BOOL v25 = v11 - 1 >= Count;
        goto LABEL_56;
      }
    }

    double v73 = v10;
  }

  if ((*(_BYTE *)(a1 + 40) & 1) == 0)
  {
    if (v6)
    {
      uint64_t v26 = *v6;
      pid_t valuePtr = HIDWORD((*v6)->length);
      CFStringGetCString((CFStringRef)v26->data, buffer, 128LL, 0x8000100u);
      char v27 = v6[8];
      if (v27 || (char v27 = v6[9]) != 0LL || (char v27 = v6[10]) != 0LL) {
        CFStringGetCString(v27, cStr, 128LL, 0x8000100u);
      }
    }

LABEL_134:
      BOOL v25 = 1LL;
      if (!v7) {
        return v25;
      }
      goto LABEL_59;
    }

    int v35 = (const __CFString *)CFDictionaryGetValue(v31, @"scheduledby");
    uint64_t v36 = CFDictionaryGetValue(v31, @"appPID");
    CFTypeID v37 = CFStringGetTypeID();
    if (v35 && CFGetTypeID(v35) == v37 && (CFTypeID v38 = CFNumberGetTypeID(), v36) && CFGetTypeID(v36) == v38)
    {
      CFMutableStringRef v39 = CFStringCreateMutable(0LL, 1024LL);
      CFStringAppendFormat(v39, 0LL, @"%@,%@", v35, v36);
    }

    else
    {
      CFMutableStringRef v39 = 0LL;
    }

    pid_t v42 = getpid();
    double v29 = sub_10001F350(v7, v42, "UserWake", v39, v32);
    if (v32 > v73)
    {
      int v41 = 0LL;
      if (!v39) {
        goto LABEL_73;
      }
      goto LABEL_72;
    }

    double v73 = v32;
    if (v36)
    {
      CFNumberGetValue((CFNumberRef)v36, kCFNumberIntType, &valuePtr);
      if (v35) {
        goto LABEL_69;
      }
    }

    else
    {
      pid_t valuePtr = getpid();
      if (v35)
      {
LABEL_69:
        CFStringGetCString(v35, buffer, 128LL, 0x8000100u);
        if (!v39) {
          goto LABEL_71;
        }
        goto LABEL_70;
      }
    }

    strcpy(buffer, "powerd");
    if (!v39)
    {
LABEL_71:
      int v41 = (const __CFString *)CFDictionaryGetValue(v31, @"eventtype");
      int v9 = 0;
      int v28 = v5;
      if (!v39)
      {
LABEL_73:
        ++v5;
        goto LABEL_74;
      }

LABEL_72:
      CFRelease(v39);
      goto LABEL_73;
    }

LABEL_70:
    CFStringGetCString(v39, cStr, 128LL, 0x8000100u);
    goto LABEL_71;
  }

  BOOL v25 = 1LL;
LABEL_56:
  if (qword_1000679C8)
  {
    CFRelease((CFTypeRef)qword_1000679C8);
    qword_1000679C8 = 0LL;
  }

  if (v7) {
LABEL_59:
  }
    asl_release(v7);
  return v25;
}

  free(v6);
  if (v8) {
    goto LABEL_10;
  }
LABEL_11:
  if (v10) {
    CFRelease(v10);
  }
  if (v11) {
    CFRelease(v11);
  }
LABEL_15:
  CFRelease(v2);
}

__asl_object_s *sub_10001F350( __asl_object_s *a1, int pid, const char *a3, const __CFString *a4, CFAbsoluteTime a5)
{
  int v9 = a1;
  if (!a1)
  {
    int v9 = sub_100039218();
    asl_set(v9, "com.apple.iokit.domain", "ClientWakeRequests");
    dword_1000672E8 = 0;
  }

  buffer[0] = 0;
  __str[0] = 0;
  proc_name(pid, buffer, 0x200u);
  snprintf(__str, 0x32uLL, "%s%d", "WakeAppName", dword_1000672E8);
  asl_set(v9, __str, buffer);
  snprintf(__str, 0x32uLL, "%s%d", "WakeType", dword_1000672E8);
  asl_set(v9, __str, a3);
  snprintf(__str, 0x32uLL, "%s%d", "WakeTimeDelta", dword_1000672E8);
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  snprintf(buffer, 0x200uLL, "%.0f", a5 - Current);
  asl_set(v9, __str, buffer);
  CFIndex v11 = sub_10000ADF0();
  CFCalendarDecomposeAbsoluteTime(v11, a5, "yMdHms", &v19, &v18, &v17, &v16, &v15, &v14);
  snprintf(__str, 0x32uLL, "%s%d", "WakeTime", dword_1000672E8);
  snprintf(buffer, 0x200uLL, "%d-%02d-%02d %02d:%02d:%02d", v19, v18, v17, v16, v15, v14);
  asl_set(v9, __str, buffer);
  CFTypeID TypeID = CFStringGetTypeID();
  if (a4 && CFGetTypeID(a4) == TypeID && CFStringGetCString(a4, buffer, 512LL, 0x8000100u))
  {
    snprintf(__str, 0x32uLL, "%s%d", "WakeClientInfo", dword_1000672E8);
    asl_set(v9, __str, buffer);
  }

  ++dword_1000672E8;
  return v9;
}

void sub_10001F5D0(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  if (v1 == -536656848)
  {
    BOOL v4 = 0;
    BOOL v3 = dword_100067308 != v2;
    dword_100067308 = *(void *)(a1 + 32);
    int v5 = "com.apple.powermanagement.systemsleeppreventers";
    CFIndex v6 = &dword_1000672FC;
  }

  else
  {
    if (v1 != -536656864) {
      return;
    }
    BOOL v3 = 0;
    BOOL v4 = dword_100067304 != v2;
    dword_100067304 = *(void *)(a1 + 32);
    int v5 = "com.apple.powermanagement.idlesleeppreventers";
    CFIndex v6 = &dword_1000672F8;
  }

  int v7 = *v6;
  if (!*v6)
  {
    if (notify_register_check(v5, v6))
    {
      *CFIndex v6 = 0;
      goto LABEL_10;
    }

    int v7 = *v6;
    if (!*v6) {
      goto LABEL_10;
    }
  }

  notify_set_state(v7, v2);
  notify_post(v5);
LABEL_10:
  if (v4)
  {
    nullsub_4(0LL, v8);
    sub_10002C254(0LL);
  }

  if (v3)
  {
    nullsub_4(1LL, v8);
    sub_10002C254(1LL);
  }

void sub_10001F6E8(int a1)
{
  int valuePtr = a1;
  if (sub_100038238())
  {
    CFStringRef v1 = SCDynamicStoreKeyCreate( 0LL,  @"%@%@",  kSCDynamicStoreDomainState,  @"/IOKit/SystemPowerCapabilities");
    if (v1)
    {
      uint64_t v2 = v1;
      CFNumberRef v3 = CFNumberCreate(0LL, kCFNumberIntType, &valuePtr);
      if (v3)
      {
        CFNumberRef v4 = v3;
        sub_100038120(v2, v3);
        CFRelease(v4);
      }

      CFRelease(v2);
    }
  }

uint64_t sub_10001F778(uint64_t a1)
{
  if (qword_1000672F0) {
    sub_10001FBF0(qword_1000672F0, 0);
  }
  if (((word_10006730C + 1) & 0xFFFE) != 0) {
    int v2 = (unsigned __int16)(word_10006730C + 1);
  }
  else {
    int v2 = 1;
  }
  word_10006730C = v2;
  CFNumberRef v3 = (os_log_s *)qword_100067908;
  if (os_log_type_enabled((os_log_t)qword_100067908, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    int v26 = 0;
    __int16 v27 = 1024;
    int v28 = v2;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "connectionFireNotification: 0x%x gen 0x%x\n",  buf,  0xEu);
  }

  int v4 = dword_100066D68;
  dword_100066D68 = 0;
  if (!v4) {
    return 0LL;
  }
  CFMutableStringRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0LL, (const CFArrayCallBacks *)&unk_100066D40);
  CFIndex Count = CFArrayGetCount((CFArrayRef)qword_1000672B0);
  if (Count >= 1)
  {
    CFIndex v7 = Count;
    for (CFIndex i = 0LL; i != v7; ++i)
    {
      ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)qword_1000672B0, i);
      if ((ValueAtIndex[8] & v4) != 0) {
        CFArrayAppendValue(Mutable, ValueAtIndex);
      }
    }
  }

  if (!Mutable) {
    return 0LL;
  }
  int v10 = CFArrayGetCount(Mutable);
  if (!v10 || (CFIndex v11 = calloc(1uLL, 0x38uLL)) == 0LL)
  {
    CFRelease(Mutable);
    return 0LL;
  }

  uint64_t v12 = (uint64_t)v11;
  v11[10] = 0;
  v11[12] = 28;
  *((void *)v11 + 4) = a1;
  *((_WORD *)v11 + 26) = word_10006730C;
  *(void *)CFIndex v11 = CFArrayCreateMutable(kCFAllocatorDefault, v10, &stru_100067310);
  *(_DWORD *)(v12 + 44) = v10;
  *(void *)(v12 + _Block_object_dispose(va, 8) = CFArrayCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeArrayCallBacks);
  if (v10 >= 1)
  {
    CFIndex v13 = 0LL;
    uint64_t v14 = v10;
    do
    {
      int v15 = (mach_port_t *)CFArrayGetValueAtIndex(Mutable, v13);
      mach_port_t v16 = *v15;
      if (*v15 && *((_BYTE *)v15 + 36))
      {
        int v17 = (unsigned __int16)(v13 + 1) | (*(unsigned __int16 *)(v12 + 52) << 16);
        *((void *)v15 + 1) = v12;
        sub_10001FEA8(v16, 0, v17);
        int v18 = calloc(1uLL, 0x68uLL);
        if (!v18) {
          goto LABEL_26;
        }
        int v19 = v18;
        *((_DWORD *)v18 + 4) = v17;
        *((_DWORD *)v18 + 23) = 0;
        void *v18 = v15;
        v18[1] = v12;
        *((CFAbsoluteTime *)v18 + 4) = CFAbsoluteTimeGetCurrent();
        CFArrayAppendValue(*(CFMutableArrayRef *)v12, v19);
        if ((dword_100066D38 & 4) != 0) {
          nullsub_4(*(void *)(*(void *)v19 + 16LL), 0LL);
        }
      }

      ++v13;
    }

    while (v14 != v13);
  }

  unsigned int v20 = sub_100038248();
  CFTypeID v21 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, v20);
  dispatch_time_t v22 = dispatch_time(0LL, 1000000000LL * *(int *)(v12 + 48));
  dispatch_source_set_timer(v21, v22, 0xFFFFFFFFFFFFFFFFLL, 0LL);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_10001FF14;
  handler[3] = &unk_1000598E8;
  void handler[4] = v12;
  dispatch_source_set_event_handler(v21, handler);
  *(void *)(v12 + 16) = v21;
  dispatch_activate(v21);
LABEL_26:
  CFRelease(Mutable);
  qword_1000672F0 = v12;
  return v12;
}

void sub_10001FAC0(uint64_t a1)
{
  int v2 = (os_log_s *)qword_100067908;
  if (os_log_type_enabled((os_log_t)qword_100067908, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109120;
    v9[1] = a1;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "sendNoRespNotification: 0x%x\n",  (uint8_t *)v9,  8u);
  }

  CFIndex Count = CFArrayGetCount((CFArrayRef)qword_1000672B0);
  if (Count >= 1)
  {
    CFIndex v4 = Count;
    for (CFIndex i = 0LL; i != v4; ++i)
    {
      ValueAtIndex = (mach_port_t *)CFArrayGetValueAtIndex((CFArrayRef)qword_1000672B0, i);
      if ((ValueAtIndex[8] & a1) != 0)
      {
        CFIndex v7 = ValueAtIndex;
        mach_port_t v8 = *ValueAtIndex;
        if (v8)
        {
          if (*((_BYTE *)v7 + 36))
          {
            sub_10001FEA8(v8, a1, 0);
            if ((dword_100066D38 & 4) != 0) {
              nullsub_4(*((void *)v7 + 2), a1);
            }
          }
        }
      }
    }
  }

void sub_10001FBE4(id a1)
{
}

void sub_10001FBF0(uint64_t a1, int a2)
{
  if (a1)
  {
    CFIndex v4 = (os_log_s *)qword_100067908;
    if (os_log_type_enabled((os_log_t)qword_100067908, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = *(unsigned __int16 *)(a1 + 52);
      v22[0] = 67109376;
      v22[1] = v5;
      __int16 v23 = 1024;
      int v24 = a2;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "cleanClientResponses: gen 0x%x timeout %d\n",  (uint8_t *)v22,  0xEu);
    }

    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 16));
    dispatch_release(*(dispatch_object_t *)(a1 + 16));
    *(void *)(a1 + 16) = 0LL;
    CFIndex Count = CFArrayGetCount(*(CFArrayRef *)a1);
    if (Count >= 1)
    {
      CFIndex v7 = Count;
      for (CFIndex i = 0LL; i != v7; ++i)
      {
        ValueAtIndex = (double *)CFArrayGetValueAtIndex(*(CFArrayRef *)a1, i);
        if (ValueAtIndex)
        {
          int v10 = ValueAtIndex;
          if (!*((_BYTE *)ValueAtIndex + 96))
          {
            *((_BYTE *)ValueAtIndex + 96) = 1;
            *((_BYTE *)ValueAtIndex + 97) = a2;
            double Current = CFAbsoluteTimeGetCurrent();
            v10[3] = Current;
            uint64_t v12 = *((void *)v10 + 1);
            if (*(void *)(v12 + 8))
            {
              unsigned int v13 = ((Current - v10[4]) * 1000.0);
              v22[0] = v13;
              uint64_t v14 = @"ResponseTimedOut";
              if (*((_BYTE *)v10 + 97)
                || (uint64_t v14 = @"ResponseSlow", v13 > 0xFA)
                || (uint64_t v14 = @"ResponsePrompt", (dword_100066D38 & 4) != 0))
              {
                CFMutableStringRef Mutable = CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
                if (Mutable)
                {
                  mach_port_t v16 = Mutable;
                  CFDictionarySetValue(Mutable, @"ResponseType", v14);
                  CFDictionarySetValue(v16, @"Name", *(const void **)(*(void *)v10 + 16LL));
                  CFNumberRef v17 = CFNumberCreate(0LL, kCFNumberIntType, (char *)v10 + 92);
                  if (v17)
                  {
                    CFNumberRef v18 = v17;
                    CFDictionarySetValue(v16, @"PowerCaps", v17);
                    CFRelease(v18);
                  }

                  CFNumberRef v19 = CFNumberCreate(0LL, kCFNumberIntType, v22);
                  if (v19)
                  {
                    CFNumberRef v20 = v19;
                    CFDictionarySetValue(v16, @"TimeMS", v19);
                    CFRelease(v20);
                  }

                  CFTypeID v21 = @"Sleep";
                  if ((dword_1000672C0 & 1) != 0
                    || (CFTypeID v21 = @"DarkWake", (dword_1000672C0 & 2) != 0)
                    || (CFTypeID v21 = @"Wake", (dword_1000672C0 & 0x40) != 0))
                  {
                    CFDictionarySetValue(v16, @"TransitionType", v21);
                  }

                  CFArrayAppendValue(*(CFMutableArrayRef *)(v12 + 8), v16);
                  CFRelease(v16);
                }
              }
            }
          }
        }
      }
    }

    sub_10001E76C(a1);
  }

void sub_10001FEA8(mach_port_t a1, int a2, int a3)
{
  *(void *)&msg.msgh_bits = 0x2400000013LL;
  *(void *)&msg.msgh_voucher_port = 0LL;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  int v4 = 0;
  int v5 = a2;
  int v6 = a3;
  if (mach_msg(&msg, 17, 0x24u, 0, 0, 0, 0) == 268435460) {
    mach_msg_destroy(&msg);
  }
}

void sub_10001FF14(uint64_t a1)
{
}

void sub_10001FF20(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

  ;
}

uint64_t sub_10001FF4C(char a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_10001FFA4;
  v2[3] = &unk_100059CA0;
  char v3 = a1;
  return analytics_send_event_lazy("com.apple.powerd.assertioncount", v2);
}

xpc_object_t sub_10001FFA4(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_BOOL(v2, "DisplayOn", *(_BYTE *)(a1 + 32));
  xpc_dictionary_set_uint64(v2, "NumAssertions", qword_1000679D0);
  qword_1000679D0 = 0LL;
  return v2;
}

uint64_t sub_100020004(unsigned int a1)
{
  return sub_100027F30((uint64_t)&unk_100067A90 + 160 * a1, 3u, (uint64_t)&stru_100059CE0);
}

void sub_100020024(id a1, assertion *a2)
{
}

void sub_10002002C(int a1, uint64_t a2)
{
  char v4 = dword_100066D38;
  if ((dword_100066D38 & 0x41) != 0)
  {
    __str[0] = 0;
    v44[0] = 0;
    v48[0] = 0;
    v42[0] = 0;
    v46[0] = 0;
    buffer[0] = 0;
    int v5 = *(_DWORD *)(a2 + 24);
    if ((v5 & 0x20) == 0)
    {
      if ((dword_100066D38 & 2) != 0)
      {
LABEL_13:
        mach_port_t v8 = "Created";
        switch(a1)
        {
          case 0:
            goto LABEL_29;
          case 2:
            mach_port_t v8 = "Released";
            goto LABEL_29;
          case 3:
            mach_port_t v8 = "ClientDied";
            goto LABEL_29;
          case 4:
            mach_port_t v8 = "TimedOut";
            goto LABEL_29;
          case 5:
            goto LABEL_15;
          case 6:
            goto LABEL_16;
          case 7:
            mach_port_t v8 = "TurnedOff";
            goto LABEL_29;
          case 8:
            mach_port_t v8 = "TurnedOn";
            goto LABEL_29;
          case 9:
            char v4 = dword_100066D38;
            goto LABEL_25;
          case 10:
            goto LABEL_17;
          case 11:
            goto LABEL_18;
          case 12:
            goto LABEL_19;
          case 13:
            mach_port_t v8 = "SessionStarted";
            goto LABEL_29;
          case 14:
            mach_port_t v8 = "SessionEnded";
            goto LABEL_29;
          default:
            break;
        }
      }

      else
      {
        switch(a1)
        {
          case 0:
          case 8:
          case 13:
            if ((*((_BYTE *)&unk_100067A90 + 160 * *(unsigned int *)(a2 + 48)) & 0x20) != 0)
            {
              *(_DWORD *)(a2 + 24) = v5 | 0x40;
              goto LABEL_13;
            }

            break;
          case 2:
          case 3:
          case 4:
          case 7:
          case 14:
            int v6 = sub_10003AE20();
            if ((*(_BYTE *)(a2 + 24) & 0x40) != 0) {
              goto LABEL_13;
            }
            unint64_t v7 = v6 ? 5LL : 10LL;
            if (sub_100039ACC() - *(void *)(a2 + 32) >= v7) {
              goto LABEL_13;
            }
            break;
          case 5:
LABEL_15:
            mach_port_t v8 = "CapExpired";
            goto LABEL_29;
          case 6:
LABEL_16:
            mach_port_t v8 = "Summary";
            goto LABEL_29;
          case 9:
LABEL_25:
            if ((v4 & 0x80) == 0) {
              break;
            }
            mach_port_t v8 = "NameChange";
LABEL_29:
            int v9 = *(const __CFDictionary **)(a2 + 16);
            if (v9)
            {
              Value = (const __CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(a2 + 16), @"AssertType");
              CFIndex v11 = Value;
              if (Value) {
                CFStringGetCString(Value, buffer, 200LL, 0x8000100u);
              }
              uint64_t v12 = (const __CFString *)CFDictionaryGetValue(v9, @"AssertName");
              unsigned int v13 = v12;
              if (v12) {
                CFStringGetCString(v12, v46, 200LL, 0x8000100u);
              }
              uint64_t v14 = (const __CFDate *)CFDictionaryGetValue(v9, @"AssertStartWhen");
              if (v14)
              {
                double AbsoluteTime = CFDateGetAbsoluteTime(v14);
                CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
                snprintf( __str,  0xAuLL,  "%02d:%02d:%02d ",  (int)(Current - AbsoluteTime) / 3600,  (int)(Current - AbsoluteTime) / 60 % 60,  (int)(Current - AbsoluteTime) % 60);
              }

              CFNumberRef v17 = (const __CFString *)CFDictionaryGetValue(v9, @"Process Name");
              int v9 = (const __CFDictionary *)v17;
              if (v17) {
                CFStringGetCString(v17, v48, 64LL, 0x8000100u);
              }
            }

            else
            {
              unsigned int v13 = 0LL;
              CFIndex v11 = 0LL;
            }

            char v18 = sub_10002A064();
            sub_1000207D0(v43, 0xC8uLL, v18);
            snprintf(v44, 0xC8uLL, "%s", v43);
            snprintf( v42,  0xC8uLL,  "0x%llx",  *(unsigned int *)(a2 + 52) | ((unint64_t)*(unsigned int *)(a2 + 48) << 32));
            v41[0] = 0;
            __int16 v19 = *(_WORD *)(a2 + 104);
            if ((v19 & 0x3FE) == 0) {
              goto LABEL_51;
            }
            strcpy(v41, "[Qualifiers:");
            if ((v19 & 2) != 0)
            {
              __strlcat_chk(v41, " AudioIn", 200LL, 200LL);
              __int16 v19 = *(_WORD *)(a2 + 104);
              if ((v19 & 4) == 0)
              {
LABEL_42:
                if ((v19 & 8) == 0) {
                  goto LABEL_43;
                }
                goto LABEL_59;
              }
            }

            else if ((v19 & 4) == 0)
            {
              goto LABEL_42;
            }

            __strlcat_chk(v41, " AudioOut", 200LL, 200LL);
            __int16 v19 = *(_WORD *)(a2 + 104);
            if ((v19 & 8) == 0)
            {
LABEL_43:
              if ((v19 & 0x10) == 0) {
                goto LABEL_44;
              }
              goto LABEL_60;
            }

LABEL_59:
            __strlcat_chk(v41, " GPS", 200LL, 200LL);
            __int16 v19 = *(_WORD *)(a2 + 104);
            if ((v19 & 0x10) == 0)
            {
LABEL_44:
              if ((v19 & 0x20) == 0) {
                goto LABEL_45;
              }
              goto LABEL_61;
            }

    ++v33;
    --v4;
  }

  while (v4);
  if (!v32) {
    goto LABEL_69;
  }
  if (!mkdir("/private/var/run/thermal", 0x1FFu)) {
    lchmod("/private/var/run/thermal", 0x1FFu);
  }
  __int16 v39 = open("/private/var/run/thermal/.thermalpressure", 536871426, 511LL);
  int v6 = v41;
  int v10 = theDict;
  if ((v39 & 0x80000000) == 0)
  {
    unsigned int v40 = v39;
    memset(&v43, 0, sizeof(v43));
    if (!fstat(v39, &v43) && v43.st_nlink == 1) {
      fchmod(v40, 0x1FFu);
    }
    close(v40);
  }

LABEL_61:
            __strlcat_chk(v41, " Bluetooth", 200LL, 200LL);
            __int16 v19 = *(_WORD *)(a2 + 104);
            if ((v19 & 0x80) == 0)
            {
LABEL_46:
              if ((v19 & 0x100) == 0) {
                goto LABEL_47;
              }
              goto LABEL_63;
            }

LABEL_62:
            __strlcat_chk(v41, " Camera", 200LL, 200LL);
            __int16 v19 = *(_WORD *)(a2 + 104);
            if ((v19 & 0x100) == 0)
            {
LABEL_47:
              if ((v19 & 0x40) == 0) {
                goto LABEL_48;
              }
              goto LABEL_64;
            }

LABEL_63:
            __strlcat_chk(v41, " AllowsDeviceRestart", 200LL, 200LL);
            __int16 v19 = *(_WORD *)(a2 + 104);
            if ((v19 & 0x40) == 0)
            {
LABEL_48:
              if ((v19 & 0x200) == 0) {
                goto LABEL_50;
              }
              goto LABEL_49;
            }

LABEL_64:
            __strlcat_chk(v41, " PerfUnrestricted", 200LL, 200LL);
            if ((*(_WORD *)(a2 + 104) & 0x200) != 0) {
LABEL_49:
            }
              __strlcat_chk(v41, " BudgetedActivity", 200LL, 200LL);
LABEL_50:
            __strlcat_chk(v41, "]", 200LL, 200LL);
LABEL_51:
            if ((dword_100066D38 & 0x40) != 0)
            {
              CFNumberRef v20 = (os_log_s *)qword_100067A10;
              if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_DEFAULT))
              {
                int v21 = *(_DWORD *)(*(void *)(a2 + 72) + 96LL);
                unint64_t v22 = *(unsigned int *)(a2 + 52) | ((unint64_t)*(unsigned int *)(a2 + 48) << 32);
                *(_DWORD *)buf = 138545410;
                int v24 = v9;
                __int16 v25 = 1024;
                int v26 = v21;
                __int16 v27 = 2082;
                int v28 = v8;
                __int16 v29 = 2114;
                size_t v30 = v11;
                __int16 v31 = 2114;
                double v32 = v13;
                __int16 v33 = 2082;
                BOOL v34 = __str;
                __int16 v35 = 2048;
                unint64_t v36 = v22;
                __int16 v37 = 2082;
                CFTypeID v38 = v43;
                __int16 v39 = 2082;
                unsigned int v40 = v41;
                _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Process %{public}@.%d %{public}s %{public}@ %{public}@ age:%{public}s id:%lld %{public}s %{public}s",  buf,  0x58u);
              }
            }

            break;
          case 10:
LABEL_17:
            mach_port_t v8 = "Suspended";
            goto LABEL_29;
          case 11:
LABEL_18:
            mach_port_t v8 = "Resumed";
            goto LABEL_29;
          case 12:
LABEL_19:
            mach_port_t v8 = "SystemTimeOutExpired";
            goto LABEL_29;
          default:
            break;
        }
      }
    }
  }

  sub_100020B2C(a1, (void *)a2);
}

void sub_100020640()
{
  int v6 = 0;
  int v7 = 1;
  BOOL v0 = sub_100019B0C(&v7, (uint64_t)&v6);
  int v1 = sub_100019CD0();
  int v7 = v1;
  if (dword_100066D70 == v1)
  {
    int v2 = dword_100067340;
    int v1 = v7;
  }

  dword_100066D70 = v1;
  dword_100067340 = sub_10002A064();
  char v3 = sub_10002A064();
  sub_1000207D0(v11, 0x64uLL, v3);
  if (v0) {
    snprintf(__str, 0x40uLL, "(Charge: %d)", v6);
  }
  else {
    __str[0] = 0;
  }
  if (v7) {
    char v4 = "AC";
  }
  else {
    char v4 = "Batt";
  }
  snprintf(v12, 0x64uLL, "Summary- %s Using %s%s", v11, v4, __str);
  if ((dword_100066D38 & 0x40) != 0)
  {
    int v5 = (os_log_s *)qword_100067A10;
    if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      int v9 = v11;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Summary- %{public}s\n", buf, 0xCu);
    }
  }

size_t sub_1000207D0(char *a1, size_t a2, char a3)
{
  else {
    size_t v6 = 0LL;
  }
  if ((a3 & 1) == 0)
  {
    if ((a3 & 0x40) == 0) {
      goto LABEL_28;
    }
LABEL_31:
    if (strlcat(a1, " kDisp", a2) + v6) {
      return strlcat(a1, "]", a2);
    }
LABEL_32:
    strlcat(a1, " No Assertions", a2);
    return strlcat(a1, "]", a2);
  }

  v6 += strlcat(a1, " kCPU", a2);
  if ((a3 & 0x40) != 0) {
    goto LABEL_31;
  }
LABEL_28:
  if (!v6) {
    goto LABEL_32;
  }
  return strlcat(a1, "]", a2);
}

void sub_100020A2C()
{
  if (!qword_100067348)
  {
    BOOL v0 = sub_100038248();
    qword_100067348 = (uint64_t)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  v0);
    dispatch_source_set_event_handler((dispatch_source_t)qword_100067348, &stru_100059D00);
    int v1 = (dispatch_source_s *)qword_100067348;
    dispatch_time_t v2 = dispatch_time(0LL, 900000000000LL);
    dispatch_source_set_timer(v1, v2, 0xFFFFFFFFFFFFFFFFLL, 0LL);
    dispatch_resume((dispatch_object_t)qword_100067348);
  }

  uint64_t segname = stru_100000020.segname;
  do
  {
    if (segname != 1000) {
      sub_100027F30( (uint64_t)&unk_100067A90 + 160 * *(unsigned int *)((char *)&unk_100067A90 + segname),  3u,  (uint64_t)&stru_100059CE0);
    }
    segname += 160LL;
  }

  while (segname != 3240);
  char v4 = (dispatch_source_s *)qword_100067348;
  dispatch_time_t v5 = dispatch_time(0LL, 900000000000LL);
  dispatch_source_set_timer(v4, v5, 0xFFFFFFFFFFFFFFFFLL, 0LL);
}

void sub_100020B2C(int a1, void *a2)
{
  char v3 = (const __CFDictionary *)a2[2];
  int v4 = 1;
  dispatch_time_t v5 = @"Retain";
  switch(a1)
  {
    case 0:
      ++qword_1000679D0;
      dispatch_time_t v5 = @"Created";
      goto LABEL_15;
    case 1:
      goto LABEL_15;
    case 2:
      int v4 = 0;
      dispatch_time_t v5 = @"Released";
      goto LABEL_15;
    case 3:
      int v4 = 0;
      dispatch_time_t v5 = @"ClientDied";
      goto LABEL_15;
    case 4:
      int v4 = 0;
      dispatch_time_t v5 = @"TimedOut";
      goto LABEL_15;
    case 7:
      int v4 = 0;
      dispatch_time_t v5 = @"TurnedOff";
      goto LABEL_15;
    case 8:
      dispatch_time_t v5 = @"TurnedOn";
      goto LABEL_15;
    case 9:
      if ((dword_100066D38 & 0x80) == 0) {
        return;
      }
      int v4 = 0;
      dispatch_time_t v5 = @"NameChange";
LABEL_15:
      if (qword_1000679F0) {
        goto LABEL_16;
      }
      qword_1000679F0 = (uint64_t)CFArrayCreateMutable(0LL, 512LL, &kCFTypeArrayCallBacks);
      if (!qword_1000679F0) {
        return;
      }
      dword_1000679F8 = -1;
      notify_post("com.apple.powermanagement.assertions.logHighWM");
      int v10 = (os_log_s *)qword_100067A10;
      if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Assertion bufffer initialized. Sending high water mark notification",  buf,  2u);
      }

void sub_10002110C(uint64_t a1, const __CFArray *a2)
{
  int v4 = calloc(1uLL, 0x70uLL);
  int Count = CFArrayGetCount(a2);
  if (Count >= 1)
  {
    CFIndex v6 = 0LL;
    uint64_t v7 = Count;
    do
    {
      ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(a2, v6);
      _DWORD v4[2] = ValueAtIndex;
      v4[9] = a1;
      Value = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, @"Action");
      if (!Value)
      {
        CFDateRef v13 = (os_log_s *)qword_100067A10;
        if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_ERROR)) {
          sub_1000419DC(&v14, v15, v13);
        }
        goto LABEL_20;
      }

      int v10 = Value;
      CFComparisonResult v11 = CFStringCompare(Value, @"Created", 0LL);
      if (v11)
      {
        if (CFStringCompare(v10, @"Released", 0LL))
        {
          if (CFStringCompare(v10, @"TurnedOn", 0LL))
          {
            if (CFStringCompare(v10, @"TurnedOff", 0LL))
            {
              if (CFStringCompare(v10, @"TimedOut", 0LL))
              {
                if (CFStringCompare(v10, @"NameChange", 0LL))
                {
                  CFDateRef v12 = (os_log_s *)qword_100067A10;
                  if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    uint64_t v17 = v10;
                    _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "Unexpected value encountered for key kPMAsyncAssertionActionNameChange: %@.",  buf,  0xCu);
                  }

                  goto LABEL_20;
                }

                LODWORD(v11) = 9;
              }

              else
              {
                LODWORD(v11) = 4;
              }
            }

            else
            {
              LODWORD(v11) = 7;
            }
          }

          else
          {
            LODWORD(v11) = 8;
          }
        }

        else
        {
          LODWORD(v11) = 2;
        }
      }

      sub_100020B2C(v11, v4);
LABEL_20:
      ++v6;
    }

    while (v7 != v6);
  }

  free(v4);
}

__CFArray *sub_100021334(unsigned int *a1, _DWORD *a2, int a3)
{
  unsigned int v6 = *a1;
  unsigned int v7 = dword_1000679E8;
  *a2 = 0;
  int Count = (char *)qword_1000679F0;
  CFTypeID TypeID = CFArrayGetTypeID();
  if (!Count)
  {
LABEL_4:
    if (!a3) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }

  if (CFGetTypeID(Count) == TypeID)
  {
    int Count = (char *)CFArrayGetCount((CFArrayRef)qword_1000679F0);
    goto LABEL_4;
  }

  int Count = 0LL;
  if (a3)
  {
LABEL_5:
    *a2 = 1;
    unsigned int v6 = -1;
    *a1 = -1;
  }

LABEL_6:
  if (v6 == v7 || Count == 0LL) {
    return 0LL;
  }
  if ((uint64_t)Count <= (v6 & 0x1FF))
  {
    *a2 = 1;
    asl_log(0LL, 0LL, 3, "Unexpected readFromIdx %d. arrCnt=%ld\n", v6, Count);
    unsigned int v6 = -1;
    *a1 = -1;
  }

  if (v6 == -1 && v7 <= 0x200)
  {
    CFComparisonResult v11 = (__CFArray *)qword_1000679F0;
    CFTypeID v12 = CFArrayGetTypeID();
    if (!v11) {
      return v11;
    }
    if (CFGetTypeID(v11) == v12)
    {
      CFIndex v13 = 0LL;
      CFIndex v14 = (CFIndex)(Count - 1);
      goto LABEL_27;
    }

    return 0LL;
  }

  CFIndex v14 = (v7 - 1) & 0x1FF;
  if (v7 < v6 || v7 > v6 + 512)
  {
    *a2 = 1;
    else {
      CFIndex v13 = v7 & 0x1FF;
    }
  }

  else
  {
    CFIndex v13 = v6 & 0x1FF;
  }

    mach_msg_destroy(msg);
  }

uint64_t sub_10002159C( uint64_t a1, _OWORD *a2, vm_address_t *a3, unsigned int *a4, unsigned int *a5, _DWORD *a6, int *a7)
{
  if (!a3 || !a6)
  {
    int v14 = -536870206;
LABEL_12:
    *a7 = v14;
    return 0LL;
  }

  *a7 = -536870160;
  *a3 = 0LL;
  *a4 = 0;
  *a6 = 0;
  __int128 v12 = a2[1];
  v22[0] = *a2;
  v22[1] = v12;
  if (!sub_1000382AC(v22, @"com.apple.private.iokit.powerlogging"))
  {
    if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_ERROR)) {
      sub_100041A18();
    }
    int v14 = -536870174;
    goto LABEL_12;
  }

  dword_1000679F8 = 0;
  if ((byte_100067350 & 1) == 0) {
    byte_100067350 = 1;
  }
  if (qword_1000679F0)
  {
    char v13 = 0;
  }

  else
  {
    qword_1000679F0 = (uint64_t)CFArrayCreateMutable(0LL, 512LL, &kCFTypeArrayCallBacks);
    if (!qword_1000679F0)
    {
      *a7 = -536870211;
      return 0LL;
    }

    char v13 = byte_100067350 ^ 1;
  }

  mach_port_t v16 = sub_100021334(a5, a6, v13 & 1);
  CFDataRef Data = CFPropertyListCreateData(0LL, v16, kCFPropertyListBinaryFormat_v1_0, 0LL, 0LL);
  if (Data)
  {
    CFRange v18 = Data;
    unsigned int Length = CFDataGetLength(Data);
    *a4 = Length;
    vm_allocate(mach_task_self_, a3, Length, 1);
    CFNumberRef v20 = (void *)*a3;
    if (v20)
    {
      BytePtr = CFDataGetBytePtr(v18);
      memcpy(v20, BytePtr, *a4);
      *a7 = 0;
      *a5 = dword_1000679E8;
    }

    CFRelease(v18);
  }

  if (v16) {
    CFRelease(v16);
  }
  return 0LL;
}

void sub_100021764(void *a1, int a2)
{
  int value_4 = 0;
  dword_1000679F8 = 0;
  if ((byte_100067351 & 1) == 0) {
    byte_100067351 = 1;
  }
  if (qword_1000679E0) {
    BOOL v4 = qword_1000679D8 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4)
  {
    unsigned int value = xpc_dictionary_get_uint64((xpc_object_t)qword_1000679E0, "assertionActivityUpdateRefCnt");
    dispatch_time_t v5 = sub_100021334(&value, &value_4, (byte_100067351 & 1) == 0);
    if (a2)
    {
      unsigned int v6 = (os_log_s *)qword_100067A10;
      if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "_sendAssertionActivityUpdate: Overflow from a client",  buf,  2u);
      }

      int value_4 = 1;
    }

    xpc_object_t reply = xpc_dictionary_create_reply((xpc_object_t)qword_1000679E0);
    if (!reply)
    {
      if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_ERROR)) {
        sub_100041930();
      }
      goto LABEL_31;
    }

    mach_port_t v8 = reply;
    if (v5)
    {
      int v9 = (void *)_CFXPCCreateXPCObjectFromCFObject(v5);
      if (!a1)
      {
LABEL_18:
        unsigned int v10 = value;
        xpc_dictionary_set_uint64(v8, "assertionActivityUpdateRefCnt", value);
        int v11 = value_4;
        xpc_dictionary_set_BOOL(v8, "assertionActivityUpdateOverflow", value_4 != 0);
        xpc_dictionary_set_value(v8, "assertionActivityUpdateData", v9);
        xpc_dictionary_set_value(v8, "assertionActivityUpdateProcessList", a1);
        xpc_dictionary_set_uint64(v8, "returnCode", 0LL);
        xpc_connection_send_message((xpc_connection_t)qword_1000679D8, v8);
        xpc_release(v8);
        if (v5) {
          int Count = CFArrayGetCount(v5);
        }
        else {
          int Count = 0;
        }
        char v13 = (os_log_s *)qword_100067A10;
        if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109632;
          int v17 = Count;
          __int16 v18 = 1024;
          unsigned int v19 = v10;
          __int16 v20 = 1024;
          int v21 = v11;
          _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Assertion Activity Update: logged %d entries. New refCnt %d, overflow %d",  buf,  0x14u);
        }

        if (v9) {
          xpc_release(v9);
        }
        if (a1) {
          xpc_release(a1);
        }
LABEL_31:
        if (v5) {
          CFRelease(v5);
        }
        goto LABEL_33;
      }
    }

    else
    {
      int v9 = 0LL;
      if (!a1) {
        goto LABEL_18;
      }
    }

    a1 = (void *)_CFXPCCreateXPCObjectFromCFObject(a1);
    goto LABEL_18;
  }

  if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_ERROR)) {
    sub_100041A44();
  }
LABEL_33:
  if (qword_1000679E0)
  {
    xpc_release((xpc_object_t)qword_1000679E0);
    qword_1000679E0 = 0LL;
  }

  if (qword_1000679D8)
  {
    xpc_release((xpc_object_t)qword_1000679D8);
    qword_1000679D8 = 0LL;
  }

void sub_100021A50(_xpc_connection_s *a1, void *a2)
{
  if (a1 && a2)
  {
    int v4 = 0;
  }

  else
  {
    if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_ERROR)) {
      sub_100041AC8();
    }
    int v4 = -536870206;
  }

  if (!sub_100038354(a1, @"com.apple.private.iokit.powerlogging"))
  {
    int v4 = -536870174;
    if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_ERROR)) {
      sub_100041A9C();
    }
  }

  if (sub_100024DDC())
  {
    int v4 = -536870187;
    if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_ERROR)) {
      sub_100041A70();
    }
  }

  else if (!v4)
  {
    qword_1000679D8 = (uint64_t)xpc_retain(a1);
    qword_1000679E0 = (uint64_t)xpc_retain(a2);
    sub_100024E08(0);
    return;
  }

  xpc_object_t reply = xpc_dictionary_create_reply(a1);
  if (reply)
  {
    unsigned int v6 = reply;
    xpc_dictionary_set_uint64(reply, "returnCode", v4);
    xpc_connection_send_message(a1, v6);
    xpc_release(v6);
  }

void sub_100021B98(void *a1)
{
  if (qword_1000679E0) {
    BOOL v2 = qword_1000679D8 == 0;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_ERROR)) {
      sub_100041B2C();
    }
  }

  else
  {
    xpc_object_t reply = xpc_dictionary_create_reply((xpc_object_t)qword_1000679E0);
    if (reply)
    {
      int v4 = reply;
      if (a1) {
        a1 = (void *)_CFXPCCreateXPCObjectFromCFObject(a1);
      }
      xpc_dictionary_set_value(v4, "assertionActiveAsyncByProcess", a1);
      xpc_dictionary_set_uint64(v4, "returnCode", 0LL);
      xpc_connection_send_message((xpc_connection_t)qword_1000679D8, v4);
      xpc_release(v4);
      if (a1) {
        xpc_release(a1);
      }
    }

    else if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_ERROR))
    {
      sub_100041930();
    }
  }

void sub_100021C98(_xpc_connection_s *a1, void *a2)
{
  if (a1 && a2)
  {
    int v4 = 0;
  }

  else
  {
    if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_ERROR)) {
      sub_100041AC8();
    }
    int v4 = -536870206;
  }

  if (!sub_100038354(a1, @"com.apple.private.iokit.powerlogging"))
  {
    int v4 = -536870174;
    if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_ERROR)) {
      sub_100041A9C();
    }
  }

  if (sub_100024DDC())
  {
    int v4 = -536870187;
    if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_ERROR)) {
      sub_100041A70();
    }
  }

  else if (!v4)
  {
    qword_1000679D8 = (uint64_t)xpc_retain(a1);
    qword_1000679E0 = (uint64_t)xpc_retain(a2);
    sub_100024E08(1);
    return;
  }

  xpc_object_t reply = xpc_dictionary_create_reply(a1);
  if (reply)
  {
    unsigned int v6 = reply;
    xpc_dictionary_set_uint64(reply, "returnCode", v4);
    xpc_connection_send_message(a1, v6);
    xpc_release(v6);
  }

void sub_100021DE0(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 64))
  {
    if (*(void *)a2 || (CFMutableDataRef Mutable = CFDataCreateMutable(0LL, 0LL), (*(void *)a2 = Mutable) != 0LL))
    {
      if (qword_100067358 || (qword_100067358 = IOReportCopyCurrentProcessName()) != 0)
      {
        if (!qword_100067360)
        {
          uint64_t valuePtr = 0x100000000000000LL;
          qword_100067360 = (uint64_t)CFDictionaryCreateMutable( 0LL,  1LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
          if (!qword_100067360) {
            return;
          }
          CFNumberRef v5 = CFNumberCreate(0LL, kCFNumberLongLongType, &valuePtr);
          if (!v5) {
            return;
          }
          CFNumberRef v6 = v5;
          CFDictionarySetValue((CFMutableDictionaryRef)qword_100067360, @"IOReportChannelUnit", v5);
          CFRelease(v6);
        }

        uint64_t Aggregate = *(void *)(a2 + 24);
        if (Aggregate || (uint64_t Aggregate = IOReportCreateAggregate(0LL), (*(void *)(a2 + 24) = Aggregate) != 0LL))
        {
          pid_t v8 = getpid();
          if (!IOReportAddChannelDescription( Aggregate,  v8,  qword_100067358,  *(int *)(a1 + 96),  0x400020004LL,  @"Assertion duration by process",  @"I/O Kit Power Management",  @"Power Assertions",  qword_100067360,  0LL))
          {
            int v9 = (void *)(a1 + 8);
            for (uint64_t i = 32LL; i != 64; i += 8LL)
            {
              if (*((_DWORD *)v9 - 2))
              {
                uint64_t v11 = *(void *)(a1 + 64);
                if (*(_WORD *)(v11 + 20))
                {
                  uint64_t v12 = *(void *)(a2 + 16) - *v9;
                  uint64_t v13 = *(void *)(v11 + i);
                  BOOL v14 = __CFADD__(v13, v12);
                  unint64_t v15 = v13 + v12;
                  if (v14) {
                    uint64_t v16 = (v13 >> 63) + 1;
                  }
                  else {
                    uint64_t v16 = v13 >> 63;
                  }
                  if ((v16 & 1) != v15 >> 63 || v16 << 63 >> 63 != v16) {
                    unint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
                  }
                  *(void *)(v11 + i) = v15;
                }
              }

              *int v9 = *(void *)(a2 + 16);
              v9 += 2;
            }

            CFDataAppendBytes( *(CFMutableDataRef *)a2,  *(const UInt8 **)(a1 + 64),  (unint64_t)*(unsigned __int16 *)(*(void *)(a1 + 64) + 20LL) << 6);
          }
        }
      }
    }
  }

uint64_t sub_100021F9C(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = *(_DWORD *)(*(void *)a1 + 100LL);
  unsigned int v3 = *(_DWORD *)(*(void *)a2 + 100LL);
  BOOL v4 = v2 >= v3;
  BOOL v5 = v2 != v3;
  if (v4) {
    return v5;
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t sub_100021FBC(uint64_t *a1)
{
  uint64_t v1 = 3758097085LL;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  if (dword_100067A30)
  {
    *(void *)&__int128 v12 = sub_100039ACC();
    int64_t Count = CFDictionaryGetCount((CFDictionaryRef)qword_100067A18);
    BOOL v4 = (const void **)malloc(8 * Count);
    if (v4)
    {
      BOOL v5 = v4;
      bzero(v4, 8 * Count);
      CFDictionaryGetKeysAndValues((CFDictionaryRef)qword_100067A18, 0LL, v5);
      qsort(v5, Count, 8uLL, (int (__cdecl *)(const void *, const void *))sub_100021F9C);
      if (Count < 1)
      {
        pid_t v8 = 0LL;
        unsigned int v7 = 0LL;
      }

      else
      {
        CFNumberRef v6 = (uint64_t *)v5;
        do
        {
          if (!*v6) {
            break;
          }
          sub_100021DE0(*v6++, (uint64_t)&v11);
          --Count;
        }

        while (Count);
        unsigned int v7 = (const void *)*((void *)&v12 + 1);
        pid_t v8 = (const void *)v11;
      }

      uint64_t SamplesRaw = IOReportCreateSamplesRaw(v7, v8, 0LL);
      free(v5);
      *a1 = SamplesRaw;
      if (v7) {
        CFRelease(v7);
      }
      if (v8) {
        CFRelease(v8);
      }
      return 0LL;
    }
  }

  else
  {
    asl_log( 0LL,  0LL,  3,  "gActivityAggCnt = 0; IOPMCopyAssertionActivityAggregate() called without w/o IOPMSetAssertionActivityAggregate(true)?!\n");
    return 3758097101LL;
  }

  return v1;
}

uint64_t sub_10002210C(uint64_t a1, _OWORD *a2, vm_address_t *a3, unsigned int *a4, _DWORD *a5)
{
  CFPropertyListRef propertyList = 0LL;
  *a4 = 0;
  int v9 = sub_100021FBC((uint64_t *)&propertyList);
  *a5 = v9;
  CFPropertyListRef v10 = propertyList;
  if (v9)
  {
    if (!propertyList) {
      return 0LL;
    }
    goto LABEL_10;
  }

  if (propertyList)
  {
    CFDataRef Data = CFPropertyListCreateData(0LL, propertyList, kCFPropertyListBinaryFormat_v1_0, 0LL, 0LL);
    if (Data)
    {
      __int128 v12 = Data;
      unsigned int Length = CFDataGetLength(Data);
      *a4 = Length;
      vm_allocate(mach_task_self_, a3, Length, 1);
      BOOL v14 = (void *)*a3;
      BytePtr = CFDataGetBytePtr(v12);
      memcpy(v14, BytePtr, *a4);
      __int128 v16 = a2[1];
      v18[0] = *a2;
      v18[1] = v16;
      if (sub_1000382AC(v18, @"com.apple.private.iokit.powerlogging")) {
        sub_1000295CC();
      }
      CFRelease(v10);
      CFPropertyListRef v10 = v12;
    }

    else
    {
      *a5 = -536870199;
    }

LABEL_10:
    CFRelease(v10);
  }

  return 0LL;
}

  *(NDR_record_t *)(a2 + 24) = v4;
  return result;
}

void sub_100022220(_xpc_connection_s *a1, xpc_object_t xdict)
{
  uint64_t value = 0xFFFFFFFF00000000LL;
  uint64_t v23 = 0LL;
  int valuePtr = 0;
  if (xpc_dictionary_get_value(xdict, "assertionCreate"))
  {
    BOOL v4 = (const __CFDictionary *)_CFXPCCreateCFObjectFromXPCMessage();
    CFTypeID TypeID = CFDictionaryGetTypeID();
    if (v4 && CFGetTypeID(v4) == TypeID)
    {
      xpc_connection_get_audit_token(a1, v25);
      uint64_t pid = xpc_connection_get_pid(a1);
      uid_t euid = xpc_connection_get_euid(a1);
      xpc_connection_get_egid(a1);
      CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(0LL, 0LL, v4);
      int v9 = (const __CFNumber *)CFDictionaryGetValue(MutableCopy, @"AsyncClientAssertionId");
      CFTypeID v10 = CFNumberGetTypeID();
      if (v9 && CFGetTypeID(v9) == v10) {
        CFNumberGetValue(v9, kCFNumberSInt32Type, &valuePtr);
      }
      *(_OWORD *)buf = v25[0];
      __int128 v27 = v25[1];
      if (!sub_10002260C(buf, MutableCopy))
      {
        int v11 = -536870207;
        if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_ERROR)) {
          sub_100041C3C();
        }
        goto LABEL_29;
      }

      if (sub_100022814(MutableCopy) && !sub_100038ED4(euid) && !sub_100039B28(euid))
      {
        int v11 = -536870207;
LABEL_29:
        CFRelease(v4);
        if (!MutableCopy) {
          goto LABEL_32;
        }
        unsigned int v19 = MutableCopy;
        goto LABEL_31;
      }

      int v11 = sub_100022860(pid, MutableCopy, &value, &v23, (_DWORD *)&value + 1);
      if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_DEBUG))
      {
        sub_100041BDC();
        if (a1)
        {
LABEL_13:
          if (v23)
          {
            xpc_object_t v12 = xpc_retain(a1);
            *(void *)(v23 + 12sub_1000262C4(0x12u, 0) = v12;
          }
        }
      }

      else if (a1)
      {
        goto LABEL_13;
      }

      uint64_t v13 = (os_log_s *)qword_100067A10;
      if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109632;
        *(_DWORD *)&uint8_t buf[4] = value;
        *(_WORD *)&uint8_t buf[8] = 1024;
        *(_DWORD *)&buf[10] = valuePtr;
        *(_WORD *)&_BYTE buf[14] = 1024;
        LODWORD(v27) = pid;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "Created assertion with id 0x%x for remote id 0x%x from pid %d\n",  buf,  0x14u);
      }

      xpc_object_t v14 = xpc_dictionary_get_value(xdict, "assertionActivityLog");
      if (v14)
      {
        xpc_object_t v15 = v14;
        if (xpc_get_type(v14) == (xpc_type_t)&_xpc_type_array)
        {
          uint64_t v16 = _CFXPCCreateCFObjectFromXPCObject(v15);
          if (v16)
          {
            int v17 = (const __CFArray *)v16;
            __int16 v18 = CFDictionaryGetValue((CFDictionaryRef)qword_100067A18, (const void *)(int)pid);
            sub_10002110C((uint64_t)v18, v17);
            CFRelease(v17);
          }
        }
      }

      goto LABEL_29;
    }

    if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_ERROR)) {
      sub_100041BB0();
    }
    int v11 = -536870206;
    if (v4)
    {
      unsigned int v19 = v4;
LABEL_31:
      CFRelease(v19);
    }
  }

  else
  {
    int v11 = -536870206;
    if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_ERROR)) {
      sub_100041B84();
    }
  }

LABEL_32:
  xpc_object_t reply = xpc_dictionary_create_reply(xdict);
  if (reply)
  {
    int v21 = reply;
    xpc_dictionary_set_uint64(reply, "returnCode", v11);
    xpc_dictionary_set_uint64(v21, "assertionId", value);
    xpc_dictionary_set_uint64(v21, "EnTrIntensity", SHIDWORD(value));
    xpc_connection_send_message(a1, v21);
    xpc_release(v21);
  }

  else if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_ERROR))
  {
    sub_100041B58();
  }

BOOL sub_10002260C(_OWORD *a1, const __CFDictionary *a2)
{
  pid_t pidp = -1;
  __int128 v4 = a1[1];
  *(_OWORD *)atoken.val = *a1;
  *(_OWORD *)&atoken.val[4] = v4;
  audit_token_to_au32(&atoken, 0LL, 0LL, 0LL, 0LL, 0LL, &pidp, 0LL, 0LL);
  Value = CFDictionaryGetValue(a2, @"AssertType");
  unsigned int v6 = sub_100025F14(Value);
  if ((v6 & 0x80000000) == 0)
  {
    unsigned int v7 = (const __CFString *)*((void *)&unk_100067A90 + 20 * v6 + 8);
    if (v7)
    {
      __int128 v8 = a1[1];
      *(_OWORD *)atoken.val = *a1;
      *(_OWORD *)&atoken.val[4] = v8;
      if (!sub_1000382AC(&atoken, v7))
      {
        BOOL result = os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_ERROR);
        if (!result) {
          return result;
        }
        sub_100041D8C();
        return 0LL;
      }
    }
  }

  int v9 = (const __CFBoolean *)CFDictionaryGetValue(a2, @"AppliesToLimitedPower");
  CFTypeID TypeID = CFBooleanGetTypeID();
  if (v9)
  {
    CFBooleanRef v11 = kCFBooleanTrue;
    if (CFGetTypeID(v9) == TypeID && v9 == kCFBooleanTrue)
    {
      __int128 v12 = a1[1];
      *(_OWORD *)atoken.val = *a1;
      *(_OWORD *)&atoken.val[4] = v12;
      CFBooleanRef v11 = v9;
      if (!sub_1000382AC(&atoken, @"com.apple.private.iokit.assertonbattery"))
      {
        BOOL result = os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_ERROR);
        if (!result) {
          return result;
        }
        sub_100041D1C();
        return 0LL;
      }
    }
  }

  else
  {
    CFBooleanRef v11 = kCFBooleanTrue;
  }

  CFBooleanRef v14 = (CFBooleanRef)CFDictionaryGetValue(a2, @"AppliesOnLidClose");
  CFTypeID v15 = CFBooleanGetTypeID();
  if (!v14) {
    return 1LL;
  }
  CFTypeID v16 = v15;
  CFTypeID v17 = CFGetTypeID(v14);
  BOOL result = 1LL;
  if (v17 == v16 && v14 == v11)
  {
    __int128 v18 = a1[1];
    *(_OWORD *)atoken.val = *a1;
    *(_OWORD *)&atoken.val[4] = v18;
    if (!sub_1000382AC(&atoken, @"com.apple.private.iokit.assertonlidclose"))
    {
      BOOL result = os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_ERROR);
      if (!result) {
        return result;
      }
      sub_100041CAC();
      return 0LL;
    }

    return 1LL;
  }

  return result;
}

BOOL sub_100022814(const __CFDictionary *a1)
{
  return CFDictionaryGetValue(a1, @"DisableInflow") || CFDictionaryGetValue(a1, @"ChargeInhibit") != 0LL;
}

uint64_t sub_100022860(uint64_t a1, const void *a2, _DWORD *a3, uint64_t *a4, _DWORD *a5)
{
  uint64_t value = 0LL;
  *a3 = 0;
  CFTypeID v10 = sub_100023548(a1);
  if (!v10)
  {
    uint64_t v18 = 3758097085LL;
    uint64_t v19 = sub_100023584(a1);
    if (!v19) {
      return v18;
    }
    CFTypeID v10 = (_DWORD *)v19;
    if ((*(_BYTE *)(v19 + 136) & 0x20) != 0) {
      return v18;
    }
    if (a4) {
      *a4 = v19;
    }
  }

  if ((char)v10[34] < 0)
  {
    uint64_t v18 = 3758097097LL;
    if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_ERROR)) {
      sub_100041E58();
    }
  }

  else
  {
    int v11 = dword_1000674D8;
    while (1)
    {
      __int128 v12 = (const void *)v11;
      int v11 = (v11 + 1) % 10240;
      if (v11 == dword_1000674D8)
      {
        __int128 v12 = (const void *)v11;
        break;
      }
    }

    if (CFDictionaryGetValueIfPresent((CFDictionaryRef)qword_100067408, v12, (const void **)&value) == 1
      || (uint64_t v13 = calloc(1uLL, 0x70uLL)) == 0LL)
    {
      uint64_t v18 = 3758097085LL;
      sub_1000237D8(a1);
    }

    else
    {
      uint64_t v14 = (uint64_t)v13;
      v13[2] = a2;
      CFRetain(a2);
      *(_DWORD *)(v14 + 6sub_1000262C4(0x12u, 0) = 1;
      *(void *)(v14 + 72) = v10;
      int v15 = *(_DWORD *)(v14 + 80);
      if (v15)
      {
        CFTypeID v16 = sub_100023548(v15);
      }

      *(_DWORD *)(v14 + 52) = v11 & 0x7FFF | 0x8000;
      CFDictionarySetValue((CFMutableDictionaryRef)qword_100067408, v12, (const void *)v14);
      dword_1000674D8 = (v11 + 1) % 10240;
      uint64_t v17 = sub_10002EA3C(v14);
      if ((_DWORD)v17)
      {
        uint64_t v18 = v17;
        sub_1000237D8(a1);
        CFDictionaryRemoveValue((CFMutableDictionaryRef)qword_100067408, v12);
        CFRelease(*(CFTypeRef *)(v14 + 16));
        free((void *)v14);
        if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_ERROR)) {
          sub_100041DF8();
        }
      }

      else
      {
        unsigned int v21 = *(_DWORD *)(v14 + 48);
        if ((*(_BYTE *)(v14 + 24) & 2) == 0)
        {
          if (CFDictionaryGetValue(*(CFDictionaryRef *)(v14 + 16), @"AsyncClientAssertionId")) {
            int v22 = 13;
          }
          else {
            int v22 = 0;
          }
          sub_10002002C(v22, v14);
        }

        if (dword_1000673DC) {
          notify_post("com.apple.system.powermanagement.assertions.anychange");
        }
        *a3 = *(_DWORD *)(v14 + 52);
        uint64_t v18 = 0LL;
        if (a5) {
          *a5 = *((_DWORD *)&unk_100067A90 + 40 * v21 + 39);
        }
      }
    }
  }

  return v18;
}

void sub_100022B24(_xpc_connection_s *a1, xpc_object_t xdict)
{
  int v11 = 0LL;
  int uint64 = xpc_dictionary_get_uint64(xdict, "assertionRelease");
  xpc_object_t value = xpc_dictionary_get_value(xdict, "assertionActivityLog");
  unsigned int v6 = (const __CFArray *)_CFXPCCreateCFObjectFromXPCObject(value);
  BOOL v7 = xpc_dictionary_get_BOOL(xdict, "assertionWasCoalesced");
  pid_t pid = xpc_connection_get_pid(a1);
  if (v6)
  {
    int v9 = CFDictionaryGetValue((CFDictionaryRef)qword_100067A18, (const void *)pid);
    if (v9)
    {
      sub_10002110C((uint64_t)v9, v6);
    }

    else if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_ERROR))
    {
      sub_100041F78();
    }

    CFRelease(v6);
  }

  if (sub_100022CBC(pid, uint64, (void **)&v11))
  {
    if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_ERROR)) {
      sub_100041F18();
    }
  }

  else
  {
    if (v7) {
      CFTypeID v10 = (const void **)&kCFBooleanTrue;
    }
    else {
      CFTypeID v10 = (const void **)&kCFBooleanFalse;
    }
    CFDictionarySetValue(v11[2], @"IsCoalesced", *v10);
  }

  if (sub_100022D44(pid, uint64, &v12))
  {
    if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_ERROR)) {
      sub_100041EB8();
    }
  }

uint64_t sub_100022CBC(int a1, int a2, void **a3)
{
  uint64_t v3 = 3758097090LL;
  __int128 v4 = (const void *)(a2 & 0xFFFF7FFF);
  xpc_object_t value = 0LL;
  if (v4 >> 11 <= 4
    && CFDictionaryGetValueIfPresent((CFDictionaryRef)qword_100067408, v4, (const void **)&value))
  {
    if (*(_DWORD *)(*((void *)value + 9) + 96LL) == a1)
    {
      uint64_t v3 = 0LL;
      *a3 = value;
    }

    else
    {
      return 3758097122LL;
    }
  }

  return v3;
}

uint64_t sub_100022D44(int a1, int a2, _DWORD *a3)
{
  int v9 = 0LL;
  uint64_t v4 = sub_100022CBC(a1, a2, (void **)&v9);
  if (!(_DWORD)v4)
  {
    BOOL v5 = v9;
    int v6 = v9[15];
    if (v6) {
      v9[15] = --v6;
    }
    if (a3)
    {
      *a3 = v6;
      int v6 = v5[15];
    }

    if (!v6)
    {
      sub_10002E4FC((uint64_t)v5, 1);
      uint64_t v7 = *((void *)v5 + 9);
      if (*(void *)(v7 + 144)) {
        *(void *)(v7 + 144) = 0LL;
      }
      sub_10002E3F4(v5, 2);
      if (dword_1000673DC) {
        notify_post("com.apple.system.powermanagement.assertions.anychange");
      }
    }
  }

  return v4;
}

void sub_100022DEC(_xpc_connection_s *a1, xpc_object_t xdict)
{
  int valuePtr = 0;
  int v13 = -1;
  if (!xpc_dictionary_get_value(xdict, "assertionProperties"))
  {
    int v5 = -536870206;
    if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_ERROR)) {
      sub_100041FD8();
    }
    goto LABEL_21;
  }

  uint64_t v3 = (const void *)_CFXPCCreateCFObjectFromXPCMessage();
  CFTypeID TypeID = CFDictionaryGetTypeID();
  if (!v3 || CFGetTypeID(v3) != TypeID)
  {
    if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_ERROR)) {
      sub_100041BB0();
    }
    int v5 = -536870206;
    if (!v3) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }

  int v5 = -536870206;
  xpc_connection_get_audit_token(a1, v11);
  *(_OWORD *)buf = v11[0];
  __int128 v15 = v11[1];
  if (!sub_10002260C(buf, (const __CFDictionary *)v3))
  {
    int v5 = -536870207;
LABEL_20:
    CFRelease(v3);
LABEL_21:
    pid_t pid = -1;
LABEL_22:
    CFTypeID v10 = (os_log_s *)qword_100067A10;
    if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109632;
      *(_DWORD *)&uint8_t buf[4] = valuePtr;
      *(_WORD *)&uint8_t buf[8] = 1024;
      *(_DWORD *)&buf[10] = v5;
      *(_WORD *)&_BYTE buf[14] = 1024;
      LODWORD(v15) = pid;
      _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "Failed to change properties for assertion id 0x%x (rc:0x%x) for pid %d\n",  buf,  0x14u);
    }

    return;
  }

  Value = CFDictionaryGetValue((CFDictionaryRef)v3, @"AsyncRemoteAssertionId");
  CFTypeID v7 = CFNumberGetTypeID();
  if (!Value || CFGetTypeID(Value) != v7)
  {
    if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_ERROR)) {
      sub_100042004();
    }
    goto LABEL_20;
  }

  CFNumberGetValue((CFNumberRef)Value, kCFNumberIntType, &valuePtr);
  pid_t pid = xpc_connection_get_pid(a1);
  int v5 = sub_100023080(pid, valuePtr, (const __CFDictionary *)v3, &v13);
  int v9 = (os_log_s *)qword_100067A10;
  if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)&uint8_t buf[4] = valuePtr;
    *(_WORD *)&uint8_t buf[8] = 1024;
    *(_DWORD *)&buf[10] = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Updated properties for assertion id 0x%x(rc:0x%x)\n",  buf,  0xEu);
  }

  CFRelease(v3);
  if (v5) {
    goto LABEL_22;
  }
}

uint64_t sub_100023080(int a1, int a2, const __CFDictionary *a3, _DWORD *a4)
{
  unint64_t v36 = 0LL;
  uint64_t v7 = sub_100022CBC(a1, a2, (void **)&v36);
  if (!(_DWORD)v7)
  {
    uint64_t v7 = 3758097122LL;
    Value = (char *)CFDictionaryGetValue((CFDictionaryRef)qword_100067A18, (const void *)a1);
    if (!Value) {
      return 3758097090LL;
    }
    if ((Value[136] & 0x80000000) == 0)
    {
      CFTypeID v10 = v36;
      int v11 = (char *)CFDictionaryGetValue((CFDictionaryRef)qword_100067A18, (const void *)v36[20]);
      if (!v11 || (v11[136] & 0x80000000) == 0)
      {
        *((_DWORD *)v10 + 14) = 0;
        unsigned int v12 = *((_DWORD *)v10 + 12);
        int v13 = *((_DWORD *)v10 + 6);
        CFDictionaryApplyFunction(a3, (CFDictionaryApplierFunction)sub_10002E66C, v10);
        if (a4) {
          *a4 = *((_DWORD *)&unk_100067A90 + 40 * v12 + 39);
        }
        int v14 = *((_DWORD *)v10 + 14);
        if ((v14 & 0x20) != 0)
        {
          sub_10002002C(9, (uint64_t)v10);
          int v14 = *((_DWORD *)v10 + 14);
        }

        int v15 = *((_DWORD *)v10 + 6);
        if ((v14 & 2) != 0)
        {
          if ((v15 & 2) != 0)
          {
            uint64_t v19 = (char *)&unk_100067A90 + 160 * v12;
            if ((v13 & 1) != 0) {
              sub_10002A50C((uint64_t)v10, (uint64_t)v19, 1, 1);
            }
            else {
              sub_10002A144((uint64_t)v10, (uint64_t)v19, 1);
            }
            __int16 v20 = (char *)&unk_100067A90 + 160 * v12;
            uint64_t v23 = *((void *)v20 + 3);
            unsigned int v21 = v20 + 24;
            uint64_t v22 = v23;
            *CFTypeID v10 = v23;
            if (v23) {
              *(void *)(v22 + _Block_object_dispose(va, 8) = v10;
            }
            void *v21 = v10;
            v10[1] = v21;
            *((_DWORD *)v10 + 6) = v10[3] & 0xFFFFFFFC | 2;
            if (*((_DWORD *)v10 + 12) == 5)
            {
              int v24 = *(_DWORD *)(v10[9] + 96LL);
              if (v24 != getpid()) {
                sub_100027678();
              }
            }

            __int16 v25 = (void (*)(char *, uint64_t))*((void *)&unk_100067A90 + 20 * v12 + 16);
            if (v25) {
              v25((char *)&unk_100067A90 + 160 * v12, 1LL);
            }
            int v18 = 7;
          }

          else
          {
            uint64_t v17 = *v10;
            if (*v10) {
              *(void *)(v17 + _Block_object_dispose(va, 8) = v10[1];
            }
            *(void *)v10[1] = v17;
            *((_DWORD *)v10 + 6) = v15 & 0xFFFFFFFD;
            CFDictionaryRemoveValue((CFMutableDictionaryRef)v10[2], @"AssertTimedOutWhen");
            CFDictionaryRemoveValue((CFMutableDictionaryRef)v10[2], @"AssertStartWhen");
            sub_10002EA3C((uint64_t)v10);
            int v18 = 8;
          }

          sub_10002002C(v18, (uint64_t)v10);
        }

        else
        {
          if ((v15 & 2) != 0) {
            return 0LL;
          }
          if ((v14 & 1) != 0)
          {
            CFTypeID v16 = (char *)&unk_100067A90 + 160 * v12;
            if ((v13 & 1) != 0) {
              sub_10002A50C((uint64_t)v10, (uint64_t)v16, 1, 0);
            }
            else {
              sub_10002A144((uint64_t)v10, (uint64_t)v16, 0);
            }
            v10[4] = sub_100039ACC();
            CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
            CFDateRef v27 = CFDateCreate(0LL, Current);
            if (v27)
            {
              CFDateRef v28 = v27;
              CFDictionarySetValue((CFMutableDictionaryRef)v10[2], @"AssertStartWhen", v27);
              CFRelease(v28);
            }

            if (v10[5]) {
              sub_10002A738((uint64_t)v10, (uint64_t)&unk_100067A90 + 160 * v12, 1, 0);
            }
            else {
              sub_10002A0C4(v10, (char *)&unk_100067A90 + 160 * v12, 0LL);
            }
            if (*((_DWORD *)v10 + 12) == 9)
            {
              char v29 = sub_10003603C();
              (*((void (**)(char *, void))&unk_100067A90 + 20 * v12 + 16))( (char *)&unk_100067A90 + 160 * v12,  0LL);
              if ((v29 & 1) == 0) {
                sub_10002002C(8, (uint64_t)v10);
              }
            }

            size_t v30 = (void (*)(char *, uint64_t))*((void *)&unk_100067A90 + 20 * v12 + 16);
            if (v30) {
              v30((char *)&unk_100067A90 + 160 * v12, 2LL);
            }
          }

          if ((v10[7] & 8) != 0)
          {
            __int16 v31 = (void (*)(char *, BOOL))*((void *)&unk_100067A90 + 20 * v12 + 16);
            if (v31)
            {
              BOOL v32 = ((*((_DWORD *)v10 + 6) >> 2) & 1) == 0;
              v31((char *)&unk_100067A90 + 160 * v12, v32);
              sub_100028818(v10, v32);
            }
          }

          if ((v10[7] & 0x10) != 0)
          {
            __int16 v33 = (void (*)(char *, BOOL))*((void *)&unk_100067A90 + 20 * v12 + 16);
            if (v33) {
              v33((char *)&unk_100067A90 + 160 * v12, ((*((_DWORD *)v10 + 6) >> 3) & 1) == 0);
            }
          }

          int v34 = *((_DWORD *)v10 + 14);
          if ((v34 & 0x80) != 0)
          {
            __int16 v35 = (void (*)(char *, uint64_t))*((void *)&unk_100067A90 + 20 * v12 + 16);
            if (v35)
            {
              v35((char *)&unk_100067A90 + 160 * v12, 2LL);
              int v34 = *((_DWORD *)v10 + 14);
            }
          }

          if ((v34 & 0x40) != 0) {
            sub_100027FFC((uint64_t)v10, 2);
          }
        }

        if (dword_1000673DC) {
          notify_post("com.apple.system.powermanagement.assertions.anychange");
        }
        return 0LL;
      }
    }
  }

  return v7;
}

void sub_100023428(uint64_t a1, xpc_object_t xdict)
{
  xpc_object_t value = xpc_dictionary_get_value(xdict, "assertionActivityLog");
  if (value)
  {
    uint64_t v4 = _CFXPCCreateCFObjectFromXPCObject(value);
    if (v4)
    {
      int v5 = (const __CFArray *)v4;
      int v6 = (os_log_s *)qword_100067A10;
      if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_DEBUG)) {
        sub_1000420C4(v5, a1, v6);
      }
      sub_10002110C(a1, v5);
      CFRelease(v5);
    }
  }

  else if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_DEBUG))
  {
    sub_100042064();
  }

void sub_1000234DC(_xpc_connection_s *a1, void *a2)
{
  pid_t pid = xpc_connection_get_pid(a1);
  uint64_t v4 = sub_100023548(pid);
  if (v4)
  {
    sub_100023428((uint64_t)v4, a2);
  }

  else
  {
    int v5 = sub_100023584(pid);
    sub_100023428((uint64_t)v5, a2);
    if (!v5) {
      return;
    }
  }

  sub_1000237D8(pid);
}

_DWORD *sub_100023548(int a1)
{
  BOOL result = CFDictionaryGetValue((CFDictionaryRef)qword_100067A18, (const void *)a1);
  if (result)
  {
    int v2 = result[18];
    if (v2 != -1) {
      result[18] = v2 + 1;
    }
  }

  return result;
}

void *sub_100023584(int a1)
{
  if (!proc_name(a1, buffer, 0x40u))
  {
    if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_ERROR)) {
      sub_100042168();
    }
    return 0LL;
  }

  int v2 = calloc(1uLL, 0x98uLL);
  if (!v2)
  {
    if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_ERROR)) {
      sub_1000421C8();
    }
    return 0LL;
  }

  uint64_t v3 = v2;
  if (!a1) {
    goto LABEL_6;
  }
  uint64_t v4 = sub_100038248();
  int v5 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_proc, a1, 0x80000000uLL, v4);
  *((void *)v3 + 11) = v5;
  if (!v5)
  {
    free(v3);
    if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_ERROR)) {
      sub_1000422A0();
    }
    return 0LL;
  }

  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_10002DB08;
  handler[3] = &unk_100059B40;
  int v14 = a1;
  void handler[4] = 30LL;
  dispatch_source_set_event_handler(v5, handler);
  int v6 = (dispatch_source_s *)*((void *)v3 + 11);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10002DBA0;
  v12[3] = &unk_1000598E8;
  void v12[4] = v3;
  dispatch_source_set_cancel_handler(v6, v12);
  dispatch_resume(*((dispatch_object_t *)v3 + 11));
LABEL_6:
  CFStringRef v7 = CFStringCreateWithCString(0LL, buffer, 0x8000100u);
  *((void *)v3 + 1sub_1000262C4(0x12u, 0) = v7;
  CFTypeID TypeID = CFStringGetTypeID();
  if (!v7 || CFGetTypeID(v7) != TypeID)
  {
    int v9 = (os_log_s *)qword_100067A10;
    if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_ERROR)) {
      sub_100042228((uint64_t)buffer, a1, v9);
    }
  }

  ++*((_DWORD *)v3 + 18);
  int v10 = dword_1000674B0++;
  *((_DWORD *)v3 + 24) = a1;
  *((_DWORD *)v3 + 25) = v10;
  CFDictionarySetValue((CFMutableDictionaryRef)qword_100067A18, (const void *)a1, v3);
  sub_100029D68((const void **)v3);
  return v3;
}

void sub_1000237D8(int a1)
{
  Value = (dispatch_object_s **)CFDictionaryGetValue((CFDictionaryRef)qword_100067A18, (const void *)a1);
  if (Value)
  {
    uint64_t v3 = Value;
    if (*((_DWORD *)Value + 18) == 1)
    {
      uint64_t v4 = Value[11];
      if (v4) {
        dispatch_release(v4);
      }
      int v5 = v3[10];
      if (v5) {
        CFRelease(v5);
      }
      int v6 = v3[13];
      if (v6) {
        CFRelease(v6);
      }
      CFStringRef v7 = v3[14];
      if (v7) {
        CFRelease(v7);
      }
      __int128 v8 = (_xpc_connection_s *)v3[15];
      if (v8)
      {
        int v9 = (os_log_s *)qword_100067A10;
        if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_ERROR))
        {
          v10[0] = 67109120;
          v10[1] = a1;
          _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "Cancelling xpc connection for pid %d",  (uint8_t *)v10,  8u);
          __int128 v8 = (_xpc_connection_s *)v3[15];
        }

        xpc_connection_cancel(v8);
        xpc_release(v3[15]);
        v3[15] = 0LL;
      }

      CFDictionaryRemoveValue((CFMutableDictionaryRef)qword_100067A18, (const void *)a1);
      v3[18] = 0LL;
      *((_OWORD *)v3 + 7) = 0u;
      *((_OWORD *)v3 + _Block_object_dispose(va, 8) = 0u;
      *((_OWORD *)v3 + 5) = 0u;
      *((_OWORD *)v3 + 6) = 0u;
      *((_OWORD *)v3 + 3) = 0u;
      *((_OWORD *)v3 + 4) = 0u;
      *((_OWORD *)v3 + 1) = 0u;
      *((_OWORD *)v3 + 2) = 0u;
      *(_OWORD *)uint64_t v3 = 0u;
      free(v3);
    }

    else
    {
      --*((_DWORD *)Value + 18);
    }
  }

void sub_100023938(_xpc_connection_s *a1)
{
  pid_t pid = xpc_connection_get_pid(a1);
  uint64_t v3 = (os_log_s *)qword_100067A10;
  if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = pid;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Aysnc Assertion: received initial connection from %d",  (uint8_t *)v5,  8u);
  }

  uint64_t v4 = sub_100023548(pid);
  if (v4 || (uint64_t v4 = sub_100023584(pid)) != 0LL)
  {
    v4[15] = xpc_retain(a1);
  }

  else if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_ERROR))
  {
    sub_100042300();
  }

void sub_100023A34(_xpc_connection_s *a1, void *a2)
{
  if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_DEBUG)) {
    sub_100042360();
  }
  xpc_object_t reply = xpc_dictionary_create_reply(a2);
  if (reply)
  {
    int v5 = reply;
    xpc_dictionary_set_BOOL(reply, "assertionFeatureSupported", byte_100067A88);
    xpc_connection_send_message(a1, v5);
    xpc_release(v5);
  }

void sub_100023AC4(_xpc_connection_s *a1, void *a2)
{
  audit_token_t v9 = v10;
  uint64_t v4 = SecTaskCreateWithAuditToken(kCFAllocatorDefault, &v9);
  int v5 = v4;
  if (v4)
  {
    int v6 = (__SecTask *)SecTaskCopyValueForEntitlement(v4, @"com.apple.private.iokit.assertion-suspendresume", 0LL);
    if (v6)
    {
      CFStringRef v7 = v6;
      int uint64 = xpc_dictionary_get_uint64(a2, "pid");
      else {
        sub_100023D04(uint64);
      }
      CFRelease(v5);
      int v5 = v7;
LABEL_11:
      CFRelease(v5);
      return;
    }
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000423C0(a1);
  }
  if (v5) {
    goto LABEL_11;
  }
}

void sub_100023BB8(int a1)
{
  Value = (char *)CFDictionaryGetValue((CFDictionaryRef)qword_100067A18, (const void *)a1);
  if (Value)
  {
    uint64_t v3 = Value;
    if (Value[136] < 0)
    {
      if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_ERROR)) {
        sub_1000424B0();
      }
    }

    else
    {
      for (uint64_t i = 0LL; i != 3200; i += 160LL)
      {
        v6[0] = _NSConcreteStackBlock;
        v6[1] = 3221225472LL;
        v6[2] = sub_10002A8D8;
        v6[3] = &unk_100059F28;
        int v7 = a1;
        sub_100027F30((uint64_t)&byte_100067A90[i], 7u, (uint64_t)v6);
        int v5 = *(void (**)(char *, uint64_t))&byte_100067A90[i + 128];
        if (v5) {
          v5(&byte_100067A90[i], 2LL);
        }
      }

      v3[136] |= 0x80u;
      if (dword_1000673DC) {
        notify_post("com.apple.system.powermanagement.assertions.anychange");
      }
    }
  }

  else if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_ERROR))
  {
    sub_100042450();
  }

void sub_100023D04(int a1)
{
  Value = (char *)CFDictionaryGetValue((CFDictionaryRef)qword_100067A18, (const void *)a1);
  if (Value && (uint64_t v3 = Value, Value[136] < 0))
  {
    for (uint64_t i = 0LL; i != 3200; i += 160LL)
    {
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472LL;
      v6[2] = sub_10002A9DC;
      v6[3] = &unk_100059F28;
      int v7 = a1;
      sub_100027F30((uint64_t)&byte_100067A90[i], 8u, (uint64_t)v6);
      int v5 = *(void (**)(char *, uint64_t))&byte_100067A90[i + 128];
      if (v5) {
        v5(&byte_100067A90[i], 2LL);
      }
    }

    v3[136] &= ~0x80u;
    if (dword_1000673DC) {
      notify_post("com.apple.system.powermanagement.assertions.anychange");
    }
  }

  else if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_ERROR))
  {
    sub_100042510();
  }

void sub_100023E28(_xpc_connection_s *a1)
{
  uint64_t pid = xpc_connection_get_pid(a1);
  if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_DEBUG)) {
    sub_100042570();
  }
  Value = CFDictionaryGetValue((CFDictionaryRef)qword_100067A18, (const void *)(int)pid);
  if (Value)
  {
    if (Value[15]) {
      sub_100023E94(pid);
    }
  }

void sub_100023E94(uint64_t a1)
{
  uint64_t v12 = 0LL;
  int v13 = &v12;
  uint64_t v14 = 0x2810000000LL;
  int v15 = "";
  uint64_t v16 = 0LL;
  Value = CFDictionaryGetValue((CFDictionaryRef)qword_100067A18, (const void *)(int)a1);
  uint64_t v3 = Value;
  if (Value)
  {
    Value[136] |= 0x20u;
    uint64_t v4 = (void *)*((void *)Value + 15);
    if (v4)
    {
      xpc_release(v4);
      *((void *)v3 + 15) = 0LL;
    }
  }

  sub_10002938C(a1, "com.apple.system.powermanagement.assertions.anychange", 2);
  sub_10002938C(a1, "com.apple.system.powermanagement.assertions.timeout", 2);
  sub_10002938C(a1, "com.apple.system.powermanagement.assertions", 2);
  sub_1000296E0(a1, 0);
  for (uint64_t i = 0LL; i != 20; ++i)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    _DWORD v10[2] = sub_10002E5EC;
    v10[3] = &unk_10005A208;
    int v11 = a1;
    v10[4] = &v12;
    sub_100027F30((uint64_t)&unk_100067A90 + 160 * i, 0xFu, (uint64_t)v10);
    int v6 = (void (*)(char *, uint64_t))*((void *)&unk_100067A90 + 20 * i + 16);
    if (v6) {
      v6((char *)&unk_100067A90 + 160 * i, 1LL);
    }
    for (CFIndex j = (uint64_t *)v13[4]; j; CFIndex j = v9)
    {
      entr_act_end(4LL, 1LL, *((unsigned int *)j + 13), 0LL, 0x8000000000000000LL);
      uint64_t v8 = *j;
      if (*j) {
        *(void *)(v8 + _Block_object_dispose(va, 8) = j[1];
      }
      *(void *)j[1] = v8;
      audit_token_t v9 = (uint64_t *)v13[4];
      sub_10002E3F4(j, 3);
    }
  }

  if (dword_1000673DC) {
    notify_post("com.apple.system.powermanagement.assertions.anychange");
  }
  _Block_object_dispose(&v12, 8);
}

void sub_100024078( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
}

void sub_100024098(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 72);
  int valuePtr = 0;
  if (*(void *)(v1 + 120))
  {
    xpc_object_t v3 = xpc_dictionary_create(0LL, 0LL, 0LL);
    if (v3)
    {
      uint64_t v4 = v3;
      Value = (const __CFNumber *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"AsyncClientAssertionId");
      CFTypeID TypeID = CFNumberGetTypeID();
      if (Value && CFGetTypeID(Value) == TypeID)
      {
        CFNumberGetValue(Value, kCFNumberSInt32Type, &valuePtr);
        xpc_dictionary_set_uint64(v4, "assertionTimeout", *(unsigned int *)(a1 + 52));
        int v7 = (os_log_s *)qword_100067A10;
        if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_DEFAULT))
        {
          int v8 = *(_DWORD *)(a1 + 52);
          int v9 = *(_DWORD *)(*(void *)(a1 + 72) + 96LL);
          *(_DWORD *)buf = 67109632;
          int v13 = v8;
          __int16 v14 = 1024;
          int v15 = v9;
          __int16 v16 = 1024;
          int v17 = valuePtr;
          _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Sending assertion timeout message for id 0x%x to %d for 0x%x\n",  buf,  0x14u);
        }

        xpc_connection_send_message(*(xpc_connection_t *)(v1 + 120), v4);
        uint64_t v10 = *(void *)(a1 + 72);
        if (*(void *)(v10 + 144)) {
          *(void *)(v10 + 144) = 0LL;
        }
      }

      else if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_ERROR))
      {
        sub_100042638();
      }

      xpc_release(v4);
    }

    else if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_ERROR))
    {
      sub_1000425D0();
    }
  }

void sub_100024264(uint64_t a1)
{
  if ((*(_BYTE *)(a1 + 136) & 0x20) == 0 && os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_ERROR)) {
    sub_10004269C();
  }
  sub_1000237D8(*(_DWORD *)(a1 + 96));
}

void sub_1000242B8(uint64_t a1, void *a2)
{
  xpc_object_t v4 = xpc_dictionary_create(0LL, 0LL, 0LL);
  int v5 = (os_log_s *)qword_100067A10;
  if (v4)
  {
    int v6 = v4;
    if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = *(_DWORD *)(a1 + 96);
      v10[0] = 67109120;
      v10[1] = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Sending assertion check message to pid %d\n",  (uint8_t *)v10,  8u);
    }

    xpc_dictionary_set_uint64(v6, "assertionCheck", 0LL);
    xpc_dictionary_set_uint64(v6, "assertionCheckToken", qword_100067368);
    int v8 = *(_xpc_connection_s **)(a1 + 120);
    int v9 = sub_100038248();
    xpc_connection_send_message_with_reply(v8, v6, v9, a2);
    xpc_release(v6);
  }

  else if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_ERROR))
  {
    sub_1000426FC();
  }

void sub_1000243F0(void *a1, int a2)
{
  uint64_t uint64 = xpc_dictionary_get_uint64(a1, "assertionCheckToken");
  int v5 = xpc_dictionary_get_uint64(a1, "assertionCheckCount");
  uint64_t v6 = qword_100067368;
  if (uint64 == qword_100067368)
  {
    if (a2)
    {
      int v7 = v5;
      Value = (int *)CFDictionaryGetValue((CFDictionaryRef)qword_100067A18, (const void *)a2);
      if (Value)
      {
        int v9 = Value;
        if (CFSetContainsValue((CFSetRef)qword_100067370, Value))
        {
          dword_100067378 += v7;
          uint64_t v10 = (os_log_s *)qword_100067A10;
          if (v7)
          {
            if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_DEFAULT))
            {
              int v13 = 67109376;
              int v14 = a2;
              __int16 v15 = 1024;
              LODWORD(v16) = v7;
              _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Received active assertion from %d:%d blocking sleep",  (uint8_t *)&v13,  0xEu);
            }
          }

          else if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_DEBUG))
          {
            sub_10004285C();
          }

          CFSetRemoveValue((CFMutableSetRef)qword_100067370, v9);
          sub_1000237D8(v9[24]);
          if (CFSetGetCount((CFSetRef)qword_100067370))
          {
            if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_DEBUG)) {
              sub_1000427FC();
            }
          }

          else
          {
            sub_10003AD88(qword_100067368, dword_100067378 == 0);
            qword_100067368 = 0LL;
            dword_100067378 = 0;
          }
        }

        else
        {
          uint64_t v12 = (os_log_s *)qword_100067A10;
          if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_DEFAULT))
          {
            int v13 = 67109120;
            int v14 = a2;
            _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Reply from pid:%d no longer considered pending. Reply likely came after timeout.\n",  (uint8_t *)&v13,  8u);
          }
        }
      }

      else if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_ERROR))
      {
        sub_100042788();
      }
    }

    else if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_ERROR))
    {
      sub_10004275C();
    }
  }

  else
  {
    int v11 = (os_log_s *)qword_100067A10;
    if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_ERROR))
    {
      int v13 = 67109632;
      int v14 = a2;
      __int16 v15 = 2048;
      uint64_t v16 = uint64;
      __int16 v17 = 2048;
      uint64_t v18 = v6;
      _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "Unexpected assertion check response from pid %d. token: %ld expected: %ld\n",  (uint8_t *)&v13,  0x1Cu);
    }
  }

void sub_1000246B4(intptr_t a1)
{
  int v2 = (os_log_s *)qword_100067A10;
  if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Check for async assertions", buf, 2u);
  }

  CFMutableDataRef Mutable = (const __CFSet *)qword_100067370;
  if (!qword_100067370)
  {
    CFMutableDataRef Mutable = CFSetCreateMutable(0LL, 0LL, 0LL);
    qword_100067370 = (uint64_t)Mutable;
    if (!Mutable)
    {
      if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_ERROR)) {
        sub_1000428BC();
      }
      goto LABEL_9;
    }
  }

  if (qword_100067368 || CFSetGetCount(Mutable))
  {
    if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_ERROR)) {
      sub_100042940();
    }
LABEL_9:
    sub_10003AD88(a1, 1);
    return;
  }

  CFIndex Count = CFDictionaryGetCount((CFDictionaryRef)qword_100067A18);
  int v5 = (const void **)malloc(8 * Count);
  if (!v5)
  {
    if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_ERROR)) {
      sub_1000428E8();
    }
    goto LABEL_9;
  }

  uint64_t v6 = (uint64_t *)v5;
  qword_100067368 = a1;
  dword_100067378 = 0;
  CFDictionaryGetKeysAndValues((CFDictionaryRef)qword_100067A18, 0LL, v5);
  if (Count >= 1)
  {
    int v7 = v6;
    do
    {
      uint64_t v8 = *v7;
      if (!*v7) {
        break;
      }
      if (*(void *)(v8 + 120) && (*(_BYTE *)(v8 + 136) & 0xA0) == 0)
      {
        sub_100023548(*(_DWORD *)(v8 + 96));
        CFSetAddValue((CFMutableSetRef)qword_100067370, (const void *)v8);
        int v9 = *(_DWORD *)(v8 + 96);
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472LL;
        v15[2] = sub_1000249A0;
        v15[3] = &unk_100059D20;
        int v16 = v9;
        sub_1000242B8(v8, v15);
      }

      ++v7;
      --Count;
    }

    while (Count);
  }

  if (!CFSetGetCount((CFSetRef)qword_100067370))
  {
    if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_ERROR)) {
      sub_100042914();
    }
    sub_10003AD88(a1, 1);
    qword_100067368 = 0LL;
    dword_100067378 = 0;
  }

  uint64_t v10 = (dispatch_source_s *)qword_100067380;
  if (!qword_100067380)
  {
    int v11 = sub_100038248();
    qword_100067380 = (uint64_t)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  v11);
    dispatch_source_set_event_handler((dispatch_source_t)qword_100067380, &stru_100059D40);
    dispatch_source_set_cancel_handler((dispatch_source_t)qword_100067380, &stru_100059D60);
    uint64_t v12 = (dispatch_source_s *)qword_100067380;
    dispatch_time_t v13 = dispatch_time(0LL, 5000000000LL);
    dispatch_source_set_timer(v12, v13, 0xFFFFFFFFFFFFFFFFLL, 0LL);
    dispatch_resume((dispatch_object_t)qword_100067380);
    uint64_t v10 = (dispatch_source_s *)qword_100067380;
  }

  dispatch_time_t v14 = dispatch_time(0LL, 5000000000LL);
  dispatch_source_set_timer(v10, v14, 0xFFFFFFFFFFFFFFFFLL, 0LL);
  free(v6);
}

void sub_1000249A0(uint64_t a1, void *a2)
{
}

void sub_1000249B0(id a1)
{
  if (CFSetGetCount((CFSetRef)qword_100067370))
  {
    CFSetApplyFunction((CFSetRef)qword_100067370, (CFSetApplierFunction)sub_100024264, 0LL);
    CFSetRemoveAllValues((CFMutableSetRef)qword_100067370);
    sub_10003AD88(qword_100067368, dword_100067378 == 0);
    qword_100067368 = 0LL;
    dword_100067378 = 0;
  }

void sub_100024A18(id a1)
{
  qword_100067380 = 0LL;
}

void sub_100024A40(uint64_t a1, int a2, void *a3)
{
  xpc_object_t v6 = xpc_dictionary_create(0LL, 0LL, 0LL);
  if (v6)
  {
    int v7 = v6;
    if (a2) {
      uint64_t v8 = "assertionUpdateActives";
    }
    else {
      uint64_t v8 = "assertionUpdateActivity";
    }
    xpc_dictionary_set_uint64(v6, v8, 1uLL);
    xpc_dictionary_set_uint64(v7, "assertionCheckToken", dword_100067388);
    if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_DEBUG)) {
      sub_1000429CC();
    }
    int v9 = *(_xpc_connection_s **)(a1 + 120);
    uint64_t v10 = sub_100038248();
    xpc_connection_send_message_with_reply(v9, v7, v10, a3);
    xpc_release(v7);
  }

  else if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_ERROR))
  {
    sub_10004296C();
  }

void sub_100024B34(void *a1, uint64_t a2, int a3)
{
  if (xpc_get_type(a1) != (xpc_type_t)&_xpc_type_dictionary)
  {
    if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_ERROR)) {
      sub_100042B64();
    }
    return;
  }

  int uint64 = xpc_dictionary_get_uint64(a1, "assertionCheckToken");
  int v7 = dword_100067388;
  if (dword_100067388 == uint64)
  {
    Value = CFDictionaryGetValue((CFDictionaryRef)qword_100067A18, (const void *)(int)a2);
    if (Value)
    {
      int v9 = Value;
      if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_DEBUG))
      {
        sub_100042AA4();
        if (a3) {
          goto LABEL_9;
        }
      }

      else if (a3)
      {
LABEL_9:
        xpc_object_t v10 = xpc_dictionary_get_value(a1, "assertionUpdateActives");
        if (v10)
        {
          uint64_t v11 = _CFXPCCreateCFObjectFromXPCObject(v10);
          if (v11)
          {
            uint64_t v12 = (const void *)v11;
            CFStringRef v13 = CFStringCreateWithFormat(kCFAllocatorDefault, 0LL, @"%d", a2);
            CFDictionarySetValue((CFMutableDictionaryRef)qword_100067390, v13, v12);
            CFRelease(v12);
            CFRelease(v13);
          }
        }

        goto LABEL_21;
      }

      sub_100023428((uint64_t)v9, a1);
LABEL_21:
      if (xpc_dictionary_get_BOOL(a1, "assertionActivityUpdateOverflow")) {
        byte_100067398 = 1;
      }
      CFSetRemoveValue((CFMutableSetRef)qword_1000673A0, v9);
      sub_1000237D8(a2);
      if (!CFSetGetCount((CFSetRef)qword_1000673A0))
      {
        if (a3)
        {
          sub_100021B98((void *)qword_100067390);
          if (qword_100067390) {
            CFRelease((CFTypeRef)qword_100067390);
          }
        }

        else
        {
          sub_100021764(0LL, byte_100067398);
        }

        dword_100067388 = 0;
      }

      return;
    }

    if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_ERROR)) {
      sub_100042A44();
    }
  }

  else
  {
    dispatch_time_t v14 = (os_log_s *)qword_100067A10;
    BOOL v15 = os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_ERROR);
    if (v7)
    {
      if (v15)
      {
        *(_DWORD *)buf = 67109632;
        int v17 = a2;
        __int16 v18 = 1024;
        int v19 = uint64;
        __int16 v20 = 1024;
        int v21 = v7;
        _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "processAssertionActivityUpdateResp: Unexpected response from pid %d. token: %u expected: %u\n",  buf,  0x14u);
      }
    }

    else if (v15)
    {
      sub_100042B04();
    }
  }

BOOL sub_100024DDC()
{
  return dword_100067388 != 0;
}

uint64_t sub_100024DF0()
{
  if (dword_1000673A8 == -1) {
    uint64_t result = 1LL;
  }
  else {
    uint64_t result = (dword_1000673A8 + 1);
  }
  dword_1000673A8 = result;
  return result;
}

void sub_100024E08(int a1)
{
  int v2 = (os_log_s *)qword_100067A10;
  if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v22 = a1;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "Check assertion activity update from clients %d",  buf,  8u);
  }

  byte_100067398 = 0;
  byte_1000673B8 = a1;
  if (a1) {
    qword_100067390 = (uint64_t)CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  }
  int v3 = dword_1000673A8 + 1;
  if (dword_1000673A8 == -1) {
    int v3 = 1;
  }
  dword_1000673A8 = v3;
  dword_100067388 = v3;
  if (!qword_1000673A0)
  {
    qword_1000673A0 = (uint64_t)CFSetCreateMutable(0LL, 0LL, 0LL);
    if (!qword_1000673A0)
    {
      if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_ERROR)) {
        sub_1000428BC();
      }
      goto LABEL_35;
    }
  }

  CFIndex Count = CFDictionaryGetCount((CFDictionaryRef)qword_100067A18);
  int v5 = (const void **)malloc(8 * Count);
  if (!v5)
  {
    if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_DEBUG)) {
      sub_100042BC4();
    }
LABEL_35:
    if (a1) {
      sub_100021B98(0LL);
    }
    else {
      sub_100021764(0LL, 0);
    }
    dword_100067388 = 0;
    return;
  }

  xpc_object_t v6 = (uint64_t *)v5;
  CFDictionaryGetKeysAndValues((CFDictionaryRef)qword_100067A18, 0LL, v5);
  if (Count >= 1)
  {
    int v7 = v6;
    do
    {
      uint64_t v8 = *v7;
      if (!*v7) {
        break;
      }
      if (*(void *)(v8 + 120) && (*(_BYTE *)(v8 + 136) & 0xA0) == 0)
      {
        sub_100023548(*(_DWORD *)(v8 + 96));
        CFSetAddValue((CFMutableSetRef)qword_1000673A0, (const void *)v8);
        int v11 = *(_DWORD *)(v8 + 96);
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472LL;
        v19[2] = sub_10002525C;
        v19[3] = &unk_100059D20;
        int v20 = v11;
        sub_100024A40(v8, byte_1000673B8, v19);
      }

      else
      {
        int v9 = (os_log_s *)qword_100067A10;
        if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_DEBUG))
        {
          int v10 = *(_DWORD *)(v8 + 96);
          *(_DWORD *)buf = 67109120;
          int v22 = v10;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "checkForAsyncAssertionLogging: No remoteConnection for %d",  buf,  8u);
        }
      }

      ++v7;
      --Count;
    }

    while (Count);
  }

  if (CFSetGetCount((CFSetRef)qword_1000673A0))
  {
    if (!qword_1000673B0)
    {
      uint64_t v12 = sub_100038248();
      qword_1000673B0 = (uint64_t)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  v12);
      dispatch_source_set_event_handler((dispatch_source_t)qword_1000673B0, &stru_100059D80);
      dispatch_source_set_cancel_handler((dispatch_source_t)qword_1000673B0, &stru_100059DA0);
      CFStringRef v13 = (os_log_s *)qword_100067A10;
      if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        int v22 = 5;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "checkForAssertionActivityUpdates : setting timer to fire in %d secs",  buf,  8u);
      }

      dispatch_time_t v14 = (dispatch_source_s *)qword_1000673B0;
      dispatch_time_t v15 = dispatch_time(0LL, 5000000000LL);
      dispatch_source_set_timer(v14, v15, 0xFFFFFFFFFFFFFFFFLL, 0LL);
      dispatch_resume((dispatch_object_t)qword_1000673B0);
    }

    int v16 = (os_log_s *)qword_100067A10;
    if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v22 = 5;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "checkForAssertionActivityUpdates : setting timer to fire in %d secs",  buf,  8u);
    }

    int v17 = (dispatch_source_s *)qword_1000673B0;
    dispatch_time_t v18 = dispatch_time(0LL, 5000000000LL);
    dispatch_source_set_timer(v17, v18, 0xFFFFFFFFFFFFFFFFLL, 0LL);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_ERROR)) {
      sub_100042BF0();
    }
    if (a1) {
      sub_100021B98(0LL);
    }
    else {
      sub_100021764(0LL, 0);
    }
    dword_100067388 = 0;
  }

  free(v6);
}

void sub_10002525C(uint64_t a1, void *a2)
{
}

void sub_100025274(id a1)
{
  if (!CFSetGetCount((CFSetRef)qword_1000673A0)) {
    return;
  }
  uint64_t v1 = (os_log_s *)qword_100067A10;
  if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = byte_1000673B8;
    _os_log_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_DEFAULT,  "_sendAssertionActivityUpdate: Timer fired with actives only %d",  (uint8_t *)v8,  8u);
  }

  CFMutableDataRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeArrayCallBacks);
  size_t Count = CFSetGetCount((CFSetRef)qword_1000673A0);
  LODWORD(v4) = Count;
  int v5 = (const void **)calloc(Count, 8uLL);
  CFSetGetValues((CFSetRef)qword_1000673A0, v5);
  if ((int)v4 >= 1)
  {
    uint64_t v4 = v4;
    xpc_object_t v6 = v5;
    do
    {
      int v7 = (const void *)*((void *)*v6 + 10);
      if (v7) {
        CFArrayAppendValue(Mutable, v7);
      }
      ++v6;
      --v4;
    }

    while (v4);
  }

  CFSetApplyFunction((CFSetRef)qword_1000673A0, (CFSetApplierFunction)sub_100024264, 0LL);
  if (byte_1000673B8)
  {
    sub_100021B98((void *)qword_100067390);
    if (qword_100067390) {
      CFRelease((CFTypeRef)qword_100067390);
    }
    if (!v5) {
      goto LABEL_14;
    }
  }

  else
  {
    sub_100021764(Mutable, byte_100067398);
    if (!v5) {
      goto LABEL_14;
    }
  }

  free(v5);
LABEL_14:
  if (Mutable) {
    CFRelease(Mutable);
  }
  dword_100067388 = 0;
  CFSetRemoveAllValues((CFMutableSetRef)qword_1000673A0);
}

void sub_10002541C(id a1)
{
  qword_1000673B0 = 0LL;
}

uint64_t sub_100025444( uint64_t a1, _OWORD *a2, const UInt8 *a3, unsigned int a4, _DWORD *a5, _DWORD *a6, _DWORD *a7, int *a8)
{
  pid_t pidp = -1;
  gid_t rgidp = -1;
  uid_t ruidp = -1;
  uint64_t v24 = 0LL;
  __int128 v15 = a2[1];
  *(_OWORD *)atoken.val = *a2;
  *(_OWORD *)&atoken.val[4] = v15;
  audit_token_to_au32(&atoken, 0LL, 0LL, 0LL, &ruidp, &rgidp, &pidp, 0LL, 0LL);
  *a5 = 0;
  *a6 = 0;
  *a7 = 0;
  vm_size_t v16 = a4;
  int v17 = CFDataCreateWithBytesNoCopy(0LL, a3, a4, kCFAllocatorNull);
  if (v17 && (v18 = v17, CFPropertyListRef v19 = CFPropertyListCreateWithData(0LL, v17, 1uLL, 0LL, 0LL), CFRelease(v18), v19))
  {
    __int128 v20 = a2[1];
    *(_OWORD *)atoken.val = *a2;
    *(_OWORD *)&atoken.val[4] = v20;
    if (sub_10002260C(&atoken, (const __CFDictionary *)v19))
    {
      if (!sub_100022814((const __CFDictionary *)v19) || sub_100038ED4(ruidp) || sub_100039B28(ruidp))
      {
        int v21 = sub_100022860(pidp, v19, a5, &v24, a7);
      }

      else
      {
        int v21 = -536870207;
        if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_ERROR)) {
          sub_100042C7C();
        }
      }
    }

    else
    {
      int v21 = -536870207;
      if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_ERROR)) {
        sub_100042CDC();
      }
    }

    *a8 = v21;
    CFRelease(v19);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_ERROR)) {
      sub_100042C1C();
    }
    *a8 = -536870206;
  }

  vm_deallocate(mach_task_self_, (vm_address_t)a3, v16);
  return 0LL;
}

uint64_t sub_100025654( int a1, _OWORD *a2, int a3, const UInt8 *a4, unsigned int a5, _DWORD *a6, _DWORD *a7, _DWORD *a8, int *a9)
{
  pid_t pidp = -1;
  __int128 v16 = a2[1];
  int v17 = -536870207;
  *(_OWORD *)atoken.val = *a2;
  *(_OWORD *)&atoken.val[4] = v16;
  audit_token_to_au32(&atoken, 0LL, 0LL, 0LL, 0LL, 0LL, &pidp, 0LL, 0LL);
  *a6 = 0;
  *a7 = 0;
  *a8 = 0;
  vm_size_t v18 = a5;
  CFPropertyListRef v19 = CFDataCreateWithBytesNoCopy(0LL, a4, a5, kCFAllocatorNull);
  if (v19
    && (__int128 v20 = v19,
        int v21 = (const __CFDictionary *)CFPropertyListCreateWithData(0LL, v19, 0LL, 0LL, 0LL),
        CFRelease(v20),
        v21))
  {
    __int128 v22 = a2[1];
    *(_OWORD *)atoken.val = *a2;
    *(_OWORD *)&atoken.val[4] = v22;
    if (sub_10002260C(&atoken, v21)) {
      int v17 = sub_100023080(pidp, a3, v21, a8);
    }
    *a9 = v17;
    CFRelease(v21);
  }

  else
  {
    *a9 = -536870206;
  }

  vm_deallocate(mach_task_self_, (vm_address_t)a4, v18);
  return 0LL;
}

uint64_t sub_1000257B4(uint64_t a1, _OWORD *a2, int a3, int a4, int *a5, _DWORD *a6, _DWORD *a7, _DWORD *a8)
{
  pid_t pidp = -1;
  __int128 v14 = a2[1];
  *(_OWORD *)atoken.val = *a2;
  *(_OWORD *)&atoken.val[4] = v14;
  audit_token_to_au32(&atoken, 0LL, 0LL, 0LL, 0LL, 0LL, &pidp, 0LL, 0LL);
  *a6 = 0;
  *a7 = 0;
  *a5 = 0;
  if (a4 == 1)
  {
    *(void *)atoken.val = 0LL;
    int v15 = sub_100022CBC(pidp, a3, (void **)&atoken);
    if (!v15)
    {
      int v16 = *(_DWORD *)(*(void *)atoken.val + 60LL) + 1;
      *(_DWORD *)(*(void *)atoken.val + 6sub_100008A28(0LL, 0LL) = v16;
      *a5 = v16;
      if (dword_1000673DC) {
        notify_post("com.apple.system.powermanagement.assertions.anychange");
      }
    }
  }

  else
  {
    int v15 = sub_100022D44(pidp, a3, a5);
  }

  *a8 = v15;
  return 0LL;
}

uint64_t sub_1000258AC( int a1, _OWORD *a2, int a3, int a4, const UInt8 *address, vm_size_t size, vm_address_t *a7, unsigned int *a8, int *a9)
{
  unsigned int v11 = size;
  pid_t pidp = -1;
  *a8 = 0;
  *a7 = 0LL;
  *a9 = -536870160;
  switch(a4)
  {
    case 1:
      __int128 v14 = a2[1];
      *(_OWORD *)atoken.val = *a2;
      *(_OWORD *)&atoken.val[4] = v14;
      audit_token_to_au32(&atoken, 0LL, 0LL, 0LL, 0LL, 0LL, &pidp, 0LL, 0LL);
      *(void *)atoken.val = 0LL;
      if (sub_100022CBC(pidp, a3, (void **)&atoken))
      {
        CFDictionaryRef v15 = 0LL;
        int v16 = -536870160;
      }

      else
      {
        __int16 v31 = (CFDictionaryRef *)(*(void *)atoken.val + 16LL);
        CFRetain(*(CFTypeRef *)(*(void *)atoken.val + 16LL));
        int v16 = 0;
        CFDictionaryRef v15 = *v31;
      }

      *a9 = v16;
      if (v15) {
        goto LABEL_25;
      }
      goto LABEL_17;
    case 2:
      int v17 = 0;
      goto LABEL_15;
    case 3:
      for (uint64_t i = 0LL; i != 20; ++i)
      {
        LODWORD(valuePtr) = (dword_1000673E4 >> i) & 1;
        *(void *)&atoken.val[2 * i] = CFNumberCreate(0LL, kCFNumberIntType, &valuePtr);
      }

      CFDictionaryRef v15 = CFDictionaryCreate( 0LL,  (const void **)qword_100067410,  (const void **)&atoken,  20LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
      for (uint64_t j = 0LL; j != 40; j += 2LL)
        CFRelease(*(CFTypeRef *)&atoken.val[j]);
      goto LABEL_24;
    case 4:
      __int128 v20 = sub_100014BB0();
      goto LABEL_16;
    case 5:
      __int128 v20 = sub_100013260();
      goto LABEL_16;
    case 6:
      int v21 = CFDataCreateWithBytesNoCopy(0LL, address, size, kCFAllocatorNull);
      if (v21)
      {
        __int128 v22 = v21;
        CFPropertyListRef v23 = CFPropertyListCreateWithData(0LL, v21, 0LL, 0LL, 0LL);
        CFRelease(v22);
      }

      else
      {
        CFPropertyListRef v23 = 0LL;
      }

      uint64_t valuePtr = 0LL;
      p_uint64_t valuePtr = &valuePtr;
      uint64_t v35 = 0x2020000000LL;
      uint64_t v36 = 0LL;
      int v25 = sub_100025F14(v23);
      if (v25 == -1)
      {
        CFDictionaryRef v15 = 0LL;
      }

      else
      {
        *(void *)atoken.val = _NSConcreteStackBlock;
        *(void *)&atoken.val[2] = 3221225472LL;
        *(void *)&atoken.val[4] = sub_10002F008;
        *(void *)&atoken.val[6] = &unk_100059DE8;
        CFTypeID v38 = &valuePtr;
        sub_100027F30((uint64_t)&byte_100067A90[160 * v25], 3u, (uint64_t)&atoken);
        CFDictionaryRef v15 = (CFDictionaryRef)p_valuePtr[3];
      }

      _Block_object_dispose(&valuePtr, 8);
      if (v23) {
        CFRelease(v23);
      }
LABEL_24:
      if (v15) {
        goto LABEL_25;
      }
      goto LABEL_17;
    case 7:
      int v17 = 1;
LABEL_15:
      __int128 v20 = sub_100025C68(v17);
LABEL_16:
      CFDictionaryRef v15 = v20;
      if (!v20) {
        goto LABEL_17;
      }
LABEL_25:
      CFDataRef Data = CFPropertyListCreateData(0LL, v15, kCFPropertyListBinaryFormat_v1_0, 0LL, 0LL);
      CFRelease(v15);
      if (Data)
      {
        unsigned int Length = CFDataGetLength(Data);
        *a8 = Length;
        vm_allocate(mach_task_self_, a7, Length, 1);
        CFDateRef v28 = (void *)*a7;
        BytePtr = CFDataGetBytePtr(Data);
        memcpy(v28, BytePtr, *a8);
        CFRelease(Data);
        int v24 = 0;
      }

      else
      {
        int v24 = -536870199;
      }

      break;
    default:
LABEL_17:
      int v24 = 0;
      *a8 = 0;
      *a7 = 0LL;
      break;
  }

  *a9 = v24;
  if (address && v11) {
    vm_deallocate(mach_task_self_, (vm_address_t)address, v11);
  }
  return 0LL;
}

void sub_100025C48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
}

__CFArray *sub_100025C68(int a1)
{
  CFMutableDataRef Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  for (uint64_t i = 0LL; i != 3200; i += 160LL)
  {
    if (i != 960)
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472LL;
      _OWORD v11[2] = sub_10002F090;
      v11[3] = &unk_10005A228;
      int v12 = a1;
      void v11[4] = Mutable;
      sub_100027F30((uint64_t)&byte_100067A90[i], 0xFu, (uint64_t)v11);
    }
  }

  CFIndex Count = CFDictionaryGetCount(Mutable);
  int v5 = (const void **)malloc(8 * Count);
  if (!v5)
  {
    int v7 = 0LL;
    if (!Mutable) {
      return v7;
    }
    goto LABEL_10;
  }

  xpc_object_t v6 = v5;
  CFDictionaryGetKeysAndValues(Mutable, 0LL, v5);
  int v7 = CFArrayCreateMutable(0LL, 0LL, &kCFTypeArrayCallBacks);
  if (Count >= 1)
  {
    uint64_t v8 = v6;
    do
    {
      int v9 = *v8++;
      CFArrayAppendValue(v7, v9);
      --Count;
    }

    while (Count);
  }

  free(v6);
  if (Mutable) {
LABEL_10:
  }
    CFRelease(Mutable);
  return v7;
}

uint64_t sub_100025DC0(uint64_t a1, _OWORD *a2, const char *a3, int a4, _DWORD *a5)
{
  *a5 = -536870212;
  __int128 v8 = a2[1];
  *(_OWORD *)atoken.val = *a2;
  *(_OWORD *)&atoken.val[4] = v8;
  audit_token_to_au32(&atoken, 0LL, &euidp, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  if (euidp)
  {
    *a5 = -536870207;
    return 0LL;
  }

  if (!a3 || !*a3)
  {
    CFStringGetTypeID();
    return 0LL;
  }

  CFStringRef v9 = CFStringCreateWithCString(0LL, a3, 0x8000100u);
  CFTypeID TypeID = CFStringGetTypeID();
  if (v9)
  {
    if (CFGetTypeID(v9) == TypeID)
    {
      unsigned int v11 = sub_100025F14(v9);
      if ((v11 & 0x80000000) == 0)
      {
        *a5 = 0;
        if (a4 == 2)
        {
          int v12 = &byte_100067A90[160 * v11];
          int v15 = *((_DWORD *)v12 + 34);
          CFStringRef v13 = v12 + 136;
          int v14 = v15;
          if (v15) {
            *CFStringRef v13 = v14 - 1;
          }
          goto LABEL_15;
        }

        if (a4 == 1)
        {
          ++*(_DWORD *)&byte_100067A90[160 * v11 + 136];
LABEL_15:
          sub_1000262C4(v11, 0);
          goto LABEL_16;
        }
      }

      *a5 = -536870206;
    }

uint64_t sub_100025F14(const void *a1)
{
  uint64_t v2 = 0xFFFFFFFFLL;
  unsigned int valuePtr = -1;
  CFTypeID TypeID = CFStringGetTypeID();
  if (a1)
  {
    if (CFGetTypeID(a1) == TypeID)
    {
      Value = CFDictionaryGetValue((CFDictionaryRef)qword_1000673F0, a1);
      CFTypeID v5 = CFNumberGetTypeID();
      if (!Value) {
        return 0xFFFFFFFFLL;
      }
      if (CFGetTypeID(Value) != v5) {
        return 0xFFFFFFFFLL;
      }
      CFNumberGetValue((CFNumberRef)Value, kCFNumberIntType, &valuePtr);
      uint64_t v2 = valuePtr;
      if (valuePtr >= 0x14) {
        return 0xFFFFFFFFLL;
      }
    }
  }

  return v2;
}

void sub_100025FB8(unsigned int a1)
{
}

void sub_100025FDC(unsigned int a1)
{
  uint64_t v1 = (char *)&unk_100067A90 + 160 * a1;
  int v4 = *((_DWORD *)v1 + 34);
  uint64_t v2 = v1 + 136;
  int v3 = v4;
  if (v4) {
    *uint64_t v2 = v3 - 1;
  }
  sub_1000262C4(a1, 0);
}

uint64_t sub_100026004()
{
  return dword_1000673BC;
}

void sub_100026010()
{
  uint64_t input = 1LL;
  int v0 = dword_1000673BC;
  if (dword_1000673BC)
  {
LABEL_6:
    dword_1000673BC = v0 | 0x100;
    return;
  }

  mach_port_t v1 = sub_10001E634();
  uint64_t v2 = (os_log_s *)qword_100067A10;
  if (v1)
  {
    mach_port_t v3 = v1;
    if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v6 = 1LL;
      _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "Setting ClamshellSleepState to %lld\n",  buf,  0xCu);
    }

    IOConnectCallMethod(v3, 0xCu, &input, 1u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
    int v0 = dword_1000673BC;
    goto LABEL_6;
  }

  if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_ERROR)) {
    sub_100042D3C();
  }
}

void sub_100026124()
{
  unint64_t v0 = sub_100039ACC();
  nullsub_4(1LL, v1);
  if (v0 - qword_1000673C0 > 0x1D || (sub_10003AE20() & 1) != 0 || !sub_10003603C())
  {
    if ((sub_10003AE20() & 1) == 0 && (sub_10003603C() & 1) == 0)
    {
      if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_DEBUG)) {
        sub_100042E20();
      }
      sub_100036660(1);
    }

    mach_port_t v3 = sub_10001E634();
    if (v3)
    {
      if (IOConnectCallMethod(v3, 0xAu, 0LL, 0, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL))
      {
        if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_ERROR)) {
          sub_100042DC0();
        }
      }

      else
      {
        if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_DEBUG)) {
          sub_100042D94();
        }
        qword_1000673C0 = v0;
      }
    }

    else if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_ERROR))
    {
      sub_100042D68();
    }
  }

  else
  {
    uint64_t v2 = (os_log_s *)qword_100067A10;
    if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_DEBUG)) {
      sub_100042E4C(v0, v2);
    }
  }

void sub_100026284()
{
  unsigned int v0 = sub_100030CD4(@"DarkWakeBackgroundTasks");
  if (dword_100066D9C != v0)
  {
    dword_100066D9C = v0;
    sub_1000262C4(0xBu, 0);
  }

void sub_1000262C4(unsigned int a1, int a2)
{
  unsigned int valuePtr = a1;
  if (qword_1000673F0)
  {
    int v4 = (int *)((char *)&unk_100067A90 + 160 * a1);
    if ((a2 & 1) != 0)
    {
      int v5 = 0;
      uint64_t v6 = 0LL;
      int v7 = 0;
    }

    else
    {
      __int128 v8 = (char *)&unk_100067A90 + 160 * a1;
      uint64_t v6 = (void (*)(int *, uint64_t))*((void *)v8 + 16);
      int v5 = *v4;
      int v7 = *((_DWORD *)v8 + 26);
    }

    *((_DWORD *)&unk_100067A90 + 40 * a1 + 1sub_1000262C4(0x12u, 0) = a1;
    switch(a1)
    {
      case 0u:
        CFNumberRef v9 = CFNumberCreate(0LL, kCFNumberIntType, &valuePtr);
        CFDictionarySetValue((CFMutableDictionaryRef)qword_1000673F0, @"CPUBoundAssertion", v9);
        int v10 = (char *)&unk_100067A90 + 160 * a1;
        *((void *)v10 + 16) = sub_10002BB68;
        *((_DWORD *)v10 + 39) = 0;
        int v11 = 8;
        goto LABEL_53;
      case 1u:
        CFNumberRef v9 = CFNumberCreate(0LL, kCFNumberIntType, &valuePtr);
        CFDictionarySetValue((CFMutableDictionaryRef)qword_1000673F0, @"PreventUserIdleSystemSleep", v9);
        CFDictionarySetValue((CFMutableDictionaryRef)qword_1000673F0, @"NoIdleSleepAssertion", v9);
        int v12 = (char *)&unk_100067A90 + 160 * a1;
        *((void *)v12 + 16) = sub_10002BB68;
        *((_DWORD *)v12 + 39) = 0x10000;
        int v13 = *v4 | 8;
        goto LABEL_25;
      case 2u:
        int v11 = 9;
        CFNumberRef v9 = CFNumberCreate(0LL, kCFNumberIntType, &valuePtr);
        CFDictionarySetValue((CFMutableDictionaryRef)qword_1000673F0, @"DisableInflow", v9);
        int v14 = (char *)&unk_100067A90 + 160 * a1;
        int v15 = sub_10002AEEC;
        goto LABEL_41;
      case 3u:
        CFNumberRef v9 = CFNumberCreate(0LL, kCFNumberIntType, &valuePtr);
        CFDictionarySetValue((CFMutableDictionaryRef)qword_1000673F0, @"ChargeInhibit", v9);
        int v16 = (char *)&unk_100067A90 + 160 * a1;
        *((void *)v16 + 16) = sub_10002AEEC;
        *((_DWORD *)v16 + 39) = 0;
        int v11 = 10;
        goto LABEL_53;
      case 4u:
        CFNumberRef v9 = CFNumberCreate(0LL, kCFNumberIntType, &valuePtr);
        CFDictionarySetValue((CFMutableDictionaryRef)qword_1000673F0, @"DisableLowPowerBatteryWarnings", v9);
        int v17 = (char *)&unk_100067A90 + 160 * a1;
        *((void *)v17 + 16) = sub_10002AEEC;
        *((_DWORD *)v17 + 39) = 0;
        int v11 = 11;
        goto LABEL_53;
      case 5u:
        CFNumberRef v9 = CFNumberCreate(0LL, kCFNumberIntType, &valuePtr);
        CFDictionarySetValue((CFMutableDictionaryRef)qword_1000673F0, @"PreventUserIdleDisplaySleep", v9);
        CFDictionarySetValue((CFMutableDictionaryRef)qword_1000673F0, @"NoDisplaySleepAssertion", v9);
        int v11 = 0;
        vm_size_t v18 = (char *)&unk_100067A90 + 160 * a1;
        *((void *)v18 + 16) = sub_10002B0B0;
        *((_DWORD *)v18 + 39) = 0x20000;
        *v4 |= 0x28u;
        goto LABEL_53;
      case 6u:
        CFNumberRef v9 = CFNumberCreate(0LL, kCFNumberIntType, &valuePtr);
        CFDictionarySetValue((CFMutableDictionaryRef)qword_1000673F0, @"EnableIdleSleep", v9);
        CFPropertyListRef v19 = (char *)&unk_100067A90 + 160 * a1;
        *((void *)v19 + 16) = sub_10002BCEC;
        *((_DWORD *)v19 + 39) = 0;
        int v11 = 7;
        goto LABEL_53;
      case 7u:
        CFNumberRef v9 = CFNumberCreate(0LL, kCFNumberIntType, &valuePtr);
        CFDictionarySetValue((CFMutableDictionaryRef)qword_1000673F0, @"PreventSystemSleep", v9);
        __int128 v20 = (__CFDictionary *)qword_1000673F0;
        int v21 = @"DenySystemSleep";
        goto LABEL_27;
      case 8u:
        CFNumberRef v9 = CFNumberCreate(0LL, kCFNumberIntType, &valuePtr);
        CFDictionarySetValue((CFMutableDictionaryRef)qword_1000673F0, @"ExternalMedia", v9);
        CFDictionarySetValue((CFMutableDictionaryRef)qword_1000673F0, @"PreventStandby", v9);
        __int128 v22 = (char *)&unk_100067A90 + 160 * a1;
        *((void *)v22 + 16) = sub_10002B0B0;
        *((_DWORD *)v22 + 39) = 0;
        *v4 |= 0x20u;
        int v11 = 4;
        goto LABEL_53;
      case 9u:
        CFNumberRef v9 = CFNumberCreate(0LL, kCFNumberIntType, &valuePtr);
        CFDictionarySetValue((CFMutableDictionaryRef)qword_1000673F0, @"UserIsActive", v9);
        CFPropertyListRef v23 = (char *)&unk_100067A90 + 160 * a1;
        *((void *)v23 + 16) = sub_10002B0B0;
        *((_DWORD *)v23 + 39) = 131074;
        *v4 |= 0x28u;
        int v11 = 3;
        goto LABEL_53;
      case 0xAu:
        if (sub_10001D500() && (sub_1000144BC() & 1) != 0)
        {
          p_unsigned int valuePtr = (int *)&valuePtr;
        }

        else
        {
          int v63 = 11;
          p_unsigned int valuePtr = &v63;
        }

        CFNumberRef v9 = CFNumberCreate(0LL, kCFNumberIntType, p_valuePtr);
        CFDictionarySetValue((CFMutableDictionaryRef)qword_1000673F0, @"ApplePushServiceTask", v9);
        int v11 = 0;
        *v4 |= 0xAu;
        int v14 = (char *)&unk_100067A90 + 160 * a1;
        int v15 = sub_10002B0B0;
LABEL_41:
        *((void *)v14 + 16) = v15;
        goto LABEL_52;
      case 0xBu:
        CFNumberRef v9 = CFNumberCreate(0LL, kCFNumberIntType, &valuePtr);
        CFDictionarySetValue((CFMutableDictionaryRef)qword_1000673F0, @"BackgroundTask", v9);
        *v4 |= 9u;
        unsigned int v25 = sub_100031798();
        int v26 = (void (**)(uint64_t, int))((char *)&unk_100067A90 + 160 * a1 + 128);
        if (v25)
        {
          *int v26 = sub_10002B0B0;
          char v27 = sub_10001D4A4();
          if ((v27 & 1) != 0)
          {
            if (byte_1000673ED)
            {
              CFDateRef v28 = (char *)&unk_100067A90 + 160 * a1;
              int v31 = *((_DWORD *)v28 + 34);
              char v29 = v28 + 136;
              int v30 = v31;
              if (v31) {
                _DWORD *v29 = v30 - 1;
              }
              goto LABEL_49;
            }
          }

          else if ((byte_1000673ED & 1) == 0)
          {
            ++*((_DWORD *)&unk_100067A90 + 40 * a1 + 34);
LABEL_49:
            byte_1000673ED = v27 ^ 1;
          }

          *v4 &= ~0x20u;
          goto LABEL_51;
        }

        *int v26 = sub_10002BB68;
        if (byte_1000673ED == 1)
        {
          int v41 = (char *)&unk_100067A90 + 160 * a1;
          int v44 = *((_DWORD *)v41 + 34);
          pid_t v42 = v41 + 136;
          int v43 = v44;
          if (v44) {
            _DWORD *v42 = v43 - 1;
          }
        }

LABEL_51:
        int v11 = 0;
        int v14 = (char *)&unk_100067A90 + 160 * a1;
LABEL_52:
        *((_DWORD *)v14 + 39) = 0;
LABEL_53:
        if (v9) {
          CFRelease(v9);
        }
        if (*((_DWORD *)&unk_100067A90 + 40 * a1 + 34)) {
          unsigned int v45 = 0;
        }
        else {
          unsigned int v45 = v11;
        }
        if (a2)
        {
          pid_t v46 = (char *)&unk_100067A90 + 160 * a1;
          BOOL v47 = (int **)((char *)&unk_100068738 + 16 * v45);
          int v48 = *v47;
          *((void *)v46 + 14) = *v47;
          CFTypeID v49 = v46 + 112;
          *((_DWORD *)v49 - 2) = v45;
          if (v48) {
            *((void *)v48 + 15) = v49;
          }
          void *v47 = v4;
          *((void *)&unk_100067A90 + 20 * a1 + 15) = v47;
        }

        else
        {
          CFTypeID v50 = (char *)&unk_100067A90 + 160 * a1;
          pid_t v52 = (void (*)(int *, uint64_t))*((void *)v50 + 16);
          __int16 v51 = (void (**)(int *, uint64_t))(v50 + 128);
          int v53 = *v4;
          if (v6 == v52 && v7 == v45)
          {
            if (v6 && v5 != v53) {
              v6(v4, 2LL);
            }
          }

          else
          {
            CFNumberRef v54 = (char *)&unk_100067A90 + 160 * a1;
            uint64_t v57 = *((void *)v54 + 14);
            CFStringRef v56 = (int **)(v54 + 112);
            uint64_t v55 = v57;
            if (v57) {
              *(void *)(v55 + 12sub_1000262C4(0x12u, 0) = *((void *)&unk_100067A90 + 20 * a1 + 15);
            }
            CFNumberRef v58 = (char *)&unk_100067A90 + 160 * a1;
            CFStringRef v60 = (void *)*((void *)v58 + 15);
            CFStringRef v59 = (int ***)(v58 + 120);
            *CFStringRef v60 = v55;
            v6(v4, 2LL);
            *int v4 = v53;
            if (dword_100067A30 && v7 != v45) {
              sub_100027F30((uint64_t)v4, 3u, (uint64_t)&stru_100059F68);
            }
            *((_DWORD *)&unk_100067A90 + 40 * a1 + 26) = v45;
            double v61 = (int **)((char *)&unk_100068738 + 16 * v45);
            BOOL v62 = *v61;
            *CFStringRef v56 = *v61;
            if (v62) {
              *((void *)v62 + 15) = v56;
            }
            const void *v61 = v4;
            *CFStringRef v59 = v61;
            if (v45) {
              (*v51)(v4, 2LL);
            }
            if (dword_100067A30 && v7 != v45) {
              sub_100027F30((uint64_t)v4, 3u, (uint64_t)&stru_100059F88);
            }
          }
        }

        break;
      case 0xCu:
        CFNumberRef v9 = CFNumberCreate(0LL, kCFNumberIntType, &valuePtr);
        CFDictionarySetValue((CFMutableDictionaryRef)qword_1000673F0, @"SystemIsActive", v9);
        BOOL v32 = (char *)&unk_100067A90 + 160 * a1;
        *((void *)v32 + 16) = sub_10002BB68;
        *((_DWORD *)v32 + 39) = 0x10000;
        int v13 = *v4 | 0x28;
LABEL_25:
        *int v4 = v13;
        int v11 = 1;
        goto LABEL_53;
      case 0xDu:
        CFNumberRef v9 = CFNumberCreate(0LL, kCFNumberIntType, &valuePtr);
        CFDictionarySetValue((CFMutableDictionaryRef)qword_1000673F0, @"InternalPreventSleep", v9);
        __int128 v20 = (__CFDictionary *)qword_1000673F0;
        int v21 = @"MaintenanceWake";
LABEL_27:
        CFDictionarySetValue(v20, v21, v9);
        int v11 = 0;
        *v4 |= 0x29u;
        __int16 v33 = (char *)&unk_100067A90 + 160 * a1;
        *((void *)v33 + 16) = sub_10002B0B0;
        int v34 = 65537;
        goto LABEL_31;
      case 0xEu:
        int v63 = 5;
        CFNumberRef v9 = CFNumberCreate(0LL, kCFNumberIntType, &v63);
        goto LABEL_51;
      case 0xFu:
        CFNumberRef v9 = CFNumberCreate(0LL, kCFNumberIntType, &valuePtr);
        CFDictionarySetValue((CFMutableDictionaryRef)qword_1000673F0, @"PreventDiskIdle", v9);
        uint64_t v35 = (char *)&unk_100067A90 + 160 * a1;
        *((void *)v35 + 16) = sub_10002BB68;
        *((_DWORD *)v35 + 39) = 0;
        int v11 = 5;
        goto LABEL_53;
      case 0x10u:
        CFNumberRef v9 = CFNumberCreate(0LL, kCFNumberIntType, &valuePtr);
        CFDictionarySetValue((CFMutableDictionaryRef)qword_1000673F0, @"InternalPreventDisplaySleep", v9);
        CFDictionarySetValue((CFMutableDictionaryRef)qword_1000673F0, @"RequiresDisplayAudio", v9);
        int v11 = 0;
        __int16 v33 = (char *)&unk_100067A90 + 160 * a1;
        *((void *)v33 + 16) = sub_10002B0B0;
        *v4 |= 0x20u;
        int v34 = 0x20000;
LABEL_31:
        *((_DWORD *)v33 + 39) = v34;
        goto LABEL_53;
      case 0x11u:
        CFNumberRef v9 = CFNumberCreate(0LL, kCFNumberIntType, &valuePtr);
        CFDictionarySetValue((CFMutableDictionaryRef)qword_1000673F0, @"NetworkClientActive", v9);
        *v4 |= 0x28u;
        uint64_t v36 = (char *)&unk_100067A90 + 160 * a1;
        *((_DWORD *)v36 + 39) = 65537;
        int v37 = sub_100019CD0();
        int v11 = 0;
        CFTypeID v38 = sub_10002BB68;
        if (v37 == 1) {
          CFTypeID v38 = sub_10002B0B0;
        }
        *((void *)v36 + 16) = v38;
        *((_DWORD *)v36 + 39) = 0;
        goto LABEL_53;
      case 0x12u:
        else {
          int v39 = 11;
        }
        int v63 = v39;
        CFNumberRef v9 = CFNumberCreate(0LL, kCFNumberIntType, &v63);
        CFDictionarySetValue((CFMutableDictionaryRef)qword_1000673F0, @"InteractivePushServiceTask", v9);
        int v11 = 0;
        int v14 = (char *)&unk_100067A90 + 160 * a1;
        *((void *)v14 + _Block_object_dispose(va, 8) = @"com.apple.private.iokit.interactive-push";
        goto LABEL_52;
      case 0x13u:
        CFNumberRef v9 = CFNumberCreate(0LL, kCFNumberIntType, &valuePtr);
        CFDictionarySetValue((CFMutableDictionaryRef)qword_1000673F0, @"AwakeOnReservePower", v9);
        *v4 |= 8u;
        unsigned int v40 = (char *)&unk_100067A90 + 160 * a1;
        *((void *)v40 + 16) = sub_10002BB68;
        *((void *)v40 + _Block_object_dispose(va, 8) = @"com.apple.private.iokit.reservepower-control";
        int v11 = 1;
        *((_DWORD *)v40 + 39) = 1;
        goto LABEL_53;
      default:
        return;
    }
  }

void sub_100026C5C()
{
  else {
    BOOL v0 = v3 < 1;
  }
  if (!v0)
  {
    uint64_t v1 = sub_100026D08( @"PreventSystemSleep",  @"com.apple.powermanagement.fmmdwipe",  0LL,  @"Proxy Assertion during FMMD system wipe",  0LL,  @"TimeoutActionRelease",  120.0);
    if (v1)
    {
      uint64_t v2 = v1;
      CFDictionarySetValue(v1, @"AppliesToLimitedPower", kCFBooleanTrue);
      sub_100027018(v2, 0LL, 0);
      CFRelease(v2);
    }
  }

__CFDictionary *sub_100026D08( const void *a1, const void *a2, const void *a3, const void *a4, const void *a5, const void *a6, double a7)
{
  int v7 = 0LL;
  double v20 = a7;
  if (a1)
  {
    if (a2)
    {
      CFMutableDataRef Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      int v7 = Mutable;
      if (Mutable)
      {
        CFDictionarySetValue(Mutable, @"AssertName", a2);
        int valuePtr = 255;
        CFNumberRef v16 = CFNumberCreate(0LL, kCFNumberIntType, &valuePtr);
        CFDictionarySetValue(v7, @"AssertLevel", v16);
        CFRelease(v16);
        CFDictionarySetValue(v7, @"AssertType", a1);
        if (a3) {
          CFDictionarySetValue(v7, @"Details", a3);
        }
        if (a4) {
          CFDictionarySetValue(v7, @"HumanReadableReason", a4);
        }
        if (a5) {
          CFDictionarySetValue(v7, @"BundlePath", a5);
        }
        if (a7 != 0.0)
        {
          CFNumberRef v17 = CFNumberCreate(0LL, kCFNumberDoubleType, &v20);
          CFDictionarySetValue(v7, @"TimeoutSeconds", v17);
          CFRelease(v17);
        }

        if (a6) {
          CFDictionarySetValue(v7, @"TimeoutAction", a6);
        }
      }
    }
  }

  return v7;
}

uint64_t sub_100026E94(const void *a1, uint64_t a2)
{
  return sub_100027018(a1, a2, 0);
}

uint64_t sub_100026E9C()
{
  if (dword_1000673C8) {
    return notify_post("com.apple.system.powermanagement.assertions");
  }
  return result;
}

uint64_t sub_100026EB8(const void *a1, int *a2)
{
  CFNumberRef v16 = 0LL;
  uint64_t v2 = 3758097090LL;
  if (a1 && a2)
  {
    int v4 = sub_100026D08(@"UserIsActive", a1, 0LL, 0LL, 0LL, @"TimeoutActionRelease", 0.0);
    if (v4)
    {
      int v5 = v4;
      double valuePtr = (double)(60 * dword_100067A20);
      CFNumberRef v6 = CFNumberCreate(0LL, kCFNumberDoubleType, &valuePtr);
      if (v6)
      {
        CFNumberRef v7 = v6;
        CFDictionarySetValue(v5, @"TimeoutSeconds", v6);
        CFRelease(v7);
      }

      pid_t v8 = getpid();
      if (!sub_100022CBC(v8, *a2, (void **)&v16) && (CFNumberRef v9 = v16) != 0LL && *((_DWORD *)v16 + 12) == 9)
      {
        int v14 = 255;
        CFNumberRef v10 = CFNumberCreate(0LL, kCFNumberIntType, &v14);
        CFDictionarySetValue(v9[2], @"AssertLevel", v10);
        CFRelease(v10);
        pid_t v11 = getpid();
        uint64_t v12 = sub_100023080(v11, *a2, v5, 0LL);
      }

      else
      {
        *a2 = 0;
        uint64_t v12 = sub_100027018(v5, (uint64_t)a2, 16);
      }

      uint64_t v2 = v12;
      CFRelease(v5);
    }

    else
    {
      return 0LL;
    }
  }

  return v2;
}

uint64_t sub_100027018(const void *a1, uint64_t a2, int a3)
{
  if (!a1) {
    return 3758097090LL;
  }
  CFRetain(a1);
  CFNumberRef v6 = sub_100038248();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002DA1C;
  block[3] = &unk_10005A070;
  void block[4] = a2;
  void block[5] = a1;
  int v9 = a3;
  dispatch_async(v6, block);
  return 0LL;
}

void sub_1000270A4(uint64_t a1)
{
  uint64_t v2 = sub_100038248();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100027104;
  block[3] = &unk_1000598E8;
  void block[4] = a1;
  dispatch_async(v2, block);
}

uint64_t sub_100027104(uint64_t result)
{
  uint64_t v1 = *(_DWORD **)(result + 32);
  if (*v1)
  {
    uint64_t v2 = result;
    pid_t v3 = getpid();
    uint64_t result = sub_100022D44(v3, **(_DWORD **)(v2 + 32), 0LL);
    uint64_t v1 = *(_DWORD **)(v2 + 32);
  }

  *uint64_t v1 = 0;
  return result;
}

void sub_100027148()
{
  BOOL v0 = sub_100038248();
  dispatch_async(v0, &stru_100059DC0);
}

void sub_100027164(id a1)
{
  int v1 = sub_100019CD0();
  if (v1 == dword_100066DA0) {
    return;
  }
  int v2 = v1;
  uint64_t v3 = 0LL;
  dword_100066DA0 = v1;
  do
  {
    int v4 = *(void (**)(void))((char *)&unk_100067A90 + v3 + 128);
    if (v4) {
      v4();
    }
    v3 += 160LL;
  }

  while (v3 != 3200);
  sub_1000262C4(0xBu, 0);
  sub_1000262C4(0x11u, 0);
  sub_1000262C4(0x12u, 0);
  sub_10002B880();
  nullsub_4(v5, v6);
  for (uint64_t i = 0LL; i != 3200; i += 160LL)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    _OWORD v11[2] = sub_10002F1F4;
    v11[3] = &unk_10005A228;
    int v12 = v2;
    void v11[4] = (char *)&unk_100067A90 + i;
    sub_100027F30((uint64_t)&unk_100067A90 + i, 3u, (uint64_t)v11);
  }

  pid_t v8 = (dispatch_source_s *)qword_100067A40;
  if (qword_100067A40)
  {
    if (v2)
    {
      if (qword_100067A48)
      {
        CFRelease((CFTypeRef)qword_100067A48);
        qword_100067A48 = 0LL;
        pid_t v8 = (dispatch_source_s *)qword_100067A40;
      }

      dispatch_time_t v9 = dispatch_time(0xFFFFFFFFFFFFFFFFLL, 0LL);
      dispatch_source_set_timer(v8, v9, 0xFFFFFFFFFFFFFFFFLL, 0LL);
      goto LABEL_14;
    }

    dispatch_time_t v10 = dispatch_time(0LL, 0LL);
    dispatch_source_set_timer(v8, v10, qword_100066D80, 0LL);
  }

  else if (v2)
  {
LABEL_14:
    if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_DEBUG)) {
      sub_100042F30();
    }
    if (byte_100067A68)
    {
      if (qword_100067A70) {
        dispatch_source_cancel((dispatch_source_t)qword_100067A70);
      }
    }

    return;
  }

  if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_DEBUG)) {
    sub_100042F04();
  }
  sub_10002D1D4();
}

void sub_100027344(int a1)
{
  char v1 = a1;
  if (a1)
  {
    int v2 = sub_100038248();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100027404;
    block[3] = &unk_100059210;
    char v8 = v1;
    dispatch_async(v2, block);
  }

  else
  {
    dispatch_time_t v3 = dispatch_time(0LL, qword_100066D88);
    int v4 = sub_100038248();
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    _DWORD v5[2] = sub_1000274FC;
    v5[3] = &unk_100059210;
    char v6 = v1;
    dispatch_after(v3, v4, v5);
  }

uint64_t sub_100027404(uint64_t a1)
{
  return sub_10002740C(*(_BYTE *)(a1 + 32));
}

uint64_t sub_10002740C(char a1)
{
  uint64_t result = sub_10003AE20();
  if (byte_1000674DC != (_DWORD)result)
  {
    byte_1000674DC = result;
    if ((_DWORD)result)
    {
      if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_DEBUG)) {
        sub_100042F5C();
      }
      for (uint64_t i = 0LL; i != 3200; i += 160LL)
        uint64_t result = sub_100027F30((uint64_t)&byte_100067A90[i], 3u, (uint64_t)&stru_10005A248);
    }

    else if ((a1 & 1) == 0)
    {
      if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_DEBUG)) {
        sub_100042F88();
      }
      for (uint64_t j = 0LL; j != 3200; j += 160LL)
        uint64_t result = sub_100027F30((uint64_t)&byte_100067A90[j], 3u, (uint64_t)&stru_10005A268);
    }
  }

  return result;
}

uint64_t sub_1000274FC(uint64_t a1)
{
  return sub_10002740C(*(_BYTE *)(a1 + 32));
}

uint64_t sub_100027504(const void *a1, const void *a2, int a3, _DWORD *a4)
{
  uint64_t result = 3758097090LL;
  if (a1 && a2 && a4)
  {
    uint64_t result = (uint64_t)sub_100026D08(a1, a2, 0LL, 0LL, 0LL, @"TimeoutActionRelease", (double)a3);
    if (result)
    {
      CFNumberRef v7 = (const void *)result;
      uint64_t v8 = getpid();
      sub_100022860(v8, v7, a4, 0LL, 0LL);
      CFRelease(v7);
      return 0LL;
    }
  }

  return result;
}

uint64_t sub_100027584(int a1)
{
  if (!a1) {
    return 3758097084LL;
  }
  pid_t v2 = getpid();
  return sub_100022D44(v2, a1, 0LL);
}

uint64_t sub_1000275BC(int a1, double a2)
{
  uint64_t v2 = 3758097084LL;
  double valuePtr = a2;
  if (!a1) {
    return 3758097090LL;
  }
  CFNumberRef v4 = CFNumberCreate(0LL, kCFNumberDoubleType, &valuePtr);
  if (v4)
  {
    CFNumberRef v5 = v4;
    CFMutableDataRef Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    if (Mutable)
    {
      CFNumberRef v7 = Mutable;
      CFDictionarySetValue(Mutable, @"TimeoutSeconds", v5);
      pid_t v8 = getpid();
      uint64_t v2 = sub_100023080(v8, a1, v7, 0LL);
      CFRelease(v7);
    }

    CFRelease(v5);
  }

  return v2;
}

void sub_100027678()
{
  int valuePtr = 255;
  else {
    unsigned int v0 = dword_100067A20;
  }
  double v1 = (double)v0 * 60.0;
  if (!dword_100067A20) {
    double v1 = 300.0;
  }
  double v13 = v1;
  if (dword_1000673CC)
  {
    CFMutableDataRef Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFNumberRef v3 = CFNumberCreate(0LL, kCFNumberIntType, &valuePtr);
    CFNumberRef v4 = CFNumberCreate(0LL, kCFNumberDoubleType, &v13);
    CFNumberRef v5 = v4;
    if (Mutable) {
      BOOL v6 = v3 == 0LL;
    }
    else {
      BOOL v6 = 1;
    }
    if (v6 || v4 == 0LL)
    {
      if (!Mutable) {
        goto LABEL_20;
      }
    }

    else
    {
      CFDictionarySetValue(Mutable, @"AssertLevel", v3);
      CFDictionarySetValue(Mutable, @"TimeoutSeconds", v5);
      pid_t v11 = getpid();
      sub_100023080(v11, dword_1000673CC, Mutable, 0LL);
    }

    CFRelease(Mutable);
LABEL_20:
    if (v3) {
      CFRelease(v3);
    }
    if (v5) {
      CFRelease(v5);
    }
    return;
  }

  pid_t v8 = sub_100026D08( @"InternalPreventDisplaySleep",  @"com.apple.powermanagement.delayDisplayOff",  0LL,  @"Proxy to delay display off",  0LL,  @"TimeoutActionTurnOff",  v1);
  if (v8)
  {
    dispatch_time_t v9 = v8;
    uint64_t v10 = getpid();
    sub_100022860(v10, v9, &dword_1000673CC, 0LL, 0LL);
    CFRelease(v9);
  }

void *sub_100027810(int a1)
{
  uint64_t result = CFDictionaryGetValue((CFDictionaryRef)qword_100067A18, (const void *)a1);
  if (result) {
    return (void *)result[10];
  }
  return result;
}

void sub_10002783C(int a1, int a2)
{
  int v15 = 0LL;
  Value = CFDictionaryGetValue((CFDictionaryRef)qword_100067A18, (const void *)a1);
  if (Value)
  {
    uint64_t v5 = (uint64_t)Value;
    if ((Value[136] & 0x20) == 0)
    {
      sub_100022CBC(a1, a2, (void **)&v15);
      BOOL v6 = v15;
      if (v15)
      {
        if (!notify_register_check("com.apple.powermanagement.assertionexception", &out_token))
        {
          notify_set_state(out_token, a1 | (unint64_t)&_mh_execute_header);
          notify_post("com.apple.powermanagement.assertionexception");
          notify_cancel(out_token);
          CFNumberRef v7 = (os_log_s *)qword_100067A10;
          if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v8 = v6[2];
            *(_DWORD *)buf = 67109378;
            int v17 = a1;
            __int16 v18 = 2112;
            uint64_t v19 = v8;
            _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Single assertion exception on pid %d. Assertion details: %@\n",  buf,  0x12u);
          }
        }

        dispatch_time_t v9 = *(const void **)(v5 + 104);
        if (v9)
        {
          CFTypeID TypeID = CFStringGetTypeID();
        }

        else
        {
          dispatch_time_t v9 = (const void *)sub_1000279F8(1, v5);
          *(void *)(v5 + 104) = v9;
          CFTypeID TypeID = CFStringGetTypeID();
          if (!v9) {
            return;
          }
        }

        if (CFGetTypeID(v9) == TypeID)
        {
          CFTypeRef v11 = CFRetain(*(CFTypeRef *)(v5 + 104));
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472LL;
          block[2] = sub_100027D18;
          block[3] = &unk_100059B40;
          void block[4] = v11;
          int v13 = a1;
          dispatch_async((dispatch_queue_t)qword_1000673D0, block);
        }
      }
    }
  }

uint64_t sub_1000279F8(int a1, uint64_t a2)
{
  uint64_t v2 = 0LL;
  uint64_t v35 = 0LL;
  uint64_t v36 = &v35;
  uint64_t v37 = 0x2020000000LL;
  uint64_t v33 = 0x2020000000LL;
  unsigned int v25 = _NSConcreteStackBlock;
  int v38 = 0;
  char v27 = sub_10002DBAC;
  CFDateRef v28 = &unk_10005A1A0;
  uint64_t v31 = 0LL;
  BOOL v32 = &v31;
  int v34 = 0;
  uint64_t v26 = 3221225472LL;
  char v29 = &v35;
  int v30 = &v31;
  if (qword_100067A38 && !qword_1000673D0)
  {
    qword_1000673D0 = (uint64_t)dispatch_queue_create("PM Stats offloader", 0LL);
    if (!qword_1000673D0)
    {
      if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_ERROR)) {
        sub_100042FB4();
      }
LABEL_26:
      uint64_t v2 = 0LL;
      goto LABEL_27;
    }

    if (a1 != 1)
    {
      uint64_t v2 = qword_1000674C0;
      if (qword_1000674C0)
      {
        int v9 = dword_1000674CC;
        BOOL v6 = v36;
        int v10 = dword_1000674D4;
        CFTypeRef v11 = v32;
      }

      else
      {
        uint64_t v2 = v27((uint64_t)&v25, 2);
        qword_1000674C0 = v2;
        BOOL v6 = v36;
        int v9 = *((_DWORD *)v36 + 6);
        dword_1000674CC = v9;
        CFTypeRef v11 = v32;
        int v10 = *((_DWORD *)v32 + 6);
        dword_1000674D4 = v10;
        if (!v2) {
          goto LABEL_27;
        }
      }

      *((_DWORD *)v6 + 6) = v9;
      *((_DWORD *)v11 + 6) = v10;
      int v12 = (unsigned int *)(a2 + 132);
      goto LABEL_15;
    }

    uint64_t v2 = qword_1000674B8;
    if (qword_1000674B8)
    {
      int v5 = dword_1000674C8;
      BOOL v6 = v36;
      int v7 = dword_1000674D0;
      uint64_t v8 = v32;
LABEL_12:
      *((_DWORD *)v6 + 6) = v5;
      *((_DWORD *)v8 + 6) = v7;
      int v12 = (unsigned int *)(a2 + 128);
LABEL_15:
      if (*((_DWORD *)v6 + 6))
      {
        unint64_t v13 = 0LL;
        int v14 = 0;
        uint64_t v15 = *v12;
        while (1)
        {
          CFStringRef v16 = *(CFStringRef *)v2;
          CFTypeID TypeID = CFStringGetTypeID();
          if (v16)
          {
            if (CFGetTypeID(v16) == TypeID)
            {
              __int16 v18 = *(const void **)(a2 + 80);
              CFTypeID v19 = CFStringGetTypeID();
              if (v18)
              {
                if (CFGetTypeID(v18) == v19
                  && CFStringCompare(*(CFStringRef *)v2, *(CFStringRef *)(a2 + 80), 0LL) == kCFCompareEqualTo)
                {
                  break;
                }
              }
            }
          }

          uint64_t v20 = *(void *)(v2 + 8);
          if (v20)
          {
            if (v20 <= v15)
            {
              uint64_t v22 = (*((_DWORD *)v32 + 6) + ~v14);
              if ((_DWORD)v22 == -1) {
                goto LABEL_26;
              }
              CFPropertyListRef v23 = "aggregateassertion";
              if (a1 == 1) {
                CFPropertyListRef v23 = "singleassertion";
              }
              CFStringRef v24 = CFStringCreateWithFormat( 0LL,  0LL,  @"com.apple.powerd.exception.%s.bucket%d",  v23,  v22,  v25,  v26);
              goto LABEL_32;
            }

            ++v14;
          }

          ++v13;
          v2 += 24LL;
        }

        if (*(void *)v2)
        {
          CFStringRef v24 = sub_10002E09C(*(const __CFString **)v2, a1);
LABEL_32:
          uint64_t v2 = (uint64_t)v24;
          goto LABEL_27;
        }
      }

      goto LABEL_26;
    }

    uint64_t v2 = v27((uint64_t)&v25, 1);
    qword_1000674B8 = v2;
    BOOL v6 = v36;
    int v5 = *((_DWORD *)v36 + 6);
    dword_1000674C8 = v5;
    uint64_t v8 = v32;
    int v7 = *((_DWORD *)v32 + 6);
    dword_1000674D0 = v7;
    if (v2) {
      goto LABEL_12;
    }
  }

void sub_100027CEC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_100027D18(uint64_t a1)
{
  uint64_t v2 = (os_log_s *)qword_100067A10;
  if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = *(_DWORD *)(a1 + 40);
    int v5 = 138412546;
    uint64_t v6 = v3;
    __int16 v7 = 1024;
    int v8 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "Add to aggd string %@ for pid %d\n",  (uint8_t *)&v5,  0x12u);
  }

  CFRelease(*(CFTypeRef *)(a1 + 32));
}

void sub_100027DDC()
{
  uint64_t v0 = 0LL;
  uint64_t v7 = 0LL;
  int v8 = &v7;
  uint64_t v9 = 0x2020000000LL;
  int v10 = 0;
  char v1 = 1;
  do
  {
    char v2 = v1;
    int v3 = dword_100048688[v0];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_100027FDC;
    v6[3] = &unk_100059DE8;
    void v6[4] = &v7;
    sub_100027F30((uint64_t)&unk_100067A90 + 160 * v3, 3u, (uint64_t)v6);
    char v1 = 0;
    uint64_t v0 = 1LL;
  }

  while ((v2 & 1) != 0);
  if (!dword_1000673D8) {
    notify_register_check("com.apple.powermanagement.restartpreventers", &dword_1000673D8);
  }
  int v4 = *((_DWORD *)v8 + 6);
  if (v4) {
    BOOL v5 = dword_100068730 == 0;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5 || !v4 && dword_100068730)
  {
    dword_100068730 = *((_DWORD *)v8 + 6);
    if (dword_1000673D8)
    {
      notify_set_state(dword_1000673D8, v4);
      notify_post("com.apple.powermanagement.restartpreventers");
    }
  }

  _Block_object_dispose(&v7, 8);
}

void sub_100027F14( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_100027F30(uint64_t result, unsigned int a2, uint64_t a3)
{
  uint64_t v5 = 0LL;
  __int128 v6 = *(_OWORD *)(result + 24);
  v9[0] = *(_OWORD *)(result + 8);
  v9[1] = v6;
  do
  {
    if (((a2 >> v5) & 1) != 0)
    {
      uint64_t v7 = (void *)*((void *)v9 + v5);
      if (v7)
      {
        do
        {
          int v8 = (void *)*v7;
          uint64_t result = (*(uint64_t (**)(uint64_t))(a3 + 16))(a3);
          uint64_t v7 = v8;
        }

        while (v8);
      }
    }

    ++v5;
  }

  while (v5 != 4);
  return result;
}

uint64_t sub_100027FDC(uint64_t result, uint64_t a2)
{
  if ((*(_WORD *)(a2 + 104) & 0x100) == 0) {
    ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL);
  }
  return result;
}

void sub_100027FFC(uint64_t a1, int a2)
{
  int v2 = dword_100068710;
  int v3 = -dword_100068714;
  int v5 = dword_100068724;
  int v4 = dword_100068728;
  void v11[4] = a1;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  uint64_t v13 = sub_100028180;
  uint64_t v14 = &unk_1000598E8;
  uint64_t v15 = a1;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  _OWORD v11[2] = sub_100028440;
  v11[3] = &unk_1000598E8;
  switch(a2)
  {
    case 2:
      sub_100028440((uint64_t)v11);
      v13((uint64_t)v12);
      break;
    case 1:
      sub_100028440((uint64_t)v11);
      break;
    case 0:
      sub_100028180((uint64_t)v12);
      break;
  }

  BOOL v6 = v5 != 0;
  uint64_t v7 = sub_100038248();
  dispatch_async(v7, &stru_100059E08);
  if ((v2 != v3) != (dword_100068710 + dword_100068714 != 0) || v6 != (dword_100068724 != 0))
  {
    int v8 = sub_100038248();
    dispatch_async(v8, &stru_100059E28);
  }

  if ((v4 != 0) != (dword_100068728 != 0))
  {
    uint64_t v9 = (os_log_s *)qword_100067A10;
    if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v10 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Evaluating new PerfMode on gSysQualifier change.\n",  v10,  2u);
    }

    sub_10001E400();
  }

uint64_t sub_100028180(uint64_t a1)
{
  int v2 = (const __CFArray *)CFDictionaryGetValue( *(CFDictionaryRef *)(*(void *)(a1 + 32) + 16LL),  @"ResourcesUsed");
  if (CFDictionaryGetValueIfPresent( *(CFDictionaryRef *)(*(void *)(a1 + 32) + 16LL),  @"AllowsDeviceRestart",  (const void **)&value)
    && value == kCFBooleanTrue)
  {
    *(_WORD *)(*(void *)(a1 + 32) + 104LL) |= 0x100u;
  }

  CFTypeID TypeID = CFArrayGetTypeID();
  if (v2)
  {
    if (CFGetTypeID(v2) == TypeID)
    {
      CFIndex Count = CFArrayGetCount(v2);
      if (Count >= 1)
      {
        CFIndex v5 = Count;
        CFIndex v6 = 0LL;
        while (1)
        {
          ValueAtIndex = CFArrayGetValueAtIndex(v2, v6);
          CFTypeID v8 = CFStringGetTypeID();
          if (!ValueAtIndex || CFGetTypeID(ValueAtIndex) != v8) {
            goto LABEL_26;
          }
          if (CFEqual(ValueAtIndex, @"audio-in"))
          {
            uint64_t v9 = *(void *)(a1 + 32);
            if ((*(_WORD *)(v9 + 104) & 0x100) == 0) {
              break;
            }
          }

          if (CFEqual(ValueAtIndex, @"audio-out"))
          {
            *(_WORD *)(*(void *)(a1 + 32) + 104LL) |= 4u;
            int v10 = &dword_100068714;
            goto LABEL_25;
          }

          if (CFEqual(ValueAtIndex, @"GPS"))
          {
            *(_WORD *)(*(void *)(a1 + 32) + 104LL) |= 8u;
            int v10 = &dword_100068718;
            goto LABEL_25;
          }

          if (CFEqual(ValueAtIndex, @"baseband"))
          {
            *(_WORD *)(*(void *)(a1 + 32) + 104LL) |= 0x10u;
            int v10 = &dword_10006871C;
            goto LABEL_25;
          }

          if (CFEqual(ValueAtIndex, @"bluetooth"))
          {
            *(_WORD *)(*(void *)(a1 + 32) + 104LL) |= 0x20u;
            int v10 = &dword_100068720;
            goto LABEL_25;
          }

          if (CFEqual(ValueAtIndex, @"perf-unrestricted"))
          {
            *(_WORD *)(*(void *)(a1 + 32) + 104LL) |= 0x40u;
            int v10 = &dword_100068728;
            goto LABEL_25;
          }

          if (CFEqual(ValueAtIndex, @"Camera"))
          {
            *(_WORD *)(*(void *)(a1 + 32) + 104LL) |= 0x80u;
            int v10 = &dword_100068724;
            goto LABEL_25;
          }

uint64_t sub_100028440(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  __int16 v2 = *(_WORD *)(v1 + 104);
  if ((v2 & 2) != 0)
  {
    *(_WORD *)(v1 + 104) = v2 & 0xFFFD;
    if (dword_100068710) {
      --dword_100068710;
    }
  }

  uint64_t v3 = *(void *)(result + 32);
  __int16 v4 = *(_WORD *)(v3 + 104);
  if ((v4 & 4) != 0)
  {
    *(_WORD *)(v3 + 104) = v4 & 0xFFFB;
    if (dword_100068714) {
      --dword_100068714;
    }
  }

  uint64_t v5 = *(void *)(result + 32);
  __int16 v6 = *(_WORD *)(v5 + 104);
  if ((v6 & 8) != 0)
  {
    *(_WORD *)(v5 + 104) = v6 & 0xFFF7;
    if (dword_100068718) {
      --dword_100068718;
    }
  }

  uint64_t v7 = *(void *)(result + 32);
  __int16 v8 = *(_WORD *)(v7 + 104);
  if ((v8 & 0x10) != 0)
  {
    *(_WORD *)(v7 + 104) = v8 & 0xFFEF;
    if (dword_10006871C) {
      --dword_10006871C;
    }
  }

  uint64_t v9 = *(void *)(result + 32);
  __int16 v10 = *(_WORD *)(v9 + 104);
  if ((v10 & 0x20) != 0)
  {
    *(_WORD *)(v9 + 104) = v10 & 0xFFDF;
    if (dword_100068720) {
      --dword_100068720;
    }
  }

  uint64_t v11 = *(void *)(result + 32);
  __int16 v12 = *(_WORD *)(v11 + 104);
  if ((v12 & 0x40) != 0)
  {
    *(_WORD *)(v11 + 104) = v12 & 0xFFBF;
    if (dword_100068728) {
      --dword_100068728;
    }
  }

  uint64_t v13 = *(void *)(result + 32);
  __int16 v14 = *(_WORD *)(v13 + 104);
  if ((v14 & 0x80) != 0)
  {
    *(_WORD *)(v13 + 104) = v14 & 0xFF7F;
    if (dword_100068724) {
      --dword_100068724;
    }
  }

  uint64_t v15 = *(void *)(result + 32);
  __int16 v16 = *(_WORD *)(v15 + 104);
  if ((v16 & 0x100) != 0)
  {
    *(_WORD *)(v15 + 104) = v16 & 0xFEFF;
    uint64_t v15 = *(void *)(result + 32);
    __int16 v16 = *(_WORD *)(v15 + 104);
  }

  if ((v16 & 0x200) != 0)
  {
    *(_WORD *)(v15 + 104) = v16 & 0xFDFF;
    if (dword_10006872C) {
      --dword_10006872C;
    }
  }

  return result;
}

void sub_1000285A0(uint64_t a1)
{
  __int16 v2 = *(dispatch_object_s **)(a1 + 96);
  if (v2)
  {
    if ((*(_BYTE *)(a1 + 25) & 1) != 0)
    {
      dispatch_suspend(v2);
      *(_DWORD *)(a1 + 24) &= ~0x100u;
    }
  }

void sub_1000285DC(int a1, int a2)
{
  __int16 v12 = 0LL;
  Value = CFDictionaryGetValue((CFDictionaryRef)qword_100067A18, (const void *)a1);
  if (Value)
  {
    uint64_t v5 = Value;
    if ((Value[34] & 0x20) == 0)
    {
      if (Value[32])
      {
        sub_100022CBC(a1, a2, (void **)&v12);
        uint64_t v6 = (uint64_t)v12;
        if (v12)
        {
          if (*((_DWORD *)&unk_100067A90 + 40 * v12[12] + 26)
            && !sub_100019CD0()
            && sub_10003AE20()
            && (!*(void *)(v6 + 40) || *(void *)(v6 + 40) - sub_100039ACC() > v5[32]))
          {
            sub_1000285A0(v6);
            uint64_t v7 = *(dispatch_source_s **)(v6 + 96);
            if (!v7)
            {
              __int16 v8 = sub_100038248();
              uint64_t v7 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, v8);
              handler[0] = _NSConcreteStackBlock;
              handler[1] = 3221225472LL;
              handler[2] = sub_10002877C;
              handler[3] = &unk_100059E48;
              void handler[4] = v5;
              void handler[5] = v6;
              dispatch_source_set_event_handler(v7, handler);
              v10[0] = _NSConcreteStackBlock;
              v10[1] = 3221225472LL;
              _DWORD v10[2] = sub_10002878C;
              v10[3] = &unk_1000596C0;
              v10[4] = v7;
              dispatch_source_set_cancel_handler(v7, v10);
              *(void *)(v6 + 96) = v7;
            }

            dispatch_time_t v9 = dispatch_time(0LL, 1000000000LL * v5[32]);
            dispatch_source_set_timer(v7, v9, 0xFFFFFFFFFFFFFFFFLL, 0LL);
            dispatch_resume(*(dispatch_object_t *)(v6 + 96));
            *(_DWORD *)(v6 + 24) |= 0x100u;
          }
        }
      }
    }
  }

void sub_10002877C(uint64_t a1)
{
}

void sub_10002878C(uint64_t a1)
{
}

void sub_100028794(uint64_t a1)
{
  if (a1)
  {
    int v1 = *(_DWORD *)(a1 + 52);
    uint64_t v2 = *(void *)(a1 + 72);
    if (v2) {
      int v3 = *(_DWORD *)(v2 + 96);
    }
    else {
      int v3 = 0;
    }
    __int16 v4 = sub_100038248();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10002880C;
    block[3] = &unk_1000598E8;
    int v6 = v3;
    int v7 = v1;
    dispatch_async(v4, block);
  }

void sub_10002880C(uint64_t a1)
{
}

unint64_t sub_100028818(unint64_t result, int a2)
{
  unint64_t v3 = result;
  unsigned int v4 = *(_DWORD *)(result + 48);
  if (dword_100067A30
    && (uint64_t v5 = (char *)&unk_100067A90 + 160 * v4, v7 = *((_DWORD *)v5 + 26), v6 = (unsigned int *)(v5 + 104), v7 <= 3))
  {
    uint64_t result = *(unsigned int *)(result + 80);
    if (!(_DWORD)result) {
      goto LABEL_8;
    }
    unint64_t v8 = *(void *)(v3 + 88);
    if (!v8)
    {
      uint64_t result = (unint64_t)sub_100023548(result);
      unint64_t v8 = result;
      *(void *)(v3 + 8_Block_object_dispose(va, 8) = result;
      if (!result)
      {
        uint64_t result = (unint64_t)sub_100023584(*(_DWORD *)(v3 + 80));
        unint64_t v8 = result;
        *(void *)(v3 + 8_Block_object_dispose(va, 8) = result;
        if (!result)
        {
          uint64_t result = (unint64_t)sub_100023548(*(_DWORD *)(*(void *)(v3 + 72) + 96LL));
          unint64_t v8 = result;
          *(void *)(v3 + 8_Block_object_dispose(va, 8) = result;
          if (!result) {
LABEL_8:
          }
            unint64_t v8 = *(void *)(v3 + 72);
        }
      }
    }

    else {
      unint64_t v9 = 0LL;
    }
  }

  else
  {
    unint64_t v9 = 0LL;
    unint64_t v8 = 0LL;
  }

  if (a2 == 1)
  {
    if (v9 && *(_DWORD *)v9 && (*(_BYTE *)(v3 + 24) & 0x80) != 0)
    {
      int v13 = *(_DWORD *)v9 - 1;
      *(_DWORD *)unint64_t v9 = v13;
      if (!v13)
      {
        uint64_t result = sub_100039ACC();
        uint64_t v15 = *(void *)(v8 + 64);
        if (*((_DWORD *)&unk_100067A90 + 40 * v4 + 26) >> 2 < *(unsigned __int16 *)(v15 + 20))
        {
          unint64_t v16 = result - *(void *)(v9 + 8);
          unint64_t v14 = *((unsigned int *)&unk_100067A90 + 40 * v4 + 26);
          uint64_t v17 = v15 + (v14 >> 2 << 6) + 8 * (v14 & 3);
          uint64_t v18 = *(void *)(v17 + 32);
          uint64_t v19 = v18 >> 63;
          BOOL v20 = __CFADD__(v18, v16);
          unint64_t v21 = v18 + v16;
          if (v20) {
            ++v19;
          }
          if ((v19 & 1) != v21 >> 63 || v19 << 63 >> 63 != v19) {
            unint64_t v21 = 0x7FFFFFFFFFFFFFFFLL;
          }
          *(void *)(v17 + 32) = v21;
        }
      }

      unsigned int v12 = *(_DWORD *)(v3 + 24) & 0xFFFFFF7F;
      goto LABEL_37;
    }
  }

  else if (!a2)
  {
    if ((*((_BYTE *)&unk_100067A90 + 160 * v4) & 1) == 0
      || (*(_BYTE *)(v3 + 24) & 4) != 0
      || (uint64_t result = sub_100019CD0(), (_DWORD)result))
    {
      if (v9)
      {
        int v10 = *(_DWORD *)(v3 + 24);
        if ((v10 & 0x80) == 0)
        {
          if (!(*(_DWORD *)v9)++)
          {
            uint64_t result = sub_100039ACC();
            *(void *)(v9 + _Block_object_dispose(va, 8) = result;
            int v10 = *(_DWORD *)(v3 + 24);
          }

          unsigned int v12 = v10 | 0x80;
LABEL_37:
          *(_DWORD *)(v3 + 24) = v12;
        }
      }
    }
  }

  return result;
}

_DWORD *sub_1000289E4(_DWORD *result)
{
  if (dword_100067A30)
  {
    int v1 = result;
    if (!*((void *)result + 8))
    {
      uint64_t result = malloc(0x40uLL);
      *((void *)v1 + _Block_object_dispose(va, 8) = result;
      if (result)
      {
        uint64_t v2 = result;
        *(void *)&__int128 v3 = 0x2626262626262626LL;
        *((void *)&v3 + 1) = 0x2626262626262626LL;
        *((_OWORD *)result + 2) = v3;
        *((_OWORD *)result + 3) = v3;
        *(_OWORD *)uint64_t result = v3;
        *((_OWORD *)result + 1) = v3;
        pid_t v4 = getpid();
        uint64_t v5 = 0LL;
        uint64_t v6 = v4;
        uint64_t v7 = (int)v1[24];
        *(void *)uint64_t v2 = v6;
        *((void *)v2 + 1) = v7;
        *((_WORD *)v2 + _Block_object_dispose(va, 8) = 4;
        *(_DWORD *)((char *)v2 + 1_Block_object_dispose(va, 8) = 65538;
        *(_OWORD *)(v2 + 6) = xmmword_100048720;
        *((_WORD *)v2 + 11) = 0;
        *(int64x2_t *)(v2 + 1sub_1000262C4(0x12u, 0) = vdupq_n_s64(0x8000000000000000LL);
        *((void *)v2 + 7) = 0x8000000000000000LL;
        uint64_t v8 = *((void *)v1 + 8);
        int v9 = *(unsigned __int16 *)(v8 + 20);
        uint64_t v10 = v8 + 32;
        do
        {
          if (v9) {
            *(void *)(v10 + v5) = 0LL;
          }
          v5 += 8LL;
        }

        while (v5 != 32);
        *((_OWORD *)v1 + 2) = 0u;
        *((_OWORD *)v1 + 3) = 0u;
        *(_OWORD *)int v1 = 0u;
        *((_OWORD *)v1 + 1) = 0u;
        return sub_100023548(v7);
      }
    }
  }

  return result;
}

uint64_t sub_100028AB4(uint64_t a1, _OWORD *a2, int a3, _DWORD *a4, int *a5)
{
  uid_t ruidp = -1;
  pid_t pidp = -1;
  gid_t rgidp = -1;
  __int128 v8 = a2[1];
  *(_OWORD *)atoken.val = *a2;
  *(_OWORD *)&atoken.val[4] = v8;
  audit_token_to_au32(&atoken, 0LL, 0LL, 0LL, &ruidp, &rgidp, &pidp, 0LL, 0LL);
  *a4 = 0;
  if (sub_100038ED4(ruidp))
  {
    int v9 = 0;
    *a4 = dword_100066D78;
    dword_100066D78 = a3;
  }

  else
  {
    int v9 = -536870207;
  }

  *a5 = v9;
  return 0LL;
}

uint64_t sub_100028B5C( uint64_t a1, _OWORD *a2, _DWORD *a3, const UInt8 *a4, unsigned int a5, _DWORD *a6, int *a7)
{
  pid_t pidp = -1;
  __int128 v13 = a2[1];
  *(_OWORD *)atoken.val = *a2;
  *(_OWORD *)&atoken.val[4] = v13;
  audit_token_to_au32(&atoken, 0LL, 0LL, 0LL, 0LL, 0LL, &pidp, 0LL, 0LL);
  *a6 = 0;
  unint64_t v14 = CFDataCreateWithBytesNoCopy(0LL, a4, a5, kCFAllocatorNull);
  if (v14)
  {
    uint64_t v15 = v14;
    unint64_t v16 = (const __CFDictionary *)CFPropertyListCreateWithData(0LL, v14, 1uLL, 0LL, 0LL);
    CFRelease(v15);
    if (v16)
    {
      int v17 = -536870207;
      __int128 v18 = a2[1];
      *(_OWORD *)atoken.val = *a2;
      *(_OWORD *)&atoken.val[4] = v18;
      if (!sub_10002260C(&atoken, v16)) {
        goto LABEL_16;
      }
      *a3 = 1;
      *a7 = 0;
      if (dword_100066D78 != 1)
      {
        CFDictionarySetValue(v16, @"AssertType", @"PreventUserIdleSystemSleep");
LABEL_14:
        if (!sub_100022860(pidp, v16, a6, 0LL, 0LL))
        {
LABEL_17:
          CFRelease(v16);
          goto LABEL_18;
        }

        int v17 = -536870199;
LABEL_16:
        *a7 = v17;
        goto LABEL_17;
      }

      CFDictionarySetValue(v16, @"AssertType", @"SystemIsActive");
      uint32_t outputCnt = 1;
      size_t v27 = 0LL;
      mach_port_t v19 = sub_10001E634();
      if (!v19) {
        goto LABEL_9;
      }
      if (IOConnectCallMethod(v19, 0x11u, 0LL, 0, 0LL, 0LL, &output, &outputCnt, 0LL, &v27))
      {
        if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_ERROR)) {
          sub_100042FE0();
        }
        goto LABEL_9;
      }

      uint64_t v23 = output;
      CFStringRef v24 = (os_log_s *)qword_100067A10;
      if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_DEBUG))
      {
        unsigned int v25 = "true";
        if (!v23) {
          unsigned int v25 = "false";
        }
        atoken.val[0] = 136315138;
        *(void *)&atoken.val[1] = v25;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEBUG,  "IdleSleepRevertRequest Successful: %s",  (uint8_t *)&atoken,  0xCu);
        if (!v23) {
          goto LABEL_9;
        }
      }

      else if (!v23)
      {
LABEL_9:
        unsigned int v20 = 0;
        goto LABEL_10;
      }

      *a3 = 0;
      unsigned int v20 = 1;
LABEL_10:
      unint64_t v21 = (os_log_s *)qword_100067A10;
      if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_DEFAULT))
      {
        atoken.val[0] = 67109120;
        atoken.val[1] = v20;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Sleep revert state: %d\n",  (uint8_t *)&atoken,  8u);
      }

      goto LABEL_14;
    }
  }

  *a7 = -536870206;
LABEL_18:
  vm_deallocate(mach_task_self_, (vm_address_t)a4, a5);
  return 0LL;
}

uint64_t sub_100028E60( uint64_t a1, _OWORD *a2, uint64_t a3, const UInt8 *a4, unsigned int a5, int *a6, _DWORD *a7, _DWORD *a8)
{
  CFDateRef v28 = 0LL;
  pid_t pidp = -1;
  __int128 v14 = a2[1];
  *(_OWORD *)atoken.val = *a2;
  *(_OWORD *)&atoken.val[4] = v14;
  audit_token_to_au32(&atoken, 0LL, 0LL, 0LL, 0LL, 0LL, &pidp, 0LL, 0LL);
  *a7 = 0;
  vm_size_t v15 = a5;
  unint64_t v16 = CFDataCreateWithBytesNoCopy(0LL, a4, a5, kCFAllocatorNull);
  if (v16)
  {
    int v17 = v16;
    __int128 v18 = (__CFDictionary *)CFPropertyListCreateWithData(0LL, v16, 1uLL, 0LL, 0LL);
    CFRelease(v17);
    if (a6 && v18)
    {
      __int128 v19 = a2[1];
      *(_OWORD *)atoken.val = *a2;
      *(_OWORD *)&atoken.val[4] = v19;
      if (sub_10002260C(&atoken, v18))
      {
        *(double *)atoken.val = (double)(60 * dword_100067A20);
        CFNumberRef v20 = CFNumberCreate(0LL, kCFNumberDoubleType, &atoken);
        CFDictionarySetValue(v18, @"TimeoutSeconds", v20);
        CFRelease(v20);
        CFDictionarySetValue(v18, @"TimeoutAction", @"TimeoutActionRelease");
        if (*a6
          && !sub_100022CBC(pidp, *a6, (void **)&v28)
          && (unint64_t v21 = v28) != 0LL
          && *((_DWORD *)v28 + 12) == 9)
        {
          int valuePtr = 255;
          CFNumberRef v22 = CFNumberCreate(0LL, kCFNumberIntType, &valuePtr);
          CFDictionarySetValue(v21[2], @"AssertLevel", v22);
          CFRelease(v22);
          *a8 = sub_100023080(pidp, *a6, v18, 0LL);
        }

        else
        {
          CFDictionarySetValue(v18, @"AssertType", @"UserIsActive");
          int v23 = sub_100022860(pidp, v18, a6, 0LL, 0LL);
          *a8 = v23;
        }
      }

      else
      {
        *a8 = -536870207;
      }
    }

    else
    {
      *a8 = -536870206;
      if (!v18) {
        goto LABEL_18;
      }
    }

    CFRelease(v18);
  }

  else
  {
    *a8 = -536870206;
  }

uint64_t sub_1000290F4( uint64_t a1, _OWORD *a2, const UInt8 *a3, unsigned int a4, int *a5, _DWORD *a6, _DWORD *a7)
{
  pid_t pidp = -1;
  unsigned int v25 = 0LL;
  double valuePtr = 0.0;
  __int128 v13 = a2[1];
  *(_OWORD *)atoken.val = *a2;
  *(_OWORD *)&atoken.val[4] = v13;
  audit_token_to_au32(&atoken, 0LL, 0LL, 0LL, 0LL, 0LL, &pidp, 0LL, 0LL);
  *a6 = 0;
  vm_size_t v14 = a4;
  vm_size_t v15 = CFDataCreateWithBytesNoCopy(0LL, a3, a4, kCFAllocatorNull);
  if (v15)
  {
    unint64_t v16 = v15;
    int v17 = (__CFDictionary *)CFPropertyListCreateWithData(0LL, v15, 1uLL, 0LL, 0LL);
    CFRelease(v16);
    if (a5 && v17)
    {
      __int128 v18 = a2[1];
      *(_OWORD *)atoken.val = *a2;
      *(_OWORD *)&atoken.val[4] = v18;
      if (sub_10002260C(&atoken, v17))
      {
        double valuePtr = (double)(unint64_t)(60 * qword_100067A28);
        if (60 * qword_100067A28)
        {
          CFNumberRef v19 = CFNumberCreate(0LL, kCFNumberDoubleType, &valuePtr);
          CFDictionarySetValue(v17, @"TimeoutSeconds", v19);
          CFRelease(v19);
          CFDictionarySetValue(v17, @"TimeoutAction", @"TimeoutActionRelease");
        }

        if (*a5
          && !sub_100022CBC(pidp, *a5, (void **)&v25)
          && (CFNumberRef v20 = v25) != 0LL
          && *((_DWORD *)v25 + 12) == 17)
        {
          atoken.val[0] = 255;
          CFNumberRef v21 = CFNumberCreate(0LL, kCFNumberIntType, &atoken);
          CFDictionarySetValue(v20[2], @"AssertLevel", v21);
          CFRelease(v21);
          *a7 = sub_100023080(pidp, *a5, v17, 0LL);
        }

        else
        {
          CFDictionarySetValue(v17, @"AssertType", @"NetworkClientActive");
          int v22 = sub_100022860(pidp, v17, a5, 0LL, 0LL);
          *a7 = v22;
        }
      }

      else
      {
        *a7 = -536870207;
      }
    }

    else
    {
      *a7 = -536870206;
      if (!v17) {
        goto LABEL_20;
      }
    }

    CFRelease(v17);
  }

  else
  {
    *a7 = -536870206;
  }

uint64_t sub_10002938C(uint64_t a1, const char *a2, int a3)
{
  if (a3 != 1)
  {
    uint64_t v6 = 3758097090LL;
    Value = CFDictionaryGetValue((CFDictionaryRef)qword_100067A18, (const void *)(int)a1);
    if (!Value) {
      return v6;
    }
    int v9 = Value;
    if (!strncmp(a2, "com.apple.system.powermanagement.assertions.anychange", 0x36uLL))
    {
      if (a3 != 2 || (v9[136] & 1) == 0) {
        return 0LL;
      }
      v9[136] &= ~1u;
      --dword_1000673DC;
    }

    else if (!strncmp(a2, "com.apple.system.powermanagement.assertions", 0x2CuLL))
    {
      if (a3 != 2 || (v9[136] & 2) == 0) {
        return 0LL;
      }
      v9[136] &= ~2u;
      --dword_1000673C8;
    }

    else
    {
      if (strncmp(a2, "com.apple.system.powermanagement.assertions.timeout", 0x34uLL)) {
        return v6;
      }
      if (a3 != 2 || (v9[136] & 4) == 0) {
        return 0LL;
      }
      v9[136] &= ~4u;
      --dword_1000673E0;
    }

    sub_1000237D8(a1);
    return 0LL;
  }

  uint64_t v5 = sub_100023548(a1);
  if (!v5)
  {
    uint64_t v5 = (_DWORD *)sub_100023584(a1);
    if (!v5) {
      return 3758097085LL;
    }
  }

  if (!strncmp(a2, "com.apple.system.powermanagement.assertions.anychange", 0x36uLL))
  {
    if ((v5[34] & 1) != 0) {
      goto LABEL_30;
    }
    uint64_t v6 = 0LL;
    *((_BYTE *)v5 + 136) |= 1u;
    ++dword_1000673DC;
  }

  else
  {
    if (strncmp(a2, "com.apple.system.powermanagement.assertions", 0x2CuLL))
    {
      if (strncmp(a2, "com.apple.system.powermanagement.assertions.timeout", 0x34uLL))
      {
        uint64_t v6 = 3758097090LL;
LABEL_31:
        sub_1000237D8(a1);
        return v6;
      }

      if ((v5[34] & 4) == 0)
      {
        uint64_t v6 = 0LL;
        *((_BYTE *)v5 + 136) |= 4u;
        ++dword_1000673E0;
        return v6;
      }

LABEL_30:
      uint64_t v6 = 0LL;
      goto LABEL_31;
    }

    if ((v5[34] & 2) != 0) {
      goto LABEL_30;
    }
    uint64_t v6 = 0LL;
    *((_BYTE *)v5 + 136) |= 2u;
    ++dword_1000673C8;
  }

  return v6;
}

void sub_1000295CC()
{
  uint64_t v0 = (dispatch_source_s *)qword_100067A50;
  if (qword_100067A50)
  {
    dispatch_time_t v1 = dispatch_time(0LL, qword_100066D90);
    dispatch_source_set_timer(v0, v1, 0xFFFFFFFFFFFFFFFFLL, 0LL);
  }

  CFIndex Count = CFDictionaryGetCount((CFDictionaryRef)qword_100067A18);
  __int128 v3 = (const void **)malloc(8 * Count);
  if (v3)
  {
    pid_t v4 = v3;
    bzero(v3, 8 * Count);
    CFDictionaryGetKeysAndValues((CFDictionaryRef)qword_100067A18, 0LL, v4);
    if (Count >= 1)
    {
      uint64_t v5 = (uint64_t *)v4;
      do
      {
        uint64_t v6 = *v5;
        if (!*v5) {
          break;
        }
        if ((*(_BYTE *)(v6 + 136) & 0x20) != 0) {
          sub_100029698(v6);
        }
        ++v5;
        --Count;
      }

      while (Count);
    }

    free(v4);
  }

void sub_100029698(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 64);
  if (v2)
  {
    *(_OWORD *)(a1 + 32) = 0u;
    *(_OWORD *)(a1 + 4_Block_object_dispose(va, 8) = 0u;
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
    free(v2);
    *(void *)(a1 + 64) = 0LL;
    sub_1000237D8(*(_DWORD *)(a1 + 96));
  }

void sub_1000296E0(uint64_t a1, int a2)
{
  if (a2)
  {
    __int128 v3 = sub_100023548(a1);
    if (v3 || (__int128 v3 = (_DWORD *)sub_100023584(a1)) != 0LL)
    {
      if ((v3[34] & 0x40) == 0)
      {
        if (dword_100067A30++)
        {
LABEL_6:
          *((_BYTE *)v3 + 136) |= 0x40u;
          return;
        }

        CFIndex Count = CFDictionaryGetCount((CFDictionaryRef)qword_100067A18);
        __int128 v8 = (const void **)malloc(8 * Count);
        if (v8)
        {
          int v9 = v8;
          bzero(v8, 8 * Count);
          CFDictionaryGetKeysAndValues((CFDictionaryRef)qword_100067A18, 0LL, v9);
          if (Count >= 1)
          {
            uint64_t v10 = v9;
            do
            {
              if (!*v10) {
                break;
              }
              sub_1000289E4(*v10++);
              --Count;
            }

            while (Count);
          }

          free(v9);
          for (uint64_t i = 0LL; i != 3200; i += 160LL)
          {
          }

          if (!qword_100067A50)
          {
            unsigned int v12 = sub_100038248();
            qword_100067A50 = (uint64_t)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  v12);
            dispatch_source_set_event_handler((dispatch_source_t)qword_100067A50, &stru_100059E88);
            dispatch_source_set_cancel_handler((dispatch_source_t)qword_100067A50, &stru_100059EA8);
            __int128 v13 = (dispatch_source_s *)qword_100067A50;
            dispatch_time_t v14 = dispatch_time(0LL, qword_100066D90);
            dispatch_source_set_timer(v13, v14, 0xFFFFFFFFFFFFFFFFLL, 0LL);
            dispatch_resume((dispatch_object_t)qword_100067A50);
          }

          goto LABEL_6;
        }
      }

      goto LABEL_24;
    }
  }

  else if (dword_100067A30)
  {
    Value = CFDictionaryGetValue((CFDictionaryRef)qword_100067A18, (const void *)(int)a1);
    if (Value)
    {
      uint64_t v6 = Value;
      if ((Value[136] & 0x40) != 0)
      {
        if (!--dword_100067A30)
        {
          CFIndex v15 = CFDictionaryGetCount((CFDictionaryRef)qword_100067A18);
          unint64_t v16 = (const void **)malloc(8 * v15);
          if (!v16) {
            return;
          }
          int v17 = v16;
          bzero(v16, 8 * v15);
          CFDictionaryGetKeysAndValues((CFDictionaryRef)qword_100067A18, 0LL, v17);
          if (v15 >= 1)
          {
            __int128 v18 = (uint64_t *)v17;
            do
            {
              if (!*v18) {
                break;
              }
              sub_100029698(*v18++);
              --v15;
            }

            while (v15);
          }

          free(v17);
          for (uint64_t j = 0LL; j != 3200; j += 160LL)
          {
          }

          if (qword_100067A50) {
            dispatch_source_cancel((dispatch_source_t)qword_100067A50);
          }
        }

        v6[136] &= ~0x40u;
LABEL_24:
        sub_1000237D8(a1);
      }
    }
  }

void sub_100029990(id a1, assertion *a2)
{
}

void sub_1000299A0(id a1)
{
  qword_100067A50 = 0LL;
}

void sub_1000299C8(id a1, assertion *a2)
{
  a2->var2 &= ~0x80u;
}

uint64_t sub_1000299D8(uint64_t a1, _OWORD *a2, const char *a3, int a4, int *a5)
{
  int v8 = -536870211;
  uid_t ruidp = -1;
  pid_t pidp = -1;
  gid_t rgidp = -1;
  *a5 = 0;
  __int128 v9 = a2[1];
  *(_OWORD *)atoken.val = *a2;
  *(_OWORD *)&atoken.val[4] = v9;
  audit_token_to_au32(&atoken, 0LL, 0LL, 0LL, &ruidp, &rgidp, &pidp, 0LL, 0LL);
  if (sub_100038ED4(ruidp) || sub_100039B28(ruidp))
  {
  }

  else
  {
    int v8 = -536870207;
  }

  *a5 = v8;
  return 0LL;
}

CFComparisonResult sub_100029A9C(const __CFNumber *a1, const __CFNumber *a2)
{
  return CFNumberCompare(a1, a2, 0LL);
}

uint64_t sub_100029AA4(uint64_t a1, _OWORD *a2, const UInt8 *a3, unsigned int a4, int *a5)
{
  __int128 v8 = a2[1];
  v30[0] = *a2;
  v30[1] = v8;
  if (!sub_1000382AC(v30, @"com.apple.private.iokit.powerlogging"))
  {
    int v24 = -536870207;
LABEL_19:
    *a5 = v24;
    goto LABEL_20;
  }

  __int128 v9 = CFDataCreateWithBytesNoCopy(0LL, a3, a4, kCFAllocatorNull);
  if (!v9)
  {
    CFDictionaryGetTypeID();
    goto LABEL_18;
  }

  uint64_t v10 = v9;
  CFPropertyListRef v11 = CFPropertyListCreateWithData(0LL, v9, 0LL, 0LL, 0LL);
  CFRelease(v10);
  CFTypeID TypeID = CFDictionaryGetTypeID();
  if (!v11)
  {
LABEL_18:
    int v24 = -536870206;
    goto LABEL_19;
  }

  if (CFGetTypeID(v11) != TypeID)
  {
    *a5 = -536870206;
    goto LABEL_22;
  }

  CFIndex Count = CFDictionaryGetCount((CFDictionaryRef)qword_100067A18);
  dispatch_time_t v14 = malloc(8 * Count);
  if (!v14)
  {
LABEL_22:
    CFRelease(v11);
    goto LABEL_20;
  }

  CFIndex v15 = v14;
  if (qword_100067A38) {
    CFRelease((CFTypeRef)qword_100067A38);
  }
  qword_100067A38 = (uint64_t)v11;
  bzero(v15, 8 * Count);
  CFDictionaryGetKeysAndValues((CFDictionaryRef)qword_100067A18, 0LL, (const void **)v15);
  if (Count >= 1)
  {
    CFIndex v16 = Count;
    int v17 = (const void ***)v15;
    do
    {
      if (!*v17) {
        break;
      }
      sub_100029D68(*v17++);
      --v16;
    }

    while (v16);
  }

  if (CFDictionaryGetCount((CFDictionaryRef)qword_100067A38))
  {
    if (!qword_100067A40)
    {
      __int128 v18 = sub_100038248();
      qword_100067A40 = (uint64_t)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  v18);
      dispatch_source_set_event_handler((dispatch_source_t)qword_100067A40, &stru_100059EE8);
      dispatch_source_set_cancel_handler((dispatch_source_t)qword_100067A40, &stru_100059F08);
      int v19 = sub_100019CD0();
      uint64_t v20 = qword_100067A40;
      if (v19)
      {
        dispatch_time_t v21 = dispatch_time(0xFFFFFFFFFFFFFFFFLL, 0LL);
        int v22 = (dispatch_source_s *)v20;
        uint64_t v23 = -1LL;
      }

      else
      {
        dispatch_time_t v21 = dispatch_time(0LL, 0LL);
        uint64_t v23 = qword_100066D80;
        int v22 = (dispatch_source_s *)v20;
      }

      dispatch_source_set_timer(v22, v21, v23, 0LL);
      dispatch_resume((dispatch_object_t)qword_100067A40);
      uint64_t v27 = getpid();
      sub_1000296E0(v27, 1);
    }

    if (Count && *v15)
    {
      CFDateRef v28 = (const void *)sub_1000279F8(1, *v15);
      if (v28) {
        CFRelease(v28);
      }
      char v29 = (const void *)sub_1000279F8(2, *v15);
      if (v29) {
        CFRelease(v29);
      }
    }
  }

  else if (qword_100067A40)
  {
    dispatch_source_cancel((dispatch_source_t)qword_100067A40);
    uint64_t v26 = getpid();
    sub_1000296E0(v26, 0);
    if (qword_100067A48)
    {
      CFRelease((CFTypeRef)qword_100067A48);
      qword_100067A48 = 0LL;
    }
  }

  *a5 = 0;
  free(v15);
LABEL_20:
  vm_deallocate(mach_task_self_, (vm_address_t)a3, a4);
  return 0LL;
}

CFTypeID sub_100029D68(const void **a1)
{
  uint64_t v2 = (const void *)qword_100067A38;
  CFTypeID result = CFDictionaryGetTypeID();
  if (v2)
  {
    CFTypeID v4 = result;
    CFTypeID result = CFGetTypeID(v2);
    if (result == v4)
    {
      uint64_t v5 = a1[10];
      CFTypeID result = CFStringGetTypeID();
      if (v5)
      {
        CFTypeID v6 = result;
        CFTypeID result = CFGetTypeID(v5);
        if (result == v6)
        {
          uint64_t valuePtr = 0LL;
          Value = (const __CFDictionary *)CFDictionaryGetValue( (CFDictionaryRef)qword_100067A38,  @"Default Limits");
          CFTypeID TypeID = CFDictionaryGetTypeID();
          if (Value && CFGetTypeID(Value) == TypeID)
          {
            __int128 v9 = (const __CFNumber *)CFDictionaryGetValue(Value, @"Asssertion Duration Limit");
            uint64_t v10 = (const __CFNumber *)CFDictionaryGetValue(Value, @"Aggregate Assertion Limit");
            CFTypeID v11 = CFNumberGetTypeID();
            if (v9 && CFGetTypeID(v9) == v11) {
              CFNumberGetValue(v9, kCFNumberIntType, (char *)&valuePtr + 4);
            }
            CFTypeID v12 = CFNumberGetTypeID();
            if (v10 && CFGetTypeID(v10) == v12) {
              CFNumberGetValue(v10, kCFNumberIntType, &valuePtr);
            }
          }

          __int128 v13 = (const __CFDictionary *)CFDictionaryGetValue((CFDictionaryRef)qword_100067A38, a1[10]);
          CFTypeID result = CFDictionaryGetTypeID();
          if (v13 && (v14 = result, CFTypeID result = CFGetTypeID(v13), result == v14))
          {
            CFIndex v15 = (const __CFNumber *)CFDictionaryGetValue(v13, @"Asssertion Duration Limit");
            CFIndex v16 = CFDictionaryGetValue(v13, @"Aggregate Assertion Limit");
            CFTypeID v17 = CFNumberGetTypeID();
            if (v15 && CFGetTypeID(v15) == v17) {
              CFNumberGetValue(v15, kCFNumberIntType, a1 + 16);
            }
            CFTypeID result = CFNumberGetTypeID();
            if (v16)
            {
              CFTypeID v18 = result;
              CFTypeID result = CFGetTypeID(v16);
              if (result == v18) {
                return CFNumberGetValue((CFNumberRef)v16, kCFNumberIntType, (char *)a1 + 132);
              }
            }
          }

          else
          {
            int v19 = valuePtr;
            *((_DWORD *)a1 + 32) = HIDWORD(valuePtr);
            *((_DWORD *)a1 + 33) = v19;
          }
        }
      }
    }
  }

  return result;
}

void sub_100029F4C(id a1)
{
  uint64_t v3 = 0LL;
  if (!sub_100019CD0())
  {
    if (qword_100067A48)
    {
      sub_100021FBC(&v3);
      if (v3)
      {
        uint64_t SamplesDelta = IOReportCreateSamplesDelta(qword_100067A48, v3, 0LL);
        uint64_t v2 = (const void *)SamplesDelta;
        if (SamplesDelta) {
          IOReportIterate(SamplesDelta, &stru_10005A1E0);
        }
      }

      else
      {
        uint64_t v2 = 0LL;
      }

      if (qword_100067A48) {
        CFRelease((CFTypeRef)qword_100067A48);
      }
      qword_100067A48 = v3;
      if (v2) {
        CFRelease(v2);
      }
    }

    else
    {
      sub_100021FBC(&qword_100067A48);
    }
  }

void sub_100029FFC(id a1)
{
  qword_100067A40 = 0LL;
}

uint64_t sub_10002A024(char a1)
{
  return (dword_1000673E4 >> a1) & 1;
}

uint64_t sub_10002A038(uint64_t result, int a2)
{
  int v2 = 1 << result;
  if (a2) {
    int v3 = dword_1000673E4 | v2;
  }
  else {
    int v3 = dword_1000673E4 & ~v2;
  }
  dword_1000673E4 = v3;
  return result;
}

uint64_t sub_10002A064()
{
  return dword_1000673E8;
}

uint64_t sub_10002A070(uint64_t result, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 24);
  int v2 = (void *)(a2 + 24);
  uint64_t v3 = v4;
  *(void *)CFTypeID result = v4;
  if (v4) {
    *(void *)(v3 + _Block_object_dispose(va, 8) = result;
  }
  *int v2 = result;
  *(void *)(result + _Block_object_dispose(va, 8) = v2;
  *(_DWORD *)(result + 24) = *(_DWORD *)(result + 24) & 0xFFFFFFFC | 2;
  return result;
}

uint64_t *sub_10002A09C(uint64_t *result)
{
  uint64_t v1 = *result;
  if (*result) {
    *(void *)(v1 + _Block_object_dispose(va, 8) = result[1];
  }
  *(void *)result[1] = v1;
  *((_DWORD *)result + 6) &= ~2u;
  return result;
}

void sub_10002A0C4(unint64_t a1, uint64_t a2, int a3)
{
  uint64_t v4 = *(void *)(a2 + 16);
  *(void *)a1 = v4;
  if (v4) {
    *(void *)(v4 + _Block_object_dispose(va, 8) = a1;
  }
  *(void *)(a2 + 16) = a1;
  *(void *)(a1 + _Block_object_dispose(va, 8) = a2 + 16;
  int v5 = *(_DWORD *)(a1 + 24);
  *(_DWORD *)(a1 + 24) = v5 & 0xFFFFFFDC;
  if ((*(_BYTE *)a2 & 1) != 0 && (v5 & 4) != 0) {
    ++*(_DWORD *)(a2 + 152);
  }
  if (a3)
  {
    sub_100028818(a1, 0);
    sub_100027FFC(a1, 0);
  }

  sub_100028794(a1);
}

void sub_10002A144(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v4 = *(void *)a1;
  if (*(void *)a1) {
    *(void *)(v4 + _Block_object_dispose(va, 8) = *(void *)(a1 + 8);
  }
  **(void **)(a1 + _Block_object_dispose(va, 8) = v4;
  if ((*(_BYTE *)(a1 + 24) & 4) != 0)
  {
    int v5 = *(_DWORD *)(a2 + 152);
    if (v5) {
      *(_DWORD *)(a2 + 152) = v5 - 1;
    }
  }

  if (a3)
  {
    sub_100028818(a1, 1LL);
    sub_100027FFC(a1, 1);
  }

  sub_1000285A0(a1);
}

void sub_10002A1B0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 8);
  if (v1)
  {
    unint64_t v3 = sub_100039ACC();
    unint64_t v4 = *(void *)(v1 + 40);
    BOOL v5 = v4 >= v3;
    BOOL v6 = v4 == v3;
    unint64_t v7 = v4 - v3;
    if (!v6 && v5)
    {
      __int128 v8 = *(dispatch_source_s **)(a1 + 48);
      dispatch_time_t v9 = dispatch_time(0LL, 1000000000 * v7);
      dispatch_source_set_timer(v8, v9, 0xFFFFFFFFFFFFFFFFLL, 0LL);
    }

    else
    {
      uint64_t v10 = sub_100038248();
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10002A260;
      block[3] = &unk_1000598E8;
      void block[4] = a1;
      dispatch_async(v10, block);
    }
  }

uint64_t sub_10002A260(uint64_t a1)
{
  return sub_10002A268(*(void *)(a1 + 32));
}

void sub_10002A268(uint64_t a1)
{
  unint64_t v2 = sub_100039ACC();
  uint64_t v3 = *(void *)(a1 + 8);
  if (v3)
  {
    unint64_t v4 = v2;
    char v5 = 0;
    int v6 = 0;
    unint64_t v7 = (uint64_t *)(a1 + 24);
    do
    {
      if (*(void *)(v3 + 40) > v4) {
        break;
      }
      uint64_t v8 = *(void *)v3;
      if (*(void *)v3) {
        *(void *)(v8 + _Block_object_dispose(va, 8) = *(void *)(v3 + 8);
      }
      **(void **)(v3 + _Block_object_dispose(va, 8) = v8;
      int v9 = *(_DWORD *)(v3 + 24);
      *(_DWORD *)(v3 + 24) = v9 & 0xFFFFFFFE;
      if ((v9 & 4) != 0)
      {
        int v10 = *(_DWORD *)(a1 + 152);
        if (v10) {
          *(_DWORD *)(a1 + 152) = v10 - 1;
        }
      }

      sub_100028818(v3, 1LL);
      sub_1000285A0(v3);
      sub_100027FFC(v3, 1);
      entr_act_end(4LL, 1LL, *(unsigned int *)(v3 + 52), 0x8000LL, 0x8000000000000000LL);
      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      CFDateRef v12 = CFDateCreate(0LL, Current);
      if (v12)
      {
        CFDateRef v13 = v12;
        CFDictionarySetValue(*(CFMutableDictionaryRef *)(v3 + 16), @"AssertTimedOutWhen", v12);
        CFRelease(v13);
      }

      if (*(_DWORD *)(v3 + 48) == 5)
      {
        int v14 = *(_DWORD *)(*(void *)(v3 + 72) + 96LL);
        v5 |= v14 != getpid();
      }

      Value = CFDictionaryGetValue(*(CFDictionaryRef *)(v3 + 16), @"TimeoutAction");
      if (*(void *)(*(void *)(v3 + 72) + 120LL)) {
        sub_100024098(v3);
      }
      if ((CFTypeID v16 = CFStringGetTypeID(), Value)
        && CFGetTypeID(Value) == v16
        && CFEqual(@"TimeoutActionRelease", Value)
        || CFDictionaryGetValue(*(CFDictionaryRef *)(v3 + 16), @"AsyncClientAssertionId"))
      {
        sub_10002E3F4((void *)v3, 4);
      }

      else
      {
        sub_10002002C(4, v3);
        int v17 = *(_DWORD *)(v3 + 24);
        uint64_t v18 = *v7;
        *(void *)uint64_t v3 = *v7;
        if (v18) {
          *(void *)(v18 + _Block_object_dispose(va, 8) = v3;
        }
        *unint64_t v7 = v3;
        *(void *)(v3 + _Block_object_dispose(va, 8) = v7;
        *(_DWORD *)(v3 + 24) = v17 & 0xFFFFFFDC | 0x22;
        CFTypeID TypeID = CFStringGetTypeID();
        if (Value && CFGetTypeID(Value) == TypeID && CFEqual(@"TimeoutActionKillProcess", Value)) {
          kill(*(_DWORD *)(*(void *)(v3 + 72) + 96LL), 15);
        }
      }

      uint64_t v3 = *(void *)(a1 + 8);
      ++v6;
    }

    while (v3);
    if (v6)
    {
      sub_10002A1B0(a1);
      if ((v5 & 1) != 0) {
        sub_100027678();
      }
      uint64_t v20 = *(void (**)(uint64_t, uint64_t))(a1 + 128);
      if (v20) {
        v20(a1, 1LL);
      }
      if (dword_1000673E0) {
        notify_post("com.apple.system.powermanagement.assertions.timeout");
      }
      if (dword_1000673DC) {
        notify_post("com.apple.system.powermanagement.assertions.anychange");
      }
    }
  }

void sub_10002A50C(uint64_t a1, uint64_t a2, int a3, int a4)
{
  uint64_t v8 = *(void *)(a2 + 8);
  uint64_t v9 = *(void *)a1;
  if (*(void *)a1) {
    *(void *)(v9 + _Block_object_dispose(va, 8) = *(void *)(a1 + 8);
  }
  **(void **)(a1 + _Block_object_dispose(va, 8) = v9;
  int v10 = *(_DWORD *)(a1 + 24);
  *(_DWORD *)(a1 + 24) = v10 & 0xFFFFFFFE;
  if ((v10 & 4) != 0)
  {
    int v11 = *(_DWORD *)(a2 + 152);
    if (v11) {
      *(_DWORD *)(a2 + 152) = v11 - 1;
    }
  }

  if (a4)
  {
    sub_100028818(a1, 1LL);
    sub_100027FFC(a1, 1);
  }

  sub_1000285A0(a1);
  if (v8 == a1)
  {
    if (a3) {
      sub_10002A1B0(a2);
    }
  }

void sub_10002A5D8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 8);
  if (v1)
  {
    if (!*(void *)(a1 + 48))
    {
      uint64_t v3 = sub_100038248();
      unint64_t v4 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, v3);
      *(void *)(a1 + 4_Block_object_dispose(va, 8) = v4;
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472LL;
      handler[2] = sub_10002A71C;
      handler[3] = &unk_1000598E8;
      void handler[4] = a1;
      dispatch_source_set_event_handler(v4, handler);
      char v5 = *(dispatch_source_s **)(a1 + 48);
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472LL;
      v14[2] = sub_10002A724;
      v14[3] = &unk_1000598E8;
      v14[4] = a1;
      dispatch_source_set_cancel_handler(v5, v14);
      dispatch_resume(*(dispatch_object_t *)(a1 + 48));
    }

    unint64_t v6 = sub_100039ACC();
    unint64_t v7 = *(void *)(v1 + 40);
    BOOL v8 = v7 > v6;
    unint64_t v9 = v7 - v6;
    if (v8)
    {
      int v10 = *(dispatch_source_s **)(a1 + 48);
      dispatch_time_t v11 = dispatch_time(0LL, 1000000000 * v9);
      dispatch_source_set_timer(v10, v11, 0xFFFFFFFFFFFFFFFFLL, 0LL);
    }

    else
    {
      CFDateRef v12 = sub_100038248();
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10002A730;
      block[3] = &unk_1000598E8;
      void block[4] = a1;
      dispatch_async(v12, block);
    }
  }

void sub_10002A71C(uint64_t a1)
{
}

void sub_10002A724(uint64_t a1)
{
}

void sub_10002A730(uint64_t a1)
{
}

void sub_10002A738(uint64_t a1, uint64_t a2, int a3, int a4)
{
  int v8 = *(_DWORD *)(a1 + 24);
  *(_DWORD *)(a1 + 24) = v8 & 0xFFFFFFDE | 1;
  if ((*(_BYTE *)a2 & 1) != 0 && (v8 & 4) != 0) {
    ++*(_DWORD *)(a2 + 152);
  }
  if (a4)
  {
    sub_100028818(a1, 0LL);
    sub_100027FFC(a1, 0);
  }

  sub_100028794(a1);
  if (*(void *)(a2 + 8) == a1 && a3 != 0) {
    sub_10002A5D8(a2);
  }
}

void sub_10002A7DC(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_100039ACC();
  unint64_t v5 = *(void *)(a1 + 40);
  BOOL v6 = v5 > v4;
  unint64_t v7 = v5 - v4;
  if (v6)
  {
    unint64_t valuePtr = v7;
    CFNumberRef v8 = CFNumberCreate(0LL, kCFNumberLongType, &valuePtr);
    if (v8)
    {
      CFNumberRef v9 = v8;
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 16), @"AssertTimeoutTimeLeft", v8);
      CFRelease(v9);
    }

    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    CFDateRef v11 = CFDateCreate(0LL, Current);
    if (v11)
    {
      CFDateRef v12 = v11;
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 16), @"AssertTimeoutUpdateTime", v11);
      CFRelease(v12);
    }
  }

  CFIndex v15 = *(void **)(a2 + 8);
  int v14 = (void *)(a2 + 8);
  CFDateRef v13 = v15;
  if (v15)
  {
    while (1)
    {
      CFTypeID v16 = v13;
      if (v13[5] > *(void *)(a1 + 40)) {
        break;
      }
      CFDateRef v13 = (void *)*v13;
      if (!*v16)
      {
        *(void *)a1 = 0LL;
        *CFTypeID v16 = a1;
        *(void *)(a1 + _Block_object_dispose(va, 8) = v16;
        return;
      }
    }

    uint64_t v17 = v13[1];
    *(void *)a1 = v13;
    *(void *)(a1 + _Block_object_dispose(va, 8) = v17;
    *(void *)v13[1] = a1;
    v13[1] = a1;
  }

  else
  {
    *int v14 = a1;
    *(void *)a1 = 0LL;
    *(void *)(a1 + _Block_object_dispose(va, 8) = v14;
  }

void sub_10002A8D8(uint64_t a1, uint64_t a2)
{
  int v3 = *(_DWORD *)(a1 + 32);
  if (*(_DWORD *)(*(void *)(a2 + 72) + 96LL) == v3 || *(_DWORD *)(a2 + 80) == v3)
  {
    unsigned int v4 = *(_DWORD *)(a2 + 48);
    if (*(void *)(a2 + 40))
    {
      unint64_t v5 = sub_100039ACC();
      unint64_t v6 = *(void *)(a2 + 40);
      BOOL v7 = v6 > v5;
      unint64_t v8 = v6 - v5;
      if (v7)
      {
        unint64_t valuePtr = v8;
        CFNumberRef v9 = CFNumberCreate(0LL, kCFNumberLongType, &valuePtr);
        CFDictionarySetValue(*(CFMutableDictionaryRef *)(a2 + 16), @"_AssertTimeoutOnResume", v9);
        CFRelease(v9);
      }
    }

    sub_10002E4FC(a2, 0);
    *(_DWORD *)(a2 + 24) |= 0x400u;
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a2 + 16), @"AssertionIsStateSuspended", kCFBooleanTrue);
    sub_10002002C(10, a2);
    int v10 = (char *)&unk_100067A90 + 160 * v4;
    uint64_t v13 = *((void *)v10 + 4);
    CFDateRef v11 = (uint64_t *)(v10 + 32);
    uint64_t v12 = v13;
    *(void *)a2 = v13;
    if (v13) {
      *(void *)(v12 + _Block_object_dispose(va, 8) = a2;
    }
    uint64_t *v11 = a2;
    *(void *)(a2 + _Block_object_dispose(va, 8) = v11;
  }

void sub_10002A9DC(uint64_t a1, unint64_t a2)
{
  int v3 = *(_DWORD *)(a1 + 32);
  if (*(_DWORD *)(*(void *)(a2 + 72) + 96LL) == v3 || *(_DWORD *)(a2 + 80) == v3)
  {
    uint64_t v4 = *(void *)a2;
    if (*(void *)a2) {
      *(void *)(v4 + _Block_object_dispose(va, 8) = *(void *)(a2 + 8);
    }
    **(void **)(a2 + _Block_object_dispose(va, 8) = v4;
    *(_DWORD *)(a2 + 24) &= ~0x400u;
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a2 + 16), @"AssertionIsStateSuspended", kCFBooleanFalse);
    unint64_t v5 = sub_100039ACC();
    int v6 = *(_DWORD *)(a2 + 48);
    int valuePtr = 0;
    Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a2 + 16), @"AssertLevel");
    CFTypeID TypeID = CFNumberGetTypeID();
    if (Value
      && CFGetTypeID(Value) == TypeID
      && (CFNumberGetValue((CFNumberRef)Value, kCFNumberIntType, &valuePtr), !valuePtr))
    {
      uint64_t v12 = &byte_100067A90[160 * v6];
      uint64_t v15 = *((void *)v12 + 3);
      uint64_t v13 = (unint64_t *)(v12 + 24);
      uint64_t v14 = v15;
      *(void *)a2 = v15;
      if (v15) {
        *(void *)(v14 + _Block_object_dispose(va, 8) = a2;
      }
      *uint64_t v13 = a2;
      *(void *)(a2 + _Block_object_dispose(va, 8) = v13;
      *(_DWORD *)(a2 + 24) = *(_DWORD *)(a2 + 24) & 0xFFFFFFFC | 2;
    }

    else
    {
      CFNumberRef v9 = &byte_100067A90[160 * v6];
      double v16 = 0.0;
      int v10 = CFDictionaryGetValue(*(CFDictionaryRef *)(a2 + 16), @"_AssertTimeoutOnResume");
      CFTypeID v11 = CFNumberGetTypeID();
      if (v10
        && CFGetTypeID(v10) == v11
        && (CFNumberGetValue((CFNumberRef)v10, kCFNumberDoubleType, &v16),
            CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a2 + 16), @"_AssertTimeoutOnResume"),
            v16 != 0.0))
      {
        *(void *)(a2 + 4sub_1000262C4(0x12u, 0) = v5 + (unint64_t)v16;
        sub_10002A738(a2, (uint64_t)v9, 1, 0);
      }

      else
      {
        sub_10002A0C4(a2, (uint64_t)v9, 0);
      }

      sub_10002002C(11, a2);
    }
  }

uint64_t sub_10002ABAC(uint64_t result)
{
  if ((_DWORD)result)
  {
    for (uint64_t i = *((void *)&unk_100068738 + 2 * result); i; uint64_t i = *(void *)(i + 112))
    {
      if ((*(_BYTE *)i & 1) != 0 && !sub_100019CD0())
      {
        if (*(_DWORD *)(i + 152)) {
          return 1LL;
        }
      }

      else if (*(void *)(i + 16) || *(void *)(i + 8))
      {
        return 1LL;
      }
    }

    return 0LL;
  }

  return result;
}

uint64_t sub_10002AC1C(uint64_t a1, _BYTE *a2)
{
  if (a2) {
    *a2 = 0;
  }
  uint64_t v4 = *(unsigned int *)(a1 + 104);
  if ((_DWORD)v4)
  {
    uint64_t v5 = *((void *)&unk_100068738 + 2 * v4);
    if (v5)
    {
      char v6 = 0;
      while (1)
      {
        if ((*(_BYTE *)v5 & 1) != 0 && !sub_100019CD0())
        {
          BOOL v8 = *(_DWORD *)(v5 + 152) == 0;
        }

        else
        {
          if (*(void *)(v5 + 16))
          {
            int v7 = 1;
            if (!a2) {
              goto LABEL_19;
            }
            goto LABEL_17;
          }

          BOOL v8 = *(void *)(v5 + 8) == 0LL;
        }

        int v7 = !v8;
        if (!a2) {
          goto LABEL_19;
        }
LABEL_17:
        if (v5 == a1 && v7)
        {
          char v6 = 1;
          *a2 = 1;
          return v6 & 1;
        }

LABEL_19:
        char v9 = v7 ^ 1;
        if (a2) {
          char v9 = 1;
        }
        if ((v9 & 1) == 0)
        {
          char v6 = 1;
          return v6 & 1;
        }

        v6 |= v7;
        uint64_t v5 = *(void *)(v5 + 112);
        if (!v5) {
          return v6 & 1;
        }
      }
    }
  }

  char v6 = 0;
  return v6 & 1;
}

    testQualifiedQMaxDate = self->_testQualifiedQMaxDate;
    if (testQualifiedQMaxDate)
    {
      -[NSNumber doubleValue](testQualifiedQMaxDate, "doubleValue");
      BOOL v8 = (id)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:"));
      int v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
      [v24 timeIntervalSinceDate:v8];
      uint64_t v26 = v25;

      if (v26 >= 108000.0)
      {
        uint64_t v31 = (void *)qword_100068818;
        if (os_log_type_enabled((os_log_t)qword_100068818, OS_LOG_TYPE_DEFAULT))
        {
          BOOL v32 = v31;
          uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
          [v33 timeIntervalSinceDate:self->_lastQualifiedQmaxDate];
          unsigned int v40 = 134217984;
          int v41 = v34 / 3600.0;
          _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "(Test) QMax update necessary, but last qualQmax was too long ago (%.1f hours)",  (uint8_t *)&v40,  0xCu);
        }

        goto LABEL_28;
      }

      goto LABEL_23;
    }

    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    [v27 timeIntervalSinceDate:self->_lastQualifiedQmaxDate];
    char v29 = v28;

    if (v29 < 108000.0)
    {
LABEL_23:
      int v30 = (os_log_s *)qword_100068818;
      if (os_log_type_enabled((os_log_t)qword_100068818, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v40 = 134217984;
        int v41 = a3 / 86400.0;
        _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "Last QMax Change: %.1f days ago; charge to full now",
          (uint8_t *)&v40,
          0xCu);
      }

      -[BatteryGaugingAccuracyManager incrAnalyticsMetricsAttribute:]( self,  "incrAnalyticsMetricsAttribute:",  &self->_numOfQmaxRequested);
      uint64_t v14 = 1;
      goto LABEL_34;
    }

    uint64_t v35 = (void *)qword_100068818;
    if (os_log_type_enabled((os_log_t)qword_100068818, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v36 = v35;
      uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
      [v37 timeIntervalSinceDate:self->_lastQualifiedQmaxDate];
      unsigned int v40 = 134217984;
      int v41 = v38 / 3600.0;
      _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "QMax update necessary, but last qualQmax was too long ago (%.1f hours)",  (uint8_t *)&v40,  0xCu);
    }

    p_numOfQmaxTooRecent = &self->_numOfQmaxTooOld;
LABEL_32:
    -[BatteryGaugingAccuracyManager incrAnalyticsMetricsAttribute:]( self,  "incrAnalyticsMetricsAttribute:",  p_numOfQmaxTooRecent);
    goto LABEL_33;
  }

  uint64_t v13 = (void *)qword_100068818;
  uint64_t v14 = 0;
  if (os_log_type_enabled((os_log_t)qword_100068818, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = self->_testQualifiedQMaxDOD0Value;
    BOOL v8 = v13;
    unsigned int v40 = 67109120;
    LODWORD(v41) = -[NSNumber intValue](v15, "intValue");
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v8,  OS_LOG_TYPE_DEFAULT,  "(Test) QMax update necessary, but dod0 at last qual Qmax was too small (%d)",  (uint8_t *)&v40,  8u);
LABEL_28:

LABEL_33:
    uint64_t v14 = 0;
  }

uint64_t sub_10002ACF4()
{
  return sub_10002AC1C((uint64_t)&unk_100067EF0, 0LL);
}

uint64_t sub_10002AD04(unsigned int a1)
{
  unsigned __int8 v2 = 0;
  sub_10002AC1C((uint64_t)&unk_100067A90 + 160 * a1, &v2);
  return v2;
}

BOOL sub_10002AD3C(unsigned int a1)
{
  return *((void *)&unk_100067A90 + 20 * a1 + 2) || *((void *)&unk_100067A90 + 20 * a1 + 1) != 0LL;
}

BOOL sub_10002AD78()
{
  return dword_100068710 + dword_100068714 != 0;
}

BOOL sub_10002AD90()
{
  return dword_100068724 != 0;
}

BOOL sub_10002ADA4()
{
  return dword_100068728 != 0;
}

uint64_t sub_10002ADB8(int a1)
{
  if (a1)
  {
    if ((byte_1000673EC & 1) == 0)
    {
      ++dword_100067BB8;
      sub_1000262C4(1u, 0);
      ++dword_100068298;
      sub_1000262C4(0xCu, 0);
      ++dword_1000681F8;
      sub_1000262C4(0xBu, 0);
      int v2 = dword_100068158 + 1;
      goto LABEL_13;
    }
  }

  else if (byte_1000673EC)
  {
    if (dword_100067BB8) {
      --dword_100067BB8;
    }
    sub_1000262C4(1u, 0);
    if (dword_100068298) {
      --dword_100068298;
    }
    sub_1000262C4(0xCu, 0);
    if (dword_1000681F8) {
      --dword_1000681F8;
    }
    sub_1000262C4(0xBu, 0);
    if (!dword_100068158) {
      goto LABEL_14;
    }
    int v2 = dword_100068158 - 1;
LABEL_13:
    dword_100068158 = v2;
LABEL_14:
    sub_1000262C4(0xAu, 0);
    uint64_t result = 0LL;
    byte_1000673EC = a1 != 0;
    return result;
  }

  return 3758097093LL;
}

uint64_t sub_10002AEEC(uint64_t result, int a2)
{
  if (a2 != 2)
  {
    uint64_t v3 = result;
    uint64_t result = sub_10002AC1C(result, 0LL);
    int v4 = *(_DWORD *)(v3 + 40);
    int v5 = 1 << v4;
    int v6 = dword_1000673E4 & (1 << v4);
    if (a2)
    {
      if (v6) {
        char v7 = result;
      }
      else {
        char v7 = 1;
      }
      if ((v7 & 1) == 0)
      {
        int v8 = dword_1000673E4 & ~v5;
        goto LABEL_13;
      }
    }

    else
    {
      if (v6) {
        int v9 = 0;
      }
      else {
        int v9 = result;
      }
      if (v9 == 1)
      {
        int v8 = dword_1000673E4 | v5;
LABEL_13:
        dword_1000673E4 = v8;
        if (v4 == 4)
        {
          uint64_t result = sub_1000384DC(@"BatteryWarningsDisabled", kCFBooleanTrue);
        }

        else
        {
          if (v4 == 3)
          {
            BOOL v10 = a2 == 0;
            int v11 = 1;
          }

          else
          {
            if (v4 != 2) {
              goto LABEL_20;
            }
            BOOL v10 = a2 == 0;
            int v11 = 0;
          }

          uint64_t result = sub_10002AFD4(v11, v10);
        }

uint64_t sub_10002AFD4(int a1, int a2)
{
  kern_return_t MatchingServices;
  uint64_t result;
  BOOL v7;
  io_object_t v8;
  io_registry_entry_t v9;
  CFStringRef v10;
  const CFBooleanRef *v11;
  CFBooleanRef v12;
  io_iterator_t existing;
  int v4 = IOServiceMatching("IOPMPowerSource");
  MatchingServices = IOServiceGetMatchingServices(kIOMainPortDefault, v4, &existing);
  uint64_t result = existing;
  if (MatchingServices) {
    char v7 = 1;
  }
  else {
    char v7 = existing == 0;
  }
  if (!v7)
  {
    int v8 = IOIteratorNext(existing);
    if (v8)
    {
      int v9 = v8;
      if (a1 == 1) {
        BOOL v10 = @"IsCharging";
      }
      else {
        BOOL v10 = @"ExternalConnected";
      }
      int v11 = &kCFBooleanTrue;
      if (a2) {
        int v11 = &kCFBooleanFalse;
      }
      uint64_t v12 = *v11;
      do
      {
        IORegistryEntrySetCFProperty(v9, v10, v12);
        IOObjectRelease(v9);
        int v9 = IOIteratorNext(existing);
      }

      while (v9);
    }

    return IOObjectRelease(existing);
  }

  return result;
}

void sub_10002B0B0(uint64_t a1, int a2)
{
  if (!*(_DWORD *)(a1 + 104)) {
    return;
  }
  int v4 = sub_10002AC1C(a1, &v17);
  unsigned int v5 = *(_DWORD *)(a1 + 40);
  int v6 = v4;
  int v7 = 1;
  switch(v5)
  {
    case 5u:
    case 9u:
    case 0x10u:
      int v7 = 64;
      goto LABEL_5;
    case 7u:
    case 0xBu:
    case 0xDu:
    case 0x11u:
    case 0x12u:
      goto LABEL_5;
    case 8u:
      int v7 = 16;
      unsigned int v5 = 8;
      goto LABEL_5;
    case 0xAu:
      int v8 = dword_1000673E4;
      if (v17)
      {
        unsigned int v5 = 10;
LABEL_6:
        int v9 = v8 | (1 << v5);
        goto LABEL_13;
      }

      if ((dword_1000673E4 & 0x400) != 0)
      {
        sub_10001D308(*(_DWORD *)(a1 + 80));
        unsigned int v5 = *(_DWORD *)(a1 + 40);
      }

      else
      {
        unsigned int v5 = 10;
      }

LABEL_5:
      int v8 = dword_1000673E4;
      if (v17) {
        goto LABEL_6;
      }
      int v10 = 1 << v5;
      if ((dword_1000673E4 & (1 << v5)) != 0)
      {
        if (*(void *)(a1 + 72))
        {
          if ((*(_BYTE *)a1 & 2) != 0)
          {
            *(void *)(a1 + 72) = 0LL;
            int v11 = *(dispatch_source_s **)(a1 + 56);
            if (v11)
            {
              dispatch_source_cancel(v11);
              unsigned int v5 = *(_DWORD *)(a1 + 40);
              int v8 = dword_1000673E4;
              int v10 = 1 << v5;
            }
          }
        }
      }

      int v9 = v8 & ~v10;
LABEL_13:
      dword_1000673E4 = v9;
      if (v5 <= 0x11 && ((1 << v5) & 0x24220) != 0) {
        sub_100036070();
      }
      if (a2 == 1)
      {
        int v12 = dword_1000673E8;
        if ((dword_1000673E8 & v7) != 0) {
          char v14 = v6;
        }
        else {
          char v14 = 1;
        }
        if ((v14 & 1) != 0) {
          return;
        }
        goto LABEL_30;
      }

      if (a2)
      {
        int v12 = dword_1000673E8;
        int v15 = dword_1000673E8 & v7;
        if (!v6)
        {
          if (!v15) {
            return;
          }
          goto LABEL_36;
        }

        if (v15) {
          return;
        }
LABEL_34:
        unsigned int v16 = v12 | v7;
        goto LABEL_37;
      }

      if (*(_DWORD *)(a1 + 40) == 9 && v17)
      {
        sub_100026124();
        sub_10001E068();
      }

      int v12 = dword_1000673E8;
      if ((dword_1000673E8 & v7) != 0) {
        char v13 = 0;
      }
      else {
        char v13 = v6;
      }
      if ((v13 & 1) != 0)
      {
LABEL_30:
        if (!v6)
        {
LABEL_36:
          unsigned int v16 = v12 & ~v7;
LABEL_37:
          dword_1000673E8 = v16;
          sub_10002B29C(v16);
          if (dword_1000673C8) {
            notify_post("com.apple.system.powermanagement.assertions");
          }
          return;
        }

        goto LABEL_34;
      }

      return;
    default:
      return;
  }

uint64_t sub_10002B29C(unsigned int a1)
{
  uint64_t input = a1;
  uint64_t result = sub_10001E634();
  if ((_DWORD)result) {
    return IOConnectCallMethod(result, 9u, &input, 1u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }
  return result;
}

void sub_10002B2E8(uint64_t a1)
{
  if ((*(_BYTE *)a1 & 2) != 0)
  {
    *(_DWORD *)(a1 + 8sub_1000262C4(0x12u, 0) = 0;
    for (uint64_t i = *(void *)(a1 + 16); i; uint64_t i = *(void *)(a1 + 16))
    {
      sub_10002A144(i, a1, 1);
      uint64_t v3 = *(void *)(a1 + 24);
      *(void *)uint64_t i = v3;
      if (v3) {
        *(void *)(v3 + _Block_object_dispose(va, 8) = i;
      }
      *(void *)(a1 + 24) = i;
      *(void *)(i + _Block_object_dispose(va, 8) = a1 + 24;
      *(_DWORD *)(i + 24) = *(_DWORD *)(i + 24) & 0xFFFFFFFC | 2;
      ++*(_DWORD *)(a1 + 80);
      sub_10002002C(5, i);
      nullsub_4(3LL, i);
    }

    unint64_t v4 = *(void *)(a1 + 8);
    if (v4)
    {
      unsigned int v5 = (uint64_t *)(a1 + 24);
      do
      {
        uint64_t v6 = *(void *)v4;
        if (*(void *)v4) {
          *(void *)(v6 + _Block_object_dispose(va, 8) = *(void *)(v4 + 8);
        }
        **(void **)(v4 + _Block_object_dispose(va, 8) = v6;
        *(_DWORD *)(v4 + 24) &= ~1u;
        sub_100028818(v4, 1);
        sub_1000285A0(v4);
        sub_100027FFC(v4, 1);
        uint64_t v7 = *v5;
        *(void *)unint64_t v4 = *v5;
        if (v7) {
          *(void *)(v7 + _Block_object_dispose(va, 8) = v4;
        }
        *(void *)(a1 + 24) = v4;
        *(void *)(v4 + _Block_object_dispose(va, 8) = v5;
        *(_DWORD *)(v4 + 24) = *(_DWORD *)(v4 + 24) & 0xFFFFFFFC | 2;
        ++*(_DWORD *)(a1 + 80);
        sub_10002002C(5, v4);
        nullsub_4(3LL, v4);
        unint64_t v4 = *(void *)(a1 + 8);
      }

      while (v4);
    }

    sub_10002A1B0(a1);
    int v8 = *(void (**)(uint64_t, uint64_t))(a1 + 128);
    if (v8) {
      v8(a1, 1LL);
    }
    if (!*(_DWORD *)(a1 + 80)) {
      sub_10001D308(0);
    }
  }

void sub_10002B464(int a1)
{
  unint64_t v2 = sub_100039ACC();
  char v17 = 0LL;
  int v3 = a1 - dword_100067A20;
  if (a1 != dword_100067A20)
  {
    unint64_t v4 = v2;
    dword_100067A20 = a1;
    unsigned int v5 = (void *)qword_100068038;
    if (qword_100068038)
    {
      uint64_t v6 = 60 * v3;
      do
      {
        unint64_t v7 = (unint64_t)v5;
        unsigned int v5 = (void *)*v5;
        if ((*(_BYTE *)(v7 + 24) & 0x10) != 0)
        {
          if (dword_100067A20)
          {
            if (v5) {
              v5[1] = *(void *)(v7 + 8);
            }
            **(void **)(v7 + _Block_object_dispose(va, 8) = v5;
            unint64_t v8 = *(void *)(v7 + 40) + v6;
            if (v8 <= v4) {
              unint64_t v8 = v4;
            }
            *(void *)(v7 + 4sub_1000262C4(0x12u, 0) = v8;
            int v9 = v17;
            *(void *)unint64_t v7 = v17;
            if (v9) {
              v9[1] = v7;
            }
            char v17 = (void *)v7;
            *(void *)(v7 + _Block_object_dispose(va, 8) = &v17;
          }

          else
          {
            sub_10002A50C(v7, (uint64_t)&unk_100068030, 0, 1);
            *(void *)(v7 + 4sub_1000262C4(0x12u, 0) = 0LL;
            sub_10002A0C4(v7, (uint64_t)&unk_100068030, 1);
          }
        }
      }

      while (v5);
      for (uint64_t i = v17; v17; uint64_t i = v17)
      {
        uint64_t v11 = *i;
        if (*i) {
          *(void *)(v11 + _Block_object_dispose(va, 8) = i[1];
        }
        *(void *)i[1] = v11;
        sub_10002A7DC((uint64_t)i, (uint64_t)&unk_100068030);
      }
    }

    uint64_t v12 = qword_100068040;
    int v13 = dword_100067A20;
    if (qword_100068040) {
      BOOL v14 = dword_100067A20 == 0;
    }
    else {
      BOOL v14 = 1;
    }
    if (!v14)
    {
      do
      {
        uint64_t v15 = *(void *)v12;
        if ((*(_BYTE *)(v12 + 24) & 0x10) != 0)
        {
          *(void *)(v12 + 4sub_1000262C4(0x12u, 0) = v4 + (60 * v13);
          sub_10002A144(v12, (uint64_t)&unk_100068030, 1);
          sub_10002A738(v12, (uint64_t)&unk_100068030, 0, 1);
          int v13 = dword_100067A20;
        }

        if (v15) {
          BOOL v16 = v13 == 0;
        }
        else {
          BOOL v16 = 1;
        }
        uint64_t v12 = v15;
      }

      while (!v16);
    }

    sub_10002A5D8((uint64_t)&unk_100068030);
    if (off_1000680B0) {
      ((void (*)(void *, uint64_t))off_1000680B0)(&unk_100068030, 1LL);
    }
    if (dword_1000673E0) {
      notify_post("com.apple.system.powermanagement.assertions.timeout");
    }
    if (dword_1000673DC) {
      notify_post("com.apple.system.powermanagement.assertions.anychange");
    }
  }

void sub_10002B670()
{
  unint64_t v0 = sub_100039ACC();
  BOOL v14 = 0LL;
  uint64_t v15 = qword_100067A28;
  sub_100030F9C(&v15);
  uint64_t v1 = v15 - qword_100067A28;
  uint64_t v2 = 60 * (v15 - qword_100067A28);
  qword_100067A28 = v15;
  if (60 * v1)
  {
    int v3 = (void *)qword_100068538;
    if (qword_100068538)
    {
      do
      {
        unint64_t v4 = (unint64_t)v3;
        int v3 = (void *)*v3;
        if ((*(_BYTE *)(v4 + 24) & 0x10) != 0)
        {
          if (qword_100067A28)
          {
            if (v3) {
              v3[1] = *(void *)(v4 + 8);
            }
            **(void **)(v4 + _Block_object_dispose(va, 8) = v3;
            unint64_t v5 = *(void *)(v4 + 40) + v2;
            if (v5 <= v0) {
              unint64_t v5 = v0;
            }
            *(void *)(v4 + 4sub_1000262C4(0x12u, 0) = v5;
            uint64_t v6 = v14;
            *(void *)unint64_t v4 = v14;
            if (v6) {
              v6[1] = v4;
            }
            BOOL v14 = (void *)v4;
            *(void *)(v4 + _Block_object_dispose(va, 8) = &v14;
          }

          else
          {
            sub_10002A50C(v4, (uint64_t)&unk_100068530, 0, 1);
            *(void *)(v4 + 4sub_1000262C4(0x12u, 0) = 0LL;
            sub_10002A0C4(v4, (uint64_t)&unk_100068530, 1);
          }
        }
      }

      while (v3);
      for (uint64_t i = v14; v14; uint64_t i = v14)
      {
        uint64_t v8 = *i;
        if (*i) {
          *(void *)(v8 + _Block_object_dispose(va, 8) = i[1];
        }
        *(void *)i[1] = v8;
        sub_10002A7DC((uint64_t)i, (uint64_t)&unk_100068530);
      }
    }

    uint64_t v9 = qword_100068540;
    uint64_t v10 = qword_100067A28;
    if (qword_100068540) {
      BOOL v11 = qword_100067A28 == 0;
    }
    else {
      BOOL v11 = 1;
    }
    if (!v11)
    {
      do
      {
        uint64_t v12 = *(void *)v9;
        if ((*(_BYTE *)(v9 + 24) & 0x10) != 0)
        {
          *(void *)(v9 + 4sub_1000262C4(0x12u, 0) = v0 + 60 * v10;
          sub_10002A144(v9, (uint64_t)&unk_100068530, 1);
          sub_10002A738(v9, (uint64_t)&unk_100068530, 0, 1);
          uint64_t v10 = qword_100067A28;
        }

        if (v12) {
          BOOL v13 = v10 == 0;
        }
        else {
          BOOL v13 = 1;
        }
        uint64_t v9 = v12;
      }

      while (!v13);
    }

    sub_10002A5D8((uint64_t)&unk_100068530);
    if (off_1000685B0) {
      ((void (*)(void *, uint64_t))off_1000685B0)(&unk_100068530, 1LL);
    }
    if (dword_1000673E0) {
      notify_post("com.apple.system.powermanagement.assertions.timeout");
    }
    if (dword_1000673DC) {
      notify_post("com.apple.system.powermanagement.assertions.anychange");
    }
  }

void sub_10002B880()
{
  uint64_t v0 = qword_100068630;
  v1[0] = _NSConcreteStackBlock;
  v1[1] = 3221225472LL;
  v1[2] = sub_10002B92C;
  v1[3] = &unk_100059F48;
  v1[4] = sub_100039ACC() + v0;
  void v1[5] = &unk_1000685D0;
  sub_100027F30((uint64_t)&unk_1000685D0, 3u, (uint64_t)v1);
  sub_10002A5D8((uint64_t)&unk_1000685D0);
  if (dword_1000673E0) {
    notify_post("com.apple.system.powermanagement.assertions.timeout");
  }
  if (dword_1000673DC) {
    notify_post("com.apple.system.powermanagement.assertions.anychange");
  }
}

void sub_10002B92C(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(a2 + 40) > v2)
  {
    *(void *)(a2 + 4sub_1000262C4(0x12u, 0) = v2;
    CFNumberRef v4 = CFNumberCreate(0LL, kCFNumberLongType, (const void *)(*(void *)(a1 + 40) + 96LL));
    if (v4)
    {
      CFNumberRef v5 = v4;
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(a2 + 16), @"AssertTimeoutTimeLeft", v4);
      CFRelease(v5);
    }

    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    CFDateRef v7 = CFDateCreate(0LL, Current);
    if (v7)
    {
      CFDateRef v8 = v7;
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(a2 + 16), @"AssertTimeoutUpdateTime", v7);
      CFRelease(v8);
    }
  }

void sub_10002B9CC(unsigned int a1)
{
  if (a1 || qword_100068118)
  {
    if ((byte_1000680D0 & 2) == 0)
    {
LABEL_7:
      if (!a1)
      {
        unint64_t v2 = sub_100038248();
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_10002BB60;
        block[3] = &unk_1000598E8;
        void block[4] = &byte_1000680D0;
        dispatch_async(v2, block);
      }

      return;
    }

    qword_100068118 = a1 / 0x3E8uLL;
    if (a1 <= 0x3E7)
    {
      if (qword_100068108) {
        dispatch_source_cancel((dispatch_source_t)qword_100068108);
      }
      goto LABEL_7;
    }

    if (qword_100068108)
    {
      dispatch_suspend((dispatch_object_t)qword_100068108);
    }

    else
    {
      int v3 = sub_100038248();
      qword_100068108 = (uint64_t)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  v3);
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472LL;
      handler[2] = sub_10002F274;
      handler[3] = &unk_1000598E8;
      void handler[4] = &byte_1000680D0;
      dispatch_source_set_event_handler((dispatch_source_t)qword_100068108, handler);
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472LL;
      void v7[2] = sub_10002F27C;
      v7[3] = &unk_1000598E8;
      void v7[4] = &byte_1000680D0;
      dispatch_source_set_cancel_handler((dispatch_source_t)qword_100068108, v7);
    }

    CFNumberRef v4 = (dispatch_source_s *)qword_100068108;
    dispatch_time_t v5 = dispatch_time(0LL, 1000000000 * qword_100068118);
    dispatch_source_set_timer(v4, v5, 0xFFFFFFFFFFFFFFFFLL, 0LL);
    dispatch_resume((dispatch_object_t)qword_100068108);
  }

void sub_10002BB60(uint64_t a1)
{
}

void sub_10002BB68(uint64_t a1, int a2)
{
  char v18 = 0;
  if (!*(_DWORD *)(a1 + 104)) {
    return;
  }
  int v4 = *(_DWORD *)(a1 + 40);
  int v5 = dword_1000673E4;
  int v6 = sub_10002AC1C(a1, &v18);
  unsigned int v7 = *(_DWORD *)(a1 + 40);
  if (v18)
  {
    int v8 = dword_1000673E4 | (1 << v7);
  }

  else
  {
    int v9 = dword_1000673E4;
    int v10 = 1 << v7;
    if ((dword_1000673E4 & (1 << v7)) != 0)
    {
      if (*(void *)(a1 + 72))
      {
        if ((*(_BYTE *)a1 & 2) != 0)
        {
          *(void *)(a1 + 72) = 0LL;
          BOOL v11 = *(dispatch_source_s **)(a1 + 56);
          if (v11)
          {
            dispatch_source_cancel(v11);
            unsigned int v7 = *(_DWORD *)(a1 + 40);
            int v9 = dword_1000673E4;
            int v10 = 1 << v7;
          }
        }
      }
    }

    int v8 = v9 & ~v10;
  }

  int v12 = 1 << v4;
  dword_1000673E4 = v8;
  if (v7 <= 0x11 && ((1 << v7) & 0x24220) != 0) {
    sub_100036070();
  }
  int v13 = v5 & v12;
  if (a2 != 1)
  {
    if (!a2)
    {
      if (v13) {
        char v14 = 0;
      }
      else {
        char v14 = v6;
      }
      if ((v14 & 1) == 0) {
        return;
      }
      goto LABEL_27;
    }

    if (v6)
    {
      if (v13) {
        return;
      }
LABEL_27:
      int v16 = 1;
LABEL_30:
      uint64_t v17 = *(int *)(a1 + 40);
      if (v17 <= 0x13 && ((0xE9803u >> v17) & 1) != 0)
      {
        sub_100030C48(dword_1000486D0[v17], v16);
        sub_1000311C8();
        if (dword_1000673C8) {
          notify_post("com.apple.system.powermanagement.assertions");
        }
      }

      return;
    }

    if (!v13) {
      return;
    }
LABEL_29:
    int v16 = 0;
    goto LABEL_30;
  }

  if (v13) {
    char v15 = v6;
  }
  else {
    char v15 = 1;
  }
  if ((v15 & 1) == 0) {
    goto LABEL_29;
  }
}

void sub_10002BCEC(uint64_t a1, int a2)
{
  if (a2 != 2)
  {
    void block[7] = v2;
    block[8] = v3;
    if (*(_DWORD *)(a1 + 40) == 6)
    {
      int v6 = sub_10002AC1C(a1, 0LL);
      if (a2)
      {
        if ((v6 & 1) != 0) {
          return;
        }
        dword_1000673E4 &= ~(1 << *(_DWORD *)(a1 + 40));
        unsigned int v7 = sub_100026D08( @"PreventUserIdleSystemSleep",  @"Waiting for springboard or equivalent process to start",  0LL,  0LL,  0LL,  0LL,  0.0);
        sub_100027018(v7, (uint64_t)&unk_1000674E0, 0);
        CFRelease(v7);
      }

      else
      {
        if (!v6) {
          return;
        }
        dword_1000673E4 |= 1 << *(_DWORD *)(a1 + 40);
        int v8 = sub_100038248();
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_100027104;
        block[3] = &unk_1000598E8;
        void block[4] = &unk_1000674E0;
        dispatch_async(v8, block);
      }

      if (dword_1000673C8) {
        notify_post("com.apple.system.powermanagement.assertions");
      }
    }
  }

void sub_10002BE1C(id a1, assertion *a2)
{
}

void sub_10002BE28(id a1, assertion *a2)
{
}

void *sub_10002BE34(const __CFDictionary *a1)
{
  uint64_t v2 = calloc(1uLL, 0x70uLL);
  if (v2)
  {
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0LL, 5LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    *((void *)v2 + 2) = Mutable;
    if (Mutable && (int v4 = (const __CFNumber *)CFDictionaryGetValue(a1, @"ID")) != 0LL)
    {
      int v5 = v4;
      CFDictionarySetValue(*((CFMutableDictionaryRef *)v2 + 2), @"GlobalUniqueID", v4);
      Value = (const __CFNumber *)CFDictionaryGetValue(a1, @"Assertions");
      if (Value)
      {
        *(_DWORD *)int valuePtr = 0;
        CFNumberGetValue(Value, kCFNumberSInt32Type, valuePtr);
        unsigned int v7 = sub_10000B048(valuePtr[0]);
        CFStringRef v8 = CFStringCreateWithCString(0LL, v7, 0x8000100u);
        if (v8)
        {
          CFStringRef v9 = v8;
          CFDictionarySetValue(*((CFMutableDictionaryRef *)v2 + 2), @"AssertName", v8);
          CFRelease(v9);
        }
      }

      CFDictionarySetValue(*((CFMutableDictionaryRef *)v2 + 2), @"AssertType", @"Kernel Assertion");
      int v10 = CFDictionaryGetValue(a1, @"ServicePtr");
      if (v10) {
        CFDictionarySetValue(*((CFMutableDictionaryRef *)v2 + 2), @"AssertionOnBehalfOfPID", v10);
      }
      BOOL v11 = CFDictionaryGetValue(a1, @"Owner");
      if (v11) {
        CFDictionarySetValue(*((CFMutableDictionaryRef *)v2 + 2), @"AssertionOnBehalfOfBundleID", v11);
      }
      CFDictionarySetValue(*((CFMutableDictionaryRef *)v2 + 2), @"Process Name", @"kernel_task");
      int v12 = CFDictionaryGetValue((CFDictionaryRef)qword_100067A18, 0LL);
      if (v12)
      {
        int v13 = v12[18];
        if (v13 != -1) {
          v12[18] = v13 + 1;
        }
      }

      else
      {
        *((void *)v2 + 9) = 0LL;
        int v12 = sub_100023584(0);
      }

      *((void *)v2 + 9) = v12;
      CFNumberGetValue(v5, kCFNumberIntType, &v17);
      char v14 = (const __CFString *)CFDictionaryGetValue(a1, @"Owner");
      if (v14) {
        CFStringGetCString(v14, (char *)valuePtr, 100LL, 0x8000100u);
      }
      char v15 = (os_log_s *)qword_100067A10;
      if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109378;
        int v19 = v17;
        __int16 v20 = 2080;
        dispatch_time_t v21 = valuePtr;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "inserted kernel assertion id %d %s \n",  buf,  0x12u);
      }
    }

    else
    {
      return 0LL;
    }
  }

  return v2;
}

void *sub_10002C0B0(const void *a1, const void *a2, int a3)
{
  int v6 = calloc(1uLL, 0x70uLL);
  if (!v6)
  {
    if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_ERROR)) {
      sub_100043040();
    }
    return 0LL;
  }

  unsigned int v7 = v6;
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0LL, 4LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  void v7[2] = Mutable;
  if (!Mutable)
  {
    if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_ERROR)) {
      sub_10004306C();
    }
    free(v7);
    return 0LL;
  }

  CFDictionarySetValue(Mutable, @"GlobalUniqueID", a2);
  CFDictionarySetValue((CFMutableDictionaryRef)v7[2], @"AssertName", a1);
  if (a3) {
    CFStringRef v9 = @"System Sleep Preventer";
  }
  else {
    CFStringRef v9 = @"Idle Sleep Preventer";
  }
  CFDictionarySetValue((CFMutableDictionaryRef)v7[2], @"AssertType", v9);
  CFDictionarySetValue((CFMutableDictionaryRef)v7[2], @"Process Name", @"kernel_task");
  Value = CFDictionaryGetValue((CFDictionaryRef)qword_100067A18, 0LL);
  if (Value)
  {
    int v11 = Value[18];
    if (v11 != -1) {
      Value[18] = v11 + 1;
    }
  }

  else
  {
    v7[9] = 0LL;
    Value = sub_100023584(0);
  }

  v7[9] = Value;
  if (a3)
  {
    uint64_t v12 = qword_100067A60;
    *unsigned int v7 = qword_100067A60;
    if (v12) {
      *(void *)(v12 + _Block_object_dispose(va, 8) = v7;
    }
    int v13 = &qword_100067A60;
  }

  else
  {
    uint64_t v14 = qword_100067A58;
    *unsigned int v7 = qword_100067A58;
    if (v14) {
      *(void *)(v14 + _Block_object_dispose(va, 8) = v7;
    }
    int v13 = &qword_100067A58;
  }

  *int v13 = (uint64_t)v7;
  v7[1] = v13;
  return v7;
}

void sub_10002C254(uint64_t a1)
{
  int v1 = a1;
  CFArrayRef theArray = 0LL;
  if (IOPMCopySleepPreventersListWithID(a1, &theArray))
  {
    uint64_t v2 = (os_log_s *)qword_100067A10;
    if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v30 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Could not read sleep preventers\n", v30, 2u);
    }

    return;
  }

  CFArrayRef v3 = theArray;
  CFTypeID TypeID = CFArrayGetTypeID();
  if (v3 && CFGetTypeID(v3) == TypeID)
  {
    CFIndex Count = CFArrayGetCount(theArray);
    CFIndex v6 = Count;
    unsigned int v7 = &qword_100067A58;
    if (v1) {
      unsigned int v7 = &qword_100067A60;
    }
    uint64_t v8 = *v7;
    if (Count < 1)
    {
      int v19 = 0;
      int v18 = 0;
      if (v8) {
        goto LABEL_26;
      }
    }

    else
    {
      CFIndex v9 = 0LL;
      do
      {
        ValueAtIndex = CFArrayGetValueAtIndex(theArray, v9);
        CFTypeID v11 = CFDictionaryGetTypeID();
        if (ValueAtIndex && CFGetTypeID(ValueAtIndex) != v11) {
          ValueAtIndex = 0LL;
        }
        Value = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, @"RegistryEntryID");
        if (v8)
        {
          int v13 = (void *)v8;
          while (1)
          {
            uint64_t v14 = (const __CFDictionary *)v13[2];
            if (v14)
            {
              char v15 = (const __CFNumber *)CFDictionaryGetValue(v14, @"GlobalUniqueID");
              if (CFNumberCompare(v15, Value, 0LL) == kCFCompareEqualTo) {
                break;
              }
            }

            int v13 = (void *)*v13;
            if (!v13) {
              goto LABEL_18;
            }
          }

          int v18 = 1;
        }

        else
        {
LABEL_18:
          int v16 = CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, @"Owner");
          int v17 = sub_10002C0B0(v16, Value, v1);
          sub_10002002C(0, (uint64_t)v17);
          int v18 = 0;
        }

        ++v9;
      }

      while (v9 != v6);
      int v19 = 1;
      if (v8) {
        goto LABEL_26;
      }
    }

    goto LABEL_44;
  }

  int v19 = 0;
  CFIndex v6 = 0LL;
  int v18 = 0;
  __int16 v20 = &qword_100067A58;
  if (v1) {
    __int16 v20 = &qword_100067A60;
  }
  uint64_t v8 = *v20;
  if (*v20)
  {
    do
    {
LABEL_26:
      dispatch_time_t v21 = *(const __CFDictionary **)(v8 + 16);
      if (v21)
      {
        int v22 = (const __CFNumber *)CFDictionaryGetValue(v21, @"GlobalUniqueID");
        if (!v19) {
          goto LABEL_38;
        }
        uint64_t v23 = v22;
        CFIndex v24 = 0LL;
        while (1)
        {
          unsigned int v25 = CFArrayGetValueAtIndex(theArray, v24);
          CFTypeID v26 = CFDictionaryGetTypeID();
          if (v25) {
            uint64_t v27 = CFGetTypeID(v25) == v26 ? (const __CFDictionary *)v25 : 0LL;
          }
          else {
            uint64_t v27 = 0LL;
          }
          CFDateRef v28 = (const __CFNumber *)CFDictionaryGetValue(v27, @"RegistryEntryID");
          if (CFNumberCompare(v23, v28, 0LL) == kCFCompareEqualTo) {
            break;
          }
          if (v6 == ++v24) {
            goto LABEL_38;
          }
        }

        int v18 = 1;
      }

      else if (!v18)
      {
LABEL_38:
        char v29 = *(void **)v8;
        if (*(void *)v8) {
          v29[1] = *(void *)(v8 + 8);
        }
        **(void **)(v8 + _Block_object_dispose(va, 8) = v29;
        sub_10002002C(2, v8);
        CFRelease(*(CFTypeRef *)(v8 + 16));
        sub_1000237D8(0);
        free((void *)v8);
        int v18 = 0;
        goto LABEL_43;
      }

      char v29 = *(void **)v8;
LABEL_43:
      uint64_t v8 = (uint64_t)v29;
    }

    while (v29);
  }

LABEL_44:
  if (theArray) {
    CFRelease(theArray);
  }
}

void sub_10002C538(const __CFNumber *a1, const __CFArray *a2)
{
  int valuePtr = 0;
  CFNumberGetValue(a1, kCFNumberIntType, &valuePtr);
  int v3 = valuePtr;
  int v4 = dword_1000673F8;
  if (valuePtr != dword_1000673F8)
  {
    int v5 = (os_log_s *)qword_100067A10;
    if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      int v33 = v4;
      __int16 v34 = 1024;
      int v35 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Kernel driver assertions bit mask has changed old 0x%x new 0x%x\n",  buf,  0xEu);
      int v3 = valuePtr;
    }

    dword_1000673F8 = v3;
  }

  if (a2)
  {
    int64_t Count = CFArrayGetCount(a2);
    unsigned int v7 = (int *)calloc(Count, 4uLL);
    if (Count >= 1)
    {
      CFIndex v8 = 0LL;
      int v9 = 0;
      while (1)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(a2, v8);
        CFTypeID TypeID = CFDictionaryGetTypeID();
        if (!ValueAtIndex || CFGetTypeID(ValueAtIndex) != TypeID) {
          goto LABEL_21;
        }
        Value = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, @"ID");
        CFNumberGetValue(Value, kCFNumberIntType, &v30);
        v7[v8] = v30;
        int v13 = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, @"Level");
        int v29 = 0;
        CFNumberGetValue(v13, kCFNumberSInt32Type, &v29);
        if (CFDictionaryContainsKey((CFDictionaryRef)qword_100067400, Value) == 1)
        {
          if (!v29)
          {
            uint64_t v14 = (os_log_s *)qword_100067A10;
            if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109120;
              int v33 = v30;
              _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "assertion %d is turned off. Let's remove it\n",  buf,  8u);
            }

            char v15 = (CFTypeRef *)CFDictionaryGetValue((CFDictionaryRef)qword_100067400, Value);
            sub_10002002C(2, (uint64_t)v15);
            CFDictionaryRemoveValue((CFMutableDictionaryRef)qword_100067400, Value);
            CFRelease(v15[2]);
            sub_1000237D8(0);
            free(v15);
LABEL_20:
            int v9 = 1;
          }
        }

        else if (v29)
        {
          int v16 = (os_log_s *)qword_100067A10;
          if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            int v33 = v30;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "New kernel assertion %d\n", buf, 8u);
          }

          int v17 = sub_10002BE34((const __CFDictionary *)ValueAtIndex);
          if (v17)
          {
            uint64_t v18 = (uint64_t)v17;
            CFDictionarySetValue((CFMutableDictionaryRef)qword_100067400, Value, v17);
            sub_10002002C(0, v18);
          }

          goto LABEL_20;
        }

LABEL_21:
        if (Count == ++v8) {
          goto LABEL_24;
        }
      }
    }

    int v9 = 0;
LABEL_24:
    int64_t v19 = CFDictionaryGetCount((CFDictionaryRef)qword_100067400);
    __int16 v20 = (const void **)calloc(v19, 8uLL);
    CFDictionaryGetKeysAndValues((CFDictionaryRef)qword_100067400, v20, 0LL);
    if (v19 >= 1)
    {
      for (uint64_t i = 0LL; i != v19; ++i)
      {
        CFNumberGetValue((CFNumberRef)v20[i], kCFNumberIntType, &v30);
        if (Count < 1) {
          goto LABEL_32;
        }
        int v22 = 1;
        int64_t v23 = Count;
        CFIndex v24 = v7;
        do
        {
          int v25 = *v24++;
          if (v25 == v30) {
            int v22 = 0;
          }
          --v23;
        }

        while (v23);
        if (v22 == 1)
        {
LABEL_32:
          CFTypeID v26 = (os_log_s *)qword_100067A10;
          if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            int v33 = v30;
            _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Kernel assertion %d has been released\n",  buf,  8u);
          }

          uint64_t v27 = (CFTypeRef *)CFDictionaryGetValue((CFDictionaryRef)qword_100067400, v20[i]);
          sub_10002002C(2, (uint64_t)v27);
          CFDictionaryRemoveValue((CFMutableDictionaryRef)qword_100067400, v20[i]);
          CFRelease(v27[2]);
          sub_1000237D8(0);
          free(v27);
          int v9 = 1;
        }
      }
    }

    free(v20);
    free(v7);
    if (v9)
    {
      CFDateRef v28 = (os_log_s *)qword_100067A10;
      if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Kernel assertions changed\n", buf, 2u);
      }
    }
  }

void sub_10002C99C(const __CFNumber *a1, const __CFArray *a2)
{
  int v3 = (os_log_s *)qword_100067A10;
  if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v17 = dword_1000673F8;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Kernel assertions 0x%u\n", buf, 8u);
  }

  if (a2)
  {
    CFIndex Count = CFArrayGetCount(a2);
    if (Count >= 1)
    {
      CFIndex v5 = Count;
      for (CFIndex i = 0LL; i != v5; ++i)
      {
        ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(a2, i);
        CFTypeID TypeID = CFDictionaryGetTypeID();
        if (ValueAtIndex)
        {
          if (CFGetTypeID(ValueAtIndex) == TypeID)
          {
            Value = (const __CFNumber *)CFDictionaryGetValue(ValueAtIndex, @"ID");
            CFNumberGetValue(Value, kCFNumberIntType, &valuePtr);
            int v10 = (const __CFNumber *)CFDictionaryGetValue(ValueAtIndex, @"Level");
            int v14 = 0;
            CFNumberGetValue(v10, kCFNumberSInt32Type, &v14);
            if (v14)
            {
              CFTypeID v11 = sub_10002BE34(ValueAtIndex);
              if (v11)
              {
                uint64_t v12 = v11;
                int v13 = (os_log_s *)qword_100067A10;
                if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 67109120;
                  int v17 = valuePtr;
                  _os_log_debug_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "inserting kernel assertion %d\n",  buf,  8u);
                }

                CFDictionarySetValue((CFMutableDictionaryRef)qword_100067400, Value, v12);
                sub_10002002C(0, (uint64_t)v12);
              }
            }
          }
        }
      }
    }
  }

void sub_10002CBA0(const __CFNumber *a1, const __CFArray *a2)
{
  if (qword_100067400)
  {
    sub_10002C538(a1, a2);
  }

  else
  {
    qword_100067400 = (uint64_t)CFDictionaryCreateMutable(0LL, 10240LL, &kCFTypeDictionaryKeyCallBacks, 0LL);
    sub_10002C99C(a1, a2);
  }

void sub_10002CC10()
{
  if (byte_100067A68)
  {
    uint64_t v0 = (os_log_s *)qword_100067A10;
    if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v0,  OS_LOG_TYPE_DEFAULT,  "System Assertion Timeout: timer fired",  buf,  2u);
    }

    byte_100067A69 = 0;
    *(void *)buf = 0LL;
    int v3 = buf;
    uint64_t v4 = 0x2020000000LL;
    char v5 = 0;
    v1[0] = _NSConcreteStackBlock;
    v1[1] = 3221225472LL;
    v1[2] = sub_10002CD34;
    v1[3] = &unk_100059DE8;
    v1[4] = buf;
    sub_100027F30((uint64_t)&unk_100067B30, 3u, (uint64_t)v1);
    if (v3[24])
    {
      if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_DEBUG)) {
        sub_100043098();
      }
      sub_10002D1D4();
    }

    _Block_object_dispose(buf, 8);
  }

void sub_10002CD1C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_10002CD34(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (const __CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(a2 + 16), @"AssertName");
  char v5 = *(const __CFString **)(*(void *)(a2 + 72) + 80LL);
  CFIndex v6 = CFDictionaryGetValue(*(CFDictionaryRef *)(a2 + 16), @"FrameworkBundleID");
  int v30 = 0LL;
  uint64_t v31 = 0LL;
  uint64_t v7 = *(void *)(a2 + 88);
  if (v7) {
    CFIndex v8 = *(const __CFString **)(v7 + 80);
  }
  else {
    CFIndex v8 = 0LL;
  }
  if (CFDictionaryGetValueIfPresent((CFDictionaryRef)qword_100067A78, v5, (const void **)&value)
    || v8 && CFDictionaryGetValueIfPresent((CFDictionaryRef)qword_100067A78, v8, (const void **)&value)
    || v6 && CFDictionaryGetValueIfPresent((CFDictionaryRef)qword_100067A78, v6, (const void **)&value))
  {
    int v9 = value;
    CFTypeID TypeID = CFNumberGetTypeID();
    if (v9)
    {
      if (CFGetTypeID(v9) == TypeID)
      {
        valuePtr[0] = -1;
        CFNumberGetValue((CFNumberRef)value, kCFNumberSInt32Type, valuePtr);
        if (!valuePtr[0])
        {
LABEL_15:
          uint64_t v12 = (os_log_s *)qword_100067A10;
          if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_DEFAULT))
          {
            int v13 = *(_DWORD *)(a2 + 52);
            uint64_t v14 = *(void *)(a2 + 72);
            int v15 = *(_DWORD *)(v14 + 96);
            uint64_t v16 = *(void *)(v14 + 80);
            valuePtr[0] = 67110658;
            valuePtr[1] = v13;
            __int16 v33 = 2112;
            __int16 v34 = v4;
            __int16 v35 = 1024;
            int v36 = v15;
            __int16 v37 = 2112;
            uint64_t v38 = v16;
            __int16 v39 = 2112;
            unsigned int v40 = v8;
            __int16 v41 = 2112;
            pid_t v42 = v6;
            __int16 v43 = 2112;
            int v44 = v30;
            _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "System Assertion Timeout: Allowing assertion %u:%@ for pid %d:%@(%@)(%@)(%@)",  (uint8_t *)valuePtr,  0x40u);
          }

          return;
        }
      }
    }
  }

  else if (CFDictionaryGetValueIfPresent(*(CFDictionaryRef *)(a2 + 16), @"Category", (const void **)&v31))
  {
    CFStringRef v11 = CFStringCreateWithFormat(kCFAllocatorDefault, 0LL, @"%@", v31);
  }

  unint64_t v17 = sub_100039ACC() - *(void *)(a2 + 32);
  if (v17 >= dword_100066D98)
  {
    uint64_t v18 = *(int *)(*(void *)(a2 + 72) + 96LL);
    int64_t v19 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @" System Assertion Timeout: Device became inactive %d seconds ago.%@ is not on the allow list. Dropping assertion %lld:%@ for pid %d %@. age:%llu.",  dword_100066D98,  v5,  *(unsigned int *)(a2 + 52) | ((unint64_t)*(unsigned int *)(a2 + 48) << 32),  v4,  v18,  v5,  v17);
    if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_ERROR)) {
      sub_1000430C4();
    }
    if (!notify_register_check("com.apple.powermanagement.assertionexception", &out_token))
    {
      notify_set_state(out_token, v18 | 0x400000000LL);
      notify_post("com.apple.powermanagement.assertionexception");
      notify_cancel(out_token);
    }

    memset(buffer, 0, sizeof(buffer));
    memset(v45, 0, sizeof(v45));
    CFStringGetCString(v5, (char *)buffer, 64LL, 0x8000100u);
    if (v8) {
      CFStringGetCString(v8, (char *)v45, 64LL, 0x8000100u);
    }
    CFStringGetCString(v4, (char *)valuePtr, 256LL, 0x8000100u);
    sub_10002E4FC(a2, 1);
    uint64_t v20 = *(void *)(a2 + 72);
    if (*(void *)(v20 + 144)) {
      *(void *)(v20 + 144) = 0LL;
    }
    if (*(void *)(v20 + 120)) {
      sub_100024098(a2);
    }
    dispatch_time_t v21 = (char *)&unk_100067A90 + 160 * *(unsigned int *)(a2 + 48);
    sub_10002A144(a2, (uint64_t)v21, 1);
    uint64_t v24 = *((void *)v21 + 3);
    int64_t v23 = (uint64_t *)(v21 + 24);
    uint64_t v22 = v24;
    *(void *)a2 = v24;
    if (v24) {
      *(void *)(v22 + _Block_object_dispose(va, 8) = a2;
    }
    *int64_t v23 = a2;
    *(void *)(a2 + _Block_object_dispose(va, 8) = v23;
    *(_DWORD *)(a2 + 24) = *(_DWORD *)(a2 + 24) & 0xFFFFFFFC | 2;
    sub_10002002C(12, a2);
    if (dword_1000673DC) {
      notify_post("com.apple.system.powermanagement.assertions.anychange");
    }
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(-32768LL, 0LL);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10002D178;
    block[3] = &unk_100059FB0;
    int v27 = v18;
    void block[4] = v19;
    dispatch_async(global_queue, block);
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1;
  }

void sub_10002D178(uint64_t a1)
{
  if ((SimulateCrash(*(unsigned int *)(a1 + 40), 195896592LL, *(void *)(a1 + 32)) & 1) == 0
    && os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_ERROR))
  {
    sub_100043124();
  }

void sub_10002D1D4()
{
  if (byte_100067A68)
  {
    if ((sub_10002D310() & 1) != 0)
    {
      if (qword_100067A70)
      {
        dispatch_suspend((dispatch_object_t)qword_100067A70);
        byte_100067A69 = 0;
      }

      else
      {
        uint64_t v0 = sub_100038248();
        qword_100067A70 = (uint64_t)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  v0);
        dispatch_source_set_event_handler((dispatch_source_t)qword_100067A70, &stru_100059FD0);
        dispatch_source_set_cancel_handler((dispatch_source_t)qword_100067A70, &stru_100059FF0);
      }

      int v1 = (os_log_s *)qword_100067A10;
      if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v4 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_DEFAULT,  "System Assertion Timeout: Starting System Assertion Timer",  v4,  2u);
      }

      uint64_t v2 = (dispatch_source_s *)qword_100067A70;
      dispatch_time_t v3 = dispatch_time(0LL, 1000000000LL * dword_100066D98);
      dispatch_source_set_timer(v2, v3, 0xFFFFFFFFFFFFFFFFLL, 0LL);
      dispatch_resume((dispatch_object_t)qword_100067A70);
      byte_100067A69 = 1;
    }

    else if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_DEBUG))
    {
      sub_100043184();
    }
  }

uint64_t sub_10002D310()
{
  if (!byte_100067A68) {
    return 0LL;
  }
  int v0 = sub_100019CD0();
  uint64_t v1 = sub_100036030();
  uint64_t result = 0LL;
  if (!v0 && !v1)
  {
    dispatch_time_t v3 = (os_log_s *)qword_100067A10;
    if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_DEBUG)) {
      sub_1000431B0(v3);
    }
    return 1LL;
  }

  return result;
}

void sub_10002D384(id a1)
{
  qword_100067A70 = 0LL;
  byte_100067A69 = 0;
}

void sub_10002D3B4()
{
  if (byte_100067A68) {
    BOOL v0 = qword_100067A70 == 0;
  }
  else {
    BOOL v0 = 1;
  }
  if (!v0) {
    dispatch_source_cancel((dispatch_source_t)qword_100067A70);
  }
}

void sub_10002D3D8()
{
  if (!qword_100067A78)
  {
    BOOL v0 = CFStringCreateWithFormat( kCFAllocatorDefault,  0LL,  @"%@/%@",  @"/System/Library/CoreServices/powerd.bundle",  @"com.apple.powerd.assertiontimeouts.plist");
    uint64_t v1 = CFURLCreateWithFileSystemPath(kCFAllocatorDefault, v0, kCFURLPOSIXPathStyle, 0);
    uint64_t v2 = CFReadStreamCreateWithFile(kCFAllocatorDefault, v1);
    if (v2)
    {
      dispatch_time_t v3 = v2;
      CFReadStreamOpen(v2);
      CFPropertyListRef v4 = CFPropertyListCreateWithStream(kCFAllocatorDefault, v3, 0LL, 1uLL, 0LL, 0LL);
      qword_100067A78 = (uint64_t)v4;
      if (v4)
      {
        CFPropertyListRef v5 = v4;
        CFIndex v6 = (os_log_s *)qword_100067A10;
        if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          CFPropertyListRef v8 = v5;
          _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "System Assertion Timer: assertion timeouts data: %@",  buf,  0xCu);
        }
      }

      CFReadStreamClose(v3);
      CFRelease(v3);
    }

    if (v1) {
      CFRelease(v1);
    }
    if (v0) {
      CFRelease(v0);
    }
  }

void sub_10002D544()
{
  if (!qword_100067A80)
  {
    BOOL v0 = CFStringCreateWithFormat( kCFAllocatorDefault,  0LL,  @"%@/%@",  @"/System/Library/CoreServices/powerd.bundle",  @"com.apple.powerd.assertioncategories.plist");
    uint64_t v1 = CFURLCreateWithFileSystemPath(kCFAllocatorDefault, v0, kCFURLPOSIXPathStyle, 0);
    uint64_t v2 = CFReadStreamCreateWithFile(kCFAllocatorDefault, v1);
    if (v2)
    {
      dispatch_time_t v3 = v2;
      CFReadStreamOpen(v2);
      CFPropertyListRef v4 = CFPropertyListCreateWithStream(kCFAllocatorDefault, v3, 0LL, 1uLL, 0LL, 0LL);
      qword_100067A80 = (uint64_t)v4;
      if (v4)
      {
        CFPropertyListRef v5 = v4;
        CFIndex v6 = (os_log_s *)qword_100067A10;
        if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          CFPropertyListRef v8 = v5;
          _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "InitAssertionCategories: Categories Data: %@",  buf,  0xCu);
        }
      }

      CFReadStreamClose(v3);
      CFRelease(v3);
    }

    if (v1) {
      CFRelease(v1);
    }
    if (v0) {
      CFRelease(v0);
    }
  }

void sub_10002D6B0(uint64_t a1, xpc_object_t xdict)
{
  if (a1 && xdict)
  {
    int uint64 = xpc_dictionary_get_uint64(xdict, "systemAssertionTimeout");
    int v3 = uint64;
    if (uint64)
    {
      dword_100066D98 = uint64;
      CFPropertyListRef v4 = (os_log_s *)qword_100067A10;
      if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_DEFAULT))
      {
        v5[0] = 67109120;
        v5[1] = v3;
        _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "System Assertion Timer: setting timeout value to %u",  (uint8_t *)v5,  8u);
      }
    }
  }

  else if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_ERROR))
  {
    sub_100043230();
  }

void sub_10002D79C()
{
  qword_100067A10 = (uint64_t)os_log_create("com.apple.powerd", "assertions");
  qword_100067408 = (uint64_t)CFDictionaryCreateMutable(0LL, 10240LL, 0LL, 0LL);
  qword_100067A18 = (uint64_t)CFDictionaryCreateMutable(0LL, 0LL, 0LL, 0LL);
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  uint64_t v1 = 0LL;
  qword_1000673F0 = (uint64_t)Mutable;
  qword_100067410[0] = (uint64_t)@"CPUBoundAssertion";
  *(void *)algn_100067418 = @"PreventUserIdleSystemSleep";
  qword_100067420 = (uint64_t)@"DisableInflow";
  unk_100067428 = @"ChargeInhibit";
  qword_100067430 = (uint64_t)@"DisableLowPowerBatteryWarnings";
  unk_100067438 = @"PreventUserIdleDisplaySleep";
  qword_100067440 = (uint64_t)@"EnableIdleSleep";
  unk_100067448 = @"PreventSystemSleep";
  qword_100067450 = (uint64_t)@"ExternalMedia";
  unk_100067458 = @"UserIsActive";
  qword_100067460 = (uint64_t)@"ApplePushServiceTask";
  unk_100067468 = @"BackgroundTask";
  qword_100067470 = (uint64_t)@"SystemIsActive";
  unk_100067478 = @"InternalPreventSleep";
  qword_100067480 = (uint64_t)@"DisplayWake";
  unk_100067488 = @"PreventDiskIdle";
  qword_100067490 = (uint64_t)@"InternalPreventDisplaySleep";
  unk_100067498 = @"NetworkClientActive";
  qword_1000674A0 = (uint64_t)@"InteractivePushServiceTask";
  unk_1000674A8 = @"AwakeOnReservePower";
  uint64_t v2 = &dword_100068740;
  do
  {
    *uint64_t v2 = v1;
    *((void *)v2 - 1) = 0LL;
    ++v1;
    v2 += 4;
  }

  while (v1 != 13);
  for (unsigned int i = 0; i != 20; ++i)
    sub_1000262C4(i, 1);
  sub_100030E6C(&dword_100067A20);
  sub_100030F9C(&qword_100067A28);
  sub_10002B29C(0);
  off_100067ED0(&unk_100067E50, 1LL);
  ++dword_1000681F8;
  sub_1000262C4(0xBu, 0);
  CFPropertyListRef v4 = sub_100038248();
  notify_register_dispatch("com.apple.powermanagement.collectbt", &out_token, v4, &stru_10005A010);
  dispatch_queue_t v5 = sub_100038248();
  os_state_add_handler(v5, &stru_10005A050);
  CFIndex v6 = (os_log_s *)qword_100067A10;
  if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "System Assertion Timer: feature disabled",  v7,  2u);
  }

os_state_data_s *__cdecl sub_10002DA04(id a1, os_state_hints_s *a2)
{
  return 0LL;
}

void sub_10002DA1C(uint64_t a1)
{
  uint64_t v2 = getpid();
  int v3 = v2;
  CFPropertyListRef v4 = *(_DWORD **)(a1 + 32);
  if (v4)
  {
    if (!*v4)
    {
      sub_100022860(v2, *(const void **)(a1 + 40), v4, 0LL, 0LL);
      if (*(_DWORD *)(a1 + 48))
      {
        CFIndex v6 = 0LL;
        else {
          BOOL v5 = v6 == 0LL;
        }
        if (!v5) {
          v6[6] |= 0x10u;
        }
      }
    }
  }

  else
  {
    sub_100022860(v2, *(const void **)(a1 + 40), &v7, 0LL, 0LL);
  }

  CFRelease(*(CFTypeRef *)(a1 + 40));
}

const void *sub_10002DAC8(const void *a1)
{
  CFTypeID TypeID = CFBooleanGetTypeID();
  if (!a1) {
    return 0LL;
  }
  if (CFGetTypeID(a1) == TypeID) {
    return a1;
  }
  return 0LL;
}

void sub_10002DB08(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0LL, 1000000000LL * *(void *)(a1 + 32));
  int v3 = sub_100038248();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002DB98;
  block[3] = &unk_100059400;
  int v5 = *(_DWORD *)(a1 + 40);
  dispatch_after(v2, v3, block);
}

void sub_10002DB98(uint64_t a1)
{
}

void sub_10002DBA0(uint64_t a1)
{
}

CFIndex sub_10002DBAC(uint64_t a1, int a2)
{
  CFPropertyListRef v4 = (const void *)qword_100067A38;
  CFTypeID TypeID = CFDictionaryGetTypeID();
  if (!v4 || CFGetTypeID(v4) != TypeID) {
    return 0LL;
  }
  CFIndex Count = CFDictionaryGetCount((CFDictionaryRef)qword_100067A38);
  if (!Count) {
    return Count;
  }
  CFMutableArrayRef Mutable = CFArrayCreateMutable(0LL, 0LL, &kCFTypeArrayCallBacks);
  if (!Mutable)
  {
    if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_ERROR)) {
      sub_10004325C();
    }
    return 0LL;
  }

  CFPropertyListRef v8 = Mutable;
  int v9 = (const void **)calloc(Count, 8uLL);
  if (!v9)
  {
    __int16 v37 = (os_log_s *)qword_100067A10;
    if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_ERROR)) {
      sub_100043288(Count, v37, v38, v39, v40, v41, v42, v43);
    }
    return 0LL;
  }

  int v10 = v9;
  CFDictionaryGetKeysAndValues((CFDictionaryRef)qword_100067A38, 0LL, v9);
  if (Count >= 1)
  {
    if (a2 == 1) {
      CFStringRef v11 = @"Asssertion Duration Limit";
    }
    else {
      CFStringRef v11 = @"Aggregate Assertion Limit";
    }
    uint64_t v12 = (CFDictionaryRef *)v10;
    do
    {
      CFDictionaryRef v13 = *v12;
      CFTypeID v14 = CFDictionaryGetTypeID();
      if (v13 && CFGetTypeID(v13) == v14)
      {
        Value = CFDictionaryGetValue(*v12, v11);
        CFArrayAppendValue(v8, Value);
      }

      ++v12;
      --Count;
    }

    while (Count);
  }

  v59.length = CFArrayGetCount(v8);
  v59.CFIndex location = 0LL;
  CFArraySortValues(v8, v59, (CFComparatorFunction)sub_100029A9C, 0LL);
  uint64_t v16 = a1 + 32;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 38;
  unint64_t v17 = calloc(*(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL), 0x18uLL);
  if (!v17)
  {
    int v44 = (os_log_s *)qword_100067A10;
    if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_ERROR)) {
      sub_1000432F0(a1 + 32, v44, v45, v46, v47, v48, v49, v50);
    }
    CFRelease(v8);
    free(v10);
    return 0LL;
  }

  CFIndex Count = (CFIndex)v17;
  unint64_t v18 = 0LL;
  int64_t v19 = v17;
  pid_t v52 = v10;
  do
  {
    void *v19 = off_10005A090[v18];
    v19 += 3;
    ++v18;
  }

  while (v18 != 33);
  CFIndex v20 = CFArrayGetCount(v8);
  if (v20 >= 1)
  {
    CFIndex v21 = v20;
    int v53 = 0;
    do
    {
      CFIndex v22 = v21--;
      int valuePtr = 0;
      ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(v8, v21);
      CFTypeID v24 = CFNumberGetTypeID();
      if (ValueAtIndex)
      {
        if (CFGetTypeID(ValueAtIndex) == v24)
        {
          CFNumberGetValue(ValueAtIndex, kCFNumberIntType, &valuePtr);
          CFIndex v25 = CFArrayGetCount(v8);
          int v26 = valuePtr;
          if (v22 == v25 || valuePtr != v53)
          {
            *(void *)(Count + 24LL * (int)v18 + _Block_object_dispose(va, 8) = valuePtr;
            ++*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
            LODWORD(v1_Block_object_dispose(va, 8) = v18 + 1;
            int v53 = v26;
          }
        }
      }
    }

    while ((unint64_t)(v21 + 1) > 1);
  }

  if (*(_DWORD *)(*(void *)(*(void *)v16 + 8LL) + 24LL))
  {
    unint64_t v27 = 0LL;
    int v28 = 0;
    int v29 = "aggregateassertion";
    if (a2 == 1) {
      int v29 = "singleassertion";
    }
    CFNumberRef v54 = v29;
    int v30 = (uint64_t *)(Count + 8);
    while (1)
    {
      uint64_t v31 = (const void *)*(v30 - 1);
      CFTypeID v32 = CFStringGetTypeID();
      if (v31)
      {
        if (CFGetTypeID(v31) == v32) {
          break;
        }
      }

      if (*v30)
      {
        CFStringRef v33 = CFStringCreateWithFormat( 0LL,  0LL,  @"com.apple.powerd.exception.%s.bucket%d",  v54,  (*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) + ~v28));
        __int16 v35 = (os_log_s *)qword_100067A10;
        if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v36 = *v30;
          int valuePtr = 138412546;
          CFStringRef v56 = v33;
          __int16 v57 = 2048;
          uint64_t v58 = v36;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEBUG,  "Initialized the aggdKey %@ for limit %lld\n",  (uint8_t *)&valuePtr,  0x16u);
        }

        ++v28;
        goto LABEL_40;
      }

LABEL_42:
      ++v27;
      v30 += 3;
    }

    CFStringRef v33 = sub_10002E09C((const __CFString *)*(v30 - 1), a2);
    __int16 v34 = (os_log_s *)qword_100067A10;
    if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_DEBUG))
    {
      int valuePtr = 138412290;
      CFStringRef v56 = v33;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEBUG,  "Initialized the aggdKey %@\n",  (uint8_t *)&valuePtr,  0xCu);
    }

LABEL_40:
    if (v33)
    {
      ADClientAddValueForScalarKey(v33, 0LL);
      CFRelease(v33);
    }

    goto LABEL_42;
  }

    if (IOPMFeatureIsAvailableWithSupportedTable( @"Automatic Restart On Power Loss",  v13,  CFProperty))
    {
      if (v50) {
        CFIndex v22 = v7;
      }
      else {
        CFIndex v22 = v9;
      }
      IORegistryEntrySetCFProperty(v6, @"Automatic Restart On Power Loss", v22);
    }

    if ((IOPMFeatureIsAvailableWithSupportedTable(@"Wake On AC Change", v13, CFProperty) & 1) == 0) {
      goto LABEL_55;
    }
    goto LABEL_51;
  }

  int v10 = 0;
  CFTypeRef CFProperty = 0LL;
  unint64_t v17 = 0;
  unint64_t v18 = 0LL;
  if (v8) {
    goto LABEL_111;
  }
  if (v7) {
LABEL_24:
  }
    CFRelease(v7);
LABEL_25:
  if (v17) {
    IOServiceClose(v17);
  }
  if (v18) {
    CFRelease(v18);
  }
  sub_10002B464(v45);
  sub_10002B670();
  return 0LL;
}

CFStringRef sub_10002E09C(const __CFString *a1, int a2)
{
  buffer[0] = 0;
  if (!CFStringGetCString(a1, buffer, 64LL, 0x8000100u)) {
    return 0LL;
  }
  if (a2 == 1) {
    int v3 = "singleassertion";
  }
  else {
    int v3 = "aggregateassertion";
  }
  if (strnstr(buffer, "com.apple.", 0xAuLL) == buffer) {
    uint64_t v4 = 10LL;
  }
  else {
    uint64_t v4 = 0LL;
  }
  return CFStringCreateWithFormat(0LL, 0LL, @"com.apple.powerd.exception.%s.%s", v3, &buffer[v4]);
}

int sub_10002E170(id a1, __CFDictionary *a2)
{
  uint64_t ChannelID = IOReportChannelGetChannelID(a2);
  uint64_t ValueAtIndex = IOReportArrayGetValueAtIndex(a2, 1LL);
  IOReportArrayGetValueAtIndex(a2, 2LL);
  IOReportArrayGetValueAtIndex(a2, 3LL);
  Value = (unsigned int *)CFDictionaryGetValue((CFDictionaryRef)qword_100067A18, (const void *)(int)ChannelID);
  if (Value)
  {
    uint64_t v6 = (uint64_t)Value;
    uint64_t v7 = Value[33];
    if ((_DWORD)v7 && ValueAtIndex >= v7)
    {
      if (!notify_register_check("com.apple.powermanagement.assertionexception", &out_token))
      {
        notify_set_state(out_token, ChannelID | 0x200000000LL);
        notify_post("com.apple.powermanagement.assertionexception");
        notify_cancel(out_token);
        int v9 = (os_log_s *)qword_100067A10;
        if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          uint64_t v17 = ChannelID;
          _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Aggregate assertion exception on pid %llu.\n",  buf,  0xCu);
        }
      }

      int v10 = *(const void **)(v6 + 112);
      if (v10)
      {
        CFTypeID TypeID = CFStringGetTypeID();
      }

      else
      {
        int v10 = (const void *)sub_1000279F8(2, v6);
        *(void *)(v6 + 112) = v10;
        CFTypeID TypeID = CFStringGetTypeID();
        if (!v10) {
          return 0;
        }
      }

      if (CFGetTypeID(v10) == TypeID)
      {
        CFTypeRef v12 = CFRetain(*(CFTypeRef *)(v6 + 112));
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_10002E334;
        block[3] = &unk_100059E48;
        void block[4] = v12;
        void block[5] = ChannelID;
        dispatch_async((dispatch_queue_t)qword_1000673D0, block);
      }
    }
  }

  return 0;
}

void sub_10002E334(uint64_t a1)
{
  dispatch_time_t v2 = (os_log_s *)qword_100067A10;
  if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = 138412546;
    uint64_t v6 = v3;
    __int16 v7 = 2048;
    uint64_t v8 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "Add to aggd string %@ for pid %llu\n",  (uint8_t *)&v5,  0x16u);
  }

  CFRelease(*(CFTypeRef *)(a1 + 32));
}

void sub_10002E3F4(void *a1, int a2)
{
  dispatch_time_t v2 = (const void *)(*((_DWORD *)a1 + 13) & 0xFFFF7FFF);
  xpc_object_t value = 0LL;
  if (v2 >> 11 <= 4
    && CFDictionaryGetValueIfPresent((CFDictionaryRef)qword_100067408, v2, (const void **)&value)
    && value == a1)
  {
    *((_DWORD *)a1 + 15) = 0;
    if (CFDictionaryGetValue(*((CFDictionaryRef *)a1 + 2), @"AsyncClientAssertionId")) {
      int v6 = 14;
    }
    else {
      int v6 = a2;
    }
    sub_10002002C(v6, (uint64_t)a1);
    CFDictionaryRemoveValue((CFMutableDictionaryRef)qword_100067408, v2);
    __int16 v7 = (const void *)*((void *)a1 + 2);
    if (v7) {
      CFRelease(v7);
    }
    sub_1000237D8(*(_DWORD *)(*((void *)a1 + 9) + 96LL));
    uint64_t v8 = *((void *)a1 + 11);
    if (v8) {
      sub_1000237D8(*(_DWORD *)(v8 + 96));
    }
    int v9 = (dispatch_source_s *)*((void *)a1 + 12);
    if (v9)
    {
      int v10 = *((_DWORD *)a1 + 6);
      if ((v10 & 0x100) == 0)
      {
        *((_DWORD *)a1 + 6) = v10 | 0x100;
        dispatch_resume(v9);
        int v9 = (dispatch_source_s *)*((void *)a1 + 12);
      }

      dispatch_source_cancel(v9);
    }

    *((_OWORD *)a1 + 5) = 0u;
    *((_OWORD *)a1 + 6) = 0u;
    *((_OWORD *)a1 + 3) = 0u;
    *((_OWORD *)a1 + 4) = 0u;
    *((_OWORD *)a1 + 1) = 0u;
    *((_OWORD *)a1 + 2) = 0u;
    *(_OWORD *)a1 = 0u;
    free(a1);
  }

void sub_10002E4FC(uint64_t a1, int a2)
{
  unsigned int v4 = *(_DWORD *)(a1 + 48);
  int v5 = *(_DWORD *)(a1 + 24);
  if ((v5 & 1) != 0)
  {
    sub_10002A50C(a1, (uint64_t)&unk_100067A90 + 160 * v4, 1, 1);
  }

  else
  {
    if ((v5 & 2) != 0)
    {
      uint64_t v8 = *(void *)a1;
      if (*(void *)a1) {
        *(void *)(v8 + _Block_object_dispose(va, 8) = *(void *)(a1 + 8);
      }
      **(void **)(a1 + _Block_object_dispose(va, 8) = v8;
      *(_DWORD *)(a1 + 24) = v5 & 0xFFFFFFFD;
      if (a2) {
        goto LABEL_9;
      }
      return;
    }

    sub_10002A144(a1, (uint64_t)&unk_100067A90 + 160 * v4, 1);
  }

  if (*(_DWORD *)(a1 + 48) == 5)
  {
    int v6 = *(_DWORD *)(*(void *)(a1 + 72) + 96LL);
    if (v6 != getpid()) {
      sub_100027678();
    }
  }

  if (a2)
  {
LABEL_9:
    __int16 v7 = (void (*)(char *, uint64_t))*((void *)&unk_100067A90 + 20 * v4 + 16);
    if (v7) {
      v7((char *)&unk_100067A90 + 160 * v4, 1LL);
    }
  }

void sub_10002E5EC(uint64_t a1, void *a2)
{
  if (*(_DWORD *)(a2[9] + 96LL) == *(_DWORD *)(a1 + 40))
  {
    sub_10002E4FC((uint64_t)a2, 0);
    uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 32LL);
    *a2 = v4;
    if (v4) {
      *(void *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 32LL) + 8LL) = a2;
    }
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 32LL) = a2;
    a2[1] = *(void *)(*(void *)(a1 + 32) + 8LL) + 32LL;
  }

void sub_10002E66C(const void *a1, const __CFNumber *a2, uint64_t a3)
{
  double v32 = 0.0;
  CFTypeID TypeID = CFStringGetTypeID();
  if (a1 && CFGetTypeID(a1) == TypeID)
  {
    unsigned int v7 = *(_DWORD *)(a3 + 48);
    if (CFEqual(a1, @"AssertLevel"))
    {
      CFTypeID v8 = CFNumberGetTypeID();
      if (a2 && CFGetTypeID(a2) == v8)
      {
        CFNumberGetValue(a2, kCFNumberIntType, &valuePtr);
        int v9 = *(_DWORD *)(a3 + 24);
        if ((v9 & 2) == 0 || valuePtr != 255)
        {
          if (*(_DWORD *)(a3 + 24) & 2 | valuePtr)
          {
LABEL_38:
            CFDictionarySetValue(*(CFMutableDictionaryRef *)(a3 + 16), a1, a2);
            return;
          }

          unsigned int v10 = v9 | 2;
          goto LABEL_36;
        }

uint64_t sub_10002EA3C(uint64_t a1)
{
  uint64_t v2 = 3758097090LL;
  unint64_t v3 = sub_100039ACC();
  int v51 = 0;
  double v49 = 0.0;
  xpc_object_t value = 0LL;
  uint64_t v4 = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"AssertType");
  unsigned int v5 = sub_100025F14(v4);
  if ((v5 & 0x80000000) != 0) {
    return v2;
  }
  unsigned int v6 = v5;
  *(_DWORD *)(a1 + 4_Block_object_dispose(va, 8) = v5;
  if (CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"AsyncClientAssertionId"))
  {
    unsigned int v7 = (const __CFNumber *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"GlobalUniqueID");
    if (!v7)
    {
      if (os_log_type_enabled((os_log_t)qword_100067A10, OS_LOG_TYPE_ERROR)) {
        sub_100043368();
      }
      return v2;
    }

    CFNumberGetValue(v7, kCFNumberSInt64Type, &valuePtr);
    *(void *)(*(void *)(a1 + 72) + 144LL) = valuePtr;
  }

  else
  {
    unint64_t valuePtr = (v6 << 16) | (v3 << 32) | *(unsigned __int16 *)(a1 + 52);
    CFNumberRef v8 = CFNumberCreate(0LL, kCFNumberSInt64Type, &valuePtr);
    if (v8)
    {
      CFNumberRef v9 = v8;
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 16), @"GlobalUniqueID", v8);
      CFRelease(v9);
    }
  }

  CFNumberRef v10 = CFNumberCreate(0LL, kCFNumberSInt32Type, (const void *)(a1 + 52));
  if (v10)
  {
    CFNumberRef v11 = v10;
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 16), @"AssertionId", v10);
    CFRelease(v11);
  }

  uint64_t v12 = *(void *)(a1 + 72);
  double v13 = *(const void **)(v12 + 80);
  if (v13)
  {
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 16), @"Process Name", v13);
    uint64_t v12 = *(void *)(a1 + 72);
  }

  CFNumberRef v14 = CFNumberCreate(0LL, kCFNumberIntType, (const void *)(v12 + 96));
  if (v14)
  {
    CFNumberRef v15 = v14;
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 16), @"AssertPID", v14);
    CFRelease(v15);
  }

  *(void *)(a1 + 32) = 0LL;
  if (CFDictionaryGetValueIfPresent(*(CFDictionaryRef *)(a1 + 16), @"AssertStartWhen", (const void **)&value)
    && (v16 = value, CFTypeID TypeID = CFDateGetTypeID(), v16)
    && CFGetTypeID(v16) == TypeID
    && (Current = CFAbsoluteTimeGetCurrent(), double v19 = Current - CFDateGetAbsoluteTime((CFDateRef)value), v19 > 0.0))
  {
    unint64_t v20 = v3 - (unint64_t)v19;
    *(void *)(a1 + 32) = v20;
  }

  else
  {
    unint64_t v20 = *(void *)(a1 + 32);
  }

  unsigned int v21 = v6;
  if (!v20)
  {
    CFAbsoluteTime v22 = CFAbsoluteTimeGetCurrent();
    CFDateRef v23 = CFDateCreate(0LL, v22);
    xpc_object_t value = v23;
    if (v23)
    {
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 16), @"AssertStartWhen", v23);
      CFRelease(value);
    }

    *(void *)(a1 + 32) = v3;
  }

  int v24 = (const __CFNumber *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"AssertLevel");
  CFTypeID v25 = CFNumberGetTypeID();
  if (v24 && CFGetTypeID(v24) == v25)
  {
    CFNumberGetValue(v24, kCFNumberIntType, &v52);
    if (!v52)
    {
      int v26 = (char *)&unk_100067A90 + 160 * v6;
      uint64_t v29 = *((void *)v26 + 3);
      unint64_t v27 = (uint64_t *)(v26 + 24);
      uint64_t v28 = v29;
      *(void *)a1 = v29;
      if (v29) {
        *(void *)(v28 + _Block_object_dispose(va, 8) = a1;
      }
      uint64_t v2 = 0LL;
      *unint64_t v27 = a1;
      *(void *)(a1 + _Block_object_dispose(va, 8) = v27;
      *(_DWORD *)(a1 + 24) = *(_DWORD *)(a1 + 24) & 0xFFFFFFFC | 2;
      return v2;
    }
  }

  else
  {
    int v51 = 255;
    CFNumberRef v30 = CFNumberCreate(0LL, kCFNumberIntType, &v51);
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 16), @"AssertLevel", v30);
    CFRelease(v30);
  }

  uint64_t v31 = (char *)&unk_100067A90 + 160 * v6;
  if ((*v31 & 1) != 0)
  {
    CFBooleanRef v32 = (CFBooleanRef)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"AppliesToLimitedPower");
    CFTypeID v33 = CFBooleanGetTypeID();
    if (v32)
    {
      if (CFGetTypeID(v32) == v33 && v32 == kCFBooleanTrue) {
        *(_DWORD *)(a1 + 24) |= 4u;
      }
    }
  }

  if (*(_DWORD *)(a1 + 48) == 14)
  {
    uint64_t v47 = kCFBooleanFalse;
    if (CFDictionaryGetValueIfPresent(*(CFDictionaryRef *)(a1 + 16), @"ExitSilentRunning", (const void **)&v47))
    {
      if (v47 == kCFBooleanTrue) {
        *(_DWORD *)(a1 + 24) |= 0x200u;
      }
    }
  }

  __int16 v34 = (const __CFNumber *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"AssertionOnBehalfOfPID");
  CFTypeID v35 = CFNumberGetTypeID();
  if (v34 && CFGetTypeID(v34) == v35) {
    CFNumberGetValue(v34, kCFNumberIntType, (void *)(a1 + 80));
  }
  CFBooleanRef v36 = (CFBooleanRef)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"AppliesOnLidClose");
  CFTypeID v37 = CFBooleanGetTypeID();
  if (v36 && CFGetTypeID(v36) == v37 && v36 == kCFBooleanTrue) {
    *(_DWORD *)(a1 + 24) |= 8u;
  }
  uint64_t v38 = (const __CFNumber *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"TimeoutSeconds");
  CFTypeID v39 = CFNumberGetTypeID();
  if (v38 && CFGetTypeID(v38) == v39) {
    CFNumberGetValue(v38, kCFNumberDoubleType, &v49);
  }
  double v40 = v49;
  if ((*v31 & 0x10) != 0)
  {
    uint64_t v41 = (unint64_t *)((char *)&unk_100067A90 + 160 * v6);
    double v42 = (double)v41[12];
    if (v49 == 0.0 || v49 > v42)
    {
      double v49 = (double)v41[12];
      double v40 = v42;
    }
  }

  if (v40 == 0.0)
  {
    sub_10002A0C4(a1, (char *)&unk_100067A90 + 160 * v6, 1LL);
  }

  else
  {
    *(void *)(a1 + 4sub_1000262C4(0x12u, 0) = *(void *)(a1 + 32) + (unint64_t)v40;
    sub_10002A738(a1, (uint64_t)&unk_100067A90 + 160 * v6, 1, 1);
  }

  if (v6 == 5)
  {
    uint64_t v43 = *(const void **)(*(void *)(a1 + 72) + 80LL);
    CFTypeID v44 = CFStringGetTypeID();
    if (v43)
    {
      if (CFGetTypeID(v43) == v44 && (CFEqual(v43, @"ME32ExporterHel") || CFEqual(v43, @"MRMovieServer"))) {
        sub_100026124();
      }
    }
  }

  uint64_t v45 = (void (*)(_BYTE *, void))*((void *)&unk_100067A90 + 20 * v21 + 16);
  if (v45) {
    v45(v31, 0LL);
  }
  if (qword_100067A78
    && !byte_100067A69
    && !CFDictionaryContainsKey((CFDictionaryRef)qword_100067A78, *(const void **)(*(void *)(a1 + 72) + 80LL)))
  {
    sub_10002D1D4();
  }

  nullsub_4(0LL, a1);
  return 0LL;
}

void sub_10002F008(uint64_t a1, uint64_t a2)
{
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL)) {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = CFArrayCreateMutable(0LL, 0LL, &kCFTypeArrayCallBacks);
  }
  uint64_t v4 = *(unsigned int *)(a2 + 48);
  if (v4 <= 0x13) {
    CFDictionarySetValue( *(CFMutableDictionaryRef *)(a2 + 16),  @"AssertionTrueType",  (const void *)qword_100067410[v4]);
  }
  CFArrayAppendValue(*(CFMutableArrayRef *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL), *(const void **)(a2 + 16));
}

void sub_10002F090(uint64_t a1, uint64_t a2)
{
  int v3 = *(_DWORD *)(a1 + 40);
  if ((*(_BYTE *)(a2 + 24) & 2) != 0)
  {
    if (v3 != 1) {
      return;
    }
  }

  else if (v3)
  {
    return;
  }

  uint64_t v4 = *(const __CFDictionary **)(a1 + 32);
  CFNumberRef v5 = CFNumberCreate(0LL, kCFNumberIntType, (const void *)(*(void *)(a2 + 72) + 96LL));
  Value = (const __CFDictionary *)CFDictionaryGetValue(v4, v5);
  unsigned int v7 = Value;
  if (Value)
  {
    CFMutableArrayRef Mutable = (void *)CFDictionaryGetValue(Value, @"PerTaskAssertions");
    CFNumberRef v9 = v7;
  }

  else
  {
    CFMutableArrayRef Mutable = CFArrayCreateMutable(0LL, 0LL, &kCFTypeArrayCallBacks);
    CFNumberRef v9 = CFDictionaryCreateMutable( kCFAllocatorDefault,  2LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    CFDictionarySetValue(v9, @"PerTaskAssertions", Mutable);
    CFDictionarySetValue(v9, @"AssertPID", v5);
    CFDictionarySetValue(v4, v5, v9);
  }

  uint64_t v10 = *(unsigned int *)(a2 + 48);
  if (v10 <= 0x13) {
    CFDictionarySetValue( *(CFMutableDictionaryRef *)(a2 + 16),  @"AssertionTrueType",  (const void *)qword_100067410[v10]);
  }
  CFArrayAppendValue((CFMutableArrayRef)Mutable, *(const void **)(a2 + 16));
  CFRelease(v5);
  if (!v7)
  {
    CFRelease(Mutable);
    CFRelease(v9);
  }

void sub_10002F1F4(uint64_t a1, unint64_t a2)
{
  if (*(_DWORD *)(a1 + 40))
  {
    if ((**(_BYTE **)(a1 + 32) & 1) != 0) {
      sub_100028818(a2, 0);
    }
    sub_1000285A0(a2);
  }

  else
  {
    if ((*(_BYTE *)(a2 + 24) & 4) == 0 && (**(_BYTE **)(a1 + 32) & 1) != 0) {
      sub_100028818(a2, 1);
    }
    sub_100028794(a2);
  }

void sub_10002F264(id a1, assertion *a2)
{
}

void sub_10002F26C(id a1, assertion *a2)
{
}

void sub_10002F274(uint64_t a1)
{
}

void sub_10002F27C(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 56LL) = 0LL;
}

  ;
}

  ;
}

  ;
}

  ;
}

  ;
}

void sub_10002F30C(uint64_t a1@<X8>)
{
  *(void *)(v1 - _Block_object_dispose(va, 8) = a1;
}

  ;
}

  ;
}

void sub_10002F370(id a1)
{
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS___USBDeviceMode);
  uint64_t v2 = (void *)qword_1000674E8;
  qword_1000674E8 = (uint64_t)v1;
}

id sub_10002F6A0(uint64_t a1, uint64_t a2)
{
  int v3 = (void *)qword_100068808;
  if (os_log_type_enabled((os_log_t)qword_100068808, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void **)(a1 + 32);
    CFNumberRef v5 = v3;
    v7[0] = 67109120;
    v7[1] = [v4 isACPowered];
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Power source update. AC powered %d",  (uint8_t *)v7,  8u);
  }

  return [*(id *)(a1 + 32) evaluatePowerAssertion];
}

uint64_t sub_10002F99C(void *a1, io_iterator_t iterator)
{
  uint64_t result = IOIteratorNext(iterator);
  if ((_DWORD)result)
  {
    uint64_t v5 = result;
    do
    {
      [a1 _handleServiceAdded:v5];
      IOObjectRelease(v5);
      uint64_t result = IOIteratorNext(iterator);
      uint64_t v5 = result;
    }

    while ((_DWORD)result);
  }

  return result;
}

id sub_10002FDE4(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [a1 _handleNotificationForService:a2 messageType:a3 messageArgument:a4];
}

void sub_1000302D4(uint64_t a1)
{
  if ([*(id *)(a1 + 32) powerassertionID]
    || ([*(id *)(a1 + 32) powerassertion] & 1) != 0)
  {
    uint64_t v2 = (os_log_s *)qword_100068808;
    if (os_log_type_enabled((os_log_t)qword_100068808, OS_LOG_TYPE_DEBUG)) {
      sub_100043568(v2);
    }
  }

  else
  {
    int v3 =  sub_100026D08( @"PreventUserIdleSystemSleep",  @"Powerd - prevent sleep while in usb device mode",  0LL,  0LL,  0LL,  0LL,  0.0);
    uint64_t v4 = (os_log_s *)qword_100068808;
    if (os_log_type_enabled((os_log_t)qword_100068808, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned int v6 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Raising assertion for usb device mode",  v6,  2u);
    }

    uint64_t v5 = CFArrayCreateMutable(0LL, 0LL, &kCFTypeArrayCallBacks);
    CFArrayAppendValue(v5, @"perf-unrestricted");
    CFDictionarySetValue(v3, @"ResourcesUsed", v5);
    CFDictionarySetValue(v3, @"AllowsDeviceRestart", kCFBooleanTrue);
    sub_100026E94(v3, *(void *)(a1 + 32) + 16LL);
    [*(id *)(a1 + 32) setPowerassertion:1];
  }

id sub_100030490(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) powerassertionID];
  if ((_DWORD)result)
  {
    int v3 = (os_log_s *)qword_100068808;
    if (os_log_type_enabled((os_log_t)qword_100068808, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Releasing power assertion for usb device mode",  v4,  2u);
    }

    sub_100027584((int)[*(id *)(a1 + 32) powerassertionID]);
    [*(id *)(a1 + 32) setPowerassertionID:0];
    return [*(id *)(a1 + 32) setPowerassertion:0];
  }

  return result;
}

void sub_100030774()
{
  unsigned int valuePtr = -1;
  v45[0] = -1;
  io_registry_entry_t v0 = sub_10000AD18();
  CFTypeRef CFProperty = (const __CFDictionary *)IORegistryEntryCreateCFProperty( v0,  @"Power Status",  kCFAllocatorDefault,  0);
  if (!CFProperty) {
    return;
  }
  uint64_t v2 = CFProperty;
  CFIndex Count = CFDictionaryGetCount(CFProperty);
  if (!Count) {
    goto LABEL_15;
  }
  CFIndex v4 = Count;
  size_t v5 = 8 * Count;
  unsigned int v6 = (const void **)malloc(8 * Count);
  unsigned int v7 = (const void **)malloc(v5);
  CFNumberRef v8 = v7;
  if (v6) {
    BOOL v9 = v7 == 0LL;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    uint64_t v10 = 0LL;
    CFNumberRef v11 = 0LL;
    if (v6) {
      goto LABEL_70;
    }
    if (!v7) {
      goto LABEL_11;
    }
LABEL_10:
    free(v8);
    goto LABEL_11;
  }

  CFDictionaryGetKeysAndValues(v2, v6, v7);
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0LL, v4, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!Mutable)
  {
    uint64_t v10 = 0LL;
    CFNumberRef v11 = 0LL;
    goto LABEL_70;
  }

  uint64_t v41 = v6;
  CFDictionaryRef theDict = Mutable;
  if (v4 >= 1)
  {
    CFNumberRef v14 = v8;
    double v13 = v6;
    for (CFIndex i = v4; i; --i)
    {
      CFTypeRef v16 = *v13;
      int v17 = CFEqual(*v13, @"Thermal_Level_Warning");
      int v18 = @"ThermalWarning";
      if (v17
        || (int v19 = CFEqual(v16, @"CPU_Power_Limits"), v18 = @"CPUPower", v19)
        || (int v20 = CFEqual(v16, @"Performance_Warning"), v18 = @"PerformanceWarning", v20))
      {
        CFStringRef v21 = SCDynamicStoreKeyCreate( kCFAllocatorDefault,  @"%@%@/%@",  kSCDynamicStoreDomainState,  @"/IOKit/Power",  v18);
        if (v21)
        {
          CFStringRef v22 = v21;
          CFDictionarySetValue(theDict, v21, *v14);
          CFRelease(v22);
        }
      }

      if (CFStringCompare((CFStringRef)*v13, @"Thermal_Level_Warning", 0LL))
      {
        if (CFStringCompare((CFStringRef)*v13, @"Performance_Warning", 0LL)) {
          goto LABEL_42;
        }
        CFDateRef v23 = *v14;
        CFTypeID TypeID = CFNumberGetTypeID();
        if (!v23) {
          goto LABEL_42;
        }
        if (CFGetTypeID(v23) != TypeID) {
          goto LABEL_42;
        }
        CFNumberGetValue((CFNumberRef)*v14, kCFNumberIntType, &valuePtr);
        uint64_t v26 = valuePtr;
        if (valuePtr == dword_1000674F8) {
          goto LABEL_42;
        }
      }

      else
      {
        unint64_t v27 = *v14;
        CFTypeID v28 = CFNumberGetTypeID();
        if (!v27) {
          goto LABEL_42;
        }
        if (CFGetTypeID(v27) != v28) {
          goto LABEL_42;
        }
        CFNumberGetValue((CFNumberRef)*v14, kCFNumberIntType, v45);
        if (v45[0] == dword_100066DA4) {
          goto LABEL_42;
        }
        BOOL v29 = v45[0] == 100 || v45[0] == 110;
        int v30 = v29;
        sub_100030C48(32LL, v30);
        sub_1000311C8();
        uint64_t v26 = v45[0];
        if (v45[0] == 255) {
          goto LABEL_42;
        }
      }

      nullsub_4(v26, v25);
LABEL_42:
      ++v14;
      ++v13;
    }
  }

  uint64_t v31 = SCDynamicStoreCreate(0LL, @"IOKit Power", 0LL, 0LL);
  CFNumberRef v11 = v31;
  if (!v31)
  {
LABEL_69:
    unsigned int v6 = v41;
    uint64_t v10 = theDict;
    goto LABEL_70;
  }

  uint64_t v10 = theDict;
  SCDynamicStoreSetMultiple(v31, theDict, 0LL, 0LL);
  if (v4 < 1) {
    goto LABEL_70;
  }
  int v32 = 0;
  CFTypeID v33 = (CFStringRef *)v41;
  do
  {
    if (CFStringCompare(*v33, @"Thermal_Level_Warning", 0LL))
    {
      if (CFStringCompare(*v33, @"Performance_Warning", 0LL) == kCFCompareEqualTo)
      {
        if (valuePtr == dword_1000674F8) {
          goto LABEL_59;
        }
        dword_1000674F8 = valuePtr;
        if (valuePtr == 100) {
          int v32 = 1;
        }
      }
    }

    else
    {
      if (v45[0] == dword_100066DA4) {
        goto LABEL_59;
      }
      dword_100066DA4 = v45[0];
      if (v45[0] == 110 || v45[0] == 100) {
        int v32 = 1;
      }
    }

    CFStringRef v34 = *v33;
    int v35 = CFEqual(*v33, @"Thermal_Level_Warning");
    CFBooleanRef v36 = "com.apple.system.power.thermal_warning";
    if (v35
      || (v37 = CFEqual(v34, @"CPU_Power_Limits"), CFBooleanRef v36 = "com.apple.system.power.CPU", v37)
      || (v38 = CFEqual(v34, @"Performance_Warning"), CFBooleanRef v36 = "com.apple.system.power.performance_warning", v38))
    {
      notify_post(v36);
    }

uint64_t sub_100030C48(uint64_t result, int a2)
{
  if (a2) {
    uint64_t v2 = qword_100067500 | (int)result;
  }
  else {
    uint64_t v2 = qword_100067500 & ~(_DWORD)result;
  }
  qword_100067500 = v2;
  return result;
}

BOOL sub_100030C78(const void *a1)
{
  uint64_t v2 = (const __CFDictionary *)IOPMCopySystemPowerSettings();
  BOOL result = 0LL;
  if (a1)
  {
    if (v2)
    {
      CFBooleanRef Value = (CFBooleanRef)CFDictionaryGetValue(v2, a1);
      CFRelease(v2);
      return Value == kCFBooleanTrue;
    }
  }

  return result;
}

CFNumberRef sub_100030CD4(const void *a1)
{
  BOOL result = 0LL;
  int valuePtr = 0;
  if (a1 && qword_100067508)
  {
    else {
      int v3 = @"Battery Power";
    }
    CFBooleanRef Value = (const __CFDictionary *)CFDictionaryGetValue((CFDictionaryRef)qword_100067508, v3);
    CFTypeID TypeID = CFDictionaryGetTypeID();
    if (Value && CFGetTypeID(Value) == TypeID)
    {
      BOOL result = (const __CFNumber *)CFDictionaryGetValue(Value, a1);
      if (result)
      {
        CFNumberGetValue(result, kCFNumberIntType, &valuePtr);
        return (const __CFNumber *)(valuePtr != 0);
      }
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

uint64_t sub_100030D8C(const void *a1, void *a2)
{
  uint64_t result = 3758097090LL;
  if (a1 && qword_100067508)
  {
    else {
      size_t v5 = @"Battery Power";
    }
    CFBooleanRef Value = CFDictionaryGetValue((CFDictionaryRef)qword_100067508, v5);
    CFTypeID TypeID = CFDictionaryGetTypeID();
    if (Value
      && CFGetTypeID(Value) == TypeID
      && (v8 = CFDictionaryGetValue((CFDictionaryRef)Value, a1), CFTypeID v9 = CFNumberGetTypeID(), v8))
    {
      CFTypeID v10 = v9;
      CFTypeID v11 = CFGetTypeID(v8);
      uint64_t result = 3758097084LL;
      if (v11 == v10)
      {
        CFNumberGetValue((CFNumberRef)v8, kCFNumberSInt64Type, a2);
        return 0LL;
      }
    }

    else
    {
      return 3758097084LL;
    }
  }

  return result;
}

uint64_t sub_100030E6C(_DWORD *a1)
{
  uint64_t v1 = 3758097084LL;
  if (a1 && qword_100067508)
  {
    CFBooleanRef Value = CFDictionaryGetValue((CFDictionaryRef)qword_100067508, (const void *)qword_100067510);
    CFTypeID TypeID = CFDictionaryGetTypeID();
    if (Value)
    {
      if (CFGetTypeID(Value) == TypeID) {
        uint64_t v5 = (uint64_t)Value;
      }
      else {
        uint64_t v5 = 0LL;
      }
    }

    else
    {
      uint64_t v5 = 0LL;
    }

    else {
      return 3758097084LL;
    }
  }

  return v1;
}

uint64_t sub_100030EFC(uint64_t result, const void *a2, CFNumberType a3, _DWORD *a4)
{
  if (result)
  {
    CFBooleanRef Value = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)result, a2);
    *a4 = 0;
    CFTypeID TypeID = CFNumberGetTypeID();
    if (Value)
    {
      if (CFGetTypeID(Value) == TypeID)
      {
        CFNumberGetValue(Value, a3, a4);
        return 1LL;
      }

      CFTypeID v8 = CFBooleanGetTypeID();
      if (CFGetTypeID(Value) == v8)
      {
        *a4 = CFBooleanGetValue(Value);
        return 1LL;
      }
    }

    else
    {
      CFBooleanGetTypeID();
    }

    return 0LL;
  }

  return result;
}

uint64_t sub_100030F9C(_DWORD *a1)
{
  uint64_t v1 = 3758097084LL;
  if (a1 && qword_100067508)
  {
    if (qword_100066DA8 == -1)
    {
      CFBooleanRef Value = CFDictionaryGetValue((CFDictionaryRef)qword_100067508, (const void *)qword_100067510);
      CFTypeID TypeID = CFDictionaryGetTypeID();
      if (Value)
      {
        if (CFGetTypeID(Value) == TypeID) {
          uint64_t v5 = (uint64_t)Value;
        }
        else {
          uint64_t v5 = 0LL;
        }
      }

      else
      {
        uint64_t v5 = 0LL;
      }

      else {
        return 3758097084LL;
      }
    }

    else
    {
      uint64_t v1 = 0LL;
      *(void *)a1 = qword_100066DA8;
    }
  }

  return v1;
}

void sub_100031048(io_connect_t a1, int a2)
{
  if (a1)
  {
    io_connect_t v3 = 0;
    goto LABEL_4;
  }

  a1 = IOPMFindPowerManagement(0);
  io_connect_t v3 = a1;
  if (a1)
  {
LABEL_4:
    IOPMSetAggressiveness(a1, 1uLL, (dword_100066DB0 * a2));
    if (v3) {
      IOServiceClose(v3);
    }
    return;
  }

  CFIndex v4 = (os_log_s *)qword_100068810;
  if (os_log_type_enabled((os_log_t)qword_100068810, OS_LOG_TYPE_ERROR)) {
    sub_1000435A4(v4);
  }
}

void sub_1000310C8(int a1)
{
  int v2 = sub_100030E6C(&v5);
  if (v2)
  {
    int v3 = v2;
    CFIndex v4 = (os_log_s *)qword_100068810;
    if (os_log_type_enabled((os_log_t)qword_100068810, OS_LOG_TYPE_ERROR)) {
      sub_1000435E4(v3, v4);
    }
  }

  else
  {
    dword_100066DB0 = a1;
    sub_100031048(0, v5);
  }

uint64_t sub_100031134(CFPropertyListRef value)
{
  return CFPreferencesSynchronize(@"com.apple.PowerManagement", kCFPreferencesAnyUser, kCFPreferencesCurrentHost);
}

CFPropertyListRef sub_10003119C()
{
  return CFPreferencesCopyValue( @"AlarmData",  @"com.apple.PowerManagement",  kCFPreferencesAnyUser,  kCFPreferencesCurrentHost);
}

void sub_1000311C8()
{
  if (qword_100067508)
  {
    uint64_t v0 = qword_100067500;
    if (qword_100067518 != qword_100067500)
    {
      uint64_t v1 = qword_100066DA8;
      if ((qword_100067500 ^ qword_100067518) != 4 || qword_100066DA8 == -1) {
        goto LABEL_16;
      }
      io_connect_t v3 = dword_100067520;
      if (!dword_100067520)
      {
        io_connect_t v3 = IOPMFindPowerManagement(0);
        dword_100067520 = v3;
        uint64_t v0 = qword_100067500;
        if (!v3) {
          goto LABEL_16;
        }
        uint64_t v1 = qword_100066DA8;
      }

      if ((v0 & 4) != 0) {
        unint64_t v4 = 0LL;
      }
      else {
        unint64_t v4 = v1;
      }
      if (!IOPMSetAggressiveness(v3, 3uLL, v4))
      {
        qword_100067518 = qword_100067500;
        return;
      }

      dword_100067520 = 0;
      uint64_t v0 = qword_100067500;
LABEL_16:
      qword_100067518 = v0;
      sub_100031298((const __CFDictionary *)qword_100067508, (const __CFString *)qword_100067510);
    }
  }

uint64_t sub_100031298(const __CFDictionary *a1, const __CFString *a2)
{
  uint64_t v2 = 3758097084LL;
  uint64_t valuePtr = -1LL;
  uint64_t v25 = -1LL;
  int v22 = 0;
  int v23 = 1;
  if (!a1) {
    return 3758097090LL;
  }
  if (!a2) {
    a2 = @"AC Power";
  }
  CFBooleanRef Value = (const __CFDictionary *)CFDictionaryGetValue(a1, a2);
  CFTypeID TypeID = CFDictionaryGetTypeID();
  if (Value && CFGetTypeID(Value) == TypeID)
  {
    int v5 = (const __CFNumber *)CFDictionaryGetValue(Value, @"System Sleep Timer");
    CFTypeID v6 = CFNumberGetTypeID();
    if (v5 && CFGetTypeID(v5) == v6) {
      CFNumberGetValue(v5, kCFNumberLongType, &valuePtr);
    }
    unsigned int v7 = (const __CFNumber *)CFDictionaryGetValue(Value, @"Display Sleep Timer");
    CFTypeID v8 = CFNumberGetTypeID();
    if (v7 && CFGetTypeID(v7) == v8) {
      CFNumberGetValue(v7, kCFNumberLongType, &v25);
    }
    uint64_t v9 = qword_100066DA8;
    uint64_t v10 = valuePtr;
    if (qword_100066DA8 != valuePtr || qword_100066DB8 != v25)
    {
      CFTypeID v11 = (os_log_s *)qword_100068810;
      if (os_log_type_enabled((os_log_t)qword_100068810, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        uint64_t v27 = v10;
        __int16 v28 = 2048;
        uint64_t v29 = v25;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Sleep timer %lu display timer %lu\n",  buf,  0x16u);
        uint64_t v9 = valuePtr;
      }

      else
      {
        uint64_t v9 = v10;
      }
    }

    if (v9 != -1) {
      qword_100066DA8 = v9;
    }
    if (v25 != -1) {
      qword_100066DB8 = v25;
    }
    if (!qword_100067500)
    {
      uint64_t v2 = sub_10003188C(Value, 1);
LABEL_49:
      int v19 = (const __SCDynamicStore *)sub_100038238();
      CFPropertyListRef v20 = SCDynamicStoreCopyValue(v19, @"State:/IOKit/PowerManagement/CurrentSettings");
      CFTypeID v21 = CFDictionaryGetTypeID();
      if (v20)
      {
        if (CFGetTypeID(v20) != v21 || !CFEqual(v20, Value)) {
          sub_100038120(@"State:/IOKit/PowerManagement/CurrentSettings", Value);
        }
        CFRelease(v20);
      }

      else
      {
        sub_100038120(@"State:/IOKit/PowerManagement/CurrentSettings", Value);
      }

      return v2;
    }

    CFIndex Count = CFDictionaryGetCount(Value);
    CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(kCFAllocatorDefault, Count, Value);
    if (!MutableCopy) {
      return v2;
    }
    CFNumberRef v15 = MutableCopy;
    CFNumberRef v16 = CFNumberCreate(0LL, kCFNumberIntType, &v23);
    CFNumberRef v17 = CFNumberCreate(0LL, kCFNumberIntType, &v22);
    char v18 = qword_100067500;
    if ((qword_100067500 & 1) != 0 && v16)
    {
      CFDictionarySetValue(v15, @"Reduce Processor Speed", v16);
      char v18 = qword_100067500;
    }

    if ((v18 & 2) != 0 && v17)
    {
      CFDictionarySetValue(v15, @"Reduce Processor Speed", v17);
      CFDictionarySetValue(v15, @"Dynamic Power Step", v17);
      char v18 = qword_100067500;
    }

    if ((v18 & 4) != 0 && v17)
    {
      CFDictionarySetValue(v15, @"System Sleep Timer", v17);
      char v18 = qword_100067500;
    }

    if ((v18 & 8) != 0 && v17)
    {
      CFDictionarySetValue(v15, @"Display Sleep Timer", v17);
      char v18 = qword_100067500;
    }

    if ((v18 & 0x10) != 0 && v17)
    {
      CFDictionarySetValue(v15, @"Disk Sleep Timer", v17);
      char v18 = qword_100067500;
    }

    if ((v18 & 0x20) != 0 && v17)
    {
      CFDictionarySetValue(v15, @"Wake On LAN", v17);
    }

    else if (!v17)
    {
LABEL_46:
      if (v16) {
        CFRelease(v16);
      }
      uint64_t v2 = sub_10003188C(v15, 1);
      CFRelease(v15);
      goto LABEL_49;
    }

    CFRelease(v17);
    goto LABEL_46;
  }

  return v2;
}

_DWORD *sub_100031664(_DWORD *result)
{
  int v1 = result[5];
  if (((v1 ^ result[4]) & 1) != 0)
  {
    int v2 = result[2];
    if ((v1 & 1) != 0)
    {
      if ((v2 & 2) != 0)
      {
        byte_100067528 = 0;
        if (byte_100067530 == 1)
        {
          if (qword_100067510)
          {
            if (CFEqual((CFTypeRef)qword_100067510, @"AC Power")) {
              unint64_t v3 = 2LL;
            }
            else {
              unint64_t v3 = 1LL;
            }
          }

          else
          {
            unint64_t v3 = 1LL;
          }

          byte_100067530 = 0;
          byte_100067528 = 0;
          return (_DWORD *)IOPMSetAggressiveness(dword_100067534, 6uLL, v3);
        }
      }
    }

    else if ((v2 & 1) != 0)
    {
      byte_100067528 = 1;
    }
  }

  return result;
}

CFDictionaryRef sub_10003170C()
{
  active = (const __CFDictionary *)IOPMCopyActivePMPreferences();
  if (!active) {
    return 0LL;
  }
  int v1 = active;
  CFBooleanRef Value = (const __CFDictionary *)CFDictionaryGetValue(active, (const void *)qword_100067510);
  CFTypeID TypeID = CFDictionaryGetTypeID();
  if (Value)
  {
    if (CFGetTypeID(Value) == TypeID) {
      CFBooleanRef Value = CFDictionaryCreateCopy(kCFAllocatorDefault, Value);
    }
    else {
      CFBooleanRef Value = 0LL;
    }
  }

  CFRelease(v1);
  return Value;
}

CFNumberRef sub_100031798()
{
  int valuePtr = 0;
  uint64_t result = (const __CFNumber *)qword_100067508;
  if (qword_100067508)
  {
    CFBooleanRef Value = (const __CFDictionary *)CFDictionaryGetValue((CFDictionaryRef)qword_100067508, @"AC Power");
    CFTypeID TypeID = CFDictionaryGetTypeID();
    if (Value && CFGetTypeID(Value) == TypeID)
    {
      uint64_t result = (const __CFNumber *)CFDictionaryGetValue(Value, @"DarkWakeBackgroundTasks");
      if (result)
      {
        CFNumberGetValue(result, kCFNumberIntType, &valuePtr);
        return (const __CFNumber *)(valuePtr != 0);
      }
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

uint64_t sub_100031828()
{
  if ((byte_100067538 & 1) != 0) {
    return 1LL;
  }
  uint64_t result = sub_10000AD18();
  if ((_DWORD)result)
  {
    CFTypeRef CFProperty = IORegistryEntryCreateCFProperty( result,  @"SystemPowerProfileOverrideDict",  kCFAllocatorDefault,  0);
    if (CFProperty)
    {
      byte_100067538 = 1;
      CFRelease(CFProperty);
    }

    return byte_100067538;
  }

  return result;
}

uint64_t sub_10003188C(const void *a1, int a2)
{
  uint64_t v4 = 3758097090LL;
  CFTypeID TypeID = CFDictionaryGetTypeID();
  if (!a1 || CFGetTypeID(a1) != TypeID) {
    return v4;
  }
  sub_100030EFC((uint64_t)a1, @"Display Sleep Timer", kCFNumberSInt32Type, &v45);
  sub_100030EFC((uint64_t)a1, @"Disk Sleep Timer", kCFNumberSInt32Type, &aggressiveness);
  sub_100030EFC((uint64_t)a1, @"System Sleep Timer", kCFNumberSInt32Type, &aggressiveness_4);
  sub_100030EFC((uint64_t)a1, @"Wake On LAN", kCFNumberSInt32Type, &v48);
  sub_100030EFC((uint64_t)a1, @"Wake On Modem Ring", kCFNumberSInt32Type, &v49);
  sub_100030EFC((uint64_t)a1, @"Automatic Restart On Power Loss", kCFNumberSInt32Type, &v50);
  sub_100030EFC((uint64_t)a1, @"Sleep On Power Button", kCFNumberSInt32Type, &v51);
  sub_100030EFC((uint64_t)a1, @"Wake On Clamshell Open", kCFNumberSInt32Type, &v52);
  sub_100030EFC((uint64_t)a1, @"Wake On AC Change", kCFNumberSInt32Type, &v53);
  sub_100030EFC((uint64_t)a1, @"Display Sleep Uses Dim", kCFNumberSInt32Type, &v54);
  sub_100030EFC((uint64_t)a1, @"Mobile Motion Module", kCFNumberSInt32Type, &v55);
  sub_100030EFC((uint64_t)a1, @"GPUSwitch", kCFNumberSInt32Type, &v56);
  sub_100030EFC((uint64_t)a1, @"Standby Enabled", kCFNumberSInt32Type, &v57);
  sub_100030EFC((uint64_t)a1, @"Standby Delay", kCFNumberSInt32Type, &v58);
  sub_100030EFC((uint64_t)a1, @"AutoPowerOff Enabled", kCFNumberSInt32Type, &v59);
  sub_100030EFC((uint64_t)a1, @"AutoPowerOff Delay", kCFNumberSInt32Type, &v60);
  io_registry_entry_t v6 = sub_10000AD18();
  int valuePtr = 1;
  CFNumberRef v7 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
  int valuePtr = 0;
  CFNumberRef v8 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
  CFNumberRef v9 = v8;
  if (v8 && v7)
  {
    io_connect_t v10 = IOPMFindPowerManagement(0);
    if (!v10)
    {
      CFTypeRef CFProperty = 0LL;
      goto LABEL_111;
    }

    int v11 = sub_10001797C();
    uint64_t v12 = @"AC Power";
    if (v11 == 2) {
      uint64_t v12 = @"Battery Power";
    }
    if (v11 == 3) {
      double v13 = @"UPS Power";
    }
    else {
      double v13 = v12;
    }
    CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(v6, @"Supported Features", kCFAllocatorDefault, 0);
    IOPMSetAggressiveness(v10, 3uLL, aggressiveness_4);
    IOPMSetAggressiveness(v10, 2uLL, aggressiveness);
    sub_100031048(v10, v45);
    else {
      unint64_t v15 = 0LL;
    }
    IOPMSetAggressiveness(v10, 4uLL, v15);
    if (a2)
    {
      if (IOPMFeatureIsAvailableWithSupportedTable(@"Display Sleep Uses Dim", v13, CFProperty))
      {
        if (v54) {
          CFNumberRef v16 = v7;
        }
        else {
          CFNumberRef v16 = v9;
        }
        IORegistryEntrySetCFProperty(v6, @"Display Sleep Uses Dim", v16);
      }

      if ((IOPMFeatureIsAvailableWithSupportedTable(@"Wake On Modem Ring", v13, CFProperty) & 1) == 0) {
        goto LABEL_40;
      }
    }

    else
    {
      if (v54) {
        CFNumberRef v20 = v7;
      }
      else {
        CFNumberRef v20 = v9;
      }
      IORegistryEntrySetCFProperty(v6, @"Display Sleep Uses Dim", v20);
    }

    if (v49) {
      CFNumberRef v21 = v7;
    }
    else {
      CFNumberRef v21 = v9;
    }
    IORegistryEntrySetCFProperty(v6, @"Wake On Modem Ring", v21);
    if (!a2)
    {
      if (v50) {
        CFNumberRef v23 = v7;
      }
      else {
        CFNumberRef v23 = v9;
      }
      IORegistryEntrySetCFProperty(v6, @"Automatic Restart On Power Loss", v23);
LABEL_51:
      if (v53) {
        CFNumberRef v24 = v7;
      }
      else {
        CFNumberRef v24 = v9;
      }
      IORegistryEntrySetCFProperty(v6, @"Wake On AC Change", v24);
      if (!a2)
      {
        uint64_t v26 = (CFTypeRef *)&kCFBooleanFalse;
        if (!v51) {
          uint64_t v26 = (CFTypeRef *)&kCFBooleanTrue;
        }
        IORegistryEntrySetCFProperty(v6, @"Sleep On Power Button", *v26);
LABEL_64:
        if (v52) {
          CFNumberRef v27 = v7;
        }
        else {
          CFNumberRef v27 = v9;
        }
        IORegistryEntrySetCFProperty(v6, @"Wake On Clamshell Open", v27);
        if (!a2)
        {
          if (v55) {
            CFNumberRef v29 = v7;
          }
          else {
            CFNumberRef v29 = v9;
          }
          IORegistryEntrySetCFProperty(v6, @"MobileMotionModule", v29);
LABEL_79:
          CFNumberRef v30 = CFNumberCreate(0LL, kCFNumberIntType, &v56);
          if (v30)
          {
            CFNumberRef v31 = v30;
            IORegistryEntrySetCFProperty(v6, @"GPUSwitch", v30);
            CFRelease(v31);
          }

          if (!a2)
          {
            CFTypeID v33 = (CFTypeRef *)&kCFBooleanTrue;
            if (!v57) {
              CFTypeID v33 = (CFTypeRef *)&kCFBooleanFalse;
            }
            IORegistryEntrySetCFProperty(v6, @"Standby Enabled", *v33);
LABEL_91:
            CFNumberRef v34 = CFNumberCreate(0LL, kCFNumberIntType, &v58);
            if (v34)
            {
              CFNumberRef v35 = v34;
              IORegistryEntrySetCFProperty(v6, @"Standby Delay", v34);
              CFRelease(v35);
            }

            if (!a2)
            {
              int v37 = (CFTypeRef *)&kCFBooleanTrue;
              if (!v59) {
                int v37 = (CFTypeRef *)&kCFBooleanFalse;
              }
              IORegistryEntrySetCFProperty(v6, @"AutoPowerOff Enabled", *v37);
LABEL_103:
              CFNumberRef v38 = CFNumberCreate(0LL, kCFNumberIntType, &v60);
              if (v38)
              {
                CFNumberRef v39 = v38;
                IORegistryEntrySetCFProperty(v6, @"AutoPowerOff Delay", v38);
                CFRelease(v39);
              }

LABEL_105:
              if (!(byte_100067539 | byte_10006753A))
              {
                char IsAvailableWithSupportedTable = IOPMFeatureIsAvailableWithSupportedTable( @"DarkWakeBackgroundTasks",  v13,  CFProperty);
                char v41 = IOPMFeatureIsAvailableWithSupportedTable(@"SleepServices", v13, CFProperty);
                int v42 = IOPMFeatureIsAvailableWithSupportedTable(@"PowerNap", v13, CFProperty);
                if ((v41 & 1) != 0 || (IsAvailableWithSupportedTable & 1) != 0 || v42)
                {
                  byte_100067539 = v41;
                  byte_10006753A = IsAvailableWithSupportedTable;
                  uint64_t v43 = sub_1000262C4(11LL, 0LL);
                  nullsub_4(v43, v44);
                }
              }

              sub_100019A24();
LABEL_111:
              CFRelease(v9);
              io_connect_t v17 = v10;
              char v18 = CFProperty;
              if (!v7) {
                goto LABEL_25;
              }
              goto LABEL_24;
            }

LABEL_94:
            if (IOPMFeatureIsAvailableWithSupportedTable(@"AutoPowerOff Enabled", v13, CFProperty))
            {
              CFBooleanRef v36 = (CFTypeRef *)&kCFBooleanTrue;
              if (!v59) {
                CFBooleanRef v36 = (CFTypeRef *)&kCFBooleanFalse;
              }
              IORegistryEntrySetCFProperty(v6, @"AutoPowerOff Enabled", *v36);
            }

            if ((IOPMFeatureIsAvailableWithSupportedTable(@"AutoPowerOff Delay", v13, CFProperty) & 1) == 0) {
              goto LABEL_105;
            }
            goto LABEL_103;
          }

LABEL_82:
          if (IOPMFeatureIsAvailableWithSupportedTable(@"Standby Enabled", v13, CFProperty))
          {
            int v32 = (CFTypeRef *)&kCFBooleanTrue;
            if (!v57) {
              int v32 = (CFTypeRef *)&kCFBooleanFalse;
            }
            IORegistryEntrySetCFProperty(v6, @"Standby Enabled", *v32);
          }

          if ((IOPMFeatureIsAvailableWithSupportedTable(@"Standby Delay", v13, CFProperty) & 1) == 0) {
            goto LABEL_94;
          }
          goto LABEL_91;
        }

LABEL_55:
      if (IOPMFeatureIsAvailableWithSupportedTable(@"Sleep On Power Button", v13, CFProperty))
      {
        uint64_t v25 = (CFTypeRef *)&kCFBooleanFalse;
        if (!v51) {
          uint64_t v25 = (CFTypeRef *)&kCFBooleanTrue;
        }
        IORegistryEntrySetCFProperty(v6, @"Sleep On Power Button", *v25);
      }

      if ((IOPMFeatureIsAvailableWithSupportedTable(@"Wake On Clamshell Open", v13, CFProperty) & 1) == 0) {
        goto LABEL_68;
      }
      goto LABEL_64;
    }

uint64_t sub_100032080()
{
  qword_100068810 = (uint64_t)os_log_create("com.apple.powerd", "pmSettings");
  uint64_t result = IOPMFindPowerManagement(0);
  dword_100067534 = result;
  if ((_DWORD)result)
  {
    sub_10003214C();
    int v1 = sub_10001797C();
    int v2 = @"AC Power";
    if (v1 == 2) {
      int v2 = @"Battery Power";
    }
    if (v1 == 3) {
      int v2 = @"UPS Power";
    }
    qword_100067510 = (uint64_t)v2;
    active = (const __CFDictionary *)IOPMCopyActivePMPreferences();
    qword_100067508 = (uint64_t)active;
    if (active) {
      sub_100031298(active, (const __CFString *)qword_100067510);
    }
    if (CFEqual((CFTypeRef)qword_100067510, @"AC Power")) {
      unint64_t v4 = 2LL;
    }
    else {
      unint64_t v4 = 1LL;
    }
    return IOPMSetAggressiveness(dword_100067534, 6uLL, v4);
  }

  return result;
}

void sub_10003214C()
{
  uint64_t v0 = (const __CFDictionary *)IOPMCopySystemPowerSettings();
  if (v0)
  {
    int v1 = v0;
    CFBooleanRef Value = (const __CFBoolean *)CFDictionaryGetValue(v0, @"SleepDisabled");
    io_registry_entry_t v3 = sub_10000AD18();
    if (kCFBooleanTrue == Value) {
      CFBooleanRef v4 = kCFBooleanTrue;
    }
    else {
      CFBooleanRef v4 = kCFBooleanFalse;
    }
    IORegistryEntrySetCFProperty(v3, @"SleepDisabled", v4);
    CFRelease(v1);
  }

uint64_t sub_1000321CC()
{
  return notify_post("com.apple.system.powermanagement.prefschange");
}

void sub_1000321D8()
{
  uint64_t v0 = (os_log_s *)qword_100068810;
  if (os_log_type_enabled((os_log_t)qword_100068810, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)io_registry_entry_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "Energy Saver Prefs have changed", v3, 2u);
  }

  sub_10003214C();
  if (qword_100067508) {
    CFRelease((CFTypeRef)qword_100067508);
  }
  int v1 = (const void *)IOPMCopyPMPreferences();
  qword_100067508 = (uint64_t)v1;
  CFTypeID TypeID = CFDictionaryGetTypeID();
  if (v1 && CFGetTypeID(v1) == TypeID)
  {
    sub_100031298((const __CFDictionary *)qword_100067508, (const __CFString *)qword_100067510);
  }

  else
  {
    if (qword_100067508) {
      CFRelease((CFTypeRef)qword_100067508);
    }
    qword_100067508 = 0LL;
  }

  sub_100026284();
}

void sub_1000322A4()
{
  uint64_t v0 = sub_100038248();
  dispatch_async(v0, &stru_10005A2D0);
}

void sub_1000322C0(id a1)
{
  int v1 = sub_10001797C();
  int v2 = @"AC Power";
  if (v1 == 2) {
    int v2 = @"Battery Power";
  }
  if (v1 == 3) {
    io_registry_entry_t v3 = @"UPS Power";
  }
  else {
    io_registry_entry_t v3 = v2;
  }
  if (!qword_100067510 || !CFEqual((CFTypeRef)qword_100067510, v3))
  {
    qword_100067510 = (uint64_t)v3;
    if ((byte_100067528 & 1) != 0)
    {
      byte_100067530 = 1;
    }

    else
    {
      if (CFEqual(@"AC Power", v3)) {
        unint64_t v4 = 2LL;
      }
      else {
        unint64_t v4 = 1LL;
      }
      IOPMSetAggressiveness(dword_100067534, 6uLL, v4);
    }

    if (qword_100067508)
    {
      CFRelease((CFTypeRef)qword_100067508);
      int v5 = (const __CFDictionary *)IOPMCopyPMPreferences();
      qword_100067508 = (uint64_t)v5;
      io_registry_entry_t v6 = (os_log_s *)qword_100068810;
      if (os_log_type_enabled((os_log_t)qword_100068810, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 138412546;
        CFNumberRef v8 = v3;
        __int16 v9 = 2114;
        io_connect_t v10 = v5;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Settings change for power source change to %@ %{public}@",  (uint8_t *)&v7,  0x16u);
        int v5 = (const __CFDictionary *)qword_100067508;
      }

      sub_100031298(v5, (const __CFString *)qword_100067510);
    }
  }

uint64_t sub_100032438(const __CFDictionary *a1)
{
  return sub_100031298(a1, (const __CFString *)qword_100067510);
}

LABEL_34:
  return v14;
}

id sub_100033F5C(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

LABEL_22:
  return v15;
}

LABEL_15:
  self->_lastChargeToFullRequested = v4;
  __int16 v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v9 timeIntervalSinceReferenceDate];
  io_connect_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  -[BatteryGaugingAccuracyManager writeNSNumberDataToDisk::]( self,  "writeNSNumberDataToDisk::",  @"MonthlyDataReportedDate",  v10);

  -[BatteryGaugingAccuracyManager updateAnalyticsData](self, "updateAnalyticsData");
}

    int v1 = 1;
    goto LABEL_17;
  }

  if (byte_1000675FF == 1)
  {
    int v1 = 2;
    int v19 = 2;
  }

  else
  {
    int v1 = 3;
  }

  if ((byte_1000675FD & 1) != 0 || (byte_1000675FE & 1) != 0 || byte_1000675FC == 1) {
    goto LABEL_15;
  }
LABEL_18:
  if (byte_100067566)
  {
    else {
      int v2 = 2;
    }
    CFNumberRef v21 = v2;
  }

  else
  {
    int v2 = 3;
  }

  if (v0 >= v2) {
    io_registry_entry_t v3 = v2;
  }
  else {
    io_registry_entry_t v3 = v0;
  }
  if (v3 >= v1) {
    unint64_t v4 = v1;
  }
  else {
    unint64_t v4 = v3;
  }
  char v18 = v4;
  int v5 = (v2 << 8) | (v0 << 16) | (v1 << 24) | v4;
  int valuePtr = v5;
  if (qword_100067618 != v5)
  {
    qword_100067618 = v5;
    notify_set_state(dword_1000675E0, v4);
    io_registry_entry_t v6 = CFNumberCreate(0LL, kCFNumberSInt64Type, &valuePtr);
    if (v6)
    {
      int v7 = v6;
      sub_100038120((const __CFString *)qword_1000675D0, v6);
      CFRelease(v7);
    }

    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    if (Mutable)
    {
      __int16 v9 = Mutable;
      io_connect_t v10 = CFNumberCreate(0LL, kCFNumberIntType, &v21);
      if (v10)
      {
        int v11 = v10;
        CFDictionarySetValue(v9, @"UserLevel", v10);
        CFRelease(v11);
      }

      uint64_t v12 = CFNumberCreate(0LL, kCFNumberIntType, &v20);
      if (v12)
      {
        double v13 = v12;
        CFDictionarySetValue(v9, @"BatteryLevel", v12);
        CFRelease(v13);
      }

      CFNumberRef v14 = CFNumberCreate(0LL, kCFNumberIntType, &v19);
      if (v14)
      {
        unint64_t v15 = v14;
        CFDictionarySetValue(v9, @"ThermalLevel", v14);
        CFRelease(v15);
      }

      CFNumberRef v16 = CFNumberCreate(0LL, kCFNumberIntType, &v18);
      if (v16)
      {
        io_connect_t v17 = v16;
        CFDictionarySetValue(v9, @"CombinedLevel", v16);
        CFRelease(v17);
      }

      sub_100038120((const __CFString *)qword_1000675D8, v9);
      CFRelease(v9);
      notify_post("com.apple.system.powermanagement.SystemLoadAdvisory");
    }
  }

void sub_100035474(id a1)
{
  id v1 = -[BatteryGaugingAccuracyManager initBatteryGaugingAccuracyData]( objc_alloc(&OBJC_CLASS___BatteryGaugingAccuracyManager),  "initBatteryGaugingAccuracyData");
  int v2 = (void *)qword_100067550;
  qword_100067550 = (uint64_t)v1;
}

void sub_1000357E8(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  int v5 = (os_log_s *)qword_100068818;
  if (os_log_type_enabled((os_log_t)qword_100068818, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "batteryGaugingMitigationEvent received\n",  buf,  2u);
  }

  if (v3)
  {
    if (v4)
    {
      io_registry_entry_t v6 = (dispatch_queue_s *)qword_100067540;
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472LL;
      _DWORD v7[2] = sub_100035918;
      v7[3] = &unk_100059238;
      id v8 = v3;
      id v9 = v4;
      dispatch_async(v6, v7);
    }

    else if (os_log_type_enabled((os_log_t)qword_100068818, OS_LOG_TYPE_ERROR))
    {
      sub_100043684();
    }
  }

  else if (os_log_type_enabled((os_log_t)qword_100068818, OS_LOG_TYPE_ERROR))
  {
    sub_100043658();
  }
}

void sub_100035918(uint64_t a1)
{
  id v1 = *(void **)(a1 + 40);
  int v2 = (_xpc_connection_s *)*(id *)(a1 + 32);
  id v3 = v1;
  dispatch_assert_queue_V2((dispatch_queue_t)qword_100067540);
  xpc_object_t reply = xpc_dictionary_create_reply(v3);
  if (reply)
  {
    if (sub_100038E28(v2, @"com.apple.private.iokit.battery-gauging-mitigation", 0))
    {
      xpc_object_t dictionary = xpc_dictionary_get_dictionary(v3, "batteryGaugingMitigation");
      uint64_t v6 = objc_claimAutoreleasedReturnValue(dictionary);
      if (v6)
      {
        int v7 = (void *)v6;
        id v8 = (void *)_CFXPCCreateCFObjectFromXPCObject(v6);
        if (v8)
        {
          id v9 = v8;
          io_connect_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"batteryGaugingMitigationAction"]);
          unsigned int v11 = [v10 unsignedIntValue];

          if (v11 == 1)
          {
            uint64_t v12 = (dispatch_queue_s *)qword_100067540;
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472LL;
            block[2] = sub_100035EF4;
            block[3] = &unk_100058F38;
            id v20 = reply;
            dispatch_async(v12, block);

            int v13 = 0;
          }

          else
          {
            int v13 = -536870206;
            if (os_log_type_enabled((os_log_t)qword_100068818, OS_LOG_TYPE_ERROR)) {
              sub_100043734();
            }
          }

          char v18 = (os_log_s *)qword_100068818;
          if (os_log_type_enabled((os_log_t)qword_100068818, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)&uint8_t buf[4] = v11;
            LOWORD(v22) = 2112;
            *(void *)((char *)&v22 + 2) = v9;
            _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "received handleRequest %ud %@\n",  buf,  0x12u);
          }

          goto LABEL_17;
        }

        if (os_log_type_enabled((os_log_t)qword_100068818, OS_LOG_TYPE_ERROR)) {
          sub_100043708();
        }
        int v13 = -536870206;
      }

      else
      {
        int v13 = -536870206;
        if (os_log_type_enabled((os_log_t)qword_100068818, OS_LOG_TYPE_ERROR)) {
          sub_1000436DC();
        }
      }
    }

    else
    {
      int v13 = -536870207;
      if (os_log_type_enabled((os_log_t)qword_100068818, OS_LOG_TYPE_ERROR)) {
        sub_100043760();
      }
    }

    id v9 = 0LL;
LABEL_17:
    CFNumberRef v14 = v2;
    id v15 = reply;
    CFNumberRef v16 = v15;
    if (v14)
    {
      io_connect_t v17 = (dispatch_queue_s *)qword_100067540;
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&__int128 v22 = 3221225472LL;
      *((void *)&v22 + 1) = sub_100035F80;
      CFNumberRef v23 = &unk_100059328;
      id v24 = v15;
      int v26 = v13;
      uint64_t v25 = v14;
      dispatch_barrier_async(v17, buf);
    }

    goto LABEL_20;
  }

  if (os_log_type_enabled((os_log_t)qword_100068818, OS_LOG_TYPE_ERROR)) {
    sub_1000436B0();
  }
LABEL_20:
}

void sub_100035C3C()
{
  os_log_t v0 = os_log_create("com.apple.powerd", "batterygauging");
  id v1 = (void *)qword_100068818;
  qword_100068818 = (uint64_t)v0;

  dispatch_queue_t v2 = dispatch_queue_create("com.apple.private.powerd.batteryGaugingQ", 0LL);
  id v3 = (void *)qword_100067540;
  qword_100067540 = (uint64_t)v2;

  if (qword_100067540) {
    dispatch_async((dispatch_queue_t)qword_100067540, &stru_10005A310);
  }
}

void sub_100035CB4(id a1)
{
  id v1 = (os_log_s *)qword_100068818;
  if (os_log_type_enabled((os_log_t)qword_100068818, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_DEFAULT,  "batteryGaugingAccuracyManager_prime init\n",  buf,  2u);
  }

  xpc_set_event_stream_handler("com.apple.alarm", 0LL, &stru_10005A330);
  dispatch_assert_queue_V2((dispatch_queue_t)qword_100067540);
  uint32_t v2 = notify_register_dispatch( "com.apple.system.powersources.source",  &out_token,  (dispatch_queue_t)qword_100067540,  &stru_10005A350);
  id v3 = (os_log_s *)qword_100068818;
  BOOL v4 = os_log_type_enabled((os_log_t)qword_100068818, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      *(_DWORD *)buf = 136315138;
      id v8 = "com.apple.system.powersources.source";
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Could not get notification for %s. Exiting.\n",  buf,  0xCu);
    }
  }

  else
  {
    if (v4)
    {
      *(_DWORD *)buf = 136315138;
      id v8 = "com.apple.system.powersources.source";
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Register notification for %s. good.\n",  buf,  0xCu);
    }

    int v5 = (void *)objc_claimAutoreleasedReturnValue( +[BatteryGaugingAccuracyManager InstanceManager]( &OBJC_CLASS___BatteryGaugingAccuracyManager,  "InstanceManager"));
    [v5 handleBatteryStateDataUpdate];
  }

void sub_100035E34(id a1, OS_xpc_object *a2)
{
  uint32_t v2 = a2;
  id v3 = (dispatch_queue_s *)qword_100067540;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100035EB0;
  block[3] = &unk_100058F38;
  uint64_t v6 = v2;
  BOOL v4 = v2;
  dispatch_async(v3, block);
}

void sub_100035EB0(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue( +[BatteryGaugingAccuracyManager InstanceManager]( &OBJC_CLASS___BatteryGaugingAccuracyManager,  "InstanceManager"));
  [v2 handleAlarmEvent:*(void *)(a1 + 32)];
}

void sub_100035EF4(uint64_t a1)
{
  id v1 = (dispatch_queue_s *)qword_100067540;
  id v2 = *(id *)(a1 + 32);
  dispatch_assert_queue_V2(v1);
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[BatteryGaugingAccuracyManager InstanceManager]( &OBJC_CLASS___BatteryGaugingAccuracyManager,  "InstanceManager"));
  id v5 = (id)objc_claimAutoreleasedReturnValue([v3 gaugingAccuracyMetricGet]);

  BOOL v4 = (void *)_CFXPCCreateXPCObjectFromCFObject(v5);
  xpc_dictionary_set_value(v2, "batteryGaugingMitigationState", v4);
}

void sub_100035F80(uint64_t a1)
{
  xpc_dictionary_set_uint64(*(xpc_object_t *)(a1 + 32), "returnCode", *(int *)(a1 + 48));
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 32));
}

void sub_100035FB4(id a1, int a2)
{
  id v2 = (os_log_s *)qword_100068818;
  if (os_log_type_enabled((os_log_t)qword_100068818, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v4 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "HandleBatteryDataUpdate AC change detected run action policy",  v4,  2u);
  }

  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[BatteryGaugingAccuracyManager InstanceManager]( &OBJC_CLASS___BatteryGaugingAccuracyManager,  "InstanceManager"));
  [v3 handleBatteryStateDataUpdate];
}

uint64_t sub_100036030()
{
  return xmmword_100067580;
}

uint64_t sub_10003603C()
{
  return byte_100067567;
}

void sub_100036048()
{
  if (byte_100067567) {
    qword_100067578 = CFAbsoluteTimeGetCurrent();
  }
}

uint64_t sub_100036074()
{
  int v0 = sub_10002AD04(5u);
  BOOL v1 = sub_10002AD78();
  BOOL v2 = sub_10002AD90();
  if (byte_1000675E4 || (sub_10001D4F0() & 1) != 0)
  {
    if (v2) {
      uint64_t v3 = 6LL;
    }
    else {
      uint64_t v3 = 0LL;
    }
    if (!v2 && v1)
    {
      else {
        uint64_t v3 = 10LL;
      }
    }
  }

  else if (((v1 | v0 | v2) & 1) != 0)
  {
    uint64_t v3 = 6LL;
  }

  else if (byte_1000675F1)
  {
    uint64_t v3 = 64LL;
  }

  else
  {
    uint64_t v3 = 0LL;
  }

  if (byte_1000675F2) {
    uint64_t v4 = 1LL;
  }
  else {
    uint64_t v4 = v3;
  }
  if (byte_100067565) {
    BOOL v5 = byte_1000675E4 == 0;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5) {
    uint64_t v6 = 1LL;
  }
  else {
    uint64_t v6 = v4;
  }
  int v7 = (os_log_s *)qword_100068820;
  if (os_log_type_enabled((os_log_t)qword_100068820, OS_LOG_TYPE_DEBUG)) {
    sub_1000437E4(v6, v7);
  }
  if (!dword_100067600) {
    notify_register_check("com.apple.system.powermanagement.useractivity2", &dword_100067600);
  }
  if ((void)xmmword_100067580 != v6)
  {
    notify_set_state(dword_100067600, v6);
    notify_post("com.apple.system.powermanagement.useractivity2");
    id v8 = (os_log_s *)qword_100068820;
    if (os_log_type_enabled((os_log_t)qword_100068820, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218496;
      *(void *)&uint8_t buf[4] = xmmword_100067580;
      *(_WORD *)&uint8_t buf[12] = 2048;
      *(void *)&__int128 v35 = v6;
      WORD4(v35) = 1024;
      *(_DWORD *)((char *)&v35 + 1sub_1000262C4(0x12u, 0) = byte_100067565;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Activity changes from 0x%llx to 0x%llx. UseActiveState:%d\n",  buf,  0x1Cu);
      id v8 = (os_log_s *)qword_100068820;
    }

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = word_1000675B8;
      int v10 = byte_1000675E4;
      int v11 = HIBYTE(word_1000675B8);
      unint64_t v12 = sub_100039A70();
      *(_DWORD *)buf = 67110400;
      *(_DWORD *)&uint8_t buf[4] = v9;
      *(_WORD *)&uint8_t buf[8] = 1024;
      *(_DWORD *)&buf[10] = v10;
      LOWORD(v35) = 1024;
      *(_DWORD *)((char *)&v35 + 2) = v11;
      WORD3(v35) = 2048;
      *((void *)&v35 + 1) = v12;
      __int16 v36 = 2048;
      uint64_t v37 = qword_1000675A8;
      __int16 v38 = 2048;
      uint64_t v39 = qword_1000675B0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "hidActive:%d displayOff:%d assertionActivityValid:%d now:0x%llx  hid_ts:0x%llx assertion_ts:0x%llx\n",  buf,  0x32u);
    }

    if ((xmmword_100067580 & 0x20) == 0 && (v6 & 0x20) != 0)
    {
      *(void *)buf = 0LL;
      int v13 = 10;
      do
      {
        notify_get_state(dword_100067600, (uint64_t *)buf);
        if (*(void *)buf == v6) {
          break;
        }
        usleep(0x3E8u);
        --v13;
      }

      while (v13);
    }

    *(void *)&xmmword_100067580 = v6;
    qword_100067570 |= v6;
    BOOL v14 = os_log_type_enabled((os_log_t)qword_100068820, OS_LOG_TYPE_DEBUG);
    if (v6)
    {
      if (v14) {
        sub_1000437B8();
      }
      sub_10002D3B4();
    }

    else
    {
      if (v14) {
        sub_10004378C();
      }
      sub_10002D1D4();
    }

    id v15 = (os_log_s *)qword_100068820;
    if (os_log_type_enabled((os_log_t)qword_100068820, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Evaluating new PerfMode on UserActivity level change.\n",  buf,  2u);
    }

    sub_10001E400();
  }

  unsigned int v16 = sub_100037E54();
  io_connect_t v17 = (uint64_t *)*((void *)&xmmword_100067580 + 1);
  if (*((void *)&xmmword_100067580 + 1))
  {
    unsigned int v18 = v16;
    uint64_t v19 = 0LL;
    id v20 = &unk_100067000;
    while (1)
    {
      if (v20[1508] || v18 >= *((_DWORD *)v17 + 6))
      {
        __int128 v22 = (os_log_s *)qword_100068820;
        uint64_t v21 = v3;
        if (os_log_type_enabled((os_log_t)qword_100068820, OS_LOG_TYPE_DEBUG))
        {
          pid_t pid = xpc_connection_get_pid((xpc_connection_t)v17[2]);
          *(_DWORD *)buf = 134218240;
          *(void *)&uint8_t buf[4] = v3;
          *(_WORD *)&uint8_t buf[12] = 1024;
          LODWORD(v35) = pid;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEBUG,  "Setting level 0x%llx for pid %d",  buf,  0x12u);
          uint64_t v21 = v3;
          if (v18)
          {
LABEL_57:
            unsigned int v23 = *((_DWORD *)v17 + 6);
            if ((_DWORD)v19) {
              BOOL v24 = 1;
            }
            else {
              BOOL v24 = v18 >= v23;
            }
            if (v24) {
              uint64_t v19 = v19;
            }
            else {
              uint64_t v19 = v23;
            }
          }
        }

        else if (v18)
        {
          goto LABEL_57;
        }
      }

      else
      {
        uint64_t v21 = xmmword_100067580 & 0xFFFFFFFFFFFFFFF0LL | 1;
        if (v18) {
          goto LABEL_57;
        }
      }

      if (v17[4] == v21)
      {
        uint64_t v25 = (os_log_s *)qword_100068820;
        if (os_log_type_enabled((os_log_t)qword_100068820, OS_LOG_TYPE_DEBUG))
        {
          int v26 = (_xpc_connection_s *)v17[2];
          pid_t v27 = xpc_connection_get_pid(v26);
          *(_DWORD *)buf = 134218496;
          *(void *)&uint8_t buf[4] = v26;
          id v20 = (_BYTE *)&unk_100067000;
          *(_WORD *)&uint8_t buf[12] = 1024;
          LODWORD(v35) = v27;
          WORD2(v35) = 2048;
          *(void *)((char *)&v35 + 6) = v21;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEBUG,  "Client %p(pid %d) activity level is already at 0x%llx\n",  buf,  0x1Cu);
        }
      }

      else
      {
        xpc_object_t v28 = xpc_dictionary_create(0LL, 0LL, 0LL);
        CFNumberRef v29 = (os_log_s *)qword_100068820;
        if (os_log_type_enabled((os_log_t)qword_100068820, OS_LOG_TYPE_DEBUG))
        {
          CFNumberRef v31 = (_xpc_connection_s *)v17[2];
          pid_t v32 = xpc_connection_get_pid(v31);
          *(_DWORD *)buf = 134218496;
          *(void *)&uint8_t buf[4] = v21;
          *(_WORD *)&uint8_t buf[12] = 2048;
          *(void *)&__int128 v35 = v31;
          id v20 = (_BYTE *)&unk_100067000;
          WORD4(v35) = 1024;
          *(_DWORD *)((char *)&v35 + 1sub_1000262C4(0x12u, 0) = v32;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEBUG,  "Sending new activity levels(0x%llx) to client %p(pid %d)\n",  buf,  0x1Cu);
        }

        xpc_dictionary_set_uint64(v28, "UserActivityLevels", v21);
        xpc_connection_send_message((xpc_connection_t)v17[2], v28);
        xpc_release(v28);
        v17[4] = v21;
      }

      io_connect_t v17 = (uint64_t *)*v17;
      if (!v17) {
        return v19;
      }
    }
  }

  return 0LL;
}

void sub_100036624()
{
  byte_100067568 = 0;
  qword_100067570 = 0LL;
}

uint64_t sub_100036638()
{
  return dword_1000675C0;
}

uint64_t sub_100036644(void *a1)
{
  if (a1) {
    *a1 = qword_100067570;
  }
  return byte_100067568;
}

void sub_100036660(int a1)
{
  uint64_t v1 = byte_100067567;
  if (byte_100067567 == a1)
  {
    BOOL v2 = (os_log_s *)qword_100068820;
    if (os_log_type_enabled((os_log_t)qword_100068820, OS_LOG_TYPE_DEBUG)) {
      sub_100043854(v1, v2, v3, v4, v5, v6, v7, v8);
    }
  }

  else
  {
    if (a1)
    {
      int v9 = 1;
      sub_10001E068();
      sub_10001D4DC();
      nullsub_4(v10, v11);
      byte_100067568 = 1;
    }

    else
    {
      int v9 = 0;
    }

    byte_100067567 = v9;
    unint64_t v12 = (os_log_s *)qword_100068820;
    if (os_log_type_enabled((os_log_t)qword_100068820, OS_LOG_TYPE_DEFAULT))
    {
      v13[0] = 67109120;
      v13[1] = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "rootDomain's user activity state:%d\n",  (uint8_t *)v13,  8u);
    }
  }

double sub_100036764()
{
  return *(double *)&qword_100067578;
}

__CFDictionary *sub_100036770()
{
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  2LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  int valuePtr = 0xFFFF;
  CFNumberRef v1 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &valuePtr);
  if (v1)
  {
    CFNumberRef v2 = v1;
    CFDictionaryAddValue(Mutable, @"DeviceUsage", v1);
    CFDictionaryAddValue(Mutable, @"DeviceUsagePage", v2);
    CFRelease(v2);
  }

  return Mutable;
}

uint64_t sub_100036810(const __CFString *a1)
{
  uint64_t v2 = -1LL;
  uint64_t valuePtr = -1LL;
  dispatch_assert_queue_V2((dispatch_queue_t)qword_1000675C8);
  if (qword_100067590)
  {
    uint64_t v3 = (const __CFNumber *)IOHIDEventSystemClientCopyProperty((IOHIDEventSystemClientRef)qword_100067590, a1);
    if (v3)
    {
      uint64_t v4 = v3;
      CFNumberGetValue(v3, kCFNumberSInt64Type, &valuePtr);
      CFRelease(v4);
      return valuePtr;
    }
  }

  return v2;
}

void sub_100036880(const __CFString *a1, uint64_t a2)
{
  uint64_t valuePtr = a2;
  dispatch_assert_queue_V2((dispatch_queue_t)qword_1000675C8);
  if (qword_100067590)
  {
    CFNumberRef v3 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt64Type, &valuePtr);
    if (v3)
    {
      CFNumberRef v4 = v3;
      IOHIDEventSystemClientSetProperty((IOHIDEventSystemClientRef)qword_100067590, a1, v3);
      CFRelease(v4);
    }
  }

void sub_100036900()
{
  int v0 = sub_100036810(@"HIDActivityState");
  if (!os_log_type_enabled((os_log_t)qword_100068820, OS_LOG_TYPE_DEBUG))
  {
    if (v0) {
      goto LABEL_3;
    }
LABEL_7:
    uint64_t v3 = sub_100036810(@"LastActivityTimestamp");
    unint64_t v1 = sub_100039A18(v3);
    goto LABEL_8;
  }

  sub_1000438BC();
  if (!v0) {
    goto LABEL_7;
  }
LABEL_3:
  if (v0 == 1)
  {
    unint64_t v1 = sub_100039A70();
LABEL_8:
    unint64_t v2 = v1;
    goto LABEL_9;
  }

  unint64_t v2 = 0LL;
LABEL_9:
  CFNumberRef v4 = sub_100038248();
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  _DWORD v5[2] = sub_1000369D4;
  v5[3] = &unk_100059B40;
  int v6 = v0;
  void v5[4] = v2;
  dispatch_async(v4, v5);
}

void sub_1000369D4(uint64_t a1)
{
  LOBYTE(word_1000675B_Block_object_dispose(va, 8) = *(_DWORD *)(a1 + 40) == 1;
  qword_1000675A8 = *(void *)(a1 + 32);
  sub_1000369F8();
}

void sub_1000369F8()
{
  unsigned int v0 = sub_100037E54();
  if (os_log_type_enabled((os_log_t)qword_100068820, OS_LOG_TYPE_DEBUG)) {
    sub_1000439F4();
  }
  int v1 = byte_1000675E4 == 0 && v0 < 0x12C;
  if (byte_1000675E4 == 0 && v0 < 0x12C) {
    unsigned int v2 = 300;
  }
  else {
    unsigned int v2 = 0;
  }
  byte_100067565 = byte_1000675E4 == 0 && v0 < 0x12C;
  if (!qword_100067608)
  {
    uint64_t v3 = sub_100038248();
    qword_100067608 = (uint64_t)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  v3);
    dispatch_source_set_event_handler((dispatch_source_t)qword_100067608, &stru_10005A3B0);
    dispatch_source_set_cancel_handler((dispatch_source_t)qword_100067608, &stru_10005A3D0);
  }

  unsigned int v4 = sub_100036074();
  if (os_log_type_enabled((os_log_t)qword_100068820, OS_LOG_TYPE_DEBUG)) {
    sub_10004398C();
  }
  if (((v4 == 0) & ~v1) != 0)
  {
    if (byte_100067610 == 1)
    {
      dispatch_suspend((dispatch_object_t)qword_100067608);
      byte_100067610 = 0;
    }
  }

  else
  {
    int v5 = v1 & (v4 > v2);
    if (!v4) {
      int v5 = 1;
    }
    if (!v5) {
      unsigned int v2 = v4;
    }
    if (v2 >= v0)
    {
      dispatch_time_t v6 = dispatch_time(0LL, 1000000000LL * (v2 - v0));
      dispatch_source_set_timer((dispatch_source_t)qword_100067608, v6, 0xFFFFFFFFFFFFFFFFLL, 0LL);
      if ((byte_100067610 & 1) == 0)
      {
        dispatch_resume((dispatch_object_t)qword_100067608);
        byte_100067610 = 1;
      }
    }

    else if (os_log_type_enabled((os_log_t)qword_100068820, OS_LOG_TYPE_ERROR))
    {
      sub_10004391C();
    }
  }

uint64_t sub_100036BBC()
{
  qword_100068820 = (uint64_t)os_log_create("com.apple.powerd", "systemLoad");
  qword_1000675C8 = (uint64_t)dispatch_queue_create("com.apple.powermanagement.systemload", 0LL);
  *(_OWORD *)&dword_100067560 = 0u;
  *(_OWORD *)&qword_100067570 = 0u;
  xmmword_100067580 = 0u;
  *(_OWORD *)&qword_100067590 = 0u;
  *(_OWORD *)&dword_1000675A0 = 0u;
  *(_OWORD *)&qword_1000675B0 = 0u;
  *(void *)&xmmword_100067580 = 0xFFFFLL;
  sub_100036660(1);
  byte_100067567 = 1;
  qword_1000675D0 = (uint64_t)SCDynamicStoreKeyCreate( kCFAllocatorDefault,  @"%@%@",  kSCDynamicStoreDomainState,  @"/IOKit/PowerManagement/SystemLoad");
  qword_1000675D8 = (uint64_t)SCDynamicStoreKeyCreate( kCFAllocatorDefault,  @"%@%@",  kSCDynamicStoreDomainState,  @"/IOKit/PowerManagement/SystemLoad/Detailed");
  notify_register_check("com.apple.system.powermanagement.SystemLoadAdvisory", &dword_1000675E0);
  notify_register_check("com.apple.system.powermanagement.useractivity", &dword_100067560);
  notify_set_state(dword_100067560, 1uLL);
  int v0 = sub_100019A24();
  int v1 = (dispatch_queue_s *)sub_100015180();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100036DA4;
  block[3] = &unk_100059400;
  int v8 = v0;
  dispatch_sync(v1, block);
  sub_100036EAC();
  sub_100036F7C(0LL);
  unsigned int v2 = IONotificationPortCreate(0);
  uint64_t v3 = sub_100038248();
  IONotificationPortSetDispatchQueue(v2, v3);
  dword_1000675A0 = 300;
  unint64_t v4 = sub_100039A70();
  word_1000675B8 = 1;
  qword_1000675A8 = v4;
  qword_1000675B0 = 0LL;
  dispatch_async((dispatch_queue_t)qword_1000675C8, &stru_10005A3F0);
  byte_1000675E4 = sub_10003AE20();
  int v5 = sub_100038248();
  return notify_register_dispatch(kOSThermalNotificationPressureLevelName, &out_token, v5, &stru_10005A370);
}

void sub_100036DA4(uint64_t a1)
{
}

void sub_100036DAC(int a1)
{
  unsigned int v2 = (dispatch_queue_s *)sub_100015180();
  dispatch_assert_queue_V2(v2);
  if (a1)
  {
    uint64_t v3 = (uint64_t *)sub_1000155BC();
    if (a1 < 1)
    {
      LOBYTE(v5) = 0;
      BOOL v9 = 0;
      LOBYTE(a1) = 1;
    }

    else
    {
      int v4 = 0;
      __int16 v5 = 0;
      int v6 = 0;
      uint64_t v7 = a1;
      do
      {
        uint64_t v8 = *v3++;
        v5 |= *(_WORD *)(v8 + 16);
        v6 += *(_DWORD *)(v8 + 32);
        v4 += *(_DWORD *)(v8 + 36);
        --v7;
      }

      while (v7);
      LOBYTE(a1) = v5 ^ 1;
      if (v4) {
        BOOL v9 = 100 * v6 / v4 < 40;
      }
      else {
        BOOL v9 = 0;
      }
    }
  }

  else
  {
    BOOL v9 = 0;
    LOBYTE(v5) = 1;
  }

  uint64_t v10 = sub_100038248();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100037914;
  block[3] = &unk_10005A390;
  char v12 = v5 & 1;
  char v13 = a1 & 1;
  BOOL v14 = v9;
  dispatch_async(v10, block);
}

void sub_100036EAC()
{
  int v0 = (const __SCDynamicStore *)sub_100038238();
  int v1 = (const __CFDictionary *)SCDynamicStoreCopyValue(v0, @"State:/IOKit/PowerManagement/CurrentSettings");
  if (v1)
  {
    unsigned int v2 = v1;
    CFBooleanRef Value = (const __CFNumber *)CFDictionaryGetValue(v1, @"Display Sleep Timer");
    if (Value && (CFNumberGetValue(Value, kCFNumberIntType, &valuePtr), byte_1000675F3 != (valuePtr != 0)))
    {
      char v4 = 0;
      byte_1000675F3 = valuePtr != 0;
    }

    else
    {
      char v4 = 1;
    }

    __int16 v5 = (const __CFBoolean *)CFDictionaryGetValue(v2, @"DarkWakeBackgroundTasks");
    if (v5 && (int v6 = CFBooleanGetValue(v5) != 0, dword_100066DC0 != v6))
    {
      dword_100066DC0 = v6;
      CFRelease(v2);
    }

    else
    {
      CFRelease(v2);
      if ((v4 & 1) != 0) {
        return;
      }
    }

    sub_100037150();
  }

void sub_100036F7C(const __CFDictionary *a1)
{
  CFDictionaryRef cpuPowerStatus = 0LL;
  int v10 = 100;
  int valuePtr = 100;
  int v2 = dword_1000675F8;
  if (!dword_1000675F8)
  {
    size_t v9 = 4LL;
    if (sysctlbyname("hw.ncpu", &dword_1000675F8, &v9, 0LL, 0LL) == -1)
    {
      int v2 = 0;
      dword_1000675F8 = 0;
    }

    else
    {
      int v2 = dword_1000675F8;
    }
  }

  LODWORD(v9) = v2;
  else {
    BOOL v3 = dword_1000675C0 == 0;
  }
  char v5 = !v3 && dword_1000675C0 != 255;
  byte_1000675FC = v5;
  byte_1000675FD = 0;
  byte_1000675FE = 0;
  byte_1000675FF = 0;
  if (a1)
  {
LABEL_15:
    CFBooleanRef Value = (const __CFNumber *)CFDictionaryGetValue(a1, @"CPU_Speed_Limit");
    if (Value) {
      CFNumberGetValue(Value, kCFNumberIntType, &valuePtr);
    }
    uint64_t v7 = (const __CFNumber *)CFDictionaryGetValue(a1, @"CPU_Available_CPUs");
    if (v7) {
      CFNumberGetValue(v7, kCFNumberIntType, &v9);
    }
    uint64_t v8 = (const __CFNumber *)CFDictionaryGetValue(a1, @"CPU_Scheduler_Limit");
    if (v8) {
      CFNumberGetValue(v8, kCFNumberIntType, &v10);
    }
    if (valuePtr <= 50) {
      byte_1000675FF = 1;
    }
    if (v10 != 100) {
      byte_1000675FE = 1;
    }
    sub_100037150();
    goto LABEL_29;
  }

  if (!IOPMCopyCPUPowerStatus(&cpuPowerStatus))
  {
    a1 = cpuPowerStatus;
    if (!cpuPowerStatus) {
      return;
    }
    goto LABEL_15;
  }

LABEL_29:
  if (cpuPowerStatus) {
    CFRelease(cpuPowerStatus);
  }
}

void sub_100037124(id a1, int a2)
{
  byte_1000675F0 = 1;
  sub_100037150();
}

void sub_100037150()
{
  uint64_t valuePtr = 0LL;
  int v0 = 3;
  int v21 = 3;
  int v18 = 3;
  int v19 = 3;
  if (!byte_1000675F4)
  {
    if (byte_1000675F5) {
      int v0 = 1;
    }
    else {
      int v0 = 2;
    }
  }

  int v20 = v0;
  if ((byte_1000675F0 & 1) != 0)
  {
    if (qword_1000675E8 == 20)
    {
      int v1 = 2;
      goto LABEL_17;
    }

    if (!qword_1000675E8)
    {
      int v1 = 3;
LABEL_17:
      int v19 = v1;
      goto LABEL_18;
    }

uint64_t sub_1000373F8(uint64_t result)
{
  int v1 = result;
  byte_1000675E4 = result;
  if ((_DWORD)result)
  {
    HIBYTE(word_1000675B_Block_object_dispose(va, 8) = 0;
    int v2 = 0;
  }

  else
  {
    char v3 = sub_10001D4F0();
    BOOL v4 = os_log_type_enabled((os_log_t)qword_100068820, OS_LOG_TYPE_DEBUG);
    if ((v3 & 1) != 0)
    {
      if (v4) {
        sub_100043A6C();
      }
      goto LABEL_11;
    }

    if (v4) {
      sub_100043A98();
    }
    int v2 = 1;
  }

  sub_100036660(v2);
LABEL_11:
  uint64_t v5 = (os_log_s *)qword_100068820;
  if (os_log_type_enabled((os_log_t)qword_100068820, OS_LOG_TYPE_DEFAULT))
  {
    if (byte_1000675E4) {
      CFNumberRef v6 = "Off";
    }
    else {
      CFNumberRef v6 = "On";
    }
    int v7 = 136315394;
    uint64_t v8 = v6;
    __int16 v9 = 1024;
    int v10 = sub_10001D4F0();
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Display state: %s NotificationWake : %d\n",  (uint8_t *)&v7,  0x12u);
  }

  sub_100037150();
  sub_1000369F8();
  sub_100027344(v1);
  return sub_10001FF4C(byte_1000675E4);
}

void sub_100037554(int a1)
{
  int v2 = (os_log_s *)qword_100068820;
  BOOL v3 = os_log_type_enabled((os_log_t)qword_100068820, OS_LOG_TYPE_DEFAULT);
  if (a1)
  {
    if (v3)
    {
      __int16 v7 = 0;
      BOOL v4 = "Entered Domino";
      uint64_t v5 = (uint8_t *)&v7;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, v4, v5, 2u);
    }
  }

  else if (v3)
  {
    __int16 v6 = 0;
    BOOL v4 = "Exited Domino";
    uint64_t v5 = (uint8_t *)&v6;
    goto LABEL_6;
  }

  byte_1000675F1 = a1;
  sub_1000369F8();
  sub_100027344((byte_1000675F1 & 1) == 0);
}

void sub_1000375F8(_xpc_connection_s *a1, void *a2)
{
  if (a1 && a2)
  {
    if (sub_100038354(a1, @"com.apple.private.iokit.dominoservice"))
    {
      BOOL v3 = xpc_dictionary_get_BOOL(a2, "dominoState");
      BOOL v4 = xpc_dictionary_get_BOOL(a2, "dominoMainDisplay");
      uint64_t v5 = (os_log_s *)qword_100068820;
      if (os_log_type_enabled((os_log_t)qword_100068820, OS_LOG_TYPE_DEFAULT))
      {
        v6[0] = 67109376;
        v6[1] = v3;
        __int16 v7 = 1024;
        BOOL v8 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Domino set to %d on main display %d",  (uint8_t *)v6,  0xEu);
      }

      sub_100037554(v3);
    }

    else if (os_log_type_enabled((os_log_t)qword_100068820, OS_LOG_TYPE_ERROR))
    {
      sub_100043AC4();
    }
  }

  else if (os_log_type_enabled((os_log_t)qword_100068820, OS_LOG_TYPE_ERROR))
  {
    sub_100043AF0();
  }

void sub_10003774C(int a1)
{
  int v2 = (os_log_s *)qword_100068820;
  BOOL v3 = os_log_type_enabled((os_log_t)qword_100068820, OS_LOG_TYPE_DEFAULT);
  if (a1)
  {
    if (v3)
    {
      __int16 v7 = 0;
      BOOL v4 = "Oneness mode is on";
      uint64_t v5 = (uint8_t *)&v7;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, v4, v5, 2u);
    }
  }

  else if (v3)
  {
    __int16 v6 = 0;
    BOOL v4 = "Oneness mode is off";
    uint64_t v5 = (uint8_t *)&v6;
    goto LABEL_6;
  }

  byte_1000675F2 = a1;
  sub_1000369F8();
}

void sub_1000377E0(_xpc_connection_s *a1, void *a2)
{
  if (a1 && a2)
  {
    if (sub_100038354(a1, @"com.apple.private.iokit.onenessservice"))
    {
      BOOL v3 = xpc_dictionary_get_BOOL(a2, "onenessState");
      BOOL v4 = (os_log_s *)qword_100068820;
      if (os_log_type_enabled((os_log_t)qword_100068820, OS_LOG_TYPE_DEFAULT))
      {
        v5[0] = 67109120;
        v5[1] = v3;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Oneness mode set to %d", (uint8_t *)v5, 8u);
      }

      sub_10003774C(v3);
    }

    else if (os_log_type_enabled((os_log_t)qword_100068820, OS_LOG_TYPE_ERROR))
    {
      sub_100043B50();
    }
  }

  else if (os_log_type_enabled((os_log_t)qword_100068820, OS_LOG_TYPE_ERROR))
  {
    sub_100043B7C();
  }

void sub_100037914(uint64_t a1)
{
  byte_1000675F4 = *(_BYTE *)(a1 + 32);
  byte_1000675F5 = *(_BYTE *)(a1 + 34);
  sub_100037150();
}

uint64_t sub_100037930()
{
  return HIBYTE(word_1000675B8);
}

void sub_10003793C(void *a1, void *a2)
{
  if (a1 && a2)
  {
    BOOL v4 = calloc(1uLL, 0x28uLL);
    if (v4)
    {
      uint64_t v5 = (uint64_t)v4;
      _DWORD v4[2] = xpc_retain(a1);
      *(_DWORD *)(v5 + 24) = xpc_dictionary_get_uint64(a2, "ActivityTimeout");
      __int16 v6 = (int *)(v5 + 24);
      sub_100037A28(v5);
      __int16 v7 = (os_log_s *)qword_100068820;
      if (os_log_type_enabled((os_log_t)qword_100068820, OS_LOG_TYPE_DEBUG)) {
        sub_100043C08((_xpc_connection_s *)a1, v6, v7);
      }
    }

    else if (os_log_type_enabled((os_log_t)qword_100068820, OS_LOG_TYPE_ERROR))
    {
      sub_100043BDC();
    }
  }

  else if (os_log_type_enabled((os_log_t)qword_100068820, OS_LOG_TYPE_ERROR))
  {
    sub_100043CB4();
  }

void sub_100037A28(uint64_t a1)
{
  unsigned int v2 = *(_DWORD *)(a1 + 24);
  if (v2 <= 4)
  {
    if (os_log_type_enabled((os_log_t)qword_100068820, OS_LOG_TYPE_ERROR)) {
      sub_100043D74();
    }
    unsigned int v2 = 5;
    *(_DWORD *)(a1 + 24) = 5;
  }

  if (v2 < dword_1000675A0)
  {
    dword_1000675A0 = v2;
    if (os_log_type_enabled((os_log_t)qword_100068820, OS_LOG_TYPE_DEBUG)) {
      sub_100043D14();
    }
    dispatch_async((dispatch_queue_t)qword_1000675C8, &stru_10005A410);
    unint64_t v3 = sub_100039A70();
    uint64_t v4 = qword_1000675B0;
    if (qword_1000675B0)
    {
      unint64_t v5 = v3;
      if (!qword_100067620)
      {
        __int16 v6 = sub_100038248();
        qword_100067620 = (uint64_t)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  v6);
        dispatch_source_set_event_handler((dispatch_source_t)qword_100067620, &stru_10005A430);
        dispatch_source_set_cancel_handler((dispatch_source_t)qword_100067620, &stru_10005A450);
        uint64_t v4 = qword_1000675B0;
      }

      unint64_t v7 = v5 - v4;
      BOOL v8 = dword_1000675A0 >= v7;
      unint64_t v9 = dword_1000675A0 - v7;
      if (v9 != 0 && v8)
      {
        dispatch_time_t v10 = dispatch_time(0LL, 1000000000 * v9);
        dispatch_source_set_timer((dispatch_source_t)qword_100067620, v10, 0xFFFFFFFFFFFFFFFFLL, 0LL);
        if ((byte_100067628 & 1) == 0)
        {
          dispatch_resume((dispatch_object_t)qword_100067620);
          byte_100067628 = 1;
        }
      }
    }
  }

  CFNumberRef v11 = (uint64_t *)*((void *)&xmmword_100067580 + 1);
  if (*((void *)&xmmword_100067580 + 1))
  {
    while (1)
    {
      CFNumberRef v12 = v11;
      if (*((_DWORD *)v11 + 6) > *(_DWORD *)(a1 + 24)) {
        break;
      }
      CFNumberRef v11 = (uint64_t *)*v11;
      if (!*v12)
      {
        *(void *)a1 = 0LL;
        void *v12 = a1;
        goto LABEL_20;
      }
    }

    uint64_t v13 = v11[1];
    *(void *)a1 = v11;
    *(void *)(a1 + _Block_object_dispose(va, 8) = v13;
    *(void *)v11[1] = a1;
    v11[1] = a1;
  }

  else
  {
    CFNumberRef v12 = (void *)&xmmword_100067580 + 1;
    *((void *)&xmmword_100067580 + 1) = a1;
    *(void *)a1 = 0LL;
LABEL_20:
    *(void *)(a1 + _Block_object_dispose(va, 8) = v12;
  }

  *(void *)(a1 + 32) = -1LL;
  sub_1000369F8();
}

void sub_100037BFC(xpc_object_t object)
{
  if (object)
  {
    unsigned int v2 = (void *)*((void *)&xmmword_100067580 + 1);
    while (v2)
    {
      unint64_t v3 = v2;
      unsigned int v2 = (void *)*v2;
      if ((xpc_object_t)v3[2] == object)
      {
        if (v2) {
          v2[1] = v3[1];
        }
        *(void *)v3[1] = v2;
        xpc_release(object);
        free(v3);
        uint64_t v4 = (os_log_s *)qword_100068820;
        if (os_log_type_enabled((os_log_t)qword_100068820, OS_LOG_TYPE_DEBUG)) {
          sub_100043E54((_xpc_connection_s *)object, v4);
        }
        return;
      }
    }
  }

  else
  {
    unint64_t v5 = (os_log_s *)qword_100068820;
    if (os_log_type_enabled((os_log_t)qword_100068820, OS_LOG_TYPE_ERROR)) {
      sub_100043DE0(v5);
    }
  }

void sub_100037CAC(_xpc_connection_s *a1, xpc_object_t xdict)
{
  if (a1 && xdict)
  {
    unint64_t v3 = (void *)*((void *)&xmmword_100067580 + 1);
    while (v3)
    {
      uint64_t v4 = (uint64_t)v3;
      unint64_t v3 = (void *)*v3;
      if (*(_xpc_connection_s **)(v4 + 16) == a1)
      {
        if (v3) {
          v3[1] = *(void *)(v4 + 8);
        }
        **(void **)(v4 + _Block_object_dispose(va, 8) = v3;
        *(_DWORD *)(v4 + 24) = xpc_dictionary_get_uint64(xdict, "ActivityTimeout");
        sub_100037A28(v4);
        unint64_t v5 = (os_log_s *)qword_100068820;
        if (os_log_type_enabled((os_log_t)qword_100068820, OS_LOG_TYPE_DEBUG))
        {
          int v6 = *(_DWORD *)(v4 + 24);
          uint64_t v7 = *(void *)(v4 + 16);
          v9[0] = 67109632;
          v9[1] = v6;
          __int16 v10 = 2048;
          uint64_t v11 = v7;
          __int16 v12 = 1024;
          pid_t pid = xpc_connection_get_pid(a1);
          _os_log_debug_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "Updated idleTimeout to %d for  user inactivity client %p(pid %d)\n",  (uint8_t *)v9,  0x18u);
        }

        return;
      }
    }

    BOOL v8 = (os_log_s *)qword_100068820;
    if (os_log_type_enabled((os_log_t)qword_100068820, OS_LOG_TYPE_ERROR)) {
      sub_100043ED0(a1, v8);
    }
  }

  else if (os_log_type_enabled((os_log_t)qword_100068820, OS_LOG_TYPE_ERROR))
  {
    sub_100043F4C();
  }

uint64_t sub_100037E2C()
{
  unint64_t v0 = sub_100039A70();
  if (v0 <= qword_1000675B0) {
    return 0LL;
  }
  else {
    return (v0 - qword_1000675B0);
  }
}

unint64_t sub_100037E54()
{
  unint64_t v0 = sub_100039A70();
  int v1 = (os_log_s *)qword_100068820;
  if (os_log_type_enabled((os_log_t)qword_100068820, OS_LOG_TYPE_DEBUG)) {
    sub_100043FAC(v0, v1);
  }
  if (byte_100067567)
  {
    if ((_BYTE)word_1000675B8) {
      unint64_t v2 = 0LL;
    }
    else {
      unint64_t v2 = v0 - qword_1000675A8;
    }
  }

  else
  {
    unint64_t v2 = -1LL;
  }

  unint64_t v3 = v0 - qword_1000675B0;
  if (!HIBYTE(word_1000675B8)) {
    unint64_t v3 = -1LL;
  }
  if (v2 >= v3) {
    return v3;
  }
  else {
    return v2;
  }
}

void sub_100037EF8(id a1)
{
  qword_100067608 = 0LL;
}

void sub_100037F20(id a1)
{
  qword_100067590 = IOHIDEventSystemClientCreateWithType(kCFAllocatorDefault, 1LL, 0LL);
  if (qword_100067590)
  {
    int v1 = sub_100036770();
    IOHIDEventSystemClientSetMatching(qword_100067590, v1);
    IOHIDEventSystemClientRegisterPropertyChangedCallback( qword_100067590,  @"HIDActivityState",  sub_100036900,  0LL,  0LL);
    IOHIDEventSystemClientScheduleWithDispatchQueue(qword_100067590, qword_1000675C8);
    sub_100036880(@"IdleNotificationTime", dword_1000675A0);
    sub_100036900();
  }

  else if (os_log_type_enabled((os_log_t)qword_100068820, OS_LOG_TYPE_ERROR))
  {
    sub_10004406C();
  }

void sub_100037FE4(id a1)
{
}

void sub_100037FFC(id a1)
{
  qword_100067620 = 0LL;
}

  ;
}

  ;
}

void sub_100038054(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

uint64_t sub_100038060(xpc_connection_t connection)
{
  return xpc_connection_get_pid(connection);
}

uint64_t sub_100038068()
{
  qword_100067630 = (uint64_t)CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  SCDynamicStoreRef v0 = SCDynamicStoreCreate(0LL, @"powerd", (SCDynamicStoreCallBack)sub_10003AE2C, 0LL);
  qword_100068828 = (uint64_t)v0;
  if (v0)
  {
    int v1 = v0;
    unint64_t v2 = sub_100038248();
    SCDynamicStoreSetDispatchQueue(v1, v2);
    SCDynamicStoreRef v0 = (SCDynamicStoreRef)qword_100068828;
  }

  return SCDynamicStoreSetDisconnectCallBack(v0, sub_1000380EC);
}

uint64_t sub_1000380EC(const __SCDynamicStore *a1)
{
  if ((const __SCDynamicStore *)qword_100068828 != a1) {
    sub_100044098();
  }
  return SCDynamicStoreSetMultiple(a1, (CFDictionaryRef)qword_100067630, 0LL, 0LL);
}

BOOL sub_100038120(const __CFString *a1, const void *a2)
{
  BOOL result = 0LL;
  if (a1 && a2 && qword_100067630)
  {
    CFTypeID TypeID = CFStringGetTypeID();
    if (CFGetTypeID(a1) == TypeID)
    {
      CFBooleanRef Value = CFDictionaryGetValue((CFDictionaryRef)qword_100067630, a1);
      if (Value && CFEqual(Value, a2))
      {
        return 1LL;
      }

      else
      {
        CFDictionarySetValue((CFMutableDictionaryRef)qword_100067630, a1, a2);
        return SCDynamicStoreSetValue((SCDynamicStoreRef)qword_100068828, a1, a2) != 0;
      }
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

BOOL sub_1000381D0(BOOL result)
{
  if (result)
  {
    int v1 = (const __CFString *)result;
    CFTypeID TypeID = CFStringGetTypeID();
    if (CFGetTypeID(v1) == TypeID)
    {
      CFDictionaryRemoveValue((CFMutableDictionaryRef)qword_100067630, v1);
      return SCDynamicStoreRemoveValue((SCDynamicStoreRef)qword_100068828, v1) != 0;
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

uint64_t sub_100038238()
{
  return qword_100068828;
}

dispatch_queue_t sub_100038248()
{
  dispatch_queue_t result = (dispatch_queue_t)qword_100067638;
  if (!qword_100067638)
  {
    dispatch_queue_t result = dispatch_queue_create_with_target_V2("Power Management main queue", 0LL, 0LL);
    qword_100067638 = (uint64_t)result;
  }

  return result;
}

void sub_100038284()
{
  int v0 = dword_100066DC8 + 1;
  if (dword_100066DC8 == -1) {
    int v0 = 1;
  }
  dword_100066DC8 = v0;
}

BOOL sub_1000382AC(_OWORD *a1, const __CFString *a2)
{
  CFErrorRef error = 0LL;
  __int128 v3 = a1[1];
  *(_OWORD *)v9.val = *a1;
  *(_OWORD *)&v9.val[4] = v3;
  uint64_t v4 = SecTaskCreateWithAuditToken(kCFAllocatorDefault, &v9);
  if (!v4) {
    return 0LL;
  }
  unint64_t v5 = v4;
  int v6 = (const __CFBoolean *)SecTaskCopyValueForEntitlement(v4, a2, &error);
  CFRelease(v5);
  BOOL v7 = kCFBooleanTrue == v6;
  if (v6) {
    CFRelease(v6);
  }
  if (error) {
    CFRelease(error);
  }
  return v7;
}

BOOL sub_100038354(_xpc_connection_s *a1, const __CFString *a2)
{
  pid_t pid = xpc_connection_get_pid(a1);
  audit_token_t v11 = v12;
  unint64_t v5 = SecTaskCreateWithAuditToken(kCFAllocatorDefault, &v11);
  if (v5)
  {
    int v6 = v5;
    BOOL v7 = (const __CFBoolean *)SecTaskCopyValueForEntitlement(v5, a2, 0LL);
    BOOL v8 = v7;
    if (v7) {
      CFRelease(v7);
    }
    CFRelease(v6);
    if (kCFBooleanTrue == v8) {
      return 1LL;
    }
  }

  audit_token_t v9 = (os_log_s *)qword_100067908;
  BOOL result = os_log_type_enabled((os_log_t)qword_100067908, OS_LOG_TYPE_ERROR);
  if (result)
  {
    sub_1000440C0((uint64_t)a2, pid, v9);
    return 0LL;
  }

  return result;
}

BOOL sub_100038434(_OWORD *a1)
{
  CFErrorRef error = 0LL;
  __int128 v1 = a1[1];
  *(_OWORD *)v6.val = *a1;
  *(_OWORD *)&v6.val[4] = v1;
  unint64_t v2 = SecTaskCreateWithAuditToken(kCFAllocatorDefault, &v6);
  BOOL v3 = (BOOL)v2;
  if (v2)
  {
    CFTypeRef v4 = SecTaskCopyValueForEntitlement(v2, @"com.apple.private.xpc.launchd.job-manager", &error);
    CFRelease((CFTypeRef)v3);
    if (v4)
    {
      BOOL v3 = CFEqual(v4, @"com.apple.runningboard") != 0;
      CFRelease(v4);
    }

    else
    {
      BOOL v3 = 0LL;
    }

    if (error) {
      CFRelease(error);
    }
  }

  return v3;
}

uint64_t sub_1000384DC(const __CFString *a1, const void *a2)
{
  io_registry_entry_t v4 = sub_10000AD18();
  return IORegistryEntrySetCFProperty(v4, a1, a2);
}

CFTypeRef sub_100038508(const __CFString *a1)
{
  io_registry_entry_t v2 = sub_10000AD18();
  return IORegistryEntryCreateCFProperty(v2, a1, kCFAllocatorDefault, 0);
}

BOOL sub_10003853C(char *a1, int a2)
{
  io_registry_entry_t v4 = (const __CFString *)IOPMSleepWakeCopyUUID();
  if (!v4) {
    return 0LL;
  }
  unint64_t v5 = v4;
  BOOL v6 = CFStringGetCString(v4, a1, a2, 0x8000100u) != 0;
  CFRelease(v5);
  return v6;
}

CFStringRef sub_1000385A0()
{
  io_registry_entry_t v0 = sub_10000AD18();
  if (off_100066DD0) {
    CFRelease(off_100066DD0);
  }
  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(v0, @"Last Sleep Reason", kCFAllocatorDefault, 0);
  off_100066DD0 = CFProperty;
  CFTypeID TypeID = CFStringGetTypeID();
  if (CFProperty && CFGetTypeID(CFProperty) == TypeID) {
    return (const __CFString *)off_100066DD0;
  }
  BOOL result = &stru_10005AC58;
  off_100066DD0 = &stru_10005AC58;
  return result;
}

uint64_t sub_100038630()
{
  return off_100066DD0;
}

void sub_10003863C()
{
  if (off_100066DD8) {
    CFRelease(off_100066DD8);
  }
  if (off_100066DE0) {
    CFRelease(off_100066DE0);
  }
  if (qword_100067650) {
    CFRelease((CFTypeRef)qword_100067650);
  }
  io_registry_entry_t v0 = (const void *)qword_100067648;
  CFTypeID TypeID = CFArrayGetTypeID();
  if (v0 && CFGetTypeID(v0) == TypeID) {
    CFRelease((CFTypeRef)qword_100067648);
  }
  if (qword_100067660) {
    CFRelease((CFTypeRef)qword_100067660);
  }
  qword_100067650 = 0LL;
  qword_100067648 = 0LL;
  off_100066DD8 = &stru_10005AC58;
  off_100066DE0 = &stru_10005AC58;
  qword_100067660 = 0LL;
}

CFTypeID sub_1000386EC(void *a1, void *a2)
{
  if (off_100066DD8)
  {
    CFRelease(off_100066DD8);
    off_100066DD8 = &stru_10005AC58;
  }

  if (off_100066DE0)
  {
    CFRelease(off_100066DE0);
    off_100066DE0 = &stru_10005AC58;
  }

  if (qword_100067648)
  {
    CFRelease((CFTypeRef)qword_100067648);
    qword_100067648 = 0LL;
  }

  if (qword_100067650)
  {
    CFRelease((CFTypeRef)qword_100067650);
    qword_100067650 = 0LL;
  }

  io_registry_entry_t v4 = sub_10000AD18();
  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(v4, @"Wake Reason", kCFAllocatorDefault, 0);
  off_100066DD8 = CFProperty;
  CFTypeID TypeID = CFStringGetTypeID();
  if (!CFProperty || CFGetTypeID(CFProperty) != TypeID) {
    off_100066DD8 = &stru_10005AC58;
  }
  io_registry_entry_t v7 = sub_10000AD18();
  CFTypeRef v8 = IORegistryEntryCreateCFProperty(v7, @"Wake Type", kCFAllocatorDefault, 0);
  off_100066DE0 = v8;
  CFTypeID v9 = CFStringGetTypeID();
  if (!v8 || CFGetTypeID(v8) != v9) {
    off_100066DE0 = &stru_10005AC58;
  }
  io_registry_entry_t v10 = sub_10000AD18();
  audit_token_t v11 = (const __CFArray *)IORegistryEntryCreateCFProperty(v10, @"IOPMDriverWakeEvents", kCFAllocatorDefault, 0);
  qword_100067648 = (uint64_t)v11;
  CFTypeID v12 = CFArrayGetTypeID();
  if (v11 && CFGetTypeID(v11) == v12 && (CFIndex Count = CFArrayGetCount(v11), Count >= 1))
  {
    CFIndex v14 = Count;
    CFIndex v15 = 0LL;
    while (1)
    {
      uint64_t ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v11, v15);
      CFTypeID v17 = CFDictionaryGetTypeID();
      if (ValueAtIndex)
      {
        if (CFGetTypeID(ValueAtIndex) == v17)
        {
          CFBooleanRef Value = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, @"Reason");
          CFTypeID v19 = CFStringGetTypeID();
          if (Value)
          {
            if (CFGetTypeID(Value) == v19
              && (CFStringHasPrefix(Value, @"WiFi") || CFStringHasPrefix(Value, @"Enet")))
            {
              break;
            }
          }
        }
      }

      if (v14 == ++v15) {
        goto LABEL_26;
      }
    }

    CFTypeRef v20 = CFRetain(Value);
  }

  else
  {
LABEL_26:
    CFTypeRef v20 = 0LL;
  }

  qword_100067650 = (uint64_t)v20;
  uint64_t v21 = off_100066DE0;
  if (v20) {
    uint64_t v21 = (uint64_t)v20;
  }
  qword_100067658 = v21;
  return sub_100038928(a1, a2);
}

CFTypeID sub_100038928(void *a1, void *a2)
{
  io_registry_entry_t v4 = (const void *)off_100066DD8;
  CFTypeID TypeID = CFStringGetTypeID();
  if (!v4 || CFGetTypeID(v4) != TypeID) {
    off_100066DD8 = &stru_10005AC58;
  }
  BOOL v6 = (const void *)off_100066DE0;
  CFTypeID result = CFStringGetTypeID();
  if (!v6 || (v8 = result, CFTypeID result = CFGetTypeID(v6), result != v8)) {
    off_100066DE0 = &stru_10005AC58;
  }
  if (a1) {
    *a1 = off_100066DD8;
  }
  if (a2) {
    *a2 = off_100066DE0;
  }
  return result;
}

uint64_t sub_1000389D0(const __CFString *a1)
{
  io_registry_entry_t v2 = (const void *)qword_100067660;
  CFTypeID TypeID = CFArrayGetTypeID();
  if (!v2) {
    return 0LL;
  }
  if (CFGetTypeID(v2) != TypeID) {
    return 0LL;
  }
  CFTypeID v4 = CFStringGetTypeID();
  if (!a1) {
    return 0LL;
  }
  if (CFGetTypeID(a1) != v4) {
    return 0LL;
  }
  CFIndex Count = CFArrayGetCount((CFArrayRef)qword_100067660);
  if (Count < 1) {
    return 0LL;
  }
  CFIndex v6 = Count;
  CFIndex v7 = 0LL;
  while (1)
  {
    uint64_t ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex((CFArrayRef)qword_100067660, v7);
    CFTypeID v9 = CFStringGetTypeID();
    if (ValueAtIndex)
    {
      if (CFGetTypeID(ValueAtIndex) == v9 && CFStringCompare(a1, ValueAtIndex, 0LL) == kCFCompareEqualTo) {
        break;
      }
    }

    if (v6 == ++v7) {
      return 0LL;
    }
  }

  return 1LL;
}

void sub_100038AAC(_xpc_connection_s *a1, void *a2)
{
  if (!a1 || !a2) {
    return;
  }
  xpc_connection_get_audit_token(a1, &v18);
  pid_t pid = xpc_connection_get_pid(a1);
  audit_token_t token = v18;
  unint64_t v5 = SecTaskCreateWithAuditToken(kCFAllocatorDefault, &token);
  CFIndex v6 = (const __CFString *)v5;
  if (v5)
  {
    CFTypeRef v7 = SecTaskCopyValueForEntitlement(v5, @"com.apple.private.iokit.darkwake-control", 0LL);
    if (v7)
    {
      CFTypeID v8 = v7;
      string = xpc_dictionary_get_string(a2, "identity");
      io_registry_entry_t v10 = xpc_dictionary_get_string(a2, "reason");
      audit_token_t v11 = v10;
      CFTypeID v12 = "--none--";
      if (string) {
        uint64_t v13 = string;
      }
      else {
        uint64_t v13 = "--none--";
      }
      if (v10) {
        CFTypeID v12 = v10;
      }
      snprintf((char *)&token, 0xFFuLL, "AppWoke:%s Reason:%s", v13, v12);
      CFIndex v14 = (os_log_s *)qword_100067908;
      if (os_log_type_enabled((os_log_t)qword_100067908, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446210;
        p_audit_token_t token = &token;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}s\n", buf, 0xCu);
        CFIndex v14 = (os_log_s *)qword_100067908;
      }

      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        token.val[0] = 136315394;
        *(void *)&token.val[1] = v11;
        LOWORD(token.val[3]) = 2080;
        *(void *)((char *)&token.val[3] + 2) = string;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Wake reason: %s  identity: %s \n",  (uint8_t *)&token,  0x16u);
      }

      CFStringRef v15 = CFStringCreateWithCString(0LL, v11, 0x8000100u);
      if (v15)
      {
        CFMutableDictionaryRef Mutable = (__CFArray *)qword_100067660;
        if (qword_100067660
          || (CFMutableDictionaryRef Mutable = CFArrayCreateMutable(0LL, 0LL, &kCFTypeArrayCallBacks), (qword_100067660 = (uint64_t)Mutable) != 0))
        {
          CFArrayAppendValue(Mutable, v15);
        }

        else if (os_log_type_enabled((os_log_t)qword_100067908, OS_LOG_TYPE_ERROR))
        {
          sub_1000441E0();
        }
      }

      else if (os_log_type_enabled((os_log_t)qword_100067908, OS_LOG_TYPE_ERROR))
      {
        sub_1000441B4();
      }

      CFRelease(v6);
      CFRelease(v8);
      if (!v15) {
        return;
      }
LABEL_21:
      CFRelease(v15);
      return;
    }
  }

  CFTypeID v17 = (os_log_s *)qword_100067908;
  if (os_log_type_enabled((os_log_t)qword_100067908, OS_LOG_TYPE_ERROR)) {
    sub_100044144(pid, v17);
  }
  CFStringRef v15 = v6;
  if (v6) {
    goto LABEL_21;
  }
}

uint64_t sub_100038D54(_DWORD *a1)
{
  io_registry_entry_t v2 = sub_10000AD18();
  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(v2, @"IOHibernateState", kCFAllocatorDefault, 0);
  CFTypeID TypeID = CFDataGetTypeID();
  if (!CFProperty) {
    return 0LL;
  }
  if (CFGetTypeID(CFProperty) == TypeID
    && CFDataGetLength((CFDataRef)CFProperty) == 4
    && (BytePtr = CFDataGetBytePtr((CFDataRef)CFProperty)) != 0LL)
  {
    *a1 = *(_DWORD *)BytePtr;
    uint64_t v6 = 1LL;
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  CFRelease(CFProperty);
  return v6;
}

const char *sub_100038DFC(unsigned int a1)
{
  if (a1 > 7) {
    return "Unknown";
  }
  else {
    return (&off_10005A4D0)[a1];
  }
}

uint64_t sub_100038E20()
{
  return 2LL;
}

BOOL sub_100038E28(xpc_connection_t connection, const __CFString *a2, int a3)
{
  if (a3 && xpc_connection_get_euid(connection)) {
    return 0LL;
  }
  xpc_connection_get_audit_token(connection, &v11);
  audit_token_t v10 = v11;
  unint64_t v5 = SecTaskCreateWithAuditToken(kCFAllocatorDefault, &v10);
  if (!v5) {
    return 0LL;
  }
  uint64_t v6 = v5;
  CFTypeRef v7 = SecTaskCopyValueForEntitlement(v5, a2, 0LL);
  BOOL v8 = v7 != 0LL;
  CFRelease(v6);
  if (v7)
  {
    CFRelease(v7);
    return 1LL;
  }

  return v8;
}

BOOL sub_100038ED4(int a1)
{
  return a1 == 0;
}

void sub_100038EE0(_xpc_connection_s *a1, xpc_object_t original)
{
  if (original)
  {
    xpc_object_t reply = xpc_dictionary_create_reply(original);
    if (reply)
    {
      unint64_t v5 = reply;
      if (sub_100038E28(a1, @"com.apple.private.iokit.batteryTester", 1))
      {
        if (xpc_dictionary_get_value(original, "resetCustomBatteryProps"))
        {
          sub_1000153EC();
          xpc_dictionary_set_uint64(v5, "returnCode", 0LL);
          uint64_t v6 = (os_log_s *)qword_100067908;
          if (os_log_type_enabled((os_log_t)qword_100067908, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)CFTypeRef v7 = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "System reset to use default battery properties\n",  v7,  2u);
          }
        }
      }

      else
      {
        if (os_log_type_enabled((os_log_t)qword_100067908, OS_LOG_TYPE_ERROR)) {
          sub_10004420C();
        }
        xpc_dictionary_set_uint64(v5, "returnCode", 0xFFFFFFFFE00002C1LL);
      }

      xpc_connection_send_message(a1, v5);
      xpc_release(v5);
    }

    else if (os_log_type_enabled((os_log_t)qword_100067908, OS_LOG_TYPE_ERROR))
    {
      sub_1000436B0();
    }
  }

  else if (os_log_type_enabled((os_log_t)qword_100067908, OS_LOG_TYPE_ERROR))
  {
    sub_100043684();
  }

void sub_100039054(_xpc_connection_s *a1, xpc_object_t original)
{
  if (original)
  {
    xpc_object_t reply = xpc_dictionary_create_reply(original);
    if (reply)
    {
      unint64_t v5 = reply;
      if (!sub_100038E28(a1, @"com.apple.private.iokit.batteryTester", 1))
      {
        if (os_log_type_enabled((os_log_t)qword_100067908, OS_LOG_TYPE_ERROR)) {
          sub_100044264();
        }
        xpc_dictionary_set_uint64(v5, "returnCode", 0xFFFFFFFFE00002C1LL);
        xpc_connection_send_message(a1, v5);
        goto LABEL_20;
      }

      xpc_object_t value = xpc_dictionary_get_value(original, "customBatteryProps");
      if (value)
      {
        CFTypeRef v7 = (const void *)_CFXPCCreateCFObjectFromXPCObject(value);
        CFTypeID TypeID = CFDictionaryGetTypeID();
        if (v7 && CFGetTypeID(v7) == TypeID)
        {
          sub_10001518C((uint64_t)v7);
          xpc_dictionary_set_uint64(v5, "returnCode", 0LL);
          xpc_connection_send_message(a1, v5);
LABEL_19:
          CFRelease(v7);
LABEL_20:
          xpc_release(v5);
          return;
        }
      }

      else
      {
        CFDictionaryGetTypeID();
        CFTypeRef v7 = 0LL;
      }

      if (os_log_type_enabled((os_log_t)qword_100067908, OS_LOG_TYPE_ERROR)) {
        sub_100044238();
      }
      xpc_dictionary_set_uint64(v5, "returnCode", 0xFFFFFFFFE00002C2LL);
      xpc_connection_send_message(a1, v5);
      if (!v7) {
        goto LABEL_20;
      }
      goto LABEL_19;
    }

    if (os_log_type_enabled((os_log_t)qword_100067908, OS_LOG_TYPE_ERROR)) {
      sub_1000436B0();
    }
  }

  else if (os_log_type_enabled((os_log_t)qword_100067908, OS_LOG_TYPE_ERROR))
  {
    sub_100043684();
  }

__asl_object_s *sub_100039218()
{
  io_registry_entry_t v0 = asl_new(0);
  asl_set(v0, "Level", "Notice");
  asl_set(v0, "Facility", "com.apple.iokit.power");
  return v0;
}

void sub_10003926C(int a1)
{
  io_registry_entry_t v2 = sub_10000B008(a1);
  snprintf(__str, 0x78uLL, "SMC shutdown cause: %d: %s", a1, v2);
  BOOL v3 = (os_log_s *)qword_100067908;
  if (os_log_type_enabled((os_log_t)qword_100067908, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    unint64_t v5 = __str;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s\n", buf, 0xCu);
  }

void sub_10003932C(const char *a1, uint64_t a2, uint64_t a3, int a4)
{
  v15[0] = 0;
  __str[0] = 0;
  io_registry_entry_t v6 = sub_10000AD18();
  int valuePtr = -1;
  CFTypeRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty( v6,  @"SleepRequestedByPID",  kCFAllocatorDefault,  0);
  if (CFProperty)
  {
    CFTypeID TypeID = CFNumberGetTypeID();
    if (CFGetTypeID(CFProperty) == TypeID) {
      CFNumberGetValue(CFProperty, kCFNumberIntType, &valuePtr);
    }
  }

  CFTypeID v9 = (const void *)off_100066DD0;
  if (off_100066DD0)
  {
    CFTypeID v10 = CFStringGetTypeID();
    if (CFGetTypeID(v9) == v10)
    {
      if (CFStringGetCString(off_100066DD0, (char *)buffer, 50LL, 0x8000100u))
      {
        if (*(void *)buffer == 0x6572617774666F53LL && *(void *)&buffer[6] == 0x7065656C53206572LL) {
          snprintf(__str, 0x64uLL, "'%s pid=%d'");
        }
        else {
          snprintf(__str, 0x64uLL, "'%s'");
        }
      }
    }
  }

  if (CFProperty) {
    CFRelease(CFProperty);
  }
  if (!strncmp(a1, "success", 8uLL))
  {
    if (a4 == 3) {
      strcpy(v15, "Entering Sleep state");
    }
    else {
      strcpy(v15, "Entering DarkWake state");
    }
    if (__str[0]) {
      snprintf(v15, 0xC8uLL, "%s due to %s");
    }
  }

  else
  {
    snprintf(v15, 0xC8uLL, "Failure during sleep: %s : %s");
  }

  CFTypeID v12 = (os_log_s *)qword_100067908;
  if (os_log_type_enabled((os_log_t)qword_100067908, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buffer = 136446210;
    *(void *)&_OWORD buffer[4] = v15;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}s", buffer, 0xCu);
  }

void sub_1000395AC(const char *a1, uint64_t a2, const char *a3, char a4, int a5)
{
  if (sub_10003853C(__s1, 200) && strncmp(__s1, byte_10006766C, 0x32uLL))
  {
    snprintf(byte_10006766C, 0x32uLL, "%s", __s1);
    dword_100067668 = 0;
  }

  __s1[0] = 0;
  if (!strncmp(a1, "success", 8uLL))
  {
    buffer[0] = 0;
    v26[0] = 512LL;
    sysctlbyname("kern.wakereason", buffer, v26, 0LL, 0LL);
    if (a5 == 2)
    {
      io_registry_entry_t v11 = sub_10000AD18();
      CFTypeRef CFProperty = (const __CFString *)IORegistryEntryCreateCFProperty(v11, @"Wake Type", kCFAllocatorDefault, 0);
      CFTypeID TypeID = CFStringGetTypeID();
      if (CFProperty)
      {
        if (CFGetTypeID(CFProperty) == TypeID) {
          CFStringGetCString(CFProperty, buffer, 512LL, 0x8000100u);
        }
        CFRelease(CFProperty);
      }

      strcpy(__s1, "DarkWake to FullWake");
    }

    else if (a5 == 1)
    {
      ++dword_100067668;
      strcpy(__s1, "DarkWake");
    }

    else
    {
      strcpy(__s1, "Wake");
    }

    CFIndex v14 = "C";
    if ((a4 & 1) == 0) {
      CFIndex v14 = "<off> ";
    }
    CFStringRef v15 = "D";
    if ((a4 & 0x10) == 0) {
      CFStringRef v15 = "";
    }
    CFNumberRef v16 = "N";
    if ((a4 & 8) == 0) {
      CFNumberRef v16 = "";
    }
    CFTypeID v17 = "V";
    if ((a4 & 2) == 0) {
      CFTypeID v17 = "";
    }
    audit_token_t v18 = "A";
    if ((a4 & 4) == 0) {
      audit_token_t v18 = "";
    }
    CFTypeID v19 = "P";
    if ((a4 & 0x20) == 0) {
      CFTypeID v19 = "";
    }
    if ((a4 & 0x40) != 0) {
      CFTypeRef v20 = "B";
    }
    else {
      CFTypeRef v20 = "";
    }
    snprintf((char *)v26, 0x32uLL, " [%s%s%s%s%s%s%s]", v14, v15, v16, v17, v18, v19, v20);
    size_t v21 = strlen(__s1);
    __strncat_chk(__s1, v26, 199 - v21, 200LL);
    CFTypeID v10 = buffer;
  }

  else
  {
    if (a1) {
      CFTypeID v9 = a1;
    }
    else {
      CFTypeID v9 = "";
    }
    snprintf(__s1, 0xC8uLL, "Failure during wake: %s : %s", a3, v9);
    CFTypeID v10 = 0LL;
  }

  __int128 v22 = ": due to";
  if (!v10)
  {
    __int128 v22 = "";
    CFTypeID v10 = "";
  }

  snprintf(__s1, 0xC8uLL, "%s %s %s\n", __s1, v22, v10);
  unsigned int v23 = (os_log_s *)qword_100067908;
  if (os_log_type_enabled((os_log_t)qword_100067908, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    uint64_t v25 = __s1;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%{public}s\n", buf, 0xCu);
  }

void sub_1000398E8(unint64_t a1)
{
  __int128 v1 = (os_log_s *)qword_100067908;
  if (os_log_type_enabled((os_log_t)qword_100067908, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    BOOL v3 = __str;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "%s\n", buf, 0xCu);
  }

void sub_1000399BC()
{
  if (sub_10003AE20())
  {
    io_registry_entry_t v0 = (dispatch_queue_s *)qword_100067638;
    if (!qword_100067638)
    {
      io_registry_entry_t v0 = dispatch_queue_create_with_target_V2("Power Management main queue", 0LL, 0LL);
      qword_100067638 = (uint64_t)v0;
    }

    dispatch_async(v0, &stru_10005A490);
  }

unint64_t sub_100039A18(uint64_t a1)
{
  unsigned int v2 = dword_1000676A4;
  if (!dword_1000676A4)
  {
    mach_timebase_info((mach_timebase_info_t)&dword_1000676A0);
    unsigned int v2 = dword_1000676A4;
  }

  return (unint64_t)dword_1000676A0 * a1 / (1000000000 * (unint64_t)v2);
}

unint64_t sub_100039A70()
{
  uint64_t v0 = mach_continuous_time();
  unsigned int v1 = dword_1000676A4;
  if (!dword_1000676A4)
  {
    mach_timebase_info((mach_timebase_info_t)&dword_1000676A0);
    unsigned int v1 = dword_1000676A4;
  }

  return v0 * dword_1000676A0 / (1000000000 * (unint64_t)v1);
}

unint64_t sub_100039ACC()
{
  uint64_t v0 = mach_absolute_time();
  unsigned int v1 = dword_1000676A4;
  if (!dword_1000676A4)
  {
    mach_timebase_info((mach_timebase_info_t)&dword_1000676A0);
    unsigned int v1 = dword_1000676A4;
  }

  return v0 * dword_1000676A0 / (1000000000 * (unint64_t)v1);
}

uint64_t sub_100039B28(uid_t a1)
{
  unsigned int v5 = 17;
  uint64_t result = (uint64_t)getpwuid(a1);
  if (result)
  {
    getgrouplist(*(const char **)result, *(_DWORD *)(result + 20), v6, (int *)&v5);
    uint64_t result = (uint64_t)getgrnam("admin");
    if (result)
    {
      uint64_t v2 = v5;
      if ((int)v5 < 1)
      {
        return 0LL;
      }

      else
      {
        BOOL v3 = v6;
        while (1)
        {
          int v4 = *v3++;
          if (v4 == *(_DWORD *)(result + 16)) {
            break;
          }
          if (!--v2) {
            return 0LL;
          }
        }

        return 1LL;
      }
    }
  }

  return result;
}

double sub_100039BD8()
{
  unint64_t valuePtr = 0LL;
  io_service_t MatchingService = dword_1000676A8;
  if (!dword_1000676A8)
  {
    unsigned int v1 = IOServiceMatching("IOHIDSystem");
    io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v1);
    dword_1000676A8 = MatchingService;
    if (!MatchingService) {
      return 0.0;
    }
  }

  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(MatchingService, @"HIDIdleTime", 0LL, 0);
  CFTypeID TypeID = CFNumberGetTypeID();
  if (!CFProperty) {
    return 0.0;
  }
  double v4 = 0.0;
  if (CFGetTypeID(CFProperty) == TypeID && CFNumberGetValue((CFNumberRef)CFProperty, kCFNumberSInt64Type, &valuePtr)) {
    double v4 = (double)valuePtr / 1000000000.0;
  }
  CFRelease(CFProperty);
  return v4;
}

uint64_t sub_100039CB0(int a1, const void *a2, unsigned int a3)
{
  if (!a1) {
    return 3758097118LL;
  }
  memset(v16, 0, sizeof(v16));
  __int128 v15 = 0u;
  __int128 v14 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  v16[6] = 9;
  int v13 = a1;
  uint64_t result = sub_100039DE0(&v13, &v8);
  if (!(_DWORD)result)
  {
    if (BYTE8(v10))
    {
      if (BYTE8(v10) == 132) {
        return 3758097136LL;
      }
      else {
        return 3758097097LL;
      }
    }

    else
    {
      v16[6] = 6;
      int v13 = a1;
      DWORD2(v15) = HIDWORD(v9);
      if (a3 >= 0x20) {
        size_t v7 = 32LL;
      }
      else {
        size_t v7 = a3;
      }
      if (a2 && (_DWORD)v7) {
        memcpy(&v16[12], a2, v7);
      }
      __int128 v11 = 0u;
      __int128 v12 = 0u;
      __int128 v9 = 0u;
      __int128 v10 = 0u;
      __int128 v8 = 0u;
      LODWORD(result) = sub_100039DE0(&v13, &v8);
      if (BYTE8(v10)) {
        return 3758097097LL;
      }
      else {
        return result;
      }
    }
  }

  return result;
}

uint64_t sub_100039DE0(const void *a1, void *a2)
{
  size_t outputStructCnt = 80LL;
  io_connect_t connect = 0;
  double v4 = IOServiceMatching("AppleSMC");
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v4);
  if (!MatchingService) {
    return 3758097084LL;
  }
  uint64_t v6 = IOServiceOpen(MatchingService, mach_task_self_, 1u, &connect);
  if ((_DWORD)v6) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = connect == 0;
  }
  if (!v7)
  {
    uint64_t v6 = IOConnectCallMethod(connect, 0, 0LL, 0, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
    if (!(_DWORD)v6) {
      uint64_t v6 = IOConnectCallStructMethod(connect, 2u, a1, 0x50uLL, a2, &outputStructCnt);
    }
    if (connect)
    {
      IOConnectCallMethod(connect, 1u, 0LL, 0, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
      IOServiceClose(connect);
    }
  }

  return v6;
}

uint64_t sub_100039F00(int a1, const void *a2, unsigned int a3)
{
  if (!a1) {
    return 3758097118LL;
  }
  int v23 = 0;
  memset(v22, 0, sizeof(v22));
  __int128 v21 = 0u;
  __int128 v20 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  uint64_t v18 = 0LL;
  v22[6] = 9;
  int v19 = a1;
  uint64_t result = sub_10003A068(&v19, &v8);
  if (!(_DWORD)result)
  {
    if (BYTE8(v10))
    {
      if (BYTE8(v10) == 132) {
        return 3758097136LL;
      }
      else {
        return 3758097097LL;
      }
    }

    else
    {
      v22[6] = 6;
      int v19 = a1;
      DWORD2(v21) = HIDWORD(v9);
      if (a3 >= 0x78) {
        size_t v7 = 120LL;
      }
      else {
        size_t v7 = a3;
      }
      if (a2 && (_DWORD)v7) {
        memcpy(&v22[12], a2, v7);
      }
      __int128 v11 = 0u;
      __int128 v12 = 0u;
      __int128 v9 = 0u;
      __int128 v10 = 0u;
      __int128 v8 = 0u;
      LODWORD(result) = sub_10003A068(&v19, &v8);
      if (BYTE8(v10)) {
        return 3758097097LL;
      }
      else {
        return result;
      }
    }
  }

  return result;
}

uint64_t sub_10003A068(const void *a1, void *a2)
{
  size_t outputStructCnt = 168LL;
  io_connect_t connect = 0;
  double v4 = IOServiceMatching("AppleSMC");
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v4);
  if (!MatchingService) {
    return 3758097084LL;
  }
  uint64_t v6 = IOServiceOpen(MatchingService, mach_task_self_, 1u, &connect);
  if ((_DWORD)v6) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = connect == 0;
  }
  if (!v7)
  {
    uint64_t v6 = IOConnectCallMethod(connect, 0, 0LL, 0, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
    if (!(_DWORD)v6) {
      uint64_t v6 = IOConnectCallStructMethod(connect, 2u, a1, 0xA8uLL, a2, &outputStructCnt);
    }
    if (connect)
    {
      IOConnectCallMethod(connect, 1u, 0LL, 0, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
      IOServiceClose(connect);
    }
  }

  return v6;
}

BOOL sub_10003A188(BOOL result)
{
  if (result)
  {
    int v22 = 0;
    __int128 v21 = 0u;
    __int128 v20 = 0u;
    __int128 v19 = 0u;
    __int128 v18 = 0u;
    __int128 v17 = 0u;
    __int128 v16 = 0u;
    __int128 v15 = 0u;
    __int128 v14 = 0u;
    __int128 v13 = 0u;
    __int128 v12 = 0u;
    memset(v1, 0, sizeof(v1));
    __int128 v2 = 0u;
    __int128 v3 = 0u;
    __int128 v4 = 0u;
    __int128 v5 = 0u;
    __int128 v6 = 0u;
    __int128 v7 = 0u;
    __int128 v8 = 0u;
    __int128 v9 = 0u;
    uint64_t v10 = 0LL;
    BYTE6(v14) = 9;
    BOOL v11 = result;
    sub_10003A068(&v11, v1);
    return BYTE8(v2) == 0;
  }

  return result;
}

uint64_t sub_10003A248(int a1, void *a2, _BYTE *a3, unsigned int a4)
{
  uint64_t result = 3758097118LL;
  if (a1)
  {
    if (a2)
    {
      bzero(a2, *a3);
      __int128 v21 = 0u;
      memset(v22, 0, sizeof(v22));
      __int128 v20 = 0u;
      __int128 v19 = 0u;
      __int128 v13 = 0u;
      __int128 v14 = 0u;
      __int128 v15 = 0u;
      __int128 v16 = 0u;
      __int128 v17 = 0u;
      BYTE6(v21) = 9;
      int v18 = a1;
      uint64_t result = sub_100039DE0(&v18, &v13);
      if (!(_DWORD)result)
      {
        if (BYTE8(v15))
        {
          if (BYTE8(v15) == 132) {
            return 3758097136LL;
          }
          else {
            return 3758097097LL;
          }
        }

        else
        {
          if (a4 > 1) {
            a4 = (BYTE4(v15) & 4) == 0;
          }
          BYTE6(v21) = 5;
          int v18 = a1;
          DWORD2(v2sub_1000262C4(0x12u, 0) = HIDWORD(v14);
          __int128 v13 = 0u;
          __int128 v14 = 0u;
          __int128 v15 = 0u;
          __int128 v16 = 0u;
          __int128 v17 = 0u;
          uint64_t result = sub_100039DE0(&v18, &v13);
          if (BYTE8(v15))
          {
            uint64_t result = 3758097136LL;
            if (BYTE8(v15) != 132) {
              return 3758097097LL;
            }
          }

          else
          {
            LODWORD(v9) = *a3;
            if (DWORD2(v20) < v9)
            {
              LODWORD(v9) = BYTE8(v20);
              *a3 = BYTE8(v20);
            }

            if ((_DWORD)v9)
            {
              unint64_t v10 = 0LL;
              int v11 = -1;
              do
              {
                unint64_t v12 = v11 + (int)v9;
                if (!a4) {
                  unint64_t v12 = v10;
                }
                *((_BYTE *)a2 + v10++) = *((_BYTE *)&v16 + v12);
                unint64_t v9 = *a3;
                --v11;
              }

              while (v10 < v9);
            }
          }
        }
      }
    }
  }

  return result;
}

uint64_t sub_10003A3F0(const char *a1, _DWORD *a2)
{
  uint64_t v4 = 3758097084LL;
  CFMutableDictionaryRef properties = 0LL;
  io_registry_entry_t v5 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/options");
  if (v5)
  {
    io_object_t v6 = v5;
    if (!IORegistryEntryCreateCFProperties(v5, &properties, 0LL, 0))
    {
      CFStringRef v7 = CFStringCreateWithCStringNoCopy(0LL, a1, 0x8000100u, kCFAllocatorNull);
      CFTypeID TypeID = CFStringGetTypeID();
      if (v7)
      {
        if (CFGetTypeID(v7) == TypeID)
        {
          CFBooleanRef Value = (const __CFData *)CFDictionaryGetValue(properties, v7);
          if (Value)
          {
            uint64_t v4 = 0LL;
            *a2 = *(_DWORD *)CFDataGetBytePtr(Value);
          }
        }

        CFRelease(v7);
      }
    }

    if (properties) {
      CFRelease(properties);
    }
    IOObjectRelease(v6);
  }

  return v4;
}

uint64_t sub_10003A4E8(const char *a1, char *a2, CFIndex a3)
{
  uint64_t v6 = 3758097084LL;
  CFMutableDictionaryRef properties = 0LL;
  io_registry_entry_t v7 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/options");
  if (v7)
  {
    io_object_t v8 = v7;
    if (!IORegistryEntryCreateCFProperties(v7, &properties, 0LL, 0))
    {
      CFStringRef v9 = CFStringCreateWithCStringNoCopy(0LL, a1, 0x8000100u, kCFAllocatorNull);
      CFTypeID TypeID = CFStringGetTypeID();
      if (v9)
      {
        if (CFGetTypeID(v9) == TypeID)
        {
          CFBooleanRef Value = (const __CFString *)CFDictionaryGetValue(properties, v9);
          CFTypeID v12 = CFStringGetTypeID();
          if (Value)
          {
            if (CFGetTypeID(Value) == v12)
            {
              if (CFStringGetCString(Value, a2, a3, 0x8000100u)) {
                uint64_t v6 = 0LL;
              }
              else {
                uint64_t v6 = 3758097115LL;
              }
            }
          }
        }

        CFRelease(v9);
      }
    }

    if (properties) {
      CFRelease(properties);
    }
    IOObjectRelease(v8);
  }

  return v6;
}

uint64_t sub_10003A61C(const char *a1, char *const *a2, dispatch_queue_s *a3, uint64_t a4)
{
  pid_t v14 = -1;
  posix_spawn_file_actions_init(&v15);
  posix_spawn_file_actions_addopen(&v15, 0, "/dev/null", 0, 0x1B6u);
  posix_spawn_file_actions_addopen(&v15, 1, "/dev/null", 1, 0x1B6u);
  posix_spawn_file_actions_addopen(&v15, 2, "/dev/null", 1, 0x1B6u);
  io_object_t v8 = _NSGetEnviron();
  LODWORD(a2) = posix_spawn(&v14, a1, &v15, 0LL, a2, *v8);
  int v9 = *__error();
  posix_spawn_file_actions_destroy(&v15);
  if ((_DWORD)a2 == -1)
  {
    *__error() = v9;
    return 0xFFFFFFFFLL;
  }

  else
  {
    if (a4)
    {
      unint64_t v10 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_proc, v14, 0x80000000uLL, a3);
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 0x40000000LL;
      void v12[2] = sub_10003A774;
      v12[3] = &unk_10005A4B0;
      pid_t v13 = v14;
      void v12[4] = a4;
      void v12[5] = v10;
      dispatch_source_set_event_handler(v10, v12);
      dispatch_activate(v10);
    }

    return 0LL;
  }

void sub_10003A774(uint64_t a1)
{
}

void start()
{
  uint64_t v0 = sub_100038248();
  dispatch_sync_f(v0, 0LL, (dispatch_function_t)sub_10003A7E8);
  dispatch_main();
}

uint64_t sub_10003A7E8()
{
  kern_return_t v0;
  dispatch_queue_s *v1;
  _xpc_connection_s *mach_service;
  dispatch_queue_s *v3;
  dispatch_queue_t v4;
  dispatch_queue_t v5;
  IONotificationPort *v6;
  CFDictionaryRef v7;
  dispatch_queue_s *v8;
  dispatch_queue_s *v9;
  __CFNotificationCenter *DarwinNotifyCenter;
  mach_port_t v11;
  dispatch_queue_t v12;
  dispatch_queue_t v13;
  io_registry_entry_t v14;
  io_service_t v15;
  IONotificationPort *v16;
  IONotificationPort *v17;
  dispatch_queue_s *v18;
  IONotificationPort *v19;
  dispatch_queue_s *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int out_token;
  io_iterator_t notification;
  uint64_t state64[2];
  uint64_t v0 = bootstrap_check_in(bootstrap_port, "com.apple.PowerManagement.control", (mach_port_t *)&dword_1000676E0);
  unsigned int v1 = sub_100038248();
  mach_service = xpc_connection_create_mach_service("com.apple.iokit.powerdxpc", v1, 1uLL);
  __int128 v3 = sub_100038248();
  xpc_connection_set_target_queue(mach_service, v3);
  xpc_connection_set_event_handler(mach_service, &stru_10005A510);
  xpc_connection_resume(mach_service);
  if (v0) {
    syslog(3, "PM configd: bootstrap_register %s CFErrorRef error = %d\n", "com.apple.PowerManagement.control", v0);
  }
  if (dword_1000676E0)
  {
    uint64_t v4 = sub_100038248();
    qword_1000676E8 = dispatch_mach_create_f("PowerManagement", v4, 0LL, sub_10003B0CC);
    dispatch_mach_connect();
  }

  sub_100038068();
  sub_100012368();
  io_registry_entry_t v5 = sub_100038248();
  qword_100068830 = IOPMRegisterPrefsChangeNotification(v5, &stru_10005A538);
  io_object_t notification = 0;
  uint64_t v6 = IONotificationPortCreate(0);
  io_registry_entry_t v7 = IOServiceMatching("IODTNVRAM");
  if (!IOServiceAddMatchingNotification( v6,  "IOServiceFirstMatch",  v7,  (IOServiceMatchingCallback)sub_10003B6E4,  v6,  &notification)) {
    sub_10003B6E4(v6, notification);
  }
  io_object_t v8 = sub_100038248();
  notify_register_dispatch("com.apple.iokit.hid.displayStatus", &out_token, v8, &stru_10005A558);
  notify_get_state(out_token, state64);
  byte_1000676C8 = state64[0] == 0;
  int v9 = sub_100038248();
  IONotificationPortSetDispatchQueue(v6, v9);
  qword_1000676F0 = (uint64_t)CFStringCreateWithCString( kCFAllocatorDefault,  "NSSystemTimeZoneDidChangeDistributedNotification",  0);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  if (DarwinNotifyCenter) {
    CFNotificationCenterAddObserver( DarwinNotifyCenter,  0LL,  (CFNotificationCallback)sub_10003B87C,  (CFStringRef)qword_1000676F0,  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  sub_10003AD08();
  if (!mach_port_allocate(mach_task_self_, 1u, (mach_port_name_t *)state64))
  {
    int v11 = mach_host_self();
    if (!host_request_notification(v11, 0, state64[0]))
    {
      CFTypeID v12 = sub_100038248();
      qword_1000676F8 = dispatch_mach_create_f("PowerManagement/calendarResync", v12, 0LL, sub_10003B8A8);
      dispatch_mach_connect();
    }
  }

  LODWORD(state64[0]) = 0;
  sub_1000384DC(@"System Shutdown", kCFBooleanFalse);
  notify_register_mach_port("com.apple.system.power.CPU", (mach_port_t *)state64, 0, &dword_100067708);
  notify_register_mach_port( "com.apple.system.loginwindow.shutdownInitiated",  (mach_port_t *)state64,  1,  &dword_10006770C);
  notify_register_mach_port( "com.apple.system.loginwindow.restartinitiated",  (mach_port_t *)state64,  1,  &dword_100067710);
  notify_register_mach_port("com.apple.system.loginwindow.logoutcancelled", (mach_port_t *)state64, 1, &dword_100067714);
  notify_register_mach_port("com.apple.system.loginwindow.logoutNoReturn", (mach_port_t *)state64, 1, &dword_100067718);
  notify_register_mach_port( "com.apple.system.loginwindow.sulogoutinitiated",  (mach_port_t *)state64,  1,  &dword_10006771C);
  pid_t v13 = sub_100038248();
  qword_100067700 = dispatch_mach_create_f("PowerManagement/shutdown", v13, 0LL, sub_10003BA28);
  dispatch_mach_connect();
  LODWORD(state64[0]) = 0;
  pid_t v14 = IORegistryEntryFromPath(kIOMainPortDefault, "IOPower:/IOPowerConnection/IOPMrootDomain");
  if (v14)
  {
    posix_spawn_file_actions_t v15 = v14;
    __int128 v16 = IONotificationPortCreate(0);
    if (v16)
    {
      __int128 v17 = v16;
      if (!IOServiceAddInterestNotification( v16,  v15,  "IOGeneralInterest",  (IOServiceInterestCallback)sub_10003BB88,  0LL,  (io_object_t *)state64))
      {
        int v18 = sub_100038248();
        IONotificationPortSetDispatchQueue(v17, v18);
      }
    }

    IOObjectRelease(v15);
  }

  sub_10000B0E4();
  sub_10001BFC4();
  dword_1000676C4 = IORegisterForSystemPower( 0LL,  (IONotificationPortRef *)state64,  (IOServiceInterestCallback)sub_10003BD10,  &notification);
  if (dword_1000676C4)
  {
    __int128 v19 = (IONotificationPort *)state64[0];
    if (state64[0])
    {
      __int128 v20 = sub_100038248();
      IONotificationPortSetDispatchQueue(v19, v20);
    }
  }

  sub_10003B124();
  sub_1000155EC();
  sub_100032080();
  sub_1000135F4();
  sub_10002D79C();
  sub_100030770();
  sub_100036BBC();
  sub_1000090CC();
  sub_100035C3C();
  __int128 v21 = sub_10001E068();
  nullsub_4(v21, v22);
  int v23 = pthread_set_qos_class_self_np(QOS_CLASS_USER_INITIATED, 0);
  pthread_set_fixedpriority_self(v23);
  sub_100015BC8();
  if (-[USBDeviceMode start](+[USBDeviceMode sharedInstance](&OBJC_CLASS___USBDeviceMode, "sharedInstance"), "start")
    && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(state64[0]) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Initializing USBDeviceMode notifications",  (uint8_t *)state64,  2u);
  }

  return notify_post("com.apple.system.powermanagement.assertionresync");
}

void sub_10003AC94(int a1, int a2, int a3)
{
  if ((a1 & ~a2 & a3 & 1) != 0)
  {
    size_t v3 = 16LL;
    if (sysctlbyname("kern.sleeptime", &qword_1000676B0, &v3, 0LL, 0LL))
    {
      qword_1000676B0 = 0LL;
      dword_1000676B8 = 0;
    }

    byte_1000676C0 = 1;
    sub_10003AD08();
  }

void sub_10003AD08()
{
  CFTimeZoneRef v0 = CFTimeZoneCopySystem();
  if (v0)
  {
    unsigned int v1 = v0;
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    int valuePtr = (int)CFTimeZoneGetSecondsFromGMT(v1, Current);
    CFNumberRef v3 = CFNumberCreate(0LL, kCFNumberIntType, &valuePtr);
    if (v3)
    {
      uint64_t v4 = v3;
      sub_1000384DC(@"TimeZoneOffsetSeconds", v3);
      CFRelease(v1);
      unsigned int v1 = v4;
    }

    CFRelease(v1);
  }

uint64_t sub_10003AD88(intptr_t type, int a2)
{
  if (a2) {
    return IOAllowPowerChange(dword_1000676C4, type);
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Cancelling sleep due to async assertions\n",  v4,  2u);
  }

  sub_10001E468(1LL);
  return IOCancelPowerChange(dword_1000676C4, type);
}

uint64_t sub_10003AE20()
{
  return byte_1000676C8;
}

CFIndex sub_10003AE2C(int a1, CFArrayRef theArray)
{
  return CFArrayGetCount(theArray);
}

uint64_t sub_10003AE34(uint64_t a1, _OWORD *a2, int a3, uint64_t a4, _DWORD *a5)
{
  __int128 v9 = a2[1];
  *(_OWORD *)atoken.val = *a2;
  *(_OWORD *)&atoken.val[4] = v9;
  audit_token_to_au32(&atoken, 0LL, 0LL, 0LL, &ruidp, 0LL, &pidp, 0LL, 0LL);
  *a5 = 0;
  switch(a3)
  {
    case 9:
      __int128 v11 = a2[1];
      *(_OWORD *)atoken.val = *a2;
      *(_OWORD *)&atoken.val[4] = v11;
      if (sub_1000382AC(&atoken, @"com.apple.private.iokit.reservepower-control")) {
        *a5 = sub_10002ADB8(a4);
      }
      else {
        *a5 = -536870207;
      }
      break;
    case 8:
      sub_1000296E0(pidp, a4);
      break;
    case 7:
      nullsub_4(a4, v10);
      break;
  }

  return 0LL;
}

uint64_t sub_10003AF10(uint64_t a1, _OWORD *a2, uint64_t a3, _DWORD *a4)
{
  __int128 v5 = a2[1];
  *(_OWORD *)atoken.val = *a2;
  *(_OWORD *)&atoken.val[4] = v5;
  audit_token_to_au32(&atoken, 0LL, 0LL, 0LL, &ruidp, 0LL, 0LL, 0LL, 0LL);
  *a4 = 0;
  return 0LL;
}

uint64_t sub_10003AF6C(uint64_t a1, _OWORD *a2, const char *a3, unsigned int a4, int *a5)
{
  __int128 v8 = a2[1];
  *(_OWORD *)atoken.val = *a2;
  *(_OWORD *)&atoken.val[4] = v8;
  audit_token_to_au32(&atoken, 0LL, &euidp, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  if (euidp)
  {
    int v9 = -536870207;
LABEL_3:
    *a5 = v9;
    goto LABEL_10;
  }

  uint64_t v10 = (const __CFDictionary *)IOCFUnserialize(a3, 0LL, 0LL, 0LL);
  CFTypeID TypeID = CFDictionaryGetTypeID();
  if (!v10)
  {
    int v9 = -536870206;
    goto LABEL_3;
  }

  if (CFGetTypeID(v10) == TypeID) {
    int v12 = sub_100032438(v10);
  }
  else {
    int v12 = -536870206;
  }
  *a5 = v12;
  CFRelease(v10);
LABEL_10:
  vm_deallocate(mach_task_self_, (vm_address_t)a3, a4);
  return 0LL;
}

uint64_t sub_10003B070(uint64_t a1, void *a2, _DWORD *a3, void *a4, _DWORD *a5, int *a6)
{
  *a2 = 0LL;
  *a3 = 0;
  *a4 = 0LL;
  *a5 = 0;
  if ((byte_1000676C0 & 1) != 0)
  {
    int v6 = -536870184;
  }

  else
  {
    int v6 = 0;
    *a2 = qword_1000676D0;
    *a3 = 8;
    *a4 = qword_1000676D8;
    *a5 = 8;
  }

  *a6 = v6;
  return 0LL;
}

void sub_10003B0CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2 && (dispatch_mach_mig_demux(0LL, &off_10005A530, 1LL, a3) & 1) == 0)
  {
    mach_msg_header_t msg = (mach_msg_header_t *)dispatch_mach_msg_get_msg(a3, 0LL);
    mach_msg_destroy(msg);
  }

const void *sub_10003B124()
{
  uint64_t result = (const void *)sub_10000AD18();
  if ((_DWORD)result)
  {
    io_registry_entry_t v1 = result;
    uuid_generate(out);
    uuid_unparse_upper(out, cStr);
    if (qword_100067730)
    {
      CFRelease((CFTypeRef)qword_100067730);
      qword_100067730 = 0LL;
    }

    uint64_t result = CFStringCreateWithCString(0LL, cStr, 0x8000100u);
    qword_100067730 = (uint64_t)result;
    if (result) {
      return (const void *)IORegistryEntrySetCFProperty(v1, @"SleepWakeUUID", result);
    }
  }

  return result;
}

void sub_10003B1D4(id a1, OS_xpc_object *a2)
{
  if (xpc_get_type(a2) == (xpc_type_t)&_xpc_type_connection)
  {
    CFNumberRef v3 = sub_100038248();
    xpc_connection_set_target_queue(a2, v3);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_10003B264;
    handler[3] = &unk_100059610;
    void handler[4] = a2;
    xpc_connection_set_event_handler(a2, handler);
    xpc_connection_resume(a2);
  }

void sub_10003B264(uint64_t a1, xpc_object_t object)
{
  if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_dictionary)
  {
    xpc_object_t value = xpc_dictionary_get_value(object, "userActivityRegister");
    if (value)
    {
      sub_10003793C(*(void **)(a1 + 32), value);
    }

    else
    {
      xpc_object_t v15 = xpc_dictionary_get_value(object, "userActivityTimeout");
      if (v15)
      {
        sub_100037CAC(*(_xpc_connection_s **)(a1 + 32), v15);
      }

      else
      {
        xpc_object_t v16 = xpc_dictionary_get_value(object, "claimSystemWakeEvent");
        if (v16)
        {
          sub_100038AAC(*(_xpc_connection_s **)(a1 + 32), v16);
        }

        else if (xpc_dictionary_get_value(object, "assertionCreate"))
        {
          sub_100022220(*(_xpc_connection_s **)(a1 + 32), object);
        }

        else if (xpc_dictionary_get_value(object, "assertionRelease"))
        {
          sub_100022B24(*(_xpc_connection_s **)(a1 + 32), object);
        }

        else if (xpc_dictionary_get_value(object, "assertionProperties"))
        {
          sub_100022DEC(*(_xpc_connection_s **)(a1 + 32), object);
        }

        else if (xpc_dictionary_get_value(object, "assertionActivityLog"))
        {
          sub_1000234DC(*(_xpc_connection_s **)(a1 + 32), object);
        }

        else if (xpc_dictionary_get_value(object, "assertionInitialConnection"))
        {
          sub_100023938(*(_xpc_connection_s **)(a1 + 32));
        }

        else if (xpc_dictionary_get_value(object, "assertionFeatureSupported"))
        {
          sub_100023A34(*(_xpc_connection_s **)(a1 + 32), object);
        }

        else if (xpc_dictionary_get_value(object, "assertionCopyActivityUpdate"))
        {
          sub_100021A50(*(_xpc_connection_s **)(a1 + 32), object);
        }

        else if (xpc_dictionary_get_value(object, "adapterDetails"))
        {
          sub_100017710(*(void **)(a1 + 32), object);
        }

        else if (xpc_dictionary_get_value(object, "powerInfoPrecise"))
        {
          sub_100018E6C(*(void **)(a1 + 32), object);
        }

        else if (xpc_dictionary_get_value(object, "chargeSocLimit"))
        {
          sub_100008BE0(*(void **)(a1 + 32), object);
        }

        else if (xpc_dictionary_get_value(object, "setBatteryDofu"))
        {
          sub_100019390(*(void **)(a1 + 32), object);
        }

        else if (xpc_dictionary_get_value(object, "batteryGaugingMitigation"))
        {
          sub_1000357E8(*(void **)(a1 + 32), object);
        }

        else if (xpc_dictionary_get_value(object, "customBatteryProps"))
        {
          sub_100039054(*(_xpc_connection_s **)(a1 + 32), object);
        }

        else if (xpc_dictionary_get_value(object, "resetCustomBatteryProps"))
        {
          sub_100038EE0(*(_xpc_connection_s **)(a1 + 32), object);
        }

        else if (xpc_dictionary_get_value(object, "assertionSetState"))
        {
          sub_100023AC4(*(_xpc_connection_s **)(a1 + 32), object);
        }

        else if (xpc_dictionary_get_value(object, "wakeData"))
        {
          sub_10001E640(*(_xpc_connection_s **)(a1 + 32), object);
        }

        else if (xpc_dictionary_get_value(object, "batteryHeatMapData"))
        {
          sub_100007C4C(*(xpc_object_t *)(a1 + 32), object);
        }

        else if (xpc_dictionary_get_value(object, "batteryCycleCountData"))
        {
          sub_100007F44(*(xpc_object_t *)(a1 + 32), object);
        }

        else if (xpc_dictionary_get_value(object, "dominoState"))
        {
          sub_1000375F8(*(_xpc_connection_s **)(a1 + 32), object);
        }

        else if (xpc_dictionary_get_value(object, "onenessState"))
        {
          sub_1000377E0(*(_xpc_connection_s **)(a1 + 32), object);
        }

        else
        {
          BOOL v17 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
          if (v17) {
            sub_100044290(v17, v18, v19, v20, v21, v22, v23, v24);
          }
        }
      }
    }
  }

  else if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_error)
  {
    pid_t v13 = *(_xpc_connection_s **)(a1 + 32);
    string = xpc_dictionary_get_string(object, _xpc_error_key_description);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_1000442C4((uint64_t)string, v13);
    }
    sub_100037BFC(v13);
  }

  else
  {
    BOOL v4 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v4) {
      sub_100044370(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }

void sub_10003B6CC(id a1)
{
}

uint64_t sub_10003B6E4(IONotificationPort *a1, io_iterator_t iterator)
{
  io_iterator_t notification = 0;
  uint64_t result = IOIteratorNext(iterator);
  if ((_DWORD)result)
  {
    CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(result, @"aapl,panic-info", kCFAllocatorDefault, 0);
    if (CFProperty) {
      CFRelease(CFProperty);
    }
    IOObjectRelease(iterator);
    uint64_t v6 = IOServiceMatching("AppleSMC");
    uint64_t result = IOServiceAddMatchingNotification( a1,  "IOServiceFirstMatch",  v6,  (IOServiceMatchingCallback)sub_10003B7C4,  a1,  &notification);
    if (!(_DWORD)result) {
      return sub_10003B7C4(0, notification);
    }
  }

  return result;
}

void sub_10003B784(id a1, int a2)
{
  byte_1000676C8 = state64 == 0;
  sub_1000373F8(state64 == 0);
  sub_1000399BC();
}

uint64_t sub_10003B7C4(int a1, io_iterator_t iterator)
{
  uint64_t result = IOIteratorNext(iterator);
  if ((_DWORD)result)
  {
    CFTypeRef CFProperty = (const __CFString *)IORegistryEntryCreateCFProperty( result,  @"ShutdownCause",  kCFAllocatorDefault,  0);
    if (CFProperty)
    {
      uint64_t v5 = CFProperty;
      if (CFStringGetCString(CFProperty, v7, 8LL, 0))
      {
        int v6 = strtol(v7, 0LL, 10);
        sub_10003926C(v6);
      }

      CFRelease(v5);
    }

    return IOObjectRelease(iterator);
  }

  return result;
}

void sub_10003B87C(int a1, int a2, CFTypeRef cf1)
{
  if (CFEqual(cf1, (CFTypeRef)qword_1000676F0)) {
    sub_10003AD08();
  }
}

void sub_10003B8A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2)
  {
    uint64_t v17 = v6;
    uint64_t v18 = v5;
    uint64_t v19 = v3;
    uint64_t v20 = v4;
    mach_msg_header_t msg = (mach_msg_header_t *)dispatch_mach_msg_get_msg(a3, 0LL);
    if (msg->msgh_id == 950)
    {
      mach_port_t v8 = mach_host_self();
      host_request_notification(v8, 0, msg->msgh_local_port);
      size_t v14 = 16LL;
      double Current = CFAbsoluteTimeGetCurrent();
      if (byte_1000676C0 == 1)
      {
        double v10 = Current;
        if (!sysctlbyname("kern.sleeptime", &v15, &v14, 0LL, 0LL)
          && (qword_1000676B0 != *(void *)&v15 || dword_1000676B8 != v16))
        {
          uint64_t v11 = (void *)qword_1000676D8;
          if (qword_1000676D8)
          {
            int v12 = (double *)qword_1000676D0;
            if (!qword_1000676D0)
            {
LABEL_16:
              sub_100013F00();
              if (!IOPMGetLastWakeTime(&v15, &v14))
              {
                uint64_t v13 = sub_10000AF04(v15);
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
                  sub_1000443A4();
                }
                sub_10001DA5C(v13);
                sub_10001D8F0();
              }

              goto LABEL_6;
            }
          }

          else
          {
            if (vm_allocate(mach_task_self_, (vm_address_t *)&qword_1000676D0, 0x10uLL, 1)) {
              goto LABEL_16;
            }
            int v12 = (double *)qword_1000676D0;
            uint64_t v11 = (void *)(qword_1000676D0 + 8);
            qword_1000676D8 = qword_1000676D0 + 8;
          }

          double *v12 = v10;
          void *v11 = 0LL;
          byte_1000676C0 = 0;
          goto LABEL_16;
        }
      }

      sub_100013F00();
    }

void sub_10003BA28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 != 2) {
    return;
  }
  mach_msg_header_t msg = (mach_msg_header_t *)dispatch_mach_msg_get_msg(a3, 0LL);
  mach_msg_id_t msgh_id = msg->msgh_id;
  if (msgh_id == dword_100067708)
  {
    sub_100036F7C(0LL);
  }

  else
  {
    if (msgh_id == dword_10006771C)
    {
      int v5 = 5;
    }

    else if (msgh_id == dword_10006770C || msgh_id == dword_100067710)
    {
      byte_100067720 = 1;
      int v5 = 2;
    }

    else if (msgh_id == dword_100067714)
    {
      byte_100067720 = 0;
      int v5 = 1;
    }

    else
    {
      if (byte_100067720 != 1 || msgh_id != dword_100067718) {
        goto LABEL_11;
      }
      sub_1000384DC(@"System Shutdown", kCFBooleanTrue);
      int v5 = 4;
    }

    dword_100066E08 = v5;
  }

LABEL_11:
  if (dword_100067724 != dword_100066E08)
  {
    CFNumberRef v6 = CFNumberCreate(0LL, kCFNumberIntType, &dword_100066E08);
    if (v6)
    {
      CFNumberRef v7 = v6;
      sub_1000384DC(@"ConsoleShutdown", v6);
      CFRelease(v7);
    }

    dword_100067724 = dword_100066E08;
  }

  mach_msg_destroy(msg);
}

  *(NDR_record_t *)(a2 + 24) = v5;
  return result;
}

  *(NDR_record_t *)(a2 + 24) = v5;
  return result;
}

  *(NDR_record_t *)(a2 + 24) = v5;
  return result;
}

  *(NDR_record_t *)(a2 + 24) = v5;
  return result;
}

  *(NDR_record_t *)(a2 + 24) = v5;
  return result;
}

  *(NDR_record_t *)(a2 + 24) = v5;
  return result;
}

  *(NDR_record_t *)(a2 + 24) = v5;
  return result;
}

  *(NDR_record_t *)(a2 + 24) = v5;
  return result;
}

  *(NDR_record_t *)(a2 + 24) = v4;
  return result;
}

  *(NDR_record_t *)(a2 + 24) = v5;
  return result;
}

  *(NDR_record_t *)(a2 + 24) = v5;
  return result;
}

void sub_10003BB88(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  HIDWORD(v4) = a3;
  LODWORD(v4) = a3 + 536657648;
  switch((v4 >> 4))
  {
    case 0u:
      sub_1000321CC();
      if (a3 == -536657600) {
        goto LABEL_15;
      }
      return;
    case 2u:
      sub_100030774();
      if (a3 == -536657600) {
        goto LABEL_15;
      }
      if (a3 == -536657648) {
        goto LABEL_21;
      }
      return;
    case 3u:
      goto LABEL_15;
    case 4u:
      int valuePtr = 0;
      io_registry_entry_t v7 = sub_10000AD18();
      CFTypeRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(v7, @"DriverPMAssertions", 0LL, 0);
      if (CFProperty)
      {
        uint64_t v9 = CFProperty;
        CFNumberGetValue(CFProperty, kCFNumberIntType, &valuePtr);
        sub_100026E9C();
        io_registry_entry_t v10 = sub_10000AD18();
        uint64_t v11 = (const __CFArray *)IORegistryEntryCreateCFProperty(v10, @"DriverPMAssertionsDetailed", 0LL, 0);
        if (v11)
        {
          int v12 = v11;
          sub_10002CBA0(v9, v11);
          CFRelease(v12);
        }

        CFRelease(v9);
      }

      switch(a3)
      {
        case -536657648:
LABEL_21:
          sub_1000321CC();
          break;
        case -536657600:
LABEL_15:
          if (a4)
          {
            if (a4 != 1) {
              return;
            }
            qword_100067728 = IOPMSleepWakeCopyUUID();
          }

          else if (qword_100067728)
          {
            CFRelease((CFTypeRef)qword_100067728);
            qword_100067728 = 0LL;
          }

          sub_10003B124();
          break;
        case -536657616:
          sub_100030774();
          break;
      }

      return;
    default:
      return;
  }

void sub_10003BD10(uint64_t a1, uint64_t a2, int a3, intptr_t a4)
{
  CFNumberRef v6 = (const char *)IOPMSleepWakeCopyUUID();
  HIDWORD(v7) = a3;
  LODWORD(v7) = a3 + 536870288;
  switch((v7 >> 4))
  {
    case 0u:
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 138543362;
        io_registry_entry_t v10 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Received kIOMessageCanSystemSleep. UUID: %{public}@\n",  (uint8_t *)&v9,  0xCu);
      }

      sub_1000246B4(a4);
      break;
    case 1u:
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 138543362;
        io_registry_entry_t v10 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Received kIOMessageSystemWillSleep. UUID: %{public}@\n",  (uint8_t *)&v9,  0xCu);
      }

      IOAllowPowerChange(dword_1000676C4, a4);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v9) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Cancelling system assertion timer on sleep",  (uint8_t *)&v9,  2u);
      }

      sub_10002D3B4();
      break;
    case 2u:
    case 0xBu:
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        mach_port_t v8 = "kIOMessageSystemWillNotSleep";
        if (a3 == -536870112) {
          mach_port_t v8 = "kIOMessageSystemWillPowerOn";
        }
        int v9 = 136446466;
        io_registry_entry_t v10 = v8;
        __int16 v11 = 2114;
        int v12 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Received %{public}s. UUID: %{public}@\n",  (uint8_t *)&v9,  0x16u);
      }

      sub_10001E468(1LL);
      sub_100014C4C(8u);
      break;
    case 9u:
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 138543362;
        io_registry_entry_t v10 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Received kIOMessageSystemHasPoweredOn. UUID: %{public}@\n",  (uint8_t *)&v9,  0xCu);
      }

      break;
    default:
      break;
  }

  if (v6) {
    CFRelease(v6);
  }
}

uint64_t sub_10003BF90(mach_port_t a1, int a2, uint64_t a3, int a4)
{
  int v10 = 1;
  uint64_t v11 = a3;
  int v12 = 16777472;
  int v13 = a4;
  NDR_record_t v14 = NDR_record;
  int v15 = a2;
  int v16 = a4;
  mach_port_t reply_port = mig_get_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  msg.msgh_bits = -2147478253;
  *(void *)&msg.msgh_voucher_port = 0xEA6000000000LL;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set(&msg);
    mach_port_t reply_port = msg.msgh_local_port;
  }

  uint64_t v6 = mach_msg(&msg, 3, 0x3Cu, 0x2Cu, reply_port, 0, 0);
  uint64_t v7 = v6;
  if ((v6 - 268435458) <= 0xE && ((1 << (v6 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(msg.msgh_local_port);
    return v7;
  }

  if ((_DWORD)v6)
  {
    mig_dealloc_reply_port(msg.msgh_local_port);
    return v7;
  }

  if (msg.msgh_id == 71)
  {
    uint64_t v7 = 4294966988LL;
LABEL_17:
    mach_msg_destroy(&msg);
    return v7;
  }

  if (msg.msgh_id != 60100)
  {
    uint64_t v7 = 4294966995LL;
    goto LABEL_17;
  }

  uint64_t v7 = 4294966996LL;
  if ((msg.msgh_bits & 0x80000000) != 0) {
    goto LABEL_17;
  }
  if (msg.msgh_size != 36) {
    goto LABEL_17;
  }
  if (msg.msgh_remote_port) {
    goto LABEL_17;
  }
  uint64_t v7 = HIDWORD(v11);
  if (HIDWORD(v11)) {
    goto LABEL_17;
  }
  return v7;
}

uint64_t sub_10003C104(mach_port_t a1, int a2, void *a3, _DWORD *a4)
{
  *(NDR_record_t *)int v13 = NDR_record;
  *(_DWORD *)&v13[8] = a2;
  mach_port_t reply_port = mig_get_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  msg.msgh_bits = 5395;
  *(void *)&msg.msgh_voucher_port = 0xEA6100000000LL;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set(&msg);
    mach_port_t reply_port = msg.msgh_local_port;
  }

  uint64_t v8 = mach_msg(&msg, 3, 0x24u, 0x40u, reply_port, 0, 0);
  uint64_t v9 = v8;
  if ((v8 - 268435458) <= 0xE && ((1 << (v8 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(msg.msgh_local_port);
  }

  else
  {
    if (!(_DWORD)v8)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v9 = 4294966988LL;
      }

      else if (msg.msgh_id == 60101)
      {
        if ((msg.msgh_bits & 0x80000000) != 0)
        {
          uint64_t v9 = 4294966996LL;
          if (*(_DWORD *)v13 == 1 && msg.msgh_size == 56 && !msg.msgh_remote_port && v14 == 1)
          {
            int v10 = v15;
            if (v15 == v16)
            {
              uint64_t v9 = 0LL;
              *a3 = *(void *)&v13[4];
              *a4 = v10;
              return v9;
            }
          }
        }

        else if (msg.msgh_size == 36)
        {
          uint64_t v9 = 4294966996LL;
          if (*(_DWORD *)&v13[8])
          {
            if (msg.msgh_remote_port) {
              uint64_t v9 = 4294966996LL;
            }
            else {
              uint64_t v9 = *(unsigned int *)&v13[8];
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

      mach_msg_destroy(&msg);
      return v9;
    }

    mig_dealloc_reply_port(msg.msgh_local_port);
  }

  return v9;
}

uint64_t sub_10003C2C8(mach_port_t a1, int a2, void *a3, _DWORD *a4)
{
  *(NDR_record_t *)int v13 = NDR_record;
  *(_DWORD *)&v13[8] = a2;
  mach_port_t reply_port = mig_get_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  msg.msgh_bits = 5395;
  *(void *)&msg.msgh_voucher_port = 0xEA6200000000LL;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set(&msg);
    mach_port_t reply_port = msg.msgh_local_port;
  }

  uint64_t v8 = mach_msg(&msg, 3, 0x24u, 0x40u, reply_port, 0, 0);
  uint64_t v9 = v8;
  if ((v8 - 268435458) <= 0xE && ((1 << (v8 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(msg.msgh_local_port);
  }

  else
  {
    if (!(_DWORD)v8)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v9 = 4294966988LL;
      }

      else if (msg.msgh_id == 60102)
      {
        if ((msg.msgh_bits & 0x80000000) != 0)
        {
          uint64_t v9 = 4294966996LL;
          if (*(_DWORD *)v13 == 1 && msg.msgh_size == 56 && !msg.msgh_remote_port && v14 == 1)
          {
            int v10 = v15;
            if (v15 == v16)
            {
              uint64_t v9 = 0LL;
              *a3 = *(void *)&v13[4];
              *a4 = v10;
              return v9;
            }
          }
        }

        else if (msg.msgh_size == 36)
        {
          uint64_t v9 = 4294966996LL;
          if (*(_DWORD *)&v13[8])
          {
            if (msg.msgh_remote_port) {
              uint64_t v9 = 4294966996LL;
            }
            else {
              uint64_t v9 = *(unsigned int *)&v13[8];
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

      mach_msg_destroy(&msg);
      return v9;
    }

    mig_dealloc_reply_port(msg.msgh_local_port);
  }

  return v9;
}

uint64_t sub_10003C48C(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 20);
  else {
    return 0LL;
  }
}

uint64_t sub_10003C4CC(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 36)
  {
    int v3 = -304;
    goto LABEL_7;
  }

  if (*(_DWORD *)(result + 36) || *(_DWORD *)(result + 40) <= 0x1Fu)
  {
    int v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    NDR_record_t v4 = NDR_record;
    goto LABEL_8;
  }

  uint64_t v5 = *(unsigned int *)(result + 12);
  uint64_t v6 = *(unsigned int *)(result + 32);
  __int128 v7 = *(_OWORD *)(result + 72);
  v8[0] = *(_OWORD *)(result + 56);
  v8[1] = v7;
  uint64_t result = sub_10003AF10(v5, v8, v6, (_DWORD *)(a2 + 36));
  *(_DWORD *)(a2 + 32) = result;
  NDR_record_t v4 = NDR_record;
  if (!(_DWORD)result)
  {
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }

LABEL_8:
  *(NDR_record_t *)(a2 + 24) = v4;
  return result;
}

  *(NDR_record_t *)(a2 + 24) = v4;
  return result;
}

  *(NDR_record_t *)(a2 + 24) = v5;
  return result;
}

  *(NDR_record_t *)(a2 + 24) = v4;
  return result;
}

  *(NDR_record_t *)(a2 + 24) = v5;
  return result;
}

  *(NDR_record_t *)(a2 + 24) = v4;
  return result;
}

  *(NDR_record_t *)(a2 + 24) = v4;
  return result;
}

  *(NDR_record_t *)(a2 + 24) = v4;
  return result;
}

  *(NDR_record_t *)(a2 + 24) = v4;
  return result;
}

  *(NDR_record_t *)(a2 + 24) = v4;
  return result;
}

  *(NDR_record_t *)(a2 + 24) = v4;
  return result;
}

  *(NDR_record_t *)(a2 + 24) = v5;
  return result;
}

uint64_t sub_10003C584(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 40)
  {
    int v3 = -304;
    goto LABEL_7;
  }

  if (*(_DWORD *)(result + 40) || *(_DWORD *)(result + 44) <= 0x1Fu)
  {
    int v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    NDR_record_t v4 = NDR_record;
    goto LABEL_8;
  }

  uint64_t v5 = *(unsigned int *)(result + 12);
  int v6 = *(_DWORD *)(result + 32);
  uint64_t v7 = *(unsigned int *)(result + 36);
  __int128 v8 = *(_OWORD *)(result + 76);
  v9[0] = *(_OWORD *)(result + 60);
  v9[1] = v8;
  uint64_t result = sub_10003AE34(v5, v9, v6, v7, (_DWORD *)(a2 + 36));
  *(_DWORD *)(a2 + 32) = result;
  NDR_record_t v4 = NDR_record;
  if (!(_DWORD)result)
  {
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }

uint64_t sub_10003C63C(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 56)
  {
    int v4 = -304;
    goto LABEL_10;
  }

  if (*(_BYTE *)(result + 39) != 1 || (unsigned int v3 = *(_DWORD *)(result + 40), v3 != *(_DWORD *)(result + 52)))
  {
    int v4 = -300;
    goto LABEL_10;
  }

  if (*(_DWORD *)(result + 56) || *(_DWORD *)(result + 60) <= 0x1Fu)
  {
    int v4 = -309;
LABEL_10:
    *(_DWORD *)(a2 + 32) = v4;
    NDR_record_t v5 = NDR_record;
    goto LABEL_11;
  }

  uint64_t v6 = *(unsigned int *)(result + 12);
  uint64_t v7 = *(const char **)(result + 28);
  __int128 v8 = *(_OWORD *)(result + 92);
  v9[0] = *(_OWORD *)(result + 76);
  v9[1] = v8;
  uint64_t result = sub_10003AF6C(v6, v9, v7, v3, (int *)(a2 + 36));
  *(_DWORD *)(a2 + 32) = result;
  NDR_record_t v5 = NDR_record;
  if (!(_DWORD)result)
  {
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }

uint64_t sub_10003C724(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 60)
  {
    int v4 = -304;
    goto LABEL_10;
  }

  if (*(_BYTE *)(result + 39) != 1 || (unsigned int v3 = *(_DWORD *)(result + 40), v3 != *(_DWORD *)(result + 52)))
  {
    int v4 = -300;
    goto LABEL_10;
  }

  if (*(_DWORD *)(result + 60) || *(_DWORD *)(result + 64) <= 0x1Fu)
  {
    int v4 = -309;
LABEL_10:
    *(_DWORD *)(a2 + 32) = v4;
    NDR_record_t v5 = NDR_record;
    goto LABEL_11;
  }

  uint64_t v6 = *(unsigned int *)(result + 12);
  uint64_t v7 = *(const UInt8 **)(result + 28);
  int v8 = *(_DWORD *)(result + 56);
  __int128 v9 = *(_OWORD *)(result + 96);
  v10[0] = *(_OWORD *)(result + 80);
  v10[1] = v9;
  uint64_t result = sub_1000144C8(v6, v10, v7, v3, v8, (int *)(a2 + 36));
  *(_DWORD *)(a2 + 32) = result;
  NDR_record_t v5 = NDR_record;
  if (!(_DWORD)result)
  {
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }

uint64_t sub_10003C810(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 60)
  {
    int v4 = -304;
    goto LABEL_10;
  }

  if (*(_BYTE *)(result + 39) != 1 || (unsigned int v3 = *(_DWORD *)(result + 40), v3 != *(_DWORD *)(result + 52)))
  {
    int v4 = -300;
    goto LABEL_10;
  }

  if (*(_DWORD *)(result + 60) || *(_DWORD *)(result + 64) <= 0x1Fu)
  {
    int v4 = -309;
LABEL_10:
    *(_DWORD *)(a2 + 32) = v4;
    NDR_record_t v5 = NDR_record;
    goto LABEL_11;
  }

  uint64_t v6 = *(unsigned int *)(result + 12);
  uint64_t v7 = *(const UInt8 **)(result + 28);
  uint64_t v8 = *(unsigned int *)(result + 56);
  __int128 v9 = *(_OWORD *)(result + 96);
  v10[0] = *(_OWORD *)(result + 80);
  v10[1] = v9;
  uint64_t result = sub_100012BF8(v6, v10, v7, v3, v8, (_DWORD *)(a2 + 36));
  *(_DWORD *)(a2 + 32) = result;
  NDR_record_t v5 = NDR_record;
  if (!(_DWORD)result)
  {
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }

_DWORD *sub_10003C8FC(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    int v4 = -304;
    goto LABEL_7;
  }

  unsigned int v3 = result + 6;
  if (result[6] || result[7] <= 0x1Fu)
  {
    int v4 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v4;
    NDR_record_t v5 = NDR_record;
    goto LABEL_8;
  }

  uint64_t v6 = result[3];
  __int128 v7 = *(_OWORD *)(v3 + 9);
  v8[0] = *(_OWORD *)(v3 + 5);
  v8[1] = v7;
  uint64_t result = (_DWORD *)sub_100013114(v6, v8, (_DWORD *)(a2 + 36));
  *(_DWORD *)(a2 + 32) = (_DWORD)result;
  NDR_record_t v5 = NDR_record;
  if (!(_DWORD)result)
  {
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }

_DWORD *sub_10003C9AC(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    goto LABEL_6;
  }

  *(_DWORD *)(a2 + 36) = 16777472;
  *(_DWORD *)(a2 + 52) = 16777472;
  uint64_t result = (_DWORD *)sub_10003B070( result[3],  (void *)(a2 + 28),  (_DWORD *)(a2 + 68),  (void *)(a2 + 44),  (_DWORD *)(a2 + 72),  (int *)(a2 + 76));
  if ((_DWORD)result)
  {
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
LABEL_6:
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return result;
  }

  int v3 = *(_DWORD *)(a2 + 72);
  *(_DWORD *)(a2 + 4sub_1000262C4(0x12u, 0) = *(_DWORD *)(a2 + 68);
  *(_DWORD *)(a2 + 56) = v3;
  *(NDR_record_t *)(a2 + 6sub_1000262C4(0x12u, 0) = NDR_record;
  *(_DWORD *)a2 |= 0x80000000;
  *(_DWORD *)(a2 + 4) = 80;
  *(_DWORD *)(a2 + 24) = 2;
  return result;
}

uint64_t sub_10003CA60(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 56)
  {
    int v4 = -304;
    goto LABEL_10;
  }

  if (*(_BYTE *)(result + 39) != 1 || (unsigned int v3 = *(_DWORD *)(result + 40), v3 != *(_DWORD *)(result + 52)))
  {
    int v4 = -300;
    goto LABEL_10;
  }

  if (*(_DWORD *)(result + 56) || *(_DWORD *)(result + 60) <= 0x1Fu)
  {
    int v4 = -309;
LABEL_10:
    *(_DWORD *)(a2 + 32) = v4;
    NDR_record_t v5 = NDR_record;
    goto LABEL_11;
  }

  uint64_t v6 = *(unsigned int *)(result + 12);
  __int128 v7 = *(const UInt8 **)(result + 28);
  __int128 v8 = *(_OWORD *)(result + 92);
  v9[0] = *(_OWORD *)(result + 76);
  v9[1] = v8;
  uint64_t result = sub_100025444( v6,  v9,  v7,  v3,  (_DWORD *)(a2 + 36),  (_DWORD *)(a2 + 40),  (_DWORD *)(a2 + 44),  (int *)(a2 + 48));
  *(_DWORD *)(a2 + 32) = result;
  NDR_record_t v5 = NDR_record;
  if (!(_DWORD)result)
  {
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 4) = 52;
    return result;
  }

uint64_t sub_10003CB54(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 60)
  {
    int v4 = -304;
    goto LABEL_10;
  }

  if (*(_BYTE *)(result + 39) != 1 || (unsigned int v3 = *(_DWORD *)(result + 40), v3 != *(_DWORD *)(result + 56)))
  {
    int v4 = -300;
    goto LABEL_10;
  }

  if (*(_DWORD *)(result + 60) || *(_DWORD *)(result + 64) <= 0x1Fu)
  {
    int v4 = -309;
LABEL_10:
    *(_DWORD *)(a2 + 32) = v4;
    NDR_record_t v5 = NDR_record;
    goto LABEL_11;
  }

  int v6 = *(_DWORD *)(result + 12);
  int v7 = *(_DWORD *)(result + 52);
  __int128 v8 = *(const UInt8 **)(result + 28);
  __int128 v9 = *(_OWORD *)(result + 96);
  v10[0] = *(_OWORD *)(result + 80);
  v10[1] = v9;
  uint64_t result = sub_100025654( v6,  v10,  v7,  v8,  v3,  (_DWORD *)(a2 + 36),  (_DWORD *)(a2 + 40),  (_DWORD *)(a2 + 44),  (int *)(a2 + 48));
  *(_DWORD *)(a2 + 32) = result;
  NDR_record_t v5 = NDR_record;
  if (!(_DWORD)result)
  {
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 4) = 52;
    return result;
  }

uint64_t sub_10003CC50(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 40)
  {
    int v3 = -304;
    goto LABEL_7;
  }

  if (*(_DWORD *)(result + 40) || *(_DWORD *)(result + 44) <= 0x1Fu)
  {
    int v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    NDR_record_t v4 = NDR_record;
    goto LABEL_8;
  }

  uint64_t v5 = *(unsigned int *)(result + 12);
  int v6 = *(_DWORD *)(result + 32);
  int v7 = *(_DWORD *)(result + 36);
  __int128 v8 = *(_OWORD *)(result + 76);
  v9[0] = *(_OWORD *)(result + 60);
  v9[1] = v8;
  uint64_t result = sub_1000257B4( v5,  v9,  v6,  v7,  (int *)(a2 + 36),  (_DWORD *)(a2 + 40),  (_DWORD *)(a2 + 44),  (_DWORD *)(a2 + 48));
  *(_DWORD *)(a2 + 32) = result;
  NDR_record_t v4 = NDR_record;
  if (!(_DWORD)result)
  {
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 4) = 52;
    return result;
  }

uint64_t sub_10003CD14(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 64)
  {
    int v3 = -304;
    goto LABEL_10;
  }

  if (*(_BYTE *)(result + 39) != 1 || *(_DWORD *)(result + 40) != *(_DWORD *)(result + 60))
  {
    int v3 = -300;
    goto LABEL_10;
  }

  if (*(_DWORD *)(result + 64) || *(_DWORD *)(result + 68) <= 0x1Fu)
  {
    int v3 = -309;
LABEL_10:
    *(_DWORD *)(a2 + 32) = v3;
    goto LABEL_11;
  }

  *(_DWORD *)(a2 + 36) = 16777473;
  int v4 = *(_DWORD *)(result + 12);
  int v5 = *(_DWORD *)(result + 52);
  int v6 = *(_DWORD *)(result + 56);
  int v7 = *(const UInt8 **)(result + 28);
  vm_size_t v8 = *(unsigned int *)(result + 40);
  __int128 v9 = *(_OWORD *)(result + 100);
  v10[0] = *(_OWORD *)(result + 84);
  v10[1] = v9;
  uint64_t result = sub_1000258AC( v4,  v10,  v5,  v6,  v7,  v8,  (vm_address_t *)(a2 + 28),  (unsigned int *)(a2 + 52),  (int *)(a2 + 56));
  if (!(_DWORD)result)
  {
    *(_DWORD *)(a2 + 4sub_1000262C4(0x12u, 0) = *(_DWORD *)(a2 + 52);
    *(NDR_record_t *)(a2 + 44) = NDR_record;
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 4) = 60;
    *(_DWORD *)(a2 + 24) = 1;
    return result;
  }

  *(_DWORD *)(a2 + 32) = result;
LABEL_11:
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_10003CE38(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 64)
  {
    int v4 = -304;
    goto LABEL_10;
  }

  if (*(_BYTE *)(result + 39) != 1 || (unsigned int v3 = *(_DWORD *)(result + 40), v3 != *(_DWORD *)(result + 56)))
  {
    int v4 = -300;
    goto LABEL_10;
  }

  if (*(_DWORD *)(result + 64) || *(_DWORD *)(result + 68) <= 0x1Fu)
  {
    int v4 = -309;
LABEL_10:
    *(_DWORD *)(a2 + 32) = v4;
    NDR_record_t v5 = NDR_record;
    goto LABEL_11;
  }

  uint64_t v6 = *(unsigned int *)(result + 12);
  int v7 = (_DWORD *)(result + 52);
  vm_size_t v8 = *(const UInt8 **)(result + 28);
  __int128 v9 = (_DWORD *)(result + 60);
  __int128 v10 = *(_OWORD *)(result + 100);
  v11[0] = *(_OWORD *)(result + 84);
  v11[1] = v10;
  uint64_t result = sub_100028B5C(v6, v11, (_DWORD *)(result + 52), v8, v3, (_DWORD *)(result + 60), (int *)(a2 + 44));
  *(_DWORD *)(a2 + 32) = result;
  NDR_record_t v5 = NDR_record;
  if (!(_DWORD)result)
  {
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 36) = *v7;
    *(_DWORD *)(a2 + 4sub_1000262C4(0x12u, 0) = *v9;
    *(_DWORD *)(a2 + 4) = 48;
    return result;
  }

uint64_t sub_10003CF48(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 64)
  {
    int v4 = -304;
    goto LABEL_10;
  }

  if (*(_BYTE *)(result + 39) != 1 || (unsigned int v3 = *(_DWORD *)(result + 40), v3 != *(_DWORD *)(result + 56)))
  {
    int v4 = -300;
    goto LABEL_10;
  }

  if (*(_DWORD *)(result + 64) || *(_DWORD *)(result + 68) <= 0x1Fu)
  {
    int v4 = -309;
LABEL_10:
    *(_DWORD *)(a2 + 32) = v4;
    NDR_record_t v5 = NDR_record;
    goto LABEL_11;
  }

  uint64_t v6 = *(unsigned int *)(result + 12);
  uint64_t v7 = *(unsigned int *)(result + 52);
  vm_size_t v8 = *(const UInt8 **)(result + 28);
  __int128 v9 = (_DWORD *)(result + 60);
  __int128 v10 = *(_OWORD *)(result + 100);
  v11[0] = *(_OWORD *)(result + 84);
  v11[1] = v10;
  uint64_t result = sub_100028E60(v6, v11, v7, v8, v3, (int *)(result + 60), (_DWORD *)(a2 + 40), (_DWORD *)(a2 + 44));
  *(_DWORD *)(a2 + 32) = result;
  NDR_record_t v5 = NDR_record;
  if (!(_DWORD)result)
  {
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 36) = *v9;
    *(_DWORD *)(a2 + 4) = 48;
    return result;
  }

uint64_t sub_10003D048(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 60)
  {
    int v4 = -304;
    goto LABEL_10;
  }

  if (*(_BYTE *)(result + 39) != 1 || (unsigned int v3 = *(_DWORD *)(result + 40), v3 != *(_DWORD *)(result + 52)))
  {
    int v4 = -300;
    goto LABEL_10;
  }

  if (*(_DWORD *)(result + 60) || *(_DWORD *)(result + 64) <= 0x1Fu)
  {
    int v4 = -309;
LABEL_10:
    *(_DWORD *)(a2 + 32) = v4;
    NDR_record_t v5 = NDR_record;
    goto LABEL_11;
  }

  uint64_t v6 = *(unsigned int *)(result + 12);
  uint64_t v7 = *(const UInt8 **)(result + 28);
  vm_size_t v8 = (_DWORD *)(result + 56);
  __int128 v9 = *(_OWORD *)(result + 96);
  v10[0] = *(_OWORD *)(result + 80);
  v10[1] = v9;
  uint64_t result = sub_1000290F4(v6, v10, v7, v3, (int *)(result + 56), (_DWORD *)(a2 + 40), (_DWORD *)(a2 + 44));
  *(_DWORD *)(a2 + 32) = result;
  NDR_record_t v5 = NDR_record;
  if (!(_DWORD)result)
  {
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 36) = *v8;
    *(_DWORD *)(a2 + 4) = 48;
    return result;
  }

_DWORD *sub_10003D144(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 36)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
  }

  else
  {
    uint64_t result = (_DWORD *)sub_10001D294(result[3], result[8], (char *)(a2 + 44), &v5);
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
    NDR_record_t v3 = NDR_record;
    if (!(_DWORD)result)
    {
      *(NDR_record_t *)(a2 + 24) = NDR_record;
      uint64_t result = (_DWORD *)strlen((const char *)(a2 + 44));
      if (!(((unint64_t)result + 1) >> 32))
      {
        *(_DWORD *)(a2 + 36) = 0;
        *(_DWORD *)(a2 + 4sub_1000262C4(0x12u, 0) = (_DWORD)result + 1;
        uint64_t v4 = ((_DWORD)result + 4) & 0xFFFFFFFC;
        *(_DWORD *)(a2 + 4) = v4 + 48;
        *(_DWORD *)(a2 + v4 + 44) = v5;
        return result;
      }

      *(_DWORD *)(a2 + 32) = -304;
    }

    *(NDR_record_t *)(a2 + 24) = v3;
  }

  return result;
}

const char *sub_10003D218(const char *result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0) {
    goto LABEL_16;
  }
  NDR_record_t v3 = result;
  uint64_t v4 = *((unsigned int *)result + 1);
  unsigned int v5 = *((_DWORD *)result + 9);
  if (v5 > 0x400) {
    goto LABEL_16;
  }
  unsigned int v6 = (v5 + 3) & 0xFFFFFFFC;
  uint64_t v8 = 1064LL;
  uint64_t result = (const char *)memchr(result + 40, 0, v8 - 40);
  if (!result)
  {
LABEL_16:
    int v10 = -304;
    goto LABEL_17;
  }

  __int128 v9 = &v3[(v4 + 3) & 0x1FFFFFFFCLL];
  if (*(_DWORD *)v9 || *((_DWORD *)v9 + 1) <= 0x1Fu)
  {
    int v10 = -309;
LABEL_17:
    *(_DWORD *)(a2 + 32) = v10;
    NDR_record_t v11 = NDR_record;
    goto LABEL_18;
  }

  uint64_t v12 = *((unsigned int *)v3 + 3);
  int v13 = *(_DWORD *)&v3[v6 + 40];
  __int128 v14 = *(_OWORD *)(v9 + 36);
  v15[0] = *(_OWORD *)(v9 + 20);
  v15[1] = v14;
  uint64_t result = (const char *)sub_10001CBD0(v12, v15, v3 + 40, v13, (_DWORD *)(a2 + 36), (int *)(a2 + 40));
  *(_DWORD *)(a2 + 32) = (_DWORD)result;
  NDR_record_t v11 = NDR_record;
  if (!(_DWORD)result)
  {
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 4) = 44;
    return result;
  }

uint64_t sub_10003D34C(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 56)
  {
    int v3 = -304;
    goto LABEL_9;
  }

  if (*(unsigned __int16 *)(result + 38) << 16 != 1114112)
  {
    int v3 = -300;
    goto LABEL_9;
  }

  if (*(_DWORD *)(result + 56) || *(_DWORD *)(result + 60) <= 0x1Fu)
  {
    int v3 = -309;
LABEL_9:
    *(_DWORD *)(a2 + 32) = v3;
    NDR_record_t v4 = NDR_record;
    goto LABEL_10;
  }

  uint64_t v5 = *(unsigned int *)(result + 12);
  mach_port_name_t v6 = *(_DWORD *)(result + 28);
  int v7 = *(_DWORD *)(result + 48);
  int v8 = *(_DWORD *)(result + 52);
  __int128 v9 = *(_OWORD *)(result + 92);
  v10[0] = *(_OWORD *)(result + 76);
  v10[1] = v9;
  uint64_t result = sub_10001CCE8(v5, v10, v7, v6, v8, (_DWORD *)(a2 + 36));
  *(_DWORD *)(a2 + 32) = result;
  NDR_record_t v4 = NDR_record;
  if (!(_DWORD)result)
  {
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }

_DWORD *sub_10003D42C(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 36)
  {
    *(_DWORD *)(a2 + 32) = -304;
    NDR_record_t v3 = NDR_record;
  }

  else
  {
    uint64_t result = (_DWORD *)sub_10001D018(result[3], result[8], (int *)(a2 + 36));
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
    NDR_record_t v3 = NDR_record;
    if (!(_DWORD)result)
    {
      *(NDR_record_t *)(a2 + 24) = NDR_record;
      *(_DWORD *)(a2 + 4) = 40;
      return result;
    }
  }

  *(NDR_record_t *)(a2 + 24) = v3;
  return result;
}

uint64_t sub_10003D4AC(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 64)
  {
    int v3 = -304;
    goto LABEL_10;
  }

  if (*(_BYTE *)(result + 39) != 1 || *(_DWORD *)(result + 40) != *(_DWORD *)(result + 60))
  {
    int v3 = -300;
    goto LABEL_10;
  }

  if (*(_DWORD *)(result + 64) || *(_DWORD *)(result + 68) <= 0x1Fu)
  {
    int v3 = -309;
LABEL_10:
    *(_DWORD *)(a2 + 32) = v3;
    NDR_record_t v4 = NDR_record;
    goto LABEL_11;
  }

  uint64_t result = sub_10001D168();
  *(_DWORD *)(a2 + 32) = result;
  NDR_record_t v4 = NDR_record;
  if (!(_DWORD)result)
  {
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }

_DWORD *sub_10003D598(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    int v4 = -304;
    goto LABEL_7;
  }

  int v3 = result + 6;
  if (result[6] || result[7] <= 0x1Fu)
  {
    int v4 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v4;
    NDR_record_t v5 = NDR_record;
    goto LABEL_8;
  }

  uint64_t v6 = result[3];
  __int128 v7 = *(_OWORD *)(v3 + 9);
  v8[0] = *(_OWORD *)(v3 + 5);
  v8[1] = v7;
  uint64_t result = (_DWORD *)sub_100017B44(v6, v8, a2 + 36, (_DWORD *)(a2 + 40));
  *(_DWORD *)(a2 + 32) = (_DWORD)result;
  NDR_record_t v5 = NDR_record;
  if (!(_DWORD)result)
  {
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 4) = 44;
    return result;
  }

uint64_t sub_10003D64C(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 60)
  {
    int v4 = -304;
    goto LABEL_10;
  }

  if (*(_BYTE *)(result + 39) != 1 || (int v3 = *(_DWORD *)(result + 40), v3 != *(_DWORD *)(result + 56)))
  {
    int v4 = -300;
    goto LABEL_10;
  }

  if (*(_DWORD *)(result + 60) || *(_DWORD *)(result + 64) <= 0x1Fu)
  {
    int v4 = -309;
LABEL_10:
    *(_DWORD *)(a2 + 32) = v4;
    NDR_record_t v5 = NDR_record;
    goto LABEL_11;
  }

  uint64_t v6 = *(unsigned int *)(result + 12);
  int v7 = *(_DWORD *)(result + 52);
  uint64_t v8 = *(void *)(result + 28);
  __int128 v9 = *(_OWORD *)(result + 96);
  v10[0] = *(_OWORD *)(result + 80);
  v10[1] = v9;
  uint64_t result = sub_100018168(v6, v10, v7, v8, v3, a2 + 36);
  *(_DWORD *)(a2 + 32) = result;
  NDR_record_t v5 = NDR_record;
  if (!(_DWORD)result)
  {
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }

uint64_t sub_10003D738(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 36)
  {
    int v3 = -304;
  }

  else
  {
    if (!*(_DWORD *)(result + 36) && *(_DWORD *)(result + 40) > 0x1Fu)
    {
      uint64_t v4 = *(unsigned int *)(result + 12);
      int v5 = *(_DWORD *)(result + 32);
      __int128 v6 = *(_OWORD *)(result + 72);
      v7[0] = *(_OWORD *)(result + 56);
      v7[1] = v6;
      uint64_t result = sub_100018D1C(v4, v7, v5);
      *(_DWORD *)(a2 + 32) = result;
      goto LABEL_8;
    }

    int v3 = -309;
  }

  *(_DWORD *)(a2 + 32) = v3;
LABEL_8:
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_10003D7D0(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 36)
  {
    int v3 = -304;
    goto LABEL_7;
  }

  if (*(_DWORD *)(result + 36) || *(_DWORD *)(result + 40) <= 0x1Fu)
  {
    int v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    goto LABEL_8;
  }

  *(_DWORD *)(a2 + 36) = 16777473;
  uint64_t v4 = *(unsigned int *)(result + 12);
  int v5 = *(_DWORD *)(result + 32);
  __int128 v6 = *(_OWORD *)(result + 72);
  v7[0] = *(_OWORD *)(result + 56);
  v7[1] = v6;
  uint64_t result = sub_1000198C4(v4, v7, v5, a2 + 28, a2 + 52, a2 + 56);
  if (!(_DWORD)result)
  {
    *(_DWORD *)(a2 + 4sub_1000262C4(0x12u, 0) = *(_DWORD *)(a2 + 52);
    *(NDR_record_t *)(a2 + 44) = NDR_record;
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 4) = 60;
    *(_DWORD *)(a2 + 24) = 1;
    return result;
  }

  *(_DWORD *)(a2 + 32) = result;
LABEL_8:
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_10003D8B8(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 36)
  {
    int v3 = -304;
    goto LABEL_7;
  }

  if (*(_DWORD *)(result + 36) || *(_DWORD *)(result + 40) <= 0x1Fu)
  {
    int v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    NDR_record_t v4 = NDR_record;
    goto LABEL_8;
  }

  uint64_t v5 = *(unsigned int *)(result + 12);
  int v6 = *(_DWORD *)(result + 32);
  __int128 v7 = *(_OWORD *)(result + 72);
  v8[0] = *(_OWORD *)(result + 56);
  v8[1] = v7;
  uint64_t result = sub_10001B0BC(v5, v8, v6, (BOOL *)(a2 + 36));
  *(_DWORD *)(a2 + 32) = result;
  NDR_record_t v4 = NDR_record;
  if (!(_DWORD)result)
  {
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }

_DWORD *sub_10003D970(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    goto LABEL_6;
  }

  *(_DWORD *)(a2 + 36) = 16777473;
  uint64_t result = (_DWORD *)sub_10001B43C( result[3],  (vm_address_t *)(a2 + 28),  (unsigned int *)(a2 + 52),  (int *)(a2 + 56));
  if ((_DWORD)result)
  {
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
LABEL_6:
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return result;
  }

  *(_DWORD *)(a2 + 4sub_1000262C4(0x12u, 0) = *(_DWORD *)(a2 + 52);
  *(NDR_record_t *)(a2 + 44) = NDR_record;
  *(_DWORD *)a2 |= 0x80000000;
  *(_DWORD *)(a2 + 4) = 60;
  *(_DWORD *)(a2 + 24) = 1;
  return result;
}

uint64_t sub_10003DA18(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 40)
  {
    int v3 = -304;
    goto LABEL_7;
  }

  if (*(_DWORD *)(result + 40) || *(_DWORD *)(result + 44) <= 0x1Fu)
  {
    int v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    NDR_record_t v4 = NDR_record;
    goto LABEL_8;
  }

  uint64_t v5 = *(unsigned int *)(result + 12);
  int v6 = *(_DWORD *)(result + 32);
  int v7 = *(_DWORD *)(result + 36);
  __int128 v8 = *(_OWORD *)(result + 76);
  v9[0] = *(_OWORD *)(result + 60);
  v9[1] = v8;
  uint64_t result = sub_10001D188(v5, v9, v6, v7, (_DWORD *)(a2 + 36), (int *)(a2 + 40));
  *(_DWORD *)(a2 + 32) = result;
  NDR_record_t v4 = NDR_record;
  if (!(_DWORD)result)
  {
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 4) = 44;
    return result;
  }

uint64_t sub_10003DAD4(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 36)
  {
    int v3 = -304;
    goto LABEL_7;
  }

  if (*(_DWORD *)(result + 36) || *(_DWORD *)(result + 40) <= 0x1Fu)
  {
    int v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    NDR_record_t v4 = NDR_record;
    goto LABEL_8;
  }

  uint64_t v5 = *(unsigned int *)(result + 12);
  uint64_t v6 = *(unsigned int *)(result + 32);
  __int128 v7 = *(_OWORD *)(result + 72);
  v8[0] = *(_OWORD *)(result + 56);
  v8[1] = v7;
  uint64_t result = sub_10001D270(v5, (uint64_t)v8, v6, (_DWORD *)(a2 + 36), (_DWORD *)(a2 + 40));
  *(_DWORD *)(a2 + 32) = result;
  NDR_record_t v4 = NDR_record;
  if (!(_DWORD)result)
  {
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 4) = 44;
    return result;
  }

uint64_t sub_10003DB90(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 36)
  {
    int v3 = -304;
    goto LABEL_7;
  }

  if (*(_DWORD *)(result + 36) || *(_DWORD *)(result + 40) <= 0x1Fu)
  {
    int v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    NDR_record_t v4 = NDR_record;
    goto LABEL_8;
  }

  uint64_t v5 = *(unsigned int *)(result + 12);
  uint64_t v6 = *(unsigned int *)(result + 32);
  __int128 v7 = *(_OWORD *)(result + 72);
  v8[0] = *(_OWORD *)(result + 56);
  v8[1] = v7;
  uint64_t result = sub_10001D280(v5, (uint64_t)v8, v6, (_DWORD *)(a2 + 36));
  *(_DWORD *)(a2 + 32) = result;
  NDR_record_t v4 = NDR_record;
  if (!(_DWORD)result)
  {
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }

uint64_t sub_10003DC48(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 36)
  {
    int v3 = -304;
    goto LABEL_7;
  }

  if (*(_DWORD *)(result + 36) || *(_DWORD *)(result + 40) <= 0x1Fu)
  {
    int v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    NDR_record_t v4 = NDR_record;
    goto LABEL_8;
  }

  uint64_t v5 = *(unsigned int *)(result + 12);
  int v6 = *(_DWORD *)(result + 32);
  __int128 v7 = *(_OWORD *)(result + 72);
  v8[0] = *(_OWORD *)(result + 56);
  v8[1] = v7;
  uint64_t result = sub_100028AB4(v5, v8, v6, (_DWORD *)(a2 + 36), (int *)(a2 + 40));
  *(_DWORD *)(a2 + 32) = result;
  NDR_record_t v4 = NDR_record;
  if (!(_DWORD)result)
  {
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 4) = 44;
    return result;
  }

uint64_t sub_10003DD04(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 36)
  {
    int v3 = -304;
    goto LABEL_7;
  }

  if (*(_DWORD *)(result + 36) || *(_DWORD *)(result + 40) <= 0x1Fu)
  {
    int v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    NDR_record_t v4 = NDR_record;
    goto LABEL_8;
  }

  uint64_t v5 = *(unsigned int *)(result + 12);
  uint64_t v6 = *(unsigned int *)(result + 32);
  __int128 v7 = *(_OWORD *)(result + 72);
  v8[0] = *(_OWORD *)(result + 56);
  v8[1] = v7;
  uint64_t result = sub_10001D2FC(v5, (uint64_t)v8, v6, (_DWORD *)(a2 + 36));
  *(_DWORD *)(a2 + 32) = result;
  NDR_record_t v4 = NDR_record;
  if (!(_DWORD)result)
  {
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }

_DWORD *sub_10003DDBC(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    int v4 = -304;
    goto LABEL_7;
  }

  int v3 = result + 6;
  if (result[6] || result[7] <= 0x1Fu)
  {
    int v4 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v4;
    NDR_record_t v5 = NDR_record;
    goto LABEL_8;
  }

  uint64_t v6 = result[3];
  __int128 v7 = *(_OWORD *)(v3 + 9);
  v8[0] = *(_OWORD *)(v3 + 5);
  v8[1] = v7;
  uint64_t result = (_DWORD *)sub_10001D170(v6, (uint64_t)v8, (_DWORD *)(a2 + 36), (_DWORD *)(a2 + 40));
  *(_DWORD *)(a2 + 32) = (_DWORD)result;
  NDR_record_t v5 = NDR_record;
  if (!(_DWORD)result)
  {
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 4) = 44;
    return result;
  }

const char *sub_10003DE70(const char *result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0) {
    goto LABEL_16;
  }
  int v3 = result;
  uint64_t v4 = *((unsigned int *)result + 1);
  unsigned int v5 = *((_DWORD *)result + 9);
  if (v5 > 0x400) {
    goto LABEL_16;
  }
  unsigned int v6 = (v5 + 3) & 0xFFFFFFFC;
  uint64_t v8 = 1064LL;
  uint64_t result = (const char *)memchr(result + 40, 0, v8 - 40);
  if (!result)
  {
LABEL_16:
    int v10 = -304;
    goto LABEL_17;
  }

  __int128 v9 = &v3[(v4 + 3) & 0x1FFFFFFFCLL];
  if (*(_DWORD *)v9 || *((_DWORD *)v9 + 1) <= 0x1Fu)
  {
    int v10 = -309;
LABEL_17:
    *(_DWORD *)(a2 + 32) = v10;
    NDR_record_t v11 = NDR_record;
    goto LABEL_18;
  }

  uint64_t v12 = *((unsigned int *)v3 + 3);
  int v13 = *(_DWORD *)&v3[v6 + 40];
  __int128 v14 = *(_OWORD *)(v9 + 36);
  v15[0] = *(_OWORD *)(v9 + 20);
  v15[1] = v14;
  uint64_t result = (const char *)sub_100025DC0(v12, v15, v3 + 40, v13, (_DWORD *)(a2 + 36));
  *(_DWORD *)(a2 + 32) = (_DWORD)result;
  NDR_record_t v11 = NDR_record;
  if (!(_DWORD)result)
  {
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }

const char *sub_10003DFA0(const char *result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0) {
    goto LABEL_16;
  }
  int v3 = result;
  uint64_t v4 = *((unsigned int *)result + 1);
  unsigned int v5 = *((_DWORD *)result + 9);
  if (v5 > 0x400) {
    goto LABEL_16;
  }
  unsigned int v6 = (v5 + 3) & 0xFFFFFFFC;
  uint64_t v8 = 1064LL;
  uint64_t result = (const char *)memchr(result + 40, 0, v8 - 40);
  if (!result)
  {
LABEL_16:
    int v10 = -304;
    goto LABEL_17;
  }

  __int128 v9 = &v3[(v4 + 3) & 0x1FFFFFFFCLL];
  if (*(_DWORD *)v9 || *((_DWORD *)v9 + 1) <= 0x1Fu)
  {
    int v10 = -309;
LABEL_17:
    *(_DWORD *)(a2 + 32) = v10;
    NDR_record_t v11 = NDR_record;
    goto LABEL_18;
  }

  uint64_t v12 = *((unsigned int *)v3 + 3);
  int v13 = *(_DWORD *)&v3[v6 + 40];
  __int128 v14 = *(_OWORD *)(v9 + 36);
  v15[0] = *(_OWORD *)(v9 + 20);
  v15[1] = v14;
  uint64_t result = (const char *)sub_1000299D8(v12, v15, v3 + 40, v13, (int *)(a2 + 36));
  *(_DWORD *)(a2 + 32) = (_DWORD)result;
  NDR_record_t v11 = NDR_record;
  if (!(_DWORD)result)
  {
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }

uint64_t sub_10003E0D0(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 36)
  {
    int v3 = -304;
    goto LABEL_7;
  }

  if (*(_DWORD *)(result + 36) || *(_DWORD *)(result + 40) <= 0x1Fu)
  {
    int v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    goto LABEL_8;
  }

  *(_DWORD *)(a2 + 36) = 16777473;
  uint64_t v4 = *(unsigned int *)(result + 12);
  unsigned int v5 = (_DWORD *)(result + 32);
  __int128 v6 = *(_OWORD *)(result + 72);
  v7[0] = *(_OWORD *)(result + 56);
  v7[1] = v6;
  uint64_t result = sub_10002159C( v4,  v7,  (vm_address_t *)(a2 + 28),  (unsigned int *)(a2 + 52),  (unsigned int *)(result + 32),  (_DWORD *)(a2 + 60),  (int *)(a2 + 64));
  if (!(_DWORD)result)
  {
    *(_DWORD *)(a2 + 4sub_1000262C4(0x12u, 0) = *(_DWORD *)(a2 + 52);
    *(NDR_record_t *)(a2 + 44) = NDR_record;
    *(_DWORD *)(a2 + 56) = *v5;
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 4) = 68;
    *(_DWORD *)(a2 + 24) = 1;
    return result;
  }

  *(_DWORD *)(a2 + 32) = result;
LABEL_8:
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

_DWORD *sub_10003E1C8(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    int v4 = -304;
    goto LABEL_7;
  }

  int v3 = result + 6;
  if (result[6] || result[7] <= 0x1Fu)
  {
    int v4 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v4;
    goto LABEL_8;
  }

  *(_DWORD *)(a2 + 36) = 16777473;
  uint64_t v5 = result[3];
  __int128 v6 = *(_OWORD *)(v3 + 9);
  v7[0] = *(_OWORD *)(v3 + 5);
  v7[1] = v6;
  uint64_t result = (_DWORD *)sub_10002210C(v5, v7, (vm_address_t *)(a2 + 28), (unsigned int *)(a2 + 52), (_DWORD *)(a2 + 56));
  if (!(_DWORD)result)
  {
    *(_DWORD *)(a2 + 4sub_1000262C4(0x12u, 0) = *(_DWORD *)(a2 + 52);
    *(NDR_record_t *)(a2 + 44) = NDR_record;
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 4) = 60;
    *(_DWORD *)(a2 + 24) = 1;
    return result;
  }

  *(_DWORD *)(a2 + 32) = (_DWORD)result;
LABEL_8:
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_10003E2A8(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 56)
  {
    int v4 = -304;
    goto LABEL_10;
  }

  if (*(_BYTE *)(result + 39) != 1 || (unsigned int v3 = *(_DWORD *)(result + 40), v3 != *(_DWORD *)(result + 52)))
  {
    int v4 = -300;
    goto LABEL_10;
  }

  if (*(_DWORD *)(result + 56) || *(_DWORD *)(result + 60) <= 0x1Fu)
  {
    int v4 = -309;
LABEL_10:
    *(_DWORD *)(a2 + 32) = v4;
    NDR_record_t v5 = NDR_record;
    goto LABEL_11;
  }

  uint64_t v6 = *(unsigned int *)(result + 12);
  __int128 v7 = *(const UInt8 **)(result + 28);
  __int128 v8 = *(_OWORD *)(result + 92);
  v9[0] = *(_OWORD *)(result + 76);
  v9[1] = v8;
  uint64_t result = sub_100029AA4(v6, v9, v7, v3, (int *)(a2 + 36));
  *(_DWORD *)(a2 + 32) = result;
  NDR_record_t v5 = NDR_record;
  if (!(_DWORD)result)
  {
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }

uint64_t sub_10003E390(_DWORD *a1, uint64_t a2)
{
  int v2 = a1[2];
  *(_DWORD *)a2 = *a1 & 0x1F;
  *(_DWORD *)(a2 + 4) = 36;
  int v3 = a1[5] + 100;
  *(_DWORD *)(a2 + _Block_object_dispose(va, 8) = v2;
  *(_DWORD *)(a2 + 12) = 0;
  *(_DWORD *)(a2 + 16) = 0;
  *(_DWORD *)(a2 + 2sub_1000262C4(0x12u, 0) = v3;
  int v4 = a1[5];
  if ((v4 - 73036) >= 0xFFFFFFDC
    && (NDR_record_t v5 = (void (*)(void))*(&off_10005A578 + 5 * (v4 - 73000) + 5)) != 0LL)
  {
    v5();
    return 1LL;
  }

  else
  {
    uint64_t result = 0LL;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 32) = -303;
  }

  return result;
}

void sub_10003E424()
{
}

void sub_10003E450()
{
}

void sub_10003E47C(void *a1)
{
  uint64_t v1 = a1;
  int v2 = 136315138;
  id v3 = [@"com.apple.powerd.batterytrusteddata.dailytaskQueue" UTF8String];
  _os_log_error_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_ERROR,  "Failed to create queue %s",  (uint8_t *)&v2,  0xCu);
}

void sub_10003E514()
{
}

void sub_10003E540()
{
}

void sub_10003E56C()
{
}

void sub_10003E598()
{
}

void sub_10003E5C4()
{
}

void sub_10003E5F0()
{
}

uint64_t sub_10003E61C()
{
  CFTimeZoneRef v0 = dlerror();
  uint64_t v1 = abort_report_np("%s", v0);
  return sub_10003E63C(v1);
}

void sub_10003E63C()
{
}

void sub_10003E668()
{
}

void sub_10003E694()
{
}

void sub_10003E6C0()
{
}

void sub_10003E6EC()
{
  sub_1000055AC( (void *)&_mh_execute_header,  v0,  v1,  "doNotRunAnymore is true, return and dont set any more timers",  v2,  v3,  v4,  v5,  v6);
  sub_1000055BC();
}

void sub_10003E718( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003E77C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003E7E4(int a1, os_log_s *a2)
{
  int v2 = 136315394;
  uint64_t v3 = "AppleBatteryAuth";
  __int16 v4 = 1024;
  int v5 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Failed to register for kIOGeneralInterest notifications from %s. rc:0x%x",  (uint8_t *)&v2,  0x12u);
}

void sub_10003E86C( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003E8D0()
{
}

void sub_10003E8FC()
{
}

void sub_10003E928()
{
}

void sub_10003E954()
{
}

void sub_10003E980()
{
}

void sub_10003E9AC( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003EA10()
{
}

void sub_10003EA80()
{
}

void sub_10003EAAC()
{
}

void sub_10003EAD8()
{
}

void sub_10003EB04()
{
}

void sub_10003EB30( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003EBA0( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003EC04()
{
}

void sub_10003EC30( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003EC94(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "Saved battery data to path %@\n",  (uint8_t *)&v2,  0xCu);
  sub_100008404();
}

void sub_10003ED04()
{
}

void sub_10003ED30( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003ED98()
{
}

void sub_10003EDC4()
{
}

void sub_10003EDF0()
{
}

void sub_10003EE1C(int *a1, os_log_s *a2)
{
  int v2 = *a1;
  int v3 = 136315650;
  uint64_t v4 = "updateKioskModeData";
  __int16 v5 = 1024;
  int v6 = dword_100066808;
  __int16 v7 = 1024;
  int v8 = v2;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "%s: prevMode:%u currMode:%u\n",  (uint8_t *)&v3,  0x18u);
  sub_100008404();
}

void sub_10003EEB4(int a1, int a2, os_log_t log)
{
  v3[0] = 67109376;
  v3[1] = a1;
  __int16 v4 = 1024;
  int v5 = a2;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "New cycle count: %d. Previous cycle count at which data is saved: %d\n",  (uint8_t *)v3,  0xEu);
  sub_100008404();
}

void sub_10003EF34()
{
}

void sub_10003EF60()
{
}

void sub_10003EF8C()
{
}

void sub_10003EFB8()
{
}

void sub_10003EFE4()
{
}

void sub_10003F010()
{
}

void sub_10003F070()
{
}

void sub_10003F09C( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003F100()
{
}

void sub_10003F12C()
{
}

void sub_10003F158()
{
}

void sub_10003F184()
{
}

void sub_10003F1B0()
{
}

void sub_10003F1DC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003F248( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003F2AC()
{
}

void sub_10003F30C()
{
}

void sub_10003F338()
{
}

void sub_10003F364()
{
}

void sub_10003F390()
{
}

void sub_10003F3BC()
{
}

void sub_10003F3E8( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003F44C()
{
}

void sub_10003F4AC()
{
  sub_1000055D0( (void *)&_mh_execute_header,  v0,  v1,  "Failed to create token for gauging mitigation state change notification. status = %d\n",  v2,  v3,  v4,  v5,  v6);
  sub_1000055BC();
}

void sub_10003F50C()
{
}

void sub_10003F56C()
{
}

void sub_10003F5D4(int a1)
{
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Unable to get times: %i",  (uint8_t *)v1,  8u);
}

void sub_10003F650()
{
}

void sub_10003F678()
{
}

void sub_10003F6A0(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  *(_WORD *)uint64_t v3 = 0;
  sub_10000B53C((void *)&_mh_execute_header, a1, a3, "Failed to register", v3);
}

void sub_10003F6D8(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  *(_WORD *)uint64_t v3 = 0;
  sub_10000B53C((void *)&_mh_execute_header, a1, a3, "Failed to get matching dict handles\n", v3);
}

void sub_10003F710(uint8_t *a1, _BYTE *a2, os_log_s *a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_10000B53C((void *)&_mh_execute_header, a3, (uint64_t)a3, "Invalid type\n", a1);
}

void sub_10003F744( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003F7B4()
{
  sub_100008430((void *)&_mh_execute_header, v0, v1, "Defaults returned %@ instead of NSDate", v2, v3, v4, v5, v6);
  sub_100008404();
}

void sub_10003F814()
{
}

void sub_10003F874()
{
}

void sub_10003F8D4()
{
}

void sub_10003F900()
{
  sub_1000055D0( (void *)&_mh_execute_header,  v0,  v1,  "Failed to register for BDC get current time notification. status = %d\n",  v2,  v3,  v4,  v5,  v6);
  sub_1000055BC();
}

void sub_10003F960()
{
}

void sub_10003F9C0()
{
  sub_1000055AC( (void *)&_mh_execute_header,  v0,  v1,  "Defaults returned unexpected type for battery serial num",  v2,  v3,  v4,  v5,  v6);
  sub_1000055BC();
}

void sub_10003F9EC()
{
}

void sub_10003FA18()
{
}

void sub_10003FA44()
{
}

void sub_10003FAA4(uint64_t *a1, os_log_s *a2, uint64_t a3)
{
  uint64_t v3 = *a1;
  int v4 = 138412546;
  uint64_t v5 = @"/var/MobileSoftwareUpdate/Hardware/Battery/BDC";
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  sub_100012308((void *)&_mh_execute_header, a2, a3, "Failed to delete items at %@ error %@", (uint8_t *)&v4);
  sub_100008404();
}

void sub_10003FB24()
{
}

void sub_10003FB50()
{
}

void sub_10003FB7C()
{
}

void sub_10003FBA8()
{
}

void sub_10003FC08()
{
}

void sub_10003FC68()
{
}

void sub_10003FCC8()
{
}

void sub_10003FD28(void *a1, uint64_t a2, os_log_s *a3)
{
  int v6 = 138412546;
  id v7 = [a1 path];
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  sub_100012308((void *)&_mh_execute_header, a3, v5, "Failed to read %@ with error %@", (uint8_t *)&v6);
  sub_100012338();
}

void sub_10003FDB0()
{
}

void sub_10003FE10()
{
}

void sub_10003FE70()
{
}

void sub_10003FED0()
{
}

void sub_10003FEFC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003FF64()
{
}

void sub_10003FF90()
{
}

void sub_10003FFBC(uint64_t a1, id *a2, os_log_s *a3)
{
  uint64_t v4 = *(void *)(a1 + 24);
  unsigned int v5 = [*a2 intValue];
  int v7 = 138412546;
  uint64_t v8 = v4;
  __int16 v9 = 1024;
  unsigned int v10 = v5;
  sub_10001235C((void *)&_mh_execute_header, a3, v6, "%@ Collection period invalid : %d", (uint8_t *)&v7);
  sub_100012338();
}

void sub_10004004C()
{
  sub_1000055AC((void *)&_mh_execute_header, v0, v1, "nil returned by collection block", v2, v3, v4, v5, v6);
  sub_1000055BC();
}

void sub_100040078()
{
}

void sub_1000400D8()
{
  __int16 v3 = 2080;
  uint64_t v4 = "com.apple.system.powersources.source";
  sub_10001235C((void *)&_mh_execute_header, v0, v1, "Error %d registering for %s notification", v2);
  sub_100008404();
}

void sub_100040150()
{
  sub_1000055D0( (void *)&_mh_execute_header,  v0,  v1,  "Failed to register for SmartCharging notification. status = %d\n",  v2,  v3,  v4,  v5,  v6);
  sub_1000055BC();
}

void sub_1000401B0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100040220()
{
}

void sub_10004024C()
{
}

void sub_1000402AC()
{
}

void sub_1000402D8()
{
}

void sub_100040304()
{
}

void sub_100040330()
{
}

void sub_10004035C()
{
}

void sub_100040388()
{
  WORD2(v3) = 2048;
  HIWORD(v3) = v0;
  sub_10000840C((void *)&_mh_execute_header, v0, v1, "Value of type %lu. Expected type %lu ", v2, v3);
  sub_100008404();
}

void sub_1000403F4()
{
}

void sub_100040420()
{
}

void sub_10004044C()
{
}

void sub_100040478()
{
}

void sub_1000404A4()
{
}

void sub_100040504( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100040574()
{
  sub_1000055AC((void *)&_mh_execute_header, v0, v1, "Failed to allocate return dictionary", v2, v3, v4, v5, v6);
  sub_1000055BC();
}

void sub_1000405A0(void *a1, os_log_s *a2)
{
}

void sub_100040614()
{
}

void sub_100040640()
{
}

void sub_10004066C()
{
}

void sub_100040698()
{
}

void sub_1000406C4()
{
}

void sub_100040728()
{
}

void sub_100040754()
{
}

void sub_100040780()
{
  sub_1000055AC((void *)&_mh_execute_header, v0, v1, "NULL return dictionationary", v2, v3, v4, v5, v6);
  sub_1000055BC();
}

void sub_1000407AC(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Unable to get year and week from IOPSGetYearAndWeekOfManufactureFromBatterySerial",  buf,  2u);
}

void sub_1000407E8()
{
}

void sub_100040814( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000055D0( (void *)&_mh_execute_header,  a2,  a3,  "Failed to create token for BDC current time notification. status = %d\n",  a5,  a6,  a7,  a8,  0);
  sub_1000055BC();
}

void sub_10004087C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000408AC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000408DC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10004090C(int a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Failed to send request to service: 0x%x",  (uint8_t *)v2,  8u);
  sub_1000055BC();
}

void sub_10004097C()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, 0LL, OS_LOG_TYPE_ERROR, "Failed to find device class", v0, 2u);
}

void sub_1000409BC( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100040A24(uint64_t *a1, os_log_s *a2)
{
  uint64_t v2 = *a1;
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "AutoWakeScheduler: Not arming timer for a past or distant future event %{public}@\n",  (uint8_t *)&v3,  0xCu);
  sub_100008404();
}

void sub_100040A98( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100040ACC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100040B00( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100040B64( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100040BC8( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100040C44()
{
}

void sub_100040C70()
{
  sub_1000055AC((void *)&_mh_execute_header, v0, v1, "CFDictCreate returned nil", v2, v3, v4, v5, v6);
  sub_1000055BC();
}

void sub_100040C9C( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100040D00()
{
}

void sub_100040D2C()
{
}

void sub_100040D58()
{
}

void sub_100040D84()
{
}

void sub_100040DB0()
{
}

void sub_100040DDC( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100040E40()
{
}

void sub_100040E6C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100040EDC()
{
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "failed to post '%s'. rc:%#x\n", v2, 0x12u);
  sub_100008404();
}

void sub_100040F58(int *a1, int *a2, os_log_t log)
{
  int v3 = *a1;
  int v4 = *a2;
  v5[0] = 67109376;
  v5[1] = v3;
  __int16 v6 = 1024;
  int v7 = v4;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Failed to find the power source for psid 0x%x from pid %d\n",  (uint8_t *)v5,  0xEu);
  sub_100008404();
}

void sub_100040FE0()
{
}

void sub_10004100C()
{
}

void sub_100041038()
{
}

void sub_100041064()
{
}

void sub_100041090()
{
}

void sub_1000410BC()
{
}

void sub_10004111C()
{
}

void sub_10004117C( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000411E0()
{
}

void sub_100041240( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000412B0(os_log_t log)
{
  v1[0] = 67109120;
  v1[1] = byte_100066944;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "Setting NCCP cycle count based filtering to %d\n",  (uint8_t *)v1,  8u);
  sub_1000055BC();
}

void sub_10004132C()
{
}

void sub_100041358()
{
}

void sub_100041384()
{
}

void sub_1000413B0()
{
}

void sub_1000413DC()
{
}

void sub_10004143C()
{
}

void sub_100041468()
{
}

void sub_1000414C8()
{
}

void sub_1000414F4()
{
}

void sub_100041520()
{
}

void sub_10004154C()
{
}

void sub_100041578()
{
}

void sub_1000415A4()
{
}

void sub_1000415D0(int a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Unhandled inMessageType (%x)\n",  (uint8_t *)v2,  8u);
  sub_1000055BC();
}

void sub_100041640(os_log_t log, double a2, double a3)
{
  int v3 = 134218240;
  double v4 = a2;
  __int16 v5 = 2048;
  double v6 = a3;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "Not the current wake %f > now %f",  (uint8_t *)&v3,  0x16u);
  sub_100008404();
}

void sub_1000416C0()
{
}

void sub_100041724()
{
}

void sub_100041788()
{
}

void sub_1000417B4(uint64_t *a1, os_log_s *a2)
{
  uint64_t v2 = *a1;
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "WakeTime: useractive %llu\n",  (uint8_t *)&v3,  0xCu);
  sub_100008404();
}

void sub_100041828()
{
}

void sub_100041854()
{
}

void sub_100041880()
{
}

void sub_1000418AC()
{
}

void sub_1000418D8()
{
}

void sub_100041904()
{
}

void sub_100041930()
{
}

void sub_10004195C(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Invalid parameters. remote: %@ msg: %@",  (uint8_t *)&v3,  0x16u);
  sub_100008404();
}

void sub_1000419DC(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "logAsyncAssertionActivity: No kIOPMAssertionActivityAction key present when trying to log.",  buf,  2u);
}

void sub_100041A18()
{
}

void sub_100041A44()
{
}

void sub_100041A70()
{
}

void sub_100041A9C()
{
}

void sub_100041AC8()
{
}

void sub_100041B2C()
{
}

void sub_100041B58()
{
}

void sub_100041B84()
{
}

void sub_100041BB0()
{
}

void sub_100041BDC()
{
}

void sub_100041C3C()
{
  LOWORD(sub_10001FF20( (void *)&_mh_execute_header,  v0,  v1,  "Failed to create dispatch src to cleanup connection %d from pid %d\n",  v2, v3) = 1024;
  HIWORD(sub_10001FF20( (void *)&_mh_execute_header,  v0,  v1,  "Failed to create dispatch src to cleanup connection %d from pid %d\n",  v2, v3) = v0;
  sub_10001FF20( (void *)&_mh_execute_header,  v1,  v2,  "Process %d is not entitled to create assertion(remoteId:0x%x)\n",  67109376,  v3);
  sub_100008404();
}

void sub_100041CAC()
{
  int v3 = @"AppliesOnLidClose";
  sub_10001235C((void *)&_mh_execute_header, v0, v1, "Pid %d is not privileged to set property %@\n", v2);
  sub_100008404();
}

void sub_100041D1C()
{
  int v3 = @"AppliesToLimitedPower";
  sub_10001235C((void *)&_mh_execute_header, v0, v1, "Pid %d is not privileged to set property %@\n", v2);
  sub_100008404();
}

void sub_100041D8C()
{
  uint64_t v3 = v0;
  sub_10001235C( (void *)&_mh_execute_header,  v1,  (uint64_t)v1,  "Pid %d is not privileged to create assertion type %@\n",  v2);
  sub_100008404();
}

void sub_100041DF8()
{
}

void sub_100041E58()
{
}

void sub_100041EB8()
{
}

void sub_100041F18()
{
}

void sub_100041F78()
{
}

void sub_100041FD8()
{
}

void sub_100042004()
{
}

void sub_100042064()
{
}

void sub_1000420C4(const __CFArray *a1, uint64_t a2, os_log_s *a3)
{
  __int16 v7 = 2112;
  uint64_t v8 = a1;
  __int16 v9 = 1024;
  int v10 = v5;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_DEBUG,  "Only logging data : Received logging data of length %ld %@ for pid %d",  v6,  0x1Cu);
  sub_10002F2FC();
}

void sub_100042168()
{
}

void sub_1000421C8()
{
}

void sub_100042228(uint64_t a1, int a2, os_log_s *a3)
{
  v3[0] = 67109378;
  v3[1] = a2;
  __int16 v4 = 2080;
  uint64_t v5 = a1;
  sub_10001235C( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "Failed to create cfstring for pid %d name: %s\n",  (uint8_t *)v3);
  sub_100008404();
}

void sub_1000422A0()
{
}

void sub_100042300()
{
}

void sub_100042360()
{
}

void sub_1000423C0(_xpc_connection_s *a1)
{
  int v2 = 134218240;
  uint64_t v3 = a1;
  __int16 v4 = 1024;
  pid_t pid = xpc_connection_get_pid(a1);
  sub_10001235C( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v1,  "Assertion Suspend/Resume request from peer %p(pid %d) does not have appropriate entitlement\n",  (uint8_t *)&v2);
}

void sub_100042450()
{
}

void sub_1000424B0()
{
}

void sub_100042510()
{
}

void sub_100042570()
{
}

void sub_1000425D0()
{
}

void sub_100042638()
{
}

void sub_10004269C()
{
}

void sub_1000426FC()
{
}

void sub_10004275C()
{
}

void sub_100042788()
{
  __int16 v3 = 2048;
  uint64_t v4 = v0;
  sub_10001235C((void *)&_mh_execute_header, v1, (uint64_t)v1, "Process for pid %d not found. token: %ld\n", v2);
  sub_100008404();
}

void sub_1000427FC()
{
}

void sub_10004285C()
{
}

void sub_1000428BC()
{
}

void sub_1000428E8()
{
}

void sub_100042914()
{
}

void sub_100042940()
{
}

void sub_10004296C()
{
}

void sub_1000429CC()
{
}

void sub_100042A44()
{
}

void sub_100042AA4()
{
}

void sub_100042B04()
{
}

void sub_100042B64()
{
}

void sub_100042BC4()
{
}

void sub_100042BF0()
{
}

void sub_100042C1C()
{
}

void sub_100042C7C()
{
}

void sub_100042CDC()
{
}

void sub_100042D3C()
{
}

void sub_100042D68()
{
}

void sub_100042D94()
{
}

void sub_100042DC0()
{
}

void sub_100042E20()
{
}

void sub_100042E4C(uint64_t a1, os_log_s *a2)
{
  int v3 = 134218752;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  uint64_t v6 = qword_1000673C0;
  __int16 v7 = 1024;
  int v8 = sub_10003AE20();
  __int16 v9 = 1024;
  int v10 = sub_10003603C();
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "Avoiding display tickle. cTime:%lld lTime:%lld Display:%d rd:%d\n",  (uint8_t *)&v3,  0x22u);
  sub_10002F2FC();
}

void sub_100042F04()
{
}

void sub_100042F30()
{
}

void sub_100042F5C()
{
}

void sub_100042F88()
{
}

void sub_100042FB4()
{
}

void sub_100042FE0()
{
}

void sub_100043040()
{
}

void sub_10004306C()
{
}

void sub_100043098()
{
}

void sub_1000430C4()
{
}

void sub_100043124()
{
}

void sub_100043184()
{
}

void sub_1000431B0(os_log_t log)
{
  v1[0] = 67109376;
  v1[1] = 0;
  __int16 v2 = 2048;
  uint64_t v3 = 0LL;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "System Assertion Timeout: shouldStartSystemAssertionTimer power source %d activity level %llu\n",  (uint8_t *)v1,  0x12u);
  sub_100008404();
}

void sub_100043230()
{
}

void sub_10004325C()
{
}

void sub_100043288( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000432F0( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100043368()
{
}

void sub_100043394(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Failed to register for power source updates",  v1,  2u);
  sub_1000055BC();
}

void sub_1000433D0()
{
}

void sub_100043430()
{
}

void sub_100043490(uint64_t *a1, os_log_s *a2)
{
  uint64_t v2 = *a1;
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Port object already exists for service, ignoring... (registryEntryID: %llu)",  (uint8_t *)&v3,  0xCu);
}

void sub_100043508()
{
}

void sub_100043568(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Power assertion already exists", v1, 2u);
  sub_1000055BC();
}

void sub_1000435A4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Failed to open connection to rootDomain\n",  v1,  2u);
}

void sub_1000435E4(int a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Failed to get display sleep timer. rc:0x%x\n",  (uint8_t *)v2,  8u);
}

void sub_100043658()
{
}

void sub_100043684()
{
}

void sub_1000436B0()
{
}

void sub_1000436DC()
{
}

void sub_100043708()
{
}

void sub_100043734()
{
}

void sub_100043760()
{
}

void sub_10004378C()
{
}

void sub_1000437B8()
{
}

void sub_1000437E4(uint64_t a1, os_log_s *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "Global levels set to 0x%llx\n",  (uint8_t *)&v2,  0xCu);
  sub_100008404();
}

void sub_100043854( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000438BC()
{
}

void sub_10004391C()
{
}

void sub_10004398C()
{
}

void sub_1000439F4()
{
  __int16 v4 = 1024;
  int v5 = v0;
  sub_100038054((void *)&_mh_execute_header, v1, v2, "inactiveDuration:%d gUserActive.userActive:%d\n", v3);
  sub_100008404();
}

void sub_100043A6C()
{
}

void sub_100043A98()
{
}

void sub_100043AC4()
{
}

void sub_100043AF0()
{
}

void sub_100043B50()
{
}

void sub_100043B7C()
{
}

void sub_100043BDC()
{
}

void sub_100043C08(_xpc_connection_s *a1, int *a2, os_log_s *a3)
{
  int v6 = sub_100038060(a1);
  int v7 = *a2;
  int v8 = 134218496;
  __int16 v9 = a1;
  __int16 v10 = 1024;
  int v11 = v6;
  __int16 v12 = 1024;
  int v13 = v7;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_DEBUG,  "Registered user inactivity client %p(pid %d) with timeout(%d)\n",  (uint8_t *)&v8,  0x18u);
}

void sub_100043CB4()
{
}

void sub_100043D14()
{
}

void sub_100043D74()
{
}

void sub_100043DE0(os_log_t log)
{
  int v1 = 134217984;
  uint64_t v2 = 0LL;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Invalid args for UserActivity client deregistration(%p)\n",  (uint8_t *)&v1,  0xCu);
  sub_100008404();
}

void sub_100043E54(_xpc_connection_s *a1, os_log_s *a2)
{
}

void sub_100043ED0(_xpc_connection_s *a1, os_log_s *a2)
{
}

void sub_100043F4C()
{
}

void sub_100043FAC(uint64_t a1, os_log_s *a2)
{
  v2[0] = 67110400;
  v2[1] = byte_100067567;
  __int16 v3 = 1024;
  int v4 = word_1000675B8;
  __int16 v5 = 1024;
  int v6 = HIBYTE(word_1000675B8);
  __int16 v7 = 2048;
  uint64_t v8 = a1;
  __int16 v9 = 2048;
  uint64_t v10 = qword_1000675A8;
  __int16 v11 = 2048;
  uint64_t v12 = qword_1000675B0;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "getUserInactiveDuration: rdActive:%d hidActive:%d assertionActivityValid:%d now:0x%llx  hid_ts:0x%llx assertion_ts:0x%llx\n",  (uint8_t *)v2,  0x32u);
}

void sub_10004406C()
{
}

void sub_100044098()
{
  __assert_rtn("PMDynamicStoreDisconnectCallBack", "PMStore.c", 85, "store == gSCDynamicStore");
}

void sub_1000440C0(uint64_t a1, int a2, os_log_t log)
{
  v3[0] = 67109378;
  v3[1] = a2;
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "PID %d doesnt have entitlement %@\n",  (uint8_t *)v3,  0x12u);
}

void sub_100044144(int a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "PID %d is not entitled to set wake reason\n",  (uint8_t *)v2,  8u);
  sub_1000055BC();
}

void sub_1000441B4()
{
}

void sub_1000441E0()
{
}

void sub_10004420C()
{
}

void sub_100044238()
{
}

void sub_100044264()
{
}

void sub_100044290( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000442C4(uint64_t a1, xpc_connection_t connection)
{
  int v2 = 136315650;
  uint64_t v3 = a1;
  __int16 v4 = 2048;
  xpc_connection_t v5 = connection;
  __int16 v6 = 1024;
  pid_t pid = xpc_connection_get_pid(connection);
  _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "Received error %s on peer %p(pid %d)\n",  (uint8_t *)&v2,  0x1Cu);
}

void sub_100044370( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000443A4()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "WakeTime: Calendar resynced\n",  v0,  2u);
  sub_1000055BC();
}

id objc_msgSend_writeToFile_atomically_encoding_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToFile:atomically:encoding:error:");
}