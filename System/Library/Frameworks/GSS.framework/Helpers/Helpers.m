void sub_100001780( int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, int a14, int a15, id a16)
{
  void *context;
  id location;
  char v18;
  id v19;
  context = objc_autoreleasePoolPush();
  v18 = 0;
  v19 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);

  CFDictionaryApplyFunction((CFDictionaryRef)qword_100024F40, (CFDictionaryApplierFunction)sub_1000019A4, v19);
  location = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  CFDictionaryApplyFunction((CFDictionaryRef)qword_100024F48, (CFDictionaryApplierFunction)sub_100001BC0, location);
  [v19 setObject:location forKeyedSubscript:off_100024D28];
  +[HeimCredDecoder archiveRootObject:toFile:]( &OBJC_CLASS___HeimCredDecoder,  "archiveRootObject:toFile:",  v19,  qword_100024E78);
  objc_storeStrong(&location, 0LL);
  if ((v18 & 1) != 0)
  {
    objc_exception_rethrow();
    __break(1u);
  }

  objc_storeStrong(&v19, 0LL);
  objc_autoreleasePoolPop(context);
}

void sub_1000019A4( uint64_t a1, uint64_t a2, void *a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, int a18, int a19, id a20)
{
  uint64_t v24 = a1;
  uint64_t v23 = a2;
  v22[1] = a3;
  v22[0] = a3;
  id location = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);

  CFDictionaryApplyFunction(*(CFDictionaryRef *)(v23 + 24), (CFDictionaryApplierFunction)sub_100001BC0, location);
  v20 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", *(unsigned int *)(v23 + 16));
  objc_msgSend(v22[0], "setObject:forKey:", location);

  objc_storeStrong(&location, 0LL);
  objc_storeStrong(v22, 0LL);
}

void sub_100001BC0(uint64_t a1, char *a2, void *a3)
{
  uint64_t v15 = a1;
  v14 = a2;
  v13[1] = a3;
  v13[0] = a3;
  v12 = v14;
  CFRetain(v14);
  id v11 = +[HeimCredDecoder copyCF2NS:](&OBJC_CLASS___HeimCredDecoder, "copyCF2NS:", v15);
  id v10 = 0LL;
  if (sub_10000CD30((uint64_t)v14))
  {
    pthread_mutex_lock((pthread_mutex_t *)(v12 + 40));
    CFDateRef value = CFDateCreate(0LL, (double)*((uint64_t *)v12 + 16) - kCFAbsoluteTimeIntervalSince1970);
    CFNumberRef cf = CFNumberCreate(0LL, kCFNumberIntType, v12 + 144);
    pthread_mutex_unlock((pthread_mutex_t *)(v12 + 40));
    theDict = CFDictionaryCreateMutableCopy(0LL, 0LL, *((CFDictionaryRef *)v12 + 3));
    CFDictionarySetValue(theDict, @"kHEIMAttrExpire", value);
    CFDictionarySetValue(theDict, @"kHEIMAttrStatus", cf);
    id v3 = +[HeimCredDecoder copyCF2NS:](&OBJC_CLASS___HeimCredDecoder, "copyCF2NS:", theDict);
    id v4 = v10;
    id v10 = v3;

    if (theDict) {
      CFRelease(theDict);
    }
    if (value) {
      CFRelease(value);
    }
    if (cf) {
      CFRelease(cf);
    }
  }

  else
  {
    id v5 = +[HeimCredDecoder copyCF2NS:](&OBJC_CLASS___HeimCredDecoder, "copyCF2NS:", *((void *)v12 + 3));
    id v6 = v10;
    id v10 = v5;
  }

  CFRelease(v12);
  [v13[0] setObject:v10 forKey:v11];
  objc_storeStrong(&v10, 0LL);
  objc_storeStrong(&v11, 0LL);
  objc_storeStrong(v13, 0LL);
}

void sub_100001E14()
{
  v0 = &_dispatch_main_q;
  dispatch_async(v0, &stru_100020990);
}

void sub_100001E58(id a1)
{
  id v11 = a1;
  id v10 = a1;
  if (!dword_100024F78)
  {
    unint64_t v9 = sub_100001FF8();
    if (v9 >= qword_100024F70) {
      unint64_t v8 = v9 - qword_100024F70;
    }
    else {
      unint64_t v8 = 500000000LL;
    }
    id location = sub_10000EABC();
    char v6 = 2;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEBUG))
    {
      log = (os_log_s *)location;
      os_log_type_t type = v6;
      sub_100002064(v5);
      _os_log_debug_impl((void *)&_mh_execute_header, log, type, "sending cache changed notification", v5, 2u);
    }

    objc_storeStrong(&location, 0LL);
    if (v8 < 0x1DCD6500)
    {
      dword_100024F78 = 1;
      dispatch_time_t when = dispatch_time(0LL, 500000000 - v8);
      v2 = &_dispatch_main_q;
      dispatch_after(when, v2, &stru_1000209B0);
    }

    else
    {
      notify_post("com.apple.Kerberos.cache.changed");
      qword_100024F70 = v9;
    }
  }
}

uint64_t sub_100001FF8()
{
  uint64_t v2 = mach_absolute_time();
  if (!qword_100024F80)
  {
    mach_timebase_info(&v1);
    qword_100024F80 = v1.numer / v1.denom;
  }

  return v2 * qword_100024F80;
}

_BYTE *sub_100002064(_BYTE *result)
{
  *result = 0;
  result[1] = 0;
  return result;
}

void sub_100002080(id a1)
{
  dword_100024F78 = 0;
  qword_100024F70 = sub_100001FF8();
  notify_post("com.apple.Kerberos.cache.changed");
}

uint64_t sub_1000020C4()
{
  id v5 = objc_autoreleasePoolPush();
  id v10 = 0LL;
  uint64_t v9 = 0x100000LL;
  id v4 = +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager");
  id v8 = -[NSFileManager attributesOfItemAtPath:error:](v4, "attributesOfItemAtPath:error:", qword_100024E78, 0LL);

  id v7 = [v8 objectForKeyedSubscript:NSFileSize];
  if ((uint64_t)[v7 longLongValue] <= 0x100000)
  {
    id v3 = +[HeimCredDecoder copyUnarchiveObjectWithFileSecureEncoding:]( &OBJC_CLASS___HeimCredDecoder,  "copyUnarchiveObjectWithFileSecureEncoding:",  qword_100024E78);
    id v0 = v10;
    id v10 = v3;

    if (v3 && (uint64_t v2 = objc_opt_class(&OBJC_CLASS___NSDictionary), (objc_opt_isKindOfClass(v10, v2) & 1) != 0))
    {
      [v10 enumerateKeysAndObjectsUsingBlock:&stru_1000209F0];
      unsigned int v11 = 0;
    }

    else
    {
      unsigned int v11 = 1;
    }
  }

  else
  {
    id location = sub_10000EABC();
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_ERROR))
    {
      sub_1000025A8((uint64_t)v12, (uint64_t)v7, v9);
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)location,  OS_LOG_TYPE_ERROR,  "The archive file size %@ exceeds the max limit of %lld. Aborting the load.",  v12,  0x16u);
    }

    objc_storeStrong(&location, 0LL);
    unsigned int v11 = 2;
  }

  objc_storeStrong(&v7, 0LL);
  objc_storeStrong(&v8, 0LL);
  objc_storeStrong(&v10, 0LL);
  objc_autoreleasePoolPop(v5);
  return v11;
}

void sub_100002598()
{
}

uint64_t sub_1000025A8(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 64;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  return result;
}

void sub_1000025F8(id a1, id a2, id a3, BOOL *a4)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v23 = 0LL;
  objc_storeStrong(&v23, a3);
  v22 = a4;
  id v21 = a1;
  unsigned int valuePtr = [location[0] intValue];
  if (valuePtr == [off_100024D28 intValue])
  {
    id v19 = v23;
    if (v19 && (uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSDictionary), (objc_opt_isKindOfClass(v19, v4) & 1) != 0))
    {
      [v19 enumerateKeysAndObjectsUsingBlock:&stru_100020A10];
      int v18 = 1;
    }

    else
    {
      int v18 = 1;
    }

    objc_storeStrong(&v19, 0LL);
  }

  else if ((byte_100024ED0 & 1) != 0 || (off_100024EC0(valuePtr) & 1) != 0)
  {
    v17 = (CFDictionaryRef *)sub_100002D64(valuePtr);
    if (v17)
    {
      id v16 = v23;
      if (v16 && (uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSDictionary), (objc_opt_isKindOfClass(v16, v5) & 1) != 0))
      {
        id v10 = _NSConcreteStackBlock;
        int v11 = -1073741824;
        int v12 = 0;
        v13 = sub_100002F88;
        v14 = &unk_100020A30;
        uint64_t v15 = v17;
        [v16 enumerateKeysAndObjectsUsingBlock:&v10];
        CFDictionaryApplyFunction((CFDictionaryRef)qword_100024F50, (CFDictionaryApplierFunction)sub_1000035C0, v17);
        if (CFDictionaryGetCount(v17[3]))
        {
          CFRelease(v17);
        }

        else
        {
          CFNumberRef key = CFNumberCreate(0LL, kCFNumberIntType, &valuePtr);
          CFDictionaryRemoveValue((CFMutableDictionaryRef)qword_100024F40, key);
          if (v17)
          {
            CFRelease(v17);
            v17 = 0LL;
          }

          if (key) {
            CFRelease(key);
          }
        }

        int v18 = 0;
      }

      else
      {
        CFRelease(v17);
        v17 = 0LL;
        int v18 = 1;
      }

      objc_storeStrong(&v16, 0LL);
      if (!v18) {
        int v18 = 0;
      }
    }

    else
    {
      int v18 = 1;
    }
  }

  else
  {
    int v18 = 1;
  }

  objc_storeStrong(&v23, 0LL);
  objc_storeStrong(location, 0LL);
}

void sub_100002968(id a1, id a2, id a3, BOOL *a4)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v8 = 0LL;
  objc_storeStrong(&v8, a3);
  id v7 = +[HeimCredDecoder copyNS2CF:](&OBJC_CLASS___HeimCredDecoder, "copyNS2CF:", location[0]);
  CFTypeRef cf = +[HeimCredDecoder copyNS2CF:](&OBJC_CLASS___HeimCredDecoder, "copyNS2CF:", v8);
  if (v7 && cf)
  {
    CFDateRef value = (void *)sub_10001092C(v7);
    if (value)
    {
      if ((sub_100002B44((uint64_t)value, (const __CFDictionary *)cf) & 1) != 0)
      {
        *((void *)value + 3) = CFRetain(cf);
        if (!sub_100002C84((CFDictionaryRef *)value)) {
          CFDictionarySetValue((CFMutableDictionaryRef)qword_100024F48, *((const void **)value + 2), value);
        }
      }
    }

    if (value) {
      CFRelease(value);
    }
  }

  if (v7) {
    CFRelease(v7);
  }
  if (cf) {
    CFRelease(cf);
  }
  objc_storeStrong(&v8, 0LL);
  objc_storeStrong(location, 0LL);
}

uint64_t sub_100002B44(uint64_t a1, const __CFDictionary *a2)
{
  uint64_t v9 = a1;
  id v8 = a2;
  if (*(void *)(a1 + 32)) {
    heim_abort("HeimCredAssignMech already have a mech:cred->mech == NULL");
  }
  CFTypeRef v7 = 0LL;
  uint64_t v4 = v8;
  CFTypeID TypeID = CFStringGetTypeID();
  CFTypeRef key = sub_10000AF0C(v4, @"kHEIMAttrType", TypeID, (uint64_t)&v7);
  if (key && (Value = CFDictionaryGetValue((CFDictionaryRef)qword_100024F50, key)) != 0LL)
  {
    *(void *)(v9 + 32) = Value;
    char v10 = 1;
  }

  else
  {
    if (v7)
    {
      CFRelease(v7);
      CFTypeRef v7 = 0LL;
    }

    char v10 = 0;
  }

  return v10 & 1;
}

BOOL sub_100002C84(CFDictionaryRef *a1)
{
  v5[1] = a1;
  v5[0] = (id)(id)CFDictionaryGetValue(a1[3], @"kHEIMAttrStoreTime");
  id v3 = +[NSDate date](&OBJC_CLASS___NSDate, "date");
  id v2 = [v5[0] dateByAddingTimeInterval:(double)heim_ntlm_time_skew];
  id v4 = -[NSDate compare:](v3, "compare:");

  objc_storeStrong(v5, 0LL);
  return v4 == (id)1;
}

const void *sub_100002D64(int a1)
{
  int valuePtr = a1;
  CFNumberRef v3 = CFNumberCreate(0LL, kCFNumberIntType, &valuePtr);
  if (!v3) {
    heim_abort("out of memory:sid != NULL");
  }
  Value = CFDictionaryGetValue((CFDictionaryRef)qword_100024F40, v3);
  if (Value)
  {
    if (v3) {
      CFRelease(v3);
    }
    CFRetain(Value);
    return Value;
  }

  else
  {
    uint64_t v2 = sub_10000AE94();
    if (!v2) {
      heim_abort("could not register cftype:sessionTID != _kCFRuntimeNotATypeID");
    }
    uint64_t Instance = _CFRuntimeCreateInstance(0LL, v2, 40LL);
    if (!Instance) {
      heim_abort("out of memory while registering HeimMech instance:session != NULL");
    }
    *(_DWORD *)(Instance + 16) = valuePtr;
    *(void *)(Instance + 24) = CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    *(void *)(Instance + 32) = qword_100024F48;
    CFRetain(*(CFTypeRef *)(Instance + 32));
    *(void *)(Instance + 40) = CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    *(_DWORD *)(Instance + 48) = 0;
    CFDictionarySetValue((CFMutableDictionaryRef)qword_100024F40, v3, (const void *)Instance);
    if (v3) {
      CFRelease(v3);
    }
    return (const void *)Instance;
  }

void sub_100002F88(uint64_t *a1, void *a2, void *a3, uint64_t a4)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v14 = 0LL;
  objc_storeStrong(&v14, a3);
  uint64_t v13 = a4;
  int v12 = a1;
  int v11 = +[HeimCredDecoder copyNS2CF:](&OBJC_CLASS___HeimCredDecoder, "copyNS2CF:", location[0]);
  char v10 = +[HeimCredDecoder copyNS2CF:](&OBJC_CLASS___HeimCredDecoder, "copyNS2CF:", v14);
  if (v11 && v10)
  {
    CFTypeRef cf = (CFTypeRef)sub_10001092C(v11);
    if ((byte_100024ED0 & 1) != 0)
    {
      id v8 = (id)CFDictionaryGetValue(v10, @"kHEIMAttrASID");
      if ((!v8 || (((uint64_t (*)(id))off_100024EC0)([v8 intValue]) & 1) == 0) && cf)
      {
        CFRelease(cf);
        CFTypeRef cf = 0LL;
      }

      objc_storeStrong(&v8, 0LL);
    }

    if (cf && (sub_100002B44((uint64_t)cf, v10) & 1) != 0)
    {
      CFTypeRef v4 = CFRetain(v10);
      *((void *)cf + 3) = v4;
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1[4] + 24), *((const void **)cf + 2), cf);
      if (!sub_10000324C(*((const __CFDictionary **)cf + 3))) {
        sub_1000032CC(a1[4], (uint64_t)cf, *((const __CFDictionary **)cf + 3));
      }
      sub_100003430((uint64_t)cf, a1[4]);
    }

    if (cf) {
      CFRelease(cf);
    }
  }

  if (v11)
  {
    CFRelease(v11);
    int v11 = 0LL;
  }

  if (v10)
  {
    CFRelease(v10);
    char v10 = 0LL;
  }

  objc_storeStrong(&v14, 0LL);
  objc_storeStrong(location, 0LL);
}

BOOL sub_10000324C(const __CFDictionary *a1)
{
  BOOL v2 = 0;
  if (CFDictionaryContainsKey(a1, @"kHEIMAttrTemporaryCache")) {
    return CFDictionaryGetValue(a1, @"kHEIMAttrTemporaryCache") == kCFBooleanTrue;
  }
  return v2;
}

void sub_1000032CC(uint64_t a1, uint64_t a2, const __CFDictionary *a3)
{
  if (!*(void *)(a2 + 32)) {
    heim_abort("mech is NULL, schame validation doesn't work ?:cred->mech != NULL");
  }
  if (!CFDictionaryGetValue(a3, @"kHEIMAttrParentCredential"))
  {
    Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 40), *(const void **)(*(void *)(a2 + 32) + 16LL));
    BOOLean = (const __CFBoolean *)CFDictionaryGetValue(a3, @"kHEIMAttrDefaultCredential");
    if (BOOLean)
    {
      if (CFBooleanGetValue(BOOLean))
      {
        if (Value) {
          sub_10000CDB0(Value, a1, 0LL);
        }
        CFDictionarySetValue( *(CFMutableDictionaryRef *)(a1 + 40),  *(const void **)(*(void *)(a2 + 32) + 16LL),  *(const void **)(a2 + 16));
        if (*(void *)(*(void *)(a2 + 32) + 40LL)) {
          (*(void (**)(void))(*(void *)(a2 + 32) + 40LL))();
        }
      }
    }
  }

void sub_100003430(uint64_t a1, uint64_t a2)
{
  if (CFEqual(*(CFTypeRef *)(*(void *)(a1 + 32) + 16LL), @"kHEIMTypeKerberos")
    || CFEqual(*(CFTypeRef *)(*(void *)(a1 + 32) + 16LL), @"kHEIMTypeKerberosAcquireCred"))
  {
    *(_DWORD *)(a1 + 148) = *(_DWORD *)(a2 + 16);
    CFTypeRef cf = (CFTypeRef)sub_100010220(a1);
    *(void *)(a1 + 168) = CFRetain(cf);
    *(void *)(a1 + 136) = heim_ipc_event_cf_create_f(qword_100024EE8, cf);
    if (cf) {
      CFRelease(cf);
    }
    CFTypeRef v2 = (CFTypeRef)sub_100010220(a1);
    *(void *)(a1 + 160) = CFRetain(v2);
    *(void *)(a1 + 112) = heim_ipc_event_cf_create_f(qword_100024EF0, v2);
    if (v2) {
      CFRelease(v2);
    }
    heim_ipc_event_set_final_f(*(void *)(a1 + 112), qword_100024EF8);
    heim_ipc_event_set_final_f(*(void *)(a1 + 136), qword_100024EF8);
    sub_100006FE0(a1);
  }

void sub_1000035C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = a1;
  uint64_t v19 = a2;
  uint64_t v18 = a3;
  uint64_t v17 = a2;
  uint64_t v16 = a3;
  uint64_t v15 = CFDictionaryGetValue(*(CFDictionaryRef *)(a3 + 40), *(const void **)(a2 + 16));
  if (v15)
  {
    if (CFDictionaryGetValue(*(CFDictionaryRef *)(v16 + 24), v15)) {
      return;
    }
    CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(v16 + 40), *(const void **)(v17 + 16));
    id location = sub_10000EABC();
    os_log_type_t v13 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEBUG))
    {
      sub_1000045F4((uint64_t)v22, *(void *)(v17 + 16));
      _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)location,  v13,  "The default credential for %@ does not exist.",  v22,  0xCu);
    }

    objc_storeStrong(&location, 0LL);
  }

  id v12 = *(id *)(v16 + 24);
  uint64_t v5 = _NSConcreteStackBlock;
  int v6 = -1073741824;
  int v7 = 0;
  id v8 = sub_10000CEA4;
  uint64_t v9 = &unk_100020AD8;
  uint64_t v10 = v16;
  uint64_t v11 = v17;
  [v12 enumerateKeysAndObjectsUsingBlock:&v5];
  uint64_t v15 = CFDictionaryGetValue(*(CFDictionaryRef *)(v16 + 40), *(const void **)(v17 + 16));
  if (!v15)
  {
    os_log_t oslog = (os_log_t)sub_10000EABC();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      sub_1000045F4((uint64_t)v21, *(void *)(v17 + 16));
      _os_log_debug_impl( (void *)&_mh_execute_header,  oslog,  OS_LOG_TYPE_DEBUG,  "A default credential for %@ could not be identified.",  v21,  0xCu);
    }

    objc_storeStrong((id *)&oslog, 0LL);
    CFUUIDRef value = CFUUIDCreate(0LL);
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(v16 + 40), *(const void **)(v17 + 16), value);
    if (value) {
      CFRelease(value);
    }
  }

  if (*(void *)(v17 + 40)) {
    (*(void (**)(void))(v17 + 40))();
  }
  objc_storeStrong(&v12, 0LL);
}

uint64_t sub_1000038C4(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 32;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  return result;
}

void sub_100003914(void *a1, void *a2, void *a3)
{
  v40 = a1;
  id location = 0LL;
  objc_storeStrong(&location, a2);
  id v38 = 0LL;
  objc_storeStrong(&v38, a3);
  MutableCopy = 0LL;
  uint64_t v36 = 0LL;
  v35 = 0LL;
  char v34 = 0;
  v33 = 0LL;
  BOOL v31 = 0;
  id v30 = sub_10000EABC();
  os_log_type_t v29 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled((os_log_t)v30, OS_LOG_TYPE_DEBUG))
  {
    sub_1000045F4((uint64_t)v44, (uint64_t)location);
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)v30, v29, "Begin Create Cred: %@", v44, 0xCu);
  }

  objc_storeStrong(&v30, 0LL);
  id v9 = location;
  CFTypeID TypeID = CFDictionaryGetTypeID();
  v28 = (const __CFDictionary *)sub_100010074(v9, "attributes", TypeID);
  if (v28)
  {
    if ((sub_100004634(v28, (__CFError *)&v33) & 1) == 0)
    {
LABEL_33:
      sub_100004850(v38, v33);
      goto LABEL_69;
    }

    BOOL v8 = 1;
    if (!sub_10000324C(v28)) {
      BOOL v8 = sub_100004924(v40[7], v28);
    }
    BOOL v31 = v8;
    v27 = CFDictionaryGetValue(v28, @"kHEIMAttrParentCredential");
    if (!v27 || (sub_100004A08(v40, v27, &v34) & 1) != 0)
    {
      v35 = CFDictionaryGetValue(v28, @"kHEIMAttrUUID");
      if (v35)
      {
        CFRetain(v35);
        CFTypeID v7 = CFGetTypeID(v35);
        if (v7 != CFUUIDGetTypeID() || CFDictionaryGetValue(*(CFDictionaryRef *)(v40[7] + 24LL), v35)) {
          goto LABEL_69;
        }
      }

      else
      {
        v35 = CFUUIDCreate(0LL);
        if (!v35) {
          goto LABEL_69;
        }
      }

      if ((sub_10000515C(v40, v28, &v33) & 1) == 0) {
        goto LABEL_33;
      }
      uint64_t v36 = sub_10001092C(v35);
      if (v36)
      {
        MutableCopy = CFDictionaryCreateMutableCopy(0LL, 0LL, v28);
        if (MutableCopy)
        {
          char v26 = sub_100005848((uint64_t)v40, MutableCopy) & 1;
          if (!v26
            || (sub_1000059E4((uint64_t)v40) & 1) != 0
            || (CFTypeRef v25 = CFDictionaryGetValue(MutableCopy, @"kHEIMAttrBundleIdentifierACL")) != 0LL
            && (CFTypeID v6 = CFGetTypeID(v25), v6 == CFArrayGetTypeID())
            && CFArrayGetCount((CFArrayRef)v25) == 1)
          {
            if ((v34 & 1) == 0 && (v26 & 1) == 0)
            {
              values = (void *)v40[1];
              CFUUIDRef value = CFArrayCreate(0LL, (const void **)&values, 1LL, &kCFTypeArrayCallBacks);
              if (!value) {
                heim_abort("out of memory:array != NULL");
              }
              CFDictionarySetValue(MutableCopy, @"kHEIMAttrBundleIdentifierACL", value);
              if (value)
              {
                CFRelease(value);
                CFUUIDRef value = 0LL;
              }
            }

            CFDictionarySetValue(MutableCopy, @"kHEIMAttrUUID", v35);
            if ((sub_100004634(MutableCopy, (__CFError *)&v33) & 1) == 0) {
              goto LABEL_33;
            }
            if ((sub_100002B44(v36, MutableCopy) & 1) != 0)
            {
              sub_100005A5C(v36, MutableCopy);
              if (!v31) {
                sub_1000032CC(v40[7], v36, MutableCopy);
              }
              if ((byte_100024ED0 & 1) != 0)
              {
                int valuePtr = off_100024E98(*v40);
                CFTypeRef cf = CFNumberCreate(0LL, kCFNumberIntType, &valuePtr);
                if (valuePtr) {
                  CFDictionarySetValue(MutableCopy, @"kHEIMAttrUserID", cf);
                }
                if (cf)
                {
                  CFRelease(cf);
                  CFTypeRef cf = 0LL;
                }

                int v18 = off_100024EA0(*v40);
                CFTypeRef v17 = CFNumberCreate(0LL, kCFNumberIntType, &v18);
                CFDictionarySetValue(MutableCopy, @"kHEIMAttrASID", v17);
                if (v17)
                {
                  CFRelease(v17);
                  CFTypeRef v17 = 0LL;
                }
              }

              if (!v27) {
                CFDictionarySetValue(MutableCopy, @"kHEIMAttrRetainStatus", &off_100022290);
              }
              *(void *)(v36 + 24) = CFRetain(MutableCopy);
              CFDictionarySetValue( *(CFMutableDictionaryRef *)(v40[7] + 24LL),  *(const void **)(v36 + 16),  (const void *)v36);
              if (CFDictionaryGetValue(*(CFDictionaryRef *)(v36 + 24), @"kHEIMAttrLeadCredential") == kCFBooleanTrue
                && *(void *)(*(void *)(v36 + 32) + 40LL))
              {
                (*(void (**)(void))(*(void *)(v36 + 32) + 40LL))();
              }

              byte_100024F6C = 1;
              if (!*(void *)(v36 + 32)) {
                heim_abort("mech is NULL, schame validation doesn't work ?:cred->mech != NULL");
              }
              CFTypeRef key = (void *)CFDictionaryGetValue( *(CFDictionaryRef *)(v40[7] + 40LL),  *(const void **)(*(void *)(v36 + 32) + 16LL));
              if (!v31 && (!key || !CFDictionaryGetValue(*(CFDictionaryRef *)(v40[7] + 24LL), key)))
              {
                CFBooleanRef v32 = (CFBooleanRef)CFDictionaryGetValue( *(CFDictionaryRef *)(v36 + 24),  @"kHEIMAttrLeadCredential");
                if (v32)
                {
                  if (CFBooleanGetValue(v32))
                  {
                    *(_DWORD *)(v40[7] + 48LL) = 1;
                    sub_100005AE8((uint64_t)v40);
                  }
                }
              }

              sub_100003430(v36, v40[7]);
              CFTypeRef v15 = sub_100005B54(*(const __CFDictionary **)(v36 + 24), (__CFError *)&v33);
              if (v33)
              {
                os_log_t oslog = (os_log_t)sub_10000EABC();
                os_log_type_t v13 = OS_LOG_TYPE_ERROR;
                if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
                {
                  sub_1000045F4((uint64_t)v42, (uint64_t)v33);
                  _os_log_error_impl( (void *)&_mh_execute_header,  oslog,  v13,  "error filtering attributes: %@",  v42,  0xCu);
                }

                objc_storeStrong((id *)&oslog, 0LL);
                if (v33)
                {
                  CFRelease(v33);
                  v33 = 0LL;
                }
              }

              sub_100010140(v38, "attributes", (uint64_t)v15);
              if (v15)
              {
                CFRelease(v15);
                CFTypeRef v15 = 0LL;
              }

              if (*(void *)(*(void *)(v36 + 32) + 24LL))
              {
                CFTypeRef v12 = (CFTypeRef)(*(uint64_t (**)(uint64_t))(*(void *)(v36 + 32) + 24LL))(v36);
                os_log_t v11 = (os_log_t)sub_10000EABC();
                if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
                {
                  sub_100005D08((uint64_t)v41, (uint64_t)v12);
                  _os_log_debug_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "End Create Cred: %{private}@",  v41,  0xCu);
                }

                objc_storeStrong((id *)&v11, 0LL);
                if (v12)
                {
                  CFRelease(v12);
                  CFTypeRef v12 = 0LL;
                }
              }
            }
          }

          else
          {
            id v24 = sub_10000EABC();
            char v23 = 16;
            if (os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_ERROR))
            {
              CFTypeRef v4 = (os_log_s *)v24;
              os_log_type_t v5 = v23;
              sub_100002064(v22);
              _os_log_error_impl( (void *)&_mh_execute_header,  v4,  v5,  "peer sent more then one bundle id and is not accountsd",  v22,  2u);
            }

            objc_storeStrong(&v24, 0LL);
          }
        }
      }
    }
  }

LABEL_69:
  if (MutableCopy)
  {
    CFRelease(MutableCopy);
    MutableCopy = 0LL;
  }

  if (v28)
  {
    CFRelease(v28);
    v28 = 0LL;
  }

  if (v36)
  {
    CFRelease((CFTypeRef)v36);
    uint64_t v36 = 0LL;
  }

  if (v35)
  {
    CFRelease(v35);
    v35 = 0LL;
  }

  if (v33)
  {
    CFRelease(v33);
    v33 = 0LL;
  }

  objc_storeStrong(&v38, 0LL);
  objc_storeStrong(&location, 0LL);
}

uint64_t sub_1000045F4(uint64_t result, uint64_t a2)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 1;
  *(_BYTE *)(result + 2) = 64;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  return result;
}

uint64_t sub_100004634(const __CFDictionary *a1, __CFError *a2)
{
  uint64_t v10 = a1;
  CFErrorRef v9 = a2;
  if (!a2) {
    heim_abort("why you bother validating if you wont report the error to the user:error != NULL");
  }
  context[0] = 0LL;
  context[1] = v10;
  context[2] = 0LL;
  context[3] = v9;
  char v8 = 1;
  CFTypeID TypeID = CFStringGetTypeID();
  CFTypeRef v6 = sub_10000AF0C(v10, @"kHEIMObjectType", TypeID, (uint64_t)v9);
  if (v6)
  {
    os_log_type_t v5 = (const __CFDictionary *)qword_100024F58;
    CFTypeID v3 = CFDictionaryGetTypeID();
    context[0] = (CFDictionaryRef)sub_10000AF0C(v5, v6, v3, (uint64_t)v9);
    if (context[0])
    {
      CFDictionaryApplyFunction(v10, (CFDictionaryApplierFunction)sub_10000DE70, context);
      CFDictionaryApplyFunction(context[0], (CFDictionaryApplierFunction)sub_10000DFEC, context);
      char v11 = v8 & 1;
    }

    else
    {
      os_log_type_t v13 = @"CommonErrorCode";
      CFBooleanRef v12 = kCFBooleanTrue;
      sub_100006390(v9, 564482LL, (const void *const *)&v13, (const void *const *)&v12, 1LL);
      char v11 = 0;
    }
  }

  else
  {
    CFTypeRef v15 = @"CommonErrorCode";
    CFBooleanRef v14 = kCFBooleanTrue;
    sub_100006390(v9, 564481LL, (const void *const *)&v15, (const void *const *)&v14, 1LL);
    char v11 = 0;
  }

  return v11 & 1;
}

void sub_100004850(void *a1, __CFError *a2)
{
  id location = 0LL;
  objc_storeStrong(&location, a1);
  CFErrorRef v7 = a2;
  if (a2)
  {
    id v5 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_object_t xdict = v5;
    int64_t Code = CFErrorGetCode(v7);
    xpc_dictionary_set_int64(xdict, "error-code", Code);
    xpc_dictionary_set_value(location, "error", v5);
    objc_storeStrong(&v5, 0LL);
    int v6 = 0;
  }

  else
  {
    int v6 = 1;
  }

  objc_storeStrong(&location, 0LL);
}

