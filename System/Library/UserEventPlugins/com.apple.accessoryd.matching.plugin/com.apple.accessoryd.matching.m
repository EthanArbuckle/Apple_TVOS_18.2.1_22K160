id acc_userDefaults_BOOLForKey(uint64_t a1)
{
  void *v2;
  id v3;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[ACCUserDefaults sharedDefaults](&OBJC_CLASS___ACCUserDefaults, "sharedDefaults"));
  v3 = [v2 BOOLForKey:a1];

  return v3;
}

uint64_t acc_userDefaults_copyStringForKey(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[ACCUserDefaults sharedDefaults](&OBJC_CLASS___ACCUserDefaults, "sharedDefaults"));
  uint64_t v3 = objc_claimAutoreleasedReturnValue([v2 stringForKey:a1]);

  return v3;
}

uint64_t acc_userDefaults_copyArrayForKey(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[ACCUserDefaults sharedDefaults](&OBJC_CLASS___ACCUserDefaults, "sharedDefaults"));
  uint64_t v3 = objc_claimAutoreleasedReturnValue([v2 arrayForKey:a1]);

  return v3;
}

uint64_t acc_userDefaults_copyDictionaryForKey(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[ACCUserDefaults sharedDefaults](&OBJC_CLASS___ACCUserDefaults, "sharedDefaults"));
  uint64_t v3 = objc_claimAutoreleasedReturnValue([v2 dictionaryForKey:a1]);

  return v3;
}

id acc_userDefaults_copyIntegerForKey(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[ACCUserDefaults sharedDefaults](&OBJC_CLASS___ACCUserDefaults, "sharedDefaults"));
  id v3 = [v2 integerForKey:a1];

  return v3;
}

double acc_userDefaults_copyDoubleForKey(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[ACCUserDefaults sharedDefaults](&OBJC_CLASS___ACCUserDefaults, "sharedDefaults"));
  [v2 doubleForKey:a1];
  double v4 = v3;

  return v4;
}

void acc_userDefaults_setArrayForKey(uint64_t a1, uint64_t a2)
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[ACCUserDefaults sharedDefaults](&OBJC_CLASS___ACCUserDefaults, "sharedDefaults"));
  [v4 setObject:a2 forKey:a1];
}

void acc_userDefaults_setIntegerForKey(uint64_t a1, uint64_t a2)
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[ACCUserDefaults sharedDefaults](&OBJC_CLASS___ACCUserDefaults, "sharedDefaults"));
  [v4 setInteger:a2 forKey:a1];
}

void acc_userDefaults_setDoubleForKey(uint64_t a1, double a2)
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[ACCUserDefaults sharedDefaults](&OBJC_CLASS___ACCUserDefaults, "sharedDefaults"));
  [v4 setDouble:a1 forKey:a2];
}

id acc_userDefaultsIapd_BOOLForKey(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[ACCUserDefaults sharedDefaultsIapd](&OBJC_CLASS___ACCUserDefaults, "sharedDefaultsIapd"));
  id v3 = [v2 BOOLForKey:a1];

  return v3;
}

uint64_t acc_userDefaultsIapd_copyStringForKey(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[ACCUserDefaults sharedDefaultsIapd](&OBJC_CLASS___ACCUserDefaults, "sharedDefaultsIapd"));
  uint64_t v3 = objc_claimAutoreleasedReturnValue([v2 stringForKey:a1]);

  return v3;
}

uint64_t acc_userDefaultsIapd_copyArrayForKey(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[ACCUserDefaults sharedDefaultsIapd](&OBJC_CLASS___ACCUserDefaults, "sharedDefaultsIapd"));
  uint64_t v3 = objc_claimAutoreleasedReturnValue([v2 arrayForKey:a1]);

  return v3;
}

uint64_t acc_userDefaultsIapd_copyDictionaryForKey(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[ACCUserDefaults sharedDefaultsIapd](&OBJC_CLASS___ACCUserDefaults, "sharedDefaultsIapd"));
  uint64_t v3 = objc_claimAutoreleasedReturnValue([v2 dictionaryForKey:a1]);

  return v3;
}

id acc_userDefaultsIapd_copyIntegerForKey(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[ACCUserDefaults sharedDefaultsIapd](&OBJC_CLASS___ACCUserDefaults, "sharedDefaultsIapd"));
  id v3 = [v2 integerForKey:a1];

  return v3;
}

double acc_userDefaultsIapd_copyDoubleForKey(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[ACCUserDefaults sharedDefaultsIapd](&OBJC_CLASS___ACCUserDefaults, "sharedDefaultsIapd"));
  [v2 doubleForKey:a1];
  double v4 = v3;

  return v4;
}

id acc_userDefaultsLogging_BOOLForKey(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[ACCUserDefaults sharedDefaultsLogging](&OBJC_CLASS___ACCUserDefaults, "sharedDefaultsLogging"));
  id v3 = [v2 BOOLForKey:a1];

  return v3;
}

id acc_userNotifications_generateIdentifier(uint64_t a1, uint64_t a2)
{
  v2 = 0LL;
  if (a1 && a2) {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@_%@", a1, a2));
  }
  return v2;
}

ACCUserNotification *acc_userNotifications_accessoryNotSupported()
{
  v0 = objc_alloc_init(&OBJC_CLASS___ACCUserNotification);
  -[ACCUserNotification setType:](v0, "setType:", 2LL);
  id v1 = acc_strings_bundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  id v3 = (void *)objc_claimAutoreleasedReturnValue( [v2 localizedStringForKey:@"Accessory Not Supported" value:&stru_159E8 table:0]);
  -[ACCUserNotification setTitle:](v0, "setTitle:", v3);

  id v4 = acc_strings_bundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue( [v5 localizedStringForKey:@"This accessory is not supported by this device." value:&stru_159E8 table:0]);
  -[ACCUserNotification setMessage:](v0, "setMessage:", v6);

  -[ACCUserNotification setIsModal:](v0, "setIsModal:", 0LL);
  -[ACCUserNotification setPresentViaSystemAperture:](v0, "setPresentViaSystemAperture:", 1LL);
  return v0;
}

