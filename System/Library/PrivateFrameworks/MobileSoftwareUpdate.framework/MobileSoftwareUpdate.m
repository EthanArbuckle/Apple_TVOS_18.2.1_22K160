int *logfunctionv(const char *a1, uint64_t a2, const __CFString *a3, va_list a4)
{
  int v7;
  CFStringRef v8;
  CFStringRef v9;
  const char *v10;
  char *v11;
  CFIndex Length;
  CFIndex v13;
  const char *v14;
  int *result;
  char __dst[1024];
  uint64_t v17;
  v17 = *MEMORY[0x1895F89C0];
  v7 = *__error();
  memcpy(__dst, "Error creating CFString", sizeof(__dst));
  if (logfunctionv_onceToken != -1) {
    dispatch_once(&logfunctionv_onceToken, &__block_literal_global);
  }
  v8 = CFStringCreateWithFormatAndArguments(0LL, 0LL, a3, a4);
  if (v8)
  {
    v9 = v8;
    v10 = __dst;
    if (CFStringGetCString(v8, __dst, 1024LL, 0x8000100u))
    {
      v11 = 0LL;
    }

    else
    {
      Length = CFStringGetLength(v9);
      v13 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
      v11 = (char *)malloc(v13);
      CFStringGetCString(v9, v11, v13, 0x8000100u);
      v10 = v11;
    }

    CFRelease(v9);
  }

  else
  {
    v11 = 0LL;
    v10 = 0LL;
  }

  v14 = "";
  if (a1) {
    v14 = a1;
  }
  fprintf((FILE *)*MEMORY[0x1895F89D0], "%s: %s", v14, v10);
  free(v11);
  result = __error();
  *result = v7;
  return result;
}

char *__logfunctionv_block_invoke()
{
  result = getenv("__OSINSTALL_ENVIRONMENT");
  if (result) {
    return (char *)open("/dev/console", 131082);
  }
  return result;
}

int *logfunction( const char *a1, uint64_t a2, const __CFString *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return logfunctionv(a1, 0LL, a3, &a9);
}
}

  ;
}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

void OUTLINED_FUNCTION_1(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

  ;
}

void OUTLINED_FUNCTION_4( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

CFErrorRef _vcreate_error_internal_with_userinfo_cf( const __CFString *a1, CFIndex a2, const void *a3, const void *a4, const __CFDictionary *a5, const __CFString *a6, va_list a7)
{
  int v14 = *__error();
  v15 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  if (a5) {
    CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, a5);
  }
  else {
    CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
  }
  v17 = MutableCopy;
  if (MutableCopy)
  {
    CFStringRef v18 = CFStringCreateWithFormatAndArguments(v15, 0LL, a6, a7);
    if (v18)
    {
      CFStringRef v24 = v18;
      logfunction("", 1LL, @"%@ error %ld - %@\n", v19, v20, v21, v22, v23, (char)a1);
      CFDictionaryAddValue(v17, (const void *)*MEMORY[0x189604F68], v24);
      CFRelease(v24);
    }

    if (a3) {
      CFDictionaryAddValue(v17, (const void *)*MEMORY[0x189604F88], a3);
    }
    if (a4) {
      CFDictionaryAddValue(v17, @"target_update", a4);
    }
    CFErrorRef v25 = CFErrorCreate(v15, a1, a2, v17);
    CFRelease(v17);
  }

  else
  {
    CFErrorRef v25 = 0LL;
  }

  *__error() = v14;
  return v25;
}

CFErrorRef _create_error_internal_cf( const __CFString *a1, CFIndex a2, const void *a3, const void *a4, const __CFString *a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return _vcreate_error_internal_with_userinfo_cf(a1, a2, a3, a4, 0LL, a5, &a9);
}

CFDictionaryRef cferror_to_dictionary_embedded(__CFError *a1, int a2)
{
  uint64_t v38 = *MEMORY[0x1895F89C0];
  CFIndex valuePtr = CFErrorGetCode(a1);
  CFErrorDomain Domain = CFErrorGetDomain(a1);
  v5 = CFErrorCopyUserInfo(a1);
  v6 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  CFNumberRef v7 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x189604DB0], kCFNumberCFIndexType, &valuePtr);
  if (!v7)
  {
    logfunction("", 1LL, @"could not create cfnumber\n", v8, v9, v10, v11, v12, v31);
    CFDictionaryRef v21 = 0LL;
    if (!v5) {
      return v21;
    }
    goto LABEL_22;
  }

  CFNumberRef v13 = v7;
  *(_OWORD *)keys = xmmword_18A0EAE48;
  __int128 v37 = *(_OWORD *)&off_18A0EAE58;
  values[0] = v7;
  values[1] = (void *)Domain;
  v34 = v5;
  uint64_t v35 = 0LL;
  if (!v5)
  {
    v16 = 0LL;
    CFIndex v22 = 2LL;
    if (!a2) {
      goto LABEL_17;
    }
    uint64_t v23 = &v34;
    uint64_t v24 = 3LL;
    goto LABEL_16;
  }

  int v14 = (const void *)*MEMORY[0x189604F88];
  Value = (__CFDictionary *)CFDictionaryGetValue(v5, (const void *)*MEMORY[0x189604F88]);
  v16 = Value;
  if (Value)
  {
    CFTypeID v17 = CFGetTypeID(Value);
    if (v17 == CFErrorGetTypeID() && (uint64_t v18 = cferror_to_dictionary_embedded(v16, 0LL)) != 0)
    {
      uint64_t v19 = (const void *)v18;
      CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(v6, 0LL, v5);
      v16 = MutableCopy;
      if (MutableCopy)
      {
        CFDictionarySetValue(MutableCopy, v14, v19);
        v34 = v16;
      }

      CFRelease(v19);
    }

    else
    {
      v16 = 0LL;
    }
  }

  CFIndex v22 = 3LL;
  if ((a2 & 1) != 0)
  {
    uint64_t v23 = (const __CFDictionary **)&v35;
    uint64_t v24 = 4LL;
LABEL_16:
    keys[v22] = @"_MSU_Embedded_Error";
    *uint64_t v23 = (const __CFDictionary *)*MEMORY[0x189604DE8];
    CFIndex v22 = v24;
  }

LABEL_17:
  CFDictionaryRef v21 = CFDictionaryCreate( v6,  (const void **)keys,  (const void **)values,  v22,  MEMORY[0x189605240],  MEMORY[0x189605250]);
  if (!v21) {
    logfunction("", 1LL, @"could not create cfdictionary\n", v25, v26, v27, v28, v29, v31);
  }
  if (v16) {
    CFRelease(v16);
  }
  CFRelease(v13);
  if (v5) {
LABEL_22:
  }
    CFRelease(v5);
  return v21;
}

  if (v32)
  {
    CFRelease(v32);
    v32 = 0LL;
  }

  if (cf) {
    CFRelease(cf);
  }
  return v3;
}

        xpc_release(v8);
        goto LABEL_18;
      }

      v16 = (void *)MEMORY[0x1895B089C](v14);
      if (os_log_type_enabled( (os_log_t)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog"),  OS_LOG_TYPE_ERROR))
      {
        create_brain_connection_cold_5();
      }
    }

    free(v16);
    goto LABEL_16;
  }

  if (os_log_type_enabled( (os_log_t)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog"),  OS_LOG_TYPE_ERROR))
  {
    create_brain_connection_cold_1();
  }

  return 0LL;
}

CFStringRef copy_dictionary_to_cferror(const void *a1)
{
  CFIndex valuePtr = 0LL;
  if (!a1) {
    return 0LL;
  }
  CFTypeID v2 = CFGetTypeID(a1);
  if (v2 != CFDictionaryGetTypeID())
  {
    uint64_t v23 = @"marshalled cferror is not a dictionary.\n";
LABEL_17:
    logfunction("", 1LL, v23, v3, v4, v5, v6, v7, v25);
    return 0LL;
  }

  Value = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)a1, @"Code");
  if (!Value)
  {
    uint64_t v23 = @"marshalled cferror is incomplete. missing code.\n";
    goto LABEL_17;
  }

  if (!CFNumberGetValue(Value, kCFNumberCFIndexType, &valuePtr))
  {
    uint64_t v23 = @"code not convert cfnumber code to cfindex\n";
    goto LABEL_17;
  }

  int v14 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)a1, @"Domain");
  if (!v14)
  {
    logfunction("", 1LL, @"marshalled cferror is incomplete. missing domain.\n", v9, v10, v11, v12, v13, v25);
    return v14;
  }

  v15 = (const __CFDictionary *)CFDictionaryGetValue((CFDictionaryRef)a1, @"UserInfo");
  if (!v15)
  {
    uint64_t v23 = @"marshalled cferror is incomplete. missing UserInfo.\n";
    goto LABEL_17;
  }

  v16 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, v15);
  if (!MutableCopy)
  {
    uint64_t v23 = @"code not create mutable copy of userInfo\n";
    goto LABEL_17;
  }

  uint64_t v18 = MutableCopy;
  uint64_t v19 = (const void *)*MEMORY[0x189604F88];
  uint64_t v20 = CFDictionaryGetValue(MutableCopy, (const void *)*MEMORY[0x189604F88]);
  CFDictionaryRef v21 = (const void *)copy_dictionary_to_cferror(v20);
  if (v21)
  {
    CFIndex v22 = v21;
    CFDictionarySetValue(v18, v19, v21);
    CFRelease(v22);
  }

  int v14 = (const __CFString *)CFErrorCreate(v16, v14, valuePtr, v18);
  CFRelease(v18);
  return v14;
}

CFPropertyListRef _MSUPreferencesCopyValueForDomain(const __CFString *a1, const __CFString *a2)
{
  CFPropertyListRef v4 = CFPreferencesCopyAppValue(a1, a2);
  if (v4) {
    return v4;
  }
  if (_getManagedPreferencesDict_managedPreferencesOnce != -1) {
    dispatch_once(&_getManagedPreferencesDict_managedPreferencesOnce, &__block_literal_global_0);
  }
  if (_getManagedPreferencesDict__managedPreferencesCache)
  {
    Value = CFDictionaryGetValue((CFDictionaryRef)_getManagedPreferencesDict__managedPreferencesCache, a1);
    if (Value)
    {
      CFPropertyListRef v4 = Value;
      CFRetain(Value);
      return v4;
    }
  }

  return CFPreferencesCopyValue(a1, a2, @"mobile", (CFStringRef)*MEMORY[0x189605178]);
}

CFPropertyListRef _MSUPreferencesCopyValue(const __CFString *a1)
{
  return _MSUPreferencesCopyValueForDomain(a1, @"com.apple.MobileSoftwareUpdate");
}

uint64_t _MSUPreferencesGetAppBooleanValue(const __CFString *a1, _BYTE *a2)
{
  uint64_t v3 = (const __CFBoolean *)_MSUPreferencesCopyValueForDomain(a1, @"com.apple.MobileSoftwareUpdate");
  CFPropertyListRef v4 = v3;
  if (v3)
  {
    CFTypeID v5 = CFGetTypeID(v3);
    BOOL v6 = v5 == CFBooleanGetTypeID();
    if (!a2) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  BOOL v6 = 0;
  if (a2) {
LABEL_3:
  }
    *a2 = v6;
LABEL_4:
  if (v6)
  {
    uint64_t Value = CFBooleanGetValue(v4);
    if (!v4) {
      return Value;
    }
    goto LABEL_8;
  }

  uint64_t Value = 0LL;
  if (v4) {
LABEL_8:
  }
    CFRelease(v4);
  return Value;
}

uint64_t _MSUPreferencesGetAppBooleanValueWithDefaultValue(const __CFString *a1, unsigned int a2)
{
  char v4 = 0;
  LODWORD(result) = _MSUPreferencesGetAppBooleanValue(a1, &v4);
  if (v4) {
    return result;
  }
  else {
    return a2;
  }
}

uint64_t _MSUPreferencesGetAppIntegerValue(const __CFString *a1, BOOL *a2)
{
  uint64_t valuePtr = 0LL;
  uint64_t v3 = (const __CFNumber *)_MSUPreferencesCopyValueForDomain(a1, @"com.apple.MobileSoftwareUpdate");
  char v4 = v3;
  if (!v3 || (CFTypeID v5 = CFGetTypeID(v3), v5 != CFNumberGetTypeID()))
  {
    BOOL v6 = 0;
    if (!a2) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }

  BOOL v6 = CFNumberGetValue(v4, kCFNumberCFIndexType, &valuePtr) != 0;
  if (a2) {
LABEL_6:
  }
    *a2 = v6;
LABEL_7:
  if (v4) {
    CFRelease(v4);
  }
  return valuePtr;
}

void ___getManagedPreferencesDict_block_invoke()
{
  CFStringRef v0 = CFStringCreateWithFormat( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  @"%@/%@.plist",  @"/Library/Managed Preferences/mobile",  @"com.apple.MobileSoftwareUpdate");
  if (v0)
  {
    CFStringRef v1 = v0;
    _getManagedPreferencesDict__managedPreferencesCache = [objc_alloc(MEMORY[0x189603F68]) initWithContentsOfFile:v0];
    CFRelease(v1);
  }

uint64_t qos_class_for_msu_qos(int a1)
{
  else {
    return dword_1879E0788[a1 - 1];
  }
}

uint64_t MSUPreflightUpdate(uint64_t a1, const void *a2, const __CFString **a3, uint64_t a4, uint64_t a5)
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  uint64_t v10 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    else {
      uint64_t v11 = off_18A0EB3B8[(int)a1];
    }
    uint64_t v12 = [MEMORY[0x189603F68] safeSummaryForDictionary:a2];
    uint64_t v13 = @"SPECIFIED";
    *(_DWORD *)buf = 138413314;
    uint64_t v26 = @"MSUPreflightUpdate";
    __int16 v27 = 2112;
    uint64_t v28 = v11;
    if (a4) {
      int v14 = @"SPECIFIED";
    }
    else {
      int v14 = @"NONE";
    }
    __int16 v29 = 2112;
    if (!a5) {
      uint64_t v13 = @"NONE";
    }
    uint64_t v30 = v12;
    __int16 v31 = 2112;
    v32 = v14;
    __int16 v33 = 2112;
    v34 = v13;
    _os_log_impl( &dword_1879D2000,  v10,  OS_LOG_TYPE_DEFAULT,  "[SPI] %@ | BEGIN | phase:%@, options:%@, fncallback:%@, context:%@",  buf,  0x34u);
  }

  Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
  v16 = Mutable;
  if (a2)
  {
    CFDictionarySetValue(Mutable, @"ClientOptions", a2);
    uint64_t Value = (void *)CFDictionaryGetValue((CFDictionaryRef)a2, @"__msu-update-attributes-dictionary-key");
    if (Value) {
      CFDictionarySetValue(v16, @"AssetProperties", Value);
    }
    uint64_t v18 = CFDictionaryGetValue((CFDictionaryRef)a2, @"SourcePath");
    if (v18) {
      CFDictionarySetValue(v16, @"SourcePath", v18);
    }
  }

  else
  {
    uint64_t Value = 0LL;
  }

  uint64_t v19 = (void *)MEMORY[0x1895B0728]();
  -[__CFDictionary setValue:forKey:]( v16,  "setValue:forKey:",  [MEMORY[0x189607968] numberWithInt:a1],  @"Phase");
  objc_autoreleasePoolPop(v19);
  v24[0] = MEMORY[0x1895F87A8];
  v24[1] = 3221225472LL;
  v24[2] = __MSUPreflightUpdate_block_invoke;
  v24[3] = &__block_descriptor_48_e25_i16__0____CFDictionary__8l;
  v24[4] = a4;
  v24[5] = a5;
  uint64_t v20 = perform_command_with_progress("PreflightUpdate", v16, Value, 0LL, a3, (uint64_t)v24);
  CFRelease(v16);
  CFDictionaryRef v21 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
  CFIndex v22 = v21;
  if ((_DWORD)v20)
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v26 = @"MSUPreflightUpdate";
      _os_log_impl(&dword_1879D2000, v22, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | SUCCESS", buf, 0xCu);
    }
  }

  else if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    MSUPreflightUpdate_cold_1();
  }

  return v20;
}

uint64_t __MSUPreflightUpdate_block_invoke(uint64_t a1, uint64_t a2)
{
  CFTypeID v2 = *(uint64_t (**)(uint64_t, void))(a1 + 32);
  if (v2) {
    return v2(a2, *(void *)(a1 + 40));
  }
  else {
    return 0LL;
  }
}

BOOL MSUPrepareUpdateWithAsset( void *a1, const void *a2, uint64_t *a3, const __CFString **a4, uint64_t a5, uint64_t a6)
{
  uint64_t v38 = *MEMORY[0x1895F89C0];
  uint64_t v12 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    if (a1) {
      uint64_t v13 = @"SPECIFIED";
    }
    else {
      uint64_t v13 = @"NONE";
    }
    uint64_t v14 = [MEMORY[0x189603F68] safeSummaryForDictionary:a2];
    *(_DWORD *)buf = 138413314;
    __int16 v29 = @"MSUPrepareUpdateWithAsset";
    if (a5) {
      v15 = @"SPECIFIED";
    }
    else {
      v15 = @"NONE";
    }
    if (a6) {
      v16 = @"SPECIFIED";
    }
    else {
      v16 = @"NONE";
    }
    __int16 v30 = 2112;
    uint64_t v31 = (uint64_t)v13;
    __int16 v32 = 2112;
    uint64_t v33 = v14;
    __int16 v34 = 2112;
    uint64_t v35 = v15;
    __int16 v36 = 2112;
    __int128 v37 = v16;
    _os_log_impl( &dword_1879D2000,  v12,  OS_LOG_TYPE_DEFAULT,  "[SPI] %@ | BEGIN | update_asset:%@, options:%@, fncallback:%@, context:%@",  buf,  0x34u);
  }

  CFTypeID v17 = (const __CFString *)objc_msgSend((id)objc_msgSend(a1, "localURL"), "path");
  if (!v17)
  {
    char v22 = [a1 state];
    CFErrorRef error_internal_cf = _create_error_internal_cf( @"MobileSoftwareUpdateErrorDomain",  9LL,  0LL,  0LL,  @"Could not get local URL for update asset; state is %ld",
                          v23,
                          v24,
                          v25,
                          v22);
    if (a4) {
      *a4 = (const __CFString *)error_internal_cf;
    }
    else {
      CFRelease(error_internal_cf);
    }
    BOOL result = os_log_type_enabled( (os_log_t)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog"),  OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    MSUPrepareUpdateWithAsset_cold_1();
    return 0LL;
  }

  int v18 = perform_prepare_command(v17, a2, (void *)[a1 attributes], a3, a4, a5, a6);
  uint64_t v19 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
  uint64_t v20 = v19;
  if (!v18)
  {
    BOOL result = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    MSUPrepareUpdateWithAsset_cold_2();
    return 0LL;
  }

  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    if (a3) {
      uint64_t v21 = *a3;
    }
    else {
      uint64_t v21 = -1LL;
    }
    *(_DWORD *)buf = 138412546;
    __int16 v29 = @"MSUPrepareUpdateWithAsset";
    __int16 v30 = 2048;
    uint64_t v31 = v21;
    _os_log_impl(&dword_1879D2000, v20, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | SUCCESS | session:%ld", buf, 0x16u);
  }

  return 1LL;
}

