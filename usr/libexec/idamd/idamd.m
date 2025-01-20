void sub_100002F5C()
{
  CFMutableDictionaryRef v0;
  __CFDictionary *v1;
  __CFDictionary *Mutable;
  __CFDictionary *v3;
  io_service_t MatchingService;
  os_log_s *v5;
  CFUUIDRef v6;
  CFUUIDRef v7;
  kern_return_t v8;
  kern_return_t v9;
  uint64_t v10;
  const char *v11;
  os_log_s *v12;
  uint32_t v13;
  uint64_t v14;
  os_log_s *v15;
  IOCFPlugInInterface **v16;
  HRESULT (__cdecl *QueryInterface)(void *, REFIID, LPVOID *);
  CFUUIDRef v18;
  CFUUIDBytes v19;
  int v20;
  uint64_t v21;
  kern_return_t v22;
  kern_return_t v23;
  os_log_s *v24;
  SInt32 theScore;
  IOCFPlugInInterface **theInterface;
  uint64_t v27;
  uint8_t buf[4];
  kern_return_t v29;
  theInterface = 0LL;
  v27 = 0LL;
  v0 = IOServiceMatching("IOUSBDeviceInterface");
  if (!v0)
  {
    v14 = qword_100008000;
    if (!os_log_type_enabled((os_log_t)qword_100008000, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    *(_WORD *)buf = 0;
    v11 = "Failed to create matchingDict";
    v12 = (os_log_s *)v14;
    v13 = 2;
    goto LABEL_11;
  }

  v1 = v0;
  Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  if (Mutable)
  {
    v3 = Mutable;
    CFDictionarySetValue(Mutable, @"USBDeviceFunction", @"IDAMInterface");
    CFDictionarySetValue(v1, @"IOPropertyMatch", v3);
    CFRelease(v3);
    MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v1);
    if (!MatchingService)
    {
      v5 = (os_log_s *)qword_100008000;
      if (os_log_type_enabled((os_log_t)qword_100008000, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Unable to find a matching service!",  buf,  2u);
      }
    }

    v6 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0x9Eu,  0x72u,  0x21u,  0x7Eu,  0x8Au,  0x60u,  0x11u,  0xDBu,  0xBFu,  0x57u,  0,  0xDu,  0x93u,  0x6Du,  6u,  0xD2u);
    v7 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0xC2u,  0x44u,  0xE8u,  0x58u,  0x10u,  0x9Cu,  0x11u,  0xD4u,  0x91u,  0xD4u,  0,  0x50u,  0xE4u,  0xC6u,  0x42u,  0x6Fu);
    v8 = IOCreatePlugInInterfaceForService(MatchingService, v6, v7, &theInterface, &theScore);
    if (v8)
    {
      v9 = v8;
      v10 = qword_100008000;
      if (!os_log_type_enabled((os_log_t)qword_100008000, OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      *(_DWORD *)buf = 67109120;
      v29 = v9;
      v11 = "IOCreatePlugInInterfaceForService failed: 0x%08x";
      v12 = (os_log_s *)v10;
      v13 = 8;
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
      return;
    }

    v16 = theInterface;
    QueryInterface = (*theInterface)->QueryInterface;
    v18 = CFUUIDGetConstantUUIDWithBytes( 0LL,  0xEAu,  0x33u,  0xBAu,  0x4Fu,  0x8Au,  0x60u,  0x11u,  0xDBu,  0x84u,  0xDBu,  0,  0xDu,  0x93u,  0x6Du,  6u,  0xD2u);
    v19 = CFUUIDGetUUIDBytes(v18);
    v20 = ((uint64_t (*)(IOCFPlugInInterface **, void, void, uint64_t *))QueryInterface)( v16,  *(void *)&v19.byte0,  *(void *)&v19.byte8,  &v27);
    v21 = v27;
    if (!v20 && v27)
    {
      v22 = (*(uint64_t (**)(void))(*(void *)v27 + 248LL))();
      if (v22)
      {
        v23 = v22;
        v24 = (os_log_s *)qword_100008000;
        if (os_log_type_enabled((os_log_t)qword_100008000, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          v29 = v23;
          _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "com.apple.idamd couldn't set the IDAM configuration due to error 0x%x",  buf,  8u);
        }
      }

      else
      {
        syslog(5, "com.apple.idamd set IDAM configuration.");
      }

      v21 = v27;
    }

    if (v21) {
      (*(void (**)(uint64_t))(*(void *)v21 + 24LL))(v21);
    }
    if (theInterface) {
      IODestroyPlugInInterface(theInterface);
    }
  }

  else
  {
    v15 = (os_log_s *)qword_100008000;
    if (os_log_type_enabled((os_log_t)qword_100008000, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Failed CFDictionaryCreateMutable", buf, 2u);
    }

    CFRelease(v1);
  }
}

uint64_t sub_100003308()
{
  CFTypeRef cf = 0LL;
  uint64_t v0 = IOUSBDeviceControllerCreate(kCFAllocatorDefault, &cf);
  v1 = (os_log_s *)qword_100008000;
  BOOL v2 = os_log_type_enabled((os_log_t)qword_100008000, OS_LOG_TYPE_DEFAULT);
  if ((_DWORD)v0)
  {
    if (v2)
    {
      *(_DWORD *)buf = 67109120;
      int v6 = v0;
      _os_log_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_DEFAULT,  "com.apple.idamd couldn't create an IOUSBDeviceControllerRef due to error 0x%x",  buf,  8u);
    }
  }

  else
  {
    if (v2)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_DEFAULT,  "com.apple.idamd set default USB configuration.",  buf,  2u);
    }

    IOUSBDeviceControllerGoOffAndOnBus(cf, 10LL);
    CFRelease(cf);
  }

  return v0;
}

