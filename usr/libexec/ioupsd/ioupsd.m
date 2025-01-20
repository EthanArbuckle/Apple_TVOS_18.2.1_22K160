BOOL sub_100001A90(mach_port_t *a1)
{
  mach_port_t v2;
  mach_port_t special_port;
  mach_port_t sp;
  sp = 0;
  if (!a1)
  {
    if (!task_get_special_port(mach_task_self_, 4, &special_port))
    {
      v2 = special_port;
      return bootstrap_look_up(v2, "com.apple.IOUPSPlugInServer", &sp) == 0;
    }

    return 0LL;
  }

  v2 = *a1;
  if (!v2)
  {
    if (!task_get_special_port(mach_task_self_, 4, &special_port))
    {
      v2 = special_port;
      *a1 = special_port;
      return bootstrap_look_up(v2, "com.apple.IOUPSPlugInServer", &sp) == 0;
    }

    return 0LL;
  }

  special_port = v2;
  return bootstrap_look_up(v2, "com.apple.IOUPSPlugInServer", &sp) == 0;
}

uint64_t sub_100001B34(mach_port_t a1, int a2, CFTypeRef object)
{
  uint64_t result = 3758097090LL;
  if (a1 && object)
  {
    v6 = IOCFSerialize(object, 0LL);
    if (v6)
    {
      v7 = v6;
      BytePtr = CFDataGetBytePtr(v6);
      int Length = CFDataGetLength(v7);
      uint64_t v10 = sub_100005BA4(a1, a2, (uint64_t)BytePtr, Length);
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

uint64_t sub_100001BC4(mach_port_t a1, int a2, CFTypeRef *a3)
{
  buffer = 0LL;
  uint64_t result = 3758097090LL;
  if (a1 && a3)
  {
    uint64_t result = sub_100005D18(a1, a2, &buffer, &v6);
    if (!(_DWORD)result)
    {
      *a3 = IOCFUnserialize(buffer, kCFAllocatorDefault, 0LL, 0LL);
      vm_deallocate(mach_task_self_, (vm_address_t)buffer, v6);
      return 0LL;
    }
  }

  return result;
}

uint64_t sub_100001C4C(mach_port_t a1, int a2, CFTypeRef *a3)
{
  buffer = 0LL;
  uint64_t result = 3758097090LL;
  if (a1 && a3)
  {
    uint64_t result = sub_100005EDC(a1, a2, &buffer, &v6);
    if (!(_DWORD)result)
    {
      *a3 = IOCFUnserialize(buffer, kCFAllocatorDefault, 0LL, 0LL);
      vm_deallocate(mach_task_self_, (vm_address_t)buffer, v6);
      return 0LL;
    }
  }

  return result;
}

uint64_t start()
{
  kern_return_t v16;
  int v17;
  os_log_s *v18;
  __CFArray *v19;
  __CFRunLoopSource *RunLoopSource;
  __int128 v22;
  mach_port_t sp[6];
  signal(2, (void (__cdecl *)(int))sub_100002070);
  sp[0] = 0;
  if (task_get_special_port(mach_task_self_, 4, &bootstrap_port)
    || (qword_10000C080 = (uint64_t)CFRunLoopGetCurrent()) == 0)
  {
LABEL_2:
    v0 = 0LL;
    goto LABEL_3;
  }

  v16 = bootstrap_check_in(bootstrap_port, "com.apple.IOUPSPlugInServer", sp);
  if (v16)
  {
    v17 = v16;
    v18 = (os_log_s *)qword_10000C050;
    if (os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_ERROR)) {
      sub_100006358(v17, v18);
    }
    goto LABEL_2;
  }

  v0 = CFMachPortCreateWithPort(kCFAllocatorDefault, sp[0], (CFMachPortCallBack)sub_100005AC0, 0LL, 0LL);
  RunLoopSource = CFMachPortCreateRunLoopSource(kCFAllocatorDefault, v0, 0LL);
  qword_10000C088 = (uint64_t)RunLoopSource;
  if (!RunLoopSource) {
    goto LABEL_5;
  }
  CFRunLoopAddSource((CFRunLoopRef)qword_10000C080, RunLoopSource, kCFRunLoopDefaultMode);
LABEL_3:
  if (qword_10000C088) {
    CFRelease((CFTypeRef)qword_10000C088);
  }
LABEL_5:
  if (v0) {
    CFRelease(v0);
  }
  byte_10000C048 = 0;
  os_log_t v1 = os_log_create("com.apple.ioupsd", "upsd");
  v2 = (void *)qword_10000C050;
  qword_10000C050 = (uint64_t)v1;

  qword_10000C058 = (uint64_t)IONotificationPortCreate(kIOMainPortDefault);
  Current = CFRunLoopGetCurrent();
  v4 = IONotificationPortGetRunLoopSource((IONotificationPortRef)qword_10000C058);
  CFRunLoopAddSource(Current, v4, kCFRunLoopDefaultMode);
  v22 = xmmword_1000077C0;
  *(_OWORD *)sp = xmmword_1000077B0;
  CFMutableDictionaryRef v5 = IOServiceMatching("IOHIDDevice");
  if (v5)
  {
    CFMutableDictionaryRef v6 = v5;
    CFMutableArrayRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 3LL, &kCFTypeArrayCallBacks);
    if (Mutable)
    {
      v8 = Mutable;
      for (uint64_t i = 0LL; i != 4; ++i)
      {
        CFMutableDictionaryRef v10 = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
        if (!v10 || (v11 = v10, (CFNumberRef v12 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &sp[i])) == 0LL))
        {
LABEL_22:
          CFRelease(v6);
          v19 = v8;
          goto LABEL_24;
        }

        CFNumberRef v13 = v12;
        CFDictionarySetValue(v11, @"DeviceUsagePage", v12);
        CFRelease(v13);
        if (sp[i - 4])
        {
          CFNumberRef v14 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &sp[i - 4]);
          if (!v14) {
            goto LABEL_22;
          }
          CFNumberRef v15 = v14;
          CFDictionarySetValue(v11, @"DeviceUsage", v14);
          CFRelease(v15);
        }

        CFArrayAppendValue(v8, v11);
        CFRelease(v11);
      }

      CFDictionarySetValue(v6, @"DeviceUsagePairs", v8);
      CFRelease(v8);
      if (!IOServiceAddMatchingNotification( (IONotificationPortRef)qword_10000C058,  "IOServiceFirstMatch",  v6,  (IOServiceMatchingCallback)sub_100003BA8,  0LL,  (io_iterator_t *)&dword_10000C068)) {
        sub_100003BA8(0, dword_10000C068);
      }
    }

    else
    {
      v19 = v6;
LABEL_24:
      CFRelease(v19);
    }
  }

  xpc_set_event_stream_handler("com.apple.iokit.matching", &_dispatch_main_q, &stru_100008508);
  CFRunLoopRun();
  return 0LL;
}

void sub_100002070()
{
  v0 = (os_log_s *)qword_10000C050;
  if (os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)os_log_t v1 = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "upsd: exiting SIGINT\n", v1, 2u);
  }

  sub_100002A9C();
}

void sub_1000020C4(id a1, OS_xpc_object *a2)
{
  v2 = a2;
  v3 = (IONotificationPort *)qword_10000C058;
  io_service_t v4 = sub_100002194();
  uint64_t v5 = IOServiceAddInterestNotification( v3,  v4,  "IOGeneralInterest",  (IOServiceInterestCallback)sub_10000220C,  0LL,  (io_object_t *)&dword_10000C060);
  if ((_DWORD)v5)
  {
    uint64_t v6 = v5;
    v7 = (os_log_s *)qword_10000C050;
    if (os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_ERROR)) {
      sub_1000063DC(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }

  io_registry_entry_t v14 = sub_100002194();
  CFProperty = (void *)IORegistryEntryCreateCFProperty(v14, @"AccessoryDetails", kCFAllocatorDefault, 0);
  sub_1000022A4(CFProperty, 1);
  if (!dword_10000C064) {
    sub_100002A9C();
  }
}

uint64_t sub_100002194()
{
  uint64_t result = dword_10000C0A8;
  if (!dword_10000C0A8)
  {
    os_log_t v1 = IOServiceMatching("IOPMPowerSource");
    uint64_t result = IOServiceGetMatchingService(kIOMainPortDefault, v1);
    dword_10000C0A8 = result;
    if (!(_DWORD)result)
    {
      if (os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_ERROR)) {
        sub_100006440();
      }
      return dword_10000C0A8;
    }
  }

  return result;
}

void sub_10000220C()
{
  io_registry_entry_t v0 = sub_100002194();
  id CFProperty = (id)IORegistryEntryCreateCFProperty(v0, @"AccessoryDetails", kCFAllocatorDefault, 0);
  io_registry_entry_t v1 = sub_100002194();
  v2 = (void *)IORegistryEntryCreateCFProperty(v1, @"AppleRawExternalConnected", kCFAllocatorDefault, 0);
  unsigned __int8 v3 = [v2 BOOLValue];
  char v4 = v3;
  if (byte_10000C078) {
    char v5 = 0;
  }
  else {
    char v5 = v3;
  }
  sub_1000022A4(CFProperty, v5);
  byte_10000C078 = v4;
}

void sub_1000022A4(void *a1, char a2)
{
  id v3 = a1;
  if (v3
    && (uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSArray), (objc_opt_isKindOfClass(v3, v4) & 1) != 0)
    && [v3 count])
  {
    char v52 = a2;
    if ([v3 count])
    {
      uint64_t v6 = 0LL;
      v7 = &selRef_BOOLValue;
      uint64_t v8 = &CFAbsoluteTimeGetCurrent_ptr;
      uint64_t v9 = &CFAbsoluteTimeGetCurrent_ptr;
      *(void *)&__int128 v5 = 67109376LL;
      __int128 v51 = v5;
      id v53 = v3;
      while (1)
      {
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndex:", v6, v51));
        uint64_t v11 = (os_log_s *)v7[10];
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134218242;
          *(void *)v67 = v6;
          *(_WORD *)&v67[8] = 2112;
          v68 = v10;
          _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "SMCAccessory[%zu]: %@\n", buf, 0x16u);
        }

        id v12 = v10;
        if (!v12) {
          goto LABEL_69;
        }
        uint64_t v13 = objc_opt_class(v8[81]);
        if ((objc_opt_isKindOfClass(v12, v13) & 1) == 0) {
          goto LABEL_69;
        }
        id v14 = v12;
        CFNumberRef v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:@"VID"]);
        v16 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:@"PID"]);
        v17 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:@"CurrentCapacity"]);
        v18 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:@"MaxCapacity"]);
        uint64_t v19 = objc_opt_class(v9[82]);
        if ((objc_opt_isKindOfClass(v15, v19) & 1) != 0)
        {
          uint64_t v20 = objc_opt_class(v9[82]);
          if ((objc_opt_isKindOfClass(v16, v20) & 1) != 0)
          {
            uint64_t v21 = objc_opt_class(v9[82]);
            if ((objc_opt_isKindOfClass(v17, v21) & 1) != 0)
            {
              uint64_t v22 = objc_opt_class(v9[82]);
              if ((objc_opt_isKindOfClass(v18, v22) & 1) != 0) {
                break;
              }
            }
          }
        }