uint64_t perform_prepare_command( const __CFString *a1, const void *a2, void *a3, void *a4, const __CFString **a5, uint64_t a6, uint64_t a7)
{
  uint64_t v43 = *MEMORY[0x1895F89C0];
  CFNumberRef number = 0LL;
  uint64_t v13 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v26 = a5;
    if (a1) {
      uint64_t v14 = a1;
    }
    else {
      uint64_t v14 = @"NONE";
    }
    uint64_t v15 = objc_msgSend(MEMORY[0x189603F68], "safeSummaryForDictionary:", a2, v26);
    uint64_t v16 = [MEMORY[0x189603F68] safeSummaryForDictionary:a3];
    *(_DWORD *)buf = 138413570;
    CFTypeID v17 = @"SPECIFIED";
    __int16 v32 = @"perform_prepare_command";
    if (a6) {
      int v18 = @"SPECIFIED";
    }
    else {
      int v18 = @"NONE";
    }
    if (!a7) {
      CFTypeID v17 = @"NONE";
    }
    __int16 v33 = 2112;
    uint64_t v34 = (uint64_t)v14;
    a5 = v27;
    __int16 v35 = 2112;
    uint64_t v36 = v15;
    __int16 v37 = 2112;
    uint64_t v38 = v16;
    __int16 v39 = 2112;
    v40 = v18;
    __int16 v41 = 2112;
    v42 = v17;
    _os_log_impl( &dword_1879D2000,  v13,  OS_LOG_TYPE_DEFAULT,  "[SPI] %@ | BEGIN | source_path:%@, prepare_options:%@, update_attributes:%@, fncallback:%@, context:%@",  buf,  0x3Eu);
  }

  Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
  uint64_t v20 = Mutable;
  if (a1) {
    CFDictionarySetValue(Mutable, @"SourcePath", a1);
  }
  if (a2) {
    CFDictionarySetValue(v20, @"ClientOptions", a2);
  }
  if (a3) {
    CFDictionarySetValue(v20, @"AssetProperties", a3);
  }
  CFDictionarySetValue(v20, @"ClientRepliesToProgress", (const void *)*MEMORY[0x189604DE8]);
  uint64_t v21 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    __int16 v32 = @"perform_prepare_command";
    _os_log_impl( &dword_1879D2000,  v21,  OS_LOG_TYPE_DEFAULT,  "[SPI] %@ | PERFORM_WITH_PROGRESS | PrepareUpdate...",  buf,  0xCu);
  }

  v29[0] = MEMORY[0x1895F87A8];
  v29[1] = 3221225472LL;
  v29[2] = __perform_prepare_command_block_invoke;
  v29[3] = &unk_18A0EB348;
  v29[5] = a6;
  v29[6] = a7;
  v29[4] = @"perform_prepare_command";
  uint64_t v22 = perform_command_with_progress("PrepareUpdate", v20, a3, (uint64_t)&number, a5, (uint64_t)v29);
  if ((_DWORD)v22)
  {
    CFNumberGetValue(number, kCFNumberLongType, a4);
    uint64_t v23 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      if (a4) {
        uint64_t v24 = *a4;
      }
      else {
        uint64_t v24 = -1LL;
      }
      *(_DWORD *)buf = 138412546;
      __int16 v32 = @"perform_prepare_command";
      __int16 v33 = 2048;
      uint64_t v34 = v24;
      _os_log_impl( &dword_1879D2000,  v23,  OS_LOG_TYPE_DEFAULT,  "[SPI] %@ | ...PrepareUpdate | SUCCESS | session:%ld",  buf,  0x16u);
    }
  }

  else if (os_log_type_enabled( (os_log_t)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog"),  OS_LOG_TYPE_ERROR))
  {
    perform_prepare_command_cold_1();
  }

  CFRelease(v20);
  if (number) {
    CFRelease(number);
  }
  return v22;
}

BOOL MSUPrepareUpdateWithMAAsset( void *a1, const void *a2, uint64_t *a3, const __CFString **a4, uint64_t a5, uint64_t a6)
{
  uint64_t v39 = *MEMORY[0x1895F89C0];
  uint64_t v12 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    if (a1)
    {
      uint64_t v13 = (void *)[a1 absoluteAssetId];
      if (v13) {
        uint64_t v14 = (const __CFString *)[v13 summary];
      }
      else {
        uint64_t v14 = @"SPECIFIED";
      }
    }

    else
    {
      uint64_t v14 = @"NONE";
    }

    uint64_t v15 = [MEMORY[0x189603F68] safeSummaryForDictionary:a2];
    *(_DWORD *)buf = 138413314;
    __int16 v30 = @"MSUPrepareUpdateWithMAAsset";
    uint64_t v16 = @"SPECIFIED";
    if (a5) {
      CFTypeID v17 = @"SPECIFIED";
    }
    else {
      CFTypeID v17 = @"NONE";
    }
    if (!a6) {
      uint64_t v16 = @"NONE";
    }
    __int16 v31 = 2112;
    uint64_t v32 = (uint64_t)v14;
    __int16 v33 = 2112;
    uint64_t v34 = v15;
    __int16 v35 = 2112;
    uint64_t v36 = v17;
    __int16 v37 = 2112;
    uint64_t v38 = v16;
    _os_log_impl( &dword_1879D2000,  v12,  OS_LOG_TYPE_DEFAULT,  "[SPI] %@ | BEGIN | update_asset:%@, options:%@, fncallback:%@, context:%@",  buf,  0x34u);
  }

  int v18 = (const __CFString *)objc_msgSend((id)objc_msgSend(a1, "getLocalUrl"), "path");
  if (!v18)
  {
    char v23 = [a1 state];
    CFErrorRef error_internal_cf = _create_error_internal_cf( @"MobileSoftwareUpdateErrorDomain",  9LL,  0LL,  0LL,  @"Could not get local URL for update asset; state is %ld",
                          v24,
                          v25,
                          v26,
                          v23);
    if (a4) {
      *a4 = (const __CFString *)error_internal_cf;
    }
    else {
      CFRelease(error_internal_cf);
    }
    BOOL result = os_log_type_enabled( (os_log_t)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog"),  OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    MSUPrepareUpdateWithMAAsset_cold_1();
    return 0LL;
  }

  int v19 = perform_prepare_command(v18, a2, (void *)[a1 attributes], a3, a4, a5, a6);
  uint64_t v20 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
  uint64_t v21 = v20;
  if (!v19)
  {
    BOOL result = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    MSUPrepareUpdateWithMAAsset_cold_2();
    return 0LL;
  }

  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    if (a3) {
      uint64_t v22 = *a3;
    }
    else {
      uint64_t v22 = -1LL;
    }
    *(_DWORD *)buf = 138412546;
    __int16 v30 = @"MSUPrepareUpdateWithMAAsset";
    __int16 v31 = 2048;
    uint64_t v32 = v22;
    _os_log_impl(&dword_1879D2000, v21, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | SUCCESS | session:%ld", buf, 0x16u);
  }

  return 1LL;
}

uint64_t MSUPrepareUpdate( const __CFString *a1, const __CFDictionary *a2, uint64_t *a3, const __CFString **a4, uint64_t a5, uint64_t a6)
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  uint64_t v12 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    if (a1) {
      uint64_t v13 = a1;
    }
    else {
      uint64_t v13 = @"NONE";
    }
    uint64_t v14 = [MEMORY[0x189603F68] safeSummaryForDictionary:a2];
    int v23 = 138413314;
    uint64_t v24 = @"MSUPrepareUpdate";
    uint64_t v15 = @"SPECIFIED";
    uint64_t v26 = (uint64_t)v13;
    if (a5) {
      uint64_t v16 = @"SPECIFIED";
    }
    else {
      uint64_t v16 = @"NONE";
    }
    __int16 v25 = 2112;
    if (!a6) {
      uint64_t v15 = @"NONE";
    }
    __int16 v27 = 2112;
    uint64_t v28 = v14;
    __int16 v29 = 2112;
    __int16 v30 = v16;
    __int16 v31 = 2112;
    uint64_t v32 = v15;
    _os_log_impl( &dword_1879D2000,  v12,  OS_LOG_TYPE_DEFAULT,  "[SPI] %@ | BEGIN | source_path:%@, options:%@, fncallback:%@, context:%@",  (uint8_t *)&v23,  0x34u);
  }

  if (a2) {
    uint64_t Value = (void *)CFDictionaryGetValue(a2, @"__msu-update-attributes-dictionary-key");
  }
  else {
    uint64_t Value = 0LL;
  }
  uint64_t v18 = perform_prepare_command(a1, a2, Value, a3, a4, a5, a6);
  int v19 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
  uint64_t v20 = v19;
  if ((_DWORD)v18)
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      if (a3) {
        uint64_t v21 = *a3;
      }
      else {
        uint64_t v21 = -1LL;
      }
      int v23 = 138412546;
      uint64_t v24 = @"MSUPrepareUpdate";
      __int16 v25 = 2048;
      uint64_t v26 = v21;
      _os_log_impl( &dword_1879D2000,  v20,  OS_LOG_TYPE_DEFAULT,  "[SPI] %@ | SUCCESS | session:%ld",  (uint8_t *)&v23,  0x16u);
    }
  }

  else if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    MSUPrepareUpdate_cold_1();
  }

  return v18;
}

__CFDictionary *copyDictionaryAddingLocale(CFDictionaryRef theDict, const void *a2, const void *a3)
{
  CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, theDict);
  BOOL v6 = MutableCopy;
  if (a2)
  {
    if (MutableCopy)
    {
      CFDictionarySetValue(MutableCopy, @"CurrentLanguageCode", a2);
      if (a3) {
        CFDictionarySetValue(v6, @"CurrentExpandedLanguageCode", a3);
      }
    }
  }

  return v6;
}

uint64_t MSUApplyUpdate(uint64_t a1, const __CFDictionary *a2, const __CFString **a3, uint64_t a4, uint64_t a5)
{
  uint64_t v41 = *MEMORY[0x1895F89C0];
  uint64_t valuePtr = a1;
  uint64_t v9 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = [MEMORY[0x189603F68] safeSummaryForDictionary:a2];
    uint64_t v11 = @"SPECIFIED";
    *(_DWORD *)buf = 138413314;
    uint64_t v32 = @"MSUApplyUpdate";
    __int16 v33 = 2048;
    if (a4) {
      uint64_t v12 = @"SPECIFIED";
    }
    else {
      uint64_t v12 = @"NONE";
    }
    uint64_t v34 = a1;
    __int16 v35 = 2112;
    if (!a5) {
      uint64_t v11 = @"NONE";
    }
    uint64_t v36 = v10;
    __int16 v37 = 2112;
    uint64_t v38 = v12;
    __int16 v39 = 2112;
    v40 = v11;
    _os_log_impl( &dword_1879D2000,  v9,  OS_LOG_TYPE_DEFAULT,  "[SPI] %@ | BEGIN | session:%ld, options:%@, fncallback:%@, context:%@",  buf,  0x34u);
  }

  uint64_t v13 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  CFNumberRef v14 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x189604DB0], kCFNumberLongType, &valuePtr);
  Mutable = CFDictionaryCreateMutable(v13, 0LL, MEMORY[0x189605240], MEMORY[0x189605250]);
  uint64_t v16 = [MEMORY[0x189603F90] _deviceLanguage];
  uint64_t v17 = objc_msgSend((id)objc_msgSend(MEMORY[0x189603F90], "currentLocale"), "languageCode");
  if (v17)
  {
    uint64_t v18 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v32 = @"MSUApplyUpdate";
      __int16 v33 = 2112;
      uint64_t v34 = v17;
      __int16 v35 = 2112;
      uint64_t v36 = v16;
      _os_log_impl( &dword_1879D2000,  v18,  OS_LOG_TYPE_DEFAULT,  "[SPI] %@ | Current Locale: %@ ExpandedLanguageCode: %@",  buf,  0x20u);
    }
  }

  CFDictionarySetValue(Mutable, @"SessionHandle", v14);
  if (a2)
  {
    int v19 = copyDictionaryAddingLocale(a2, (const void *)v17, (const void *)v16);
    CFDictionarySetValue(Mutable, @"ClientOptions", v19);
    CFRelease(v19);
    uint64_t Value = (__CFDictionary *)CFDictionaryGetValue(a2, @"__msu-update-attributes-dictionary-key");
    goto LABEL_21;
  }

  if (!(v17 | v16))
  {
    uint64_t Value = 0LL;
    goto LABEL_21;
  }

  uint64_t v21 = CFDictionaryCreateMutable(v13, 0LL, MEMORY[0x189605240], MEMORY[0x189605250]);
  uint64_t Value = v21;
  if (!v21)
  {
LABEL_21:
    unint64_t v22 = 0x189612000uLL;
    goto LABEL_22;
  }

  unint64_t v22 = 0x189612000LL;
  if (v17) {
    CFDictionaryAddValue(v21, @"CurrentLanguageCode", (const void *)v17);
  }
  if (v16) {
    CFDictionaryAddValue(Value, @"CurrentExpandedLanguageCode", (const void *)v16);
  }
  CFDictionarySetValue(Mutable, @"ClientOptions", Value);
  CFRelease(Value);
  uint64_t Value = 0LL;
LABEL_22:
  CFDictionarySetValue(Mutable, @"ClientRepliesToProgress", (const void *)*MEMORY[0x189604DE8]);
  int v23 = (os_log_s *)objc_msgSend((id)objc_msgSend(*(id *)(v22 + 1952), "sharedLogger"), "oslog");
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v32 = @"MSUApplyUpdate";
    _os_log_impl( &dword_1879D2000,  v23,  OS_LOG_TYPE_DEFAULT,  "[SPI] %@ | PERFORM_WITH_PROGRESS | ApplyUpdate...",  buf,  0xCu);
  }

  v29[0] = MEMORY[0x1895F87A8];
  v29[1] = 3221225472LL;
  v29[2] = __MSUApplyUpdate_block_invoke;
  v29[3] = &unk_18A0EB348;
  v29[5] = a4;
  v29[6] = a5;
  v29[4] = @"MSUApplyUpdate";
  uint64_t v24 = perform_command_with_progress("ApplyUpdate", Mutable, Value, 0LL, a3, (uint64_t)v29);
  CFRelease(v14);
  CFRelease(Mutable);
  __int16 v25 = (os_log_s *)objc_msgSend((id)objc_msgSend(*(id *)(v22 + 1952), "sharedLogger"), "oslog");
  uint64_t v26 = v25;
  if ((_DWORD)v24)
  {
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v32 = @"MSUApplyUpdate";
      _os_log_impl(&dword_1879D2000, v26, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | SUCCESS", buf, 0xCu);
    }
  }

  else if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    MSUApplyUpdate_cold_1();
  }

  return v24;
}

uint64_t __MSUApplyUpdate_block_invoke(void *a1, uint64_t a2)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  char v4 = (uint64_t (*)(uint64_t, void))a1[5];
  if (v4)
  {
    uint64_t v5 = v4(a2, a1[6]);
    BOOL v6 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = a1[4];
      if ((_DWORD)v5 == -1)
      {
        uint64_t v8 = @"ClientSendError";
      }

      else if ((_DWORD)v5 == 2)
      {
        uint64_t v8 = @"Cancel";
      }

      else if ((_DWORD)v5)
      {
        uint64_t v8 = (const __CFString *)objc_msgSend(NSString, "stringWithFormat:", @"MSUOperation(%d)", v5);
      }

      else
      {
        uint64_t v8 = @"Continue";
      }

      *(_DWORD *)buf = 138412802;
      uint64_t v13 = v7;
      __int16 v14 = 2112;
      uint64_t v15 = v8;
      __int16 v16 = 2112;
      uint64_t v17 = a2;
      _os_log_impl( &dword_1879D2000,  v6,  OS_LOG_TYPE_DEFAULT,  "[SPI] %@ | ApplyUpdate | PROGRESS (%@) | state:%@",  buf,  0x20u);
    }
  }

  else
  {
    uint64_t v9 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
    uint64_t v5 = 0LL;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = a1[4];
      *(_DWORD *)buf = 138412802;
      uint64_t v13 = v10;
      __int16 v14 = 2112;
      uint64_t v15 = @"Continue";
      __int16 v16 = 2112;
      uint64_t v17 = a2;
      _os_log_impl( &dword_1879D2000,  v9,  OS_LOG_TYPE_DEFAULT,  "[SPI] %@ | ApplyUpdate | PROGRESS (no progress handler - %@) | state:%@",  buf,  0x20u);
      return 0LL;
    }
  }

  return v5;
}

uint64_t MSUSuspendUpdate(uint64_t a1, CFTypeRef *a2)
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  uint64_t valuePtr = a1;
  char v4 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    __int16 v16 = @"MSUSuspendUpdate";
    __int16 v17 = 2048;
    uint64_t v18 = a1;
    _os_log_impl(&dword_1879D2000, v4, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | BEGIN | session:%ld", buf, 0x16u);
  }

  uint64_t v5 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  CFNumberRef v6 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x189604DB0], kCFNumberLongType, &valuePtr);
  values = v6;
  keys = @"SessionHandle";
  CFDictionaryRef v7 = CFDictionaryCreate( v5,  (const void **)&keys,  (const void **)&values,  1LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
  uint64_t v8 = perform_command("SuspendUpdate", v7, 0LL, 0LL, a2);
  CFRelease(v6);
  CFRelease(v7);
  uint64_t v9 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
  uint64_t v10 = v9;
  if ((_DWORD)v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      __int16 v16 = @"MSUSuspendUpdate";
      _os_log_impl(&dword_1879D2000, v10, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | SUCCESS", buf, 0xCu);
    }
  }

  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    MSUSuspendUpdate_cold_1();
  }

  return v8;
}

uint64_t MSUResumeUpdate(void *a1, CFTypeRef *a2)
{
  return MSUResumeUpdateWithOptions(0LL, a1, a2);
}