BOOL sub_100004924(uint64_t a1, const __CFDictionary *a2)
{
  BOOL v5 = 0;
  CFTypeRef key = (void *)CFDictionaryGetValue(a2, @"kHEIMAttrParentCredential");
  if (key)
  {
    Value = (CFDictionaryRef *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 24), key);
    if (Value)
    {
      if (CFDictionaryContainsKey(Value[3], @"kHEIMAttrTemporaryCache")) {
        return CFDictionaryGetValue(Value[3], @"kHEIMAttrTemporaryCache") == kCFBooleanTrue;
      }
    }
  }

  return v5;
}

uint64_t sub_100004A08(void *a1, const void *a2, _BYTE *a3)
{
  v42 = a1;
  v41 = a2;
  v40 = a3;
  int v39 = 10;
  char v38 = 0;
  if (a3) {
    _BYTE *v40 = 0;
  }
  CFTypeID v16 = CFGetTypeID(v41);
  if (v16 == CFUUIDGetTypeID())
  {
    while (1)
    {
      Value = (CFDictionaryRef *)CFDictionaryGetValue(*(CFDictionaryRef *)(v42[7] + 24LL), v41);
      if (!Value)
      {
LABEL_50:
        char v38 = 1;
        return v38 & 1;
      }

      CFTypeID v15 = CFGetTypeID(Value);
      if (v15 != sub_10001090C()) {
        heim_abort("cred wrong type:CFGetTypeID(cred) == HeimCredGetTypeID()");
      }
      int v3 = v39--;
      if (v3 < 0) {
        return v38 & 1;
      }
      if ((byte_100024ED0 & 1) != 0)
      {
        int valuePtr = off_100024EA0(*v42);
        CFNumberRef v34 = CFNumberCreate(0LL, kCFNumberIntType, &valuePtr);
        CFTypeRef v33 = CFDictionaryGetValue(Value[3], @"kHEIMAttrASID");
        BOOL v32 = 0;
        if (v34 && v33) {
          BOOL v32 = CFEqual(v34, v33) != 0;
        }
        int v31 = off_100024E98(*v42);
        CFTypeRef v30 = CFDictionaryGetValue(Value[3], @"kHEIMAttrUserID");
        CFNumberRef v29 = CFNumberCreate(0LL, kCFNumberIntType, &v31);
        BOOL v28 = 0;
        if (v30 && v29) {
          BOOL v28 = CFEqual(v30, v29) != 0;
        }
        if (v29)
        {
          CFRelease(v29);
          CFNumberRef v29 = 0LL;
        }

        if (v34)
        {
          CFRelease(v34);
          CFNumberRef v34 = 0LL;
        }

        if (!v28 && !v32) {
          return v38 & 1;
        }
      }

      CFTypeRef v27 = CFDictionaryGetValue(Value[3], @"kHEIMAttrBundleIdentifierACL");
      if (v27) {
        break;
      }
      CFTypeRef v36 = CFDictionaryGetValue(Value[3], @"kHEIMAttrParentCredential");
      if (!v36) {
        return v38 & 1;
      }
      if (CFEqual(v36, v41)) {
        goto LABEL_50;
      }
      v41 = v36;
    }

    if (v40) {
      _BYTE *v40 = 1;
    }
    CFTypeID v14 = CFGetTypeID(v27);
    if (v14 == CFArrayGetTypeID())
    {
      CFIndex Count = CFArrayGetCount((CFArrayRef)v27);
      for (CFIndex i = 0LL; i < Count; ++i)
      {
        CFTypeRef cf = CFArrayGetValueAtIndex((CFArrayRef)v27, i);
        CFTypeID v13 = CFGetTypeID(cf);
        if (v13 != CFStringGetTypeID()) {
          break;
        }
        if (CFEqual((CFTypeRef)v42[1], cf)) {
          goto LABEL_50;
        }
        id location =  +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"self like %@",  cf);
        if ([location evaluateWithObject:v42[1]] & 1)
        {
          int v17 = 5;
        }

        else
        {
          if (!CFEqual(cf, @"com.apple.private.gssapi.allowmanagedapps")) {
            goto LABEL_43;
          }
          if ((v42[8] & 1) != 0)
          {
            os_log_t oslog = (os_log_t)sub_10000EABC();
            os_log_type_t type = OS_LOG_TYPE_DEBUG;
            if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
            {
              log = oslog;
              os_log_type_t v12 = type;
              CStringPtr = CFStringGetCStringPtr((CFStringRef)v42[1], 0x8000100u);
              sub_10000D1BC((uint64_t)v44, (uint64_t)CStringPtr);
              _os_log_debug_impl( (void *)&_mh_execute_header,  log,  v12,  "checking managed app status for: %{private}s",  v44,  0xCu);
            }

            objc_storeStrong((id *)&oslog, 0LL);
            uint64_t v5 = v42[1];
            v19[0] = *(_OWORD *)(v42 + 3);
            v19[1] = *(_OWORD *)(v42 + 5);
            unsigned __int8 v6 = [(id)qword_100024EC8 isManagedApp:v5 auditToken:v19];
            *((_BYTE *)v42 + 65) = v6 & 1;
            *((_BYTE *)v42 + 64) = 0;
            os_log_t v18 = (os_log_t)sub_10000EABC();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v10 = v18;
              CFErrorRef v7 = CFStringGetCStringPtr((CFStringRef)v42[1], 0x8000100u);
              if ((*((_BYTE *)v42 + 65) & 1) != 0) {
                char v8 = "is managed";
              }
              else {
                char v8 = "is not managed";
              }
              sub_10000D1FC((uint64_t)v43, (uint64_t)v7, (uint64_t)v8);
              _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "app %{private}s %s", v43, 0x16u);
            }

            objc_storeStrong((id *)&v18, 0LL);
          }

          if ((*((_BYTE *)v42 + 65) & 1) != 0) {
            int v17 = 5;
          }
          else {
LABEL_43:
          }
            int v17 = 0;
        }

        objc_storeStrong(&location, 0LL);
        if (v17) {
          goto LABEL_50;
        }
      }
    }
  }

  return v38 & 1;
}

uint64_t sub_10000515C(void *a1, const __CFDictionary *a2, void *a3)
{
  CFNumberRef v34 = a1;
  CFDictionaryRef v33 = a2;
  location[1] = a3;
  location[0] = 0LL;
  CFTypeRef cf1 = CFDictionaryGetValue(a2, @"kHEIMObjectType");
  if (CFEqual(cf1, @"kHEIMObjectKerberos")
    || CFEqual(cf1, @"kHEIMObjectConfiguration")
    || CFEqual(cf1, @"kHEIMObjectKerberosAcquireCred"))
  {
    CFTypeRef v30 = CFDictionaryGetValue(v33, @"kHEIMAttrParentCredential");
    CFNumberRef v29 = CFDictionaryGetValue(v33, @"kHEIMAttrClientName");
    BOOL v28 = CFDictionaryGetValue(v33, @"kHEIMAttrServerName");
    if (!v30 || !v29 || !v28)
    {
      char v35 = 1;
      int v27 = 1;
      goto LABEL_31;
    }

    v40[0] = @"kHEIMObjectType";
    v41[0] = cf1;
    v40[1] = @"kHEIMAttrParentCredential";
    v41[1] = v30;
    v40[2] = @"kHEIMAttrClientName";
    v41[2] = v29;
    v40[3] = @"kHEIMAttrServerName";
    v41[3] = v28;
    os_log_type_t v12 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v41,  v40,  4LL);
    id v3 = -[NSDictionary mutableCopy](v12, "mutableCopy");
    id v4 = location[0];
    location[0] = v3;
  }

  else if (CFEqual(cf1, @"kHEIMObjectNTLM"))
  {
    char v26 = CFDictionaryGetValue(v33, @"kHEIMAttrNTLMUsername");
    CFTypeRef v25 = CFDictionaryGetValue(v33, @"kHEIMAttrNTLMDomain");
    id v24 = CFDictionaryGetValue(v33, @"kHEIMAttrParentCredential");
    v38[0] = @"kHEIMObjectType";
    v39[0] = cf1;
    v38[1] = @"kHEIMAttrNTLMUsername";
    v39[1] = v26;
    v38[2] = @"kHEIMAttrNTLMDomain";
    v39[2] = v25;
    v38[3] = @"kHEIMAttrData";
    v39[3] = @"kHEIMObjectAny";
    char v11 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v39,  v38,  4LL);
    id v5 = -[NSDictionary mutableCopy](v11, "mutableCopy");
    id v6 = location[0];
    location[0] = v5;

    if (v24) {
      [location[0] setObject:v24 forKeyedSubscript:@"kHEIMAttrParentCredential"];
    }
  }

  else
  {
    if (!CFEqual(cf1, @"kHEIMObjectSCRAM"))
    {
      char v35 = 1;
      int v27 = 1;
      goto LABEL_31;
    }

    char v23 = CFDictionaryGetValue(v33, @"kHEIMAttrSCRAMUsername");
    v36[0] = @"kHEIMObjectType";
    v37[0] = cf1;
    v36[1] = @"kHEIMAttrSCRAMUsername";
    v37[1] = v23;
    uint64_t v10 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v37,  v36,  2LL);
    id v7 = -[NSDictionary mutableCopy](v10, "mutableCopy");
    id v8 = location[0];
    location[0] = v7;
  }

  if ((byte_100024ED0 & 1) != 0)
  {
    int valuePtr = off_100024E98(*v34);
    CFTypeRef cf = CFNumberCreate(0LL, kCFNumberIntType, &valuePtr);
    if (valuePtr) {
      [location[0] setObject:cf forKeyedSubscript:@"kHEIMAttrUserID"];
    }
    if (cf)
    {
      CFRelease(cf);
      CFTypeRef cf = 0LL;
    }

    int v20 = off_100024EA0(*v34);
    CFTypeRef v19 = CFNumberCreate(0LL, kCFNumberIntType, &v20);
    [location[0] setObject:v19 forKeyedSubscript:@"kHEIMAttrASID"];
    if (v19)
    {
      CFRelease(v19);
      CFTypeRef v19 = 0LL;
    }
  }

  xpc_object_t value = (xpc_object_t)_CFXPCCreateXPCObjectFromCFObject(location[0]);
  xpc_object_t xdict = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(xdict, "command", "removeduplicates");
  xpc_dictionary_set_value(xdict, "query", value);
  theArray = (const __CFArray *)sub_100005F4C(v34, xdict, "query");
  CFIndex Count = CFArrayGetCount(theArray);
  for (CFIndex idx = 0LL; idx < Count; ++idx)
  {
    ValueAtIndex = CFArrayGetValueAtIndex(theArray, idx);
    sub_100006404((uint64_t)ValueAtIndex, (uint64_t)v34);
  }

  if (Count > 0) {
    byte_100024F6C = 1;
  }
  if (theArray) {
    CFRelease(theArray);
  }
  char v35 = 1;
  int v27 = 1;
  objc_storeStrong(&xdict, 0LL);
  objc_storeStrong(&value, 0LL);
LABEL_31:
  objc_storeStrong(location, 0LL);
  return v35 & 1;
}

uint64_t sub_100005848(uint64_t a1, const __CFDictionary *a2)
{
  CFTypeRef cf = CFDictionaryGetValue(a2, @"kHEIMAttrBundleIdentifierACL");
  if (cf)
  {
    CFTypeID v3 = CFGetTypeID(cf);
    if (v3 == CFArrayGetTypeID())
    {
      CFIndex range_8 = CFArrayGetCount((CFArrayRef)cf);
      v10.id location = 0LL;
      v10.length = range_8;
      if (!CFArrayContainsValue((CFArrayRef)cf, v10, *(const void **)(a1 + 8)))
      {
        MutableCopy = CFArrayCreateMutableCopy(0LL, 0LL, (CFArrayRef)cf);
        if (!MutableCopy)
        {
          char v9 = 0;
          return v9 & 1;
        }

        CFArrayAppendValue(MutableCopy, *(const void **)(a1 + 8));
        CFDictionarySetValue(a2, @"kHEIMAttrBundleIdentifierACL", MutableCopy);
        CFRelease(MutableCopy);
      }

      char v9 = 1;
      return v9 & 1;
    }
  }

  char v9 = 0;
  return v9 & 1;
}

uint64_t sub_1000059E4(uint64_t a1)
{
  char v2 = 1;
  if (CFStringCompare(@"com.apple.accountsd", *(CFStringRef *)(a1 + 16), 0LL)) {
    char v2 = off_100024E90(a1, "com.apple.private.gssapi.allowwildcardacl");
  }
  return v2 & 1;
}

void sub_100005A5C(uint64_t a1, __CFDictionary *a2)
{
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  CFDateRef value = CFDateCreate(0LL, Current);
  if (value)
  {
    CFDictionarySetValue(a2, @"kHEIMAttrStoreTime", value);
    CFRelease(value);
  }

void sub_100005AE8(uint64_t a1)
{
  if (*(_DWORD *)(*(void *)(a1 + 56) + 48LL))
  {
    *(_DWORD *)(*(void *)(a1 + 56) + 48LL) = 0;
    CFDictionaryApplyFunction( (CFDictionaryRef)qword_100024F50,  (CFDictionaryApplierFunction)sub_1000035C0,  *(void **)(a1 + 56));
  }

CFMutableDictionaryRef sub_100005B54(const __CFDictionary *a1, __CFError *a2)
{
  CFDictionaryRef v12 = a1;
  CFErrorRef v11 = a2;
  CFDictionaryRef theDict = 0LL;
  CFMutableDictionaryRef MutableCopy = 0LL;
  CFRange v10 = a2;
  CFTypeID TypeID = CFStringGetTypeID();
  CFTypeRef v7 = sub_10000AF0C(a1, @"kHEIMObjectType", TypeID, (uint64_t)v11);
  if (v7)
  {
    id v5 = (const __CFDictionary *)qword_100024F58;
    CFTypeID v3 = CFDictionaryGetTypeID();
    CFDictionaryRef theDict = (CFDictionaryRef)sub_10000AF0C(v5, v7, v3, (uint64_t)v11);
    if (theDict)
    {
      CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(0LL, 0LL, v12);
      CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)sub_10000DC54, &theDict);
      return MutableCopy;
    }

    else
    {
      CFTypeID v15 = @"CommonErrorCode";
      CFBooleanRef v14 = kCFBooleanTrue;
      sub_100006390(v11, 564482LL, (const void *const *)&v15, (const void *const *)&v14, 1LL);
      return 0LL;
    }
  }

  else
  {
    int v17 = @"CommonErrorCode";
    CFBooleanRef v16 = kCFBooleanTrue;
    sub_100006390(v11, 564481LL, (const void *const *)&v17, (const void *const *)&v16, 1LL);
    return 0LL;
  }

uint64_t sub_100005D08(uint64_t result, uint64_t a2)
{
  *(_BYTE *)result = 3;
  *(_BYTE *)(result + 1) = 1;
  *(_BYTE *)(result + 2) = 65;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  return result;
}

void sub_100005D48(void *a1, void *a2, void *a3)
{
  CFErrorRef v11 = a1;
  id location = 0LL;
  objc_storeStrong(&location, a2);
  id v9 = 0LL;
  objc_storeStrong(&v9, a3);
  CFTypeRef cf = 0LL;
  theArray = (const __CFArray *)sub_100005F4C(v11, location, "query");
  if (theArray && CFArrayGetCount(theArray))
  {
    CFIndex Count = CFArrayGetCount(theArray);
    for (CFIndex idx = 0LL; idx < Count; ++idx)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(theArray, idx);
      sub_100006404((uint64_t)ValueAtIndex, (uint64_t)v11);
    }

    byte_100024F6C = 1;
  }

  else
  {
    CFTypeID v13 = @"CommonErrorCode";
    CFBooleanRef v12 = kCFBooleanTrue;
    sub_100006390((CFErrorRef)&cf, 564483LL, (const void *const *)&v13, (const void *const *)&v12, 1LL);
  }

  if (cf)
  {
    sub_100004850(v9, (__CFError *)cf);
    if (cf)
    {
      CFRelease(cf);
      CFTypeRef cf = 0LL;
    }
  }

  if (theArray) {
    CFRelease(theArray);
  }
  objc_storeStrong(&v9, 0LL);
  objc_storeStrong(&location, 0LL);
}

uint64_t sub_100005F4C(void *a1, void *a2, const char *a3)
{
  BOOL v28 = a1;
  id location = 0LL;
  objc_storeStrong(&location, a2);
  char v26 = a3;
  memset(__b, 0, sizeof(__b));
  __b[0] = v28;
  CFTypeRef v24 = 0LL;
  __b[6] = xpc_dictionary_get_string(location, "command");
  if (__b[6])
  {
    id v13 = location;
    CFBooleanRef v12 = v26;
    CFTypeID TypeID = CFDictionaryGetTypeID();
    __b[2] = sub_100010074(v13, v12, TypeID);
    if (__b[2])
    {
      __b[3] = CFDictionaryGetCount((CFDictionaryRef)__b[2]);
      if (__b[3] == 1LL
        && (Value = CFDictionaryGetValue((CFDictionaryRef)__b[2], @"kHEIMAttrUUID")) != 0LL
        && (CFTypeID v11 = CFGetTypeID(Value), v11 == CFUUIDGetTypeID()))
      {
        if ((sub_100004A08(v28, Value, 0LL) & 1) != 0)
        {
          CFTypeRef cf = (uint64_t *)CFDictionaryGetValue(*(CFDictionaryRef *)(v28[7] + 24LL), Value);
          if (cf)
          {
            CFTypeID v10 = CFGetTypeID(cf);
            if (v10 != sub_10001090C()) {
              heim_abort("cred wrong type:CFGetTypeID(cred) == HeimCredGetTypeID()");
            }
            if (sub_100008300(cf[4], __b[6]))
            {
              __b[1] = CFArrayCreateMutable(0LL, 0LL, &kCFTypeArrayCallBacks);
              CFArrayAppendValue((CFMutableArrayRef)__b[1], cf);
            }
          }
        }
      }

      else
      {
        __b[1] = CFArrayCreateMutable(0LL, 0LL, &kCFTypeArrayCallBacks);
        id v8 = (const __CFDictionary *)__b[2];
        CFTypeID v4 = CFStringGetTypeID();
        CFTypeRef cf1 = sub_10000AF0C(v8, @"kHEIMObjectType", v4, (uint64_t)&v24);
        id v9 = (const __CFDictionary *)__b[2];
        CFTypeID v5 = CFStringGetTypeID();
        CFTypeRef v17 = sub_10000AF0C(v9, @"kHEIMAttrType", v5, (uint64_t)&v24);
        if (cf1 && !CFEqual(cf1, @"kHEIMObjectAny") && v17 && CFEqual(v17, @"kHEIMTypeSchema")) {
          CFDictionaryApplyFunction((CFDictionaryRef)qword_100024F58, (CFDictionaryApplierFunction)sub_10000D254, __b);
        }
        else {
          CFDictionaryApplyFunction( *(CFDictionaryRef *)(v28[7] + 24LL),  (CFDictionaryApplierFunction)sub_10000D368,  __b);
        }
      }
    }
  }

  else
  {
    id v23 = sub_10000EABC();
    char v22 = 16;
    if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_ERROR))
    {
      log = (os_log_s *)v23;
      os_log_type_t type = v22;
      sub_100002064(v21);
      _os_log_error_impl((void *)&_mh_execute_header, log, type, "query is missing command", v21, 2u);
    }

    objc_storeStrong(&v23, 0LL);
  }

  if (v24)
  {
    CFRelease(v24);
    CFTypeRef v24 = 0LL;
  }

  if (__b[2])
  {
    CFRelease((CFTypeRef)__b[2]);
    __b[2] = 0LL;
  }

  uint64_t v7 = __b[1];
  objc_storeStrong(&location, 0LL);
  return v7;
}

CFErrorRef sub_100006390( CFErrorRef result, CFIndex a2, const void *const *a3, const void *const *a4, CFIndex a5)
{
  CFTypeID v5 = result;
  if (!*(void *)result)
  {
    result = CFErrorCreateWithUserInfoKeysAndValues(0LL, @"com.apple.GSS.credential-store", a2, a3, a4, a5);
    *CFTypeID v5 = result;
  }

  return result;
}

void sub_100006404(uint64_t a1, uint64_t a2)
{
  CFTypeID v2 = CFGetTypeID((CFTypeRef)a1);
  if (v2 != sub_10001090C()) {
    heim_abort("cred wrong type:CFGetTypeID(cred) == HeimCredGetTypeID()");
  }
  if (!CFEqual(*(CFTypeRef *)(*(void *)(a1 + 32) + 16LL), @"kHEIMTypeNTLMRelfection"))
  {
    CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(*(void *)(a2 + 56) + 24LL), *(const void **)(a1 + 16));
    sub_100009890(*(CFDictionaryRef **)(a2 + 56), *(void *)(a1 + 16));
    if (*(void *)(*(void *)(a1 + 32) + 40LL)) {
      (*(void (**)(void))(*(void *)(a1 + 32) + 40LL))();
    }
    sub_10000D62C(a2, a1);
  }

void sub_100006504(void *a1, void *a2, void *a3)
{
  int v39 = a1;
  id location = 0LL;
  objc_storeStrong(&location, a2);
  id v37 = 0LL;
  objc_storeStrong(&v37, a3);
  CFTypeRef cf = sub_100010000(location, "uuid");
  CFTypeRef v34 = 0LL;
  id v33 = 0LL;
  if (cf)
  {
    if ((sub_100004A08(v39, cf, 0LL) & 1) != 0)
    {
      CFTypeRef Value = CFDictionaryGetValue(*(CFDictionaryRef *)(v39[7] + 24LL), cf);
      CFRelease(cf);
      CFTypeRef cf = 0LL;
      if (Value)
      {
        CFTypeID v19 = CFGetTypeID(Value);
        if (v19 != sub_10001090C()) {
          heim_abort("cred wrong type:CFGetTypeID(cred) == HeimCredGetTypeID()");
        }
        if (*((void *)Value + 3))
        {
          CFTypeRef MutableCopy = CFDictionaryCreateMutableCopy(0LL, 0LL, *((CFDictionaryRef *)Value + 3));
          if (!MutableCopy)
          {
            int v32 = 1;
            goto LABEL_75;
          }
        }

        else
        {
          CFTypeRef MutableCopy = CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
        }

        id v18 = location;
        CFTypeID TypeID = CFDictionaryGetTypeID();
        CFDictionaryRef theDict = (CFDictionaryRef)sub_100010074(v18, "attributes", TypeID);
        if (theDict)
        {
          v49[0] = @"kHEIMObjectType";
          v49[1] = @"kHEIMAttrType";
          v49[2] = @"kHEIMAttrAltDSID";
          v49[3] = @"kHEIMAttrUserID";
          v49[4] = @"kHEIMAttrRetainStatus";
          v49[5] = @"kHEIMAttrUUID";
          CFTypeID v4 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v49, 6LL);
          id v5 = v33;
          id v33 = v4;

          memset(__b, 0, sizeof(__b));
          id v16 = v33;
          id v17 = [v16 countByEnumeratingWithState:__b objects:v48 count:16];
          if (v17)
          {
            uint64_t v13 = *(void *)__b[2];
            uint64_t v14 = 0LL;
            id v15 = v17;
            while (1)
            {
              uint64_t v12 = v14;
              if (*(void *)__b[2] != v13) {
                objc_enumerationMutation(v16);
              }
              CFTypeRef key = *(void **)(__b[1] + 8 * v14);
              if (CFDictionaryContainsKey(theDict, key)) {
                break;
              }
              ++v14;
              if (v12 + 1 >= (unint64_t)v15)
              {
                uint64_t v14 = 0LL;
                id v15 = [v16 countByEnumeratingWithState:__b objects:v48 count:16];
                if (!v15) {
                  goto LABEL_30;
                }
              }
            }

            v47 = @"CommonErrorCode";
            CFBooleanRef v46 = kCFBooleanTrue;
            sub_100006390((CFErrorRef)&v34, 564487LL, (const void *const *)&v47, (const void *const *)&v46, 1LL);
            sub_100004850(v37, (__CFError *)v34);
            if (MutableCopy)
            {
              CFRelease(MutableCopy);
              CFTypeRef MutableCopy = 0LL;
            }

            if (theDict)
            {
              CFRelease(theDict);
              CFDictionaryRef theDict = 0LL;
            }

            int v32 = 8;
          }

          else
          {
LABEL_30:
            int v32 = 0;
          }

          if (v32)
          {
            if (v32 != 8) {
              goto LABEL_75;
            }
          }

          else if (CFEqual(*(CFTypeRef *)(*((void *)Value + 4) + 16LL), @"kHEIMTypeNTLMRelfection"))
          {
            v45 = @"CommonErrorCode";
            CFBooleanRef v44 = kCFBooleanTrue;
            sub_100006390((CFErrorRef)&v34, 564487LL, (const void *const *)&v45, (const void *const *)&v44, 1LL);
            sub_100004850(v37, (__CFError *)v34);
            if (MutableCopy)
            {
              CFRelease(MutableCopy);
              CFTypeRef MutableCopy = 0LL;
            }

            if (theDict)
            {
              CFRelease(theDict);
              CFDictionaryRef theDict = 0LL;
            }
          }

          else
          {
            CFBooleanRef BOOLean = (CFBooleanRef)CFDictionaryGetValue(theDict, @"kHEIMAttrDefaultCredential");
            BOOL v11 = 1;
            if (!sub_10000324C(*((const __CFDictionary **)Value + 3))) {
              BOOL v11 = sub_100004924(v39[7], *((const __CFDictionary **)Value + 3));
            }
            BOOL v26 = v11;
            if (v11 && BOOLean && CFBooleanGetValue(BOOLean))
            {
              v43 = @"CommonErrorCode";
              CFBooleanRef v42 = kCFBooleanTrue;
              sub_100006390((CFErrorRef)&v34, 564487LL, (const void *const *)&v43, (const void *const *)&v42, 1LL);
              sub_100004850(v37, (__CFError *)v34);
              if (MutableCopy)
              {
                CFRelease(MutableCopy);
                CFTypeRef MutableCopy = 0LL;
              }

              if (theDict)
              {
                CFRelease(theDict);
                CFDictionaryRef theDict = 0LL;
              }
            }

            else
            {
              BOOL v25 = 0;
              CFTypeRef v24 = CFDictionaryGetValue(theDict, @"kHEIMAttrBundleIdentifierACL");
              v25 = v24 && (CFTypeID v10 = CFGetTypeID(v24), v10 == CFArrayGetTypeID());
              if (!v25
                || (sub_1000059E4((uint64_t)v39) & 1) != 0
                || CFArrayGetCount((CFArrayRef)v24) == 1
                && (CFTypeRef cf1 = (CFTypeRef)v39[1],
                    ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)v24, 0LL),
                    CFEqual(cf1, ValueAtIndex)))
              {
                CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)sub_100006FA4, (void *)MutableCopy);
                if (theDict)
                {
                  CFRelease(theDict);
                  CFDictionaryRef theDict = 0LL;
                }

                if ((sub_100004634((const __CFDictionary *)MutableCopy, (__CFError *)&v34) & 1) != 0)
                {
                  sub_1000032CC(v39[7], (uint64_t)Value, (const __CFDictionary *)MutableCopy);
                  sub_100005848((uint64_t)v39, (const __CFDictionary *)MutableCopy);
                  if (*((void *)Value + 3))
                  {
                    CFRelease(*((CFTypeRef *)Value + 3));
                    *((void *)Value + 3) = 0LL;
                  }

                  *((void *)Value + 3) = MutableCopy;
                  byte_100024F6C = 1;
                  sub_100006FE0((uint64_t)Value);
                }

                else
                {
                  sub_100004850(v37, (__CFError *)v34);
                }
              }

              else
              {
                os_log_t oslog = (os_log_t)sub_10000EABC();
                os_log_type_t type = OS_LOG_TYPE_ERROR;
                if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
                {
                  log = oslog;
                  os_log_type_t v8 = type;
                  sub_100002064(v21);
                  _os_log_error_impl( (void *)&_mh_execute_header,  log,  v8,  "peer sent more then one bundle id and is not allowed if the acl does not match the app bundle id.",  v21,  2u);
                }

                objc_storeStrong((id *)&oslog, 0LL);
                v41 = @"CommonErrorCode";
                CFBooleanRef v40 = kCFBooleanTrue;
                sub_100006390((CFErrorRef)&v34, 564487LL, (const void *const *)&v41, (const void *const *)&v40, 1LL);
                sub_100004850(v37, (__CFError *)v34);
                if (MutableCopy)
                {
                  CFRelease(MutableCopy);
                  CFTypeRef MutableCopy = 0LL;
                }

                if (theDict)
                {
                  CFRelease(theDict);
                  CFDictionaryRef theDict = 0LL;
                }
              }
            }
          }
        }

        else if (MutableCopy)
        {
          CFRelease(MutableCopy);
          CFTypeRef MutableCopy = 0LL;
        }

        if (v34)
        {
          CFRelease(v34);
          CFTypeRef v34 = 0LL;
        }

        int v32 = 0;
      }

      else
      {
        int v32 = 1;
      }
    }

    else
    {
      CFRelease(cf);
      CFTypeRef cf = 0LL;
      int v32 = 1;
    }
  }

  else
  {
    int v32 = 1;
  }

LABEL_75:
  objc_storeStrong(&v33, 0LL);
  objc_storeStrong(&v37, 0LL);
  objc_storeStrong(&location, 0LL);
}

void sub_100006FA4(const void *a1, const void *a2, __CFDictionary *a3)
{
}

void sub_100006FE0(uint64_t a1)
{
  uint64_t v4 = a1;
  uint64_t v3 = 0LL;
  id location = (id)CFDictionaryGetValue( *(CFDictionaryRef *)(a1 + 24),  @"kHEIMAttrExpire");
  [location timeIntervalSince1970];
  uint64_t v3 = (uint64_t)v1;
  pthread_mutex_lock((pthread_mutex_t *)(v4 + 40));
  *(void *)(v4 + 128) = v3;
  if (location && sub_10000D6D8(v4)) {
    sub_100014AD8(v4, *(void *)(v4 + 128));
  }
  pthread_mutex_unlock((pthread_mutex_t *)(v4 + 40));
  objc_storeStrong(&location, 0LL);
}

void sub_1000070A0(void *a1, void *a2, void *a3)
{
  id v18 = a1;
  id location = 0LL;
  objc_storeStrong(&location, a2);
  id v16 = 0LL;
  objc_storeStrong(&v16, a3);
  uint64_t v15 = 0LL;
  CFUUIDRef v14 = sub_100010000(location, "uuid");
  if (v14)
  {
    if ((sub_100004A08(v18, v14, 0LL) & 1) != 0)
    {
      CFTypeRef Value = CFDictionaryGetValue(*(CFDictionaryRef *)(v18[7] + 24LL), v14);
      CFRelease(v14);
      CFUUIDRef v14 = 0LL;
      if (Value)
      {
        id v6 = location;
        CFTypeID TypeID = CFDictionaryGetTypeID();
        CFTypeRef cf = sub_100010074(v6, "attributes", TypeID);
        if (cf)
        {
          if (*(void *)(Value[4] + 32LL))
          {
            uint64_t v15 = (*(uint64_t (**)(void *, void *, CFTypeRef))(Value[4] + 32LL))(v18, Value, cf);
            if (v15) {
              sub_100010140(v16, "attributes", v15);
            }
          }

          else
          {
            os_log_t oslog = (os_log_t)sub_10000EABC();
            os_log_type_t type = OS_LOG_TYPE_ERROR;
            if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
            {
              log = oslog;
              os_log_type_t v5 = type;
              sub_100002064(v8);
              _os_log_error_impl( (void *)&_mh_execute_header,  log,  v5,  "no HeimCredAuthCallback defined for mech",  v8,  2u);
            }

            objc_storeStrong((id *)&oslog, 0LL);
          }

          if (cf)
          {
            CFRelease(cf);
            CFTypeRef cf = 0LL;
          }

          int v13 = 0;
        }

        else
        {
          int v13 = 1;
        }
      }

      else
      {
        int v13 = 1;
      }
    }

    else
    {
      CFRelease(v14);
      CFUUIDRef v14 = 0LL;
      int v13 = 1;
    }
  }

  else
  {
    int v13 = 1;
  }

  objc_storeStrong(&v16, 0LL);
  objc_storeStrong(&location, 0LL);
}

