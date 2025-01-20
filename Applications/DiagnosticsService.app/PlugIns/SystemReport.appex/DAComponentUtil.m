@interface DAComponentUtil
+ (BOOL)IORegistryNameExists:(id)a3 optionalKey:(id)a4;
+ (BOOL)IORegistryNameExists:(id)a3 optionalKey:(id)a4 passingValidator:(id)a5;
+ (id)getIORegistryClass:(id)a3 property:(id)a4 optionalKey:(id)a5;
+ (id)getIORegistryClass:(id)a3 property:(id)a4 optionalKey:(id)a5 classValidator:(id)a6;
+ (id)getIORegistryName:(id)a3 property:(id)a4 optionalKey:(id)a5;
+ (id)getIORegistryName:(id)a3 property:(id)a4 optionalKey:(id)a5 classValidator:(id)a6;
+ (id)getIOServicePropertiesWithMatchingDictionary:(id)a3;
+ (id)getIOregData:(const char *)a3 property:(__CFString *)a4 length:(int)a5 optionalKey:(const __CFString *)a6;
+ (id)getMatchingDict:(__CFDictionary *)a3 property:(id)a4 optionalKey:(id)a5 optionalClassValidator:(id)a6;
+ (id)sharedInstance;
+ (unsigned)getIOService:(__CFDictionary *)a3 optionalKey:(id)a4 optionalClassValidator:(id)a5;
@end

@implementation DAComponentUtil

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001B6D0;
  block[3] = &unk_100060600;
  block[4] = a1;
  if (qword_100091F30 != -1) {
    dispatch_once(&qword_100091F30, block);
  }
  return (id)qword_100091F38;
}

+ (id)getIOregData:(const char *)a3 property:(__CFString *)a4 length:(int)a5 optionalKey:(const __CFString *)a6
{
  CFMutableDictionaryRef v10 = IOServiceMatching(a3);
  if (!v10)
  {
    uint64_t v22 = DiagnosticLogHandleForCategory(6LL);
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    if (!os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_ERROR))
    {
LABEL_13:

      return 0LL;
    }

    *(_DWORD *)v34 = 136315138;
    *(void *)&v34[4] = a3;
    v24 = "Class %s not found";
LABEL_27:
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v23, OS_LOG_TYPE_ERROR, v24, v34, 0xCu);
    goto LABEL_13;
  }

  v11 = v10;
  if (a6)
  {
    *(void *)v34 = a6;
    CFDictionaryRef v12 = CFDictionaryCreate( kCFAllocatorDefault,  (const void **)v34,  (const void **)&kCFBooleanTrue,  1LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    CFDictionarySetValue(v11, @"IONameMatch", v12);
    CFRelease(v12);
  }

  io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v11);
  if (!MatchingService)
  {
    uint64_t v25 = DiagnosticLogHandleForCategory(6LL);
    v23 = (void *)objc_claimAutoreleasedReturnValue(v25);
    if (!os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    *(_DWORD *)v34 = 136315138;
    *(void *)&v34[4] = a3;
    v24 = "IO service for %s not found";
    goto LABEL_27;
  }

  io_object_t v14 = MatchingService;
  CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(MatchingService, a4, kCFAllocatorDefault, 0);
  if (CFProperty)
  {
    v16 = CFProperty;
    CFTypeID v17 = CFGetTypeID(CFProperty);
    if (v17 == CFDataGetTypeID())
    {
      v18 = +[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", CFDataGetBytePtr(v16), a5);
      v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      uint64_t v20 = DiagnosticLogHandleForCategory(6LL);
      v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v34 = 0;
        _os_log_debug_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "   Got CFData", v34, 2u);
      }
    }

    else
    {
      CFTypeID v29 = CFGetTypeID(v16);
      CFTypeID TypeID = CFStringGetTypeID();
      uint64_t v31 = DiagnosticLogHandleForCategory(6LL);
      v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
      v33 = v32;
      if (v29 == TypeID)
      {
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v34 = 0;
          _os_log_debug_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEBUG, "   Got CFString", v34, 2u);
        }

        v19 = (void *)objc_claimAutoreleasedReturnValue(-[__CFData dataUsingEncoding:](v16, "dataUsingEncoding:", 4LL));
      }

      else
      {
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v34 = 0;
          _os_log_error_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_ERROR,  "Unsupported type from ioreg",  v34,  2u);
        }

        v19 = 0LL;
      }
    }

    CFRelease(v16);
  }

  else
  {
    uint64_t v27 = DiagnosticLogHandleForCategory(6LL);
    v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v34 = 138412290;
      *(void *)&v34[4] = a4;
      _os_log_error_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_ERROR,  "ioreg entry %@ does not exist",  v34,  0xCu);
    }

    v19 = 0LL;
  }

  IOObjectRelease(v14);
  return v19;
}