uint64_t MSUResumeUpdateWithOptions(const __CFDictionary *a1, void *a2, CFTypeRef *a3)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  CFNumberRef number = 0LL;
  CFNumberRef v6 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    __int16 v14 = @"MSUResumeUpdateWithOptions";
    __int16 v15 = 2112;
    uint64_t v16 = [MEMORY[0x189603F68] safeSummaryForDictionary:a1];
    _os_log_impl(&dword_1879D2000, v6, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | BEGIN | options:%@", buf, 0x16u);
  }

  if (a1) {
    uint64_t Value = (void *)CFDictionaryGetValue(a1, @"__msu-update-attributes-dictionary-key");
  }
  else {
    uint64_t Value = 0LL;
  }
  uint64_t v8 = perform_command("ResumeUpdate", a1, Value, (const __CFString **)&number, a3);
  if ((_DWORD)v8)
  {
    CFNumberGetValue(number, kCFNumberLongType, a2);
    uint64_t v9 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      if (a2) {
        uint64_t v10 = *a2;
      }
      else {
        uint64_t v10 = -1LL;
      }
      *(_DWORD *)buf = 138412546;
      __int16 v14 = @"MSUResumeUpdateWithOptions";
      __int16 v15 = 2048;
      uint64_t v16 = v10;
      _os_log_impl(&dword_1879D2000, v9, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | SUCCESS | session:%ld", buf, 0x16u);
    }
  }

  else if (os_log_type_enabled( (os_log_t)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog"),  OS_LOG_TYPE_ERROR))
  {
    MSUResumeUpdateWithOptions_cold_1();
  }

  if (number) {
    CFRelease(number);
  }
  return v8;
}

BOOL MSUBrainIsLoadable(void *a1, CFTypeRef *a2)
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  char v4 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 138412546;
    uint64_t v24 = @"MSUBrainIsLoadable";
    __int16 v25 = 2112;
    uint64_t v26 = [MEMORY[0x189603F68] safeSummaryForDictionary:a1];
    _os_log_impl( &dword_1879D2000,  v4,  OS_LOG_TYPE_DEFAULT,  "[SPI] %@ | BEGIN | assetAttributes:%@",  (uint8_t *)&v23,  0x16u);
  }

  if (!a1)
  {
    CFDictionaryRef v7 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
    BOOL result = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    MSUBrainIsLoadable_cold_1(v7, v8, v9, v10, v11, v12, v13, v14);
    return 0LL;
  }

  if (!perform_command("BrainIsLoadable", 0LL, a1, 0LL, a2))
  {
    if (a2)
    {
      CFTypeRef v15 = *a2;
      uint64_t v16 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
      uint64_t v17 = v16;
      if (v15)
      {
        BOOL result = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
        if (!result) {
          return result;
        }
        MSUBrainIsLoadable_cold_2();
        return 0LL;
      }

      BOOL v22 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
      BOOL result = 0LL;
      if (!v22) {
        return result;
      }
      int v23 = 138412290;
      uint64_t v24 = @"MSUBrainIsLoadable";
      uint64_t v20 = "[SPI] %@ | SUCCESS | Brain not loadable";
      uint64_t v21 = v17;
    }

    else
    {
      uint64_t v18 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
      BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
      BOOL result = 0LL;
      if (!v19) {
        return result;
      }
      int v23 = 138412290;
      uint64_t v24 = @"MSUBrainIsLoadable";
      uint64_t v20 = "[SPI] %@ | DONE | Brain not loadable";
      uint64_t v21 = v18;
    }

    _os_log_impl(&dword_1879D2000, v21, OS_LOG_TYPE_DEFAULT, v20, (uint8_t *)&v23, 0xCu);
    return 0LL;
  }

  uint64_t v5 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 138412290;
    uint64_t v24 = @"MSUBrainIsLoadable";
    _os_log_impl( &dword_1879D2000,  v5,  OS_LOG_TYPE_DEFAULT,  "[SPI] %@ | SUCCESS | Brain loadable",  (uint8_t *)&v23,  0xCu);
  }

  return 1LL;
}

uint64_t MSUPurgeSuspendedUpdate(CFTypeRef *a1)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  CFTypeID v2 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    uint64_t v8 = @"MSUPurgeSuspendedUpdate";
    _os_log_impl(&dword_1879D2000, v2, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | BEGIN", (uint8_t *)&v7, 0xCu);
  }

  uint64_t v3 = perform_command("PurgeSuspendedUpdate", 0LL, 0LL, 0LL, a1);
  char v4 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
  uint64_t v5 = v4;
  if ((_DWORD)v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      uint64_t v8 = @"MSUPurgeSuspendedUpdate";
      _os_log_impl(&dword_1879D2000, v5, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | SUCCESS", (uint8_t *)&v7, 0xCu);
    }
  }

  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    MSUPurgeSuspendedUpdate_cold_1();
  }

  return v3;
}

void MSUCloseUpdateHandle()
{
  CFStringRef v0 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    MSUCloseUpdateHandle_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
  }
}

BOOL MSUAssetCalculateInstallationSize(void *a1, uint64_t *a2, CFTypeRef *a3)
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  uint64_t v19 = 0LL;
  uint64_t v20 = 0LL;
  uint64_t v6 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    BOOL v22 = @"MSUAssetCalculateInstallationSize";
    __int16 v23 = 2112;
    uint64_t v24 = [MEMORY[0x189603F68] safeSummaryForDictionary:a1];
    _os_log_impl(&dword_1879D2000, v6, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | BEGIN | assetprops:%@", buf, 0x16u);
  }

  if (!a1)
  {
    uint64_t v11 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
    BOOL result = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    MSUAssetCalculateInstallationSize_cold_1(v11, v12, v13, v14, v15, v16, v17, v18);
    return 0LL;
  }

  if (!MSUAssetCalculatePrepareSizes(a1, &v20, 0LL, a3)
    || !MSUAssetCalculateApplySizes(a1, &v19, 0LL, a3))
  {
    BOOL result = os_log_type_enabled( (os_log_t)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog"),  OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    MSUAssetCalculateInstallationSize_cold_2();
    return 0LL;
  }

  uint64_t v7 = v19 + v20;
  if (a2)
  {
    *a2 = v7;
    uint64_t v8 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      BOOL v22 = @"MSUAssetCalculateInstallationSize";
      __int16 v23 = 2048;
      uint64_t v24 = v7;
      uint64_t v9 = "[SPI] %@ | SUCCESS | installation size:%llu bytes";
LABEL_16:
      _os_log_impl(&dword_1879D2000, v8, OS_LOG_TYPE_DEFAULT, v9, buf, 0x16u);
    }
  }

  else
  {
    uint64_t v8 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      BOOL v22 = @"MSUAssetCalculateInstallationSize";
      __int16 v23 = 2048;
      uint64_t v24 = v7;
      uint64_t v9 = "[SPI] %@ | SUCCESS | installation size:%llu bytes (not returned - no output location)";
      goto LABEL_16;
    }
  }

  return 1LL;
}

uint64_t MSUAssetCalculatePrepareSize(void *a1, uint64_t *a2, CFTypeRef *a3)
{
  return MSUAssetCalculatePrepareSizes(a1, a2, 0LL, a3);
}

uint64_t MSUAssetCalculateApplySize(void *a1, uint64_t *a2, CFTypeRef *a3)
{
  return MSUAssetCalculateApplySizes(a1, a2, 0LL, a3);
}

uint64_t MSUAssetCalculatePrepareSizes(void *a1, uint64_t *a2, uint64_t *a3, CFTypeRef *a4)
{
  uint64_t v41 = *MEMORY[0x1895F89C0];
  uint64_t v33 = 0LL;
  uint64_t valuePtr = 0LL;
  CFTypeRef cf = 0LL;
  uint64_t v8 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v38 = @"MSUAssetCalculatePrepareSize";
    __int16 v39 = 2112;
    uint64_t v40 = [MEMORY[0x189603F68] safeSummaryForDictionary:a1];
    _os_log_impl(&dword_1879D2000, v8, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | BEGIN | assetprops:%@", buf, 0x16u);
  }

  if (!a1)
  {
    CFErrorRef error_internal_cf = _create_error_internal_cf( @"MobileSoftwareUpdateErrorDomain",  9LL,  0LL,  0LL,  @"No asset properties provided",  v9,  v10,  v11,  v31);
    if (!a4)
    {
      CFRelease(error_internal_cf);
      uint64_t v21 = 0LL;
      CFDictionaryRef v12 = 0LL;
      goto LABEL_24;
    }

    uint64_t v21 = 0LL;
    CFDictionaryRef v12 = 0LL;
    goto LABEL_21;
  }

  values = a1;
  keys = @"AssetProperties";
  CFDictionaryRef v12 = CFDictionaryCreate( (CFAllocatorRef)*MEMORY[0x189604DB0],  (const void **)&keys,  (const void **)&values,  1LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
  if (!perform_command("CalculatePrepareSize", v12, 0LL, (const __CFString **)&cf, a4))
  {
LABEL_23:
    uint64_t v21 = 0LL;
    goto LABEL_24;
  }

  if (!cf || (CFTypeID v16 = CFGetTypeID(cf), v16 != CFDictionaryGetTypeID()))
  {
    __int16 v23 = @"No prepare sizes dictionary in response";
LABEL_19:
    CFErrorRef error_internal_cf = _create_error_internal_cf( @"MobileSoftwareUpdateErrorDomain",  7LL,  0LL,  0LL,  v23,  v13,  v14,  v15,  v31);
    if (a4)
    {
      uint64_t v21 = 0LL;
LABEL_21:
      *a4 = error_internal_cf;
      goto LABEL_24;
    }

    CFRelease(error_internal_cf);
    goto LABEL_23;
  }

  uint64_t Value = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)cf, @"Size");
  CFNumberGetValue(Value, kCFNumberSInt64Type, &valuePtr);
  if (a2) {
    *a2 = valuePtr;
  }
  uint64_t v18 = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)cf, @"SnapshotSize");
  if (!v18 || (uint64_t v19 = v18, v20 = CFGetTypeID(v18), v20 != CFNumberGetTypeID()))
  {
    __int16 v23 = @"No snapshot prepare size in response";
    goto LABEL_19;
  }

  CFNumberGetValue(v19, kCFNumberSInt64Type, &v33);
  if (a3) {
    *a3 = v33;
  }
  uint64_t v21 = 1LL;
LABEL_24:
  if (cf)
  {
    CFRelease(cf);
    CFTypeRef cf = 0LL;
  }

  if (v12) {
    CFRelease(v12);
  }
  if (!(_DWORD)v21)
  {
    if (os_log_type_enabled( (os_log_t)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog"),  OS_LOG_TYPE_ERROR))
    {
      MSUAssetCalculatePrepareSizes_cold_1();
    }

    return v21;
  }

  uint64_t v24 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
  BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (!v25) {
      goto LABEL_37;
    }
    *(_DWORD *)buf = 138412546;
    uint64_t v38 = @"MSUAssetCalculatePrepareSize";
    __int16 v39 = 2048;
    uint64_t v40 = valuePtr;
    uint64_t v26 = "[SPI] %@ | SUCCESS | prepare size:%llu bytes";
  }

  else
  {
    if (!v25) {
      goto LABEL_37;
    }
    *(_DWORD *)buf = 138412546;
    uint64_t v38 = @"MSUAssetCalculatePrepareSize";
    __int16 v39 = 2048;
    uint64_t v40 = valuePtr;
    uint64_t v26 = "[SPI] %@ | SUCCESS | prepare size:%llu bytes (not returned - no output location)";
  }

  _os_log_impl(&dword_1879D2000, v24, OS_LOG_TYPE_DEFAULT, v26, buf, 0x16u);
LABEL_37:
  uint64_t v27 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
  BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
  if (a3)
  {
    if (v28)
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v38 = @"MSUAssetCalculatePrepareSize";
      __int16 v39 = 2048;
      uint64_t v40 = v33;
      __int16 v29 = "[SPI] %@ | SUCCESS | snapshot prepare size:%llu bytes";
LABEL_42:
      _os_log_impl(&dword_1879D2000, v27, OS_LOG_TYPE_DEFAULT, v29, buf, 0x16u);
    }
  }

  else if (v28)
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v38 = @"MSUAssetCalculatePrepareSize";
    __int16 v39 = 2048;
    uint64_t v40 = v33;
    __int16 v29 = "[SPI] %@ | SUCCESS | snapshot prepare size:%llu bytes (not returned - no output location)";
    goto LABEL_42;
  }

  return v21;
}

uint64_t MSUAssetCalculateApplySizes(void *a1, uint64_t *a2, void *a3, CFTypeRef *a4)
{
  uint64_t v38 = *MEMORY[0x1895F89C0];
  uint64_t v30 = 0LL;
  uint64_t valuePtr = 0LL;
  CFTypeRef cf = 0LL;
  uint64_t v8 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    __int16 v35 = @"MSUAssetCalculateApplySize";
    __int16 v36 = 2112;
    uint64_t v37 = [MEMORY[0x189603F68] safeSummaryForDictionary:a1];
    _os_log_impl(&dword_1879D2000, v8, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | BEGIN | assetprops:%@", buf, 0x16u);
  }

  if (!a1)
  {
    CFErrorRef error_internal_cf = _create_error_internal_cf( @"MobileSoftwareUpdateErrorDomain",  9LL,  0LL,  0LL,  @"No asset properties provided",  v9,  v10,  v11,  v28);
    if (!a4)
    {
      CFRelease(error_internal_cf);
      uint64_t v21 = 0LL;
      CFDictionaryRef v12 = 0LL;
      goto LABEL_24;
    }

    uint64_t v21 = 0LL;
    CFDictionaryRef v12 = 0LL;
    goto LABEL_21;
  }

  values = a1;
  keys = @"AssetProperties";
  CFDictionaryRef v12 = CFDictionaryCreate( (CFAllocatorRef)*MEMORY[0x189604DB0],  (const void **)&keys,  (const void **)&values,  1LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
  if (!perform_command("CalculateApplySize", v12, 0LL, (const __CFString **)&cf, a4))
  {
LABEL_23:
    uint64_t v21 = 0LL;
    goto LABEL_24;
  }

  if (!cf || (CFTypeID v16 = CFGetTypeID(cf), v16 != CFDictionaryGetTypeID()))
  {
    __int16 v23 = @"No apply sizes dictionary in response";
LABEL_19:
    CFErrorRef error_internal_cf = _create_error_internal_cf( @"MobileSoftwareUpdateErrorDomain",  7LL,  0LL,  0LL,  v23,  v13,  v14,  v15,  v28);
    if (a4)
    {
      uint64_t v21 = 0LL;
LABEL_21:
      *a4 = error_internal_cf;
      goto LABEL_24;
    }

    CFRelease(error_internal_cf);
    goto LABEL_23;
  }

  uint64_t Value = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)cf, @"Size");
  CFNumberGetValue(Value, kCFNumberSInt64Type, &valuePtr);
  if (a2) {
    *a2 = valuePtr;
  }
  uint64_t v18 = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)cf, @"SnapshotSize");
  if (!v18 || (uint64_t v19 = v18, v20 = CFGetTypeID(v18), v20 != CFNumberGetTypeID()))
  {
    __int16 v23 = @"No snapshot apply size in response";
    goto LABEL_19;
  }

  CFNumberGetValue(v19, kCFNumberSInt64Type, &v30);
  if (a3) {
    *a3 = v30;
  }
  uint64_t v21 = 1LL;
LABEL_24:
  if (cf)
  {
    CFRelease(cf);
    CFTypeRef cf = 0LL;
  }

  if (v12) {
    CFRelease(v12);
  }
  if ((_DWORD)v21)
  {
    uint64_t v24 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
    BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
    if (a2)
    {
      if (v25)
      {
        *(_DWORD *)buf = 138412546;
        __int16 v35 = @"MSUAssetCalculateApplySize";
        __int16 v36 = 2048;
        uint64_t v37 = valuePtr;
        uint64_t v26 = "[SPI] %@ | SUCCESS | apply size:%llu bytes";
LABEL_36:
        _os_log_impl(&dword_1879D2000, v24, OS_LOG_TYPE_DEFAULT, v26, buf, 0x16u);
      }
    }

    else if (v25)
    {
      *(_DWORD *)buf = 138412546;
      __int16 v35 = @"MSUAssetCalculateApplySize";
      __int16 v36 = 2048;
      uint64_t v37 = valuePtr;
      uint64_t v26 = "[SPI] %@ | SUCCESS | apply size:%llu bytes (not returned - no output location)";
      goto LABEL_36;
    }
  }

  else if (os_log_type_enabled( (os_log_t)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog"),  OS_LOG_TYPE_ERROR))
  {
    MSUAssetCalculateApplySizes_cold_1();
  }

  return v21;
}

uint64_t MSUCheckPreparationSize(void *a1, uint64_t *a2, CFTypeRef *a3)
{
  uint64_t v41 = *MEMORY[0x1895F89C0];
  CFTypeRef cf = 0LL;
  uint64_t valuePtr = 0LL;
  CFTypeRef v33 = 0LL;
  uint64_t v34 = 0LL;
  uint64_t v6 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v38 = @"MSUAssetCalculateApplySize";
    __int16 v39 = 2112;
    uint64_t v40 = [MEMORY[0x189603F68] safeSummaryForDictionary:a1];
    _os_log_impl(&dword_1879D2000, v6, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | BEGIN | assetprops:%@", buf, 0x16u);
  }

  if (!a1)
  {
    BOOL v25 = @"No asset properties provided";
    CFIndex v26 = 9LL;
LABEL_19:
    CFTypeRef v27 = 0LL;
    goto LABEL_20;
  }

  if ((MSUAssetCalculatePrepareSizes(a1, &valuePtr, 0LL, &v33) & 1) == 0)
  {
    CFTypeRef v27 = v33;
    BOOL v25 = @"MSUAssetCalculatePrepareSize failed";
    CFIndex v26 = 7LL;
LABEL_20:
    CFErrorRef error_internal_cf = _create_error_internal_cf( @"MobileSoftwareUpdateErrorDomain",  v26,  v27,  0LL,  v25,  v7,  v8,  v9,  (char)v33);
    if (a3)
    {
      uint64_t v23 = 0LL;
      uint64_t v11 = 0LL;
LABEL_22:
      CFNumberRef v16 = 0LL;
LABEL_23:
      *a3 = error_internal_cf;
      goto LABEL_26;
    }

    CFRelease(error_internal_cf);
    uint64_t v23 = 0LL;
    uint64_t v11 = 0LL;
LABEL_25:
    CFNumberRef v16 = 0LL;
    goto LABEL_26;
  }

  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
  if (!Mutable)
  {
    BOOL v25 = @"Failed to allocate command_options";
    CFIndex v26 = 14LL;
    goto LABEL_19;
  }

  uint64_t v11 = Mutable;
  CFNumberRef v12 = CFNumberCreate(0LL, kCFNumberSInt64Type, &valuePtr);
  if (!v12)
  {
    CFErrorRef error_internal_cf = _create_error_internal_cf( @"MobileSoftwareUpdateErrorDomain",  14LL,  0LL,  0LL,  @"Failed to allocate requiredPrepSize_cf",  v13,  v14,  v15,  (char)v33);
    if (a3)
    {
      uint64_t v23 = 0LL;
      goto LABEL_22;
    }

    CFRelease(error_internal_cf);
    uint64_t v23 = 0LL;
    goto LABEL_25;
  }

  CFNumberRef v16 = v12;
  CFDictionarySetValue(v11, @"ClientOptions", v12);
  if (!perform_command("CheckPreparationSize", v11, 0LL, (const __CFString **)&cf, a3))
  {
LABEL_51:
    uint64_t v23 = 0LL;
    goto LABEL_26;
  }

  if (!cf || (CFTypeID v20 = CFGetTypeID(cf), v20 != CFDictionaryGetTypeID()))
  {
    uint64_t v32 = @"No results dict in response";
LABEL_47:
    CFErrorRef error_internal_cf = _create_error_internal_cf( @"MobileSoftwareUpdateErrorDomain",  7LL,  0LL,  0LL,  v32,  v17,  v18,  v19,  (char)v33);
    if (a3) {
      goto LABEL_48;
    }
    CFRelease(error_internal_cf);
    goto LABEL_51;
  }

  uint64_t Value = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)cf, @"RequiredSize");
  if (!Value)
  {
    uint64_t v32 = @"No prep size in response";
    goto LABEL_47;
  }

  CFNumberGetValue(Value, kCFNumberSInt64Type, &v34);
  if (a2) {
    *a2 = v34;
  }
  BOOL v22 = CFDictionaryGetValue((CFDictionaryRef)cf, @"ErrorInfo");
  uint64_t v23 = 1LL;
  if (a3 && v22)
  {
    CFErrorRef error_internal_cf = copy_dictionary_to_cferror(v22);
LABEL_48:
    uint64_t v23 = 0LL;
    goto LABEL_23;
  }