BOOL sub_100003408()
{
  uint64_t v0 = IOServiceMatching("AppleUSBDeviceAudioDevice");
  if (v0) {
    BOOL v1 = IOServiceGetMatchingService(kIOMasterPortDefault, v0) != 0;
  }
  else {
    BOOL v1 = 0LL;
  }
  BOOL v2 = (os_log_s *)qword_100008000;
  if (os_log_type_enabled((os_log_t)qword_100008000, OS_LOG_TYPE_DEFAULT))
  {
    v3 = "false";
    if (v1) {
      v3 = "true";
    }
    int v5 = 136315138;
    int v6 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "inIDAMConfiguration returning %s",  (uint8_t *)&v5,  0xCu);
  }

  return v1;
}

void sub_1000034F0(uint64_t a1)
{
  while (1)
  {
    Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0LL, 0LL, 0LL);
    *(void *)CFTypeRef cf = 0LL;
    int v3 = lockdown_receive_message(a1, cf);
    v4 = *(const void **)cf;
    if (!v3 && *(void *)cf)
    {
      CFTypeID v5 = CFGetTypeID(*(CFTypeRef *)cf);
      if (v5 == CFDictionaryGetTypeID())
      {
        int v6 = (os_log_s *)qword_100008000;
        if (os_log_type_enabled((os_log_t)qword_100008000, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "lockdown_receive_message received a plist mesage.\n",  buf,  2u);
        }

        Copy = CFDictionaryCreateCopy(kCFAllocatorDefault, *(CFDictionaryRef *)cf);
LABEL_11:
        v4 = *(const void **)cf;
        if (!*(void *)cf) {
          goto LABEL_13;
        }
LABEL_12:
        CFRelease(v4);
        goto LABEL_13;
      }

LABEL_10:
      Copy = 0LL;
      goto LABEL_11;
    }

    if (v3)
    {
      v8 = (os_log_s *)qword_100008000;
      if (os_log_type_enabled((os_log_t)qword_100008000, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        int v27 = v3;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "lockdown_receive_message returned error %x\n",  buf,  8u);
      }

      goto LABEL_10;
    }

    Copy = 0LL;
    if (*(void *)cf) {
      goto LABEL_12;
    }
LABEL_13:
    if (!Copy) {
      break;
    }
    int v9 = CFDictionaryContainsKey(Copy, @"Configuration Inquiry");
    if (v9)
    {
      BOOL v10 = sub_100003408();
      v11 = (os_log_s *)qword_100008000;
      if (os_log_type_enabled((os_log_t)qword_100008000, OS_LOG_TYPE_DEFAULT))
      {
        v12 = "Default";
        if (v10) {
          v12 = "IDAM";
        }
        *(_DWORD *)CFTypeRef cf = 136315138;
        *(void *)&cf[4] = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Configuration Inquiry -> %s configuration\n",  cf,  0xCu);
      }

      if (v10) {
        CFBooleanRef v13 = kCFBooleanTrue;
      }
      else {
        CFBooleanRef v13 = kCFBooleanFalse;
      }
      CFDictionaryAddValue(Mutable, @"IDAM Configuration Active", v13);
      int v14 = MGGetSInt32Answer(@"DeviceClassNumber", 0LL);
      if ((MGGetBoolAnswer(@"s+gaKNe68Gs3PfqKrZhi1w") & 1) != 0
        || (CFBooleanRef v17 = kCFBooleanFalse, (v14 - 1) >= 4) && (CFBooleanRef v17 = kCFBooleanFalse, v14 != 7))
      {
        v15 = (os_log_s *)qword_100008000;
        BOOL v16 = os_log_type_enabled((os_log_t)qword_100008000, OS_LOG_TYPE_DEFAULT);
        CFBooleanRef v17 = kCFBooleanTrue;
        if (v16)
        {
          *(_WORD *)CFTypeRef cf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Configuration Inquiry -> Low End Hardware",  cf,  2u);
          CFBooleanRef v17 = kCFBooleanTrue;
        }
      }

      CFDictionaryAddValue(Mutable, @"Low End Hardware", v17);
    }

    if (!CFDictionaryContainsKey(Copy, @"Set IDAM Configuration")
      || (Value = (const __CFBoolean *)CFDictionaryGetValue(Copy, @"Set IDAM Configuration")) == 0LL)
    {
LABEL_37:
      if (!v9) {
        goto LABEL_41;
      }
LABEL_38:
      int v21 = lockdown_send_message(a1, Mutable, 200LL);
      if (v21)
      {
        int v22 = v21;
        v23 = (os_log_s *)qword_100008000;
        if (os_log_type_enabled((os_log_t)qword_100008000, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)CFTypeRef cf = 67109120;
          *(_DWORD *)&cf[4] = v22;
          _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Got error %x from lockdown_send_message\n",  cf,  8u);
        }
      }

      goto LABEL_41;
    }

    v19 = Value;
    if (CFBooleanGetValue(Value))
    {
      v20 = (os_log_s *)qword_100008000;
      if (os_log_type_enabled((os_log_t)qword_100008000, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)CFTypeRef cf = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Set IDAM Configuration -> TRUE\n", cf, 2u);
      }

      sub_100002F5C();
      if (v9) {
        goto LABEL_38;
      }
    }

    else
    {
      if (CFBooleanGetValue(v19)) {
        goto LABEL_37;
      }
      v24 = (os_log_s *)qword_100008000;
      if (os_log_type_enabled((os_log_t)qword_100008000, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)CFTypeRef cf = 0;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Set IDAM Configuration -> FALSE\n", cf, 2u);
      }

      sub_100003308();
      if (v9) {
        goto LABEL_38;
      }
    }

LABEL_41:
    CFRelease(Copy);
    CFRelease(Mutable);
  }

  CFRelease(Mutable);
}

void start()
{
  uint64_t v0 = (os_log_s *)qword_100008000;
  if (os_log_type_enabled((os_log_t)qword_100008000, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v1 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v0,  OS_LOG_TYPE_DEFAULT,  "com.apple.idamd now checked in with lockdown.",  v1,  2u);
  }

  dispatch_main();
}

void sub_100003990(id a1, _lockdown_connection *a2, __CFDictionary *a3)
{
}

os_log_t sub_1000039B8()
{
  os_log_t result = os_log_create("com.apple.idamd", "idam");
  qword_100008000 = (uint64_t)result;
  return result;
}