LABEL_68:
        id v3 = v53;
        uint64_t v8 = &CFAbsoluteTimeGetCurrent_ptr;
LABEL_69:
      }

      v56 = v15;
      unsigned __int16 cf = (unsigned __int16)[v15 unsignedIntValue];
      v55 = v16;
      unsigned __int16 v57 = (unsigned __int16)[v16 unsignedIntValue];
      v23 = v17;
      unsigned __int8 v24 = [v17 unsignedIntValue];
      v54 = v18;
      unsigned __int8 v25 = [v18 unsignedIntValue];
      v26 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:@"IsCharging"]);
      v27 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:@"ExternalConnected"]);
      v28 = (os_log_s *)v7[10];
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109888;
        unsigned int v30 = v24;
        *(_DWORD *)v67 = cf;
        *(_WORD *)&v67[4] = 1024;
        *(_DWORD *)&v67[6] = v57;
        LOWORD(v68) = 1024;
        *(_DWORD *)((char *)&v68 + 2) = v24;
        HIWORD(v68) = 1024;
        int v69 = v25;
        v49 = v28;
        unsigned int v29 = v25;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v49,  OS_LOG_TYPE_DEBUG,  "vid:%d, pid:%d, soc:%d/%d\n",  buf,  0x1Au);
      }

      else
      {
        unsigned int v29 = v25;
        unsigned int v30 = v24;
      }

      if (v29 >= v30) {
        unsigned __int8 v25 = v24;
      }
      uint64_t v9 = &CFAbsoluteTimeGetCurrent_ptr;
      uint64_t v31 = objc_opt_class(&OBJC_CLASS___NSNumber);
      if ((objc_opt_isKindOfClass(v27, v31) & 1) != 0) {
        unsigned __int8 v32 = [v27 BOOLValue];
      }
      else {
        unsigned __int8 v32 = 0;
      }
      v7 = &selRef_BOOLValue;
      unsigned __int8 v64 = v32;
      uint64_t v33 = objc_opt_class(&OBJC_CLASS___NSNumber);
      if ((objc_opt_isKindOfClass(v26, v33) & 1) != 0) {
        unsigned __int8 v34 = [v26 BOOLValue];
      }
      else {
        unsigned __int8 v34 = 0;
      }
      unsigned __int8 v65 = v34;
      int v60 = v25;
      unsigned int v61 = v29;
      int v62 = cf;
      int v63 = v57;

      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  5LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
      if (!Mutable) {
        goto LABEL_68;
      }
      CFMutableDictionaryRef v36 = Mutable;
      v37 = (os_log_s *)qword_10000C050;
      if (os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = v51;
        *(_DWORD *)v67 = v25;
        *(_WORD *)&v67[4] = 1024;
        *(_DWORD *)&v67[6] = v29;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEBUG,  "ProcessSmcAccessory: soc:%d/%d\n",  buf,  0xEu);
      }

      CFNumberRef v38 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &v62);
      CFNumberRef v39 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &v63);
      CFNumberRef v40 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &v60);
      CFNumberRef v41 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &v61);
      CFNumberRef v42 = v41;
      CFNumberRef cfa = v38;
      if (!v38 || !v39 || !v40 || !v41)
      {
        CFMutableSetRef v43 = 0LL;
        if (!cfa) {
          goto LABEL_60;
        }
        goto LABEL_59;
      }

      CFMutableSetRef v43 = CFSetCreateMutable(kCFAllocatorDefault, 1LL, &kCFTypeSetCallBacks);
      if (!v43)
      {
LABEL_59:
        CFRelease(cfa);
LABEL_60:
        if (v39) {
          CFRelease(v39);
        }
        if (v40) {
          CFRelease(v40);
        }
        if (v42) {
          CFRelease(v42);
        }
        CFRelease(v36);
        if (v43) {
          CFRelease(v43);
        }
        goto LABEL_68;
      }

      if (v65) {
        CFBooleanRef v44 = kCFBooleanTrue;
      }
      else {
        CFBooleanRef v44 = kCFBooleanFalse;
      }
      CFDictionarySetValue(v36, @"Show Charging UI", v44);
      if ((byte_10000C048 & 2) == 0)
      {
        CFDictionarySetValue(v36, @"Is Present", kCFBooleanTrue);
        if (v65) {
          CFBooleanRef v45 = kCFBooleanTrue;
        }
        else {
          CFBooleanRef v45 = kCFBooleanFalse;
        }
        CFDictionarySetValue(v36, @"Is Charging", v45);
        CFDictionarySetValue(v36, @"Vendor ID", cfa);
        CFDictionarySetValue(v36, @"Product ID", v39);
        CFDictionarySetValue(v36, @"Max Capacity", v42);
        CFDictionarySetValue(v36, @"Current Capacity", v40);
        CFDictionarySetValue(v36, @"Transport Type", @"Inductive In-Band");
        if (v62 == 1452 && v63 == 5017) {
          CFDictionarySetValue(v36, @"Name", @"MagSafe Battery Pack");
        }
        CFSetAddValue(v43, @"Current Capacity");
      }

      if (v64) {
        v46 = @"AC Power";
      }
      else {
        v46 = @"Battery Power";
      }
      CFDictionarySetValue(v36, @"Power Source State", v46);
      v47 = (UInt8 *)qword_10000C090;
      if (qword_10000C090)
      {
        *(_DWORD *)(qword_10000C090 + 56) = 3;
        v47[28] = 1;
        Value = CFDictionaryGetValue(*((CFDictionaryRef *)v47 + 4), @"Power Source State");
        if (sub_100004494((uint64_t)v47, *((const __CFDictionary **)v47 + 4), v36, v43)
          || IOPSSetPowerSourceDetails(*(void *)v47, *((void *)v47 + 4)))
        {
          v7 = &selRef_BOOLValue;
          goto LABEL_58;
        }

        if (Value && CFEqual(Value, v46))
        {
          v7 = &selRef_BOOLValue;
          if ((v52 & 1) == 0)
          {
LABEL_57:
            qword_10000C090 = (uint64_t)v47;
            byte_10000C048 |= 1u;
            goto LABEL_58;
          }
        }

        else
        {
          v7 = &selRef_BOOLValue;
        }
      }

      else
      {
        v47 = sub_100004394();
        *((_DWORD *)v47 + 14) = 3;
        v47[28] = 1;
        if (sub_100004B6C((uint64_t)v47, v36, v43))
        {
LABEL_58:
          uint64_t v9 = &CFAbsoluteTimeGetCurrent_ptr;
          goto LABEL_59;
        }

        v47[60] = sub_100002D90((uint64_t)v47);
        v47[61] = sub_100002E64((uint64_t)v47);
      }

      sub_100004C98((uint64_t)v47, v46);
      goto LABEL_57;
    }
  }

  else
  {
    BOOL v50 = (byte_10000C048 & 0xFE) == 0;
    byte_10000C048 &= ~1u;
    if (v50)
    {
      sub_1000055BC(qword_10000C090);
      qword_10000C090 = 0LL;
    }
  }

LABEL_79:
}

void sub_100002A9C()
{
  if (dword_10000C068)
  {
    IOObjectRelease(dword_10000C068);
    dword_10000C068 = 0;
  }

  if (dword_10000C060)
  {
    IOObjectRelease(dword_10000C060);
    dword_10000C060 = 0;
  }

  int valuePtr = 0;
  io_registry_entry_t v0 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
  sub_100002B08(v0);
  exit(0);
}

CFNumberRef sub_100002B08(const __CFNumber *result)
{
  int valuePtr = 0;
  if (result)
  {
    io_registry_entry_t v1 = result;
    CFNumberGetValue(result, kCFNumberSInt32Type, &valuePtr);
    v2 = (os_log_s *)qword_10000C050;
    if (os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v7 = valuePtr;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "adapter family %x\n", buf, 8u);
    }

    id v3 = IOServiceMatching("AppleSmartBattery");
    uint64_t result = (const __CFNumber *)IOServiceGetMatchingService(kIOMainPortDefault, v3);
    if ((_DWORD)result)
    {
      io_object_t v4 = result;
      IORegistryEntrySetCFProperty((io_registry_entry_t)result, @"DownstreamAdapterFamily", v1);
      return (const __CFNumber *)IOObjectRelease(v4);
    }
  }

  return result;
}

uint64_t sub_100002C00(io_registry_entry_t a1, const __CFDictionary *a2)
{
  id v3 = (const __CFArray *)IORegistryEntrySearchCFProperty( a1,  "IOService",  @"DeviceUsagePairs",  kCFAllocatorDefault,  0);
  if (!v3) {
    return 0LL;
  }
  io_object_t v4 = v3;
  CFIndex Count = CFArrayGetCount(v3);
  if (Count < 1)
  {
    uint64_t v8 = 1LL;
  }

  else
  {
    CFIndex v6 = Count;
    CFIndex v7 = 0LL;
    uint64_t v8 = 1LL;
    do
    {
      uint64_t valuePtr = 0LL;
      ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v4, v7);
      if (ValueAtIndex)
      {
        uint64_t v10 = ValueAtIndex;
        Value = (const __CFNumber *)CFDictionaryGetValue(ValueAtIndex, @"DeviceUsagePage");
        id v12 = (const __CFNumber *)CFDictionaryGetValue(v10, @"DeviceUsage");
        if (Value) {
          CFNumberGetValue(Value, kCFNumberIntType, (char *)&valuePtr + 4);
        }
        if (v12) {
          CFNumberGetValue(v12, kCFNumberIntType, &valuePtr);
        }
        if (valuePtr == 0xFF0000000014LL || valuePtr == 0x8400000006LL)
        {
          uint64_t v8 = 2LL;
        }

        else if ((_DWORD)valuePtr == 46 && HIDWORD(valuePtr) == 133)
        {
          uint64_t v8 = 3LL;
        }

        else
        {
          uint64_t v8 = v8;
        }
      }

      ++v7;
    }

    while (v6 != v7);
  }

  CFRelease(v4);
  if (a2)
  {
    id v14 = CFDictionaryGetValue(a2, @"Accessory Category");
    if (v14)
    {
      if (CFEqual(v14, @"Game Controller")) {
        return 4LL;
      }
      else {
        return v8;
      }
    }
  }

  return v8;
}