LABEL_26:
  if (v33)
  {
    CFRelease(v33);
    CFTypeRef v33 = 0LL;
  }

  if (v11) {
    CFRelease(v11);
  }
  if (v16) {
    CFRelease(v16);
  }
  if (cf)
  {
    CFRelease(cf);
    CFTypeRef cf = 0LL;
  }

  if ((_DWORD)v23)
  {
    char v28 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
    BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);
    if (a2)
    {
      if (v29)
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v38 = @"MSUAssetCalculateApplySize";
        __int16 v39 = 2048;
        uint64_t v40 = v34;
        uint64_t v30 = "[SPI] %@ | SUCCESS | required size:%llu bytes";
LABEL_42:
        _os_log_impl(&dword_1879D2000, v28, OS_LOG_TYPE_DEFAULT, v30, buf, 0x16u);
      }
    }

    else if (v29)
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v38 = @"MSUAssetCalculateApplySize";
      __int16 v39 = 2048;
      uint64_t v40 = v34;
      uint64_t v30 = "[SPI] %@ | SUCCESS | required size:%llu bytes (not returned - no output location)";
      goto LABEL_42;
    }
  }

  else if (os_log_type_enabled( (os_log_t)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog"),  OS_LOG_TYPE_ERROR))
  {
    MSUAssetCalculateApplySizes_cold_1();
  }

  return v23;
}

uint64_t MSUCheckInstallationSize(void *a1, uint64_t *a2, CFTypeRef *a3)
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  uint64_t v25 = 0LL;
  CFTypeRef cf = 0LL;
  uint64_t v6 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v30 = @"MSUCheckInstallationSize";
    __int16 v31 = 2112;
    uint64_t v32 = [MEMORY[0x189603F68] safeSummaryForDictionary:a1];
    _os_log_impl(&dword_1879D2000, v6, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | BEGIN | assetprops:%@", buf, 0x16u);
  }

  if (a1)
  {
    values = a1;
    keys = @"AssetProperties";
    CFDictionaryRef v10 = CFDictionaryCreate( (CFAllocatorRef)*MEMORY[0x189604DB0],  (const void **)&keys,  (const void **)&values,  1LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
    if (perform_command("CheckInstallationSize", v10, 0LL, (const __CFString **)&cf, a3))
    {
      if (cf && (CFTypeID v14 = CFGetTypeID(cf), v14 == CFDictionaryGetTypeID()))
      {
        uint64_t Value = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)cf, @"RequiredSize");
        if (Value)
        {
          CFNumberGetValue(Value, kCFNumberSInt64Type, &v25);
          if (a2) {
            *a2 = v25;
          }
          CFNumberRef v16 = CFDictionaryGetValue((CFDictionaryRef)cf, @"ErrorInfo");
          uint64_t v17 = 1LL;
          if (!a3 || !v16)
          {
LABEL_18:
            if (!v10) {
              goto LABEL_24;
            }
LABEL_23:
            CFRelease(v10);
            goto LABEL_24;
          }

          CFErrorRef error_internal_cf = copy_dictionary_to_cferror(v16);
LABEL_17:
          uint64_t v17 = 0LL;
          *a3 = error_internal_cf;
          goto LABEL_18;
        }

        CFTypeID v20 = @"No apply size in response";
      }

      else
      {
        CFTypeID v20 = @"No results dict in response";
      }

      CFErrorRef error_internal_cf = _create_error_internal_cf( @"MobileSoftwareUpdateErrorDomain",  7LL,  0LL,  0LL,  v20,  v11,  v12,  v13,  v25);
      if (a3) {
        goto LABEL_17;
      }
      CFRelease(error_internal_cf);
    }

    uint64_t v17 = 0LL;
    if (!v10) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }

  CFErrorRef v19 = _create_error_internal_cf( @"MobileSoftwareUpdateErrorDomain",  9LL,  0LL,  0LL,  @"No asset properties provided",  v7,  v8,  v9,  v25);
  if (a3)
  {
    uint64_t v17 = 0LL;
    *a3 = v19;
  }

  else
  {
    CFRelease(v19);
    uint64_t v17 = 0LL;
  }

LABEL_24:
  if (cf)
  {
    CFRelease(cf);
    CFTypeRef cf = 0LL;
  }

  if ((_DWORD)v17)
  {
    uint64_t v21 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
    if (a2)
    {
      if (v22)
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v30 = @"MSUCheckInstallationSize";
        __int16 v31 = 2048;
        uint64_t v32 = v25;
        uint64_t v23 = "[SPI] %@ | SUCCESS | required size:%llu bytes";
LABEL_34:
        _os_log_impl(&dword_1879D2000, v21, OS_LOG_TYPE_DEFAULT, v23, buf, 0x16u);
      }
    }

    else if (v22)
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v30 = @"MSUCheckInstallationSize";
      __int16 v31 = 2048;
      uint64_t v32 = v25;
      uint64_t v23 = "[SPI] %@ | SUCCESS | required size:%llu bytes (not returned - no output location)";
      goto LABEL_34;
    }
  }

  else if (os_log_type_enabled( (os_log_t)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog"),  OS_LOG_TYPE_ERROR))
  {
    MSUCheckInstallationSize_cold_1();
  }

  return v17;
}

uint64_t MSURetrievePreviousUpdateResults(const __CFString **a1)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  CFTypeRef cf = 0LL;
  CFTypeRef v11 = 0LL;
  uint64_t v2 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v13 = @"MSURetrievePreviousUpdateResults";
    _os_log_impl(&dword_1879D2000, v2, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | BEGIN", buf, 0xCu);
  }

  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
  uint64_t v4 = perform_command("RetrieveLastUpdateResult", Mutable, 0LL, (const __CFString **)&cf, &v11);
  if ((_DWORD)v4 && cf)
  {
    CFTypeID v5 = CFGetTypeID(cf);
    CFTypeID TypeID = CFDictionaryGetTypeID();
    if (a1 && v5 == TypeID) {
      *a1 = copy_dictionary_to_cferror(cf);
    }
    CFRelease(cf);
  }

  if (Mutable) {
    CFRelease(Mutable);
  }
  uint64_t v7 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
  uint64_t v8 = v7;
  if ((_DWORD)v4)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v13 = @"MSURetrievePreviousUpdateResults";
      _os_log_impl(&dword_1879D2000, v8, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | SUCCESS", buf, 0xCu);
    }
  }

  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    MSURetrievePreviousUpdateResults_cold_1();
  }

  if (v11) {
    CFRelease(v11);
  }
  return v4;
}

uint64_t MSURetrievePreviousUpdateState(_DWORD *a1)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  CFTypeRef cf = 0LL;
  CFTypeRef v13 = 0LL;
  uint64_t v2 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v15 = @"MSURetrievePreviousUpdateState";
    _os_log_impl(&dword_1879D2000, v2, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | BEGIN", buf, 0xCu);
  }

  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
  uint64_t v4 = perform_command("RetrievePreviousUpdateState", Mutable, 0LL, (const __CFString **)&cf, &v13);
  if (!(_DWORD)v4 || !cf)
  {
    uint64_t v7 = 0LL;
    if (!Mutable) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }

  CFTypeID v5 = CFGetTypeID(cf);
  if (v5 == CFNumberGetTypeID())
  {
    uint64_t v6 = [(id)cf intValue];
    uint64_t v7 = v6;
    if (a1) {
      *a1 = v6;
    }
  }

  else
  {
    uint64_t v7 = 0LL;
  }

  CFRelease(cf);
  if (Mutable) {
LABEL_9:
  }
    CFRelease(Mutable);
LABEL_10:
  uint64_t v8 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
  uint64_t v9 = v8;
  if ((_DWORD)v4)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      if (v7 >= 4) {
        CFDictionaryRef v10 = (__CFString *)objc_msgSend( NSString,  "stringWithFormat:",  @"MSUPreviousUpdateState(%d)",  v7);
      }
      else {
        CFDictionaryRef v10 = off_18A0EB3E8[(int)v7];
      }
      *(_DWORD *)buf = 138412546;
      uint64_t v15 = @"MSURetrievePreviousUpdateState";
      __int16 v16 = 2112;
      uint64_t v17 = v10;
      _os_log_impl( &dword_1879D2000,  v9,  OS_LOG_TYPE_DEFAULT,  "[SPI] %@ | SUCCESS | previous update state:%@",  buf,  0x16u);
    }
  }

  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    MSURetrievePreviousUpdateState_cold_1();
  }

  if (v13) {
    CFRelease(v13);
  }
  return v4;
}

id MSUCopyPreviousUpdateAllToleratedFailures()
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  CFStringRef v0 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    uint64_t v6 = @"MSUCopyPreviousUpdateAllToleratedFailures";
    _os_log_impl(&dword_1879D2000, v0, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | BEGIN", (uint8_t *)&v5, 0xCu);
  }

  id v1 = copyPreviousToleratedFailures(1);
  uint64_t v2 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [MEMORY[0x189603F68] safeSummaryForDictionary:v1];
    int v5 = 138412546;
    uint64_t v6 = @"MSUCopyPreviousUpdateAllToleratedFailures";
    __int16 v7 = 2112;
    uint64_t v8 = v3;
    _os_log_impl( &dword_1879D2000,  v2,  OS_LOG_TYPE_DEFAULT,  "[SPI] %@ | DONE | toleratedFailures:%@",  (uint8_t *)&v5,  0x16u);
  }

  return v1;
}

id copyPreviousToleratedFailures(int a1)
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  if (!a1)
  {
    uint64_t v6 = (void *)[MEMORY[0x189603F68] dictionaryWithContentsOfFile:@"/private/var/MobileSoftwareUpdate/lastOTA/ota_tolerated_failures.plist"];
    uint64_t v17 = 0LL;
    uint64_t v18 = (uint64_t)&v17;
    uint64_t v19 = 0x3052000000LL;
    CFTypeID v20 = __Block_byref_object_copy_;
    uint64_t v21 = __Block_byref_object_dispose_;
    id v22 = 0LL;
    uint64_t v23 = 0LL;
    uint64_t v24 = &v23;
    uint64_t v25 = 0x3052000000LL;
    CFIndex v26 = __Block_byref_object_copy_;
    CFTypeRef v27 = __Block_byref_object_dispose_;
    uint64_t v28 = 0LL;
    uint64_t v7 = MEMORY[0x1895F87A8];
    v16[0] = MEMORY[0x1895F87A8];
    v16[1] = 3221225472LL;
    v16[2] = __retrieve_previous_update_first_tolerated_failure_block_invoke;
    v16[3] = &unk_18A0EB370;
    v16[4] = &v17;
    v16[5] = &v23;
    [v6 enumerateKeysAndObjectsUsingBlock:v16];
    uint64_t v8 = *(void **)(v18 + 40);
    if (v8)
    {
      BOOL v9 = 0;
    }

    else
    {
      v15[0] = v7;
      v15[1] = 3221225472LL;
      v15[2] = __retrieve_previous_update_first_tolerated_failure_block_invoke_2;
      v15[3] = &unk_18A0EB370;
      v15[4] = &v17;
      v15[5] = &v23;
      [v6 enumerateKeysAndObjectsUsingBlock:v15];
      uint64_t v8 = *(void **)(v18 + 40);
      BOOL v9 = v8 != 0LL;
      if (!v8) {
        goto LABEL_13;
      }
    }

    uint64_t v10 = objc_msgSend( (id)objc_msgSend(v8, "objectForKeyedSubscript:", @"StepName"),  "compare:",  @"update_baseband");
    CFTypeRef v11 = kMSUUpdateToleratedStepValueUpdateBaseband;
    if (v10) {
      CFTypeRef v11 = kMSUUpdateToleratedStepValueUnrecognizedStep;
    }
    uint64_t v12 = *v11;
    if (*v11)
    {
      id v3 = objc_alloc_init(MEMORY[0x189603FC8]);
      [v3 setObject:v12 forKeyedSubscript:@"StepIdentifier"];
      objc_msgSend( v3,  "setObject:forKeyedSubscript:",  objc_msgSend(*(id *)(v18 + 40), "objectForKeyedSubscript:", @"StepName"),  @"StepName");
      objc_msgSend( v3,  "setObject:forKeyedSubscript:",  objc_msgSend(*(id *)(v18 + 40), "objectForKeyedSubscript:", v24[5]),  @"EventUnique");
      if (v9)
      {
        [v3 setObject:MEMORY[0x189604A88] forKeyedSubscript:@"RebootRetry"];
        objc_msgSend( v3,  "setObject:forKeyedSubscript:",  objc_msgSend(*(id *)(v18 + 40), "objectForKeyedSubscript:", @"RetryFailureNumber"),  @"FailureNumber");
        objc_msgSend( v3,  "setObject:forKeyedSubscript:",  objc_msgSend(*(id *)(v18 + 40), "objectForKeyedSubscript:", @"RetryResult"),  @"Result");
        objc_msgSend( v3,  "setObject:forKeyedSubscript:",  objc_msgSend(*(id *)(v18 + 40), "objectForKeyedSubscript:", @"RetryError"),  @"Error");
        CFTypeRef v13 = @"RetrySkipped";
      }

      else
      {
        [v3 setObject:MEMORY[0x189604A80] forKeyedSubscript:@"RebootRetry"];
        objc_msgSend( v3,  "setObject:forKeyedSubscript:",  objc_msgSend(*(id *)(v18 + 40), "objectForKeyedSubscript:", @"InitialFailureNumber"),  @"FailureNumber");
        objc_msgSend( v3,  "setObject:forKeyedSubscript:",  objc_msgSend(*(id *)(v18 + 40), "objectForKeyedSubscript:", @"InitialResult"),  @"Result");
        objc_msgSend( v3,  "setObject:forKeyedSubscript:",  objc_msgSend(*(id *)(v18 + 40), "objectForKeyedSubscript:", @"InitialError"),  @"Error");
        CFTypeRef v13 = @"InitialSkipped";
      }

      objc_msgSend( v3,  "setObject:forKeyedSubscript:",  objc_msgSend(*(id *)(v18 + 40), "objectForKeyedSubscript:", v13),  @"Skipped");
      goto LABEL_16;
    }

LABEL_13:
    id v3 = 0LL;
LABEL_16:
    _Block_object_dispose(&v23, 8);
    _Block_object_dispose(&v17, 8);
    return v3;
  }

  uint64_t v1 = [MEMORY[0x189603F68] dictionaryWithContentsOfFile:@"/private/var/MobileSoftwareUpdate/lastOTA/ota_tolerated_failures.plist"];
  if (!v1) {
    return 0LL;
  }
  uint64_t v2 = (void *)v1;
  id v3 = objc_alloc_init(MEMORY[0x189603FC8]);
  id v4 = objc_alloc_init(MEMORY[0x189603FA8]);
  uint64_t v17 = MEMORY[0x1895F87A8];
  uint64_t v18 = 3221225472LL;
  uint64_t v19 = (uint64_t)__retrieve_previous_update_all_tolerated_failures_block_invoke;
  CFTypeID v20 = (void (*)(uint64_t, uint64_t))&unk_18A0EB398;
  uint64_t v21 = (void (*)(uint64_t))@"retrieve_previous_update_all_tolerated_failures";
  id v22 = v4;
  [v2 enumerateKeysAndObjectsUsingBlock:&v17];
  int v5 = (void *)[objc_alloc(MEMORY[0x189607A20]) initWithKey:@"Index" ascending:1];
  uint64_t v23 = v5;
  objc_msgSend( v3,  "setObject:forKeyedSubscript:",  objc_msgSend( v4,  "sortedArrayUsingDescriptors:",  objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:count:", &v23, 1)),  @"toleratedStepsArray");

  return v3;
}

void sub_1879D956C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
}

id MSURetrievePreviousUpdateFirstToleratedFailure()
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  CFStringRef v0 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    uint64_t v6 = @"MSURetrievePreviousUpdateFirstToleratedFailure";
    _os_log_impl(&dword_1879D2000, v0, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | BEGIN", (uint8_t *)&v5, 0xCu);
  }

  id v1 = copyPreviousToleratedFailures(0);
  uint64_t v2 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [MEMORY[0x189603F68] safeSummaryForDictionary:v1];
    int v5 = 138412546;
    uint64_t v6 = @"MSURetrievePreviousUpdateFirstToleratedFailure";
    __int16 v7 = 2112;
    uint64_t v8 = v3;
    _os_log_impl( &dword_1879D2000,  v2,  OS_LOG_TYPE_DEFAULT,  "[SPI] %@ | DONE | toleratedFailures:%@",  (uint8_t *)&v5,  0x16u);
  }

  return v1;
}

id MSUCopyToleratedStatusForStep(const __CFString *a1)
{
  uint64_t v46 = *MEMORY[0x1895F89C0];
  uint64_t v2 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = @"NONE";
    if (a1) {
      uint64_t v3 = a1;
    }
    *(_DWORD *)buf = 138412546;
    uint64_t v43 = @"MSUCopyToleratedStatusForStep";
    __int16 v44 = 2112;
    v45 = v3;
    _os_log_impl(&dword_1879D2000, v2, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | BEGIN | step:%@", buf, 0x16u);
  }

  if (a1)
  {
    id updated = MSUCopyPreviousUpdateAllToleratedFailures();
    if (updated)
    {
      int v5 = updated;
      uint64_t v6 = objc_msgSend((id)objc_msgSend(updated, "objectForKey:", @"toleratedStepsArray"), "mutableCopy");
      if (v6)
      {
        __int16 v7 = (void *)v6;
        uint64_t v8 = (void *)[MEMORY[0x189607938] indexSet];
        __int128 v37 = 0u;
        __int128 v38 = 0u;
        __int128 v39 = 0u;
        __int128 v40 = 0u;
        uint64_t v9 = [v7 countByEnumeratingWithState:&v37 objects:v41 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = 0LL;
          uint64_t v12 = *(void *)v38;
          do
          {
            uint64_t v13 = 0LL;
            do
            {
              if (*(void *)v38 != v12) {
                objc_enumerationMutation(v7);
              }
              if ((objc_msgSend( (id)objc_msgSend( *(id *)(*((void *)&v37 + 1) + 8 * v13),  "objectForKeyedSubscript:",  @"CheckPoint"),  "isEqualToString:",  a1) & 1) == 0) {
                [v8 addIndex:v11 + v13];
              }
              ++v13;
            }

            while (v10 != v13);
            uint64_t v10 = [v7 countByEnumeratingWithState:&v37 objects:v41 count:16];
            v11 += v13;
          }

          while (v10);
        }

        [v7 removeObjectsAtIndexes:v8];
        if ([v7 count])
        {
          id v14 = objc_alloc_init(MEMORY[0x189603FC8]);
          if (v14)
          {
            id v15 = v14;
            [v14 setObject:v7 forKeyedSubscript:@"toleratedStepsArray"];
            __int16 v16 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v43 = @"MSUCopyToleratedStatusForStep";
              _os_log_impl( &dword_1879D2000,  v16,  OS_LOG_TYPE_DEFAULT,  "[SPI] %@ | SUCCESS | providing tolerated failure array",  buf,  0xCu);
            }

            goto LABEL_34;
          }

          uint64_t v28 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
            MSUCopyToleratedStatusForStep_cold_2(v28, v29, v30, v31, v32, v33, v34, v35);
          }
        }

        else
        {
          CFTypeRef v27 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v43 = @"MSUCopyToleratedStatusForStep";
            _os_log_impl( &dword_1879D2000,  v27,  OS_LOG_TYPE_DEFAULT,  "[SPI] %@ | SUCCESS | empty failure array",  buf,  0xCu);
          }
        }

        id v15 = 0LL;
LABEL_34:
        CFRelease(v5);
        CFRelease(v7);
        return v15;
      }

      CFIndex v26 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v43 = @"MSUCopyToleratedStatusForStep";
        _os_log_impl( &dword_1879D2000,  v26,  OS_LOG_TYPE_DEFAULT,  "[SPI] %@ | SUCCESS | No tolerated failure array",  buf,  0xCu);
      }

      CFRelease(v5);
    }

    else
    {
      uint64_t v25 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v43 = @"MSUCopyToleratedStatusForStep";
        _os_log_impl( &dword_1879D2000,  v25,  OS_LOG_TYPE_DEFAULT,  "[SPI] %@ | SUCCESS | No tolerated failures found",  buf,  0xCu);
      }
    }
  }

  else
  {
    uint64_t v17 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      MSUCopyToleratedStatusForStep_cold_1(v17, v18, v19, v20, v21, v22, v23, v24);
    }
  }

  return 0LL;
}