ACCUserNotification *acc_userNotifications_chargingNotSupported()
{
  v0 = objc_alloc_init(&OBJC_CLASS___ACCUserNotification);
  -[ACCUserNotification setType:](v0, "setType:", 2LL);
  id v1 = acc_strings_bundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  id v3 = (void *)objc_claimAutoreleasedReturnValue( [v2 localizedStringForKey:@"Charging Not Supported" value:&stru_159E8 table:0]);
  -[ACCUserNotification setTitle:](v0, "setTitle:", v3);

  id v4 = acc_strings_bundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue( [v5 localizedStringForKey:@"Charging with this accessory is not supported by Apple Device." value:&stru_159E8 table:0]);
  -[ACCUserNotification setMessage:](v0, "setMessage:", v6);

  id v7 = acc_strings_bundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 localizedStringForKey:@"Dismiss" value:&stru_159E8 table:0]);
  -[ACCUserNotification setDefaultButtonName:](v0, "setDefaultButtonName:", v9);

  -[ACCUserNotification setIsModal:](v0, "setIsModal:", 0LL);
  return v0;
}

ACCUserNotification *acc_userNotifications_unlockToUseAccessories()
{
  v0 = objc_alloc_init(&OBJC_CLASS___ACCUserNotification);
  -[ACCUserNotification setType:](v0, "setType:", 2LL);
  id v1 = acc_strings_bundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 localizedStringForKey:@"Accessory Connected" value:&stru_159E8 table:0]);
  -[ACCUserNotification setTitle:](v0, "setTitle:", v3);

  id v4 = acc_strings_bundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue( [v5 localizedStringForKey:@"Unlock %@ to use accessories" value:&stru_159E8 table:0]);
  id v7 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v6, systemInfo_copyDeviceClass());
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  -[ACCUserNotification setMessage:](v0, "setMessage:", v8);

  -[ACCUserNotification setIsModal:](v0, "setIsModal:", 0LL);
  -[ACCUserNotification setDismissOnUnlock:](v0, "setDismissOnUnlock:", 1LL);
  -[ACCUserNotification setIgnoreQuietMode:](v0, "setIgnoreQuietMode:", 1LL);
  return v0;
}

ACCUserNotification *acc_userNotifications_disabledHSAID()
{
  v0 = objc_alloc_init(&OBJC_CLASS___ACCUserNotification);
  -[ACCUserNotification setType:](v0, "setType:", 1LL);
  id v1 = acc_strings_bundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  id v3 = (void *)objc_claimAutoreleasedReturnValue( [v2 localizedStringForKey:@"Serial Boot-Arg Detected" value:&stru_159E8 table:0]);
  -[ACCUserNotification setTitle:](v0, "setTitle:", v3);

  id v4 = acc_strings_bundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v5,  "localizedStringForKey:value:table:",  @"There are known compatibility issues with the 'serial' boot-arg and Smart Connector accessories, even for those not using HSAID. Please disable the 'serial' boot-arg when using Smart Connector accessories.",  &stru_159E8,  0));
  -[ACCUserNotification setMessage:](v0, "setMessage:", v6);

  -[ACCUserNotification setIsModal:](v0, "setIsModal:", 0LL);
  return v0;
}

CFStringRef CFCreateUUIDString()
{
  v0 = CFUUIDCreate(kCFAllocatorDefault);
  CFStringRef v1 = CFUUIDCreateString(kCFAllocatorDefault, v0);
  if (v0) {
    CFRelease(v0);
  }
  return v1;
}

CFStringRef CFArrayCreateRawValuesString(const __CFArray *a1, int a2)
{
  CFMutableStringRef Mutable = CFStringCreateMutable(kCFAllocatorDefault, 0LL);
  CFStringAppend(Mutable, @"{\n");
  v5.length = CFArrayGetCount(a1);
  if (a2) {
    v6 = (void (__cdecl *)(const void *, void *))_CFArraySetPrintRawValuesApplierFunctionHex;
  }
  else {
    v6 = (void (__cdecl *)(const void *, void *))_CFArraySetPrintRawValuesApplierFunctionDecimal;
  }
  v5.location = 0LL;
  CFArrayApplyFunction(a1, v5, v6, Mutable);
  CFStringAppend(Mutable, @"}");
  CFStringRef Copy = CFStringCreateCopy(kCFAllocatorDefault, Mutable);
  if (Mutable) {
    CFRelease(Mutable);
  }
  return Copy;
}

void _CFArraySetPrintRawValuesApplierFunctionHex(uint64_t a1, CFMutableStringRef theString)
{
}

void _CFArraySetPrintRawValuesApplierFunctionDecimal(uint64_t a1, CFMutableStringRef theString)
{
}

CFStringRef CFSetCreateRawValuesString(const __CFSet *a1, int a2)
{
  CFMutableStringRef Mutable = CFStringCreateMutable(kCFAllocatorDefault, 0LL);
  CFStringAppend(Mutable, @"{\n");
  if (a2) {
    CFRange v5 = (void (__cdecl *)(const void *, void *))_CFArraySetPrintRawValuesApplierFunctionHex;
  }
  else {
    CFRange v5 = (void (__cdecl *)(const void *, void *))_CFArraySetPrintRawValuesApplierFunctionDecimal;
  }
  CFSetApplyFunction(a1, v5, Mutable);
  CFStringAppend(Mutable, @"}");
  CFStringRef Copy = CFStringCreateCopy(kCFAllocatorDefault, Mutable);
  if (Mutable) {
    CFRelease(Mutable);
  }
  return Copy;
}

CFStringRef CFDictCreateRawKeyValueString(const __CFDictionary *a1, int a2)
{
  CFMutableStringRef Mutable = CFStringCreateMutable(kCFAllocatorDefault, 0LL);
  CFStringAppend(Mutable, @"{\n");
  if (a2) {
    CFRange v5 = (void (__cdecl *)(const void *, const void *, void *))_CFDictPrintRawKeyValueApplierFunctionHex;
  }
  else {
    CFRange v5 = (void (__cdecl *)(const void *, const void *, void *))_CFDictPrintRawKeyValueApplierFunctionDecimal;
  }
  CFDictionaryApplyFunction(a1, v5, Mutable);
  CFStringAppend(Mutable, @"}");
  CFStringRef Copy = CFStringCreateCopy(kCFAllocatorDefault, Mutable);
  if (Mutable) {
    CFRelease(Mutable);
  }
  return Copy;
}