void sub_10000736C(void *a1, void *a2, void *a3)
{
  id v18 = a1;
  id location = 0LL;
  objc_storeStrong(&location, a2);
  id v16 = 0LL;
  objc_storeStrong(&v16, a3);
  uint64_t v15 = 0LL;
  CFUUIDRef v14 = sub_100010000(location, "uuid");
  if (v14)
  {
    if ((sub_100004A08(v18, v14, 0LL) & 1) != 0)
    {
      CFTypeRef Value = CFDictionaryGetValue(*(CFDictionaryRef *)(v18[7] + 24LL), v14);
      CFRelease(v14);
      CFUUIDRef v14 = 0LL;
      if (Value)
      {
        id v6 = location;
        CFTypeID TypeID = CFDictionaryGetTypeID();
        CFTypeRef cf = sub_100010074(v6, "attributes", TypeID);
        if (cf)
        {
          if (*(void *)(Value[4] + 32LL))
          {
            uint64_t v15 = (*(uint64_t (**)(void *, void *, CFTypeRef))(Value[4] + 32LL))(v18, Value, cf);
            if (v15) {
              sub_100010140(v16, "attributes", v15);
            }
          }

          else
          {
            os_log_t oslog = (os_log_t)sub_10000EABC();
            os_log_type_t type = OS_LOG_TYPE_ERROR;
            if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
            {
              log = oslog;
              os_log_type_t v5 = type;
              sub_100002064(v8);
              _os_log_error_impl( (void *)&_mh_execute_header,  log,  v5,  "no HeimCredAuthCallback defined for mech",  v8,  2u);
            }

            objc_storeStrong((id *)&oslog, 0LL);
          }

          if (cf)
          {
            CFRelease(cf);
            CFTypeRef cf = 0LL;
          }

          int v13 = 0;
        }

        else
        {
          int v13 = 1;
        }
      }

      else
      {
        int v13 = 1;
      }
    }

    else
    {
      CFRelease(v14);
      CFUUIDRef v14 = 0LL;
      int v13 = 1;
    }
  }

  else
  {
    int v13 = 1;
  }

  objc_storeStrong(&v16, 0LL);
  objc_storeStrong(&location, 0LL);
}

void sub_100007620(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = a1;
  id location = 0LL;
  objc_storeStrong(&location, a2);
  id v15 = 0LL;
  objc_storeStrong(&v15, a3);
  CFTypeRef cf = 0LL;
  id v13 = 0LL;
  CFDateRef value = 0LL;
  CFTypeRef v11 = 0LL;
  id v9 = location;
  CFTypeID TypeID = CFDataGetTypeID();
  id v18 = (id)sub_100010074(v9, "challenge", TypeID);
  id v10 = v18;
  if (v10)
  {
    if ((unint64_t)[v10 length] <= 8)
    {
      CFTypeRef v11 = CFUUIDCreate(0LL);
      if (v11)
      {
        CFDateRef value = (void *)sub_10001092C(v11);
        if (value)
        {
          v20[0] = @"kHEIMObjectType";
          v21[0] = @"kHEIMObjectNTLMReflection";
          v20[1] = @"kHEIMAttrType";
          v21[1] = @"kHEIMTypeNTLMRelfection";
          v20[2] = @"kHEIMAttrData";
          v21[2] = v10;
          uint64_t v7 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v21,  v20,  3LL);
          id v4 = -[NSDictionary mutableCopy](v7, "mutableCopy");
          id v5 = v13;
          id v13 = v4;

          if ((sub_100004634((const __CFDictionary *)v13, (__CFError *)&cf) & 1) != 0)
          {
            if ((sub_100002B44((uint64_t)value, (const __CFDictionary *)v13) & 1) != 0)
            {
              if (!*((void *)value + 4)) {
                heim_abort("mech is NULL, schame validation doesn't work ?:cred->mech != NULL");
              }
              sub_100005A5C((uint64_t)value, (__CFDictionary *)v13);
              id v19 = 0LL;
              objc_storeStrong(&v19, v13);
              id v6 = v19;
              objc_storeStrong(&v19, 0LL);
              *((void *)value + 3) = v6;
              CFDictionarySetValue( *(CFMutableDictionaryRef *)(*(void *)(v17 + 56) + 32LL),  *((const void **)value + 2),  value);
              byte_100024F6C = 1;
            }
          }

          else
          {
            sub_100004850(v15, (__CFError *)cf);
            if (cf)
            {
              CFRelease(cf);
              CFTypeRef cf = 0LL;
            }
          }
        }
      }

      if (cf)
      {
        CFRelease(cf);
        CFTypeRef cf = 0LL;
      }

      if (value)
      {
        CFRelease(value);
        CFDateRef value = 0LL;
      }

      if (v11)
      {
        CFRelease(v11);
        CFTypeRef v11 = 0LL;
      }
    }

    else
    {
      sub_100006390((CFErrorRef)&cf, 564488LL, 0LL, 0LL, 0LL);
      sub_100004850(v15, (__CFError *)cf);
      if (cf)
      {
        CFRelease(cf);
        CFTypeRef cf = 0LL;
      }
    }
  }

  else
  {
    sub_100006390((CFErrorRef)&cf, 564486LL, 0LL, 0LL, 0LL);
    sub_100004850(v15, (__CFError *)cf);
    if (cf)
    {
      CFRelease(cf);
      CFTypeRef cf = 0LL;
    }
  }

  objc_storeStrong(&v10, 0LL);
  objc_storeStrong(&v13, 0LL);
  objc_storeStrong(&v15, 0LL);
  objc_storeStrong(&location, 0LL);
}

uint64_t sub_100007AA4(void *a1, uint64_t a2)
{
  id v19 = a1;
  uint64_t v18 = a2;
  uint64_t v13 = 0LL;
  CFUUIDRef v14 = &v13;
  int v15 = 0x20000000;
  int v16 = 32;
  char v17 = 0;
  if ((byte_100024ED1 & 1) != 0)
  {
    char v20 = 0;
    int v12 = 1;
  }

  else
  {
    id v11 = +[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v18, 8LL);
    if (v11)
    {
      if (*(void *)(v19[7] + 32LL))
      {
        id v10 = *(id *)(v19[7] + 32LL);
        id v3 = v10;
        id v4 = _NSConcreteStackBlock;
        int v5 = -1073741824;
        int v6 = 0;
        uint64_t v7 = sub_100007CC4;
        os_log_type_t v8 = &unk_100020A80;
        v9[2] = v19;
        v9[0] = v11;
        v9[1] = &v13;
        [v3 enumerateKeysAndObjectsUsingBlock:&v4];
        char v20 = v14[3] & 1;
        int v12 = 1;
        objc_storeStrong(v9, 0LL);
        objc_storeStrong(&v10, 0LL);
      }

      else
      {
        char v20 = 0;
        int v12 = 1;
      }
    }

    else
    {
      char v20 = 0;
      int v12 = 1;
    }

    objc_storeStrong(&v11, 0LL);
  }

  _Block_object_dispose(&v13, 8);
  return v20 & 1;
}

void sub_100007CC4(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  location[1] = (id)a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v11 = 0LL;
  objc_storeStrong(&v11, a3);
  id v10 = a4;
  uint64_t v9 = a1;
  id v8 = v11;
  if (sub_100002C84((CFDictionaryRef *)v11))
  {
    CFDictionaryRemoveValue( *(CFMutableDictionaryRef *)(*(void *)(*(void *)(a1 + 48) + 56LL) + 32LL),  *((const void **)v8 + 2));
    byte_100024F6C = 1;
  }

  id v7 = (id)CFDictionaryGetValue(*((CFDictionaryRef *)v8 + 3), @"kHEIMAttrData");
  if ([*(id *)(a1 + 32) isEqualToData:v7])
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
    *id v10 = 1;
  }

  objc_storeStrong(&v7, 0LL);
  objc_storeStrong(&v11, 0LL);
  objc_storeStrong(location, 0LL);
}

void sub_100007DE8(void *a1, void *a2, void *a3)
{
  id v10 = a1;
  id location = 0LL;
  objc_storeStrong(&location, a2);
  id v8 = 0LL;
  objc_storeStrong(&v8, a3);
  id v7 = 0LL;
  id v5 = location;
  CFTypeID TypeID = CFDataGetTypeID();
  id v11 = (id)sub_100010074(v5, "challenge", TypeID);
  id v6 = v11;
  if (v6)
  {
    if ((unint64_t)[v6 length] <= 8)
    {
      if (sub_100007AA4(v10, (uint64_t)[v6 bytes]))
      {
        sub_100006390((CFErrorRef)&v7, 564489LL, 0LL, 0LL, 0LL);
        sub_100004850(v8, v7);
        if (v7)
        {
          CFRelease(v7);
          id v7 = 0LL;
        }
      }

      else
      {
        sub_100010140(v8, "challenge-result", (uint64_t)kCFBooleanFalse);
      }
    }

    else
    {
      sub_100006390((CFErrorRef)&v7, 564488LL, 0LL, 0LL, 0LL);
      sub_100004850(v8, v7);
      if (v7)
      {
        CFRelease(v7);
        id v7 = 0LL;
      }
    }
  }

  else
  {
    sub_100006390((CFErrorRef)&v7, 564486LL, 0LL, 0LL, 0LL);
    sub_100004850(v8, v7);
    if (v7)
    {
      CFRelease(v7);
      id v7 = 0LL;
    }
  }

  objc_storeStrong(&v6, 0LL);
  objc_storeStrong(&v8, 0LL);
  objc_storeStrong(&location, 0LL);
}

void sub_100008030(void *a1, void *a2, void *a3)
{
  int v12 = a1;
  id location = 0LL;
  objc_storeStrong(&location, a2);
  id v10 = 0LL;
  objc_storeStrong(&v10, a3);
  CFUUIDRef v9 = sub_100010000(location, "uuid");
  if (v9)
  {
    if ((sub_100004A08(v12, v9, 0LL) & 1) != 0)
    {
      CFTypeRef Value = CFDictionaryGetValue(*(CFDictionaryRef *)(v12[7] + 24LL), v9);
      CFRelease(v9);
      CFUUIDRef v9 = 0LL;
      if (Value)
      {
        if (sub_100008300(*((void *)Value + 4), (uint64_t)"fetch"))
        {
          CFTypeRef cf = 0LL;
          CFTypeRef v5 = sub_100005B54(*((const __CFDictionary **)Value + 3), (__CFError *)&cf);
          if (cf)
          {
            os_log_t oslog = (os_log_t)sub_10000EABC();
            if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
            {
              sub_1000045F4((uint64_t)v13, (uint64_t)cf);
              _os_log_error_impl( (void *)&_mh_execute_header,  oslog,  OS_LOG_TYPE_ERROR,  "error filtering attributes: %@",  v13,  0xCu);
            }

            objc_storeStrong((id *)&oslog, 0LL);
            if (cf)
            {
              CFRelease(cf);
              CFTypeRef cf = 0LL;
            }
          }

          sub_100010140(v10, "attributes", (uint64_t)v5);
          if (v5)
          {
            CFRelease(v5);
            CFTypeRef v5 = 0LL;
          }

          int v8 = 0;
        }

        else
        {
          int v8 = 1;
        }
      }

      else
      {
        int v8 = 1;
      }
    }

    else
    {
      CFRelease(v9);
      CFUUIDRef v9 = 0LL;
      int v8 = 1;
    }
  }

  else
  {
    int v8 = 1;
  }

  objc_storeStrong(&v10, 0LL);
  objc_storeStrong(&location, 0LL);
}

BOOL sub_100008300(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = a1;
  uint64_t v4 = a2;
  if (!a1) {
    heim_abort("mech is required:mech != NULL");
  }
  if (!v4) {
    heim_abort("command is required:cmd != NULL");
  }
  id location = +[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", v4, 4LL);
  BOOL v6 = (*(_BYTE *)(v5 + 56) & 1) == 0
    || !*(void *)(v5 + 64)
    || ([*(id *)(v5 + 64) containsObject:location] & 1) == 0;
  objc_storeStrong(&location, 0LL);
  return v6;
}

void sub_100008430(void *a1, void *a2, void *a3)
{
  int v12 = a1;
  id location = 0LL;
  objc_storeStrong(&location, a2);
  id v10 = 0LL;
  objc_storeStrong(&v10, a3);
  CFMutableArrayRef Mutable = 0LL;
  CFTypeRef cf = 0LL;
  sub_100005AE8((uint64_t)v12);
  theArray = (const __CFArray *)sub_100005F4C(v12, location, "query");
  if (theArray)
  {
    CFMutableArrayRef Mutable = CFArrayCreateMutable(0LL, 0LL, &kCFTypeArrayCallBacks);
    if (Mutable)
    {
      uint64_t Count = CFArrayGetCount(theArray);
      if (Count > 1)
      {
        uint64_t v14 = 0LL;
        uint64_t v13 = Count;
        uint64_t v15 = 0LL;
        uint64_t v16 = Count;
        v19.id location = 0LL;
        v19.length = Count;
        CFArraySortValues(theArray, v19, (CFComparatorFunction)sub_100008720, 0LL);
      }

      for (CFIndex idx = 0LL; idx < Count; ++idx)
      {
        ValueAtIndex = (const void **)CFArrayGetValueAtIndex(theArray, idx);
        CFArrayAppendValue(Mutable, ValueAtIndex[2]);
      }

      CFRelease(theArray);
      theArray = 0LL;
      sub_100010140(v10, "items", (uint64_t)Mutable);
    }
  }

  else
  {
    uint64_t v18 = @"CommonErrorCode";
    CFBooleanRef v17 = kCFBooleanTrue;
    sub_100006390((CFErrorRef)&cf, 564483LL, (const void *const *)&v18, (const void *const *)&v17, 1LL);
  }

  if (cf)
  {
    sub_100004850(v10, (__CFError *)cf);
    if (cf)
    {
      CFRelease(cf);
      CFTypeRef cf = 0LL;
    }
  }

  if (Mutable)
  {
    CFRelease(Mutable);
    CFMutableArrayRef Mutable = 0LL;
  }

  if (theArray) {
    CFRelease(theArray);
  }
  objc_storeStrong(&v10, 0LL);
  objc_storeStrong(&location, 0LL);
}

CFComparisonResult sub_100008720(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = a1;
  uint64_t v19 = a2;
  uint64_t v18 = a3;
  uint64_t v17 = a1;
  uint64_t v16 = a2;
  CFTypeRef Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 24), @"kHEIMAttrParentCredential");
  CFTypeRef v14 = CFDictionaryGetValue(*(CFDictionaryRef *)(v16 + 24), @"kHEIMAttrParentCredential");
  if (Value && v14 && CFEqual(Value, v14))
  {
    CFBooleanRef v13 = (CFBooleanRef)CFDictionaryGetValue(*(CFDictionaryRef *)(v17 + 24), @"kHEIMAttrLeadCredential");
    CFBooleanRef v12 = (CFBooleanRef)CFDictionaryGetValue(*(CFDictionaryRef *)(v16 + 24), @"kHEIMAttrLeadCredential");
    if (v13 && CFBooleanGetValue(v13)) {
      return -1LL;
    }
    if (v12 && CFBooleanGetValue(v12)) {
      return 1LL;
    }
  }

  CFTypeRef cf = 0LL;
  id v7 = *(const __CFDictionary **)(v17 + 24);
  CFTypeID TypeID = CFDateGetTypeID();
  theDate = (const __CFDate *)sub_10000AF0C(v7, @"kHEIMAttrStoreTime", TypeID, (uint64_t)&cf);
  if (cf)
  {
    CFRelease(cf);
    CFTypeRef cf = 0LL;
  }

  BOOL v6 = *(const __CFDictionary **)(v16 + 24);
  CFTypeID v4 = CFDateGetTypeID();
  otherDate = (const __CFDate *)sub_10000AF0C(v6, @"kHEIMAttrStoreTime", v4, (uint64_t)&cf);
  if (cf)
  {
    CFRelease(cf);
    CFTypeRef cf = 0LL;
  }

  if (theDate && otherDate) {
    return CFDateCompare(theDate, otherDate, 0LL);
  }
  int64_t v8 = CFHash(*(CFTypeRef *)(v17 + 16));
  else {
    return -1LL;
  }
}

void sub_1000089E4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = a1;
  id location = 0LL;
  objc_storeStrong(&location, a2);
  id v9 = 0LL;
  objc_storeStrong(&v9, a3);
  int64_t v8 = 0LL;
  sub_100005AE8(v11);
  id v5 = location;
  CFTypeID TypeID = CFStringGetTypeID();
  CFTypeRef key = sub_100010074(v5, "mech", TypeID);
  if (key
    && ((CFTypeRef Value = CFDictionaryGetValue(*(CFDictionaryRef *)(*(void *)(v11 + 56) + 40LL), key)) != 0LL
     || (*(_DWORD *)(*(void *)(v11 + 56) + 48LL) = 1,
         sub_100005AE8(v11),
         (CFTypeRef Value = CFDictionaryGetValue(*(CFDictionaryRef *)(*(void *)(v11 + 56) + 40LL), key)) != 0LL)))
  {
    sub_100010140(v9, "default", (uint64_t)Value);
  }

  else
  {
    sub_100006390((CFErrorRef)&v8, 564483LL, 0LL, 0LL, 0LL);
  }

  if (v8)
  {
    sub_100004850(v9, v8);
    if (v8)
    {
      CFRelease(v8);
      int64_t v8 = 0LL;
    }
  }

  if (key) {
    CFRelease(key);
  }
  objc_storeStrong(&v9, 0LL);
  objc_storeStrong(&location, 0LL);
}

void sub_100008BE8(void *a1, void *a2, void *a3)
{
  v48 = a1;
  id location = 0LL;
  objc_storeStrong(&location, a2);
  id v46 = 0LL;
  objc_storeStrong(&v46, a3);
  v45 = 0LL;
  id v16 = location;
  CFTypeID v3 = CFUUIDGetTypeID();
  CFTypeRef v44 = sub_100010074(v16, "from", v3);
  id v17 = location;
  CFTypeID v4 = CFUUIDGetTypeID();
  CFTypeRef v43 = sub_100010074(v17, "to", v4);
  if (v44 && v43 && !CFEqual(v44, v43))
  {
    if ((sub_100004A08(v48, v44, 0LL) & 1) != 0 && (sub_100004A08(v48, v43, 0LL) & 1) != 0)
    {
      char v35 = CFDictionaryGetValue(*(CFDictionaryRef *)(v48[7] + 24LL), v44);
      CFTypeRef v34 = CFDictionaryGetValue(*(CFDictionaryRef *)(v48[7] + 24LL), v43);
      uint64_t v33 = 0LL;
      if (v35)
      {
        if (v35 == v34) {
          heim_abort("must not be same:credfrom != credto");
        }
        if (!v34 || CFEqual(*(CFTypeRef *)(*((void *)v35 + 4) + 16LL), *(CFTypeRef *)(*((void *)v34 + 4) + 16LL)))
        {
          if (CFEqual(*(CFTypeRef *)(*((void *)v35 + 4) + 16LL), @"kHEIMTypeNTLMRelfection"))
          {
            os_log_t v26 = (os_log_t)sub_10000EABC();
            os_log_type_t v25 = OS_LOG_TYPE_ERROR;
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            {
              id v5 = v26;
              os_log_type_t v6 = v25;
              sub_100002064(v24);
              _os_log_error_impl( (void *)&_mh_execute_header,  v5,  v6,  "moving NTLM Reflection objects is not allowed",  v24,  2u);
            }

            objc_storeStrong((id *)&v26, 0LL);
            v50 = @"CommonErrorCode";
            CFBooleanRef v49 = kCFBooleanTrue;
            sub_100006390((CFErrorRef)&v45, 564487LL, (const void *const *)&v50, (const void *const *)&v49, 1LL);
            sub_100004850(v46, v45);
            if (v45)
            {
              CFRelease(v45);
              v45 = 0LL;
            }

            if (v44)
            {
              CFRelease(v44);
              CFTypeRef v44 = 0LL;
            }

            if (v43)
            {
              CFRelease(v43);
              CFTypeRef v43 = 0LL;
            }
          }

          CFMutableDictionaryRef theDict = CFDictionaryCreateMutableCopy(0LL, 0LL, *((CFDictionaryRef *)v35 + 3));
          CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(v48[7] + 24LL), v44);
          char v35 = 0LL;
          if (sub_10000324C(theDict) && (!v34 || !sub_10000324C(*((const __CFDictionary **)v34 + 3)))) {
            CFDictionaryRemoveValue(theDict, @"kHEIMAttrTemporaryCache");
          }
          CFDictionarySetValue(theDict, @"kHEIMAttrUUID", v43);
          if (v34)
          {
            CFDateRef value = (void *)CFDictionaryGetValue(*((CFDictionaryRef *)v34 + 3), @"kHEIMAttrParentCredential");
            if (value) {
              CFDictionarySetValue(theDict, @"kHEIMAttrParentCredential", value);
            }
            CFBooleanRef BOOLean = (CFBooleanRef)CFDictionaryGetValue( *((CFDictionaryRef *)v34 + 3),  @"kHEIMAttrDefaultCredential");
            if (BOOLean && CFBooleanGetValue(BOOLean)) {
              CFDictionarySetValue(theDict, @"kHEIMAttrDefaultCredential", kCFBooleanTrue);
            }
            CFBooleanRef v20 = (CFBooleanRef)CFDictionaryGetValue(theDict, @"kHEIMAttrDefaultCredential");
            if (v20 && CFBooleanGetValue(v20)) {
              CFDictionarySetValue( *(CFMutableDictionaryRef *)(v48[7] + 40LL),  *(const void **)(*((void *)v34 + 4) + 16LL),  *((const void **)v34 + 2));
            }
            if (*((void *)v34 + 3))
            {
              CFRelease(*((CFTypeRef *)v34 + 3));
              *((void *)v34 + 3) = 0LL;
            }

            *((void *)v34 + 3) = theDict;
            uint64_t v33 = *((void *)v34 + 4);
          }

          else
          {
            CFTypeRef v34 = (const void *)sub_10001092C(v43);
            if (!v34) {
              heim_abort("out of memory:credto != NULL");
            }
            sub_100002B44((uint64_t)v34, theDict);
            *((void *)v34 + 3) = theDict;
            CFDictionarySetValue(*(CFMutableDictionaryRef *)(v48[7] + 24LL), *((const void **)v34 + 2), v34);
            uint64_t v33 = *((void *)v34 + 4);
            if (v34)
            {
              CFRelease(v34);
              CFTypeRef v34 = 0LL;
            }
          }

          sub_100009890((CFDictionaryRef *)v48[7], (uint64_t)v43);
          context[0] = v44;
          context[1] = v43;
          CFDictionaryApplyFunction( *(CFDictionaryRef *)(v48[7] + 24LL),  (CFDictionaryApplierFunction)sub_100009980,  context);
          if (v33 && *(void *)(v33 + 40)) {
            (*(void (**)(void))(v33 + 40))();
          }
          byte_100024F6C = 1;
          if (v33)
          {
            CFTypeRef key = (void *)CFDictionaryGetValue(*(CFDictionaryRef *)(v48[7] + 40LL), *(const void **)(v33 + 16));
            if (!key || !CFDictionaryGetValue(*(CFDictionaryRef *)(v48[7] + 24LL), key))
            {
              *(_DWORD *)(v48[7] + 48LL) = 1;
              sub_100005AE8((uint64_t)v48);
            }
          }

          uint64_t v33 = 0LL;
          int v39 = 0;
        }

        else
        {
          os_log_t oslog = (os_log_t)sub_10000EABC();
          os_log_type_t v28 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
          {
            id v7 = oslog;
            os_log_type_t v8 = v28;
            sub_100002064(v27);
            _os_log_error_impl((void *)&_mh_execute_header, v7, v8, "moving between mechs is not supported", v27, 2u);
          }

          objc_storeStrong((id *)&oslog, 0LL);
          v52 = @"CommonErrorCode";
          CFBooleanRef v51 = kCFBooleanTrue;
          sub_100006390((CFErrorRef)&v45, 564487LL, (const void *const *)&v52, (const void *const *)&v51, 1LL);
          sub_100004850(v46, v45);
          if (v45)
          {
            CFRelease(v45);
            v45 = 0LL;
          }

          if (v44)
          {
            CFRelease(v44);
            CFTypeRef v44 = 0LL;
          }

          if (v43)
          {
            CFRelease(v43);
            CFTypeRef v43 = 0LL;
          }

          int v39 = 1;
        }
      }

      else
      {
        id v32 = sub_10000EABC();
        char v31 = 16;
        if (os_log_type_enabled((os_log_t)v32, OS_LOG_TYPE_ERROR))
        {
          id v9 = (os_log_s *)v32;
          os_log_type_t v10 = v31;
          sub_100002064(v30);
          _os_log_error_impl((void *)&_mh_execute_header, v9, v10, "from is empty", v30, 2u);
        }

        objc_storeStrong(&v32, 0LL);
        if (v44)
        {
          CFRelease(v44);
          CFTypeRef v44 = 0LL;
        }

        if (v43)
        {
          CFRelease(v43);
          CFTypeRef v43 = 0LL;
        }

        int v39 = 1;
      }
    }

    else
    {
      id v38 = sub_10000EABC();
      char v37 = 16;
      if (os_log_type_enabled((os_log_t)v38, OS_LOG_TYPE_ERROR))
      {
        uint64_t v11 = (os_log_s *)v38;
        os_log_type_t v12 = v37;
        sub_100002064(v36);
        _os_log_error_impl((void *)&_mh_execute_header, v11, v12, "no access to caches", v36, 2u);
      }

      objc_storeStrong(&v38, 0LL);
      v54 = @"CommonErrorCode";
      CFBooleanRef v53 = kCFBooleanTrue;
      sub_100006390((CFErrorRef)&v45, 564480LL, (const void *const *)&v54, (const void *const *)&v53, 1LL);
      sub_100004850(v46, v45);
      if (v45)
      {
        CFRelease(v45);
        v45 = 0LL;
      }

      if (v44)
      {
        CFRelease(v44);
        CFTypeRef v44 = 0LL;
      }

      if (v43)
      {
        CFRelease(v43);
        CFTypeRef v43 = 0LL;
      }

      int v39 = 1;
    }
  }

  else
  {
    if (v44)
    {
      CFRelease(v44);
      CFTypeRef v44 = 0LL;
    }

    if (v43)
    {
      CFRelease(v43);
      CFTypeRef v43 = 0LL;
    }

    id v42 = sub_10000EABC();
    char v41 = 16;
    if (os_log_type_enabled((os_log_t)v42, OS_LOG_TYPE_ERROR))
    {
      log = (os_log_s *)v42;
      os_log_type_t type = v41;
      sub_100002064(v40);
      _os_log_error_impl((void *)&_mh_execute_header, log, type, "move missing required values", v40, 2u);
    }

    objc_storeStrong(&v42, 0LL);
    v56 = @"CommonErrorCode";
    CFBooleanRef v55 = kCFBooleanTrue;
    sub_100006390((CFErrorRef)&v45, 564486LL, (const void *const *)&v56, (const void *const *)&v55, 1LL);
    sub_100004850(v46, v45);
    if (v45)
    {
      CFRelease(v45);
      v45 = 0LL;
    }

    int v39 = 1;
  }

  objc_storeStrong(&v46, 0LL);
  objc_storeStrong(&location, 0LL);
}

void sub_100009890(CFDictionaryRef *a1, uint64_t a2)
{
  os_log_type_t v8 = a1;
  uint64_t v7 = a2;
  uint64_t v4 = a2;
  CFArrayRef theArray = 0LL;
  os_log_type_t v6 = a1;
  CFArrayRef theArray = CFArrayCreateMutable(0LL, 0LL, &kCFTypeArrayCallBacks);
  CFDictionaryApplyFunction(v8[3], (CFDictionaryApplierFunction)sub_10000D764, &v4);
  CFTypeID v3 = theArray;
  CFIndex Count = CFArrayGetCount(theArray);
  uint64_t v10 = 0LL;
  CFIndex v9 = Count;
  uint64_t v11 = 0LL;
  CFIndex v12 = Count;
  v13.id location = 0LL;
  v13.length = Count;
  CFArrayApplyFunction(v3, v13, (CFArrayApplierFunction)sub_10000D8A4, v8);
  if (theArray) {
    CFRelease(theArray);
  }
}

void sub_100009980(uint64_t a1, CFDictionaryRef *a2, CFTypeRef *a3)
{
  CFTypeID v3 = CFGetTypeID(a2);
  if (v3 != sub_10001090C()) {
    heim_abort("cred wrong type:CFGetTypeID(cred) == HeimCredGetTypeID()");
  }
  CFTypeRef cf1 = CFDictionaryGetValue(a2[3], @"kHEIMAttrParentCredential");
  if (cf1 && CFEqual(cf1, *a3))
  {
    CFMutableDictionaryRef theDict = CFDictionaryCreateMutableCopy(0LL, 0LL, a2[3]);
    if (a2[3])
    {
      CFRelease(a2[3]);
      a2[3] = 0LL;
    }

    CFDictionarySetValue(theDict, @"kHEIMAttrParentCredential", a3[1]);
    a2[3] = theDict;
  }

void sub_100009AC4(void *a1, void *a2, void *a3)
{
  CFIndex v9 = a1;
  id location = 0LL;
  objc_storeStrong(&location, a2);
  id v7 = 0LL;
  objc_storeStrong(&v7, a3);
  int v6 = off_100024E98(*v9);
  if (!v6 || (off_100024E90(v9, "com.apple.private.gssapi.credential-introspection") & 1) != 0)
  {
    context = xpc_dictionary_create(0LL, 0LL, 0LL);
    CFDictionaryApplyFunction((CFDictionaryRef)qword_100024F40, (CFDictionaryApplierFunction)sub_100009C38, context);
    xpc_dictionary_set_value(v7, "items", context);
    objc_storeStrong(&context, 0LL);
  }

  else {
    xpc_dictionary_set_int64(v7, "cache-size", v5.st_size);
  }
  objc_storeStrong(&v7, 0LL);
  objc_storeStrong(&location, 0LL);
}

void sub_100009C38(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v10 = a1;
  uint64_t v9 = a2;
  os_log_type_t v8 = a3;
  uint64_t v7 = a2;
  id location = a3;
  context = xpc_dictionary_create(0LL, 0LL, 0LL);
  CFDictionaryApplyFunction(*(CFDictionaryRef *)(v7 + 24), (CFDictionaryApplierFunction)sub_10000D920, context);
  CFTypeRef cf = CFStringCreateWithFormat(0LL, 0LL, @"%@", v10);
  CFTypeRef key = rk_cfstring2cstring(cf);
  xpc_dictionary_set_value(location, key, context);
  free(key);
  if (cf) {
    CFRelease(cf);
  }
  objc_storeStrong(&context, 0LL);
  objc_storeStrong(&location, 0LL);
}

void sub_100009D34(void *a1, void *a2, void *a3)
{
  uint64_t v18 = a1;
  id location = 0LL;
  objc_storeStrong(&location, a2);
  id v16 = 0LL;
  objc_storeStrong(&v16, a3);
  uint64_t v15 = 0LL;
  CFTypeRef v14 = 0LL;
  int v13 = off_100024E98(*v18);
  if (v13 || (off_100024E90(v18, "com.apple.private.gssapi.deleteall") & 1) == 0)
  {
    id v21 = @"CommonErrorCode";
    CFBooleanRef v20 = kCFBooleanTrue;
    sub_100006390((CFErrorRef)&v15, 564484LL, (const void *const *)&v21, (const void *const *)&v20, 1LL);
    os_log_t v6 = (os_log_t)sub_10000EABC();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      sub_1000045F4((uint64_t)v19, (uint64_t)v15);
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Error in DeleteAll: %@", v19, 0xCu);
    }

    objc_storeStrong((id *)&v6, 0LL);
  }

  else
  {
    os_log_t oslog = (os_log_t)sub_10000EABC();
    os_log_type_t type = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
    {
      log = oslog;
      os_log_type_t v4 = type;
      sub_100002064(v10);
      _os_log_impl((void *)&_mh_execute_header, log, v4, "Start of delete all", v10, 2u);
    }

    objc_storeStrong((id *)&oslog, 0LL);
    CFTypeRef v14 = (const __CFArray *)sub_100005F4C(v18, location, "query");
    if (v14)
    {
      CFIndex Count = CFArrayGetCount(v14);
      for (CFIndex idx = 0LL; idx < Count; ++idx)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v14, idx);
        sub_100006404((uint64_t)ValueAtIndex, (uint64_t)v18);
      }

      byte_100024F6C = 1;
    }

    else
    {
      id v23 = @"CommonErrorCode";
      CFBooleanRef v22 = kCFBooleanTrue;
      sub_100006390((CFErrorRef)&v15, 564483LL, (const void *const *)&v23, (const void *const *)&v22, 1LL);
    }
  }

  if (v15)
  {
    sub_100004850(v16, v15);
    if (v15)
    {
      CFRelease(v15);
      uint64_t v15 = 0LL;
    }
  }

  if (v14)
  {
    CFRelease(v14);
    CFTypeRef v14 = 0LL;
  }

  objc_storeStrong(&v16, 0LL);
  objc_storeStrong(&location, 0LL);
}