uint64_t MSUParsedToleratedFailureForStep(const __CFString *a1)
{
  uint64_t v43 = *MEMORY[0x1895F89C0];
  uint64_t v2 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = @"NONE";
    if (a1) {
      uint64_t v3 = a1;
    }
    *(_DWORD *)buf = 138412546;
    __int128 v40 = @"MSUParsedToleratedFailureForStep";
    __int16 v41 = 2112;
    v42 = v3;
    _os_log_impl(&dword_1879D2000, v2, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | BEGIN | step:%@", buf, 0x16u);
  }

  if (a1)
  {
    id v4 = MSUCopyToleratedStatusForStep(a1);
    if (v4)
    {
      CFTypeRef cf = v4;
      int v5 = (void *)[v4 objectForKey:@"toleratedStepsArray"];
      __int128 v34 = 0u;
      __int128 v35 = 0u;
      __int128 v36 = 0u;
      __int128 v37 = 0u;
      uint64_t v6 = [v5 countByEnumeratingWithState:&v34 objects:v38 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v35;
        while (2)
        {
          for (uint64_t i = 0LL; i != v7; ++i)
          {
            if (*(void *)v35 != v8) {
              objc_enumerationMutation(v5);
            }
            uint64_t v10 = *(void **)(*((void *)&v34 + 1) + 8 * i);
            uint64_t v11 = (void *)[v10 objectForKeyedSubscript:@"Attempt"];
            int v12 = objc_msgSend((id)objc_msgSend(v10, "objectForKeyedSubscript:", @"rcode"), "intValue");
            if ([v11 isEqualToString:@"initial"])
            {
              uint64_t v13 = v12 != 0;
            }

            else
            {
              if (![v11 isEqualToString:@"reboot-retry"])
              {
                id v14 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
                if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
                  MSUParsedToleratedFailureForStep_cold_2(v14, v15, v16, v17, v18, v19, v20, v21);
                }
                CFRelease(cf);
                goto LABEL_23;
              }

              uint64_t v13 = 2 * (v12 != 0);
            }
          }

          uint64_t v7 = [v5 countByEnumeratingWithState:&v34 objects:v38 count:16];
          if (v7) {
            continue;
          }
          break;
        }
      }

      else
      {
        uint64_t v13 = 0LL;
      }

      CFRelease(cf);
    }

    else
    {
      uint64_t v13 = 0LL;
    }

    uint64_t v30 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      if (v13 >= 3) {
        uint64_t v31 = (__CFString *)objc_msgSend( NSString,  "stringWithFormat:",  @"MSUToleratedFailureStatus(%d)",  v13);
      }
      else {
        uint64_t v31 = off_18A0EB408[v13];
      }
      *(_DWORD *)buf = 138412546;
      __int128 v40 = @"MSUParsedToleratedFailureForStep";
      __int16 v41 = 2112;
      v42 = v31;
      _os_log_impl( &dword_1879D2000,  v30,  OS_LOG_TYPE_DEFAULT,  "[SPI] %@ | SUCCESS | Tolerated failure status:%@",  buf,  0x16u);
    }
  }

  else
  {
LABEL_23:
    uint64_t v22 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      MSUParsedToleratedFailureForStep_cold_1(v22, v23, v24, v25, v26, v27, v28, v29);
    }
    return 3LL;
  }

  return v13;
}

BOOL MSUDidLastUpdateBasebandTolerateFailure()
{
  return MSUParsedToleratedFailureForStep(@"update_baseband") != 0;
}

uint64_t MSUIsFirstBootAfterUpdate(_BYTE *a1)
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  CFTypeRef cf = 0LL;
  CFTypeRef v14 = 0LL;
  uint64_t v2 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v16 = @"MSUIsFirstBootAfterUpdate";
    _os_log_impl(&dword_1879D2000, v2, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | BEGIN", buf, 0xCu);
  }

  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
  uint64_t v4 = perform_command("IsFirstBootAfterUpdate", Mutable, 0LL, (const __CFString **)&cf, &v14);
  if (!(_DWORD)v4 || !cf)
  {
    int v8 = 0;
    if (!Mutable) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }

  CFTypeID v5 = CFGetTypeID(cf);
  if (v5 == CFNumberGetTypeID() || (CFTypeID v6 = CFGetTypeID(cf), v6 == CFBooleanGetTypeID()))
  {
    int v7 = [(id)cf BOOLValue];
    int v8 = v7;
    if (a1) {
      *a1 = v7;
    }
  }

  else
  {
    int v8 = 0;
  }

  CFRelease(cf);
  if (Mutable) {
LABEL_10:
  }
    CFRelease(Mutable);
LABEL_11:
  uint64_t v9 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
  uint64_t v10 = v9;
  if ((_DWORD)v4)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = @"NO";
      if (v8) {
        uint64_t v11 = @"YES";
      }
      *(_DWORD *)buf = 138412546;
      uint64_t v16 = @"MSUIsFirstBootAfterUpdate";
      __int16 v17 = 2112;
      uint64_t v18 = v11;
      _os_log_impl( &dword_1879D2000,  v10,  OS_LOG_TYPE_DEFAULT,  "[SPI] %@ | SUCCESS | first boot after update:%@",  buf,  0x16u);
    }
  }

  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    MSUIsFirstBootAfterUpdate_cold_1();
  }

  if (v14) {
    CFRelease(v14);
  }
  return v4;
}

uint64_t MSURetrievePreviousUpdateDate(CFTypeRef *a1)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  CFTypeRef cf = 0LL;
  CFTypeRef v10 = 0LL;
  uint64_t v2 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    int v12 = @"MSURetrievePreviousUpdateDate";
    _os_log_impl(&dword_1879D2000, v2, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | BEGIN", buf, 0xCu);
  }

  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
  uint64_t v4 = perform_command("RetrievePreviousUpdateDate", Mutable, 0LL, (const __CFString **)&cf, &v10);
  if (!(_DWORD)v4 || !cf || (CFTypeID v5 = CFGetTypeID(cf), v5 != CFDateGetTypeID()))
  {
LABEL_8:
    if (!Mutable) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }

  if (a1)
  {
    *a1 = cf;
    goto LABEL_8;
  }

  CFRelease(cf);
  if (Mutable) {
LABEL_9:
  }
    CFRelease(Mutable);
LABEL_10:
  CFTypeID v6 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
  int v7 = v6;
  if ((_DWORD)v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      int v12 = @"MSURetrievePreviousUpdateDate";
      __int16 v13 = 2112;
      CFTypeRef v14 = cf;
      _os_log_impl( &dword_1879D2000,  v7,  OS_LOG_TYPE_DEFAULT,  "[SPI] %@ | SUCCESS | previous update date:%@",  buf,  0x16u);
    }
  }

  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    MSURetrievePreviousUpdateDate_cold_1();
  }

  if (v10) {
    CFRelease(v10);
  }
  return v4;
}

uint64_t MSURetrievePreviousRestoreDate(CFTypeRef *a1)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  CFTypeRef cf = 0LL;
  CFTypeRef v10 = 0LL;
  uint64_t v2 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    int v12 = @"MSURetrievePreviousRestoreDate";
    _os_log_impl(&dword_1879D2000, v2, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | BEGIN", buf, 0xCu);
  }

  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
  uint64_t v4 = perform_command("RetrievePreviousRestoreDate", Mutable, 0LL, (const __CFString **)&cf, &v10);
  if (!(_DWORD)v4 || !cf || (CFTypeID v5 = CFGetTypeID(cf), v5 != CFDateGetTypeID()))
  {
LABEL_8:
    if (!Mutable) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }

  if (a1)
  {
    *a1 = cf;
    goto LABEL_8;
  }

  CFRelease(cf);
  if (Mutable) {
LABEL_9:
  }
    CFRelease(Mutable);
LABEL_10:
  CFTypeID v6 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
  int v7 = v6;
  if ((_DWORD)v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      int v12 = @"MSURetrievePreviousRestoreDate";
      __int16 v13 = 2112;
      CFTypeRef v14 = cf;
      _os_log_impl( &dword_1879D2000,  v7,  OS_LOG_TYPE_DEFAULT,  "[SPI] %@ | SUCCESS | previous restore date:%@",  buf,  0x16u);
    }
  }

  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    MSURetrievePreviousRestoreDate_cold_1();
  }

  if (v10) {
    CFRelease(v10);
  }
  return v4;
}

uint64_t MSUCopyEnvInfoForNeRD()
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  CFStringRef v0 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v16 = @"MSUCopyEnvInfoForNeRD";
    _os_log_impl(&dword_1879D2000, v0, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | BEGIN", buf, 0xCu);
  }

  id v1 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"%s/%s/%s",  "/private/var/MobileSoftwareUpdate/",  "Controller/NeRD",  "BootedOSState.plist");
  uint64_t v2 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v16 = @"MSUCopyEnvInfoForNeRD";
    __int16 v17 = 2112;
    uint64_t v18 = (uint64_t)v1;
    _os_log_impl( &dword_1879D2000,  v2,  OS_LOG_TYPE_DEFAULT,  "[SPI] %@ | Attempting to load bootedOS state from %@",  buf,  0x16u);
  }

  uint64_t v3 = [objc_alloc(MEMORY[0x189603F68]) initWithContentsOfFile:v1];

  uint64_t v4 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
  CFTypeID v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = [MEMORY[0x189603F68] safeSummaryForDictionary:v3];
      *(_DWORD *)buf = 138412546;
      uint64_t v16 = @"MSUCopyEnvInfoForNeRD";
      __int16 v17 = 2112;
      uint64_t v18 = v6;
      _os_log_impl(&dword_1879D2000, v5, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | SUCCESS | envDict:%@", buf, 0x16u);
    }
  }

  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    MSUCopyEnvInfoForNeRD_cold_1(v5, v7, v8, v9, v10, v11, v12, v13);
  }

  return v3;
}

CFTypeRef MSUCopyConnectivityData()
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  CFTypeRef cf = 0LL;
  CFTypeRef v23 = 0LL;
  CFStringRef v0 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v25 = @"MSUCopyConnectivityData";
    _os_log_impl(&dword_1879D2000, v0, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | BEGIN", buf, 0xCu);
  }

  if ((perform_command("GetStashedConnectivityData", 0LL, 0LL, (const __CFString **)&cf, &v23) & 1) == 0)
  {
    if (os_log_type_enabled( (os_log_t)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog"),  OS_LOG_TYPE_ERROR))
    {
      MSUCopyConnectivityData_cold_3();
    }

    goto LABEL_14;
  }

  if (!cf)
  {
    CFTypeID v5 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      MSUCopyConnectivityData_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
    goto LABEL_14;
  }

  CFTypeID v1 = CFGetTypeID(cf);
  if (v1 != CFDictionaryGetTypeID())
  {
    uint64_t v13 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      MSUCopyConnectivityData_cold_2(v13, v14, v15, v16, v17, v18, v19, v20);
    }
LABEL_14:
    CFTypeRef v2 = 0LL;
    goto LABEL_15;
  }

  CFTypeRef v2 = cf;
  uint64_t v3 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [MEMORY[0x189603F68] safeSummaryForDictionary:v2];
    *(_DWORD *)buf = 138412546;
    uint64_t v25 = @"MSUCopyConnectivityData";
    __int16 v26 = 2112;
    uint64_t v27 = v4;
    _os_log_impl(&dword_1879D2000, v3, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | SUCCESS | connectivityData:%@", buf, 0x16u);
  }

LABEL_15:
  if (v23) {
    CFRelease(v23);
  }
  return v2;
}

BOOL MSUReportAndCleanupPreviousUpdateState()
{
  uint64_t v37 = *MEMORY[0x1895F89C0];
  CFTypeRef cf = 0LL;
  CFTypeRef v32 = 0LL;
  CFStringRef v0 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    __int128 v34 = @"MSUReportAndCleanupPreviousUpdateState";
    _os_log_impl(&dword_1879D2000, v0, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | BEGIN", buf, 0xCu);
  }

  if ((perform_command("PerformReportAndCleanup", 0LL, 0LL, (const __CFString **)&cf, &v32) & 1) == 0)
  {
    uint64_t v6 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      MSUReportAndCleanupPreviousUpdateState_cold_3(v6, v7, v8, v9, v10, v11, v12, v13);
    }
    goto LABEL_16;
  }

  if (!cf)
  {
    uint64_t v14 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      MSUReportAndCleanupPreviousUpdateState_cold_1(v14, v15, v16, v17, v18, v19, v20, v21);
    }
    goto LABEL_16;
  }

  CFTypeID v1 = CFGetTypeID(cf);
  if (v1 != CFBooleanGetTypeID())
  {
    uint64_t v22 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      MSUReportAndCleanupPreviousUpdateState_cold_2(v22, v23, v24, v25, v26, v27, v28, v29);
    }
LABEL_16:
    BOOL v3 = 0LL;
    goto LABEL_17;
  }

  int Value = CFBooleanGetValue((CFBooleanRef)cf);
  BOOL v3 = Value != 0;
  uint64_t v4 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    CFTypeID v5 = @"NO";
    if (Value) {
      CFTypeID v5 = @"YES";
    }
    *(_DWORD *)buf = 138412546;
    __int128 v34 = @"MSUReportAndCleanupPreviousUpdateState";
    __int16 v35 = 2112;
    __int128 v36 = v5;
    _os_log_impl( &dword_1879D2000,  v4,  OS_LOG_TYPE_DEFAULT,  "[SPI] %@ | SUCCESS | perform cleanup command response value:%@",  buf,  0x16u);
  }

uint64_t MSUCopyInstalledRecoveryOSVersion()
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  CFStringRef v0 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v24 = @"MSUCopyInstalledRecoveryOSVersion";
    _os_log_impl(&dword_1879D2000, v0, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | BEGIN", buf, 0xCu);
  }

  uint64_t v1 = objc_msgSend( NSString,  "stringWithFormat:",  @"/var/MobileSoftwareUpdate/%s",  "recoveryOSVersion.plist");
  if (!v1)
  {
    uint64_t v6 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      MSUCopyInstalledRecoveryOSVersion_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
    return 0LL;
  }

  CFTypeRef v2 = (void *)[objc_alloc(MEMORY[0x189603F68]) initWithContentsOfFile:v1];
  if (!v2)
  {
    uint64_t v14 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      MSUCopyInstalledRecoveryOSVersion_cold_2(v14, v15, v16, v17, v18, v19, v20, v21);
    }
    return 0LL;
  }

  BOOL v3 = v2;
  uint64_t v4 = objc_msgSend( objc_alloc(NSString),  "initWithString:",  objc_msgSend(v2, "objectForKeyedSubscript:", @"BuildNumber"));
  CFTypeID v5 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v24 = @"MSUCopyInstalledRecoveryOSVersion";
    __int16 v25 = 2112;
    uint64_t v26 = v4;
    _os_log_impl( &dword_1879D2000,  v5,  OS_LOG_TYPE_DEFAULT,  "[SPI] %@ | SUCCESS | Installed recovery OS version:%@",  buf,  0x16u);
  }

  CFRelease(v3);
  return v4;
}

uint64_t RVGetNeRDInfo()
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  CFStringRef v0 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v14 = @"RVGetNeRDInfo";
    _os_log_impl(&dword_1879D2000, v0, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | BEGIN", buf, 0xCu);
  }

  uint64_t v1 = objc_msgSend( NSString,  "stringWithFormat:",  @"/var/MobileSoftwareUpdate/%s",  "recoveryOSVersion.plist");
  uint64_t v2 = [objc_alloc(MEMORY[0x189603F68]) initWithContentsOfFile:v1];
  BOOL v3 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
  uint64_t v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v14 = @"RVGetNeRDInfo";
      _os_log_impl(&dword_1879D2000, v4, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | SUCCESS", buf, 0xCu);
    }
  }

  else if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    RVGetNeRDInfo_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
  }

  return v2;
}

uint64_t RVTriggerNeRDUpdate(void *a1)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  uint64_t v2 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    uint64_t v9 = @"RVTriggerNeRDUpdate";
    _os_log_impl(&dword_1879D2000, v2, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | BEGIN", (uint8_t *)&v8, 0xCu);
  }

  uint64_t v3 = perform_command("RVTriggerNeRDUpdate", a1, 0LL, 0LL, 0LL);
  uint64_t v4 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if ((_DWORD)v3)
  {
    if (v5)
    {
      int v8 = 138412290;
      uint64_t v9 = @"RVTriggerNeRDUpdate";
      uint64_t v6 = "[SPI] %@ | SUCCESS";
LABEL_8:
      _os_log_impl(&dword_1879D2000, v4, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v8, 0xCu);
    }
  }

  else if (v5)
  {
    int v8 = 138412290;
    uint64_t v9 = @"RVTriggerNeRDUpdate";
    uint64_t v6 = "[SPI] %@ | FAILURE";
    goto LABEL_8;
  }

  return v3;
}

CFTypeRef MSUGetUpdateInfo(const __CFString *a1, void *a2)
{
  uint64_t v40 = *MEMORY[0x1895F89C0];
  CFTypeRef cf = 0LL;
  CFTypeRef v33 = 0LL;
  uint64_t v4 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if (a1) {
      BOOL v5 = a1;
    }
    else {
      BOOL v5 = @"NONE";
    }
    *(_DWORD *)buf = 138412802;
    __int16 v35 = @"MSUGetUpdateInfo";
    __int16 v36 = 2112;
    uint64_t v37 = (uint64_t)v5;
    __int16 v38 = 2112;
    uint64_t v39 = [MEMORY[0x189603F68] safeSummaryForDictionary:a2];
    _os_log_impl(&dword_1879D2000, v4, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | BEGIN | targetUUID:%@, options:%@", buf, 0x20u);
  }

  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
  uint64_t v7 = Mutable;
  if (a1) {
    CFDictionarySetValue(Mutable, @"TargetUUID", a1);
  }
  if (!a2)
  {
    uint64_t v9 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_16;
    }
    *(_DWORD *)buf = 138412290;
    __int16 v35 = @"MSUGetUpdateInfo";
    uint64_t v10 = "[SPI] %@ | No options in the updateInfo request";
    goto LABEL_15;
  }

  int v8 = (const void *)[a2 objectForKeyedSubscript:@"AssetProperties"];
  if (v8)
  {
    CFDictionarySetValue(v7, @"AssetProperties", v8);
    goto LABEL_16;
  }

  uint64_t v9 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    __int16 v35 = @"MSUGetUpdateInfo";
    uint64_t v10 = "[SPI] %@ | No kAssetProperties in the updateInfo request";