BOOL sub_100002D90(uint64_t a1)
{
  uint64_t valuePtr = 0LL;
  if (a1 && (v2 = *(const __CFDictionary **)(a1 + 32)) != 0LL)
  {
    Value = (const __CFNumber *)CFDictionaryGetValue(v2, @"Vendor ID");
    if (Value) {
      CFNumberGetValue(Value, kCFNumberIntType, (char *)&valuePtr + 4);
    }
    io_object_t v4 = (const __CFNumber *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 32), @"Product ID");
    if (v4) {
      CFNumberGetValue(v4, kCFNumberIntType, &valuePtr);
    }
    BOOL result = 0LL;
    if (*(_DWORD *)(a1 + 56) == 3) {
      return valuePtr == 0x5AC00001395LL;
    }
  }

  else
  {
    BOOL result = os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_ERROR);
    if (result)
    {
      sub_10000646C();
      return 0LL;
    }
  }

  return result;
}

BOOL sub_100002E64(uint64_t a1)
{
  uint64_t valuePtr = 0LL;
  if (a1 && (v2 = *(const __CFDictionary **)(a1 + 32)) != 0LL)
  {
    Value = (const __CFNumber *)CFDictionaryGetValue(v2, @"Vendor ID");
    if (Value) {
      CFNumberGetValue(Value, kCFNumberIntType, (char *)&valuePtr + 4);
    }
    io_object_t v4 = (const __CFNumber *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 32), @"Product ID");
    if (v4) {
      CFNumberGetValue(v4, kCFNumberIntType, &valuePtr);
    }
    BOOL result = 0LL;
    if (*(_DWORD *)(a1 + 56) == 3) {
      return valuePtr == 0x5AC00001398LL;
    }
  }

  else
  {
    BOOL result = os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_ERROR);
    if (result)
    {
      sub_1000064DC();
      return 0LL;
    }
  }

  return result;
}

uint64_t sub_100002F38(const void *a1)
{
  io_connect_t connect = 0;
  if (!a1) {
    return 4LL;
  }
  CFTypeID v2 = CFGetTypeID(a1);
  if (v2 != CFNumberGetTypeID()) {
    return 4LL;
  }
  CFNumberGetValue((CFNumberRef)a1, kCFNumberSInt32Type, &valuePtr);
  if (valuePtr > 199)
  {
    uint64_t ServiceWithPrimaryPort = IOAccessoryManagerGetServiceWithPrimaryPort(1LL);
    if ((_DWORD)ServiceWithPrimaryPort)
    {
      uint64_t v7 = ServiceWithPrimaryPort;
      uint64_t v8 = IOServiceOpen(ServiceWithPrimaryPort, mach_task_self_, 0, &connect);
      if ((_DWORD)v8)
      {
        uint64_t USBCurrentLimitBase = v8;
        uint64_t v9 = (void *)qword_10000C050;
        if (os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_ERROR)) {
          sub_1000065B8(v9);
        }
      }

      else
      {
        uint64_t USBCurrentLimitBase = IOAccessoryManagerGetUSBCurrentLimitBase(v7, buf);
        if (!(_DWORD)USBCurrentLimitBase)
        {
          int v18 = *(_DWORD *)buf;
          if (*(_DWORD *)buf >= 0x7FFFFFFFu) {
            int v18 = 0x7FFFFFFF;
          }
          IOAccessoryManagerSetUSBCurrentOffset(connect, (valuePtr - v18));
          uint64_t USBCurrentLimitBase = v19;
        }

        IOServiceClose(connect);
      }
    }

    else
    {
      uint64_t USBCurrentLimitBase = 3758097088LL;
      uint64_t v10 = (os_log_s *)qword_10000C050;
      if (os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_ERROR)) {
        sub_10000654C(v10, v11, v12, v13, v14, v15, v16, v17);
      }
    }
  }

  else
  {
    id v3 = (os_log_s *)qword_10000C050;
    uint64_t USBCurrentLimitBase = 0LL;
    if (os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v23 = valuePtr;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "ignoring battery case current limit < 200 (limit=%d)\n",  buf,  8u);
      return 0LL;
    }
  }

  return USBCurrentLimitBase;
}

uint64_t sub_1000030E8(uint64_t a1, void *a2, int a3)
{
  int valuePtr = a3;
  if (!a1) {
    return 29LL;
  }
  io_object_t v4 = *(void **)(a1 + 16);
  if (!v4) {
    return 29LL;
  }
  if (!*v4) {
    return 29LL;
  }
  CFNumberRef v6 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &valuePtr);
  if (!v6) {
    return 29LL;
  }
  CFNumberRef v7 = v6;
  values = v6;
  keys = a2;
  CFDictionaryRef v8 = CFDictionaryCreate( kCFAllocatorDefault,  (const void **)&keys,  (const void **)&values,  1LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  CFRelease(v7);
  if (!v8) {
    return 29LL;
  }
  uint64_t v9 = (*(uint64_t (**)(void, CFDictionaryRef))(**(void **)(a1 + 16) + 64LL))(*(void *)(a1 + 16), v8);
  CFRelease(v8);
  return v9;
}

uint64_t sub_1000031E4(uint64_t a1)
{
  if (!a1) {
    return 29LL;
  }
  CFTypeID v2 = *(void **)(a1 + 16);
  if (!v2 || !*v2) {
    return 29LL;
  }
  unsigned int v3 = time(0LL);
  srand(v3);
  for (uint64_t i = 0LL; i != 6; ++i)
  {
    int v5 = rand();
    if (i) {
      int v6 = 255;
    }
    else {
      int v6 = 63;
    }
    int v7 = v5 & v6;
    bytes[i] = v7;
  }

  if (v7)
  {
    if (v7 != 255) {
      goto LABEL_14;
    }
    char v8 = rand();
    uint64_t v9 = (5 - ((char)(v8 % 46 + (((v8 % 46) >> 12) & 7)) >> 3));
    int v10 = bytes[v9] ^ (1 << ((v8 % 46) & 7));
  }

  else
  {
    char v11 = rand();
    uint64_t v9 = (5 - ((char)(v11 % 46 + (((v11 % 46) >> 12) & 7)) >> 3));
    int v10 = bytes[v9] | (1 << ((v11 % 46) & 7));
  }

  bytes[v9] = v10;
LABEL_14:
  uint64_t v12 = (os_log_s *)qword_10000C050;
  if (os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_DEBUG)) {
    sub_10000665C(a1, bytes, v12);
  }
  CFDataRef v13 = CFDataCreate(kCFAllocatorDefault, bytes, 6LL);
  if (!v13 && os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_ERROR)) {
    sub_100006630();
  }
  values = v13;
  keys = @"Set Address";
  CFDictionaryRef v14 = CFDictionaryCreate( kCFAllocatorDefault,  (const void **)&keys,  (const void **)&values,  1LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  CFRelease(v13);
  if (!v14) {
    return 29LL;
  }
  uint64_t v15 = (*(uint64_t (**)(void, CFDictionaryRef))(**(void **)(a1 + 16) + 64LL))(*(void *)(a1 + 16), v14);
  CFRelease(v14);
  return v15;
}

CFNumberRef sub_10000343C(const __CFNumber *result, io_registry_entry_t entry, int a3)
{
  if (a3 == -536723200)
  {
    uint64_t v4 = (uint64_t)result;
    int v5 = (const __CFNumber *)IORegistryEntrySearchCFProperty( entry,  "IOService",  @"AppleRawCurrentCapacity",  kCFAllocatorDefault,  0);
    int v6 = (const __CFNumber *)IORegistryEntrySearchCFProperty( entry,  "IOService",  @"AppleRawMaxCapacity",  kCFAllocatorDefault,  0);
    if (v5) {
      BOOL v7 = v6 == 0LL;
    }
    else {
      BOOL v7 = 1;
    }
    if (!v7)
    {
      char v8 = v6;
      CFNumberGetValue(v5, kCFNumberSInt32Type, &valuePtr);
      CFNumberGetValue(v8, kCFNumberSInt32Type, &v16);
      int v9 = v16;
      int v10 = valuePtr;
      CFRelease(v5);
      CFRelease(v8);
      if (v16 >= 1)
      {
        char v11 = (os_log_s *)qword_10000C050;
        if (os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          int v19 = 100 * v10 / v9;
          _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Sending Current State of Charge: %d%%\n",  buf,  8u);
        }

        sub_1000030E8(v4, @"Send Current State of Charge", 100 * v10 / v9);
      }
    }

    uint64_t v12 = (const __CFNumber *)IORegistryEntrySearchCFProperty( entry,  "IOService",  @"VirtualTemperature",  kCFAllocatorDefault,  0);
    if (v12
      || (BOOL result = (const __CFNumber *)IORegistryEntrySearchCFProperty( entry,  "IOService",  @"Temperature",  kCFAllocatorDefault,  0),  (v12 = result) != 0LL))
    {
      CFNumberGetValue(v12, kCFNumberSInt32Type, &v15);
      CFRelease(v12);
      int v13 = v15 / 0xA + 2732;
      CFDictionaryRef v14 = (os_log_s *)qword_10000C050;
      if (os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        int v19 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Sending Current Temperature: %d dK\n",  buf,  8u);
      }

      return (const __CFNumber *)sub_1000030E8(v4, @"Send Current Temperature", v13);
    }
  }

  return result;
}

void sub_1000036A0(uint64_t a1, uint64_t a2, int a3)
{
  if (a3 == -469794795)
  {
    uint64_t v8 = v3;
    uint64_t v9 = v4;
    if (IOAccessoryManagerGetUSBCurrentLimit(a2, &v7))
    {
      if (os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_ERROR)) {
        sub_100006750();
      }
    }

    else
    {
      if (v7 >= 0x7FFFFFFF) {
        int v6 = 0x7FFFFFFF;
      }
      else {
        int v6 = v7;
      }
      if (sub_1000030E8(a1, @"Set Current Limit", v6)
        && os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_ERROR))
      {
        sub_100006724();
      }
    }
  }
}