void _CFDictPrintRawKeyValueApplierFunctionHex(uint64_t a1, uint64_t a2, CFMutableStringRef theString)
{
  CFStringAppendFormat(theString, 0LL, @"\t%p = %p;\n", a1, a2);
}

void _CFDictPrintRawKeyValueApplierFunctionDecimal(uint64_t a1, uint64_t a2, CFMutableStringRef theString)
{
  CFStringAppendFormat(theString, 0LL, @"\t%lu = %lu;\n", a1, a2);
}

__CFString *CFStringCreateFromCFData(const __CFData *a1, const __CFString *a2)
{
  if (!a1) {
    return &stru_159E8;
  }
  BytePtr = CFDataGetBytePtr(a1);
  CFIndex Length = CFDataGetLength(a1);
  CFMutableStringRef Mutable = CFStringCreateMutable(kCFAllocatorDefault, 0LL);
  if (Length >= 1)
  {
    do
    {
      unsigned int v7 = *BytePtr++;
      CFStringAppendFormat(Mutable, 0LL, a2, v7);
      --Length;
    }

    while (Length);
  }

  CFStringRef Copy = CFStringCreateCopy(kCFAllocatorDefault, Mutable);
  if (Mutable) {
    CFRelease(Mutable);
  }
  return (__CFString *)Copy;
}

CFStringRef CFStringCreateFromFormat(uint64_t a1, const __CFString *a2)
{
  CFMutableStringRef Mutable = CFStringCreateMutable(kCFAllocatorDefault, 0LL);
  CFStringAppendFormat(Mutable, 0LL, a2, a1);
  CFStringRef Copy = CFStringCreateCopy(kCFAllocatorDefault, Mutable);
  if (Mutable) {
    CFRelease(Mutable);
  }
  return Copy;
}

CFSetRef CFDictionaryGetKeys(const __CFDictionary *a1, int a2)
{
  if (!a1) {
    return 0LL;
  }
  id v3 = a2 ? &kCFTypeSetCallBacks : 0LL;
  CFMutableSetRef Mutable = CFSetCreateMutable(kCFAllocatorDefault, 0LL, v3);
  if (!Mutable) {
    return 0LL;
  }
  CFRange v5 = Mutable;
  CFDictionaryApplyFunction(a1, (CFDictionaryApplierFunction)CFDictionaryApplierFunction_addKeyToMutableSet, Mutable);
  CFSetRef Copy = CFSetCreateCopy(kCFAllocatorDefault, v5);
  CFRelease(v5);
  return Copy;
}

void CFDictionaryApplierFunction_addKeyToMutableSet(void *value, int a2, CFMutableSetRef theSet)
{
  if (value)
  {
    if (theSet) {
      CFSetAddValue(theSet, value);
    }
  }
}

char *createCStringFromCFString(const __CFString *a1, CFStringEncoding a2)
{
  CFIndex usedBufLen = 0LL;
  if (!a1) {
    return 0LL;
  }
  v10.length = CFStringGetLength(a1);
  v10.location = 0LL;
  CFStringGetBytes(a1, v10, 0x8000100u, 0, 0, 0LL, 0LL, &usedBufLen);
  CFIndex v4 = usedBufLen + 1;
  CFIndex usedBufLen = v4;
  CFRange v5 = (char *)malloc(v4);
  int CString = CFStringGetCString(a1, v5, v4, a2);
  if (v5) {
    BOOL v7 = CString == 0;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7)
  {
    free(v5);
    return 0LL;
  }

  return v5;
}

void CFDictionaryApplierFunction_addValueToMutableDictionary( void *key, void *value, CFMutableDictionaryRef theDict)
{
  if (key)
  {
    if (theDict) {
      CFDictionaryAddValue(theDict, key, value);
    }
  }

void CFDictionaryApplierFunction_setValueInMutableDictionary( void *key, void *value, CFMutableDictionaryRef theDict)
{
  if (key)
  {
    if (theDict) {
      CFDictionarySetValue(theDict, key, value);
    }
  }

void CFSetApplierFunction_removeValueFromMutableDictionary(void *key, CFMutableDictionaryRef theDict)
{
}

void executeOnMainThreadSync(uint64_t a1)
{
  if (pthread_main_np())
  {
    (*(void (**)(uint64_t))(a1 + 16))(a1);
  }

  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 0x40000000LL;
    block[2] = __executeOnMainThreadSync_block_invoke;
    block[3] = &unk_14B58;
    block[4] = a1;
    dispatch_sync(&_dispatch_main_q, block);
  }

uint64_t __executeOnMainThreadSync_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void executeOnMainThreadAsync(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000LL;
  block[2] = __executeOnMainThreadAsync_block_invoke;
  block[3] = &unk_14B80;
  block[4] = a1;
  dispatch_async(&_dispatch_main_q, block);
}

uint64_t __executeOnMainThreadAsync_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void OUTLINED_FUNCTION_0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

void OUTLINED_FUNCTION_3( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void OUTLINED_FUNCTION_4( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

void init_logging_modules(uint64_t a1, char a2, uint64_t a3)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000LL;
  block[2] = __init_logging_modules_block_invoke;
  block[3] = &__block_descriptor_tmp_0;
  char v4 = a2;
  block[4] = a3;
  void block[5] = a1;
  if (init_logging_modules_onceToken != -1) {
    dispatch_once(&init_logging_modules_onceToken, block);
  }
}

void __init_logging_modules_block_invoke(uint64_t a1)
{
  v2 = "ed";
  if (*(_BYTE *)(a1 + 48))
  {
    uint64_t v3 = 0LL;
    unint64_t v4 = 0LL;
    int v5 = 0;
    do
    {
      uint64_t v6 = *(void *)(a1 + 32);
      BOOL v7 = *(const char **)(v6 + v3);
      if (!v7)
      {
        BOOL v7 = "<Undefined>";
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v12) = v4;
          _os_log_error_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Subsystem missing for logging module %d!\n(Check LoggingModuleEntry_t table)",  buf,  8u);
          uint64_t v6 = *(void *)(a1 + 32);
          BOOL v7 = "<Undefined>";
        }
      }

      v8 = *(const char **)(v6 + v3 + 8);
      if (!v8)
      {
        v8 = "<Undefined>";
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          __init_logging_modules_block_invoke_cold_1(v15, v4, &v16);
          v8 = "<Undefined>";
        }
      }

      os_log_t v9 = os_log_create(v7, v8);
      *(void *)(*(void *)(a1 + 40) + 8 * v4) = v9;
      if (v9)
      {
        ++v5;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          v12 = v7;
          __int16 v13 = 2080;
          v14 = v8;
          _os_log_debug_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "Created log object %s: %s",  buf,  0x16u);
        }
      }

      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v12 = v7;
        __int16 v13 = 2080;
        v14 = v8;
        _os_log_error_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Failed to create os_log_t object %s: %s!",  buf,  0x16u);
      }

      ++v4;
      unint64_t v10 = *(unsigned __int8 *)(a1 + 48);
      v3 += 16LL;
    }

    while (v4 < v10);
    v2 = "AuthorizationRequired" + 19;
  }

  else
  {
    LODWORD(v10) = 0;
    int v5 = 0;
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = *((void *)v2 + 279);
    LODWORD(v12) = v5;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Created %d log object(s)!", buf, 8u);
    LODWORD(v10) = *(unsigned __int8 *)(a1 + 48);
  }

  gLogObjects = *(void *)(a1 + 40);
  gNumLogObjects = v10;
}