LABEL_15:
    _os_log_impl(&dword_1879D2000, v9, OS_LOG_TYPE_DEFAULT, v10, buf, 0xCu);
  }

LABEL_16:
  if ((perform_command("GetUpdateInformation", v7, 0LL, (const __CFString **)&cf, &v33) & 1) == 0)
  {
    if (os_log_type_enabled( (os_log_t)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog"),  OS_LOG_TYPE_ERROR))
    {
      MSUGetUpdateInfo_cold_3();
    }

    goto LABEL_27;
  }

  if (!cf)
  {
    uint64_t v15 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      MSUGetUpdateInfo_cold_1(v15, v16, v17, v18, v19, v20, v21, v22);
    }
    goto LABEL_27;
  }

  CFTypeID v11 = CFGetTypeID(cf);
  if (v11 != CFDictionaryGetTypeID())
  {
    uint64_t v23 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      MSUGetUpdateInfo_cold_2(v23, v24, v25, v26, v27, v28, v29, v30);
    }
LABEL_27:
    CFTypeRef v12 = 0LL;
    goto LABEL_28;
  }

  CFTypeRef v12 = cf;
  uint64_t v13 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = [MEMORY[0x189603F68] safeSummaryForDictionary:v12];
    *(_DWORD *)buf = 138412546;
    __int16 v35 = @"MSUGetUpdateInfo";
    __int16 v36 = 2112;
    uint64_t v37 = v14;
    _os_log_impl(&dword_1879D2000, v13, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | SUCCESS | update info:%@", buf, 0x16u);
  }

        uint64_t v17 = 0LL;
        if (!v8)
        {
LABEL_18:
          if (v14) {
            xpc_release(v14);
          }
          xpc_release(v7);
          return v17;
        }

LABEL_28:
  if (v7) {
    CFRelease(v7);
  }
  if (v33) {
    CFRelease(v33);
  }
  return v12;
}

uint64_t MSUCommitStash(void *Value, const void **a2)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  CFTypeRef cf = 0LL;
  CFTypeRef v19 = 0LL;
  uint64_t v4 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v21 = @"MSUCommitStash";
    _os_log_impl(&dword_1879D2000, v4, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | BEGIN", buf, 0xCu);
  }

  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
  uint64_t v6 = Mutable;
  if (Value)
  {
    CFDictionarySetValue(Mutable, @"ClientOptions", Value);
    int Value = (void *)CFDictionaryGetValue((CFDictionaryRef)Value, @"__msu-update-attributes-dictionary-key");
    if (Value) {
      CFDictionarySetValue(v6, @"AssetProperties", Value);
    }
  }

  if ((perform_command("CommitStash", v6, Value, (const __CFString **)&cf, &v19) & 1) == 0)
  {
    uint64_t v10 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_22;
    }
    *(_DWORD *)buf = 138412546;
    uint64_t v21 = @"MSUCommitStash";
    __int16 v22 = 2112;
    CFTypeRef v23 = v19;
    CFTypeID v11 = "[SPI] %@ | FAILURE | Failed to perform kCommandCommitStash command with error: %@";
    CFTypeRef v12 = v10;
    uint32_t v13 = 22;
    goto LABEL_21;
  }

  if (!cf)
  {
    uint64_t v14 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_22;
    }
    *(_DWORD *)buf = 138412290;
    uint64_t v21 = @"MSUCommitStash";
    CFTypeID v11 = "[SPI] %@ | FAILURE | NULL response from kCommandCommitStash command";
    goto LABEL_20;
  }

  CFTypeID v7 = CFGetTypeID(cf);
  if (v7 == CFDictionaryGetTypeID())
  {
    if (a2) {
      *a2 = copy_dictionary_to_cferror(cf);
    }
    int v8 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v21 = @"MSUCommitStash";
      _os_log_impl(&dword_1879D2000, v8, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | SUCCESS", buf, 0xCu);
    }

    uint64_t v9 = 1LL;
    goto LABEL_31;
  }

  uint64_t v14 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v21 = @"MSUCommitStash";
    CFTypeID v11 = "[SPI] %@ | FAILURE | Unexpected response type to kCommandCommitStash command";
LABEL_20:
    CFTypeRef v12 = v14;
    uint32_t v13 = 12;
LABEL_21:
    _os_log_impl(&dword_1879D2000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
  }

LABEL_22:
  if (a2 && !*a2 && v19) {
    *a2 = CFRetain(v19);
  }
  uint64_t v15 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
  uint64_t v9 = 0LL;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    if (a2) {
      uint64_t v16 = *a2;
    }
    else {
      uint64_t v16 = 0LL;
    }
    *(_DWORD *)buf = 138412546;
    uint64_t v21 = @"MSUCommitStash";
    __int16 v22 = 2112;
    CFTypeRef v23 = v16;
    _os_log_impl(&dword_1879D2000, v15, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | FAILURE | Failed with error: %@", buf, 0x16u);
    uint64_t v9 = 0LL;
  }

LABEL_31:
  if (v6) {
    CFRelease(v6);
  }
  if (v19) {
    CFRelease(v19);
  }
  return v9;
}

BOOL MSUPerformSemiSplat(const void *a1, CFTypeRef *a2)
{
  uint64_t v44 = *MEMORY[0x1895F89C0];
  CFTypeRef cf = 0LL;
  CFTypeRef v39 = 0LL;
  uint64_t v4 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    __int16 v41 = @"MSUPerformSemiSplat";
    _os_log_impl(&dword_1879D2000, v4, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | BEGIN", buf, 0xCu);
  }

  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
  uint64_t v6 = Mutable;
  if (a1) {
    CFDictionarySetValue(Mutable, @"TargetVolume", a1);
  }
  if ((perform_command("PerformCryptegraftSemiSplat", v6, 0LL, (const __CFString **)&cf, &v39) & 1) == 0)
  {
    CFTypeRef v12 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      MSUPerformSemiSplat_cold_3(v12, v13, v14, v15, v16, v17, v18, v19);
    }
    goto LABEL_18;
  }

  if (!cf)
  {
    uint64_t v20 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      MSUPerformSemiSplat_cold_1(v20, v21, v22, v23, v24, v25, v26, v27);
    }
    goto LABEL_18;
  }

  CFTypeID v7 = CFGetTypeID(cf);
  if (v7 != CFBooleanGetTypeID())
  {
    uint64_t v28 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      MSUPerformSemiSplat_cold_2(v28, v29, v30, v31, v32, v33, v34, v35);
    }
LABEL_18:
    BOOL v9 = 0LL;
    goto LABEL_19;
  }

  int Value = CFBooleanGetValue((CFBooleanRef)cf);
  BOOL v9 = Value != 0;
  uint64_t v10 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    CFTypeID v11 = @"NO";
    if (Value) {
      CFTypeID v11 = @"YES";
    }
    *(_DWORD *)buf = 138412546;
    __int16 v41 = @"MSUPerformSemiSplat";
    __int16 v42 = 2112;
    uint64_t v43 = v11;
    _os_log_impl( &dword_1879D2000,  v10,  OS_LOG_TYPE_DEFAULT,  "[SPI] %@ | SUCCESS | cryptegraft SemiSplat command response value:%@",  buf,  0x16u);
  }

LABEL_19:
  CFTypeRef v36 = v39;
  if (a2 && v39)
  {
    *a2 = CFRetain(v39);
    CFTypeRef v36 = v39;
  }

  if (v36)
  {
    CFRelease(v36);
    CFTypeRef v39 = 0LL;
  }

  if (cf) {
    CFRelease(cf);
  }
  return v9;
}

BOOL MSUPerformDownlevel(const void *a1, const void *a2, CFTypeRef *a3)
{
  uint64_t v38 = *MEMORY[0x1895F89C0];
  CFTypeRef cf = 0LL;
  CFTypeRef v33 = 0LL;
  uint64_t v6 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v35 = @"MSUPerformDownlevel";
    _os_log_impl(&dword_1879D2000, v6, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | BEGIN", buf, 0xCu);
  }

  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
  int v8 = Mutable;
  if (a1) {
    CFDictionarySetValue(Mutable, @"TargetVolume", a1);
  }
  if (a2) {
    CFDictionarySetValue(v8, @"SourcePath", a2);
  }
  if ((perform_command("PerformCryptegraftDownlevel", v8, 0LL, (const __CFString **)&cf, &v33) & 1) == 0)
  {
    if (os_log_type_enabled( (os_log_t)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog"),  OS_LOG_TYPE_ERROR))
    {
      MSUPerformDownlevel_cold_3();
    }

    goto LABEL_20;
  }

  if (!cf)
  {
    uint64_t v14 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      MSUPerformDownlevel_cold_1(v14, v15, v16, v17, v18, v19, v20, v21);
    }
    goto LABEL_20;
  }

  CFTypeID v9 = CFGetTypeID(cf);
  if (v9 != CFBooleanGetTypeID())
  {
    uint64_t v22 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      MSUPerformDownlevel_cold_2(v22, v23, v24, v25, v26, v27, v28, v29);
    }
LABEL_20:
    BOOL v11 = 0LL;
    goto LABEL_21;
  }

  int Value = CFBooleanGetValue((CFBooleanRef)cf);
  BOOL v11 = Value != 0;
  CFTypeRef v12 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = @"NO";
    if (Value) {
      uint64_t v13 = @"YES";
    }
    *(_DWORD *)buf = 138412546;
    uint64_t v35 = @"MSUPerformDownlevel";
    __int16 v36 = 2112;
    uint64_t v37 = v13;
    _os_log_impl( &dword_1879D2000,  v12,  OS_LOG_TYPE_DEFAULT,  "[SPI] %@ | SUCCESS | cryptegraft downlevel command response value:%@",  buf,  0x16u);
  }

LABEL_21:
  CFTypeRef v30 = v33;
  if (a3 && v33)
  {
    *a3 = CFRetain(v33);
    CFTypeRef v30 = v33;
  }

  if (v30)
  {
    CFRelease(v30);
    CFTypeRef v33 = 0LL;
  }

  if (cf) {
    CFRelease(cf);
  }
  return v11;
}

uint64_t MSURebootToNerd()
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  CFStringRef v0 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    CFTypeID v7 = @"MSURebootToNerd";
    _os_log_impl(&dword_1879D2000, v0, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | BEGIN", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v1 = perform_command("RebootToNerd", 0LL, 0LL, 0LL, 0LL);
  uint64_t v2 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);
  if ((_DWORD)v1)
  {
    if (v3)
    {
      int v6 = 138412290;
      CFTypeID v7 = @"MSURebootToNerd";
      uint64_t v4 = "[SPI] %@ | SUCCESS";
LABEL_8:
      _os_log_impl(&dword_1879D2000, v2, OS_LOG_TYPE_DEFAULT, v4, (uint8_t *)&v6, 0xCu);
    }
  }

  else if (v3)
  {
    int v6 = 138412290;
    CFTypeID v7 = @"MSURebootToNerd";
    uint64_t v4 = "[SPI] %@ | FAILURE";
    goto LABEL_8;
  }

  return v1;
}

uint64_t __perform_prepare_command_block_invoke(void *a1, uint64_t a2)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  uint64_t v4 = (uint64_t (*)(uint64_t, void))a1[5];
  if (v4)
  {
    uint64_t v5 = v4(a2, a1[6]);
    int v6 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = a1[4];
      if ((_DWORD)v5 == -1)
      {
        uint64_t v8 = @"ClientSendError";
      }

      else if ((_DWORD)v5 == 2)
      {
        uint64_t v8 = @"Cancel";
      }

      else if ((_DWORD)v5)
      {
        uint64_t v8 = (const __CFString *)objc_msgSend(NSString, "stringWithFormat:", @"MSUOperation(%d)", v5);
      }

      else
      {
        uint64_t v8 = @"Continue";
      }

      *(_DWORD *)buf = 138412802;
      uint64_t v13 = v7;
      __int16 v14 = 2112;
      uint64_t v15 = v8;
      __int16 v16 = 2112;
      uint64_t v17 = a2;
      _os_log_impl( &dword_1879D2000,  v6,  OS_LOG_TYPE_DEFAULT,  "[SPI] %@ | PrepareUpdate | PROGRESS (%@) | state:%@",  buf,  0x20u);
    }
  }

  else
  {
    CFTypeID v9 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
    uint64_t v5 = 0LL;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = a1[4];
      *(_DWORD *)buf = 138412802;
      uint64_t v13 = v10;
      __int16 v14 = 2112;
      uint64_t v15 = @"Continue";
      __int16 v16 = 2112;
      uint64_t v17 = a2;
      _os_log_impl( &dword_1879D2000,  v9,  OS_LOG_TYPE_DEFAULT,  "[SPI] %@ | PrepareUpdate | PROGRESS (no progress handler - %@) | state:%@",  buf,  0x20u);
      return 0LL;
    }
  }

  return v5;
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

uint64_t __retrieve_previous_update_first_tolerated_failure_block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t result = [a2 isEqualToString:@"uuid"];
  if ((result & 1) == 0)
  {
    uint64_t result = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"InitialAttempted"), "BOOLValue");
    if ((_DWORD)result)
    {
      uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8LL);
      uint64_t v9 = *(void *)(v7 + 40);
      uint64_t v8 = (void *)(v7 + 40);
      uint64_t result = v9;
      if (v9)
      {
        uint64_t v10 = (void *)[(id)result objectForKeyedSubscript:@"InitialFailureNumber"];
        BOOL v11 = (void *)[a3 objectForKeyedSubscript:@"InitialFailureNumber"];
        LODWORD(v10) = [v10 intValue];
        uint64_t result = [v11 intValue];
        uint64_t v8 = (void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
      }

      *uint64_t v8 = a3;
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL) = a2;
    }
  }

  return result;
}

void *__retrieve_previous_update_first_tolerated_failure_block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result = (void *)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"RetryAttempted"), "BOOLValue");
  if ((_DWORD)result)
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8LL);
    uint64_t v9 = *(void **)(v7 + 40);
    uint64_t v8 = (void *)(v7 + 40);
    uint64_t result = v9;
    if (v9)
    {
      uint64_t v10 = (void *)[result objectForKeyedSubscript:@"RetryFailureNumber"];
      BOOL v11 = (void *)[a3 objectForKeyedSubscript:@"RetryFailureNumber"];
      LODWORD(v10) = [v10 intValue];
      uint64_t result = (void *)[v11 intValue];
      uint64_t v8 = (void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
    }

    *uint64_t v8 = a3;
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL) = a2;
  }

  return result;
}

void __retrieve_previous_update_all_tolerated_failures_block_invoke(uint64_t a1, void *a2, void *a3)
{
  if (([a2 isEqualToString:@"uuid"] & 1) == 0)
  {
    if (objc_msgSend( (id)objc_msgSend(a3, "objectForKeyedSubscript:", @"InitialAttempted"),  "BOOLValue"))
    {
      id v5 = objc_alloc_init(MEMORY[0x189603FC8]);
      if (v5)
      {
        int v6 = v5;
        objc_msgSend( v5,  "setObject:forKeyedSubscript:",  objc_msgSend(a3, "objectForKeyedSubscript:", @"StepName"),  @"CheckPoint");
        objc_msgSend( v6,  "setObject:forKeyedSubscript:",  objc_msgSend(a3, "objectForKeyedSubscript:", @"InitialFailureNumber"),  @"Index");
        objc_msgSend( v6,  "setObject:forKeyedSubscript:",  objc_msgSend(a3, "objectForKeyedSubscript:", @"InitialError"),  @"Description");
        [v6 setObject:@"initial" forKeyedSubscript:@"Attempt"];
        objc_msgSend( v6,  "setObject:forKeyedSubscript:",  objc_msgSend(a3, "objectForKeyedSubscript:", @"InitialResult"),  @"rcode");
        [*(id *)(a1 + 40) addObject:v6];
      }

      else
      {
        uint64_t v7 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          __retrieve_previous_update_all_tolerated_failures_block_invoke_cold_2(a1, v7, v8, v9, v10, v11, v12, v13);
        }
      }
    }

    if (objc_msgSend( (id)objc_msgSend(a3, "objectForKeyedSubscript:", @"RetryAttempted"),  "BOOLValue"))
    {
      id v14 = objc_alloc_init(MEMORY[0x189603FC8]);
      if (v14)
      {
        uint64_t v15 = v14;
        objc_msgSend( v14,  "setObject:forKeyedSubscript:",  objc_msgSend(a3, "objectForKeyedSubscript:", @"StepName"),  @"CheckPoint");
        objc_msgSend( v15,  "setObject:forKeyedSubscript:",  objc_msgSend(a3, "objectForKeyedSubscript:", @"RetryFailureNumber"),  @"Index");
        objc_msgSend( v15,  "setObject:forKeyedSubscript:",  objc_msgSend(a3, "objectForKeyedSubscript:", @"RetryError"),  @"Description");
        [v15 setObject:@"reboot-retry" forKeyedSubscript:@"Attempt"];
        objc_msgSend( v15,  "setObject:forKeyedSubscript:",  objc_msgSend(a3, "objectForKeyedSubscript:", @"RetryResult"),  @"rcode");
        [*(id *)(a1 + 40) addObject:v15];
      }

      else
      {
        __int16 v16 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          __retrieve_previous_update_all_tolerated_failures_block_invoke_cold_1(a1, v16, v17, v18, v19, v20, v21, v22);
        }
      }
    }
  }