void sub_10000A0D4(void *a1, void *a2, void *a3)
{
  os_log_t v26 = a1;
  id location = 0LL;
  objc_storeStrong(&location, a2);
  id v24 = 0LL;
  objc_storeStrong(&v24, a3);
  id v8 = location;
  CFTypeID v3 = CFUUIDGetTypeID();
  CFTypeRef v23 = sub_100010074(v8, "uuid", v3);
  CFTypeRef v21 = 0LL;
  if (v23)
  {
    id v19 = sub_10000EABC();
    os_log_type_t v18 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_DEBUG))
    {
      sub_1000045F4((uint64_t)v29, (uint64_t)v23);
      _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)v19, v18, "do_RetainCache: %@", v29, 0xCu);
    }

    objc_storeStrong(&v19, 0LL);
    if ((sub_100004A08(v26, v23, 0LL) & 1) != 0)
    {
      CFTypeRef Value = CFDictionaryGetValue(*(CFDictionaryRef *)(v26[7] + 24LL), v23);
      if (v23)
      {
        CFRelease(v23);
        CFTypeRef v23 = 0LL;
      }

      if (Value)
      {
        CFTypeID v6 = CFGetTypeID(Value);
        if (v6 != sub_10001090C()) {
          heim_abort("cred wrong type:CFGetTypeID(cred) == HeimCredGetTypeID()");
        }
        if (CFEqual(*(CFTypeRef *)(*((void *)Value + 4) + 16LL), @"kHEIMTypeNTLMRelfection"))
        {
          id v16 = sub_10000EABC();
          char v15 = 16;
          if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR))
          {
            os_log_type_t v4 = (os_log_s *)v16;
            os_log_type_t v5 = v15;
            sub_100002064(v14);
            _os_log_error_impl( (void *)&_mh_execute_header,  v4,  v5,  "NTLM Reflection objects can't be retained",  v14,  2u);
          }

          objc_storeStrong(&v16, 0LL);
          int v20 = 1;
        }

        else
        {
          if (*((void *)Value + 3))
          {
            CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(0LL, 0LL, *((CFDictionaryRef *)Value + 3));
            if (!MutableCopy)
            {
              int v20 = 1;
              goto LABEL_39;
            }
          }

          else
          {
            CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
          }

          unsigned int v12 = -1;
          id v13 = (id)CFDictionaryGetValue(MutableCopy, @"kHEIMAttrRetainStatus");

          if (v13)
          {
            unsigned int v12 = [v13 intValue] + 1;
            os_log_t oslog = (os_log_t)sub_10000EABC();
            os_log_type_t v10 = OS_LOG_TYPE_DEBUG;
            if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
            {
              sub_10000A6F8((uint64_t)v28, v12, *((void *)Value + 2));
              _os_log_debug_impl((void *)&_mh_execute_header, oslog, v10, "the new count is %d for %@", v28, 0x12u);
            }

            objc_storeStrong((id *)&oslog, 0LL);
            CFDictionarySetValue( MutableCopy,  @"kHEIMAttrRetainStatus",  +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v12));
            if (*((void *)Value + 3))
            {
              CFRelease(*((CFTypeRef *)Value + 3));
              *((void *)Value + 3) = 0LL;
            }

            *((void *)Value + 3) = MutableCopy;
            byte_100024F6C = 1;
          }

          else
          {
            os_log_t v9 = (os_log_t)sub_10000EABC();
            if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
            {
              sub_1000045F4((uint64_t)v27, *((void *)Value + 2));
              _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "the retain count is missing: %@",  v27,  0xCu);
            }

            objc_storeStrong((id *)&v9, 0LL);
            if (MutableCopy)
            {
              CFRelease(MutableCopy);
              CFMutableDictionaryRef MutableCopy = 0LL;
            }
          }

          if (v21)
          {
            CFRelease(v21);
            CFTypeRef v21 = 0LL;
          }

          objc_storeStrong(&v13, 0LL);
          int v20 = 0;
        }
      }

      else
      {
        int v20 = 1;
      }
    }

    else
    {
      if (v23)
      {
        CFRelease(v23);
        CFTypeRef v23 = 0LL;
      }

      int v20 = 1;
    }
  }

  else
  {
    int v20 = 1;
  }

LABEL_39:
  objc_storeStrong(&v24, 0LL);
  objc_storeStrong(&location, 0LL);
}

uint64_t sub_10000A6F8(uint64_t result, int a2, uint64_t a3)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 0;
  *(_BYTE *)(result + 3) = 4;
  *(_DWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 8) = 64;
  *(_BYTE *)(result + 9) = 8;
  *(void *)(result + 10) = a3;
  return result;
}

void sub_10000A74C(void *a1, void *a2, void *a3)
{
  os_log_type_t v28 = a1;
  id location = 0LL;
  objc_storeStrong(&location, a2);
  id v26 = 0LL;
  objc_storeStrong(&v26, a3);
  id v8 = location;
  CFTypeID v3 = CFUUIDGetTypeID();
  CFTypeRef v25 = sub_100010074(v8, "uuid", v3);
  CFTypeRef v23 = 0LL;
  if (v25)
  {
    id v21 = sub_10000EABC();
    os_log_type_t v20 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_DEBUG))
    {
      sub_1000045F4((uint64_t)v32, (uint64_t)v25);
      _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)v21, v20, "do_ReleaseCache: %@", v32, 0xCu);
    }

    objc_storeStrong(&v21, 0LL);
    if ((sub_100004A08(v28, v25, 0LL) & 1) != 0)
    {
      CFTypeRef Value = CFDictionaryGetValue(*(CFDictionaryRef *)(v28[7] + 24LL), v25);
      if (v25)
      {
        CFRelease(v25);
        CFTypeRef v25 = 0LL;
      }

      if (Value)
      {
        CFRetain(Value);
        CFTypeID v6 = CFGetTypeID(Value);
        if (v6 != sub_10001090C()) {
          heim_abort("cred wrong type:CFGetTypeID(cred) == HeimCredGetTypeID()");
        }
        if (CFEqual(*(CFTypeRef *)(*((void *)Value + 4) + 16LL), @"kHEIMTypeNTLMRelfection"))
        {
          id v18 = sub_10000EABC();
          char v17 = 16;
          if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_ERROR))
          {
            os_log_type_t v4 = (os_log_s *)v18;
            os_log_type_t v5 = v17;
            sub_100002064(v16);
            _os_log_error_impl( (void *)&_mh_execute_header,  v4,  v5,  "NTLM Reflection objects can't be released",  v16,  2u);
          }

          objc_storeStrong(&v18, 0LL);
          if (Value)
          {
            CFRelease(Value);
            CFTypeRef Value = 0LL;
          }

          int v22 = 1;
        }

        else
        {
          if (*((void *)Value + 3))
          {
            CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(0LL, 0LL, *((CFDictionaryRef *)Value + 3));
            if (!MutableCopy)
            {
              CFRelease(Value);
              int v22 = 1;
              goto LABEL_46;
            }
          }

          else
          {
            CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
          }

          int v14 = -1;
          id v15 = (id)CFDictionaryGetValue(MutableCopy, @"kHEIMAttrRetainStatus");

          if (v15)
          {
            int v14 = [v15 intValue] - 1;
            os_log_t oslog = (os_log_t)sub_10000EABC();
            os_log_type_t v12 = OS_LOG_TYPE_DEBUG;
            if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
            {
              sub_10000A6F8((uint64_t)v31, v14, *((void *)Value + 2));
              _os_log_debug_impl((void *)&_mh_execute_header, oslog, v12, "the new count is %d for %@", v31, 0x12u);
            }

            objc_storeStrong((id *)&oslog, 0LL);
            CFDictionarySetValue( MutableCopy,  @"kHEIMAttrRetainStatus",  +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v14));
            if (*((void *)Value + 3))
            {
              CFRelease(*((CFTypeRef *)Value + 3));
              *((void *)Value + 3) = 0LL;
            }

            *((void *)Value + 3) = MutableCopy;
            byte_100024F6C = 1;
            if (v14 < 1)
            {
              os_log_t v9 = (os_log_t)sub_10000EABC();
              if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
              {
                sub_1000045F4((uint64_t)v29, *((void *)Value + 2));
                _os_log_debug_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "the new count is deleting cache for %@",  v29,  0xCu);
              }

              objc_storeStrong((id *)&v9, 0LL);
              sub_100006404((uint64_t)Value, (uint64_t)v28);
            }
          }

          else
          {
            os_log_t v11 = (os_log_t)sub_10000EABC();
            os_log_type_t v10 = OS_LOG_TYPE_ERROR;
            if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            {
              sub_1000045F4((uint64_t)v30, *((void *)Value + 2));
              _os_log_error_impl((void *)&_mh_execute_header, v11, v10, "the retain count is missing: %@", v30, 0xCu);
            }

            objc_storeStrong((id *)&v11, 0LL);
            if (MutableCopy)
            {
              CFRelease(MutableCopy);
              CFMutableDictionaryRef MutableCopy = 0LL;
            }
          }

          if (v23)
          {
            CFRelease(v23);
            CFTypeRef v23 = 0LL;
          }

          if (Value)
          {
            CFRelease(Value);
            CFTypeRef Value = 0LL;
          }

          objc_storeStrong(&v15, 0LL);
          int v22 = 0;
        }
      }

      else
      {
        int v22 = 1;
      }
    }

    else
    {
      if (v25)
      {
        CFRelease(v25);
        CFTypeRef v25 = 0LL;
      }

      int v22 = 1;
    }
  }

  else
  {
    int v22 = 1;
  }

LABEL_46:
  objc_storeStrong(&v26, 0LL);
  objc_storeStrong(&location, 0LL);
}

uint64_t sub_10000AE94()
{
  predicate = (dispatch_once_t *)&unk_100024F90;
  dispatch_block_t block = 0LL;
  objc_storeStrong(&block, &stru_100020AF8);
  if (*predicate != -1) {
    dispatch_once(predicate, block);
  }
  objc_storeStrong(&block, 0LL);
  return qword_100024F88;
}

CFTypeRef sub_10000AF0C(const __CFDictionary *a1, const void *a2, uint64_t a3, uint64_t a4)
{
  if (!a4) {
    heim_abort("error ptr required:error != NULL");
  }
  CFTypeRef cf = CFDictionaryGetValue(a1, a2);
  if (!cf) {
    return 0LL;
  }
  if (CFGetTypeID(cf) == a3) {
    return cf;
  }
  return 0LL;
}

void sub_10000AFC4( const void *a1, const __CFSet *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7, uint64_t a8)
{
  char v12 = a7 & 1;
  CFDateRef value = (void *)CFDictionaryGetValue((CFDictionaryRef)qword_100024F50, a1);
  if (value) {
    heim_abort("mech already registered:mech == NULL");
  }
  uint64_t v8 = sub_10000B180();
  if (!v8) {
    heim_abort("could not register cftype:mechID != _kCFRuntimeNotATypeID", 0LL, value);
  }
  valuea = (void *)_CFRuntimeCreateInstance(0LL, v8, 56LL);
  if (!valuea) {
    heim_abort("out of memory while registering HeimMech instance:mech != NULL");
  }
  valuea[2] = CFRetain(a1);
  valuea[3] = a3;
  valuea[4] = a4;
  valuea[5] = a5;
  valuea[6] = a6;
  *((_BYTE *)valuea + 56) = v12 & 1;
  valuea[8] = a8;
  CFDictionarySetValue((CFMutableDictionaryRef)qword_100024F50, a1, valuea);
  if (valuea) {
    CFRelease(valuea);
  }
  CFSetApplyFunction(a2, (CFSetApplierFunction)sub_10000B1F8, 0LL);
}

uint64_t sub_10000B180()
{
  predicate = (dispatch_once_t *)&unk_100024FA0;
  dispatch_block_t block = 0LL;
  objc_storeStrong(&block, &stru_100020BF0);
  if (*predicate != -1) {
    dispatch_once(predicate, block);
  }
  objc_storeStrong(&block, 0LL);
  return qword_100024F98;
}

void sub_10000B1F8(const __CFDictionary *a1)
{
  CFTypeRef key = (void *)CFDictionaryGetValue(a1, @"kHEIMObjectType");
  if (!key) {
    heim_abort("schema w/o kHEIMObjectType ?:typeName != NULL");
  }
  if (CFDictionaryGetValue((CFDictionaryRef)qword_100024F58, key)) {
    heim_abort("schema already registered:other == NULL");
  }
  CFDictionaryApplyFunction(a1, (CFDictionaryApplierFunction)sub_10000E650, 0LL);
  CFDictionarySetValue((CFMutableDictionaryRef)qword_100024F58, key, a1);
}

__CFDictionary *sub_10000B2DC(const void *a1)
{
  CFMutableArrayRef Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionarySetValue(Mutable, @"kHEIMAttrType", @"kHEIMTypeSchema");
  CFDictionarySetValue(Mutable, @"kHEIMObjectType", a1);
  CFDictionarySetValue(Mutable, @"kHEIMAttrType", @"Rs");
  CFDictionarySetValue(Mutable, @"kHEIMAttrClientName", @"s");
  CFDictionarySetValue(Mutable, @"kHEIMAttrServerName", @"s");
  CFDictionarySetValue(Mutable, @"kHEIMAttrUUID", @"Gu");
  CFDictionarySetValue(Mutable, @"kHEIMAttrDisplayName", @"s");
  CFDictionarySetValue(Mutable, @"kHEIMAttrCredential", @"b");
  CFDictionarySetValue(Mutable, @"kHEIMAttrLeadCredential", @"b");
  CFDictionarySetValue(Mutable, @"kHEIMAttrParentCredential", @"u");
  CFDictionarySetValue(Mutable, @"kHEIMAttrBundleIdentifierACL", @"as");
  CFDictionarySetValue(Mutable, @"kHEIMAttrDefaultCredential", @"b");
  CFDictionarySetValue(Mutable, @"kHEIMAttrAuthTime", @"t");
  CFDictionarySetValue(Mutable, @"kHEIMAttrStoreTime", @"Gt");
  CFDictionarySetValue(Mutable, @"kHEIMAttrData", @"d");
  CFDictionarySetValue(Mutable, @"kHEIMAttrRetainStatus", @"n");
  CFDictionarySetValue(Mutable, @"kHEIMAttrAltDSID", @"s");
  CFDictionarySetValue(Mutable, @"kHEIMAttrUserID", @"n");
  CFDictionarySetValue(Mutable, @"kHEIMAttrASID", @"n");
  CFDictionarySetValue(Mutable, @"kHEIMAttrTemporaryCache", @"b");
  return Mutable;
}

void sub_10000B538()
{
  theSet = CFSetCreateMutable(0LL, 0LL, &kCFTypeSetCallBacks);
  CFDateRef value = sub_10000B2DC(@"kHEIMObjectGeneric");
  CFSetAddValue(theSet, value);
  if (value) {
    CFRelease(value);
  }
  sub_10000AFC4(@"kHEIMTypeGeneric", theSet, (uint64_t)sub_10000B618, 0LL, 0LL, (uint64_t)sub_10000BB10, 0, 0LL);
  if (theSet) {
    CFRelease(theSet);
  }
}

id sub_10000B618(uint64_t a1)
{
  uint64_t v20 = a1;
  id v19 = *(id *)(a1 + 24);
  id v18 = [&__NSDictionary0__struct mutableCopy];
  id v1 = [v19 objectForKeyedSubscript:@"kHEIMAttrParentCredential"];
  BOOL v17 = v1 == 0LL;

  if (v17)
  {
    id v4 = [v19 objectForKeyedSubscript:@"kHEIMAttrClientName"];
    objc_msgSend(v18, "setObject:forKeyedSubscript:");

    id v5 = [v19 objectForKeyedSubscript:@"kHEIMAttrBundleIdentifierACL"];
    objc_msgSend(v18, "setObject:forKeyedSubscript:");

    id v6 = [v19 objectForKeyedSubscript:@"kHEIMAttrAltDSID"];
    objc_msgSend(v18, "setObject:forKeyedSubscript:");

    id v7 = [v19 objectForKeyedSubscript:@"kHEIMAttrUserID"];
    objc_msgSend(v18, "setObject:forKeyedSubscript:");

    id v8 = [v19 objectForKeyedSubscript:@"kHEIMAttrRetainStatus"];
    objc_msgSend(v18, "setObject:forKeyedSubscript:");

    sub_10000C898(v19, @"kHEIMAttrUUID", v18, @"uuid");
  }

  else
  {
    id v9 = [v19 objectForKeyedSubscript:@"kHEIMAttrClientName"];
    objc_msgSend(v18, "setObject:forKeyedSubscript:");

    id v10 = [v19 objectForKeyedSubscript:@"kHEIMAttrServerName"];
    objc_msgSend(v18, "setObject:forKeyedSubscript:");

    id v11 = [v19 objectForKeyedSubscript:@"kHEIMAttrExpire"];
    objc_msgSend(v18, "setObject:forKeyedSubscript:");

    id v12 = [v19 objectForKeyedSubscript:@"kHEIMAttrAuthTime"];
    objc_msgSend(v18, "setObject:forKeyedSubscript:");

    id v13 = [v19 objectForKeyedSubscript:@"kHEIMAttrRenewTill"];
    objc_msgSend(v18, "setObject:forKeyedSubscript:");

    pthread_mutex_lock((pthread_mutex_t *)(v20 + 40));
    int v14 =  +[NSDate dateWithTimeIntervalSince1970:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSince1970:",  (double)*(uint64_t *)(v20 + 104));
    objc_msgSend(v18, "setObject:forKeyedSubscript:");

    id v15 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", *(unsigned int *)(v20 + 144));
    objc_msgSend(v18, "setObject:forKeyedSubscript:");

    id v16 =  +[NSDate dateWithTimeIntervalSince1970:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSince1970:",  (double)*(uint64_t *)(v20 + 128));
    objc_msgSend(v18, "setObject:forKeyedSubscript:");

    pthread_mutex_unlock((pthread_mutex_t *)(v20 + 40));
    [v18 setObject:*(void *)(*(void *)(v20 + 32) + 16) forKeyedSubscript:@"mech"];
    sub_10000C898(v19, @"kHEIMAttrUUID", v18, @"uuid");
    sub_10000C898(v19, @"kHEIMAttrParentCredential", v18, @"parent");
  }

  id location = 0LL;
  objc_storeStrong(&location, v18);
  id v3 = location;
  objc_storeStrong(&location, 0LL);
  objc_storeStrong(&v18, 0LL);
  objc_storeStrong(&v19, 0LL);
  return v3;
}

id sub_10000BB10(void *a1)
{
  id v19 = a1;
  id v18 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v17 = v19;
  v22[0] = @"kHEIMAttrType";
  v22[1] = @"kHEIMObjectType";
  id v22[2] = @"kHEIMAttrUUID";
  v22[3] = @"kHEIMAttrParentCredential";
  v22[4] = @"kHEIMAttrASID";
  v22[5] = @"kHEIMAttrAltDSID";
  v22[6] = @"kHEIMAttrUserID";
  uint8_t v22[7] = @"kHEIMAttrDefaultCredential";
  v22[8] = @"kHEIMAttrBundleIdentifierACL";
  v22[9] = @"kHEIMAttrClientName";
  v22[10] = @"kHEIMAttrServerName";
  v22[11] = @"kHEIMAttrDisplayName";
  v22[12] = @"kHEIMAttrExpire";
  v22[13] = @"kHEIMAttrAuthTime";
  v22[14] = @"kHEIMAttrStoreTime";
  v22[15] = @"kHEIMAttrRenewTill";
  v22[16] = @"kHEIMAttrRetainStatus";
  v22[17] = @"kHEIMAttrLeadCredential";
  v22[18] = @"kHEIMAttrNTLMUsername";
  v22[19] = @"kHEIMAttrNTLMDomain";
  v22[20] = @"kHEIMAttrTransient";
  v22[21] = @"kHEIMAttrAllowedDomain";
  v22[22] = @"kHEIMAttrStatus";
  v22[23] = @"kHEIMAttrTemporaryCache";
  id v16 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v22, 24LL);
  memset(__b, 0, sizeof(__b));
  id obj = v16;
  id v13 = [obj countByEnumeratingWithState:__b objects:v21 count:16];
  if (v13)
  {
    uint64_t v9 = *(void *)__b[2];
    uint64_t v10 = 0LL;
    id v11 = v13;
    while (1)
    {
      uint64_t v8 = v10;
      if (*(void *)__b[2] != v9) {
        objc_enumerationMutation(obj);
      }
      uint64_t v15 = *(void *)(__b[1] + 8 * v10);
      id v7 = [v17 objectForKeyedSubscript:v15];
      objc_msgSend(v18, "setObject:forKeyedSubscript:");

      ++v10;
      if (v8 + 1 >= (unint64_t)v11)
      {
        uint64_t v10 = 0LL;
        id v11 = [obj countByEnumeratingWithState:__b objects:v21 count:16];
        if (!v11) {
          break;
        }
      }
    }
  }

  id v1 = [v17 objectForKeyedSubscript:@"kHEIMAttrData"];
  BOOL v6 = v1 == 0LL;

  if (!v6) {
    [v18 setObject:@"<private>" forKeyedSubscript:@"kHEIMAttrData"];
  }
  id v2 = [v17 objectForKeyedSubscript:@"kHEIMAttrNTLMSessionKey"];
  BOOL v5 = v2 == 0LL;

  if (!v5) {
    [v18 setObject:@"<private>" forKeyedSubscript:@"kHEIMAttrNTLMSessionKey"];
  }
  id location = 0LL;
  objc_storeStrong(&location, v18);
  id v4 = location;
  objc_storeStrong(&location, 0LL);
  objc_storeStrong(&v16, 0LL);
  objc_storeStrong(&v17, 0LL);
  objc_storeStrong(&v18, 0LL);
  return v4;
}

void sub_10000BFA8()
{
  theSet = CFSetCreateMutable(0LL, 0LL, &kCFTypeSetCallBacks);
  CFDateRef value = sub_10000B2DC(@"kHEIMObjectConfiguration");
  CFSetAddValue(theSet, value);
  if (value) {
    CFRelease(value);
  }
  sub_10000AFC4( @"kHEIMTypeConfiguration",  theSet,  (uint64_t)sub_10000C088,  0LL,  0LL,  (uint64_t)sub_10000BB10,  0,  0LL);
  if (theSet) {
    CFRelease(theSet);
  }
}

id sub_10000C088(uint64_t a1)
{
  uint64_t v10 = a1;
  id v9 = *(id *)(a1 + 24);
  id v8 = [&__NSDictionary0__struct mutableCopy];
  id v6 = [v9 objectForKeyedSubscript:@"kHEIMAttrClientName"];
  objc_msgSend(v8, "setObject:forKeyedSubscript:");

  id v7 = (__CFString *)[v9 objectForKeyedSubscript:@"kHEIMAttrServerName"];
  if (v7) {
    BOOL v5 = v7;
  }
  else {
    BOOL v5 = @"none";
  }
  [v8 setObject:v5 forKeyedSubscript:@"servername"];

  id v2 = [v9 objectForKeyedSubscript:@"kHEIMAttrAuthTime"];
  objc_msgSend(v8, "setObject:forKeyedSubscript:");

  id v3 = [v9 objectForKeyedSubscript:@"kHEIMAttrUserID"];
  objc_msgSend(v8, "setObject:forKeyedSubscript:");

  [v8 setObject:*(void *)(*(void *)(v10 + 32) + 16) forKeyedSubscript:@"mech"];
  sub_10000C898(v9, @"kHEIMAttrUUID", v8, @"uuid");
  sub_10000C898(v9, @"kHEIMAttrParentCredential", v8, @"parent");
  id location = 0LL;
  objc_storeStrong(&location, v8);
  id v4 = location;
  objc_storeStrong(&location, 0LL);
  objc_storeStrong(&v8, 0LL);
  objc_storeStrong(&v9, 0LL);
  return v4;
}

void sub_10000C2C8(CFTypeRef *a1)
{
  if (a1[1])
  {
    CFRelease(a1[1]);
    a1[1] = 0LL;
  }

  if (a1[2])
  {
    CFRelease(a1[2]);
    a1[2] = 0LL;
  }

  if (a1[9])
  {
    CFRelease(a1[9]);
    a1[9] = 0LL;
  }

  if (a1[7])
  {
    CFRelease(a1[7]);
    a1[7] = 0LL;
  }

  free(a1);
}

void sub_10000C3CC(unsigned int a1)
{
  unsigned int valuePtr = a1;
  if ((byte_100024ED0 & 1) != 0)
  {
    context = objc_autoreleasePoolPush();
    CFNumberRef v7 = CFNumberCreate(0LL, kCFNumberIntType, &valuePtr);
    CFTypeRef Value = CFDictionaryGetValue((CFDictionaryRef)qword_100024F40, &off_1000222A8);
    if (Value) {
      sub_10000C650((uint64_t)Value, valuePtr);
    }
    id location = sub_10000EABC();
    os_log_type_t v4 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_INFO))
    {
      sub_1000045F4((uint64_t)v10, (uint64_t)v7);
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)location, v4, "Session ended: %@", v10, 0xCu);
    }

    objc_storeStrong(&location, 0LL);
    if (v7)
    {
      CFRelease(v7);
      CFNumberRef v7 = 0LL;
    }

    objc_autoreleasePoolPop(context);
  }

  else
  {
    CFTypeRef key = CFNumberCreate(0LL, kCFNumberIntType, &valuePtr);
    if (!key) {
      heim_abort("out of memory:sid != NULL");
    }
    CFDictionaryRemoveValue((CFMutableDictionaryRef)qword_100024F40, key);
    os_log_t oslog = (os_log_t)sub_10000EABC();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
    {
      sub_1000045F4((uint64_t)v9, (uint64_t)key);
      _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_INFO, "Session ended: %@", v9, 0xCu);
    }

    objc_storeStrong((id *)&oslog, 0LL);
    if (key) {
      CFRelease(key);
    }
  }

void sub_10000C650(uint64_t a1, unsigned int a2)
{
  uint64_t v22 = a1;
  unsigned int v21 = a2;
  id location = sub_10000EABC();
  os_log_type_t v19 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEBUG))
  {
    sub_10000E76C((uint64_t)v23, v21);
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)location, v19, "HeimCredRemoveItemsForASID: %d", v23, 8u);
  }

  objc_storeStrong(&location, 0LL);
  id v18 = [&__NSArray0__struct mutableCopy];
  id v17 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v21);
  id v16 = *(id *)(v22 + 24);
  id v2 = v16;
  id v9 = _NSConcreteStackBlock;
  int v10 = -1073741824;
  int v11 = 0;
  id v12 = sub_10000E7A4;
  id v13 = &unk_100020C78;
  int v14 = v17;
  id v15 = v18;
  [v2 enumerateKeysAndObjectsUsingBlock:&v9];
  id v3 = _NSConcreteStackBlock;
  int v4 = -1073741824;
  int v5 = 0;
  id v6 = sub_10000E964;
  CFNumberRef v7 = &unk_100020C98;
  uint64_t v8 = v22;
  [v18 enumerateObjectsUsingBlock:&v3];
  objc_storeStrong(&v15, 0LL);
  objc_storeStrong((id *)&v14, 0LL);
  objc_storeStrong(&v16, 0LL);
  objc_storeStrong((id *)&v17, 0LL);
  objc_storeStrong(&v18, 0LL);
}

void sub_10000C898(void *a1, void *a2, void *a3, void *a4)
{
  id location = 0LL;
  objc_storeStrong(&location, a1);
  id v11 = 0LL;
  objc_storeStrong(&v11, a2);
  id v10 = 0LL;
  objc_storeStrong(&v10, a3);
  id v9 = 0LL;
  objc_storeStrong(&v9, a4);
  id v7 = [location objectForKeyedSubscript:v11];

  if (v7)
  {
    CFStringRef v8 = CFUUIDCreateString(0LL, (CFUUIDRef)v7);
    if (v8)
    {
      [v10 setObject:v8 forKeyedSubscript:v9];
      CFRelease(v8);
    }
  }

  objc_storeStrong(&v9, 0LL);
  objc_storeStrong(&v10, 0LL);
  objc_storeStrong(&v11, 0LL);
  objc_storeStrong(&location, 0LL);
}