CFNumberRef acc_analytics_createBucketizedAnalyticEventDuration(unint64_t a1)
{
  if ((uint64_t)a1 > 299)
  {
    if (a1 > 0x258)
    {
      if (a1 > 0x708)
      {
        if (a1 > 0xE10)
        {
          if (a1 > 0x3840)
          {
            if (a1 > 0xA8C0)
            {
              if (a1 > 0x15180)
              {
                if (a1 > 0x3F480)
                {
                  if (a1 > 0x93A80) {
                    char v1 = 10;
                  }
                  else {
                    char v1 = 9;
                  }
                }

                else
                {
                  char v1 = 8;
                }
              }

              else
              {
                char v1 = 7;
              }
            }

            else
            {
              char v1 = 6;
            }
          }

          else
          {
            char v1 = 5;
          }
        }

        else
        {
          char v1 = 4;
        }
      }

      else
      {
        char v1 = 3;
      }
    }

    else
    {
      char v1 = 2;
    }
  }

  else
  {
    char v1 = 1;
  }

  char valuePtr = v1;
  return CFNumberCreate(kCFAllocatorDefault, kCFNumberCharType, &valuePtr);
}

CFNumberRef acc_analytics_createBucketizedUnlockDialogAnalyticEventTime(unint64_t a1)
{
  if ((uint64_t)a1 > 3599)
  {
    if (a1 > 0x1518)
    {
      if (a1 > 0x1C20)
      {
        if (a1 > 0x2A30)
        {
          if (a1 > 0x3840)
          {
            if (a1 > 0x7080)
            {
              if (a1 > 0xA8C0)
              {
                if (a1 > 0x15180)
                {
                  if (a1 > 0x3F480) {
                    char v1 = 10;
                  }
                  else {
                    char v1 = 9;
                  }
                }

                else
                {
                  char v1 = 8;
                }
              }

              else
              {
                char v1 = 7;
              }
            }

            else
            {
              char v1 = 6;
            }
          }

          else
          {
            char v1 = 5;
          }
        }

        else
        {
          char v1 = 4;
        }
      }

      else
      {
        char v1 = 3;
      }
    }

    else
    {
      char v1 = 2;
    }
  }

  else
  {
    char v1 = 1;
  }

  char valuePtr = v1;
  return CFNumberCreate(kCFAllocatorDefault, kCFNumberCharType, &valuePtr);
}

CFNumberRef acc_analytics_createBucketizedWiredAuthDuration(unint64_t a1)
{
  if (a1 > 0x1F3)
  {
    if (a1 > 0x3E8)
    {
      if (a1 > 0x5DC)
      {
        if (a1 > 0x7D0)
        {
          if (a1 > 0x1388)
          {
            if (a1 > 0x2710)
            {
              if (a1 > 0x3A98)
              {
                if (a1 > 0x4E20)
                {
                  if (a1 > 0x7530) {
                    char v1 = 10;
                  }
                  else {
                    char v1 = 9;
                  }
                }

                else
                {
                  char v1 = 8;
                }
              }

              else
              {
                char v1 = 7;
              }
            }

            else
            {
              char v1 = 6;
            }
          }

          else
          {
            char v1 = 5;
          }
        }

        else
        {
          char v1 = 4;
        }
      }

      else
      {
        char v1 = 3;
      }
    }

    else
    {
      char v1 = 2;
    }
  }

  else
  {
    char v1 = 1;
  }

  char valuePtr = v1;
  return CFNumberCreate(kCFAllocatorDefault, kCFNumberCharType, &valuePtr);
}

CFNumberRef acc_analytics_createBucketizedInductiveAuthDuration(unint64_t a1)
{
  if (a1 > 0xE)
  {
    if (a1 > 0x1E)
    {
      if (a1 > 0x2D)
      {
        if (a1 > 0x3C)
        {
          if (a1 > 0x5A)
          {
            if (a1 > 0x78)
            {
              if (a1 > 0x96)
              {
                if (a1 > 0xB4)
                {
                  if (a1 > 0xFA) {
                    char v1 = 10;
                  }
                  else {
                    char v1 = 9;
                  }
                }

                else
                {
                  char v1 = 8;
                }
              }

              else
              {
                char v1 = 7;
              }
            }

            else
            {
              char v1 = 6;
            }
          }

          else
          {
            char v1 = 5;
          }
        }

        else
        {
          char v1 = 4;
        }
      }

      else
      {
        char v1 = 3;
      }
    }

    else
    {
      char v1 = 2;
    }
  }

  else
  {
    char v1 = 1;
  }

  char valuePtr = v1;
  return CFNumberCreate(kCFAllocatorDefault, kCFNumberCharType, &valuePtr);
}