CFNumberRef sub_100003754(uint64_t a1, io_registry_entry_t entry)
{
  BOOL result = (const __CFNumber *)IORegistryEntrySearchCFProperty( entry,  "IOService",  @"Voltage",  kCFAllocatorDefault,  0);
  if (result)
  {
    uint64_t v4 = result;
    CFNumberGetValue(result, kCFNumberSInt32Type, &valuePtr);
    CFRelease(v4);
    return (const __CFNumber *)sub_1000030E8(a1, @"Set Required Voltage", valuePtr + 150);
  }

  return result;
}

CFNumberRef sub_1000037D8(uint64_t a1, uint64_t a2)
{
  io_registry_entry_t v3 = sub_100002194();
  BOOL result = (const __CFNumber *)IORegistryEntryCreateCFProperty( v3,  @"AverageChargingCurrent",  kCFAllocatorDefault,  0);
  if (result)
  {
    int v5 = result;
    CFNumberGetValue(result, kCFNumberSInt32Type, &valuePtr);
    CFRelease(v5);
    int v6 = (os_log_s *)qword_10000C050;
    if (os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v9 = valuePtr;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Sending Average Charging Current: %d mA\n",  buf,  8u);
    }

    return (const __CFNumber *)sub_1000030E8(a2, @"Send Average Charging Current", valuePtr);
  }

  return result;
}

uint64_t sub_1000038C8(int a1, unsigned __int16 a2, char *buffer)
{
  uint64_t v4 = 3758097084LL;
  CFTypeRef v5 = IOCFUnserialize(buffer, kCFAllocatorDefault, 0LL, 0LL);
  if (v5)
  {
    int v6 = v5;
    uint64_t v4 = 3758097090LL;
    if (qword_10000C070 && CFArrayGetCount((CFArrayRef)qword_10000C070) > a2)
    {
      ValueAtIndex = (__CFData *)CFArrayGetValueAtIndex((CFArrayRef)qword_10000C070, a2);
      MutableBytePtr = CFDataGetMutableBytePtr(ValueAtIndex);
      if (MutableBytePtr)
      {
        uint64_t v9 = *((void *)MutableBytePtr + 2);
        uint64_t v4 = 3758097084LL;
        if (v9) {
          uint64_t v4 = (*(uint64_t (**)(uint64_t, const void *))(*(void *)v9 + 64LL))(v9, v6);
        }
      }

      else
      {
        uint64_t v4 = 3758097084LL;
      }
    }

    CFRelease(v6);
  }

  return v4;
}

uint64_t sub_100003988(uint64_t a1, unsigned __int16 a2, vm_address_t *a3, size_t *a4)
{
  uint64_t v4 = 3758097090LL;
  if (a3)
  {
    if (a4)
    {
      if (qword_10000C070)
      {
        CFIndex v7 = a2;
        if (CFArrayGetCount((CFArrayRef)qword_10000C070) > a2)
        {
          ValueAtIndex = (__CFData *)CFArrayGetValueAtIndex((CFArrayRef)qword_10000C070, v7);
          MutableBytePtr = CFDataGetMutableBytePtr(ValueAtIndex);
          if (MutableBytePtr)
          {
            uint64_t v10 = *((void *)MutableBytePtr + 2);
            if (v10)
            {
              uint64_t v4 = 3758097084LL;
              if (!(*(unsigned int (**)(uint64_t, CFTypeRef *))(*(void *)v10 + 48LL))(v10, &object)
                && object != 0LL)
              {
                uint64_t v12 = IOCFSerialize(object, 0LL);
                if (v12)
                {
                  int v13 = v12;
                  vm_size_t Length = CFDataGetLength(v12);
                  *a4 = Length;
                  uint64_t v4 = vm_allocate(mach_task_self_, a3, Length, 1);
                  if (!(_DWORD)v4)
                  {
                    unsigned int v15 = (void *)*a3;
                    if (v15)
                    {
                      BytePtr = CFDataGetBytePtr(v13);
                      memcpy(v15, BytePtr, *a4);
                    }
                  }

                  CFRelease(v13);
                }
              }
            }
          }
        }
      }
    }
  }

  return v4;
}

uint64_t sub_100003A98(uint64_t a1, unsigned __int16 a2, vm_address_t *a3, size_t *a4)
{
  uint64_t v4 = 3758097090LL;
  if (a3)
  {
    if (a4)
    {
      if (qword_10000C070)
      {
        CFIndex v7 = a2;
        if (CFArrayGetCount((CFArrayRef)qword_10000C070) > a2)
        {
          ValueAtIndex = (__CFData *)CFArrayGetValueAtIndex((CFArrayRef)qword_10000C070, v7);
          MutableBytePtr = CFDataGetMutableBytePtr(ValueAtIndex);
          if (MutableBytePtr)
          {
            uint64_t v10 = *((void *)MutableBytePtr + 2);
            if (v10)
            {
              uint64_t v4 = 3758097084LL;
              if (!(*(unsigned int (**)(uint64_t, CFTypeRef *))(*(void *)v10 + 40LL))(v10, &object)
                && object != 0LL)
              {
                uint64_t v12 = IOCFSerialize(object, 0LL);
                if (v12)
                {
                  int v13 = v12;
                  vm_size_t Length = CFDataGetLength(v12);
                  *a4 = Length;
                  uint64_t v4 = vm_allocate(mach_task_self_, a3, Length, 1);
                  if (!(_DWORD)v4)
                  {
                    unsigned int v15 = (void *)*a3;
                    if (v15)
                    {
                      BytePtr = CFDataGetBytePtr(v13);
                      memcpy(v15, BytePtr, *a4);
                    }
                  }

                  CFRelease(v13);
                }
              }
            }
          }
        }
      }
    }
  }

  return v4;
}

void sub_100003BA8(int a1, io_iterator_t iterator)
{
  kern_return_t v50;
  char v51;
  os_log_s *v52;
  int v53;
  uint8_t v54;
  _BYTE v55[15];
  uint8_t v56;
  _BYTE v57[15];
  id v58;
  id v59;
  SInt32 theScore;
  uint64_t v61;
  IOCFPlugInInterface **theInterface;
  CFTypeRef cf;
  __CFRunLoopSource *v64;
  CFSetRef v65;
  CFDictionaryRef v66;
  CFDictionaryRef v67;
  uint8_t buf[4];
  int v69;
  __int16 v70;
  int v71;
  v66 = 0LL;
  v67 = 0LL;
  unsigned __int8 v65 = 0LL;
  unsigned __int16 cf = 0LL;
  unsigned __int8 v64 = 0LL;
  unsigned int v61 = 0LL;
  theInterface = 0LL;
  io_object_t v3 = IOIteratorNext(iterator);
  if (v3)
  {
    io_service_t v4 = v3;
    CFTypeRef v5 = 0LL;
    id v6 = 0LL;
    CFIndex v7 = kCFRunLoopDefaultMode;
    while (1)
    {
      uint64_t v8 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0x40u,  0xA5u,  0x7Au,  0x4Eu,  0x26u,  0xA0u,  0x11u,  0xD8u,  0x92u,  0x95u,  0,  0xAu,  0x95u,  0x8Au,  0x2Cu,  0x78u);
      uint64_t v9 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0xC2u,  0x44u,  0xE8u,  0x58u,  0x10u,  0x9Cu,  0x11u,  0xD4u,  0x91u,  0xD4u,  0,  0x50u,  0xE4u,  0xC6u,  0x42u,  0x6Fu);
      if (!IOCreatePlugInInterfaceForService(v4, v8, v9, &theInterface, &theScore)) {
        break;
      }
LABEL_71:
      IOObjectRelease(v4);
      io_service_t v4 = IOIteratorNext(iterator);
      if (!v4)
      {

        return;
      }
    }

    uint64_t v10 = theInterface;
    QueryInterface = (*theInterface)->QueryInterface;
    uint64_t v12 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0xE6u,  0xEu,  7u,  0x99u,  0x9Au,  0xA6u,  0x49u,  0xDFu,  0xB5u,  0x5Bu,  0xA5u,  0xC9u,  0x4Bu,  0xA0u,  0x7Au,  0x4Au);
    CFUUIDBytes v13 = CFUUIDGetUUIDBytes(v12);
    if (((unsigned int (*)(IOCFPlugInInterface **, void, void, uint64_t *))QueryInterface)( v10,  *(void *)&v13.byte0,  *(void *)&v13.byte8,  &v61))
    {
      BOOL v14 = 1;
    }

    else
    {
      BOOL v14 = v61 == 0;
    }

    if (v14)
    {
      unsigned int v15 = theInterface;
      int v16 = (*theInterface)->QueryInterface;
      uint64_t v17 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0x63u,  0xF8u,  0xBFu,  0xC4u,  0x26u,  0xA0u,  0x11u,  0xD8u,  0x88u,  0xB4u,  0,  0xAu,  0x95u,  0x8Au,  0x2Cu,  0x78u);
      CFUUIDBytes v18 = CFUUIDGetUUIDBytes(v17);
      if (((unsigned int (*)(IOCFPlugInInterface **, void, void, uint64_t *))v16)( v15,  *(void *)&v18.byte0,  *(void *)&v18.byte8,  &v61))
      {
        goto LABEL_30;
      }
    }

    else
    {
      else {
        BOOL v20 = cf == 0LL;
      }
      if (v20)
      {
LABEL_30:
        if (!v5)
        {
LABEL_31:
          if (v61)
          {
            (*(void (**)(uint64_t))(*(void *)v61 + 24LL))(v61);
            unsigned int v61 = 0LL;
          }

          uint64_t v33 = v64;
          if (v64)
          {
            Current = CFRunLoopGetCurrent();
            CFRunLoopRemoveSource(Current, v33, v7);
            CFRelease(v33);
            unsigned __int8 v64 = 0LL;
          }

          if (v6)
          {
            v35 = CFRunLoopGetCurrent();
            CFRunLoopRemoveTimer(v35, (CFRunLoopTimerRef)v6, v7);

            id v6 = 0LL;
          }

          CFTypeRef v5 = 0LL;
          goto LABEL_70;
        }

LABEL_69:
        sub_1000055BC((uint64_t)v5);
        CFTypeRef v5 = 0LL;
        unsigned int v61 = 0LL;
        goto LABEL_70;
      }

      CFTypeID v21 = CFGetTypeID(cf);
      CFTypeID TypeID = CFArrayGetTypeID();
      int v23 = (void *)cf;
      if (v21 == TypeID)
      {
        uint64_t v24 = (uint64_t)[(id)cf count];
        if (v24 >= 1)
        {
          uint64_t v25 = v24;
          v26 = v7;
          for (uint64_t i = 0LL; i != v25; ++i)
          {
            v28 = v6;
            id v29 = [v23 objectAtIndex:i];
            v59 = v6;
            sub_100004328(v29, &v59, &v64);
            id v6 = v59;
          }

          CFIndex v7 = v26;
        }
      }

      else
      {
        v58 = v6;
        sub_100004328((void *)cf, &v58, &v64);
        int v23 = v6;
        id v6 = v58;
      }

      unsigned int v30 = v64;
      if (v64)
      {
        uint64_t v31 = CFRunLoopGetCurrent();
        CFRunLoopAddSource(v31, v30, v7);
      }

      if (v6)
      {
        unsigned __int8 v32 = CFRunLoopGetCurrent();
        CFRunLoopAddTimer(v32, (CFRunLoopTimerRef)v6, v7);
      }
    }

    Value = CFDictionaryGetValue(v67, @"Transport Type");
    CFTypeID v37 = CFStringGetTypeID();
    if (Value && CFGetTypeID(Value) == v37 && CFEqual(Value, @"Inductive In-Band"))
    {
      CFNumberRef v38 = (os_log_s *)qword_10000C050;
      if (os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_DEBUG)) {
        sub_1000067B0(&v56, v57, v38);
      }
      CFTypeRef v5 = (UInt8 *)qword_10000C090;
      char v39 = 1;
      int v40 = 1;
      if (qword_10000C090) {
        goto LABEL_48;
      }
    }

    else
    {
      char v39 = 0;
    }

    CFNumberRef v41 = sub_100004394();
    if (!v41) {
      goto LABEL_31;
    }
    CFTypeRef v5 = v41;
    int v40 = 0;