id sub_10000C9E4(uint64_t a1)
{
  uint64_t v13 = a1;
  id v12 = *(id *)(a1 + 24);
  id v11 = [&__NSDictionary0__struct mutableCopy];
  id v2 = [v12 objectForKeyedSubscript:@"kHEIMAttrClientName"];
  objc_msgSend(v11, "setObject:forKeyedSubscript:");

  id v3 = [v12 objectForKeyedSubscript:@"kHEIMAttrExpire"];
  objc_msgSend(v11, "setObject:forKeyedSubscript:");

  id v4 = [v12 objectForKeyedSubscript:@"kHEIMAttrStatus"];
  objc_msgSend(v11, "setObject:forKeyedSubscript:");

  id v5 = [v12 objectForKeyedSubscript:@"kHEIMAttrAuthTime"];
  objc_msgSend(v11, "setObject:forKeyedSubscript:");

  pthread_mutex_lock((pthread_mutex_t *)(v13 + 40));
  id v6 =  +[NSDate dateWithTimeIntervalSince1970:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSince1970:",  (double)*(uint64_t *)(v13 + 104));
  objc_msgSend(v11, "setObject:forKeyedSubscript:");

  id v7 =  +[NSDate dateWithTimeIntervalSince1970:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSince1970:",  (double)*(uint64_t *)(v13 + 120));
  objc_msgSend(v11, "setObject:forKeyedSubscript:");

  CFStringRef v8 =  +[NSDate dateWithTimeIntervalSince1970:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSince1970:",  (double)*(uint64_t *)(v13 + 128));
  objc_msgSend(v11, "setObject:forKeyedSubscript:");

  id v9 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", *(unsigned int *)(v13 + 144));
  objc_msgSend(v11, "setObject:forKeyedSubscript:");

  pthread_mutex_unlock((pthread_mutex_t *)(v13 + 40));
  [v11 setObject:*(void *)(*(void *)(v13 + 32) + 16) forKeyedSubscript:@"mech"];
  sub_10000C898(v12, @"kHEIMAttrUUID", v11, @"uuid");
  sub_10000C898(v12, @"kHEIMAttrParentCredential", v11, @"parent");
  id location = 0LL;
  objc_storeStrong(&location, v11);
  id v10 = location;
  objc_storeStrong(&location, 0LL);
  objc_storeStrong(&v11, 0LL);
  objc_storeStrong(&v12, 0LL);
  return v10;
}

BOOL sub_10000CD30(uint64_t a1)
{
  BOOL v2 = 0;
  if (CFEqual(*(CFTypeRef *)(*(void *)(a1 + 32) + 16LL), @"kHEIMTypeKerberosAcquireCred")) {
    return CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 24), @"kHEIMAttrCredential") != 0LL;
  }
  return v2;
}

void sub_10000CDB0(const void *a1, uint64_t a2, const void *a3)
{
  id v4 = (CFDictionaryRef *)CFDictionaryGetValue(*(CFDictionaryRef *)(a2 + 24), a1);
  if (v4)
  {
    CFMutableDictionaryRef theDict = CFDictionaryCreateMutableCopy(0LL, 0LL, v4[3]);
    if (a3) {
      CFDictionarySetValue(theDict, @"kHEIMAttrDefaultCredential", a3);
    }
    else {
      CFDictionaryRemoveValue(theDict, @"kHEIMAttrDefaultCredential");
    }
    if (v4[3])
    {
      CFRelease(v4[3]);
      v4[3] = 0LL;
    }

    v4[3] = theDict;
  }

void sub_10000CEA4(uint64_t *a1, void *a2, void *a3, _BYTE *a4)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v16 = 0LL;
  objc_storeStrong(&v16, a3);
  id v15 = a4;
  int v14 = a1;
  uint64_t v13 = (const __CFDictionary **)v16;
  CFTypeRef Value = CFDictionaryGetValue(*((CFDictionaryRef *)v16 + 3), @"kHEIMAttrParentCredential");
  BOOL v8 = 1;
  if (!sub_10000324C(v13[3])) {
    BOOL v8 = sub_100004924(a1[4], v13[3]);
  }
  BOOL v11 = v8;
  if (CFEqual(*((CFTypeRef *)v13[4] + 2), *(CFTypeRef *)(a1[5] + 16))
    && Value
    && !v11
    && CFDictionaryGetValue(v13[3], @"kHEIMAttrLeadCredential") == kCFBooleanTrue)
  {
    id v10 = (id)CFDictionaryGetValue(v13[3], @"kHEIMAttrExpire");
    [v10 timeIntervalSinceNow];
    if (v4 > 0.0)
    {
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1[4] + 40), *((const void **)v13[4] + 2), Value);
      sub_10000CDB0(Value, a1[4], kCFBooleanTrue);
      byte_100024F6C = 1;
      os_log_t oslog = (os_log_t)sub_10000EABC();
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
      {
        sub_10000D16C((uint64_t)v18, *((void *)v13[4] + 2), (uint64_t)v13);
        _os_log_debug_impl( (void *)&_mh_execute_header,  oslog,  OS_LOG_TYPE_DEBUG,  "The default for %@ credential is now %@",  v18,  0x16u);
      }

      objc_storeStrong((id *)&oslog, 0LL);
      *id v15 = 1;
    }

    objc_storeStrong(&v10, 0LL);
  }

  objc_storeStrong(&v16, 0LL);
  objc_storeStrong(location, 0LL);
}

uint64_t sub_10000D16C(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 64;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 64;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  return result;
}

uint64_t sub_10000D1BC(uint64_t result, uint64_t a2)
{
  *(_BYTE *)result = 3;
  *(_BYTE *)(result + 1) = 1;
  *(_BYTE *)(result + 2) = 33;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  return result;
}

uint64_t sub_10000D1FC(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)result = 3;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 33;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 32;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  return result;
}

void sub_10000D254(uint64_t a1, const void *a2, uint64_t a3)
{
  CFTypeID v3 = CFGetTypeID(a2);
  if (v3 != CFDictionaryGetTypeID()) {
    heim_abort("schema wrong type:CFGetTypeID(schema) == CFDictionaryGetTypeID()");
  }
  *(void *)(a3 + 32) = a2;
  *(void *)(a3 + 40) = 0LL;
  CFDictionaryApplyFunction(*(CFDictionaryRef *)(a3 + 16), (CFDictionaryApplierFunction)sub_10000D4E4, (void *)a3);
  if (*(void *)(a3 + 24) < *(void *)(a3 + 40)) {
    heim_abort("cant have matched more then number of queries:mc->numQueryItems >= mc->count");
  }
  if (*(void *)(a3 + 24) == *(void *)(a3 + 40)) {
    CFArrayAppendValue(*(CFMutableArrayRef *)(a3 + 8), a2);
  }
}

void sub_10000D368(const void *a1, void *a2, void **a3)
{
  if ((sub_100004A08(*a3, a1, 0LL) & 1) != 0)
  {
    CFTypeID v3 = CFGetTypeID(a2);
    if (v3 != sub_10001090C()) {
      heim_abort("cred wrong type:CFGetTypeID(cred) == HeimCredGetTypeID()");
    }
    if (a2[3])
    {
      a3[4] = (void *)a2[3];
      a3[5] = 0LL;
      CFDictionaryApplyFunction((CFDictionaryRef)a3[2], (CFDictionaryApplierFunction)sub_10000D4E4, a3);
    }
  }

uint64_t sub_10000D4E4(const void *a1, const void *a2, uint64_t a3)
{
  if (!*(void *)(a3 + 32)) {
    heim_abort("attributes NULL in MatchQueryItem:mc->attributes != NULL");
  }
  if (CFEqual(a1, @"kHEIMObjectType"))
  {
    uint64_t result = CFEqual(a2, @"kHEIMObjectAny");
    if ((_BYTE)result)
    {
      ++*(void *)(a3 + 40);
      return result;
    }
  }

  CFTypeRef cf1 = CFDictionaryGetValue(*(CFDictionaryRef *)(a3 + 32), a1);
  if (cf1)
  {
    uint64_t result = CFEqual(cf1, a2);
    if (!(_BYTE)result) {
      return result;
    }
  }

  else
  {
    uint64_t result = CFEqual(kCFNull, a2);
    if (!(_BYTE)result) {
      return result;
    }
  }

  ++*(void *)(a3 + 40);
  return result;
}

void sub_10000D62C(uint64_t a1, uint64_t a2)
{
  CFTypeRef cf1 = CFDictionaryGetValue( *(CFDictionaryRef *)(*(void *)(a1 + 56) + 40LL),  *(const void **)(*(void *)(a2 + 32) + 16LL));
  if (cf1)
  {
    if (CFEqual(cf1, *(CFTypeRef *)(a2 + 16)))
    {
      CFDictionaryRemoveValue( *(CFMutableDictionaryRef *)(*(void *)(a1 + 56) + 40LL),  *(const void **)(*(void *)(a2 + 32) + 16LL));
      *(_DWORD *)(*(void *)(a1 + 56) + 48LL) = 1;
      sub_100005AE8(a1);
    }
  }

BOOL sub_10000D6D8(uint64_t a1)
{
  BOOL v2 = 0;
  if (CFEqual(*(CFTypeRef *)(*(void *)(a1 + 32) + 16LL), @"kHEIMTypeKerberos")) {
    return CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 24), @"kHEIMAttrLeadCredential") == kCFBooleanTrue;
  }
  return v2;
}

void sub_10000D764(const void *a1, const void *a2, CFTypeRef *a3)
{
  id v10 = a1;
  CFTypeRef v9 = a2;
  BOOL v8 = a3;
  id v7 = a3;
  if (!CFEqual(a1, *a3))
  {
    CFTypeRef cf = v9;
    CFTypeID v3 = CFGetTypeID(v9);
    if (v3 != sub_10001090C()) {
      heim_abort("cred wrong type:CFGetTypeID(cred) == HeimCredGetTypeID()");
    }
    CFTypeRef cf2 = CFDictionaryGetValue(*((CFDictionaryRef *)cf + 3), @"kHEIMAttrParentCredential");
    if (cf2)
    {
      if (CFEqual(*v7, cf2))
      {
        CFArrayAppendValue((CFMutableArrayRef)v7[1], *((const void **)cf + 2));
        context[0] = v10;
        context[1] = v7[1];
        void context[2] = v7[2];
        CFDictionaryApplyFunction(*((CFDictionaryRef *)v7[2] + 3), (CFDictionaryApplierFunction)sub_10000D764, context);
      }
    }
  }

void sub_10000D8A4(const void *a1, uint64_t a2)
{
  CFTypeID v2 = CFGetTypeID(a1);
  if (v2 != CFUUIDGetTypeID()) {
    heim_abort("Value not an CFUUIDRef:CFGetTypeID(value) == CFUUIDGetTypeID()");
  }
  CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a2 + 24), a1);
}

void sub_10000D920(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v16 = a1;
  uint64_t v15 = a2;
  int v14 = a3;
  uint64_t v13 = a2;
  id v12 = a3;
  id v17 = (__CFString *)CFUUIDCreateString(0LL, *(CFUUIDRef *)(v13 + 16));
  id v11 = v17;
  if (*(void *)(*(void *)(v13 + 32) + 24LL))
  {
    CFTypeRef v10 = (CFTypeRef)(*(uint64_t (**)(uint64_t))(*(void *)(v13 + 32) + 24LL))(v13);
    if (v10)
    {
      if (v11)
      {
        id location = (id)_CFXPCCreateXPCObjectFromCFObject(v10);
        CFRelease(v10);
        CFTypeRef v10 = 0LL;
        if (location)
        {
          id v5 = (const char *)[v11 UTF8String];
          if (v5) {
            xpc_dictionary_set_value(v12, v5, location);
          }
          else {
            xpc_dictionary_set_value(v12, "none", location);
          }
        }

        else
        {
          os_log_t oslog = (os_log_t)sub_10000EABC();
          os_log_type_t type = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
          {
            log = oslog;
            os_log_type_t v4 = type;
            sub_100002064(v6);
            _os_log_error_impl( (void *)&_mh_execute_header,  log,  v4,  "status callback failed to convert to xpc object",  v6,  2u);
          }

          objc_storeStrong((id *)&oslog, 0LL);
        }

        objc_storeStrong(&location, 0LL);
      }
    }
  }

  objc_storeStrong(&v11, 0LL);
  objc_storeStrong(&v12, 0LL);
}

void sub_10000DB38(id a1)
{
  qword_100024F88 = _CFRuntimeRegisterClass(&unk_100020B18);
}

void sub_10000DB70(CFTypeRef *a1)
{
  if (a1[3])
  {
    CFRelease(a1[3]);
    a1[3] = 0LL;
  }

  if (a1[5])
  {
    CFRelease(a1[5]);
    a1[5] = 0LL;
  }

  if (a1[4])
  {
    CFRelease(a1[4]);
    a1[4] = 0LL;
  }

CFStringRef sub_10000DC3C()
{
  return @"debugsession";
}

void sub_10000DC54(const void *a1, uint64_t a2, const __CFDictionary **a3)
{
  uint64_t v15 = a1;
  uint64_t v14 = a2;
  uint64_t v13 = a3;
  id v12 = a3;
  id v7 = *a3;
  CFTypeID TypeID = CFStringGetTypeID();
  id v11 = (const __CFString *)sub_10000AF0C(v7, a1, TypeID, (uint64_t)v12[2]);
  if (v11)
  {
    if (sub_10000DDF4(v11, @"W")) {
      CFDictionaryRemoveValue(v12[1], v15);
    }
  }

  else
  {
    __int128 v17 = *(_OWORD *)&off_100020B88;
    v16[0] = v15;
    v16[1] = kCFBooleanTrue;
    sub_100006390(v12[2], 564480LL, (const void *const *)&v17, v16, 2LL);
    os_log_t oslog = (os_log_t)sub_10000EABC();
    os_log_type_t type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      log = oslog;
      os_log_type_t v5 = type;
      sub_100002064(v8);
      _os_log_error_impl((void *)&_mh_execute_header, log, v5, "unknown key", v8, 2u);
    }

    objc_storeStrong((id *)&oslog, 0LL);
  }

BOOL sub_10000DDF4(const __CFString *a1, const __CFString *a2)
{
  return CFStringFind(a1, a2, 0LL).location != -1;
}

void sub_10000DE70(const void *a1, uint64_t a2, const __CFDictionary **a3)
{
  uint64_t v15 = a1;
  uint64_t v14 = a2;
  uint64_t v13 = a3;
  id v12 = a3;
  id v7 = *a3;
  CFTypeID TypeID = CFStringGetTypeID();
  if (!sub_10000AF0C(v7, a1, TypeID, (uint64_t)v12[3]))
  {
    __int128 v17 = *(_OWORD *)&off_100020BA8;
    v16[0] = v15;
    v16[1] = kCFBooleanTrue;
    sub_100006390(v12[3], 564480LL, (const void *const *)&v17, v16, 2LL);
    *((_BYTE *)v12 + 32) = 0;
    os_log_t oslog = (os_log_t)sub_10000EABC();
    os_log_type_t type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      log = oslog;
      os_log_type_t v5 = type;
      sub_100002064(v8);
      _os_log_error_impl((void *)&_mh_execute_header, log, v5, "unknown key", v8, 2u);
    }

    objc_storeStrong((id *)&oslog, 0LL);
  }

void sub_10000DFEC(const __CFString *a1, const __CFString *a2, void *a3)
{
  CFTypeRef v23 = a1;
  uint64_t v22 = a2;
  unsigned int v21 = a3;
  context = a3;
  os_log_type_t v19 = a2;
  if (!CFEqual(@"kHEIMObjectType", a1))
  {
    CFTypeRef cf = CFDictionaryGetValue(*((CFDictionaryRef *)context + 1), v23);
    if (cf)
    {
      CFTypeID v14 = sub_10000E360(v23, v19, 1);
      if (v14 != CFGetTypeID(cf))
      {
        __int128 v29 = *(_OWORD *)&off_100020BD0;
        CFTypeRef v30 = @"CommonErrorCode";
        v28[0] = v23;
        v28[1] = v19;
        v28[2] = kCFBooleanTrue;
        sub_100006390(*((CFErrorRef *)context + 3), 564481LL, (const void *const *)&v29, v28, 3LL);
        *((_BYTE *)context + 32) = 0;
        os_log_t v13 = (os_log_t)sub_10000EABC();
        os_log_type_t v12 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          id v7 = v13;
          os_log_type_t v8 = v12;
          sub_100002064(v11);
          _os_log_error_impl((void *)&_mh_execute_header, v7, v8, "key have wrong type key", v11, 2u);
        }

        objc_storeStrong((id *)&v13, 0LL);
      }

      CFTypeID v6 = v14;
      if (v6 == CFArrayGetTypeID())
      {
        CFTypeID v3 = sub_10000E360(v23, v19, 0);
        *((void *)context + 2) = v3;
        CFArrayRef theArray = (const __CFArray *)cf;
        CFIndex Count = CFArrayGetCount((CFArrayRef)cf);
        uint64_t v25 = 0LL;
        CFIndex v24 = Count;
        uint64_t v26 = 0LL;
        CFIndex v27 = Count;
        v34.id location = 0LL;
        v34.length = Count;
        CFArrayApplyFunction(theArray, v34, (CFArrayApplierFunction)sub_10000E4E0, context);
      }
    }

    else if (sub_10000DDF4(v19, @"R"))
    {
      __int128 v32 = *(_OWORD *)&off_100020BB8;
      uint64_t v33 = @"CommonErrorCode";
      v31[0] = v23;
      v31[1] = v19;
      v31[2] = kCFBooleanTrue;
      sub_100006390(*((CFErrorRef *)context + 3), 564481LL, (const void *const *)&v32, v31, 3LL);
      *((_BYTE *)context + 32) = 0;
      os_log_t oslog = (os_log_t)sub_10000EABC();
      os_log_type_t type = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        log = oslog;
        os_log_type_t v10 = type;
        sub_100002064(v15);
        _os_log_error_impl((void *)&_mh_execute_header, log, v10, "key missing key", v15, 2u);
      }

      objc_storeStrong((id *)&oslog, 0LL);
    }
  }

CFTypeID sub_10000E360(const __CFString *a1, const __CFString *a2, char a3)
{
  if ((a3 & 1) != 0 && sub_10000DDF4(a2, @"a")) {
    return CFArrayGetTypeID();
  }
  if (sub_10000DDF4(a2, @"s")) {
    return CFStringGetTypeID();
  }
  if (sub_10000DDF4(a2, @"u")) {
    return CFUUIDGetTypeID();
  }
  if (sub_10000DDF4(a2, @"d")) {
    return CFDataGetTypeID();
  }
  if (sub_10000DDF4(a2, @"b")) {
    return CFBooleanGetTypeID();
  }
  if (sub_10000DDF4(a2, @"t")) {
    return CFDateGetTypeID();
  }
  if (sub_10000DDF4(a2, @"n")) {
    return CFNumberGetTypeID();
  }
  os_log_type_t v5 = rk_cfstring2cstring(a2);
  CFTypeID v3 = rk_cfstring2cstring(a1);
  heim_abort("key %s have a broken rule %s", v5, v3);
  return v8;
}

CFTypeID sub_10000E4E0(const void *a1, uint64_t a2)
{
  CFTypeID result = CFGetTypeID(a1);
  if (result != *(void *)(a2 + 16))
  {
    os_log_type_t v5 = @"CommonErrorCode";
    CFBooleanRef v4 = kCFBooleanTrue;
    CFTypeID result = (CFTypeID)sub_100006390( *(CFErrorRef *)(a2 + 24),  564480LL,  (const void *const *)&v5,  (const void *const *)&v4,  1LL);
    *(_BYTE *)(a2 + 32) = 0;
  }

  return result;
}

void sub_10000E5A4(id a1)
{
  qword_100024F98 = _CFRuntimeRegisterClass(&unk_100020C10);
}

void sub_10000E5DC(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    CFRelease(*(CFTypeRef *)(a1 + 16));
    *(void *)(a1 + 16) = 0LL;
  }

CFStringRef sub_10000E638()
{
  return @"debugmech";
}

void sub_10000E650(const __CFString *a1, const __CFString *a2)
{
  if (!CFEqual(@"kHEIMObjectType", a1))
  {
    CFTypeID v5 = sub_10000E360(a1, a2, 1);
    CFTypeRef Value = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)qword_100024F60, a1);
    if (Value)
    {
      CFTypeID v3 = sub_10000E360(a1, Value, 1);
      if (v3 != v5)
      {
        CFTypeID v2 = rk_cfstring2cstring(a1);
        heim_abort("two schemas have different type for the same key %d != %d (%s)", v3, v5, v2);
      }
    }

    else
    {
      CFDictionarySetValue((CFMutableDictionaryRef)qword_100024F60, a1, a2);
    }
  }

uint64_t sub_10000E76C(uint64_t result, int a2)
{
  *(_BYTE *)CFTypeID result = 0;
  *(_BYTE *)(result + 1) = 1;
  *(_BYTE *)(result + 2) = 0;
  *(_BYTE *)(result + 3) = 4;
  *(_DWORD *)(result + 4) = a2;
  return result;
}

void sub_10000E7A4(id *a1, void *a2, void *a3, uint64_t a4)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v12 = 0LL;
  objc_storeStrong(&v12, a3);
  uint64_t v11 = a4;
  os_log_type_t v10 = a1;
  CFTypeRef v9 = (CFDictionaryRef *)v12;
  if (v12 && v9[3])
  {
    id v8 = (id)CFDictionaryGetValue(v9[3], @"kHEIMAttrASID");
    if ([a1[4] isEqualToNumber:v8])
    {
      [a1[5] addObject:location[0]];
      os_log_t oslog = (os_log_t)sub_10000EABC();
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
      {
        sub_1000045F4((uint64_t)v14, (uint64_t)location[0]);
        _os_log_debug_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEBUG, "item to be deleted: %@", v14, 0xCu);
      }

      objc_storeStrong((id *)&oslog, 0LL);
    }

    objc_storeStrong(&v8, 0LL);
  }

  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(location, 0LL);
}

void sub_10000E964(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  uint64_t v12 = a3;
  uint64_t v11 = a4;
  os_log_type_t v10 = a1;
  CFTypeRef key = location[0];
  if (CFDictionaryGetValue(*(CFDictionaryRef *)(a1[4] + 24LL), location[0]))
  {
    CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1[4] + 24LL), key);
    os_log_t oslog = (os_log_t)sub_10000EABC();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      sub_1000045F4((uint64_t)v14, (uint64_t)key);
      _os_log_debug_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEBUG, "item deleted: %@", v14, 0xCu);
    }

    objc_storeStrong((id *)&oslog, 0LL);
  }

  objc_storeStrong(location, 0LL);
}

id sub_10000EABC()
{
  predicate = (dispatch_once_t *)&unk_100024FA8;
  dispatch_block_t block = 0LL;
  objc_storeStrong(&block, &stru_100020CB8);
  if (*predicate != -1) {
    dispatch_once(predicate, block);
  }
  objc_storeStrong(&block, 0LL);
  return (id)qword_100024FB0;
}

void sub_10000EB34(id a1)
{
  os_log_t v1 = os_log_create("com.apple.Heimdal", "GSSCred");
  CFTypeID v2 = (void *)qword_100024FB0;
  qword_100024FB0 = (uint64_t)v1;
}

void sub_10000EB80()
{
  CFMutableArrayRef Mutable = CFSetCreateMutable(0LL, 0LL, &kCFTypeSetCallBacks);
  CFMutableDictionaryRef theDict = sub_10000B2DC(@"kHEIMObjectNTLM");
  CFDictionarySetValue(theDict, @"kHEIMAttrData", @"Wd");
  CFDictionarySetValue(theDict, @"kHEIMAttrNTLMUsername", @"Rs");
  CFDictionarySetValue(theDict, @"kHEIMAttrNTLMDomain", @"Rs");
  CFDictionarySetValue(theDict, @"kHEIMAttrTransient", @"b");
  CFDictionarySetValue(theDict, @"kHEIMAttrAllowedDomain", @"as");
  CFDictionarySetValue(theDict, @"kHEIMAttrStatus", @"n");
  CFDictionarySetValue(theDict, @"kHEIMAttrLabelValue", @"d");
  CFSetAddValue(Mutable, theDict);
  if (theDict) {
    CFRelease(theDict);
  }
  sub_10000AFC4(@"kHEIMTypeNTLM", Mutable, 0LL, (uint64_t)sub_10000ED24, 0LL, (uint64_t)sub_10000BB10, 0, 0LL);
  if (Mutable) {
    CFRelease(Mutable);
  }
}