void OUTLINED_FUNCTION_1_0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void OUTLINED_FUNCTION_6(uint64_t a1@<X8>)
{
  *(void *)(v1 - _Block_object_dispose(va, 8) = a1;
}

void addSeObjectToMessage(uint64_t a1, void *a2, void *a3)
{
  if (a1 && a3)
  {
    int v6 = (void *)[a3 stringByAppendingString:@"Length"];
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1896078F8]) initRequiringSecureCoding:1];
    [v7 encodeObject:a1 forKey:*MEMORY[0x1896075C8]];
    id v9 = (id)[v7 encodedData];
    size_t v8 = [v9 length];
    xpc_dictionary_set_data( a2,  (const char *)[a3 UTF8String],  (const void *)objc_msgSend(v9, "bytes"),  v8);
    xpc_dictionary_set_double(a2, (const char *)[v6 UTF8String], (double)v8);
  }

  else if (os_log_type_enabled( (os_log_t)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog"),  OS_LOG_TYPE_ERROR))
  {
    addSeObjectToMessage_cold_1();
  }

uint64_t perform_command(const char *a1, void *a2, void *a3, const __CFString **a4, CFTypeRef *a5)
{
  return perform_se_command(a1, a2, a3, 0LL, a4, a5);
}

uint64_t perform_se_command( const char *a1, void *a2, void *a3, uint64_t a4, const __CFString **a5, CFTypeRef *a6)
{
  uint64_t v40 = *MEMORY[0x1895F89C0];
  uint64_t v12 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    CFTypeRef v39 = a1;
    _os_log_impl(&dword_1879D2000, v12, OS_LOG_TYPE_DEFAULT, "[CLIENT_IPC] Performing se command: %s", buf, 0xCu);
  }

  CFTypeRef cf = 0LL;
  __int16 v16 = copy_connection_for_command(a1, a2, a3, 1, (const __CFString **)&cf);
  if (v16)
  {
    xpc_object_t v17 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_string(v17, "Command", a1);
    if (a2) {
      msu_serialize_cf_object_into_xpc_dict(v17, "CommandParameters", a2, v18, v19, v20, v21, v22);
    }
    if (a3) {
      msu_serialize_cf_object_into_xpc_dict(v17, "UpdateAttributes", a3, v18, v19, v20, v21, v22);
    }
    if (a4) {
      addSeObjectToMessage(a4, v17, @"SecureEncodedObjects");
    }
    context = xpc_connection_get_context(v16);
    uint64_t v24 = context;
    if (context)
    {
      objc_sync_enter(context);
      [v24 addObject:v17];
      objc_sync_exit(v24);
    }

    xpc_object_t v25 = xpc_connection_send_message_with_reply_sync(v16, v17);
    uint64_t v26 = xpc_connection_get_context(v16);
    uint64_t v31 = v26;
    if (v26)
    {
      objc_sync_enter(v26);
      [v31 removeObject:v17];
      objc_sync_exit(v31);
    }

    int v32 = msu_demux_reply(v25, a5, 0LL, (const __CFString **)&cf, v27, v28, v29, v30);
    if (v17) {
      xpc_release(v17);
    }
    if (v25) {
      xpc_release(v25);
    }
    xpc_release(v16);
    if (v32)
    {
      CFTypeRef v33 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        CFTypeRef v39 = a1;
        _os_log_impl( &dword_1879D2000,  v33,  OS_LOG_TYPE_DEFAULT,  "[CLIENT_IPC] Performed se command: %s | SUCCESS",  buf,  0xCu);
      }

      uint64_t v34 = 1LL;
      goto LABEL_26;
    }
  }

  else
  {
    CFTypeRef cf = _create_error_internal_cf( @"MobileSoftwareUpdateErrorDomain",  27LL,  0LL,  0LL,  @"Could not create connection to update brain service",  v13,  v14,  v15,  v36);
  }

  if (os_log_type_enabled( (os_log_t)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog"),  OS_LOG_TYPE_ERROR))
  {
    perform_se_command_cold_1();
  }

  uint64_t v34 = 0LL;
LABEL_26:
  if (a6)
  {
    *a6 = cf;
  }

  else if (cf)
  {
    CFRelease(cf);
  }

  return v34;
}

void sub_1879DC63C(_Unwind_Exception *a1)
{
}

xpc_connection_t copy_connection_for_command( const char *a1, void *a2, void *a3, int a4, const __CFString **a5)
{
  for (uint64_t i = 0LL; i != 75; i += 3LL)
  {
    size_t v11 = strlen((&copy_connection_for_command_CONNECTION_TABLE)[i]);
    if (!strncmp(a1, (&copy_connection_for_command_CONNECTION_TABLE)[i], v11))
    {
      if (a4) {
        return (xpc_connection_t)copy_shared_softwareupdated_connection((uint64_t)a5);
      }
      else {
        return xpc_connection_create_mach_service("com.apple.mobile.softwareupdated", 0LL, 2uLL);
      }
    }
  }

  if (!a4) {
    return create_brain_connection(a2, a3, a5);
  }
  if (get_shared_update_brain_connection_queue_update_brain_queue_once != -1) {
    dispatch_once(&get_shared_update_brain_connection_queue_update_brain_queue_once, &__block_literal_global_58);
  }
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __copy_shared_update_brain_connection_block_invoke;
  block[3] = &__block_descriptor_56_e5_v8__0l;
  block[4] = a2;
  block[5] = a3;
  block[6] = a5;
  dispatch_sync((dispatch_queue_t)get_shared_update_brain_connection_queue_update_brain_queue, block);
  return (xpc_connection_t)copy_shared_update_brain_connection_brain_connection;
}

uint64_t perform_command_with_progress( const char *a1, void *a2, void *a3, uint64_t a4, const __CFString **a5, uint64_t a6)
{
  return perform_se_command_with_progress(a1, a2, a3, 0LL, a4, a5, a6);
}

uint64_t perform_se_command_with_progress( const char *a1, void *a2, void *a3, uint64_t a4, uint64_t a5, const __CFString **a6, uint64_t a7)
{
  uint64_t v47 = *MEMORY[0x1895F89C0];
  uint64_t v14 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = a1;
    _os_log_impl( &dword_1879D2000,  v14,  OS_LOG_TYPE_DEFAULT,  "[CLIENT_IPC] Performing se command with progress: %s",  (uint8_t *)&buf,  0xCu);
  }

  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v45 = 0x2020000000LL;
  char v46 = 0;
  v40[0] = 0LL;
  v40[1] = v40;
  v40[2] = 0x2020000000LL;
  char v41 = 0;
  v38[0] = 0LL;
  v38[1] = v38;
  v38[2] = 0x2020000000LL;
  char v39 = 0;
  uint64_t v15 = dispatch_semaphore_create(0LL);
  uint64_t v34 = 0LL;
  uint64_t v35 = (const __CFString **)&v34;
  uint64_t v36 = 0x2020000000LL;
  uint64_t v37 = 0LL;
  xpc_object_t v16 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(v16, "Command", a1);
  if (a2) {
    msu_serialize_cf_object_into_xpc_dict(v16, "CommandParameters", a2, v17, v18, v19, v20, v21);
  }
  if (a4) {
    addSeObjectToMessage(a4, v16, @"SecureEncodedObjects");
  }
  uint64_t v22 = copy_connection_for_command(a1, a2, a3, 0, v35 + 3);
  uint64_t v26 = v22;
  if (!v22)
  {
    CFErrorRef error_internal_cf = _create_error_internal_cf( @"MobileSoftwareUpdateErrorDomain",  27LL,  0LL,  0LL,  @"Could not create connection to update brain service",  v23,  v24,  v25,  v32);
    v35[3] = (const __CFString *)error_internal_cf;
    if (!v16) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }

  handler[0] = MEMORY[0x1895F87A8];
  handler[1] = 3221225472LL;
  handler[2] = __perform_se_command_with_progress_block_invoke;
  handler[3] = &unk_18A0EB428;
  handler[4] = v22;
  handler[5] = v16;
  handler[8] = v38;
  handler[9] = v40;
  handler[10] = &v34;
  handler[11] = &buf;
  handler[12] = a5;
  handler[6] = v15;
  handler[7] = a7;
  xpc_connection_set_event_handler(v22, handler);
  xpc_connection_resume(v26);
  xpc_connection_send_message(v26, v16);
  dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
  if (v16) {
LABEL_11:
  }
    xpc_release(v16);
LABEL_12:
  if (v26)
  {
    xpc_connection_set_event_handler(v26, &__block_literal_global_1);
    xpc_release(v26);
  }

  dispatch_release(v15);
  if (*(_BYTE *)(*((void *)&buf + 1) + 24LL))
  {
    uint64_t v28 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int16 v42 = 136315138;
      uint64_t v43 = a1;
      _os_log_impl( &dword_1879D2000,  v28,  OS_LOG_TYPE_DEFAULT,  "[CLIENT_IPC] Performed se command with progress: %s | SUCCESS",  v42,  0xCu);
    }
  }

  else if (os_log_type_enabled( (os_log_t)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog"),  OS_LOG_TYPE_ERROR))
  {
    perform_se_command_with_progress_cold_1();
  }

  uint64_t v29 = v35[3];
  if (a6)
  {
    *a6 = v29;
  }

  else if (v29)
  {
    CFRelease(v29);
  }

  uint64_t v30 = *(unsigned __int8 *)(*((void *)&buf + 1) + 24LL);
  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(v38, 8);
  _Block_object_dispose(v40, 8);
  _Block_object_dispose(&buf, 8);
  return v30;
}

void sub_1879DCB58( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, char a23, uint64_t a24, uint64_t a25, uint64_t a26, char a27, uint64_t a28, uint64_t a29, uint64_t a30, char a31)
{
}

void __perform_se_command_with_progress_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4 = MEMORY[0x1895B0914](a2);
  if (v4 == MEMORY[0x1895F9268])
  {
    if (a2 == (void *)MEMORY[0x1895F9198] && (uint64_t v29 = *(void *)(*(void *)(a1 + 64) + 8LL), *(_BYTE *)(v29 + 24)))
    {
      *(_BYTE *)(v29 + 24) = 0;
      xpc_connection_send_message(*(xpc_connection_t *)(a1 + 32), *(xpc_object_t *)(a1 + 40));
    }

    else if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL))
    {
      char string = xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x1895F91B0]);
      *(void *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 24LL) = _create_error_internal_cf( @"MobileSoftwareUpdateErrorDomain",  7LL,  0LL,  0LL,  @"Received XPC error %s",  v10,  v11,  v12,  string);
      *(_BYTE *)(*(void *)(*(void *)(a1 + 88) + 8LL) + 24LL) = 0;
      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
    }
  }

  else if (v4 == MEMORY[0x1895F9250])
  {
    uint64_t v13 = xpc_dictionary_get_string(a2, "Command");
    if (v13 && !strncmp(v13, "ResendMessage", 0xDuLL))
    {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 1;
    }

    else
    {
      uint64_t v14 = xpc_dictionary_get_string(a2, "IPCStatus");
      CFTypeRef cf = 0LL;
      *(_BYTE *)(*(void *)(*(void *)(a1 + 88) + 8LL) + 24LL) = msu_demux_reply( a2,  *(const __CFString ***)(a1 + 96),  (__CFDictionary **)&cf,  (const __CFString **)(*(void *)(*(void *)(a1 + 80) + 8LL)
                                                                                         + 24LL),
                                                                     v15,
                                                                     v16,
                                                                     v17,
                                                                     v18);
      if (cf)
      {
        uint64_t v19 = *(void *)(a1 + 56);
        if (v19)
        {
          int v20 = (*(uint64_t (**)(void))(v19 + 16))();
          xpc_object_t reply = xpc_dictionary_create_reply(a2);
          if (reply)
          {
            uint64_t v22 = reply;
            uint64_t v23 = "kMSUOperationClientSendError";
            if (v20 == 2) {
              uint64_t v23 = "kMSUOperationCancel";
            }
            if (v20) {
              uint64_t v24 = v23;
            }
            else {
              uint64_t v24 = "kMSUOperationContinue";
            }
            xpc_dictionary_set_string(reply, "CallbackReturn", v24);
            remote_connection = xpc_dictionary_get_remote_connection(a2);
            if (remote_connection) {
              xpc_connection_send_message(remote_connection, v22);
            }
            else {
              *(void *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 24LL) = _create_error_internal_cf( @"MobileSoftwareUpdateErrorDomain",  7LL,  0LL,  0LL,  @"Could not retrieve XPC remote connection for reply",  v26,  v27,  v28,  v30);
            }
            xpc_release(v22);
          }
        }

        CFRelease(cf);
      }

      else if (!v14 || strncmp(v14, "Callback", 8uLL))
      {
        *(_BYTE *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL) = 1;
        xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
        dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
      }
    }
  }

  else
  {
    id v5 = (void *)MEMORY[0x1895B089C](a2);
    *(void *)(*(void *)(*(void *)(a1 + 80) + 8LL) + 24LL) = _create_error_internal_cf( @"MobileSoftwareUpdateErrorDomain",  7LL,  0LL,  0LL,  @"Unexpected XPC object %s",  v6,  v7,  v8,  (char)v5);
    free(v5);
  }

uint64_t copy_shared_softwareupdated_connection(uint64_t a1)
{
  if (get_shared_softwareupdated_connection_queue_softwareupdated_queue_once != -1) {
    dispatch_once(&get_shared_softwareupdated_connection_queue_softwareupdated_queue_once, &__block_literal_global_54);
  }
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __copy_shared_softwareupdated_connection_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  dispatch_sync((dispatch_queue_t)get_shared_softwareupdated_connection_queue_softwareupdated_queue, block);
  return copy_shared_softwareupdated_connection_softwareupdated_connection;
}

xpc_connection_t create_softwareupdated_connection()
{
  return xpc_connection_create_mach_service("com.apple.mobile.softwareupdated", 0LL, 2uLL);
}