CFNumberRef acc_analytics_createBucketizedBatteryChargeLevel(unsigned int a1)
{
  if ((int)a1 > 9)
  {
    if (a1 > 0x14)
    {
      if (a1 > 0x1E)
      {
        if (a1 > 0x28)
        {
          if (a1 > 0x32)
          {
            if (a1 > 0x3C)
            {
              if (a1 > 0x46)
              {
                if (a1 > 0x50)
                {
                  if (a1 > 0x5A) {
                    char v1 = 10;
                  }
                  else {
                    char v1 = 9;
                  }
                }

                else
                {
                  char v1 = 8;
                }
              }

              else
              {
                char v1 = 7;
              }
            }

            else
            {
              char v1 = 6;
            }
          }

          else
          {
            char v1 = 5;
          }
        }

        else
        {
          char v1 = 4;
        }
      }

      else
      {
        char v1 = 3;
      }
    }

    else
    {
      char v1 = 2;
    }
  }

  else
  {
    char v1 = 1;
  }

  char valuePtr = v1;
  return CFNumberCreate(kCFAllocatorDefault, kCFNumberCharType, &valuePtr);
}

CFNumberRef acc_analytics_createBucketizedBatteryChargeDelta(int a1)
{
  if (a1 > -90)
  {
    if (a1 > -80)
    {
      if (a1 > -70)
      {
        if (a1 > -60)
        {
          if (a1 > -50)
          {
            if (a1 > -40)
            {
              if (a1 > -30)
              {
                if (a1 > -20)
                {
                  if (a1 > -10)
                  {
                    if (a1 <= 0)
                    {
                      char v1 = 10;
                    }

                    else if (a1 > 0xA)
                    {
                      if (a1 > 0x14)
                      {
                        if (a1 > 0x1E)
                        {
                          if (a1 > 0x28)
                          {
                            if (a1 > 0x32)
                            {
                              if (a1 > 0x3C)
                              {
                                if (a1 > 0x46)
                                {
                                  if (a1 > 0x50)
                                  {
                                    else {
                                      char v1 = 19;
                                    }
                                  }

                                  else
                                  {
                                    char v1 = 18;
                                  }
                                }

                                else
                                {
                                  char v1 = 17;
                                }
                              }

                              else
                              {
                                char v1 = 16;
                              }
                            }

                            else
                            {
                              char v1 = 15;
                            }
                          }

                          else
                          {
                            char v1 = 14;
                          }
                        }

                        else
                        {
                          char v1 = 13;
                        }
                      }

                      else
                      {
                        char v1 = 12;
                      }
                    }

                    else
                    {
                      char v1 = 11;
                    }
                  }

                  else
                  {
                    char v1 = 9;
                  }
                }

                else
                {
                  char v1 = 8;
                }
              }

              else
              {
                char v1 = 7;
              }
            }

            else
            {
              char v1 = 6;
            }
          }

          else
          {
            char v1 = 5;
          }
        }

        else
        {
          char v1 = 4;
        }
      }

      else
      {
        char v1 = 3;
      }
    }

    else
    {
      char v1 = 2;
    }
  }

  else
  {
    char v1 = 1;
  }

  char valuePtr = v1;
  return CFNumberCreate(kCFAllocatorDefault, kCFNumberCharType, &valuePtr);
}

CFNumberRef acc_analytics_createBucketizeBatteryPackConnectionDuration(unint64_t a1)
{
  if (a1 > 0x1B773F)
  {
    if (a1 > 0x36F267)
    {
      if (a1 > 0x6DE0E7)
      {
        if (a1 > 0xDBBDE7)
        {
          if (a1 > 0x1B777E7)
          {
            if (a1 > 0x29331E7)
            {
              if (a1 > 0x5265FE7)
              {
                if (a1 > 0xF7317E7)
                {
                  if (a1 > 0x240C87E7) {
                    char v1 = 10;
                  }
                  else {
                    char v1 = 9;
                  }
                }

                else
                {
                  char v1 = 8;
                }
              }

              else
              {
                char v1 = 7;
              }
            }

            else
            {
              char v1 = 6;
            }
          }

          else
          {
            char v1 = 5;
          }
        }

        else
        {
          char v1 = 4;
        }
      }

      else
      {
        char v1 = 3;
      }
    }

    else
    {
      char v1 = 2;
    }
  }

  else
  {
    char v1 = 1;
  }

  char valuePtr = v1;
  return CFNumberCreate(kCFAllocatorDefault, kCFNumberCharType, &valuePtr);
}

CFNumberRef acc_analytics_createBucketizePowerSourceChargingTime(unint64_t a1)
{
  if (a1 > 0x3E7)
  {
    if (a1 > 0xDBB9F)
    {
      if (a1 > 0x1B7B27)
      {
        if (a1 > 0x36F267)
        {
          if (a1 > 0x6DE0E7)
          {
            if (a1 > 0xDBBDE7)
            {
              if (a1 > 0x1B777E7)
              {
                if (a1 > 0x29331E7)
                {
                  if (a1 > 0x5265FE7)
                  {
                    if (a1 > 0xF7317E7)
                    {
                      if (a1 > 0x240C87E7) {
                        char v1 = 12;
                      }
                      else {
                        char v1 = 11;
                      }
                    }

                    else
                    {
                      char v1 = 10;
                    }
                  }

                  else
                  {
                    char v1 = 9;
                  }
                }

                else
                {
                  char v1 = 8;
                }
              }

              else
              {
                char v1 = 7;
              }
            }

            else
            {
              char v1 = 6;
            }
          }

          else
          {
            char v1 = 5;
          }
        }

        else
        {
          char v1 = 4;
        }
      }

      else
      {
        char v1 = 3;
      }
    }

    else
    {
      char v1 = 2;
    }
  }

  else
  {
    char v1 = 1;
  }

  char valuePtr = v1;
  return CFNumberCreate(kCFAllocatorDefault, kCFNumberCharType, &valuePtr);
}