CFDictionaryRef sub_10000ED24(void *a1, uint64_t a2, const __CFDictionary *a3)
{
  v72 = a1;
  uint64_t v71 = a2;
  v70 = a3;
  CFDictionaryRef v69 = 0LL;
  CFDataRef v68 = 0LL;
  CFDataRef v67 = 0LL;
  CFDataRef v66 = 0LL;
  CFDataRef v65 = 0LL;
  CFDataRef v64 = 0LL;
  v63 = 0LL;
  v62 = 0LL;
  v61 = 0LL;
  CFNumberRef v60 = 0LL;
  CFNumberRef v59 = 0LL;
  CFDataRef v58 = 0LL;
  uint64_t Attributes = 0LL;
  v56 = 0LL;
  CFBooleanRef v55 = 0LL;
  v54 = 0LL;
  int valuePtr = 0;
  int v52 = 0;
  unint64_t v51 = 0LL;
  id location = sub_10000EABC();
  os_log_type_t type = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEBUG))
  {
    log = (os_log_s *)location;
    os_log_type_t v24 = type;
    sub_100002064(v33);
    _os_log_debug_impl((void *)&_mh_execute_header, log, v24, "NTLMAuthCallback", v33, 2u);
  }

  objc_storeStrong(&location, 0LL);
  CFIndex Length = 0LL;
  BytePtr = 0LL;
  unint64_t v47 = 0LL;
  v48 = 0LL;
  size_t v45 = 0LL;
  id v46 = 0LL;
  CFIndex v43 = 0LL;
  CFTypeRef v44 = 0LL;
  size_t v41 = 0LL;
  id v42 = 0LL;
  v40[0] = 0LL;
  v40[1] = 0LL;
  id v38 = 0LL;
  int v39 = 0LL;
  memset(__b, 0, sizeof(__b));
  memset(v78, 0, sizeof(v78));
  memset(v37, 0, sizeof(v37));
  uint64_t Attributes = HeimCredGetAttributes(v71);
  if (Attributes)
  {
    uint64_t v22 = (const __CFDictionary *)Attributes;
    CFTypeID TypeID = CFDataGetTypeID();
    CFDataRef v58 = (CFDataRef)sub_10000FEF8(v22, @"kHEIMAttrData", TypeID);
    if (v58)
    {
      BytePtr = CFDataGetBytePtr(v58);
      CFIndex Length = CFDataGetLength(v58);
      unsigned int v21 = v70;
      CFTypeID v4 = CFDataGetTypeID();
      CFDataRef v67 = (CFDataRef)sub_10000FEF8(v21, @"kHEIMAttrNTLMType2Data", v4);
      if (v67)
      {
        CFTypeRef v44 = CFDataGetBytePtr(v67);
        CFIndex v43 = CFDataGetLength(v67);
        uint64_t v20 = v70;
        CFTypeID v5 = CFDataGetTypeID();
        CFDataRef v64 = (CFDataRef)sub_10000FEF8(v20, @"kHEIMAttrNTLMChannelBinding", v5);
        if (v64)
        {
          int v39 = CFDataGetBytePtr(v64);
          id v38 = (void *)CFDataGetLength(v64);
          os_log_type_t v19 = v70;
          CFTypeID v6 = CFDataGetTypeID();
          CFDataRef v68 = (CFDataRef)sub_10000FEF8(v19, @"kHEIMAttrNTLMType1Data", v6);
          if (v68)
          {
            id v46 = CFDataGetBytePtr(v68);
            size_t v45 = CFDataGetLength(v68);
            id v18 = v70;
            CFTypeID v7 = CFStringGetTypeID();
            v63 = (const __CFString *)sub_10000FEF8(v18, @"kHEIMAttrNTLMClientTargetName", v7);
            if (v63)
            {
              v54 = rk_cfstring2cstring(v63);
              if (v54)
              {
                __int128 v17 = v70;
                CFTypeID v8 = CFNumberGetTypeID();
                CFNumberRef v60 = (CFNumberRef)sub_10000FEF8(v17, @"kHEIMAttrNTLMClientFlags", v8);
                if (v60)
                {
                  CFRetain(v60);
                  if (CFNumberGetValue(v60, kCFNumberSInt32Type, &valuePtr))
                  {
                    uint64_t v16 = v70;
                    CFTypeID v9 = CFStringGetTypeID();
                    v62 = (const __CFString *)sub_10000FEF8(v16, @"kHEIMAttrNTLMUsername", v9);
                    if (v62)
                    {
                      v56 = rk_cfstring2cstring(v62);
                      if (v56)
                      {
                        uint64_t v15 = v70;
                        CFTypeID v10 = CFStringGetTypeID();
                        v61 = (const __CFString *)sub_10000FEF8(v15, @"kHEIMAttrNTLMDomain", v10);
                        if (v61)
                        {
                          CFRetain(v61);
                          CFBooleanRef v55 = rk_cfstring2cstring(v61);
                          if (v55)
                          {
                            v48 = v44;
                            unint64_t v47 = v43;
                            int v36 = heim_ntlm_decode_type2(&v47, __b);
                            if (v36)
                            {
                              id v32 = sub_10000EABC();
                              os_log_type_t v31 = OS_LOG_TYPE_ERROR;
                              if (os_log_type_enabled((os_log_t)v32, OS_LOG_TYPE_ERROR))
                              {
                                sub_10000E76C((uint64_t)v76, v36);
                                _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v32,  v31,  "heim_ntlm_decode_type2 (%d)\n",  v76,  8u);
                              }

                              objc_storeStrong(&v32, 0LL);
                            }

                            else if ((sub_100007AA4(v72, (uint64_t)&__b[4]) & 1) != 0)
                            {
                              id v30 = sub_10000EABC();
                              os_log_type_t v29 = OS_LOG_TYPE_ERROR;
                              if (os_log_type_enabled((os_log_t)v30, OS_LOG_TYPE_ERROR))
                              {
                                os_log_t v13 = (os_log_s *)v30;
                                os_log_type_t v14 = v29;
                                sub_100002064(v28);
                                _os_log_error_impl( (void *)&_mh_execute_header,  v13,  v14,  "NTLM Mirror attack detected",  v28,  2u);
                              }

                              objc_storeStrong(&v30, 0LL);
                            }

                            else
                            {
                              if (!sub_10000FF74(v55) && strcasecmp(v55, __b[1])) {
                                goto LABEL_30;
                              }
                              free(v55);
                              if (v61)
                              {
                                CFRelease(v61);
                                v61 = 0LL;
                              }

                              v61 = CFStringCreateWithCString(0LL, __b[1], 0x8000100u);
                              if (v61)
                              {
                                CFBooleanRef v55 = rk_cfstring2cstring(v61);
                                if (v55)
                                {
LABEL_30:
                                  v78[1] = v56;
                                  LODWORD(v78[0]) = (uint64_t)__b[0] & valuePtr;
                                  v78[2] = v55;
                                  v78[9] = strdup("MOBILE");
                                  int v36 = heim_ntlm_decode_targetinfo(&__b[2], 1LL, v37);
                                  if (!v36)
                                  {
                                    if (v37[8]) {
                                      free(v37[8]);
                                    }
                                    if (v37[6]) {
                                      free(v37[6]);
                                    }
                                    LODWORD(v37[5]) |= 2u;
                                    v37[6] = v54;
                                    if (v38)
                                    {
                                      v37[8] = (void *)v39;
                                      v37[7] = v38;
                                    }

                                    else
                                    {
                                      v37[8] = &unk_100024FB8;
                                      v37[7] = (void *)16;
                                    }

                                    int v36 = heim_ntlm_encode_targetinfo(v37, 1LL, v40);
                                    if (!v36)
                                    {
                                      memset(&v37[6], 0, 24);
                                      heim_ntlm_free_targetinfo(v37);
                                      if (!v36)
                                      {
                                        v78[4] = malloc(0x18uLL);
                                        if (v78[4])
                                        {
                                          v78[3] = 24LL;
                                          __memset_chk(v78[4], 0LL, 24LL, -1LL);
                                        }

                                        else
                                        {
                                          int v36 = 12;
                                        }

                                        if (!v36)
                                        {
                                          int v36 = heim_ntlm_calculate_ntlm2( BytePtr,  Length,  v78[1],  v55,  &__b[4],  v40,  v77,  &v78[5]);
                                          if (!v36)
                                          {
                                            int v11 = (v78[0] & 0x40000000) != 0
                                                ? heim_ntlm_build_ntlm2_master(v77, 16LL, &v78[5], &v41, &v78[7])
                                                : heim_ntlm_v2_base_session(v77, 16LL, &v78[5], &v41);
                                            int v36 = v11;
                                            if (!v11)
                                            {
                                              int v36 = heim_ntlm_encode_type3(v78, &v47, &v51);
                                              if (!v36)
                                              {
                                                if (v47 >= 0x10)
                                                {
                                                  if (v51 && v51 < v47 - 16)
                                                  {
                                                    macOut = (void *)&v48[v51];
                                                    CCHmacInit(&ctx, 1u, v42, v41);
                                                    CCHmacUpdate(&ctx, v46, v45);
                                                    CCHmacUpdate(&ctx, v44, v43);
                                                    CCHmacUpdate(&ctx, v48, v47);
                                                    CCHmacFinal(&ctx, macOut);
                                                  }

                                                  CFDataRef v66 = CFDataCreate(kCFAllocatorDefault, v48, v47);
                                                  if (v66)
                                                  {
                                                    CFNumberRef v59 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &v52);
                                                    if (v59)
                                                    {
                                                      if (v60)
                                                      {
                                                        CFRelease(v60);
                                                        CFNumberRef v60 = 0LL;
                                                      }

                                                      CFNumberRef v60 = CFNumberCreate( kCFAllocatorDefault,  kCFNumberSInt32Type,  v78);
                                                      if (v60)
                                                      {
                                                        CFDataRef v65 = CFDataCreate(kCFAllocatorDefault, (const UInt8 *)v42, v41);
                                                        if (v65)
                                                        {
                                                          heim_ntlm_unparse_flags(LODWORD(v78[0]), v80, 256LL);
                                                          os_log_t oslog = (os_log_t)sub_10000EABC();
                                                          if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
                                                          {
                                                            sub_10000FF98( (uint64_t)v75,  (uint64_t)v55,  (uint64_t)v56,  (uint64_t)v80);
                                                            _os_log_impl( (void *)&_mh_execute_header,  oslog,  OS_LOG_TYPE_INFO,  "ntlm v2 request processed for %s\\%s flags: %s",  v75,  0x20u);
                                                          }

                                                          objc_storeStrong((id *)&oslog, 0LL);
                                                          keys[0] = @"kHEIMObjectType";
                                                          keys[1] = @"kHEIMAttrType";
                                                          keys[2] = @"kHEIMAttrNTLMUsername";
                                                          keys[3] = @"kHEIMAttrNTLMDomain";
                                                          keys[4] = @"kHEIMAttrNTLMType3Data";
                                                          keys[5] = @"kHEIMAttrNTLMSessionKey";
                                                          keys[6] = @"kHEIMAttrNTLMClientFlags";
                                                          keys[7] = @"kHEIMAttrNTLMKCMFlags";
                                                          values[0] = @"kHEIMObjectNTLM";
                                                          values[1] = @"kHEIMTypeNTLM";
                                                          values[2] = (void *)v62;
                                                          values[3] = (void *)v61;
                                                          values[4] = v66;
                                                          values[5] = v65;
                                                          values[6] = v60;
                                                          values[7] = v59;
                                                          CFDictionaryRef v69 = CFDictionaryCreate( 0LL,  (const void **)keys,  (const void **)values,  8LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
                                                          if (!v69) {
                                                            heim_abort("Failed to create dictionary:result_cfdict != NULL");
                                                          }
                                                        }
                                                      }
                                                    }
                                                  }
                                                }

                                                else
                                                {
                                                  int v36 = 22;
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  v77[0] = 0LL;
  v77[1] = 0LL;
  if (v78[4]) {
    free((void *)v78[4]);
  }
  if (v78[6]) {
    free((void *)v78[6]);
  }
  if (v78[8]) {
    free((void *)v78[8]);
  }
  if (v78[9]) {
    free((void *)v78[9]);
  }
  heim_ntlm_free_type2(__b);
  heim_ntlm_free_buf(&v41);
  heim_ntlm_free_buf(v40);
  if (v66)
  {
    CFRelease(v66);
    CFDataRef v66 = 0LL;
  }

  if (v59)
  {
    CFRelease(v59);
    CFNumberRef v59 = 0LL;
  }

  if (v60)
  {
    CFRelease(v60);
    CFNumberRef v60 = 0LL;
  }

  if (v65)
  {
    CFRelease(v65);
    CFDataRef v65 = 0LL;
  }

  if (v61)
  {
    CFRelease(v61);
    v61 = 0LL;
  }

  return v69;
}

void sub_10000FDFC()
{
  theSet = CFSetCreateMutable(0LL, 0LL, &kCFTypeSetCallBacks);
  CFMutableDictionaryRef theDict = sub_10000B2DC(@"kHEIMObjectNTLMReflection");
  CFDictionarySetValue(theDict, @"kHEIMAttrData", @"WRd");
  CFSetAddValue(theSet, theDict);
  if (theDict) {
    CFRelease(theDict);
  }
  sub_10000AFC4(@"kHEIMTypeNTLMRelfection", theSet, 0LL, 0LL, 0LL, (uint64_t)sub_10000BB10, 0, 0LL);
  if (theSet) {
    CFRelease(theSet);
  }
}

CFTypeRef sub_10000FEF8(const __CFDictionary *a1, const void *a2, uint64_t a3)
{
  CFTypeRef cf = CFDictionaryGetValue(a1, a2);
  if (cf && CFGetTypeID(cf) == a3) {
    return cf;
  }
  else {
    return 0LL;
  }
}

BOOL sub_10000FF74(char *a1)
{
  return *a1 == 92;
}

uint64_t sub_10000FF98(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(_BYTE *)CFTypeID result = 2;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 32;
  *(_BYTE *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 32;
  *(_BYTE *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  return result;
}

CFUUIDRef sub_100010000(void *a1, const char *a2)
{
  uuid = (CFUUIDBytes *)xpc_dictionary_get_uuid(a1, a2);
  if (uuid) {
    return CFUUIDCreateFromUUIDBytes(0LL, *uuid);
  }
  else {
    return 0LL;
  }
}

CFTypeRef sub_100010074(void *a1, const char *a2, uint64_t a3)
{
  xpc_object_t value = xpc_dictionary_get_value(a1, a2);
  if (!value) {
    return 0LL;
  }
  CFTypeRef cf = (CFTypeRef)_CFXPCCreateCFObjectFromXPCObject(value);
  if (cf && CFGetTypeID(cf) != a3 && cf)
  {
    CFRelease(cf);
    return 0LL;
  }

  return cf;
}

void sub_100010140(void *a1, const char *a2, uint64_t a3)
{
  xpc_object_t value = (xpc_object_t)_CFXPCCreateXPCObjectFromCFObject(a3);
  if (value)
  {
    xpc_dictionary_set_value(a1, a2, value);
    xpc_release(value);
  }

uint64_t sub_1000101A4()
{
  return qword_100024F30;
}

void sub_1000101C4()
{
  if (qword_100024FC8 != -1) {
    dispatch_once(&qword_100024FC8, &stru_100020E98);
  }
}

uint64_t sub_100010220(uint64_t a1)
{
  uint64_t Instance = _CFRuntimeCreateInstance(0LL, qword_100024F30, 72LL);
  if (!Instance) {
    return 0LL;
  }
  *(void *)(Instance + 16) = a1;
  pthread_mutex_init((pthread_mutex_t *)(Instance + 24), 0LL);
  return Instance;
}

void sub_1000102A4(id a1)
{
  qword_100024F28 = _CFRuntimeRegisterClass(&unk_100020EB8);
  qword_100024F30 = _CFRuntimeRegisterClass(&unk_100020F18);
  unk_100024F20 = dispatch_queue_create("HeimCred", 0LL);
  qword_100024F40 = (uint64_t)CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  qword_100024F48 = (uint64_t)CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
}

uint64_t sub_100010370(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    CFRelease(*(CFTypeRef *)(a1 + 16));
    *(void *)(a1 + 16) = 0LL;
  }

  if (*(void *)(a1 + 24))
  {
    CFRelease(*(CFTypeRef *)(a1 + 24));
    *(void *)(a1 + 24) = 0LL;
  }

  pthread_mutex_lock((pthread_mutex_t *)(a1 + 40));
  if (*(void *)(a1 + 168))
  {
    pthread_mutex_lock((pthread_mutex_t *)(*(void *)(a1 + 168) + 24LL));
    *(void *)(*(void *)(a1 + 168) + 16LL) = 0LL;
    pthread_mutex_unlock((pthread_mutex_t *)(*(void *)(a1 + 168) + 24LL));
    if (*(void *)(a1 + 168))
    {
      CFRelease(*(CFTypeRef *)(a1 + 168));
      *(void *)(a1 + 168) = 0LL;
    }
  }

  if (*(void *)(a1 + 160))
  {
    pthread_mutex_lock((pthread_mutex_t *)(*(void *)(a1 + 160) + 24LL));
    *(void *)(*(void *)(a1 + 160) + 16LL) = 0LL;
    pthread_mutex_unlock((pthread_mutex_t *)(*(void *)(a1 + 160) + 24LL));
    if (*(void *)(a1 + 160))
    {
      CFRelease(*(CFTypeRef *)(a1 + 160));
      *(void *)(a1 + 160) = 0LL;
    }
  }

  if (*(void *)(a1 + 112))
  {
    heim_ipc_event_cancel(*(void *)(a1 + 112));
    heim_ipc_event_free(*(void *)(a1 + 112));
    *(void *)(a1 + 112) = 0LL;
  }

  if (*(void *)(a1 + 136))
  {
    heim_ipc_event_cancel(*(void *)(a1 + 136));
    heim_ipc_event_free(*(void *)(a1 + 136));
    *(void *)(a1 + 136) = 0LL;
  }

  pthread_mutex_unlock((pthread_mutex_t *)(a1 + 40));
  return pthread_mutex_destroy((pthread_mutex_t *)(a1 + 40));
}

CFStringRef sub_1000105A0()
{
  return @"format";
}

CFStringRef sub_1000105BC(uint64_t a1)
{
  uint64_t v31 = a1;
  uint64_t v30 = a1;
  if (!*(void *)(a1 + 24)) {
    return CFStringCreateWithFormat(0LL, 0LL, @"HeimCred<%@>", *(void *)(v30 + 16));
  }
  CFTypeRef Value = CFDictionaryGetValue(*(CFDictionaryRef *)(v30 + 24), @"kHEIMAttrClientName");
  os_log_type_t v28 = CFDictionaryGetValue(*(CFDictionaryRef *)(v30 + 24), @"kHEIMAttrServerName");
  CFIndex v27 = CFDictionaryGetValue(*(CFDictionaryRef *)(v30 + 24), @"kHEIMAttrParentCredential");
  CFBooleanRef v26 = (CFBooleanRef)CFDictionaryGetValue(*(CFDictionaryRef *)(v30 + 24), @"kHEIMAttrLeadCredential");
  uint64_t v25 = (const __CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(v30 + 24), @"kHEIMAttrAltDSID");
  os_log_type_t v24 = (const __CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(v30 + 24), @"kHEIMAttrUserID");
  CFTypeRef v23 = (const __CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(v30 + 24), @"kHEIMAttrASID");
  if (v26) {
    int v20 = CFBooleanGetValue(v26);
  }
  else {
    int v20 = 0;
  }
  int v22 = v20;
  unsigned int v21 = (const __CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(v30 + 24), @"kHEIMAttrBundleIdentifierACL");
  uint64_t v14 = *(void *)(v30 + 16);
  CFBooleanRef v15 = v26;
  uint64_t v16 = v27;
  __int128 v17 = Value;
  id v18 = v28;
  os_log_t v1 = "yes";
  if (!v20) {
    os_log_t v1 = "no";
  }
  os_log_type_t v19 = v1;
  if (v21) {
    os_log_t v13 = v21;
  }
  else {
    os_log_t v13 = &stru_100022040;
  }
  int v11 = v13;
  uint64_t v12 = v25;
  if (v25) {
    CFTypeID v10 = v12;
  }
  else {
    CFTypeID v10 = &stru_100022040;
  }
  CFTypeID v8 = v10;
  CFTypeID v9 = v24;
  if (v24) {
    CFTypeID v7 = v9;
  }
  else {
    CFTypeID v7 = &stru_100022040;
  }
  CFTypeID v5 = v7;
  CFTypeID v6 = v23;
  if (v23) {
    CFTypeID v4 = v6;
  }
  else {
    CFTypeID v4 = &stru_100022040;
  }
  v3[10] = v3;
  return CFStringCreateWithFormat( 0LL,  0LL,  @"HeimCred<%@ group: %@ parent: %@ client: %@ server: %@ lead: %s ACL: %@, altDSID: %@, Uid: %@, asid: %@>",  v14,  v15,  v16,  v17,  v18,  v19,  v11,  v8,  v5,  v4);
}

uint64_t sub_1000108DC(uint64_t a1)
{
  return pthread_mutex_destroy((pthread_mutex_t *)(a1 + 24));
}

uint64_t sub_10001090C()
{
  return qword_100024F28;
}

uint64_t sub_10001092C(const void *a1)
{
  uint64_t Instance = _CFRuntimeCreateInstance(0LL, qword_100024F28, 160LL);
  if (!Instance) {
    return 0LL;
  }
  CFRetain(a1);
  *(void *)(Instance + 16) = a1;
  *(_DWORD *)(Instance + 144) = -1;
  *(void *)(Instance + 136) = 0LL;
  *(void *)(Instance + 112) = 0LL;
  pthread_mutex_init((pthread_mutex_t *)(Instance + 40), 0LL);
  *(_BYTE *)(Instance + 152) = 0;
  return Instance;
}

uint64_t start(unsigned int a1, void *a2)
{
  uint64_t v37 = a1;
  v36[1] = a2;
  v36[0] = 0LL;
  char v35 = 0;
  os_log_set_client_type(1LL, 0LL);
  umask(0x3Fu);
  _set_user_dir_suffix("com.apple.GSSCred");
  CFRange v34 = 0LL;
  context = objc_autoreleasePoolPush();
  id location = sub_10000EABC();
  char v32 = 1;
  if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_INFO))
  {
    log = (os_log_s *)location;
    os_log_type_t type = v32;
    sub_100002064(v31);
    _os_log_impl((void *)&_mh_execute_header, log, type, "Starting GSSCred", v31, 2u);
  }

  objc_storeStrong(&location, 0LL);
  off_100024EE0 = (uint64_t (*)(void))sub_10001102C;
  qword_100024E88 = (uint64_t)sub_1000110D8;
  CFTypeID v2 = objc_alloc_init(&OBJC_CLASS___ManagedAppManager);
  CFTypeID v3 = (void *)qword_100024EC8;
  qword_100024EC8 = (uint64_t)v2;

  off_100024E90 = (uint64_t (*)(void, void))sub_1000110E0;
  off_100024E98 = &xpc_connection_get_euid;
  off_100024EA0 = &xpc_connection_get_asid;
  off_100024EA8 = sub_100015C60;
  off_100024EB0 = sub_1000160E0;
  *(void *)algn_100024EB8 = sub_100011188;
  off_100024EC0 = (uint64_t (*)(void))sub_1000111DC;
  off_100024ED8 = (uint64_t (*)(void, void))sub_1000111F4;
  unk_100024E80 = sub_100011230() & 1;
  byte_100024ED0 = sub_10001123C() & 1;
  qword_100024EE8 = (uint64_t)sub_100014228;
  qword_100024EF0 = (uint64_t)sub_100013914;
  qword_100024EF8 = (uint64_t)sub_100014DB4;
  qword_100024F00 = (uint64_t)sub_100001E14;
  qword_100024F08 = sub_1000112B8();
  byte_100024ED1 = sub_100011370() & 1;
  qword_100024F10 = objc_opt_class(&OBJC_CLASS___GSSCredXPCHelperClient);
  off_100024F18 = (uint64_t (*)(void))sub_1000113EC;
  qword_100024F50 = (uint64_t)CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  if (!qword_100024F50) {
    heim_abort("out of memory:HeimCredCTX.mechanisms != NULL");
  }
  qword_100024F58 = (uint64_t)CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  if (!qword_100024F58) {
    heim_abort("out of memory:HeimCredCTX.schemas != NULL");
  }
  qword_100024F60 = (uint64_t)CFDictionaryCreateMutable( 0LL,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  if (!qword_100024F60) {
    heim_abort("out of memory:HeimCredCTX.globalSchema != NULL");
  }
  sub_10000B538();
  sub_10000BFA8();
  sub_1000164F8();
  sub_10000EB80();
  sub_10000FDFC();
  sub_100016684();
  nullsub_1();
  if (qword_100024F60)
  {
    CFRelease((CFTypeRef)qword_100024F60);
    qword_100024F60 = 0LL;
  }

  objc_storeStrong((id *)&qword_100024E78, @"/var/db/heim-credential-store.archive");
  dispatch_queue_t v4 = dispatch_queue_create("com.apple.GSSCred", 0LL);
  CFTypeID v5 = (void *)qword_100024FD0;
  qword_100024FD0 = (uint64_t)v4;

  if (!qword_100024FD0) {
    heim_abort("dispatch_queue_create failed:runQueue != NULL");
  }
  heim_ipc_init_globals();
  sub_1000101C4();
  sub_1000020C4();
  sub_10001143C();
  xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.GSSCred", (dispatch_queue_t)qword_100024FD0, 1uLL);
  id v7 = v36[0];
  v36[0] = mach_service;

  xpc_connection_set_event_handler((xpc_connection_t)v36[0], &stru_100020F98);
  heim_ipc_resume_events();
  xpc_connection_resume((xpc_connection_t)v36[0]);
  objc_autoreleasePoolPop(context);
  if ((v35 & 1) != 0)
  {
    id v30 = sub_100017B24();
    char v29 = 1;
    if (os_log_type_enabled((os_log_t)v30, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = (os_log_s *)v30;
      os_log_type_t v15 = v29;
      sub_100002064(v28);
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "Starting run loop", v28, 2u);
    }

    objc_storeStrong(&v30, 0LL);
  }

  else
  {
    id v27 = sub_10000EABC();
    char v26 = 1;
    if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = (os_log_s *)v27;
      os_log_type_t v13 = v26;
      sub_100002064(v25);
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "Starting run loop", v25, 2u);
    }

    objc_storeStrong(&v27, 0LL);
  }

  dispatch_source_t v8 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_signal,  0xFuLL,  0LL,  (dispatch_queue_t)qword_100024FD0);
  CFTypeID v9 = v34;
  CFRange v34 = v8;

  handler = _NSConcreteStackBlock;
  int v20 = -1073741824;
  int v21 = 0;
  int v22 = sub_10001194C;
  CFTypeRef v23 = &unk_100020FB8;
  char v24 = v35 & 1;
  dispatch_source_set_event_handler(v34, &handler);
  dispatch_activate(v34);
  signal(15, (void (__cdecl *)(int))1);
  int v11 = +[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop");
  -[NSRunLoop run](v11, "run");

  HIDWORD(v37) = 0;
  objc_storeStrong((id *)&v34, 0LL);
  objc_storeStrong(v36, 0LL);
  return HIDWORD(v37);
}

CFPropertyListRef sub_10001102C(const __CFString *a1)
{
  CFPropertyListRef v2 = (id)CFPreferencesCopyValue( a1,  @"com.apple.Heimdal.GSSCred",  kCFPreferencesAnyUser,  kCFPreferencesAnyHost);
  if (@"com.apple.Heimdal.GSSCred") {
    CFRelease(@"com.apple.Heimdal.GSSCred");
  }
  return v2;
}

uint64_t sub_1000110D8()
{
  return 0LL;
}

BOOL sub_1000110E0(void *a1, uint64_t a2)
{
  id v7 = a1;
  uint64_t v6 = a2;
  BOOL value = 0;
  xpc_object_t object = (xpc_object_t)xpc_connection_copy_entitlement_value(*a1, a2);
  if (object && xpc_get_type(object) == (xpc_type_t)&_xpc_type_BOOL) {
    BOOL value = xpc_BOOL_get_value(object);
  }
  BOOL v3 = value;
  objc_storeStrong(&object, 0LL);
  return v3;
}

uint64_t sub_100011188(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  objc_storeStrong(location, 0LL);
  return 0LL;
}

uint64_t sub_1000111DC()
{
  return 1LL;
}

void sub_1000111F4()
{
}

uint64_t sub_100011230()
{
  return 0LL;
}

uint64_t sub_10001123C()
{
  predicate = (dispatch_once_t *)&unk_100024FE0;
  dispatch_block_t block = 0LL;
  objc_storeStrong(&block, &stru_100021020);
  if (*predicate != -1) {
    dispatch_once(predicate, block);
  }
  objc_storeStrong(&block, 0LL);
  return byte_100024FD8 & 1;
}

uint64_t sub_1000112B8()
{
  uint64_t v4 = 7200LL;
  id location = (id)off_100024EE0(@"renew-interval");
  if (location)
  {
    else {
      uint64_t v2 = 60LL;
    }
    uint64_t v4 = v2;
  }

  uint64_t v1 = v4;
  objc_storeStrong(&location, 0LL);
  return v1;
}

uint64_t sub_100011370()
{
  predicate = (dispatch_once_t *)&unk_100024FF0;
  dispatch_block_t block = 0LL;
  objc_storeStrong(&block, &stru_100021040);
  if (*predicate != -1) {
    dispatch_once(predicate, block);
  }
  objc_storeStrong(&block, 0LL);
  return byte_100024FE8 & 1;
}

void sub_1000113EC(id obj)
{
  id location = 0LL;
  objc_storeStrong(&location, obj);
  dispatch_async((dispatch_queue_t)qword_100024FD0, location);
  objc_storeStrong(&location, 0LL);
}

void sub_10001143C()
{
  id location = 0LL;
  CFTypeID v10 = au_sdev_open(0x10000);
  if (v10)
  {
    id v0 = dispatch_get_global_queue(-2LL, 0LL);
    id v1 = location;
    id location = v0;

    uint64_t v2 = _NSConcreteStackBlock;
    int v3 = -1073741824;
    int v4 = 0;
    CFTypeID v5 = sub_1000121F4;
    uint64_t v6 = &unk_100021080;
    id v7 = v10;
    dispatch_async((dispatch_queue_t)location, &v2);
    int v8 = 0;
  }

  else
  {
    int v8 = 1;
  }

  objc_storeStrong(&location, 0LL);
}

void sub_100011500(id a1, OS_xpc_object *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  sub_100011554(location[0]);
  objc_storeStrong(location, 0LL);
}

void sub_100011554(id obj)
{
  id location = 0LL;
  objc_storeStrong(&location, obj);
  context = objc_autoreleasePoolPush();
  xpc_type_t v19 = xpc_get_type(location);
  if (v19 == (xpc_type_t)&_xpc_type_connection)
  {
    int v20 = (id *)calloc(1uLL, 0x58uLL);
    if (!v20) {
      heim_abort("out of memory:peer != NULL");
    }
    objc_storeStrong(v20, location);
    xpc_connection_get_audit_token(location);
    v20[1] = (id)sub_1000122F4(location);
    if (v20[1])
    {
      v20[2] = (id)CFRetain(v20[1]);
      if ((byte_100024ED0 & 1) != 0)
      {
        v20[7] = (id)sub_100002D64(-1);
      }

      else
      {
        int v3 = off_100024EA0(location);
        v20[7] = (id)sub_100002D64(v3);
      }

      if (!v20[7]) {
        heim_abort("out of memory:peer->session != NULL");
      }
      os_log_t v14 = (os_log_t)sub_10000EABC();
      os_log_type_t v13 = OS_LOG_TYPE_DEBUG;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        sub_100012604((uint64_t)v22, (uint64_t)v20[2], *((_DWORD *)v20[7] + 4));
        _os_log_debug_impl((void *)&_mh_execute_header, v14, v13, "new connection from %@, asid: %d", v22, 0x12u);
      }

      objc_storeStrong((id *)&v14, 0LL);
      *((_BYTE *)v20 + 64) = 1;
      *((_BYTE *)v20 + 65) = 0;
      *((_DWORD *)v20 + 20) = 0;
      xpc_connection_set_context((xpc_connection_t)location, v20);
      xpc_connection_set_finalizer_f((xpc_connection_t)location, (xpc_finalizer_t)sub_100012658);
      handler = _NSConcreteStackBlock;
      int v8 = -1073741824;
      int v9 = 0;
      CFTypeID v10 = sub_100012688;
      int v11 = &unk_1000210A0;
      uint64_t v12 = v20;
      xpc_connection_set_event_handler((xpc_connection_t)location, &handler);
      xpc_connection_set_target_queue((xpc_connection_t)location, (dispatch_queue_t)qword_100024FD0);
      xpc_connection_resume((xpc_connection_t)location);
      int v18 = 0;
    }

    else
    {
      pid_t v1 = getpid();
      if (proc_pidpath(v1, buffer, 0x400u) <= 0) {
        buffer[0] = 0;
      }
      os_log_t oslog = (os_log_t)sub_10000EABC();
      os_log_type_t type = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        log = oslog;
        os_log_type_t v5 = type;
        audit_token_t atoken = *(audit_token_t *)(v20 + 3);
        pid_t v2 = audit_token_to_pid(&atoken);
        sub_1000125B0((uint64_t)v23, v2, (uint64_t)buffer);
        _os_log_error_impl((void *)&_mh_execute_header, log, v5, "client[pid-%d] %s is not signed", v23, 0x12u);
      }

      objc_storeStrong((id *)&oslog, 0LL);
      free(v20);
      xpc_connection_cancel((xpc_connection_t)location);
      int v18 = 1;
    }
  }

  else
  {
    int v18 = 1;
  }

  objc_autoreleasePoolPop(context);
  if (!v18) {
    int v18 = 0;
  }
  objc_storeStrong(&location, 0LL);
}

void sub_10001194C(_BYTE *a1)
{
  id location[2] = a1;
  location[1] = a1;
  char v1 = a1[32];
  char v32 = 0;
  char v30 = 0;
  if ((v1 & 1) != 0)
  {
    id v33 = sub_100017B24();
    char v32 = 1;
    id v2 = v33;
  }

  else
  {
    id v31 = sub_10000EABC();
    char v30 = 1;
    id v2 = v31;
  }

  location[0] = v2;
  if ((v30 & 1) != 0) {

  }
  if ((v32 & 1) != 0) {
  unsigned __int8 v29 = 0;
  }
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
  {
    log = (os_log_s *)location[0];
    HIDWORD(v19) = v29;
    sub_100002064(v28);
    _os_log_impl((void *)&_mh_execute_header, log, BYTE4(v19), "Got SIGTERM, shutting down", v28, 2u);
  }

  objc_storeStrong(location, 0LL);
  if ((byte_100024F6D & 1) != 0)
  {
    char v3 = a1[32];
    char v25 = 0;
    char v23 = 0;
    if ((v3 & 1) != 0)
    {
      id v26 = sub_100017B24();
      char v25 = 1;
      id v17 = v26;
      id v4 = v26;
    }

    else
    {
      id v24 = sub_10000EABC();
      char v23 = 1;
      id v17 = v24;
      id v4 = v24;
    }

    id v27 = v4;
    if ((v23 & 1) != 0) {

    }
    if ((v25 & 1) != 0) {
    os_log_type_t v22 = OS_LOG_TYPE_DEFAULT;
    }
    if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_DEFAULT))
    {
      os_log_t v14 = (os_log_s *)v27;
      HIDWORD(v15) = v22;
      uint64_t v16 = v21;
      sub_100002064(v21);
      _os_log_impl((void *)&_mh_execute_header, v14, BYTE4(v15), "Saving cached credentials", v21, 2u);
    }

    objc_storeStrong(&v27, 0LL);
    sub_100001780( v5,  v6,  v7,  v8,  v9,  v10,  v11,  v12,  v13,  (uint64_t)v14,  v15,  (uint64_t)v16,  (uint64_t)v17,  (int)log,  SHIDWORD(log),  v19);
  }

  exit(0);
}

void sub_100011BE4(id a1)
{
  v9[2] = a1;
  v9[1] = a1;
  if ((byte_100024F6C & 1) != 0)
  {
    byte_100024F6C = 0;
    if ((byte_100024F6D & 1) == 0)
    {
      byte_100024F6D = 1;
      v9[0] = (id)os_transaction_create("com.apple.Heimdal.GSSCred.StoreCredCache");
      dispatch_time_t when = dispatch_time(0LL, 5000000000LL);
      queue = (dispatch_queue_s *)qword_100024FD0;
      char v3 = _NSConcreteStackBlock;
      int v4 = -1073741824;
      int v5 = 0;
      int v6 = sub_100011D08;
      int v7 = &unk_100021000;
      id v8 = v9[0];
      dispatch_after(when, queue, &v3);
      objc_storeStrong(&v8, 0LL);
      objc_storeStrong(v9, 0LL);
    }
  }

#error "100011D2C: call analysis failed (funcsize=12)"
void __cdecl sub_100011D3C(id a1)
{
  _BYTE v1[12];
  id v2;
  id v3;
  char v3 = a1;
  id v2 = a1;
  *(void *)&v1[4] = (id)off_100024EE0(@"use-uid-matching");
  if (*(void *)&v1[4]) {
    *(_DWORD *)char v1 = [*(id *)&v1[4] BOOLValue] & 1;
  }
  else {
    *(void *)char v1 = sub_100011DE4();
  }
  byte_100024FD8 = *(_DWORD *)v1 != 0;
  objc_storeStrong((id *)&v1[4], 0LL);
}

BOOL sub_100011DE4()
{
  BOOL v22 = 0;
  krb5_context v21 = 0LL;
  xpc_type_t v19 = "/etc/kcm.conf";
  krb5_error_code inited = krb5_init_context(&v21);
  if (inited)
  {
    id location = sub_10000EABC();
    os_log_type_t v17 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_ERROR))
    {
      sub_10000E76C((uint64_t)v24, inited);
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)location, v17, "krb5_init_context failed: %d", v24, 8u);
    }

    objc_storeStrong(&location, 0LL);
    return 0;
  }

  else
  {
    krb5_error_code inited = krb5_prepend_config_files_default(v19, &v16);
    if (inited)
    {
      id v15 = sub_10000EABC();
      char v14 = 16;
      if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_ERROR))
      {
        int v5 = (os_log_s *)v15;
        os_log_type_t v6 = v14;
        sub_100002064(v13);
        _os_log_error_impl((void *)&_mh_execute_header, v5, v6, "error getting kcm configuration files", v13, 2u);
      }

      objc_storeStrong(&v15, 0LL);
      krb5_free_context(v21);
      return 0;
    }

    else
    {
      krb5_error_code inited = krb5_set_config_files(v21, v16);
      krb5_free_config_files(v16);
      if (inited)
      {
        id v12 = sub_10000EABC();
        char v11 = 16;
        if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_ERROR))
        {
          char v3 = (os_log_s *)v12;
          os_log_type_t v4 = v11;
          sub_100002064(v10);
          _os_log_error_impl((void *)&_mh_execute_header, v3, v4, "error reading kcm configuration files", v10, 2u);
        }

        objc_storeStrong(&v12, 0LL);
        krb5_free_context(v21);
        return 0;
      }

      else
      {
        BOOL v22 = krb5_config_get_BOOL_default(v21, 0LL, 0LL) != 0;
        if (v22)
        {
          os_log_t oslog = (os_log_t)sub_10000EABC();
          os_log_type_t v8 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
          {
            char v1 = oslog;
            os_log_type_t v2 = v8;
            sub_100002064(v7);
            _os_log_error_impl( (void *)&_mh_execute_header,  v1,  v2,  "*** Using 'use-uid-matching' in the kcm section of a krb5.conf file is deprecated.  It will be removed in a future macOS version.  Use the GSSCred default instead. ",  v7,  2u);
          }

          objc_storeStrong((id *)&oslog, 0LL);
        }

        krb5_free_context(v21);
        return v22;
      }
    }
  }

void sub_10001217C(id a1)
{
  v1[2] = a1;
  v1[1] = a1;
  v1[0] = (id)off_100024EE0(@"disable-ntlm-reflection-detection");
  byte_100024FE8 = [v1[0] BOOLValue] & 1;
  objc_storeStrong(v1, 0LL);
}

void sub_1000121F4(uint64_t a1)
{
  uint64_t v11 = a1;
  uint64_t v10 = a1;
  while (1)
  {
    while (au_sdev_read_aia(*(au_sdev_handle_t **)(a1 + 32), &event, &aia_p))
      ;
    if (event == 44903)
    {
      os_log_type_t v2 = _NSConcreteStackBlock;
      int v3 = -1073741824;
      int v4 = 0;
      int v5 = sub_1000122BC;
      os_log_type_t v6 = &unk_100021060;
      memcpy(v7, &aia_p, sizeof(v7));
      dispatch_async((dispatch_queue_t)qword_100024FD0, &v2);
    }
  }

void sub_1000122BC(uint64_t a1)
{
}

CFStringRef sub_1000122F4(id obj)
{
  id location = 0LL;
  objc_storeStrong(&location, obj);
  uint64_t v9 = 0LL;
  unsigned int pid = xpc_connection_get_pid((xpc_connection_t)location);
  xpc_connection_get_audit_token(location);
  if (csops_audittoken(pid, 11LL, &v9, 8LL, v4) == -1 && *__error() == 34)
  {
    unsigned int v5 = HIDWORD(v9);
    unsigned int v5 = sub_1000132B0(HIDWORD(v9));
    if (v5 <= 0x100000)
    {
      if (v5)
      {
        os_log_type_t v2 = (UInt8 *)malloc(v5);
        if (v2)
        {
          if (csops_audittoken(pid, 11LL, v2, v5, v4) || v5 <= 8 || (v5 -= 8, v2[v5 + 7]))
          {
            free(v2);
            CFStringRef v8 = 0LL;
          }

          else
          {
            CFStringRef v6 = CFStringCreateWithBytes(0LL, v2 + 8, v5 - 1, 0x8000100u, 0);
            free(v2);
            CFStringRef v8 = v6;
          }
        }

        else
        {
          CFStringRef v8 = 0LL;
        }
      }

      else
      {
        CFStringRef v8 = 0LL;
      }
    }

    else
    {
      CFStringRef v8 = 0LL;
    }
  }

  else
  {
    CFStringRef v8 = 0LL;
  }

  objc_storeStrong(&location, 0LL);
  return v8;
}

uint64_t sub_1000125B0(uint64_t result, int a2, uint64_t a3)
{
  *(_BYTE *)CFTypeID result = 2;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 0;
  *(_BYTE *)(result + 3) = 4;
  *(_DWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 8) = 32;
  *(_BYTE *)(result + 9) = 8;
  *(void *)(result + 10) = a3;
  return result;
}

uint64_t sub_100012604(uint64_t result, uint64_t a2, int a3)
{
  *(_BYTE *)CFTypeID result = 2;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 64;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 4;
  *(_DWORD *)(result + 14) = a3;
  return result;
}

void sub_100012658(CFTypeRef *a1)
{
}

void sub_100012688(void **a1, void *a2)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  sub_1000126E4(a1[4], location[0]);
  objc_storeStrong(location, 0LL);
}

void sub_1000126E4(void *a1, void *a2)
{
  CFNumberRef v59 = a1;
  id location = 0LL;
  objc_storeStrong(&location, a2);
  dispatch_assert_queue_V2((dispatch_queue_t)qword_100024FD0);
  context = objc_autoreleasePoolPush();
  id v57 = 0LL;
  xpc_type_t v56 = xpc_get_type(location);
  if (v56 == (xpc_type_t)&_xpc_type_error)
  {
    objc_storeStrong((id *)v59, 0LL);
    int v55 = 1;
    goto LABEL_60;
  }

  if (v56 != (xpc_type_t)&_xpc_type_dictionary) {
    __assert_rtn("GSSCred_peer_event_handler", "server.m", 282, "type == XPC_TYPE_DICTIONARY");
  }
  string = xpc_dictionary_get_string(location, "impersonate");
  if (string)
  {
    size_t v2 = strlen(string);
    CFStringRef v53 = CFStringCreateWithBytes(0LL, (const UInt8 *)string, v2, 0x8000100u, 0);
    if (v53 && !CFEqual((CFTypeRef)v59[1], v53))
    {
      if ((off_100024E90(v59, "com.apple.private.accounts.bundleidspoofing") & 1) == 0)
      {
        xpc_connection_cancel((xpc_connection_t)*v59);
        CFRelease(v53);
        CFStringRef v53 = 0LL;
        int v55 = 1;
        goto LABEL_60;
      }

      if (v59[1])
      {
        CFRelease((CFTypeRef)v59[1]);
        v59[1] = 0LL;
      }

      v59[1] = CFRetain(v53);
      *((_BYTE *)v59 + 64) = 1;
      *((_BYTE *)v59 + 65) = 0;
      id v52 = sub_10000EABC();
      char v51 = 2;
      if (os_log_type_enabled((os_log_t)v52, OS_LOG_TYPE_DEBUG))
      {
        log = (os_log_s *)v52;
        os_log_type_t type = v51;
        CStringPtr = CFStringGetCStringPtr((CFStringRef)v59[1], 0x8000100u);
        audit_token_t atoken = *(audit_token_t *)(v59 + 3);
        pid_t v3 = audit_token_to_pid(&atoken);
        sub_1000132D0((uint64_t)v61, (uint64_t)CStringPtr, v3);
        _os_log_debug_impl((void *)&_mh_execute_header, log, type, "impersonating app: %s, %d", v61, 0x12u);
      }

      objc_storeStrong(&v52, 0LL);
    }

    if (v53)
    {
      CFRelease(v53);
      CFStringRef v53 = 0LL;
    }
  }

  id v49 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ (%@)", v59[2], v59[1]);
  id v39 = sub_10000EABC();
  sub_100013324(v39, location, *(_DWORD *)(v59[7] + 16LL), v49, @"Request received");

  __s1 = (char *)xpc_dictionary_get_string(location, "command");
  if (__s1)
  {
    uint64_t v4 = strcmp(__s1, "wakeup");
    if ((_DWORD)v4)
    {
      if (!strcmp(__s1, "create"))
      {
        xpc_object_t reply = xpc_dictionary_create_reply(location);
        id v7 = v57;
        id v57 = reply;

        sub_100003914(v59, location, v57);
      }

      else if (!strcmp(__s1, "delete"))
      {
        xpc_object_t v8 = xpc_dictionary_create_reply(location);
        id v9 = v57;
        id v57 = v8;

        sub_100005D48(v59, location, v57);
      }

      else if (!strcmp(__s1, "delete-all"))
      {
        xpc_object_t v10 = xpc_dictionary_create_reply(location);
        id v11 = v57;
        id v57 = v10;

        sub_100009D34(v59, location, v57);
      }

      else if (!strcmp(__s1, "setattributes"))
      {
        xpc_object_t v12 = xpc_dictionary_create_reply(location);
        id v13 = v57;
        id v57 = v12;

        sub_100006504(v59, location, v57);
      }

      else if (!strcmp(__s1, "fetch"))
      {
        xpc_object_t v14 = xpc_dictionary_create_reply(location);
        id v15 = v57;
        id v57 = v14;

        sub_100008030(v59, location, v57);
      }

      else if (!strcmp(__s1, "move"))
      {
        xpc_object_t v16 = xpc_dictionary_create_reply(location);
        id v17 = v57;
        id v57 = v16;

        sub_100008BE8(v59, location, v57);
      }

      else if (!strcmp(__s1, "query"))
      {
        xpc_object_t v18 = xpc_dictionary_create_reply(location);
        id v19 = v57;
        id v57 = v18;

        sub_100008430(v59, location, v57);
      }

      else if (!strcmp(__s1, "default"))
      {
        xpc_object_t v20 = xpc_dictionary_create_reply(location);
        id v21 = v57;
        id v57 = v20;

        sub_1000089E4((uint64_t)v59, location, v57);
      }

      else if (!strcmp(__s1, "retain-transient"))
      {
        xpc_object_t v22 = xpc_dictionary_create_reply(location);
        id v23 = v57;
        id v57 = v22;

        sub_10000A0D4(v59, location, v57);
      }

      else if (!strcmp(__s1, "release-transient"))
      {
        xpc_object_t v24 = xpc_dictionary_create_reply(location);
        id v25 = v57;
        id v57 = v24;

        sub_10000A74C(v59, location, v57);
      }

      else if (!strcmp(__s1, "status"))
      {
        xpc_object_t v26 = xpc_dictionary_create_reply(location);
        id v27 = v57;
        id v57 = v26;

        sub_100009AC4(v59, location, v57);
      }

      else if (!strcmp(__s1, "doauth"))
      {
        xpc_object_t v28 = xpc_dictionary_create_reply(location);
        id v29 = v57;
        id v57 = v28;

        sub_1000070A0(v59, location, v57);
      }

      else if (!strcmp(__s1, "doscram"))
      {
        xpc_object_t v30 = xpc_dictionary_create_reply(location);
        id v31 = v57;
        id v57 = v30;

        sub_10000736C(v59, location, v57);
      }

      else if (!strcmp(__s1, "add-challenge"))
      {
        xpc_object_t v32 = xpc_dictionary_create_reply(location);
        id v33 = v57;
        id v57 = v32;

        sub_100007620((uint64_t)v59, location, v57);
      }

      else if (!strcmp(__s1, "check-challenge"))
      {
        xpc_object_t v34 = xpc_dictionary_create_reply(location);
        id v35 = v57;
        id v57 = v34;

        sub_100007DE8(v59, location, v57);
      }

      else
      {
        os_log_t v44 = (os_log_t)sub_10000EABC();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          sub_10001364C((uint64_t)v60, (uint64_t)__s1);
          _os_log_error_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_ERROR,  "peer sent invalid command %s",  v60,  0xCu);
        }

        objc_storeStrong((id *)&v44, 0LL);
        xpc_connection_cancel((xpc_connection_t)*v59);
      }
    }
  }

  else
  {
    os_log_t oslog = (os_log_t)sub_10000EABC();
    os_log_type_t v46 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      uint64_t v37 = oslog;
      os_log_type_t v38 = v46;
      sub_100002064(v45);
      _os_log_error_impl((void *)&_mh_execute_header, v37, v38, "peer sent invalid no command", v45, 2u);
    }

    objc_storeStrong((id *)&oslog, 0LL);
    xpc_connection_cancel((xpc_connection_t)*v59);
  }

  if (v57)
  {
    id v36 = sub_10000EABC();
    sub_100013324(v36, v57, *(_DWORD *)(v59[7] + 16LL), v49, @"Reply to be sent");

    xpc_connection_send_message((xpc_connection_t)*v59, v57);
  }

  off_100024ED8(v4, v5);
  objc_storeStrong(&v49, 0LL);
  int v55 = 0;
LABEL_60:
  objc_storeStrong(&v57, 0LL);
  objc_autoreleasePoolPop(context);
  if (!v55) {
    int v55 = 0;
  }
  objc_storeStrong(&location, 0LL);
}

uint64_t sub_1000132B0(unsigned int a1)
{
  return bswap32(a1);
}

uint64_t sub_1000132D0(uint64_t result, uint64_t a2, int a3)
{
  *(_BYTE *)CFTypeID result = 2;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 4;
  *(_DWORD *)(result + 14) = a3;
  return result;
}

void sub_100013324(void *a1, void *a2, int a3, void *a4, void *a5)
{
  id location = 0LL;
  objc_storeStrong(&location, a1);
  id v23 = 0LL;
  objc_storeStrong(&v23, a2);
  int v22 = a3;
  id v21 = 0LL;
  objc_storeStrong(&v21, a4);
  id v20 = 0LL;
  objc_storeStrong(&v20, a5);
  id v27 = (id)_CFXPCCreateCFObjectFromXPCObject(v23);
  id v19 = v27;
  id v18 = [v19 mutableCopy];
  id v17 = [v18 objectForKeyedSubscript:@"attributes"];
  if (v17)
  {
    [v18 setObject:0 forKeyedSubscript:@"attributes"];
    uint64_t v16 = 0LL;
    xpc_object_t v8 = (const __CFDictionary *)v17;
    CFTypeID TypeID = CFStringGetTypeID();
    CFTypeRef key = (void *)sub_10000AF0C(v8, @"kHEIMAttrType", TypeID, (uint64_t)&v16);
    if (key)
    {
      CFTypeRef Value = (uint64_t (**)(id))CFDictionaryGetValue((CFDictionaryRef)qword_100024F50, key);
      if (Value)
      {
        id v26 = (id)Value[6](v17);
        id v7 = v26;
        objc_msgSend(v18, "setObject:forKeyedSubscript:");
      }
    }

    else
    {
      id v25 = sub_10000BB10(v17);
      id v6 = v25;
      objc_msgSend(v18, "setObject:forKeyedSubscript:");
    }
  }

  os_log_t oslog = (os_log_t)location;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
  {
    sub_10001368C((uint64_t)v28, (uint64_t)v20, v22, (uint64_t)v21, (uint64_t)v18);
    _os_log_debug_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEBUG, "%@: %u, %@, %@", v28, 0x26u);
  }

  objc_storeStrong((id *)&oslog, 0LL);
  objc_storeStrong(&v17, 0LL);
  objc_storeStrong(&v18, 0LL);
  objc_storeStrong(&v19, 0LL);
  objc_storeStrong(&v20, 0LL);
  objc_storeStrong(&v21, 0LL);
  objc_storeStrong(&v23, 0LL);
  objc_storeStrong(&location, 0LL);
}

uint64_t sub_10001364C(uint64_t result, uint64_t a2)
{
  *(_BYTE *)CFTypeID result = 2;
  *(_BYTE *)(result + 1) = 1;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  return result;
}

uint64_t sub_10001368C(uint64_t result, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  *(_BYTE *)CFTypeID result = 2;
  *(_BYTE *)(result + 1) = 4;
  *(_BYTE *)(result + 2) = 64;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 4;
  *(_DWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 18) = 64;
  *(_BYTE *)(result + 19) = 8;
  *(void *)(result + 20) = a4;
  *(_BYTE *)(result + 28) = 64;
  *(_BYTE *)(result + 29) = 8;
  *(void *)(result + 30) = a5;
  return result;
}

void sub_100013914(uint64_t a1, char *a2)
{
  uint64_t v12 = a1;
  id v11 = a2;
  CFTypeID v2 = CFGetTypeID(a2);
  if (v2 != sub_1000101A4()) {
    heim_abort("context wrong type:CFGetTypeID(ptr) == HeimCredEventContextGetTypeID()");
  }
  sub_100014DC4();
  CFTypeRef v10 = 0LL;
  id v9 = v11;
  pthread_mutex_lock((pthread_mutex_t *)(v11 + 24));
  if (*((void *)v11 + 2)) {
    CFTypeRef v10 = CFRetain(*((CFTypeRef *)v9 + 2));
  }
  pthread_mutex_unlock((pthread_mutex_t *)(v9 + 24));
  if (v10)
  {
    dispatch_block_t block = _NSConcreteStackBlock;
    int v4 = -1073741824;
    int v5 = 0;
    id v6 = sub_100013A58;
    id v7 = &unk_100021080;
    CFTypeRef v8 = v10;
    dispatch_sync((dispatch_queue_t)qword_100024FF8, &block);
    if (v10) {
      CFRelease(v10);
    }
  }

void sub_100013A58(uint64_t a1)
{
  uint64_t v20 = a1;
  uint64_t v19 = a1;
  id v17 = 0LL;
  pthread_mutex_lock((pthread_mutex_t *)(*(void *)(a1 + 32) + 40LL));
  heim_ipc_event_cancel(*(void *)(*(void *)(a1 + 32) + 112LL));
  *(void *)(*(void *)(a1 + 32) + 120LL) = 0LL;
  pthread_mutex_unlock((pthread_mutex_t *)(*(void *)(a1 + 32) + 40LL));
  char v1 = (id)CFDictionaryGetValue( *(CFDictionaryRef *)(*(void *)(a1 + 32) + 24LL),  @"kHEIMAttrClientName");
  id v2 = v17;
  id v17 = v1;

  id location = sub_10000EABC();
  os_log_type_t v14 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEBUG))
  {
    sub_1000045F4((uint64_t)v25, (uint64_t)v17);
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)location, v14, "renew_func: %@", v25, 0xCu);
  }

  objc_storeStrong(&location, 0LL);
  unsigned int v18 = [(id)qword_100024F10 refreshForCred:*(void *)(a1 + 32) expireTime:&v16];
  if (v18 == -1765328360 || v18 == -1765328353)
  {
LABEL_10:
    id v13 = sub_10000EABC();
    os_log_type_t v12 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEBUG))
    {
      sub_1000045F4((uint64_t)v24, (uint64_t)v17);
      _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)v13,  v12,  "cache: %@ got auth failed, stop renewing",  v24,  0xCu);
    }

    objc_storeStrong(&v13, 0LL);
    pthread_mutex_lock((pthread_mutex_t *)(*(void *)(a1 + 32) + 40LL));
    *(_DWORD *)(*(void *)(a1 + 32) + 144LL) = 1;
    pthread_mutex_unlock((pthread_mutex_t *)(*(void *)(a1 + 32) + 40LL));
    goto LABEL_22;
  }

  if (v18 != -1765328352)
  {
    if (v18 != -1765328343)
    {
      if (v18 == -1765328243)
      {
        os_log_t v9 = (os_log_t)sub_10000EABC();
        os_log_type_t v8 = OS_LOG_TYPE_DEBUG;
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          sub_1000045F4((uint64_t)v22, (uint64_t)v17);
          _os_log_debug_impl((void *)&_mh_execute_header, v9, v8, "cache not found, stop renewing: %@", v22, 0xCu);
        }

        objc_storeStrong((id *)&v9, 0LL);
        pthread_mutex_lock((pthread_mutex_t *)(*(void *)(a1 + 32) + 40LL));
        *(_DWORD *)(*(void *)(a1 + 32) + 144LL) = 1;
        pthread_mutex_unlock((pthread_mutex_t *)(*(void *)(a1 + 32) + 40LL));
      }

      else if (v18)
      {
        sub_100013F7C(*(void *)(a1 + 32), 1);
        pthread_mutex_lock((pthread_mutex_t *)(*(void *)(a1 + 32) + 40LL));
        *(_DWORD *)(*(void *)(a1 + 32) + 144LL) = 2;
        pthread_mutex_unlock((pthread_mutex_t *)(*(void *)(a1 + 32) + 40LL));
      }

      else
      {
        os_log_t v7 = (os_log_t)sub_10000EABC();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        {
          id v5 = v17;
          int v4 = v16;
          int v3 = time(0LL);
          sub_100012604((uint64_t)v21, (uint64_t)v5, v4 - v3);
          _os_log_debug_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "cache: %@ got new tickets (expire in %d seconds)",  v21,  0x12u);
        }

        objc_storeStrong((id *)&v7, 0LL);
      }

      goto LABEL_22;
    }

    goto LABEL_10;
  }

  os_log_t oslog = (os_log_t)sub_10000EABC();
  os_log_type_t v10 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
  {
    sub_1000045F4((uint64_t)v23, (uint64_t)v17);
    _os_log_debug_impl((void *)&_mh_execute_header, oslog, v10, "The ticket has expired, stop renewing: %@", v23, 0xCu);
  }

  objc_storeStrong((id *)&oslog, 0LL);
  pthread_mutex_lock((pthread_mutex_t *)(*(void *)(a1 + 32) + 40LL));
  *(_DWORD *)(*(void *)(a1 + 32) + 144LL) = 1;
  pthread_mutex_unlock((pthread_mutex_t *)(*(void *)(a1 + 32) + 40LL));