+ (id)getIORegistryClass:(id)a3 property:(id)a4 optionalKey:(id)a5
{
  return +[DAComponentUtil getIORegistryClass:property:optionalKey:classValidator:]( &OBJC_CLASS___DAComponentUtil,  "getIORegistryClass:property:optionalKey:classValidator:",  a3,  a4,  a5,  0LL);
}

+ (id)getIORegistryClass:(id)a3 property:(id)a4 optionalKey:(id)a5 classValidator:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  CFMutableDictionaryRef v14 = IOServiceMatching((const char *)[v10 UTF8String]);
  v15 = (void *)objc_claimAutoreleasedReturnValue([a1 getMatchingDict:v14 property:v13 optionalKey:v12 optionalClassValidator:v11]);

  if (v14) {
    CFRelease(v14);
  }
  return v15;
}

+ (id)getIORegistryName:(id)a3 property:(id)a4 optionalKey:(id)a5
{
  return +[DAComponentUtil getIORegistryName:property:optionalKey:classValidator:]( &OBJC_CLASS___DAComponentUtil,  "getIORegistryName:property:optionalKey:classValidator:",  a3,  a4,  a5,  0LL);
}

+ (id)getIORegistryName:(id)a3 property:(id)a4 optionalKey:(id)a5 classValidator:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  CFMutableDictionaryRef v14 = IOServiceNameMatching((const char *)[v10 UTF8String]);
  v15 = (void *)objc_claimAutoreleasedReturnValue([a1 getMatchingDict:v14 property:v13 optionalKey:v12 optionalClassValidator:v11]);

  if (v14) {
    CFRelease(v14);
  }
  return v15;
}

+ (BOOL)IORegistryNameExists:(id)a3 optionalKey:(id)a4
{
  return +[DAComponentUtil IORegistryNameExists:optionalKey:passingValidator:]( &OBJC_CLASS___DAComponentUtil,  "IORegistryNameExists:optionalKey:passingValidator:",  a3,  a4,  0LL);
}

+ (BOOL)IORegistryNameExists:(id)a3 optionalKey:(id)a4 passingValidator:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  CFMutableDictionaryRef v10 = IOServiceNameMatching((const char *)[v7 UTF8String]);
  io_object_t v11 = +[DAComponentUtil getIOService:optionalKey:optionalClassValidator:]( &OBJC_CLASS___DAComponentUtil,  "getIOService:optionalKey:optionalClassValidator:",  v10,  v9,  v8);

  if (v10) {
    CFRelease(v10);
  }
  if (v11) {
    IOObjectRelease(v11);
  }
  return v11 != 0;
}