void __38__ueaPluginSystemSettingsMonitor_init__block_invoke(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v2 addObserver:*(void *)(a1 + 32) selector:"airplaneModeOrBTSettingChanged:" name:ueaPluginSystemSettingsAirplaneModeChanged object:0];

  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 addObserver:*(void *)(a1 + 32) selector:"airplaneModeOrBTSettingChanged:" name:ueaPluginSystemSettingsBluetoothSettomgChanged object:0];

  if (gLogObjects && gNumLogObjects >= 3)
  {
    unint64_t v4 = (os_log_s *)*(id *)(gLogObjects + 16);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[AirplaneMode init].cold.2();
    }
    unint64_t v4 = (os_log_s *)&_os_log_default;
    id v5 = &_os_log_default;
  }

  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "Registered for : airplaneMode and bluetooth setting change", buf, 2u);
  }

  if (gLogObjects && gNumLogObjects >= 3)
  {
    uint64_t v6 = (os_log_s *)*(id *)(gLogObjects + 16);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[AirplaneMode init].cold.2();
    }
    uint64_t v6 = (os_log_s *)&_os_log_default;
    id v7 = &_os_log_default;
  }

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v17 = 0;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Init _airplaneMode", v17, 2u);
  }

  v8 = objc_alloc_init(&OBJC_CLASS___AirplaneMode);
  uint64_t v9 = *(void *)(a1 + 32);
  unint64_t v10 = *(void **)(v9 + 16);
  *(void *)(v9 + 16) = v8;

  if (gLogObjects && gNumLogObjects >= 3)
  {
    v11 = (os_log_s *)*(id *)(gLogObjects + 16);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[AirplaneMode init].cold.2();
    }
    v11 = (os_log_s *)&_os_log_default;
    id v12 = &_os_log_default;
  }

  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v16 = 0;
    _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "Init _bluetoothSetting", v16, 2u);
  }

  __int16 v13 = objc_alloc_init(&OBJC_CLASS___BluetoothSetting);
  uint64_t v14 = *(void *)(a1 + 32);
  v15 = *(void **)(v14 + 24);
  *(void *)(v14 + 24) = v13;
}

void OUTLINED_FUNCTION_3_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

void OUTLINED_FUNCTION_4_0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

uint64_t _serviceAdded(void *a1, io_iterator_t iterator)
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

LABEL_7:
}

unint64_t systemInfo_getCurrentUnixTime()
{
  v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v0 timeIntervalSince1970];
  double v2 = v1;

  unint64_t v3 = vcvtad_u64_f64(v2);
  if (v2 <= 0.0) {
    return 0LL;
  }
  else {
    return v3;
  }
}

unint64_t systemInfo_getCurrentUnixTimeMS()
{
  v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v0 timeIntervalSince1970];
  double v2 = v1;

  unint64_t v3 = vcvtad_u64_f64(v2 * 1000.0);
  if (v2 <= 0.0) {
    return 0LL;
  }
  else {
    return v3;
  }
}

uint64_t systemInfo_isInternalBuild()
{
  if (systemInfo_isInternalBuild_onceToken != -1) {
    dispatch_once(&systemInfo_isInternalBuild_onceToken, &__block_literal_global_1);
  }
  return systemInfo_isInternalBuild_internalBuild;
}

void __systemInfo_isInternalBuild_block_invoke(id a1)
{
  systemInfo_isInternalBuild_internalBuild = MGGetBoolAnswer(@"InternalBuild");
}

uint64_t systemInfo_isDeveloperBuild()
{
  if (systemInfo_isDeveloperBuild_onceToken != -1) {
    dispatch_once(&systemInfo_isDeveloperBuild_onceToken, &__block_literal_global_2);
  }
  return systemInfo_isDeveloperBuild_developerBuild;
}

void __systemInfo_isDeveloperBuild_block_invoke(id a1)
{
  double v1 = (const void *)MGCopyAnswer(@"ReleaseType", 0LL);
  if (v1)
  {
    double v2 = v1;
    systemInfo_isDeveloperBuild_developerBuild = CFEqual(v1, @"Beta") != 0;
    CFRelease(v2);
  }

  else
  {
    systemInfo_isDeveloperBuild_developerBuild = 0;
  }

uint64_t systemInfo_systemSupportsPearl()
{
  return 0LL;
}

uint64_t systemInfo_systemSupportsWAPI()
{
  return 0LL;
}

uint64_t systemInfo_copyDeviceClass()
{
  return MGCopyAnswer(@"DeviceClass", 0LL);
}

uint64_t systemInfo_isHomePod()
{
  return 0LL;
}

uint64_t systemInfo_copyRegionCode()
{
  return 0LL;
}

uint64_t systemInfo_copyProductType()
{
  return 0LL;
}

uint64_t systemInfo_copyProductVersion()
{
  return 0LL;
}

void sub_895C(_Unwind_Exception *a1)
{
}

LABEL_11:
  __int16 v13 = (void *)objc_claimAutoreleasedReturnValue(-[ACCUserNotificationManager lock](self, "lock"));
  [v13 unlock];

  return v7;
}

  return v11;
}

void init_logging()
{
}

id acc_strings_bundle()
{
  v0 = (void *)acc_strings_bundle_bundle;
  if (!acc_strings_bundle_bundle)
  {
    uint64_t v1 = objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  kACCIdentifiers_CoreAccessoriesBundleID));
    double v2 = (void *)acc_strings_bundle_bundle;
    acc_strings_bundle_bundle = v1;

    v0 = (void *)acc_strings_bundle_bundle;
  }

  return v0;
}

id acc_strings_placeholder_Unknown()
{
  id v0 = acc_strings_bundle();
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue(v0);
  double v2 = (void *)objc_claimAutoreleasedReturnValue([v1 localizedStringForKey:@"Unknown" value:&stru_159E8 table:0]);

  return v2;
}