LABEL_48:
    *((void *)v5 + 2) = v61;
    *((void *)v5 + 5) = v64;
    objc_storeStrong((id *)v5 + 6, v6);
    v5[28] = 1;
    int v42 = sub_100002C00(v4, v67);
    *((_DWORD *)v5 + 14) = v42;
    if (v42 && !(*(unsigned int (**)(uint64_t, const __CFSet **))(*(void *)v61 + 40LL))(v61, &v65))
    {
      if (!v40)
      {
        int v43 = sub_100004B6C((uint64_t)v5, v67, v65);
LABEL_55:
        int v44 = v43;
        v5[60] = sub_100002D90((uint64_t)v5);
        v5[61] = sub_100002E64((uint64_t)v5);
        if (!v44)
        {
          if (*((_DWORD *)v5 + 14) == 3)
          {
            if ((v40 & 1) == 0)
            {
              v5[72] = 0;
              sub_100004C98((uint64_t)v5, @"Battery Power");
            }

            io_service_t v45 = sub_100002194();
            if (v45) {
              IOServiceAddInterestNotification( (IONotificationPortRef)qword_10000C058,  v45,  "IOGeneralInterest",  (IOServiceInterestCallback)sub_10000343C,  v5,  (io_object_t *)v5 + 20);
            }
            int v46 = sub_1000031E4((uint64_t)v5);
            if (v46)
            {
              int v47 = v46;
              v48 = (os_log_s *)qword_10000C050;
              if (os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_ERROR))
              {
                id v53 = *((_DWORD *)v5 + 6);
                *(_DWORD *)buf = 67109376;
                int v69 = v53;
                v70 = 1024;
                v71 = v47;
                _os_log_error_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_ERROR,  "failed to send address to power source %d (ret=0x%X)\n",  buf,  0xEu);
              }
            }
          }

          if (!(*(unsigned int (**)(uint64_t, CFDictionaryRef *))(*(void *)v61 + 48LL))(v61, &v66))
          {
            sub_1000052A8((uint64_t)v5, v66);
            (*(void (**)(uint64_t, void (*)(int, int, uint64_t, int, CFDictionaryRef), void, UInt8 *))(*(void *)v61 + 56LL))( v61,  sub_1000054E8,  0LL,  v5);
            BOOL v50 = IOServiceAddInterestNotification( (IONotificationPortRef)qword_10000C058,  v4,  "IOGeneralInterest",  (IOServiceInterestCallback)sub_1000054F4,  v5,  (io_object_t *)v5 + 2);
            __int128 v51 = v39 ^ 1;
            if (v50) {
              __int128 v51 = 1;
            }
            if ((v51 & 1) == 0)
            {
              char v52 = (os_log_s *)qword_10000C050;
              if (os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_DEBUG)) {
                sub_10000677C(&v54, v55, v52);
              }
              qword_10000C090 = (uint64_t)v5;
              byte_10000C048 |= 2u;
              goto LABEL_70;
            }

            if (!v50)
            {
LABEL_70:
              ((void (*)(IOCFPlugInInterface **))(*theInterface)->Release)(theInterface);
              goto LABEL_71;
            }
          }
        }

        goto LABEL_65;
      }

      if (!sub_100004494((uint64_t)v5, *((const __CFDictionary **)v5 + 4), v67, v65))
      {
        int v43 = IOPSSetPowerSourceDetails(*(void *)v5, *((void *)v5 + 4));
        goto LABEL_55;
      }
    }

LABEL_65:
    if (byte_10000C048) {
      char v49 = v39;
    }
    else {
      char v49 = 0;
    }
    if ((v49 & 1) != 0) {
      goto LABEL_70;
    }
    goto LABEL_69;
  }

id sub_100004328(void *a1, void *a2, void *a3)
{
  CFTypeID v6 = CFGetTypeID(a1);
  if (v6 == CFRunLoopTimerGetTypeID())
  {
    id result = a1;
    a3 = a2;
  }

  else
  {
    CFTypeID v8 = CFGetTypeID(a1);
    id result = (id)CFRunLoopSourceGetTypeID();
    if ((id)v8 != result) {
      return result;
    }
  }

  *a3 = a1;
  return result;
}

UInt8 *sub_100004394()
{
  io_registry_entry_t v0 = (const __CFArray *)qword_10000C070;
  if (qword_10000C070
    || (io_registry_entry_t v0 = CFArrayCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeArrayCallBacks), (qword_10000C070 = (uint64_t)v0) != 0))
  {
    CFIndex Count = CFArrayGetCount(v0);
    if (Count >= 1)
    {
      CFIndex v2 = Count;
      CFIndex v3 = 0LL;
      while (1)
      {
        ValueAtIndex = (__CFData *)CFArrayGetValueAtIndex((CFArrayRef)qword_10000C070, v3);
        if (ValueAtIndex)
        {
          MutableBytePtr = CFDataGetMutableBytePtr(ValueAtIndex);
          if (MutableBytePtr)
          {
            CFTypeID v6 = MutableBytePtr;
            if (!MutableBytePtr[28]) {
              break;
            }
          }
        }

        if (v2 == ++v3) {
          goto LABEL_11;
        }
      }

      LODWORD(v2) = v3;
LABEL_16:
      *((_DWORD *)v6 + 6) = v2;
      return v6;
    }

    LODWORD(v2) = 0;
LABEL_11:
    CFMutableDictionaryRef Mutable = CFDataCreateMutable(kCFAllocatorDefault, 96LL);
    if (Mutable)
    {
      CFTypeID v8 = Mutable;
      CFTypeID v6 = CFDataGetMutableBytePtr(Mutable);
      *(_OWORD *)CFTypeID v6 = 0u;
      *((_OWORD *)v6 + 1) = 0u;
      *((_OWORD *)v6 + 2) = 0u;
      *((_OWORD *)v6 + 3) = 0u;
      *((_OWORD *)v6 + 4) = 0u;
      *((_OWORD *)v6 + 5) = 0u;
      CFArrayAppendValue((CFMutableArrayRef)qword_10000C070, v8);
      CFRelease(v8);
      if (!v6) {
        return v6;
      }
      goto LABEL_16;
    }
  }

  return 0LL;
}

uint64_t sub_100004494(uint64_t a1, const __CFDictionary *a2, CFDictionaryRef theDict, const __CFSet *a4)
{
  value = 0LL;
  uint64_t valuePtr = 0LL;
  uint64_t result = 3758097084LL;
  if (!a2 || !theDict || !a4) {
    return result;
  }
  uint64_t v9 = (const __CFString *)CFDictionaryGetValue(theDict, @"Name");
  if (!v9)
  {
    if (CFDictionaryContainsKey(a2, @"Name")) {
      goto LABEL_21;
    }
    uint64_t v9 = @"Generic UPS";
  }

  if (!qword_10000C098)
  {
    *(_OWORD *)buf = off_100008528;
    uint64_t v38 = 0LL;
    qword_10000C098 = _sl_dlopen(buf, 0LL);
  }

  if (qword_10000C098 && sub_10000569C())
  {
    if (os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_DEBUG)) {
      sub_100006884();
    }
    uint64_t v10 = (uint64_t (*)(const __CFString *))sub_10000569C();
    if (!v10) {
      sub_1000067E4();
    }
    char v11 = (const void *)v10(v9);
    if (v11)
    {
      uint64_t v12 = v11;
      CFDictionarySetValue(a2, @"Name", v11);
      CFRelease(v12);
      goto LABEL_21;
    }

    if (os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_ERROR)) {
      sub_100006858();
    }
  }

  else
  {
    CFUUIDBytes v13 = (os_log_s *)qword_10000C050;
    if (os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "CoreAccessories.framework not loaded!!\n",  buf,  2u);
    }
  }

  CFDictionarySetValue(a2, @"Name", v9);
LABEL_21:
  BOOL v14 = (const __CFString *)CFDictionaryGetValue(theDict, @"Transport Type");
  if (v14)
  {
LABEL_22:
    CFDictionarySetValue(a2, @"Transport Type", v14);
    goto LABEL_24;
  }

  if (!CFDictionaryContainsKey(a2, @"Transport Type"))
  {
    BOOL v14 = @"UNK";
    goto LABEL_22;
  }