LABEL_22:
  objc_storeStrong(&v17, 0LL);
}

uint64_t sub_100013F7C(uint64_t a1, char a2)
{
  uint64_t v14 = a1;
  char v13 = a2 & 1;
  uint64_t v12 = time(0LL) + qword_100024F08;
  if ((v13 & 1) != 0) {
    uint64_t v12 = time(0LL) + 300;
  }
  pthread_mutex_lock((pthread_mutex_t *)(v14 + 40));
  time_t v11 = *(void *)(v14 + 128);
  if (time(0LL) + 60 <= v11)
  {
    if (v12 > v11 - 60) {
      uint64_t v12 = v11 - 60;
    }
    os_log_t oslog = (os_log_t)sub_10000EABC();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      int v3 = time(0LL);
      sub_100012604((uint64_t)v16, v14, v12 - v3);
      _os_log_debug_impl( (void *)&_mh_execute_header,  oslog,  OS_LOG_TYPE_DEBUG,  "%@: will try to renew credentals in %d seconds",  v16,  0x12u);
    }

    objc_storeStrong((id *)&oslog, 0LL);
    heim_ipc_event_set_time(*(void *)(v14 + 112), v12);
    *(void *)(v14 + 104) = v12;
    return pthread_mutex_unlock((pthread_mutex_t *)(v14 + 40));
  }

  else
  {
    id v10 = sub_10000EABC();
    char v9 = 2;
    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEBUG))
    {
      log = (os_log_s *)v10;
      os_log_type_t type = v9;
      id v15 = (__CFString *)CFUUIDCreateString(0LL, *(CFUUIDRef *)(v14 + 16));
      id v6 = v15;
      os_log_type_t v8 = v6;
      sub_1000045F4((uint64_t)v17, (uint64_t)v8);
      _os_log_debug_impl((void *)&_mh_execute_header, log, type, "%@: will expire before next attempt", v17, 0xCu);

      objc_storeStrong((id *)&v8, 0LL);
    }

    objc_storeStrong(&v10, 0LL);
    return pthread_mutex_unlock((pthread_mutex_t *)(v14 + 40));
  }

void sub_100014228(uint64_t a1, char *a2)
{
  uint64_t v12 = a1;
  time_t v11 = a2;
  CFTypeID v2 = CFGetTypeID(a2);
  if (v2 != sub_1000101A4()) {
    heim_abort("context wrong type:CFGetTypeID(ptr) == HeimCredEventContextGetTypeID()");
  }
  sub_100014DC4();
  CFTypeRef v10 = 0LL;
  char v9 = v11;
  pthread_mutex_lock((pthread_mutex_t *)(v11 + 24));
  if (*((void *)v11 + 2)) {
    CFTypeRef v10 = CFRetain(*((CFTypeRef *)v9 + 2));
  }
  pthread_mutex_unlock((pthread_mutex_t *)(v9 + 24));
  if (v10)
  {
    dispatch_block_t block = _NSConcreteStackBlock;
    int v4 = -1073741824;
    int v5 = 0;
    id v6 = sub_10001436C;
    os_log_t v7 = &unk_100021080;
    CFTypeRef v8 = v10;
    dispatch_sync((dispatch_queue_t)qword_100024FF8, &block);
    if (v10) {
      CFRelease(v10);
    }
  }

void sub_10001436C(uint64_t a1)
{
  uint64_t v22 = a1;
  uint64_t v21 = a1;
  id v19 = 0LL;
  pthread_mutex_lock((pthread_mutex_t *)(*(void *)(a1 + 32) + 40LL));
  heim_ipc_event_cancel(*(void *)(*(void *)(a1 + 32) + 112LL));
  *(void *)(*(void *)(a1 + 32) + 120LL) = 0LL;
  if ((*(_BYTE *)(*(void *)(a1 + 32) + 152LL) & 1) != 0)
  {
    pthread_mutex_unlock((pthread_mutex_t *)(*(void *)(a1 + 32) + 40LL));
    CFTypeID v2 = (id)CFDictionaryGetValue( *(CFDictionaryRef *)(*(void *)(a1 + 32) + 24LL),  @"kHEIMAttrClientName");
    id v3 = v19;
    id v19 = v2;

    id location = sub_10000EABC();
    os_log_type_t v15 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEBUG))
    {
      sub_1000045F4((uint64_t)v26, (uint64_t)v19);
      _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)location, v15, "expire_func: %@", v26, 0xCu);
    }

    objc_storeStrong(&location, 0LL);
    unsigned int v20 = [(id)qword_100024F10 acquireForCred:*(void *)(a1 + 32) expireTime:&v18];
    if (v20 == -1765328360 || v20 == -1765328353 || v20 == -1765328343)
    {
      os_log_t oslog = (os_log_t)sub_10000EABC();
      os_log_type_t v13 = OS_LOG_TYPE_DEBUG;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
      {
        sub_1000045F4((uint64_t)v25, (uint64_t)v19);
        _os_log_debug_impl( (void *)&_mh_execute_header,  oslog,  v13,  "cache: %@ got bad password, stop renewing",  v25,  0xCu);
      }

      objc_storeStrong((id *)&oslog, 0LL);
      sub_100014864(*(void *)(a1 + 32), 1u);
    }

    else if (v20 == -1765328243)
    {
      os_log_t v12 = (os_log_t)sub_10000EABC();
      os_log_type_t v11 = OS_LOG_TYPE_DEBUG;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        sub_1000045F4((uint64_t)v24, (uint64_t)v19);
        _os_log_debug_impl((void *)&_mh_execute_header, v12, v11, "cache not found, stop renewing: %@", v24, 0xCu);
      }

      objc_storeStrong((id *)&v12, 0LL);
      sub_100014864(*(void *)(a1 + 32), 1u);
    }

    else if (v20)
    {
      pthread_mutex_lock((pthread_mutex_t *)(*(void *)(a1 + 32) + 40LL));
      uint64_t v6 = *(void *)(a1 + 32);
      time_t v5 = time(0LL);
      sub_100014AD8(v6, v5 + 300);
      pthread_mutex_unlock((pthread_mutex_t *)(*(void *)(a1 + 32) + 40LL));
      sub_100014864(*(void *)(a1 + 32), 2u);
    }

    else
    {
      os_log_t v10 = (os_log_t)sub_10000EABC();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        id v8 = v19;
        int v7 = v18;
        int v4 = time(0LL);
        sub_100012604((uint64_t)v23, (uint64_t)v8, v7 - v4);
        _os_log_debug_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "cache: %@ got new tickets (expire in %d seconds)",  v23,  0x12u);
      }

      objc_storeStrong((id *)&v10, 0LL);
      pthread_mutex_lock((pthread_mutex_t *)(*(void *)(a1 + 32) + 40LL));
      *(void *)(*(void *)(a1 + 32) + 128LL) = v18;
      pthread_mutex_unlock((pthread_mutex_t *)(*(void *)(a1 + 32) + 40LL));
      sub_100014864(*(void *)(a1 + 32), 3u);
    }

    off_100024F18(&stru_1000210C0);
    int v17 = 0;
  }

  else
  {
    uint64_t v1 = pthread_mutex_unlock((pthread_mutex_t *)(*(void *)(a1 + 32) + 40LL));
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 32LL) + 40LL)) {
      (*(void (**)(uint64_t))(*(void *)(*(void *)(a1 + 32) + 32LL) + 40LL))(v1);
    }
    int v17 = 1;
  }

  objc_storeStrong(&v19, 0LL);
}

uint64_t sub_100014864(uint64_t a1, unsigned int a2)
{
  uint64_t v10 = a1;
  unsigned int v9 = a2;
  id v8 = sub_10000EABC();
  char v7 = 2;
  if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEBUG))
  {
    log = (os_log_s *)v8;
    os_log_type_t type = v7;
    os_log_type_t v11 = (__CFString *)CFUUIDCreateString(0LL, *(CFUUIDRef *)(v10 + 16));
    time_t v5 = v11;
    uint64_t v6 = v5;
    sub_1000045F4((uint64_t)v12, (uint64_t)v6);
    _os_log_debug_impl((void *)&_mh_execute_header, log, type, "cred_update_acquire_status: %@", v12, 0xCu);

    objc_storeStrong((id *)&v6, 0LL);
  }

  objc_storeStrong(&v8, 0LL);
  pthread_mutex_lock((pthread_mutex_t *)(v10 + 40));
  *(_DWORD *)(v10 + 144) = v9;
  if (v9 <= 3uLL) {
    __asm { BR              X8 }
  }

  return pthread_mutex_unlock((pthread_mutex_t *)(v10 + 40));
}

void sub_100014AD8(uint64_t a1, time_t a2)
{
  uint64_t v18 = a1;
  time_t v17 = a2;
  if (!a2)
  {
    time_t v17 = time(0LL);
LABEL_7:
    *(void *)(v18 + 120) = v17;
    heim_ipc_event_set_time(*(void *)(v18 + 136), v17);
    os_log_t oslog = (os_log_t)sub_10000EABC();
    os_log_type_t v12 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      time_t v5 = oslog;
      os_log_type_t v6 = v12;
      id v19 = (__CFString *)CFUUIDCreateString(0LL, *(CFUUIDRef *)(v18 + 16));
      char v7 = v19;
      int v4 = v7;
      os_log_type_t v11 = v4;
      int v3 = v17;
      int v2 = time(0LL);
      sub_100012604((uint64_t)v21, (uint64_t)v4, v3 - v2);
      _os_log_debug_impl( (void *)&_mh_execute_header,  v5,  v6,  "%@: will try to acquire credentals in %d seconds",  v21,  0x12u);

      objc_storeStrong((id *)&v11, 0LL);
    }

    objc_storeStrong((id *)&oslog, 0LL);
    return;
  }

  if (v17 >= time(0LL)) {
    goto LABEL_7;
  }
  *(void *)(v18 + 120) = 0LL;
  id v16 = sub_10000EABC();
  char v15 = 2;
  if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_DEBUG))
  {
    log = (os_log_s *)v16;
    os_log_type_t type = v15;
    unsigned int v20 = (__CFString *)CFUUIDCreateString(0LL, *(CFUUIDRef *)(v18 + 16));
    uint64_t v10 = v20;
    uint64_t v14 = v10;
    sub_1000045F4((uint64_t)v22, (uint64_t)v14);
    _os_log_debug_impl((void *)&_mh_execute_header, log, type, "%@: acquire time is in the past", v22, 0xCu);

    objc_storeStrong((id *)&v14, 0LL);
  }

  objc_storeStrong(&v16, 0LL);
}

void sub_100014D70(id a1)
{
  byte_100024F6C = 1;
  ((void (*)(id))off_100024ED8)(a1);
}

  ;
}

void sub_100014DC4()
{
  predicate = (dispatch_once_t *)&unk_100025000;
  dispatch_block_t block = 0LL;
  objc_storeStrong(&block, &stru_1000210E0);
  if (*predicate != -1) {
    dispatch_once(predicate, block);
  }
  objc_storeStrong(&block, 0LL);
}

void sub_100014E34(id a1)
{
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.GSSCred.event_work", 0LL);
  int v2 = (void *)qword_100024FF8;
  qword_100024FF8 = (uint64_t)v1;
}

void sub_100015030(int *a1)
{
  oslog[2] = (os_log_t)a1;
  oslog[1] = (os_log_t)a1;
  oslog[0] = (os_log_t)sub_10000EABC();
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEBUG))
  {
    sub_10000E76C((uint64_t)v3, a1[8]);
    _os_log_debug_impl((void *)&_mh_execute_header, oslog[0], OS_LOG_TYPE_DEBUG, "connection interrupted: %u", v3, 8u);
  }

  objc_storeStrong((id *)oslog, 0LL);
}

void sub_100015110(int *a1)
{
  oslog[2] = (os_log_t)a1;
  oslog[1] = (os_log_t)a1;
  oslog[0] = (os_log_t)sub_10000EABC();
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEBUG))
  {
    sub_10000E76C((uint64_t)v3, a1[8]);
    _os_log_debug_impl((void *)&_mh_execute_header, oslog[0], OS_LOG_TYPE_DEBUG, "connection invalidated: %u", v3, 8u);
  }

  objc_storeStrong((id *)oslog, 0LL);
}