xpc_connection_t create_brain_connection(void *a1, void *a2, const __CFString **a3)
{
  uint64_t v6 = copy_shared_softwareupdated_connection((uint64_t)a3);
  if (v6)
  {
    uint64_t v7 = (_xpc_connection_s *)v6;
    xpc_object_t v8 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_string(v8, "Command", "CreateUpdateBrainConnection");
    if (a1) {
      msu_serialize_cf_object_into_xpc_dict(v8, "CommandParameters", a1, v9, v10, v11, v12, v13);
    }
    if (a2) {
      msu_serialize_cf_object_into_xpc_dict(v8, "UpdateAttributes", a2, v9, v10, v11, v12, v13);
    }
    xpc_object_t v14 = xpc_connection_send_message_with_reply_sync(v7, v8);
    uint64_t v15 = MEMORY[0x1895B0914]();
    if (v15 == MEMORY[0x1895F9268])
    {
      uint64_t v16 = (void *)MEMORY[0x1895B089C](v14);
      if (os_log_type_enabled( (os_log_t)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog"),  OS_LOG_TYPE_ERROR))
      {
        create_brain_connection_cold_2();
      }
    }

    else
    {
      if (v15 == MEMORY[0x1895F9250])
      {
        value = (_xpc_endpoint_s *)xpc_dictionary_get_value(v14, "UpdateBrainServiceEndPoint");
        if (value)
        {
          xpc_connection_t v17 = xpc_connection_create_from_endpoint(value);
          if (!v8) {
            goto LABEL_18;
          }
          goto LABEL_17;
        }

        if (os_log_type_enabled( (os_log_t)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog"),  OS_LOG_TYPE_ERROR))
        {
          create_brain_connection_cold_4();
        }

        int v20 = msu_deserialize_cf_object_from_xpc_dict(v14, "ErrorInfo");
        if (v20)
        {
          uint64_t v21 = v20;
          if (os_log_type_enabled( (os_log_t)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog"),  OS_LOG_TYPE_ERROR))
          {
            create_brain_connection_cold_3();
          }

          *a3 = copy_dictionary_to_cferror(v21);
          CFRelease(v21);
        }

void __copy_shared_softwareupdated_connection_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)copy_shared_softwareupdated_connection_softwareupdated_connection;
  if (copy_shared_softwareupdated_connection_softwareupdated_connection)
  {
LABEL_6:
    xpc_retain(v2);
    return;
  }

  mach_service = xpc_connection_create_mach_service("com.apple.mobile.softwareupdated", 0LL, 2uLL);
  copy_shared_softwareupdated_connection_softwareupdated_connection = (uint64_t)mach_service;
  if (mach_service)
  {
    xpc_connection_set_context(mach_service, objc_alloc_init(MEMORY[0x189603FA8]));
    xpc_connection_set_finalizer_f( (xpc_connection_t)copy_shared_softwareupdated_connection_softwareupdated_connection,  finalize_shared_softwareupdated_connection);
    uint64_t v7 = (_xpc_connection_s *)copy_shared_softwareupdated_connection_softwareupdated_connection;
    if (get_shared_softwareupdated_connection_queue_softwareupdated_queue_once != -1) {
      dispatch_once(&get_shared_softwareupdated_connection_queue_softwareupdated_queue_once, &__block_literal_global_54);
    }
    xpc_connection_set_target_queue( v7,  (dispatch_queue_t)get_shared_softwareupdated_connection_queue_softwareupdated_queue);
    xpc_connection_set_event_handler( (xpc_connection_t)copy_shared_softwareupdated_connection_softwareupdated_connection,  &__block_literal_global_49);
    xpc_connection_resume((xpc_connection_t)copy_shared_softwareupdated_connection_softwareupdated_connection);
    uint64_t v2 = (void *)copy_shared_softwareupdated_connection_softwareupdated_connection;
    goto LABEL_6;
  }

  CFErrorRef error_internal_cf = _create_error_internal_cf( @"MobileSoftwareUpdateErrorDomain",  40LL,  0LL,  0LL,  @"Could not create connection to service %s",  v4,  v5,  v6,  (char)"com.apple.mobile.softwareupdated");
  uint64_t v9 = *(CFErrorRef **)(a1 + 32);
  if (v9) {
    *uint64_t v9 = error_internal_cf;
  }
  else {
    CFRelease(error_internal_cf);
  }
}

void __copy_shared_softwareupdated_connection_block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  uint64_t v3 = MEMORY[0x1895B0914](a2);
  if (v3 != MEMORY[0x1895F9268])
  {
    if (v3 == MEMORY[0x1895F9250]
      && xpc_dictionary_get_string(a2, "Command")
      && (char string = xpc_dictionary_get_string(a2, "Command"), !strncmp(string, "ResendMessage", 0xDuLL)))
    {
      _block_invoke_softwareupdated_did_self_destruct = 1;
    }

    else
    {
      uint64_t v4 = (void *)MEMORY[0x1895B089C](a2);
      uint64_t v5 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 136315138;
        uint64_t v22 = v4;
        _os_log_impl( &dword_1879D2000,  v5,  OS_LOG_TYPE_DEFAULT,  "[CLIENT_IPC] softwareupdated connection event handler | %s",  buf,  0xCu);
      }

      free(v4);
    }

    return;
  }

  if (a2 != (void *)MEMORY[0x1895F9198])
  {
    xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x1895F91B0]);
    logfunction( "",  1LL,  @"XPC error on connection to %s: %s\n",  v6,  v7,  v8,  v9,  v10,  (char)"com.apple.mobile.softwareupdated");
    goto LABEL_21;
  }

  if (_block_invoke_softwareupdated_did_self_destruct != 1)
  {
LABEL_21:
    if (copy_shared_softwareupdated_connection_softwareupdated_connection)
    {
      xpc_release((xpc_object_t)copy_shared_softwareupdated_connection_softwareupdated_connection);
      copy_shared_softwareupdated_connection_softwareupdated_connection = 0LL;
    }

    return;
  }

  context = xpc_connection_get_context((xpc_connection_t)copy_shared_softwareupdated_connection_softwareupdated_connection);
  if (context)
  {
    uint64_t v13 = context;
    objc_sync_enter(context);
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v17 objects:v23 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v18;
      do
      {
        for (uint64_t i = 0LL; i != v14; ++i)
        {
          if (*(void *)v18 != v15) {
            objc_enumerationMutation(v13);
          }
          xpc_connection_send_message( (xpc_connection_t)copy_shared_softwareupdated_connection_softwareupdated_connection,  *(xpc_object_t *)(*((void *)&v17 + 1) + 8 * i));
        }

        uint64_t v14 = [v13 countByEnumeratingWithState:&v17 objects:v23 count:16];
      }

      while (v14);
    }

    objc_sync_exit(v13);
  }

void sub_1879DD520(_Unwind_Exception *a1)
{
}

dispatch_queue_t __get_shared_softwareupdated_connection_queue_block_invoke()
{
  dispatch_queue_t result = dispatch_queue_create("com.apple.mobile.softwareupdated", 0LL);
  get_shared_softwareupdated_connection_queue_softwareupdated_queue = (uint64_t)result;
  return result;
}

void __copy_shared_update_brain_connection_block_invoke(uint64_t a1)
{
  uint64_t v1 = (void *)copy_shared_update_brain_connection_brain_connection;
  if (copy_shared_update_brain_connection_brain_connection) {
    goto LABEL_4;
  }
  brain_connection = create_brain_connection(*(void **)(a1 + 32), *(void **)(a1 + 40), *(const __CFString ***)(a1 + 48));
  copy_shared_update_brain_connection_brain_connection = (uint64_t)brain_connection;
  if (brain_connection)
  {
    xpc_connection_set_event_handler(brain_connection, &__block_literal_global_56);
    xpc_connection_resume((xpc_connection_t)copy_shared_update_brain_connection_brain_connection);
    uint64_t v1 = (void *)copy_shared_update_brain_connection_brain_connection;
LABEL_4:
    xpc_retain(v1);
    return;
  }

  if (os_log_type_enabled( (os_log_t)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog"),  OS_LOG_TYPE_ERROR))
  {
    __copy_shared_update_brain_connection_block_invoke_cold_1();
  }

void __copy_shared_update_brain_connection_block_invoke_55(uint64_t a1, void *a2)
{
  if (MEMORY[0x1895B0914](a2) == MEMORY[0x1895F9268])
  {
    if (a2 != (void *)MEMORY[0x1895F9198])
    {
      uint64_t v4 = (os_log_s *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog");
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        __copy_shared_update_brain_connection_block_invoke_55_cold_1(a2, v4);
      }
    }

    if (copy_shared_update_brain_connection_brain_connection)
    {
      xpc_release((xpc_object_t)copy_shared_update_brain_connection_brain_connection);
      copy_shared_update_brain_connection_brain_connection = 0LL;
    }
  }

  else
  {
    uint64_t v3 = (void *)MEMORY[0x1895B089C](a2);
    if (os_log_type_enabled( (os_log_t)objc_msgSend((id)objc_msgSend(MEMORY[0x1896127A0], "sharedLogger"), "oslog"),  OS_LOG_TYPE_ERROR))
    {
      __copy_shared_update_brain_connection_block_invoke_55_cold_2();
    }

    free(v3);
  }

dispatch_queue_t __get_shared_update_brain_connection_queue_block_invoke()
{
  dispatch_queue_t result = dispatch_queue_create("com.apple.mobile.softwareupdated", 0LL);
  get_shared_update_brain_connection_queue_update_brain_queue = (uint64_t)result;
  return result;
}

void OUTLINED_FUNCTION_1_1( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

  ;
}

void msu_process_dictionary_values_for_xpc_serialization(const void *a1, uint64_t a2, __CFDictionary **a3)
{
  uint64_t v5 = msu_process_cf_object_for_xpc_serialization(a2);
  if (v5)
  {
    uint64_t v6 = (const void *)v5;
    if (a3)
    {
      if (!*a3)
      {
        CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  1LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
        *a3 = Mutable;
        CFDictionarySetValue(Mutable, a1, v6);
      }
    }

    CFRelease(v6);
  }

CFDictionaryRef msu_process_cf_object_for_xpc_serialization(void *a1)
{
  if (!a1) {
    return 0LL;
  }
  CFTypeID v2 = CFGetTypeID(a1);
  if (v2 != CFDictionaryGetTypeID())
  {
    if (v2 == CFArrayGetTypeID())
    {
      CFIndex Count = CFArrayGetCount((CFArrayRef)a1);
      if (Count >= 1)
      {
        CFIndex v5 = Count;
        CFIndex v6 = 0LL;
        CFMutableDictionaryRef MutableCopy = 0LL;
        uint64_t v7 = (const __CFAllocator *)*MEMORY[0x189604DB0];
        do
        {
          ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)a1, v6);
          uint64_t v9 = msu_process_cf_object_for_xpc_serialization(ValueAtIndex);
          if (v9)
          {
            uint64_t v10 = (const void *)v9;
            if (!MutableCopy) {
              CFMutableDictionaryRef MutableCopy = CFArrayCreateMutableCopy(v7, 0LL, (CFArrayRef)a1);
            }
            CFArraySetValueAtIndex(MutableCopy, v6, v10);
            CFRelease(v10);
          }

          ++v6;
        }

        while (v5 != v6);
        return MutableCopy;
      }
    }

    else if (v2 == CFErrorGetTypeID())
    {
      return cferror_to_dictionary_embedded((__CFError *)a1, 1);
    }

    return 0LL;
  }

  CFDictionaryRef context = 0LL;
  CFDictionaryApplyFunction( (CFDictionaryRef)a1,  (CFDictionaryApplierFunction)msu_process_dictionary_values_for_xpc_serialization,  &context);
  if (!context) {
    return 0LL;
  }
  CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, (CFDictionaryRef)a1);
  CFDictionaryApplyFunction(context, (CFDictionaryApplierFunction)msu_merge_dictionary_values, MutableCopy);
  CFRelease(context);
  return MutableCopy;
}

void msu_merge_dictionary_values(void *key, void *value, CFMutableDictionaryRef theDict)
{
}

void msu_serialize_cf_object_into_xpc_dict( void *a1, const char *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a3)
  {
    CFDictionaryRef v10 = msu_process_cf_object_for_xpc_serialization(a3);
    if (v10)
    {
      CFDictionaryRef v11 = v10;
      uint64_t v12 = (void *)_CFXPCCreateXPCObjectFromCFObject();
      CFRelease(v11);
      if (v12)
      {
LABEL_4:
        xpc_dictionary_set_value(a1, a2, v12);
        xpc_release(v12);
        return;
      }
    }

    else
    {
      uint64_t v12 = (void *)_CFXPCCreateXPCObjectFromCFObject();
      if (v12) {
        goto LABEL_4;
      }
    }

    logfunction("", 1LL, @"could not create object for key %s:%@\n", v13, v14, v15, v16, v17, (char)a2);
  }

  else
  {
    logfunction( "",  1LL,  @"%s: API misuse - object is NULL\n",  a4,  a5,  a6,  a7,  a8,  (char)"msu_serialize_cf_object_into_xpc_dict");
  }

void msu_process_dictionary_values_from_xpc_deserialization(const void *a1, uint64_t a2, __CFDictionary **a3)
{
  uint64_t v5 = msu_process_cf_object_from_xpc_deserialization(a2);
  if (v5)
  {
    CFIndex v6 = (const void *)v5;
    if (a3)
    {
      if (!*a3)
      {
        CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  1LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
        *a3 = Mutable;
        CFDictionarySetValue(Mutable, a1, v6);
      }
    }

    CFRelease(v6);
  }

CFStringRef msu_process_cf_object_from_xpc_deserialization(const void *a1)
{
  if (!a1) {
    return 0LL;
  }
  CFTypeID v2 = CFGetTypeID(a1);
  if (v2 != CFDictionaryGetTypeID())
  {
    if (v2 == CFArrayGetTypeID())
    {
      CFIndex Count = CFArrayGetCount((CFArrayRef)a1);
      if (Count >= 1)
      {
        CFIndex v5 = Count;
        CFIndex v6 = 0LL;
        CFMutableDictionaryRef MutableCopy = 0LL;
        uint64_t v8 = (const __CFAllocator *)*MEMORY[0x189604DB0];
        do
        {
          ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)a1, v6);
          uint64_t v10 = msu_process_cf_object_from_xpc_deserialization(ValueAtIndex);
          if (v10)
          {
            CFDictionaryRef v11 = (const void *)v10;
            if (!MutableCopy) {
              CFMutableDictionaryRef MutableCopy = CFArrayCreateMutableCopy(v8, 0LL, (CFArrayRef)a1);
            }
            CFArraySetValueAtIndex(MutableCopy, v6, v11);
            CFRelease(v11);
          }

          ++v6;
        }

        while (v5 != v6);
        return (const __CFString *)MutableCopy;
      }
    }

    return 0LL;
  }

  if (CFDictionaryContainsKey((CFDictionaryRef)a1, @"_MSU_Embedded_Error")) {
    return copy_dictionary_to_cferror(a1);
  }
  CFDictionaryRef context = 0LL;
  CFDictionaryApplyFunction( (CFDictionaryRef)a1,  (CFDictionaryApplierFunction)msu_process_dictionary_values_from_xpc_deserialization,  &context);
  if (!context) {
    return 0LL;
  }
  CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, (CFDictionaryRef)a1);
  CFDictionaryApplyFunction(context, (CFDictionaryApplierFunction)msu_merge_dictionary_values, MutableCopy);
  CFRelease(context);
  return (const __CFString *)MutableCopy;
}

CFStringRef msu_deserialize_cf_object_from_xpc_dict(void *a1, const char *a2)
{
  if (!xpc_dictionary_get_value(a1, a2)) {
    return 0LL;
  }
  CFTypeID v2 = (const void *)_CFXPCCreateCFObjectFromXPCObject();
  uint64_t v3 = msu_process_cf_object_from_xpc_deserialization(v2);
  if (v3)
  {
    uint64_t v4 = v3;
    CFRelease(v2);
    return v4;
  }

  return (const __CFString *)v2;
}

uint64_t msu_demux_reply( void *a1, const __CFString **a2, __CFDictionary **a3, const __CFString **a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a1)
  {
    __int128 v18 = @"No reply from daemon";
LABEL_9:
    CFErrorRef error_internal_cf = _create_error_internal_cf( @"MobileSoftwareUpdateErrorDomain",  7LL,  0LL,  0LL,  v18,  a6,  a7,  a8,  v28);
LABEL_10:
    CFErrorRef v19 = error_internal_cf;
    if (a4)
    {
      uint64_t result = 0LL;
      *a4 = (const __CFString *)v19;
      return result;
    }

    goto LABEL_12;
  }

  char string = xpc_dictionary_get_string(a1, "IPCStatus");
  if (!string)
  {
    __int128 v18 = @"No status key in reply from daemon";
    goto LABEL_9;
  }

  uint64_t v13 = string;
  if (!strncmp(string, "Complete", 8uLL))
  {
    if (a2) {
      *a2 = msu_deserialize_cf_object_from_xpc_dict(a1, "Results");
    }
    return 1LL;
  }

  if (!strncmp(v13, "Callback", 8uLL))
  {
    if (a3)
    {
      uint64_t v21 = (const __CFDictionary *)msu_deserialize_cf_object_from_xpc_dict(a1, "CallbackStatus");
      int Value = CFDictionaryGetValue(v21, @"StallError");
      if (Value)
      {
        uint64_t v23 = Value;
        CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, v21);
        if (v21) {
          CFRelease(v21);
        }
        uint64_t v25 = copy_dictionary_to_cferror(v23);
        if (v25)
        {
          uint64_t v26 = v25;
          CFDictionarySetValue(MutableCopy, @"StallError", v25);
          CFRelease(v26);
        }
      }

      else
      {
        CFMutableDictionaryRef MutableCopy = v21;
      }

      *a3 = MutableCopy;
    }

    return 1LL;
  }

  if (strncmp(v13, "Error", 5uLL))
  {
    CFErrorRef error_internal_cf = _create_error_internal_cf( @"MobileSoftwareUpdateErrorDomain",  7LL,  0LL,  0LL,  @"Unexpected IPC status %s in reply hander",  v14,  v15,  v16,  (char)v13);
    goto LABEL_10;
  }

  if (!a4) {
    return 0LL;
  }
  uint64_t result = (uint64_t)msu_deserialize_cf_object_from_xpc_dict(a1, "ErrorInfo");
  if (result)
  {
    uint64_t v27 = (__CFError *)result;
    *a4 = copy_dictionary_to_cferror((const void *)result);
    CFErrorRef error_internal_cf = v27;
LABEL_12:
    CFRelease(error_internal_cf);
    return 0LL;
  }

  return result;
}

void MSUPreflightUpdate_cold_1()
{
}

void MSUPrepareUpdateWithAsset_cold_1()
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  v1[0] = 138412546;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1879D2000, v0, (uint64_t)v0, "[SPI] %@ | FAILURE | error:%@", (uint8_t *)v1);
  OUTLINED_FUNCTION_2();
}

void MSUPrepareUpdateWithAsset_cold_2()
{
}

void perform_prepare_command_cold_1()
{
}

void MSUPrepareUpdateWithMAAsset_cold_1()
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  v1[0] = 138412546;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1879D2000, v0, (uint64_t)v0, "[SPI] %@ | FAILURE | error:%@", (uint8_t *)v1);
  OUTLINED_FUNCTION_2();
}

void MSUPrepareUpdateWithMAAsset_cold_2()
{
}

void MSUPrepareUpdate_cold_1()
{
}

void MSUApplyUpdate_cold_1()
{
}

void MSUSuspendUpdate_cold_1()
{
}

void MSUResumeUpdateWithOptions_cold_1()
{
}

void MSUBrainIsLoadable_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void MSUBrainIsLoadable_cold_2()
{
}

void MSUPurgeSuspendedUpdate_cold_1()
{
}

void MSUCloseUpdateHandle_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void MSUAssetCalculateInstallationSize_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void MSUAssetCalculateInstallationSize_cold_2()
{
}

void MSUAssetCalculatePrepareSizes_cold_1()
{
}

void MSUAssetCalculateApplySizes_cold_1()
{
}

void MSUCheckInstallationSize_cold_1()
{
}

void MSURetrievePreviousUpdateResults_cold_1()
{
}

void MSURetrievePreviousUpdateState_cold_1()
{
}

void MSUCopyToleratedStatusForStep_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void MSUCopyToleratedStatusForStep_cold_2( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void MSUParsedToleratedFailureForStep_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void MSUParsedToleratedFailureForStep_cold_2( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void MSUIsFirstBootAfterUpdate_cold_1()
{
}

void MSURetrievePreviousUpdateDate_cold_1()
{
}

void MSURetrievePreviousRestoreDate_cold_1()
{
}

void MSUCopyEnvInfoForNeRD_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void MSUCopyConnectivityData_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void MSUCopyConnectivityData_cold_2( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void MSUCopyConnectivityData_cold_3()
{
}

void MSUReportAndCleanupPreviousUpdateState_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void MSUReportAndCleanupPreviousUpdateState_cold_2( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void MSUReportAndCleanupPreviousUpdateState_cold_3( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void MSUCopyInstalledRecoveryOSVersion_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void MSUCopyInstalledRecoveryOSVersion_cold_2( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void RVGetNeRDInfo_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void MSUGetUpdateInfo_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void MSUGetUpdateInfo_cold_2( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void MSUGetUpdateInfo_cold_3()
{
}

void MSUPerformSemiSplat_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void MSUPerformSemiSplat_cold_2( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void MSUPerformSemiSplat_cold_3( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void MSUPerformDownlevel_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void MSUPerformDownlevel_cold_2( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void MSUPerformDownlevel_cold_3()
{
}

void __retrieve_previous_update_all_tolerated_failures_block_invoke_cold_1( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __retrieve_previous_update_all_tolerated_failures_block_invoke_cold_2( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void addSeObjectToMessage_cold_1()
{
}

void perform_se_command_cold_1()
{
}

void perform_se_command_with_progress_cold_1()
{
}

void create_brain_connection_cold_1()
{
}

void create_brain_connection_cold_2()
{
}

void create_brain_connection_cold_3()
{
}

void create_brain_connection_cold_4()
{
}

void create_brain_connection_cold_5()
{
}

void __copy_shared_update_brain_connection_block_invoke_cold_1()
{
}

void __copy_shared_update_brain_connection_block_invoke_55_cold_1(void *a1, os_log_s *a2)
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  xpc_dictionary_get_string(a1, (const char *)*MEMORY[0x1895F91B0]);
  OUTLINED_FUNCTION_2_0();
  _os_log_error_impl( &dword_1879D2000,  a2,  OS_LOG_TYPE_ERROR,  "[CLIENT_IPC] XPC error on service connection: %s",  v3,  0xCu);
}

void __copy_shared_update_brain_connection_block_invoke_55_cold_2()
{
}

CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray)
{
  return (CFMutableArrayRef)MEMORY[0x189602658](allocator, capacity, theArray);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x189602660](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x189602690]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x189602698](theArray, idx);
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

CFTypeID CFDateGetTypeID(void)
{
  return MEMORY[0x189602B78]();
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

CFMutableDictionaryRef CFDictionaryCreateMutable( CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x189602BB8](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy( CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x189602BC8](allocator, capacity, theDict);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x189602BF0]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x189602C00](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFDictionaryRef CFErrorCopyUserInfo(CFErrorRef err)
{
  return (CFDictionaryRef)MEMORY[0x189602C58](err);
}

CFErrorRef CFErrorCreate( CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return (CFErrorRef)MEMORY[0x189602C60](allocator, domain, code, userInfo);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return MEMORY[0x189602C70](err);
}

CFErrorDomain CFErrorGetDomain(CFErrorRef err)
{
  return (CFErrorDomain)MEMORY[0x189602C78](err);
}

CFTypeID CFErrorGetTypeID(void)
{
  return MEMORY[0x189602C80]();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x189602D30](cf);
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

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x189602F68](key, applicationID);
}

CFPropertyListRef CFPreferencesCopyValue( CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x189602F88](key, applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1896030F0](cf);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x189603490](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithFormatAndArguments( CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments)
{
  return (CFStringRef)MEMORY[0x189603498](alloc, formatOptions, format, arguments);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1896034F8](theString, buffer, bufferSize, *(void *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x189603548](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x189603558](length, *(void *)&encoding);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x189604828]();
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return MEMORY[0x189604838]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1895F8898]();
}

void _os_log_error_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(uint64_t identifier, unint64_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1895FAC40](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1895FAD80](label, attr);
}

void dispatch_release(dispatch_object_t object)
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1895FB360](a1, a2);
}

void free(void *a1)
{
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1895FB538](a1);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1895FBC88](__size);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1895FBE18](__dst, __src, __n);
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

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1896166C8](self, _cmd, offset, atomic);
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

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x189616818](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x189616978](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x189616980](obj);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1895FC248](a1, *(void *)&a2);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1895FC470](oslog, type);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1895FD0B8](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1895FD0E8](__s1, __s2, __n);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_from_endpoint(xpc_endpoint_t endpoint)
{
  return (xpc_connection_t)MEMORY[0x1895FD950](endpoint);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1895FD968](name, targetq, flags);
}

void *__cdecl xpc_connection_get_context(xpc_connection_t connection)
{
  return (void *)MEMORY[0x1895FD980](connection);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x1895FD9F0](connection, message);
}

void xpc_connection_set_context(xpc_connection_t connection, void *context)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_finalizer_f(xpc_connection_t connection, xpc_finalizer_t finalizer)
{
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x1895FDA98](object);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1895FDB98](keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x1895FDBB0](original);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return (xpc_connection_t)MEMORY[0x1895FDC38](xdict);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1895FDC48](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1895FDC68](xdict, key);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_dictionary_set_double(xpc_object_t xdict, const char *key, double value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1895FDE70](object);
}

void xpc_release(xpc_object_t object)
{
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x1895FDF88](object);
}

uint64_t objc_msgSend_loadUpdateBrainWithMAOptions_clientOptionsFromPolicy_progressHandler_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_loadUpdateBrainWithMAOptions_clientOptionsFromPolicy_progressHandler_);
}