CFBundleRef acc_strings_bundleCF()
{
  CFBundleRef result = (CFBundleRef)acc_strings_bundleCF_bundle;
  if (!acc_strings_bundleCF_bundle)
  {
    CFBundleRef result = CFBundleGetBundleWithIdentifier(kCFACCIdentifiers_CoreAccessoriesBundleID);
    acc_strings_bundleCF_bundle = (uint64_t)result;
  }

  return result;
}

uint64_t acc_strings_copyPlaceholder_Unknown()
{
  id v0 = acc_strings_placeholder_Unknown();
  return objc_claimAutoreleasedReturnValue(v0);
}

void printDictionaryDelta(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v3 allKeys]);
  [v5 addObjectsFromArray:v6];

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 allKeys]);
  [v5 addObjectsFromArray:v7];

  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v8 = v5;
  id v9 = [v8 countByEnumeratingWithState:&v21 objects:v31 count:16];
  if (v9)
  {
    id v11 = v9;
    uint64_t v12 = *(void *)v22;
    *(void *)&__int128 v10 = 138412802LL;
    __int128 v20 = v10;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v8);
        }
        uint64_t v14 = *(void *)(*((void *)&v21 + 1) + 8LL * (void)i);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", v14, v20, (void)v21));
        int v16 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v14]);
        unsigned __int8 v17 = [v15 isEqual:v16];

        if ((v17 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:v14]);
          v19 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v14]);
          *(_DWORD *)buf = v20;
          uint64_t v26 = v14;
          __int16 v27 = 2112;
          v28 = v18;
          __int16 v29 = 2112;
          v30 = v19;
          _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@: %@ -> %@", buf, 0x20u);
        }
      }

      id v11 = [v8 countByEnumeratingWithState:&v21 objects:v31 count:16];
    }

    while (v11);
  }
}

id _serviceNotification(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  return [a1 _handleNotificationForService:a2 messageType:a3 messageArgument:a4];
}

void OUTLINED_FUNCTION_0_1( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

ACCUserNotification *ACCUNCreate( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, double a9, uint64_t a10)
{
  v19 = objc_alloc_init(&OBJC_CLASS___ACCUserNotification);
  -[ACCUserNotification setType:](v19, "setType:", a1);
  -[ACCUserNotification setTitle:](v19, "setTitle:", a2);
  -[ACCUserNotification setMessage:](v19, "setMessage:", a3);
  -[ACCUserNotification setDefaultButtonName:](v19, "setDefaultButtonName:", a4);
  -[ACCUserNotification setOtherButtonName:](v19, "setOtherButtonName:", a5);
  -[ACCUserNotification setIconURL:](v19, "setIconURL:", a6);
  -[ACCUserNotification setIsModal:](v19, "setIsModal:", a7);
  -[ACCUserNotification setTimeout:](v19, "setTimeout:", a9);
  -[ACCUserNotification setIdentifier:](v19, "setIdentifier:", a8);
  -[ACCUserNotification setGroupIdentifier:](v19, "setGroupIdentifier:", a10);
  return v19;
}

BOOL ACCUNSetModal(void *a1, uint64_t a2)
{
  if (a1) {
    [a1 setIsModal:a2];
  }
  return a1 != 0LL;
}

BOOL ACCUNSetDismissOnUnlock(void *a1, uint64_t a2)
{
  if (a1) {
    [a1 setDismissOnUnlock:a2];
  }
  return a1 != 0LL;
}

BOOL ACCUNSetIdentifier(void *a1, uint64_t a2)
{
  if (a1) {
    [a1 setIdentifier:a2];
  }
  return a1 != 0LL;
}

BOOL ACCUNSetGroupIdentifier(void *a1, uint64_t a2)
{
  if (a1) {
    [a1 setGroupIdentifier:a2];
  }
  return a1 != 0LL;
}

void *ACCUNCopyUUIDString(void *result)
{
  if (result) {
    return (void *)objc_claimAutoreleasedReturnValue([result uuid]);
  }
  return result;
}

void SystemPowerCallback(void *a1, uint64_t a2, int a3, intptr_t a4)
{
  id v6 = a1;
  switch(a3)
  {
    case -536870288:
      goto LABEL_4;
    case -536870144:
      id v7 = v6;
      EnableAccessoryPower();
      goto LABEL_6;
    case -536870272:
LABEL_4:
      id v7 = v6;
      IOAllowPowerChange((io_connect_t)[v6 systemPowerPort], a4);
LABEL_6:
      id v6 = v7;
      break;
  }
}

void __47__accessorydMatchingPlugin_startAccPowerTimer___block_invoke(uint64_t a1)
{
  double v2 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) accPowerQueue]);
  dispatch_source_t v3 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, v2);
  [*(id *)(a1 + 32) setAccPowerTimer:v3];

  v9[0] = 0LL;
  v9[1] = v9;
  v9[2] = 0x3032000000LL;
  v9[3] = __Block_byref_object_copy_;
  v9[4] = __Block_byref_object_dispose_;
  id v10 = (id)0xAAAAAAAAAAAAAAAALL;
  id v10 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) accPowerTimer]);
  id v4 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) accPowerTimer]);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = __47__accessorydMatchingPlugin_startAccPowerTimer___block_invoke_4;
  handler[3] = &unk_14E28;
  handler[4] = v9;
  dispatch_source_set_event_handler(v4, handler);

  uint64_t v5 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) accPowerTimer]);
  dispatch_time_t v6 = dispatch_time(0LL, 1000000LL * *(unsigned int *)(a1 + 40));
  dispatch_source_set_timer(v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0LL);

  id v7 = (dispatch_object_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) accPowerTimer]);
  dispatch_resume(v7);

  _Block_object_dispose(v9, 8);
}