id sub_100015C60(id obj)
{
  id location = 0LL;
  objc_storeStrong(&location, obj);
  id v17 = 0LL;
  uint64_t v16 = 32LL;
  v15[1] = 40;
  id v7 = location;
  uint64_t v1 = objc_opt_class(&OBJC_CLASS___NSData);
  os_log_type_t v13 = (char *)[location length];
  uint64_t v12 = 16LL;
  if (SecRandomCopyBytes(kSecRandomDefault, 0x20uLL, bytes)) {
    abort();
  }
  if (SecRandomCopyBytes(kSecRandomDefault, 0x10uLL, v22)) {
    abort();
  }
  unsigned int v11 = 72;
  int v10 = sub_10001A75C(bytes, 32, 13, -1, v21, (int *)&v11, 0LL);
  if (v10)
  {
    os_log_t oslog = (os_log_t)sub_10000EABC();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      sub_10000E76C((uint64_t)v20, v10);
      _os_log_error_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_ERROR, "Error with wrap key: %d", v20, 8u);
    }

    objc_storeStrong((id *)&oslog, 0LL);
    if (!qword_100025008)
    {
      uint64_t v2 = os_transaction_create("com.apple.Heimdal.GSSCred.keyError");
      int v3 = (void *)qword_100025008;
      qword_100025008 = v2;
    }

    id v19 = 0LL;
  }

  else
  {
    if (qword_100025008) {
      objc_storeStrong((id *)&qword_100025008, 0LL);
    }
    v15[0] = v11;
    int v4 = -[NSMutableData initWithLength:]( objc_alloc(&OBJC_CLASS___NSMutableData),  "initWithLength:",  &v13[v11 + 20 + v12]);
    id v5 = v17;
    id v17 = v4;

    if (v17)
    {
      id v8 = (char *)[v17 mutableBytes];
      __memcpy_chk(v8, v15, 4LL);
      v8 += 4;
      __memcpy_chk(v8, v21, v15[0]);
      __memcpy_chk(&v8[v15[0]], v22, 16LL);
      [location bytes];
      int v14 = CCCryptorGCMOneshotEncrypt(0LL);
      memset_s(bytes, 0LL, 32, 0x20uLL);
      if (!v14 && v12 == 16) {
        id v19 = v17;
      }
      else {
        id v19 = 0LL;
      }
    }

    else
    {
      id v19 = 0LL;
    }
  }

  objc_storeStrong(&v17, 0LL);
  objc_storeStrong(&location, 0LL);
  return v19;
}

id sub_1000160E0(id obj)
{
  id location = 0LL;
  objc_storeStrong(&location, obj);
  int v22 = 32;
  int v21 = 22;
  id v19 = 0LL;
  uint64_t v18 = 0LL;
  id v17 = 0LL;
  id v16 = 0LL;
  id v15 = [location length];
  int v14 = (unsigned int *)[location bytes];
  unint64_t v12 = (unint64_t)v15;
  size_t __size = 16LL;
  if ((unint64_t)v15 >= 0x10)
  {
    v12 -= __size;
    if (v12 >= 4)
    {
      unsigned int v13 = *v14++;
      v12 -= 4LL;
      if (v12 >= v13)
      {
        int v9 = 32;
        int v21 = sub_10001A8C4(v14, v13, 13, -1, __s, &v9);
        if (v21)
        {
          os_log_t oslog = (os_log_t)sub_10000EABC();
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
          {
            sub_10000E76C((uint64_t)v25, v21);
            _os_log_error_impl( (void *)&_mh_execute_header,  oslog,  OS_LOG_TYPE_ERROR,  "Error with unwrap key: %d",  v25,  8u);
          }

          objc_storeStrong((id *)&oslog, 0LL);
        }

        else if (v9 == 32)
        {
          int v14 = (unsigned int *)((char *)v14 + v13);
          v12 -= v13;
          if (v12 >= 0x10)
          {
            uint64_t v18 = v14;
            v14 += 4;
            v12 -= 16LL;
            uint64_t v1 = +[NSMutableData dataWithLength:](&OBJC_CLASS___NSMutableData, "dataWithLength:", v12);
            id v2 = v16;
            id v16 = v1;

            if (v16)
            {
              id v19 = malloc(__size);
              if (v19)
              {
                os_log_type_t v6 = v18;
                id v7 = v14;
                unint64_t v5 = v12;
                id v3 = [v16 mutableBytes];
                if (!CCCryptorGCMOneshotDecrypt( 0LL,  __s,  32LL,  v6,  16LL,  0LL,  0LL,  v7,  v5,  v3,  (char *)v14 + v12,  __size)) {
                  objc_storeStrong(&v17, v16);
                }
              }
            }
          }

          else
          {
            int v21 = 22;
          }
        }

        else
        {
          int v21 = 22;
        }

        memset_s(__s, 0LL, 32, 0x20uLL);
        free(v19);
        id v24 = v17;
        int v10 = 1;
      }

      else
      {
        id v24 = 0LL;
        int v10 = 1;
      }
    }

    else
    {
      id v24 = 0LL;
      int v10 = 1;
    }
  }

  else
  {
    id v24 = 0LL;
    int v10 = 1;
  }

  objc_storeStrong(&v16, 0LL);
  objc_storeStrong(&v17, 0LL);
  objc_storeStrong(&location, 0LL);
  return v24;
}

void sub_1000164F8()
{
  CFMutableArrayRef Mutable = CFSetCreateMutable(0LL, 0LL, &kCFTypeSetCallBacks);
  CFMutableDictionaryRef theDict = sub_10000B2DC(@"kHEIMObjectKerberos");
  CFDictionarySetValue(theDict, @"kHEIMAttrTransient", @"b");
  CFDictionarySetValue(theDict, @"kHEIMAttrStatus", @"n");
  CFDictionarySetValue(theDict, @"kHEIMAttrAuthTime", @"t");
  CFDictionarySetValue(theDict, @"kHEIMAttrExpire", @"t");
  CFDictionarySetValue(theDict, @"kHEIMAttrRenewTill", @"t");
  CFDictionarySetValue(theDict, @"kHEIMAttrKerberosTicketGrantingTicket", @"b");
  CFSetAddValue(Mutable, theDict);
  if (theDict) {
    CFRelease(theDict);
  }
  sub_10000AFC4( @"kHEIMTypeKerberos",  Mutable,  (uint64_t)sub_10000B618,  0LL,  qword_100024F00,  (uint64_t)sub_10000BB10,  0,  0LL);
  if (Mutable) {
    CFRelease(Mutable);
  }
}

void sub_100016684()
{
  theSet = CFSetCreateMutable(0LL, 0LL, &kCFTypeSetCallBacks);
  CFMutableDictionaryRef theDict = sub_10000B2DC(@"kHEIMObjectKerberosAcquireCred");
  CFDictionarySetValue(theDict, @"kHEIMAttrStatus", @"n");
  CFDictionarySetValue(theDict, @"kHEIMAttrExpire", @"t");
  CFSetAddValue(theSet, theDict);
  if (theDict) {
    CFRelease(theDict);
  }
  sub_10000AFC4( @"kHEIMTypeKerberosAcquireCred",  theSet,  (uint64_t)sub_10000C9E4,  0LL,  0LL,  (uint64_t)sub_10000BB10,  1,  (uint64_t)&off_1000222E8);
  if (theSet) {
    CFRelease(theSet);
  }
}

void sub_100016C34(CFMutableDictionaryRef *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0LL;
  objc_storeStrong(location, a2);
  id v7 = 0LL;
  objc_storeStrong(&v7, a3);
  os_log_type_t v6 = +[HeimCredDecoder copyNS2CF:](&OBJC_CLASS___HeimCredDecoder, "copyNS2CF:", location[0]);
  BOOL value = +[HeimCredDecoder copyNS2CF:](&OBJC_CLASS___HeimCredDecoder, "copyNS2CF:", v7);
  if (v6 && value) {
    CFDictionarySetValue(a1[4], v6, value);
  }
  if (v6) {
    CFRelease(v6);
  }
  if (value) {
    CFRelease(value);
  }
  objc_storeStrong(&v7, 0LL);
  objc_storeStrong(location, 0LL);
}

void sub_100017178(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v7 = a1;
  uint64_t v6 = a2;
  v5[1] = a3;
  v5[0] = a3;
  id v4 = +[HeimCredDecoder copyCF2NS:](&OBJC_CLASS___HeimCredDecoder, "copyCF2NS:", v7);
  id location = +[HeimCredDecoder copyCF2NS:](&OBJC_CLASS___HeimCredDecoder, "copyCF2NS:", v6);
  if (v4 && location) {
    [v5[0] setObject:location forKey:v4];
  }
  objc_storeStrong(&location, 0LL);
  objc_storeStrong(&v4, 0LL);
  objc_storeStrong(v5, 0LL);
}

uint64_t sub_1000178D8(uint64_t result, uint64_t a2)
{
  *(_BYTE *)CFTypeID result = 2;
  *(_BYTE *)(result + 1) = 1;
  *(_BYTE *)(result + 2) = 66;
  *(_BYTE *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  return result;
}

void sub_1000179C8(id a1)
{
  id v15 = a1;
  id v14 = a1;
  unsigned int v13 = objc_alloc(&OBJC_CLASS___NSSet);
  uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSMutableArray);
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSArray);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSMutableString);
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSString);
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSNumber);
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSUUID);
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSMutableData);
  uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSData);
  uint64_t v1 = -[NSSet initWithObjects:]( v13,  "initWithObjects:",  v12,  v3,  v4,  v5,  v6,  v7,  v8,  v9,  v10,  v11,  objc_opt_class(&OBJC_CLASS___NSDate),  0LL);
  id v2 = (void *)qword_100025018;
  qword_100025018 = (uint64_t)v1;
}

id sub_100017B24()
{
  predicate = (dispatch_once_t *)&unk_100025020;
  dispatch_block_t block = 0LL;
  objc_storeStrong(&block, &stru_100021140);
  if (*predicate != -1) {
    dispatch_once(predicate, block);
  }
  objc_storeStrong(&block, 0LL);
  return (id)qword_100025028;
}

void sub_100017B9C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.Heimdal", "GSSCredHelper");
  id v2 = (void *)qword_100025028;
  qword_100025028 = (uint64_t)v1;
}

uint64_t sub_100018D2C(uint64_t result, int a2, int a3)
{
  *(_BYTE *)CFTypeID result = 0;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 0;
  *(_BYTE *)(result + 3) = 4;
  *(_DWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 8) = 0;
  *(_BYTE *)(result + 9) = 4;
  *(_DWORD *)(result + 10) = a3;
  return result;
}

LABEL_98:
  if (v112) {
    krb5_free_creds(context, v112);
  }
  if (opt) {
    krb5_get_init_creds_opt_free(context, opt);
  }
  if (cache) {
    krb5_cc_close(context, cache);
  }
  if (id) {
    krb5_cc_destroy(context, id);
  }
  krb5_free_cred_contents(context, (krb5_creds *)__b);
  krb5_free_context(context);
  v124[0] = @"status";
  unsigned int v13 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", inited);
  v125[0] = v13;
  v124[1] = @"expire";
  uint64_t v12 = +[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", v100);
  v125[1] = v12;
  uint64_t v37 =  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v125,  v124,  2LL);

  id v36 = (os_log_t)sub_100017B24();
  id v35 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
  {
    sub_1000045F4((uint64_t)v123, (uint64_t)v37);
    _os_log_debug_impl((void *)&_mh_execute_header, v36, v35, "do_Refresh results: %@", v123, 0xCu);
  }

  objc_storeStrong((id *)&v36, 0LL);
  xpc_object_t v34 = (xpc_object_t)_CFXPCCreateXPCObjectFromCFObject(v37);
  xpc_dictionary_set_value(xdict, "result", v34);
  objc_storeStrong(&v34, 0LL);
  objc_storeStrong((id *)&v37, 0LL);
  objc_storeStrong(&v91, 0LL);
  objc_storeStrong(&v92, 0LL);
  v93 = 0;
LABEL_109:
  objc_storeStrong(&v101, 0LL);
  objc_storeStrong(&v102, 0LL);
  objc_storeStrong(&v103, 0LL);
  objc_storeStrong(&xdict, 0LL);
  objc_storeStrong(&v118, 0LL);
  objc_storeStrong(location, 0LL);
}

uint64_t sub_10001A57C()
{
  if (qword_100025038 != -1) {
    dispatch_once(&qword_100025038, &stru_1000211C0);
  }
  dispatch_sync((dispatch_queue_t)qword_100025040, &stru_100021180);
  uint64_t result = dword_100025030;
  if (!dword_100025030)
  {
    syslog(3, "failed to open connection to %s\n", "AppleKeyStore");
    return dword_100025030;
  }

  return result;
}

void sub_10001A604(id a1)
{
  if (!dword_100025030) {
    dword_100025030 = sub_10001A668("IOService:/IOResources/AppleKeyStore", "AppleKeyStore");
  }
}

void sub_10001A640(id a1)
{
  qword_100025040 = (uint64_t)dispatch_queue_create("aks-client-queue", 0LL);
}

uint64_t sub_10001A668(char *path, const char *a2)
{
  kern_return_t v5;
  CFDictionaryRef v6;
  io_service_t MatchingService;
  io_object_t v8;
  uint64_t result;
  kern_return_t v10;
  io_connect_t connect;
  connect = 0;
  io_service_t v3 = IORegistryEntryFromPath(kIOMasterPortDefault, path);
  if (!v3 || (io_object_t v4 = v3, v5 = IOServiceOpen(v3, mach_task_self_, 0, &connect), IOObjectRelease(v4), v5))
  {
    uint64_t v6 = IOServiceMatching(a2);
    MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v6);
    if (MatchingService)
    {
      uint64_t v8 = MatchingService;
      IOServiceOpen(MatchingService, mach_task_self_, 0, &connect);
      IOObjectRelease(v8);
    }
  }

  uint64_t result = connect;
  if (connect)
  {
    uint64_t v10 = IOConnectCallMethod(connect, 0, 0LL, 0, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
    uint64_t result = connect;
    if (v10)
    {
      IOServiceClose(connect);
      return 0LL;
    }
  }

  return result;
}

uint64_t sub_10001A75C(const void *a1, int a2, int a3, int a4, void *a5, int *a6, _DWORD *a7)
{
  uint64_t v14 = 3758097084LL;
  mach_port_t v15 = sub_10001A57C();
  if (v15)
  {
    uint64_t v14 = 3758097090LL;
    if (a1 && a5 && a6)
    {
      input[0] = a4;
      input[1] = a3;
      uint64_t output = 0LL;
      uint32_t outputCnt = 1;
      size_t v18 = *a6;
      uint64_t v16 = IOConnectCallMethod(v15, 0xAu, input, 2u, a1, a2, &output, &outputCnt, a5, &v18);
      if ((_DWORD)v16)
      {
        return v16;
      }

      else
      {
        *a6 = v18;
        uint64_t v14 = 0LL;
        if (a7) {
          *a7 = output;
        }
      }
    }
  }

  else
  {
    fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_wrap_key",  ":",  848,  "",  0,  "",  "");
  }

  return v14;
}

uint64_t sub_10001A8C4(const void *a1, int a2, int a3, int a4, void *a5, int *a6)
{
  uint64_t v12 = 3758097084LL;
  mach_port_t v13 = sub_10001A57C();
  if (v13)
  {
    uint64_t v12 = 3758097090LL;
    if (a1)
    {
      if (a5)
      {
        if (a6)
        {
          input[0] = a4;
          input[1] = a3;
          size_t v15 = *a6;
          uint64_t v12 = IOConnectCallMethod(v13, 0xBu, input, 2u, a1, a2, 0LL, 0LL, a5, &v15);
          if (!(_DWORD)v12) {
            *a6 = v15;
          }
        }
      }
    }
  }

  else
  {
    fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_unwrap_key",  ":",  877,  "",  0,  "",  "");
  }

  return v12;
}

void heim_ipc_init_globals()
{
  if (qword_100025070 != -1) {
    dispatch_once(&qword_100025070, &stru_100021240);
  }
}

void heim_ipc_resume_events()
{
}

void _heim_ipc_suspend_timer()
{
  if (qword_100025050)
  {
    dispatch_suspend((dispatch_object_t)qword_100025050);
  }

  else
  {
    uint64_t v0 = heim_abort("suspend timer is NULL:timer!=NULL");
    _heim_ipc_restart_timer(v0);
  }

void _heim_ipc_restart_timer()
{
}

void sub_10001AA78(id a1)
{
  if (qword_100025050)
  {
    sub_10001AAB0();
    dispatch_resume((dispatch_object_t)qword_100025050);
  }

  else
  {
    heim_abort("restart timer is NULL:timer!=NULL");
    sub_10001AAB0();
  }

void sub_10001AAB0()
{
  uint64_t v0 = (dispatch_source_s *)qword_100025050;
  dispatch_time_t v1 = dispatch_time(0LL, 1000000000 * qword_100025068);
  dispatch_source_set_timer(v0, v1, 0xFFFFFFFFFFFFFFFFLL, 0xF4240uLL);
}

void sub_10001AB00(id a1)
{
  qword_100025058 = (uint64_t)dispatch_queue_create("hiem-sipc-timer-q", 0LL);
  dispatch_time_t v1 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)qword_100025058);
  qword_100025050 = (uint64_t)v1;
  if (v1)
  {
    dispatch_source_set_event_handler(v1, &stru_100021280);
    qword_100025060 = (uint64_t)dispatch_get_global_queue(0LL, 0LL);
    qword_100025048 = (uint64_t)dispatch_queue_create("heim-ipc.event-queue", 0LL);
    dispatch_suspend((dispatch_object_t)qword_100025048);
  }

  else
  {
    id v2 = (void *)heim_abort("init timer is NULL:timer!=NULL");
    sub_10001AB90(v2);
  }

void sub_10001AB90(id a1)
{
}

void sub_10001AB9C()
{
}

void *heap_new(unsigned int a1, uint64_t a2)
{
  if (!a1) {
    sub_10001B66C();
  }
  io_object_t v4 = malloc(0x18uLL);
  uint64_t v5 = v4;
  if (v4)
  {
    *io_object_t v4 = a2;
    *((_DWORD *)v4 + 2) = a1;
    *((_DWORD *)v4 + 3) = 0;
    uint64_t v6 = malloc(16LL * a1);
    id v5[2] = v6;
    if (v6)
    {
      bzero(v6, 16LL * a1);
    }

    else
    {
      free(v5);
      return 0LL;
    }
  }

  return v5;
}

uint64_t heap_insert(uint64_t a1, uint64_t a2, void *a3)
{
  if (!a2) {
    sub_10001B694();
  }
  unsigned int v6 = *(_DWORD *)(a1 + 12);
  if (v6 == *(_DWORD *)(a1 + 8))
  {
    int v7 = 2 * v6;
    uint64_t v8 = (char *)realloc(*(void **)(a1 + 16), 32LL * v6);
    if (!v8) {
      return 0xFFFFFFFFLL;
    }
    *(_DWORD *)(a1 + 8) = v7;
    *(void *)(a1 + 16) = v8;
    unsigned int v6 = *(_DWORD *)(a1 + 12);
  }

  else
  {
    uint64_t v8 = *(char **)(a1 + 16);
  }

  uint64_t v9 = &unk_100025078;
  if (a3) {
    uint64_t v9 = a3;
  }
  uint64_t v10 = &v8[16 * v6];
  *(void *)uint64_t v10 = a2;
  *((void *)v10 + 1) = v9;
  sub_10001ACC4(a1, v6);
  uint64_t result = 0LL;
  ++*(_DWORD *)(a1 + 12);
  return result;
}

uint64_t sub_10001ACC4(uint64_t result, unsigned int a2)
{
  unsigned int v2 = a2;
  uint64_t v3 = result;
  uint64_t v4 = *(void *)(result + 16);
  uint64_t v5 = (uint64_t *)(v4 + 16LL * a2);
  uint64_t v6 = *v5;
  uint64_t v7 = v5[1];
  if (a2)
  {
    do
    {
      uint64_t v8 = ((v2 + 1) >> 1) - 1;
      uint64_t result = (*(uint64_t (**)(void, uint64_t))v3)(*(void *)(v4 + 16 * v8), v6);
      uint64_t v4 = *(void *)(v3 + 16);
      *(_OWORD *)(v4 + 16LL * v2) = *(_OWORD *)(v4 + 16 * v8);
      uint64_t v4 = *(void *)(v3 + 16);
      **(_DWORD **)(v4 + 16LL * v2 + 8) = v2;
      unsigned int v2 = ((v2 + 1) >> 1) - 1;
    }

    while ((_DWORD)v8);
  }

  uint64_t v9 = (void *)(v4 + 16LL * v2);
  *uint64_t v9 = v6;
  v9[1] = v7;
  **(_DWORD **)(*(void *)(v3 + 16) + 16LL * v2 + 8) = v2;
  return result;
}

uint64_t heap_head(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 12)) {
    return **(void **)(a1 + 16);
  }
  else {
    return 0LL;
  }
}

uint64_t heap_remove_head(uint64_t a1)
{
  return sub_10001AD8C(a1, 0);
}

uint64_t sub_10001AD8C(uint64_t result, unsigned int a2)
{
  unsigned int v2 = *(_DWORD *)(result + 12);
  if (v2 <= a2) {
    sub_10001B6E4();
  }
  uint64_t v4 = result;
  unsigned int v5 = v2 - 1;
  *(_DWORD *)(result + 12) = v5;
  *(_OWORD *)(*(void *)(result + 16) + 16LL * a2) = *(_OWORD *)(*(void *)(result + 16) + 16LL * v5);
  uint64_t v6 = *(void *)(result + 16);
  uint64_t v7 = *(unsigned int *)(result + 12);
  uint64_t v8 = (void *)(v6 + 16 * v7);
  *uint64_t v8 = 0LL;
  v8[1] = 0LL;
  if ((_DWORD)v7 != a2)
  {
    uint64_t v9 = a2;
    uint64_t v10 = (uint64_t *)(v6 + 16LL * a2);
    uint64_t v11 = *v10;
    uint64_t v12 = v10[1];
    unsigned int v13 = a2;
    if (a2 < v7 >> 1)
    {
      while (1)
      {
        unsigned int v14 = (2 * v13) | 1;
        int v15 = (*(uint64_t (**)(uint64_t, void))v4)(v11, *(void *)(v6 + 16LL * ((2 * v13) | 1)));
        if (2 * v13 + 2 < *(_DWORD *)(v4 + 12))
        {
          int v16 = (*(uint64_t (**)(uint64_t, void))v4)( v11,  *(void *)(*(void *)(v4 + 16) + 16LL * (2 * v13 + 2)));
          if (v16 > v15)
          {
            int v15 = v16;
            unsigned int v14 = 2 * v13 + 2;
          }
        }

        uint64_t v6 = *(void *)(v4 + 16);
        if (v15 <= 0) {
          break;
        }
        *(_OWORD *)(v6 + 16LL * v13) = *(_OWORD *)(v6 + 16LL * v14);
        uint64_t v6 = *(void *)(v4 + 16);
        **(_DWORD **)(v6 + 16LL * v13 + 8) = v13;
        LODWORD(v7) = *(_DWORD *)(v4 + 12);
        unsigned int v13 = v14;
        if (v14 >= v7 >> 1)
        {
          uint64_t v9 = v14;
          unsigned int v13 = v14;
          goto LABEL_12;
        }
      }

      uint64_t v9 = v13;
    }

LABEL_12:
    id v17 = (void *)(v6 + 16 * v9);
    void *v17 = v11;
    v17[1] = v12;
    **(_DWORD **)(*(void *)(v4 + 16) + 16 * v9 + 8) = v13;
    return sub_10001ACC4(v4, a2);
  }

  return result;
}

uint64_t heap_remove(uint64_t a1, unsigned int a2)
{
  if (!*(_DWORD *)(a1 + 12)) {
    return 0xFFFFFFFFLL;
  }
  if (*(_UNKNOWN **)(*(void *)(a1 + 16) + 16LL * a2 + 8) == &unk_100025078) {
    sub_10001B70C();
  }
  sub_10001AD8C(a1, a2);
  return 0LL;
}

void *heim_ipc_event_create_f(uint64_t a1, uint64_t a2)
{
  if (qword_100025098 != -1) {
    dispatch_once(&qword_100025098, &stru_100021340);
  }
  uint64_t result = malloc(0x38uLL);
  if (result)
  {
    *(_DWORD *)uint64_t result = -1;
    result[1] = 0LL;
    *((_DWORD *)result + 4) = 0;
    result[3] = a1;
    result[5] = a2;
    result[6] = 0LL;
  }

  return result;
}

void *heim_ipc_event_cf_create_f(uint64_t a1, CFTypeRef cf)
{
  uint64_t result = heim_ipc_event_create_f(a1, (uint64_t)cf);
  *((_DWORD *)result + 4) |= 4u;
  return result;
}

uint64_t heim_ipc_event_set_time(uint64_t a1, uint64_t a2)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 0x40000000LL;
  v3[2] = sub_10001B04C;
  v3[3] = &unk_1000212A0;
  v3[4] = a1;
  v3[5] = a2;
  dispatch_sync((dispatch_queue_t)qword_100025080, v3);
  return 0LL;
}

void sub_10001B04C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if ((*(_BYTE *)(v1 + 16) & 2) != 0) {
    abort();
  }
  if (*(_DWORD *)v1 != -1) {
    heap_remove(qword_100025088, *(_DWORD *)v1);
  }
  time_t v3 = time(0LL);
  uint64_t v4 = *(void **)(a1 + 32);
  time_t v5 = *(void *)(a1 + 40);
  if (v5 <= v3) {
    time_t v5 = v3;
  }
  v4[6] = v5;
  heap_insert(qword_100025088, (uint64_t)v4, v4);
  sub_10001B0B4();
}

void sub_10001B0B4()
{
  uint64_t v0 = heap_head(qword_100025088);
  if (v0)
  {
    v3.tv_sec = *(void *)(v0 + 48);
    v3.tv_nsec = 0LL;
    uint64_t v1 = (dispatch_source_s *)qword_1000250A0;
    dispatch_time_t v2 = dispatch_walltime(&v3, 0LL);
    dispatch_source_set_timer(v1, v2, 0xFFFFFFFFFFFFFFFFLL, 0x2540BE400uLL);
  }

  else
  {
    dispatch_source_set_timer((dispatch_source_t)qword_1000250A0, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0LL);
  }

void heim_ipc_event_cancel(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000LL;
  block[2] = sub_10001B19C;
  block[3] = &unk_1000212C0;
  block[4] = a1;
  dispatch_sync((dispatch_queue_t)qword_100025080, block);
}

void sub_10001B19C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(_DWORD *)v1 != -1)
  {
    heap_remove(qword_100025088, *(_DWORD *)v1);
    uint64_t v1 = *(void *)(a1 + 32);
    *(_DWORD *)uint64_t v1 = -1;
  }

  *(void *)(v1 + 48) = 0LL;
  sub_10001B0B4();
}

void heim_ipc_event_free(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000LL;
  block[2] = sub_10001B240;
  block[3] = &unk_100021300;
  block[4] = a1;
  dispatch_async((dispatch_queue_t)qword_100025080, block);
}

void sub_10001B240(uint64_t a1)
{
  dispatch_time_t v2 = *(void **)(a1 + 32);
  int v3 = *((_DWORD *)v2 + 4);
  *((_DWORD *)v2 + 4) = v3 | 2;
  if (*(_DWORD *)v2 != -1) {
    abort();
  }
  int v4 = v3 & 1;
  if (*((void *)v2 + 4)) {
    BOOL v5 = 0;
  }
  else {
    BOOL v5 = v4 == 0;
  }
  if (v5)
  {
    if ((v3 & 4) != 0)
    {
      CFRelease(*((CFTypeRef *)v2 + 5));
      dispatch_time_t v2 = *(void **)(a1 + 32);
    }

    free(v2);
  }

  else
  {
    if ((v3 & 1) != 0)
    {
      *(void *)(*(void *)(a1 + 32) + 8LL) = dispatch_semaphore_create(0LL);
      dispatch_time_t v2 = *(void **)(a1 + 32);
    }

    v6[0] = _NSConcreteStackBlock;
    v6[1] = 0x40000000LL;
    v6[2] = sub_10001B318;
    v6[3] = &unk_1000212E0;
    int v7 = v4;
    v6[4] = v2;
    dispatch_async((dispatch_queue_t)qword_100025090, v6);
  }

void sub_10001B318(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 40))
  {
    dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 8LL), 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release(*(dispatch_object_t *)(*(void *)(a1 + 32) + 8LL));
  }

  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(void (**)(void))(v2 + 32);
  if (v3)
  {
    v3(*(void *)(v2 + 40));
    uint64_t v2 = *(void *)(a1 + 32);
  }

  if ((*(_BYTE *)(v2 + 16) & 4) != 0)
  {
    CFRelease(*(CFTypeRef *)(v2 + 40));
    uint64_t v2 = *(void *)(a1 + 32);
  }

  free((void *)v2);
}

uint64_t heim_ipc_event_set_final_f(uint64_t result, uint64_t a2)
{
  *(void *)(result + 32) = a2;
  return result;
}

void sub_10001B38C(id a1)
{
  qword_100025080 = (uint64_t)dispatch_queue_create("hiem-timer-q", 0LL);
  qword_100025090 = (uint64_t)dispatch_get_global_queue(0LL, 0LL);
  qword_100025088 = (uint64_t)heap_new(0xBu, (uint64_t)sub_10001B418);
  qword_1000250A0 = (uint64_t)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)qword_100025080);
  dispatch_source_set_event_handler((dispatch_source_t)qword_1000250A0, &stru_100021380);
  dispatch_resume((dispatch_object_t)qword_1000250A0);
}

uint64_t sub_10001B418(uint64_t a1, uint64_t a2)
{
  return (*(_DWORD *)(a1 + 48) - *(_DWORD *)(a2 + 48));
}

void sub_10001B428(id a1)
{
  time_t v1 = time(0LL);
  uint64_t v2 = heap_head(qword_100025088);
  if (v2)
  {
    int v3 = (_DWORD *)v2;
    do
    {
      if (*((void *)v3 + 6) >= v1) {
        break;
      }
      heap_remove_head(qword_100025088);
      *int v3 = -1;
      int v4 = v3[4];
      if ((v4 & 1) != 0)
      {
        *((void *)v3 + 6) = v1 + 10;
        heap_insert(qword_100025088, (uint64_t)v3, v3);
      }

      else
      {
        v3[4] = v4 | 1;
        _heim_ipc_suspend_timer();
        block[0] = _NSConcreteStackBlock;
        block[1] = 0x40000000LL;
        block[2] = sub_10001B530;
        block[3] = &unk_1000213C0;
        block[4] = v3;
        dispatch_async((dispatch_queue_t)qword_100025090, block);
      }

      int v3 = (_DWORD *)heap_head(qword_100025088);
    }

    while (v3);
  }

  sub_10001B0B4();
}

void sub_10001B530(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000LL;
  block[2] = sub_10001B5A8;
  block[3] = &unk_1000213A0;
  block[4] = *(void *)(a1 + 32);
  dispatch_async((dispatch_queue_t)qword_100025080, block);
}

void sub_10001B5A8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  *(_DWORD *)(v1 + 16) &= ~1u;
  uint64_t v2 = *(dispatch_semaphore_s **)(v1 + 8);
  if (v2) {
    dispatch_semaphore_signal(v2);
  }
  _heim_ipc_restart_timer();
}

char *rk_cfstring2cstring(const __CFString *a1)
{
  CStringPtr = CFStringGetCStringPtr(a1, 0x8000100u);
  if (CStringPtr) {
    return strdup(CStringPtr);
  }
  CFIndex Length = CFStringGetLength(a1);
  CFIndex v5 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
  uint64_t v6 = malloc(v5);
  if (v6)
  {
    if (!CFStringGetCString(a1, (char *)v6, v5, 0x8000100u))
    {
      free(v6);
      return 0LL;
    }
  }

  return (char *)v6;
}

void sub_10001B66C()
{
  __assert_rtn("heap_new", "heap.c", 65, "sz != 0");
}

void sub_10001B694()
{
  __assert_rtn("heap_insert", "heap.c", 178, "data != NULL");
}

void sub_10001B6BC()
{
}

void sub_10001B6E4()
{
}

void sub_10001B70C()
{
  __assert_rtn("heap_remove", "heap.c", 253, "h->data[ptr].ptr != &dummy");
}