+ (unsigned)getIOService:(__CFDictionary *)a3 optionalKey:(id)a4 optionalClassValidator:(id)a5
{
  kern_return_t MatchingServices;
  uint64_t v11;
  uint8_t v13[4];
  io_iterator_t existing;
  void *keys;
  id v7 = a4;
  id v8 = (unsigned int (**)(id, __CFDictionary *))a5;
  if (a3)
  {
    CFRetain(a3);
    if (v7)
    {
      keys = (void *)CFStringCreateWithCString( 0, (const char *)[v7 UTF8String], 0x8000100u);
      CFDictionaryRef v9 = CFDictionaryCreate( kCFAllocatorDefault,  (const void **)&keys,  (const void **)&kCFBooleanTrue,  1LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
      CFDictionarySetValue(a3, @"IONameMatch", v9);
      CFRelease(v9);
      CFRelease(keys);
    }

    existing = 0;
    MatchingServices = IOServiceGetMatchingServices(kIOMainPortDefault, a3, &existing);
    LODWORD(a3) = 0;
    if (!MatchingServices)
    {
      if (v8)
      {
        do
          a3 = (__CFDictionary *)IOIteratorNext(existing);
        while ((_DWORD)a3 && !v8[2](v8, a3));
      }

      else
      {
        LODWORD(a3) = IOIteratorNext(existing);
      }
    }
  }

  else
  {
    io_object_t v11 = DiagnosticLogHandleForCategory(6LL);
    a3 = (__CFDictionary *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(a3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v13 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Class/name not found", v13, 2u);
    }

    LODWORD(a3) = 0;
  }

  return a3;
}

+ (id)getMatchingDict:(__CFDictionary *)a3 property:(id)a4 optionalKey:(id)a5 optionalClassValidator:(id)a6
{
  CFDictionaryRef v9 = (__CFString *)a4;
  io_registry_entry_t v10 = +[DAComponentUtil getIOService:optionalKey:optionalClassValidator:]( &OBJC_CLASS___DAComponentUtil,  "getIOService:optionalKey:optionalClassValidator:",  a3,  a5,  a6);
  if (v10)
  {
    io_object_t v11 = v10;
    CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(v10, v9, kCFAllocatorDefault, 0);
    if (!CFProperty)
    {
      uint64_t v22 = DiagnosticLogHandleForCategory(6LL);
      v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "ioreg entry does not exist", buf, 2u);
      }

      CFTypeID v17 = 0LL;
      goto LABEL_25;
    }

    id v13 = CFProperty;
    CFTypeID v14 = CFGetTypeID(CFProperty);
    if (v14 == CFDataGetTypeID())
    {
      BytePtr = CFDataGetBytePtr(v13);
      v16 = +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  BytePtr,  CFDataGetLength(v13));
      CFTypeID v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      uint64_t v18 = DiagnosticLogHandleForCategory(6LL);
      v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      if (!os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_DEBUG))
      {
LABEL_5:

LABEL_24:
        CFRelease(v13);
LABEL_25:
        IOObjectRelease(v11);
        goto LABEL_26;
      }

      *(_WORD *)buf = 0;
      CFTypeID v29 = "   Got CFData";
    }

    else
    {
      CFTypeID v24 = CFGetTypeID(v13);
      if (v24 == CFStringGetTypeID())
      {
        uint64_t v25 = DiagnosticLogHandleForCategory(6LL);
        v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "   Got CFString", buf, 2u);
        }

        CFTypeID v17 = (void *)objc_claimAutoreleasedReturnValue(-[__CFData dataUsingEncoding:](v13, "dataUsingEncoding:", 4LL));
        goto LABEL_24;
      }

      CFTypeID v27 = CFGetTypeID(v13);
      if (v27 != CFBooleanGetTypeID())
      {
        CFTypeID v30 = CFGetTypeID(v13);
        if (v30 != CFNumberGetTypeID() || CFNumberIsFloatType(v13))
        {
          uint64_t v31 = DiagnosticLogHandleForCategory(6LL);
          v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_ERROR,  "Unsupported type from ioreg",  buf,  2u);
          }

          CFTypeID v17 = 0LL;
          goto LABEL_24;
        }

        CFNumberGetValue(v13, kCFNumberNSIntegerType, buf);
        CFTypeID v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", buf, 8LL));
        uint64_t v35 = DiagnosticLogHandleForCategory(6LL);
        v19 = (void *)objc_claimAutoreleasedReturnValue(v35);
        if (!os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_5;
        }
        v36[0] = 0;
        CFTypeID v29 = "   Got Float";
        v34 = (uint8_t *)v36;
        goto LABEL_29;
      }

      LOBYTE(v36[0]) = CFBooleanGetValue(v13);
      CFTypeID v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v36, 1LL));
      uint64_t v28 = DiagnosticLogHandleForCategory(6LL);
      v19 = (void *)objc_claimAutoreleasedReturnValue(v28);
      if (!os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_5;
      }
      *(_WORD *)buf = 0;
      CFTypeID v29 = "   Got Boolean";
    }

    v34 = buf;
LABEL_29:
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)v19, OS_LOG_TYPE_DEBUG, v29, v34, 2u);
    goto LABEL_5;
  }

  uint64_t v20 = DiagnosticLogHandleForCategory(6LL);
  v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "IO service not found", buf, 2u);
  }

  CFTypeID v17 = 0LL;
LABEL_26:

  return v17;
}

+ (id)getIOServicePropertiesWithMatchingDictionary:(id)a3
{
  kern_return_t CFProperties;
  uint64_t v7;
  os_log_s *v8;
  const char *v9;
  uint8_t *v10;
  os_log_s *v11;
  uint32_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v17;
  _BYTE properties[24];
  v3 = (const __CFDictionary *)a3;
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v3);
  if (MatchingService)
  {
    io_object_t v5 = MatchingService;
    *(void *)properties = 0LL;
    CFProperties = IORegistryEntryCreateCFProperties(MatchingService, (CFMutableDictionaryRef *)properties, 0LL, 0);
    IOObjectRelease(v5);
    if (!CFProperties)
    {
      CFTypeID v14 = *(void **)properties;
      goto LABEL_8;
    }

    id v7 = DiagnosticLogHandleForCategory(6LL);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v17) = 0;
      CFDictionaryRef v9 = "[ERROR] Could not create properties";
      io_registry_entry_t v10 = (uint8_t *)&v17;
      io_object_t v11 = v8;
      id v12 = 2;
LABEL_10:
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, v9, v10, v12);
    }
  }

  else
  {
    id v13 = DiagnosticLogHandleForCategory(6LL);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)properties = 138412290;
      *(void *)&properties[4] = v3;
      CFDictionaryRef v9 = "[ERROR] Could not find the service matched by: %@";
      io_registry_entry_t v10 = properties;
      io_object_t v11 = v8;
      id v12 = 12;
      goto LABEL_10;
    }
  }

  CFTypeID v14 = 0LL;
LABEL_8:
  v15 = objc_msgSend(v14, "copy", v17);

  return v15;
}

@end