LABEL_24:
  unsigned int v15 = CFDictionaryGetValue(theDict, @"Vendor ID");
  int v16 = CFDictionaryGetValue(theDict, @"Product ID");
  uint64_t v17 = CFDictionaryGetValue(theDict, @"Model Number");
  CFDictionarySetValue(a2, @"Is Present", kCFBooleanTrue);
  if (*(_DWORD *)(a1 + 56) == 1)
  {
    CFDictionarySetValue(a2, @"Is Charging", kCFBooleanTrue);
    CFUUIDBytes v18 = @"AC Power";
LABEL_31:
    CFDictionarySetValue(a2, @"Power Source State", v18);
    goto LABEL_32;
  }

  int v19 = (const __CFBoolean *)CFDictionaryGetValue(theDict, @"Is Charging");
  if (v19)
  {
    CFBooleanRef v20 = v19;
LABEL_28:
    CFDictionarySetValue(a2, @"Is Charging", v20);
    goto LABEL_30;
  }

  if (!CFDictionaryContainsKey(a2, @"Is Charging"))
  {
    CFBooleanRef v20 = kCFBooleanFalse;
    goto LABEL_28;
  }

LABEL_30:
  CFUUIDBytes v18 = (const __CFString *)CFDictionaryGetValue(theDict, @"Power Source State");
  if (v18) {
    goto LABEL_31;
  }
  if (!CFDictionaryContainsKey(a2, @"Power Source State"))
  {
    CFUUIDBytes v18 = @"Battery Power";
    goto LABEL_31;
  }

LABEL_32:
  if (v15) {
    CFDictionarySetValue(a2, @"Vendor ID", v15);
  }
  if (v16) {
    CFDictionarySetValue(a2, @"Product ID", v16);
  }
  if (v17) {
    CFDictionarySetValue(a2, @"Model Number", v17);
  }
  LODWORD(valuePtr) = *(unsigned __int16 *)(a1 + 24) | (getpid() << 16);
  CFNumberRef v21 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
  CFDictionarySetValue(a2, @"Power Source ID", v21);
  CFRelease(v21);
  uint64_t v22 = CFDictionaryGetValue(theDict, @"Max Capacity");
  if (v22)
  {
    CFDictionarySetValue(a2, @"Max Capacity", v22);
  }

  else if (!CFDictionaryContainsKey(a2, @"Max Capacity"))
  {
    else {
      int v23 = 0;
    }
    HIDWORD(valuePtr) = v23;
    CFNumberRef v24 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, (char *)&valuePtr + 4);
    CFDictionarySetValue(a2, @"Max Capacity", v24);
    CFRelease(v24);
  }

  uint64_t v25 = CFDictionaryGetValue(theDict, @"Show Charging UI");
  if (v25) {
    CFDictionarySetValue(a2, @"Show Charging UI", v25);
  }
  if (CFSetContainsValue(a4, @"Current Capacity"))
  {
    if (CFDictionaryContainsKey(theDict, @"Current Capacity"))
    {
      v26 = CFDictionaryGetValue(theDict, @"Current Capacity");
      CFDictionarySetValue(a2, @"Current Capacity", v26);
    }

    else if (!CFDictionaryContainsKey(a2, @"Current Capacity"))
    {
      HIDWORD(valuePtr) = 0;
      CFNumberRef v27 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, (char *)&valuePtr + 4);
      CFDictionarySetValue(a2, @"Current Capacity", v27);
      CFRelease(v27);
    }
  }

  if (CFSetContainsValue(a4, @"Time to Empty"))
  {
    HIDWORD(valuePtr) = 100;
    CFNumberRef v28 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, (char *)&valuePtr + 4);
    CFDictionarySetValue(a2, @"Time to Empty", v28);
    CFRelease(v28);
  }

  if (CFSetContainsValue(a4, @"Voltage"))
  {
    HIDWORD(valuePtr) = 130;
    CFNumberRef v29 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, (char *)&valuePtr + 4);
    CFDictionarySetValue(a2, @"Voltage", v29);
    CFRelease(v29);
  }

  if (CFSetContainsValue(a4, @"Current"))
  {
    HIDWORD(valuePtr) = 1;
    CFNumberRef v30 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, (char *)&valuePtr + 4);
    CFDictionarySetValue(a2, @"Current", v30);
    CFRelease(v30);
  }

  int v31 = *(_DWORD *)(a1 + 56);
  if (v31 == 4) {
    goto LABEL_61;
  }
  if (v31 != 3)
  {
    if (v31 != 2)
    {
      unsigned __int8 v32 = @"Type";
      uint64_t v33 = @"UPS";
      goto LABEL_64;
    }

LABEL_61:
    unsigned __int8 v32 = @"Type";
    uint64_t v33 = @"Accessory Source";
LABEL_64:
    unsigned __int8 v34 = a2;
    goto LABEL_65;
  }

  CFDictionarySetValue(a2, @"Type", @"Battery Case");
  unsigned __int8 v32 = @"Accessory Category";
  unsigned __int8 v34 = a2;
  uint64_t v33 = @"Battery Case";
LABEL_65:
  CFDictionarySetValue(v34, v32, v33);
  uint64_t result = CFDictionaryGetValueIfPresent(theDict, @"Accessory Category", (const void **)&value);
  if ((_DWORD)result)
  {
    CFDictionarySetValue(a2, @"Accessory Category", value);
    return 0LL;
  }

  return result;
}

uint64_t sub_100004B6C(uint64_t a1, const __CFDictionary *a2, const __CFSet *a3)
{
  uint64_t v3 = 3758097084LL;
  if (a1 && a2 && a3)
  {
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    if (Mutable) {
      sub_100004494(a1, Mutable, a2, a3);
    }
    snprintf(__str, 0x14uLL, "/UPS%d", *(_DWORD *)(a1 + 24));
    uint64_t v8 = IOPSCreatePowerSource(a1);
    ++dword_10000C064;
    if ((_DWORD)v8)
    {
      uint64_t v3 = v8;
      *(void *)a1 = 0LL;
    }

    else
    {
      uint64_t v3 = IOPSSetPowerSourceDetails(*(void *)a1, Mutable);
      if ((_DWORD)v3)
      {
        if (Mutable) {
          CFRelease(Mutable);
        }
      }

      else
      {
        *(void *)(a1 + 32) = Mutable;
      }
    }
  }

  return v3;
}

void sub_100004C98(uint64_t a1, CFTypeRef cf1)
{
  int v3 = CFEqual(cf1, @"AC Power");
  int v31 = 0;
  if (*(_BYTE *)(a1 + 60))
  {
    if (v3)
    {
      IOPMAssertionID AssertionID = 0;
      IOPMAssertionCreateWithName( @"DisableInflow",  0xFFu,  @"com.apple.ioupsd.battery_case_disable_inflow",  &AssertionID);
      *(_BYTE *)(a1 + 72) = 1;
      uint64_t v4 = cf;
      IOAccessoryManagerSetUSBPreventSourceDetection(cf, 0LL);
      IOAccessoryManagerRestoreUSBCurrentLimitBase(v4);
      IOAccessoryManagerSetUSBCurrentOffset(v4, 0LL);
      int v5 = -21;
      uint64_t v6 = LODWORD(values[0]);
      while (!__CFADD__(v5++, 1))
      {
        usleep(0x3D090u);
        IOAccessoryManagerGetUSBCurrentLimitBase(v6, &v31);
        uint64_t v8 = (os_log_s *)qword_10000C050;
        if (os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf.version) = 67109120;
          HIDWORD(buf.version) = v31;
          _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "Battery Case AC Present: iLim = %d mA\n",  (uint8_t *)&buf,  8u);
        }

        if (v31)
        {
          CFNumberRef v21 = (os_log_s *)qword_10000C050;
          if (os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(buf.version) = 67109120;
            HIDWORD(buf.version) = v31;
            _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Initial downstream charger iLim: %d mA\n",  (uint8_t *)&buf,  8u);
          }

          LODWORD(v6) = values[0];
          goto LABEL_35;
        }
      }

      if (os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_ERROR)) {
        sub_1000069D4();
      }
LABEL_35:
      IOAccessoryManagerSetUSBPowerIgnore(v4, 0LL);
      sub_1000030E8(a1, @"Set Current Limit", v31);
      IOPMAssertionRelease(AssertionID);
      IOPMAssertionID AssertionID = 0;
      IOObjectRetain(v6);
      IOServiceAddInterestNotification( (IONotificationPortRef)qword_10000C058,  v6,  "IOGeneralInterest",  (IOServiceInterestCallback)sub_1000036A0,  (void *)a1,  (io_object_t *)(a1 + 84));
      io_service_t v23 = sub_100002194();
      IOServiceAddInterestNotification( (IONotificationPortRef)qword_10000C058,  v23,  "IOGeneralInterest",  (IOServiceInterestCallback)sub_100003754,  (void *)a1,  (io_object_t *)(a1 + 88));
    }

    else
    {
      uint64_t v4 = cf;
      IOAccessoryManagerSetUSBPreventSourceDetection(cf, 1LL);
      IOAccessoryManagerSetUSBPowerIgnore(v4, 1LL);
      IOAccessoryManagerSetUSBCurrentLimitBase(v4, 0LL);
      *(_BYTE *)(a1 + 72) = 0;
      io_object_t v19 = *(_DWORD *)(a1 + 84);
      if (v19)
      {
        IOObjectRelease(v19);
        *(_DWORD *)(a1 + 84) = 0;
      }

      io_object_t v20 = *(_DWORD *)(a1 + 88);
      if (v20)
      {
        IOObjectRelease(v20);
        *(_DWORD *)(a1 + 88) = 0;
      }
    }

    IOServiceClose(v4);
    goto LABEL_37;
  }

  Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 32), @"Transport Type");
  if (!CFEqual(Value, @"Inductive In-Band"))
  {
    io_connect_t v18 = (io_connect_t)values[0];
    IOAccessoryManagerSetUSBPowerIgnore(LODWORD(values[0]), v3 == 0);
    IOServiceClose(v18);
    goto LABEL_51;
  }

  buf.version = (CFIndex)@"Dock";
  buf.info = @"Mask";
  IOPMAssertionID AssertionID = 2;
  CFNumberRef v10 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &AssertionID);
  char v11 = &kCFBooleanFalse;
  if (!v3) {
    char v11 = &kCFBooleanTrue;
  }
  CFBooleanRef v12 = *v11;
  values[0] = v10;
  values[1] = v12;
  CFTypeRef cf = CFDictionaryCreate( kCFAllocatorDefault,  (const void **)&buf,  (const void **)values,  2LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  if (!cf)
  {
    if (os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_ERROR)) {
      sub_1000068E0();
    }
    goto LABEL_37;
  }

  CFArrayRef v13 = CFArrayCreate(kCFAllocatorDefault, &cf, 1LL, &kCFTypeArrayCallBacks);
  if (!v13)
  {
    if (os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_ERROR)) {
      sub_10000690C();
    }
    goto LABEL_37;
  }

  CFArrayRef v14 = v13;
  CFRelease(cf);
  CFRelease(values[0]);
  buf.version = (CFIndex)@"DockMask";
  values[0] = v14;
  CFTypeRef cf = CFDictionaryCreate( kCFAllocatorDefault,  (const void **)&buf,  (const void **)values,  1LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  if (!cf)
  {
    if (os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_ERROR)) {
      sub_1000068E0();
    }
    goto LABEL_37;
  }

  CFRelease(v14);
  io_registry_entry_t v15 = sub_100002194();
  if (v15)
  {
    io_registry_entry_t v16 = v15;
    uint64_t v17 = (os_log_s *)qword_10000C050;
    if (os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_DEBUG)) {
      sub_100006964(v3, v17);
    }
    if (IORegistryEntrySetCFProperties(v16, cf))
    {
      if (os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_ERROR)) {
        sub_100006938();
      }
      goto LABEL_37;
    }

    CFRelease(cf);