void sub_B468( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void __47__accessorydMatchingPlugin_startAccPowerTimer___block_invoke_4(uint64_t a1)
{
}

void EnableAccessoryPower()
{
  kern_return_t v15;
  kern_return_t v16;
  uint64_t v17;
  int v18;
  os_log_s *v19;
  int v20;
  int v21;
  uint64_t v22;
  int v23;
  os_log_s *v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  io_connect_t connect;
  io_iterator_t existing;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  int v39;
  __int16 v40;
  int v41;
  connect = 0;
  existing = -1431655766;
  if (gLogObjects) {
    BOOL v0 = gNumLogObjects < 1;
  }
  else {
    BOOL v0 = 1;
  }
  if (v0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[AirplaneMode init].cold.2();
    }
    double v2 = (os_log_s *)&_os_log_default;
    id v1 = &_os_log_default;
  }

  else
  {
    double v2 = (os_log_s *)*(id *)gLogObjects;
  }

  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v37 = "kern_return_t EnableAccessoryPower(void)";
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "%s Enabling Accessory Power.\n", buf, 0xCu);
  }

  dispatch_source_t v3 = IOServiceMatching("IOAccessoryManager");
  uint64_t MatchingServices = IOServiceGetMatchingServices(kIOMainPortDefault, v3, &existing);
  if ((_DWORD)MatchingServices)
  {
    uint64_t v5 = MatchingServices;
    if (gLogObjects && gNumLogObjects >= 1)
    {
      dispatch_time_t v6 = (os_log_s *)*(id *)gLogObjects;
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        -[AirplaneMode init].cold.2();
      }
      dispatch_time_t v6 = (os_log_s *)&_os_log_default;
      __int16 v27 = &_os_log_default;
    }

    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      EnableAccessoryPower_cold_1(v5, v6, v28, v29, v30, v31, v32, v33);
    }
  }

  else
  {
    uint64_t v7 = IOIteratorNext(existing);
    if ((_DWORD)v7)
    {
      uint64_t v8 = v7;
      do
      {
        int PrimaryPort = IOAccessoryManagerGetPrimaryPort(v8);
        if (IOAccessoryManagerPowerModeIsSupported(v8, 3LL) && PrimaryPort != 512)
        {
          uint64_t v10 = gLogObjects;
          int v11 = gNumLogObjects;
          if (gLogObjects) {
            BOOL v12 = gNumLogObjects < 1;
          }
          else {
            BOOL v12 = 1;
          }
          if (v12)
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218240;
              v37 = (const char *)v10;
              v38 = 1024;
              v39 = v11;
              _os_log_error_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d",  buf,  0x12u);
            }

            id v13 = &_os_log_default;
            uint64_t v14 = (os_log_s *)&_os_log_default;
          }

          else
          {
            uint64_t v14 = (os_log_s *)*(id *)gLogObjects;
          }

          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            v37 = "kern_return_t EnableAccessoryPower(void)";
            v38 = 1024;
            v39 = PrimaryPort;
            _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "%s Enabling Accessory Power on port %d.\n", buf, 0x12u);
          }

          v15 = IOServiceOpen(v8, mach_task_self_, 0, &connect);
          if (v15)
          {
            int v16 = v15;
            unsigned __int8 v17 = gLogObjects;
            v18 = gNumLogObjects;
            if (gLogObjects && gNumLogObjects >= 1)
            {
              v19 = (os_log_s *)*(id *)gLogObjects;
            }

            else
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 134218240;
                v37 = (const char *)v17;
                v38 = 1024;
                v39 = v18;
                _os_log_error_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d",  buf,  0x12u);
              }

              v25 = &_os_log_default;
              v19 = (os_log_s *)&_os_log_default;
            }

            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v37 = "kern_return_t EnableAccessoryPower(void)";
              v38 = 1024;
              v39 = v16;
              _os_log_error_impl(&dword_0, v19, OS_LOG_TYPE_ERROR, "%s IOServiceOpen failed: %#x\n", buf, 0x12u);
            }
          }

          else
          {
            __int128 v20 = IOAccessoryManagerConfigurePower(connect, 3LL);
            if (v20)
            {
              __int128 v21 = v20;
              __int128 v22 = gLogObjects;
              __int128 v23 = gNumLogObjects;
              if (gLogObjects && gNumLogObjects >= 1)
              {
                __int128 v24 = (os_log_s *)*(id *)gLogObjects;
              }

              else
              {
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 134218240;
                  v37 = (const char *)v22;
                  v38 = 1024;
                  v39 = v23;
                  _os_log_error_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d",  buf,  0x12u);
                }

                uint64_t v26 = &_os_log_default;
                __int128 v24 = (os_log_s *)&_os_log_default;
              }

              if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315650;
                v37 = "kern_return_t EnableAccessoryPower(void)";
                v38 = 1024;
                v39 = v21;
                v40 = 1024;
                v41 = PrimaryPort;
                _os_log_error_impl( &dword_0,  v24,  OS_LOG_TYPE_ERROR,  "%s IOAccessoryManagerConfigurePower didn't enable power %#x for primaryPort: %d\n",  buf,  0x18u);
              }
            }

            IOServiceClose(connect);
          }
        }

        IOObjectRelease(v8);
        uint64_t v8 = IOIteratorNext(existing);
      }

      while ((_DWORD)v8);
    }

    IOObjectRelease(existing);
  }

void accessorydMatchingPlugin_Initialize(uint64_t a1)
{
  id v1 = -[accessorydMatchingPlugin initWithModule:]( objc_alloc(&OBJC_CLASS___accessorydMatchingPlugin),  "initWithModule:",  a1);
  double v2 = (void *)gAccessorydMatchingPlugin;
  gAccessorydMatchingPlugin = (uint64_t)v1;
}

void __init_logging_modules_block_invoke_cold_1(uint8_t *buf, int a2, _DWORD *a3)
{
  *(_DWORD *)buf = 67109120;
  *a3 = a2;
  _os_log_error_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Category missing for logging module %d!\n(Check LoggingModuleEntry_t table)",  buf,  8u);
}

void EnableAccessoryPower_cold_1( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void xpc_event_provider_create()
{
  while (1)
    ;
}

id objc_msgSend_warningHandler(void *a1, const char *a2, ...)
{
  return [a1 warningHandler];
}