LABEL_51:
    *(_BYTE *)(a1 + 72) = v3;
    CFNumberRef v28 = (os_log_s *)qword_10000C050;
    if (os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf.version) = 67109120;
      HIDWORD(buf.version) = v3;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "AC present %d\n", (uint8_t *)&buf, 8u);
    }
  }

LABEL_37:
  if (*(_BYTE *)(a1 + 61))
  {
    if (v3)
    {
      buf.version = 0LL;
      memset(&buf.retain, 0, 24);
      buf.info = (void *)a1;
      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      CFRunLoopTimerRef v25 = CFRunLoopTimerCreate( kCFAllocatorDefault,  Current + 5.0,  5.0,  0LL,  0LL,  (CFRunLoopTimerCallBack)sub_1000037D8,  &buf);
      *(void *)(a1 + 64) = v25;
      if (v25)
      {
        v26 = CFRunLoopGetCurrent();
        CFRunLoopAddTimer(v26, *(CFRunLoopTimerRef *)(a1 + 64), kCFRunLoopDefaultMode);
      }

      else if (os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_ERROR))
      {
        sub_1000068B4();
      }
    }

    else if (*(void *)(a1 + 64))
    {
      CFNumberRef v27 = CFRunLoopGetCurrent();
      CFRunLoopRemoveTimer(v27, *(CFRunLoopTimerRef *)(a1 + 64), kCFRunLoopDefaultMode);
      CFRelease(*(CFTypeRef *)(a1 + 64));
      *(void *)(a1 + 64) = 0LL;
    }
  }

void sub_1000052A8(uint64_t a1, CFDictionaryRef theDict)
{
  if (a1)
  {
    if (theDict)
    {
      MutableCopy = CFDictionaryCreateMutableCopy(kCFAllocatorDefault, 0LL, theDict);
      if (MutableCopy)
      {
        uint64_t v4 = MutableCopy;
        if (*(_DWORD *)(a1 + 56) == 3
          && *(_BYTE *)(a1 + 60)
          && !*(_BYTE *)(a1 + 72)
          && !CFDictionaryGetValue(MutableCopy, @"Battery Case Available Current"))
        {
          Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 32), @"Battery Case Available Current");
          CFDictionarySetValue(v4, @"Battery Case Available Current", Value);
        }

        CFIndex Count = CFDictionaryGetCount(v4);
        if (Count)
        {
          uint64_t v7 = Count;
          size_t v8 = 8 * Count;
          uint64_t v9 = (const void **)malloc(8 * Count);
          CFNumberRef v10 = (const void **)malloc(v8);
          CFDictionaryGetKeysAndValues(v4, v9, v10);
          if (v7 >= 1)
          {
            char v11 = v9;
            CFBooleanRef v12 = (const __CFNumber **)v10;
            do
            {
              if (CFEqual(*v11, @"FamilyCode") && *(_DWORD *)(a1 + 56) == 3)
              {
                CFArrayRef v13 = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 32), *v11);
                if (!v13 || !CFEqual(v13, *v12)) {
                  sub_100002B08(*v12);
                }
              }

              else if (CFEqual(*v11, @"Power Source State") && *(_DWORD *)(a1 + 56) == 3)
              {
                CFArrayRef v14 = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 32), *v11);
                if (v14 && !CFEqual(v14, *v12)) {
                  sub_100004C98(a1, *v12);
                }
              }

              else if (CFEqual(*v11, @"Battery Case Available Current") {
                     && *(_DWORD *)(a1 + 56) == 3
              }
                     && *(_BYTE *)(a1 + 60)
                     && !*(_BYTE *)(a1 + 72))
              {
                sub_100002F38(*v12);
              }

              io_registry_entry_t v16 = *v11++;
              io_registry_entry_t v15 = v16;
              uint64_t v17 = *v12++;
              CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 32), v15, v17);
              --v7;
            }

            while (v7);
          }

          free(v9);
          free(v10);
          if (IOPSSetPowerSourceDetails(*(void *)a1, *(void *)(a1 + 32)))
          {
            if (os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_ERROR)) {
              sub_100006A00();
            }
          }
        }

        CFRelease(v4);
      }
    }
  }

void sub_1000054E8(int a1, int a2, uint64_t a3, int a4, CFDictionaryRef theDict)
{
}

void sub_1000054F4(uint64_t a1, uint64_t a2, int a3)
{
  if (a1 && a3 == -536870896)
  {
    uint64_t v4 = *(const __CFDictionary **)(a1 + 32);
    if (v4
      && (Value = CFDictionaryGetValue(v4, @"Transport Type"), CFTypeID TypeID = CFStringGetTypeID(), Value)
      && CFGetTypeID(Value) == TypeID
      && CFEqual(Value, @"Inductive In-Band"))
    {
      BOOL v7 = (byte_10000C048 & 0xFD) == 0;
      byte_10000C048 &= ~2u;
      if (v7)
      {
        sub_1000055BC(a1);
        qword_10000C090 = 0LL;
      }

      else
      {
        sub_1000058FC(a1);
      }
    }

    else
    {
      sub_1000055BC(a1);
    }
  }

void sub_1000055BC(uint64_t a1)
{
  if (a1)
  {
    *(_BYTE *)(a1 + 28) = 0;
    if (*(_DWORD *)(a1 + 56) == 3)
    {
      int valuePtr = 0;
      CFIndex v2 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
      sub_100002B08(v2);
    }

    sub_1000058FC(a1);
    if (*(void *)a1)
    {
      uint64_t v3 = IOPSReleasePowerSource();
      --dword_10000C064;
      if ((_DWORD)v3)
      {
        uint64_t v4 = v3;
        int v5 = (os_log_s *)qword_10000C050;
        if (os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_ERROR)) {
          sub_100006A2C(v4, v5, v6, v7, v8, v9, v10, v11);
        }
      }

      *(void *)a1 = 0LL;
    }

    CFBooleanRef v12 = *(const void **)(a1 + 32);
    if (v12)
    {
      CFRelease(v12);
      *(void *)(a1 + 32) = 0LL;
    }

    if (!dword_10000C064)
    {
      CFRelease((CFTypeRef)qword_10000C070);
      sub_100002A9C();
    }
  }

uint64_t sub_10000569C()
{
  uint64_t v3 = 0LL;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000LL;
  uint64_t v0 = qword_10000C0A0;
  uint64_t v6 = qword_10000C0A0;
  if (!qword_10000C0A0)
  {
    v2[0] = _NSConcreteStackBlock;
    v2[1] = 3221225472LL;
    v2[2] = sub_100005748;
    v2[3] = &unk_100008548;
    v2[4] = &v3;
    sub_100005748((uint64_t)v2);
    uint64_t v0 = v4[3];
  }

  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_100005730( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void *sub_100005748(uint64_t a1)
{
  uint64_t v4 = 0LL;
  if (!qword_10000C098)
  {
    __int128 v5 = off_100008528;
    uint64_t v6 = 0LL;
    qword_10000C098 = _sl_dlopen(&v5, &v4);
  }

  CFIndex v2 = (void *)qword_10000C098;
  if (!qword_10000C098) {
    sub_100006A90(&v4);
  }
  if (v4) {
    free(v4);
  }
  uint64_t result = dlsym(v2, "ACCConnectionInfoCopyLocalizedAccessoryNameCF");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  qword_10000C0A0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  return result;
}

uint64_t sub_100005820(io_service_t *a1, io_connect_t *a2)
{
  io_service_t ServiceWithPrimaryPort = IOAccessoryManagerGetServiceWithPrimaryPort(1LL);
  if (ServiceWithPrimaryPort)
  {
    io_service_t v5 = ServiceWithPrimaryPort;
    if (IOServiceOpen(ServiceWithPrimaryPort, mach_task_self_, 0, &connect))
    {
      uint64_t v6 = 3758097101LL;
      uint64_t v7 = (void *)qword_10000C050;
      if (os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_ERROR)) {
        sub_1000065B8(v7);
      }
    }

    else
    {
      uint64_t v6 = 0LL;
      *a1 = v5;
      *a2 = connect;
    }
  }

  else
  {
    uint64_t v8 = (os_log_s *)qword_10000C050;
    uint64_t v6 = 3758097136LL;
    if (os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_ERROR)) {
      sub_10000654C(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }

  return v6;
}

uint64_t sub_1000058FC(uint64_t a1)
{
  if (*(void *)(a1 + 40))
  {
    CFAbsoluteTime Current = CFRunLoopGetCurrent();
    CFRunLoopRemoveSource(Current, *(CFRunLoopSourceRef *)(a1 + 40), kCFRunLoopDefaultMode);
    CFRelease(*(CFTypeRef *)(a1 + 40));
    *(void *)(a1 + 40) = 0LL;
  }

  if (*(void *)(a1 + 48))
  {
    uint64_t v3 = CFRunLoopGetCurrent();
    CFRunLoopRemoveTimer(v3, *(CFRunLoopTimerRef *)(a1 + 48), kCFRunLoopDefaultMode);
    uint64_t v4 = *(void **)(a1 + 48);
    *(void *)(a1 + 4_Block_object_dispose(va, 8) = 0LL;
  }

  uint64_t v5 = *(void *)(a1 + 16);
  if (v5)
  {
    (*(void (**)(uint64_t))(*(void *)v5 + 24LL))(v5);
    *(void *)(a1 + 16) = 0LL;
  }

  io_object_t v6 = *(_DWORD *)(a1 + 80);
  if (v6)
  {
    IOObjectRelease(v6);
    *(_DWORD *)(a1 + 80) = 0;
  }

  io_object_t v7 = *(_DWORD *)(a1 + 84);
  if (v7)
  {
    IOObjectRelease(v7);
    *(_DWORD *)(a1 + 84) = 0;
  }

  io_object_t v8 = *(_DWORD *)(a1 + 88);
  if (v8)
  {
    IOObjectRelease(v8);
    *(_DWORD *)(a1 + 8_Block_object_dispose(va, 8) = 0;
  }

  uint64_t result = *(unsigned int *)(a1 + 8);
  if ((_DWORD)result)
  {
    uint64_t result = IOObjectRelease(result);
    *(_DWORD *)(a1 + _Block_object_dispose(va, 8) = 0;
  }

  return result;
}

void sub_1000059C0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

void sub_1000059E4( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_1000059F4( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_100005A08(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

void sub_100005A1C(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

  ;
}

char *sub_100005A4C()
{
  return mach_error_string(v0);
}

  ;
}

uint64_t sub_100005A60(_DWORD *a1, uint64_t a2)
{
  int v2 = a1[5];
  if (v2 < 60000 || v2 >= 60003) {
    return 0LL;
  }
  uint64_t v5 = (_DWORD *)((char *)a1 + ((a1[1] + 3LL) & 0x1FFFFFFFCLL));
  if (*v5 || v5[1] < 0x14u) {
    int v6 = -1;
  }
  else {
    int v6 = v5[3];
  }
  dword_10000C040 = v6;
  return sub_1000062C8(a1, a2);
}

void sub_100005AC0(uint64_t a1, mach_msg_header_t *a2)
{
  uint64_t v3 = (mach_msg_header_t *)CFAllocatorAllocate(0LL, 56LL, 0LL);
  uint64_t v4 = v3;
  if (v3) {
    bzero(v3, 0x38uLL);
  }
  sub_100005A60(a2, (uint64_t)v4);
  if ((v4->msgh_bits & 0x80000000) == 0)
  {
    mach_port_t msgh_remote_port = v4[1].msgh_remote_port;
    if (msgh_remote_port == -305) {
      goto LABEL_13;
    }
    if (msgh_remote_port)
    {
      a2->mach_port_t msgh_remote_port = 0;
      mach_msg_destroy(a2);
    }
  }

  if (!v4->msgh_remote_port)
  {
    if ((v4->msgh_bits & 0x80000000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }

  if ((v4->msgh_bits & 0x1F) == 0x12) {
    mach_msg_option_t v6 = 17;
  }
  else {
    mach_msg_option_t v6 = 1;
  }
  if ((mach_msg(v4, v6, v4->msgh_size, 0, 0, 0, 0) - 268435459) <= 1) {
LABEL_12:
  }
    mach_msg_destroy(v4);
LABEL_13:
  CFAllocatorDeallocate(0LL, v4);
}

uint64_t sub_100005BA4(mach_port_t a1, int a2, uint64_t a3, int a4)
{
  int v10 = 1;
  uint64_t v11 = a3;
  int v12 = 16777472;
  int v13 = a4;
  NDR_record_t v14 = NDR_record;
  int v15 = a2;
  int v16 = a4;
  mach_port_t reply_port = mig_get_reply_port();
  msg.mach_port_t msgh_remote_port = a1;
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

uint64_t sub_100005D18(mach_port_t a1, int a2, void *a3, _DWORD *a4)
{
  *(NDR_record_t *)int v13 = NDR_record;
  *(_DWORD *)&v13[8] = a2;
  mach_port_t reply_port = mig_get_reply_port();
  msg.mach_port_t msgh_remote_port = a1;
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

uint64_t sub_100005EDC(mach_port_t a1, int a2, void *a3, _DWORD *a4)
{
  *(NDR_record_t *)int v13 = NDR_record;
  *(_DWORD *)&v13[8] = a2;
  mach_port_t reply_port = mig_get_reply_port();
  msg.mach_port_t msgh_remote_port = a1;
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

uint64_t sub_1000060A0(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 20);
  else {
    return 0LL;
  }
}

uint64_t sub_1000060DC(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 60)
  {
    int v3 = -304;
LABEL_8:
    *(_DWORD *)(a2 + 32) = v3;
    goto LABEL_9;
  }

  if (*(_BYTE *)(result + 39) != 1 || *(_DWORD *)(result + 40) != *(_DWORD *)(result + 56))
  {
    int v3 = -300;
    goto LABEL_8;
  }

  uint64_t result = sub_1000038C8(*(_DWORD *)(result + 12), *(_DWORD *)(result + 52), *(char **)(result + 28));
  *(_DWORD *)(a2 + 32) = result;
LABEL_9:
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

_DWORD *sub_100006170(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 36)
  {
    *(_DWORD *)(a2 + 32) = -304;
    goto LABEL_6;
  }

  *(_DWORD *)(a2 + 36) = 16777473;
  uint64_t result = (_DWORD *)sub_100003988(result[3], result[8], (vm_address_t *)(a2 + 28), (size_t *)(a2 + 52));
  if ((_DWORD)result)
  {
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
LABEL_6:
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return result;
  }

  *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
  *(NDR_record_t *)(a2 + 44) = NDR_record;
  *(_DWORD *)a2 |= 0x80000000;
  *(_DWORD *)(a2 + 4) = 56;
  *(_DWORD *)(a2 + 24) = 1;
  return result;
}

_DWORD *sub_10000621C(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 36)
  {
    *(_DWORD *)(a2 + 32) = -304;
    goto LABEL_6;
  }

  *(_DWORD *)(a2 + 36) = 16777473;
  uint64_t result = (_DWORD *)sub_100003A98(result[3], result[8], (vm_address_t *)(a2 + 28), (size_t *)(a2 + 52));
  if ((_DWORD)result)
  {
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
LABEL_6:
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return result;
  }

  *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
  *(NDR_record_t *)(a2 + 44) = NDR_record;
  *(_DWORD *)a2 |= 0x80000000;
  *(_DWORD *)(a2 + 4) = 56;
  *(_DWORD *)(a2 + 24) = 1;
  return result;
}

uint64_t sub_1000062C8(_DWORD *a1, uint64_t a2)
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
  if ((v4 - 60003) >= 0xFFFFFFFD
    && (uint64_t v5 = (void (*)(void))*(&off_100008568 + 5 * (v4 - 60000) + 5)) != 0LL)
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

void sub_100006358(int a1, os_log_s *a2)
{
  int v2 = 136315394;
  int v3 = "com.apple.IOUPSPlugInServer";
  __int16 v4 = 1024;
  int v5 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "ioupsd: bootstrap_check_in %s error = %d\n",  (uint8_t *)&v2,  0x12u);
  sub_100005A58();
}

void sub_1000063DC( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100006440()
{
}

void sub_10000646C()
{
  sub_100005A08( (void *)&_mh_execute_header,  v0,  v1,  "IsCurrentLimitControlRequired: invalid UPS struct upsData=%p, storeDict%p\n",  v2,  v3);
  sub_100005A58();
}

void sub_1000064DC()
{
  sub_100005A08( (void *)&_mh_execute_header,  v0,  v1,  "AreAverageChargeCurrentUpdatesRequired: invalid UPS struct upsData=%p, storeDict%p\n",  v2,  v3);
  sub_100005A58();
}

void sub_10000654C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000065B8(void *a1)
{
  id v2 = a1;
  sub_100005A4C();
  sub_1000059F4( (void *)&_mh_execute_header,  v3,  v4,  "could not open IOAccessoryManager service: %s\n",  v5,  v6,  v7,  v8,  2u);

  sub_100005A40();
}

void sub_100006630()
{
}

void sub_10000665C(uint64_t a1, unsigned __int8 *a2, os_log_t log)
{
  int v3 = *(_DWORD *)(a1 + 24);
  int v4 = *a2;
  int v5 = a2[1];
  int v6 = a2[2];
  int v7 = a2[3];
  int v8 = a2[4];
  int v9 = a2[5];
  v10[0] = 67110656;
  v10[1] = v3;
  __int16 v11 = 1024;
  int v12 = v4;
  __int16 v13 = 1024;
  int v14 = v5;
  __int16 v15 = 1024;
  int v16 = v6;
  __int16 v17 = 1024;
  int v18 = v7;
  __int16 v19 = 1024;
  int v20 = v8;
  __int16 v21 = 1024;
  int v22 = v9;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "assigning battery case (ID=%d) new address: %02x %02x %02x %0x %02x %02x\n",  (uint8_t *)v10,  0x2Cu);
}

void sub_100006724()
{
}

void sub_100006750()
{
}

void sub_10000677C(uint8_t *a1, _BYTE *a2, os_log_s *a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_100005A1C((void *)&_mh_execute_header, a3, (uint64_t)a3, "UPSDeviceAdded: isInductive: Created\n", a1);
}

void sub_1000067B0(uint8_t *a1, _BYTE *a2, os_log_s *a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_100005A1C((void *)&_mh_execute_header, a3, (uint64_t)a3, "UPSDeviceAdded: isInductive\n", a1);
}

void sub_1000067E4()
{
  uint64_t v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "CFStringRef softACCConnectionInfoCopyLocalizedAccessoryNameCF(CFStringRef)"));
  objc_msgSend( v0,  "handleFailureInFunction:file:lineNumber:description:",  v1,  @"upsd.m",  76,  @"%s",  dlerror());

  __break(1u);
}

void sub_100006858()
{
}

void sub_100006884()
{
}

void sub_1000068B4()
{
}

void sub_1000068E0()
{
}

void sub_10000690C()
{
}

void sub_100006938()
{
}

void sub_100006964(int a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "HandleACStateChange: ACPowerValue:%d\n",  (uint8_t *)v2,  8u);
  sub_1000059D0();
}

void sub_1000069D4()
{
}

void sub_100006A00()
{
}

void sub_100006A2C( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100006A90(void *a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "void *CoreAccessoriesLibrary(void)"));
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"upsd.m", 74, @"%s", *a1);

  __break(1u);
  CFAbsoluteTimeGetCurrent();
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}