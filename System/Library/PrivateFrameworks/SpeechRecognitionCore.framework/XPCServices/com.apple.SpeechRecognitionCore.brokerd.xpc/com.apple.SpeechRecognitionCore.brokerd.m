CFIndex RXDebugFlagsUpdate()
{
  int AppBooleanValue;
  BOOL v1;
  char v2;
  char AppIntegerValue;
  char v4;
  CFIndex result;
  Boolean keyExistsAndHasValidFormat;
  dword_10001CE10 = CFPreferencesGetAppIntegerValue( @"RXDebugFlag",  @"com.apple.SpeechRecognitionCore.speechrecognitiond",  0LL);
  byte_10001CE14 = CFPreferencesGetAppBooleanValue( @"RXVeryVerbose",  @"com.apple.SpeechRecognitionCore.speechrecognitiond",  0LL) != 0;
  byte_10001CE15 = CFPreferencesGetAppIntegerValue( @"RXDebugAutomationMode",  @"com.apple.SpeechRecognitionCore.speechrecognitiond",  0LL);
  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue( @"RXDebugAutomationSimulateOpenMic",  @"com.apple.SpeechRecognitionCore.speechrecognitiond",  &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    v1 = AppBooleanValue == 0;
  }
  else {
    v1 = 0;
  }
  v2 = !v1;
  byte_10001CBF0 = v2;
  keyExistsAndHasValidFormat = 0;
  AppIntegerValue = CFPreferencesGetAppIntegerValue( @"RXRecognitionResetTimeInSec",  @"com.apple.SpeechRecognitionCore.speechrecognitiond",  &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    v4 = AppIntegerValue;
  }
  else {
    v4 = 5;
  }
  byte_10001CBF1 = v4;
  result = CFPreferencesGetAppIntegerValue( @"RXDebugAutomationSaveKeywordsAudio",  @"com.apple.SpeechRecognitionCore.speechrecognitiond",  0LL);
  byte_10001CE16 = result != 0LL;
  return result;
}

uint64_t RXLogServerResults()
{
  return dword_10001CE10 >> 7;
}

uint64_t RXLogServerGrammar()
{
  return BYTE1(dword_10001CE10) & 1;
}

uint64_t RXLogSound()
{
  return (BYTE1(dword_10001CE10) >> 1) & 1;
}

uint64_t RXLogClientUpdates()
{
  return (BYTE1(dword_10001CE10) >> 2) & 1;
}

uint64_t RXLogPerformance()
{
  return (BYTE1(dword_10001CE10) >> 3) & 1;
}

uint64_t RXVeryVerbose()
{
  return byte_10001CE14;
}

BOOL RXAutomationModeSynthesis()
{
  return byte_10001CE15 == 1;
}

BOOL RXAutomationModeResult()
{
  return byte_10001CE15 == 2;
}

BOOL RXAutomationModeFileName()
{
  return byte_10001CE15 == 3;
}

uint64_t RXAutomationSimulateOpenMic()
{
  return byte_10001CBF0;
}

uint64_t RXResetTimeInSec()
{
  return byte_10001CBF1;
}

uint64_t RXAutomationSaveKeywordsAudio()
{
  return byte_10001CE16;
}

void __RXAbort(int a1, uint64_t a2, uint64_t a3, uint64_t a4, CFStringRef format, ...)
{
  CFStringRef v9 = CFStringCreateWithFormatAndArguments(0LL, 0LL, format, va);
  CFStringRef v10 = v9;
  if (a4) {
  else
  }
    CFStringRef v11 = CFStringCreateWithFormat(0LL, 0LL, @"%s:%u: %@\n", a2, a3, v9);
  v12 = v11;
  if (v10) {
    CFRelease(v10);
  }
  ExternalRepresentation = CFStringCreateExternalRepresentation(0LL, v12, 0x8000100u, 0);
  if (v12) {
    CFRelease(v12);
  }
  if (ExternalRepresentation)
  {
    BytePtr = CFDataGetBytePtr(ExternalRepresentation);
    size_t Length = CFDataGetLength(ExternalRepresentation);
    write(1, BytePtr, Length);
    CFRelease(ExternalRepresentation);
  }

  if (a1) {
    abort();
  }
}

uint64_t RXIsAppleInternal()
{
  if (qword_10001CE18 != -1) {
    dispatch_once(&qword_10001CE18, &stru_100018728);
  }
  return byte_10001CE17;
}

void sub_100005198(id a1)
{
  byte_10001CE17 = os_variant_has_internal_diagnostics("com.apple.SpeechRecognitionCore.speechrecognitiond");
}

void reportBacktrace()
{
  int v0 = backtrace(&v13, 33);
  uint64_t v1 = (v0 - 2);
  v2 = backtrace_symbols(v14, v1);
  if (v2)
  {
    v3 = v2;
    if (v0 >= 3)
    {
      for (uint64_t i = 0LL; v1 != i; ++i)
      {
        v5 = v3[i];
        if (v5)
        {
          if (qword_10001CE38 != -1) {
            dispatch_once(&qword_10001CE38, &stru_1000187A8);
          }
          uint64_t v6 = qword_10001CE30;
          if (!os_log_type_enabled((os_log_t)qword_10001CE30, OS_LOG_TYPE_ERROR)) {
            continue;
          }
          v7 = v14[i];
          *(_DWORD *)buf = 67109634;
          int v16 = i + 1;
          __int16 v17 = 2048;
          v18 = v7;
          __int16 v19 = 2080;
          v20 = v5;
          v8 = (os_log_s *)v6;
          CFStringRef v9 = "BACKTRACE: %-3d %p %s\n";
          uint32_t v10 = 28;
        }

        else
        {
          if (qword_10001CE38 != -1) {
            dispatch_once(&qword_10001CE38, &stru_1000187A8);
          }
          uint64_t v11 = qword_10001CE30;
          if (!os_log_type_enabled((os_log_t)qword_10001CE30, OS_LOG_TYPE_ERROR)) {
            continue;
          }
          v12 = v14[i];
          *(_DWORD *)buf = 67109376;
          int v16 = i + 1;
          __int16 v17 = 2048;
          v18 = v12;
          v8 = (os_log_s *)v11;
          CFStringRef v9 = "BACKTRACE: %-3d %p\n";
          uint32_t v10 = 18;
        }

        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, v9, buf, v10);
      }
    }

    free(v3);
  }
}

uint64_t RXSignpostLog()
{
  if (qword_10001CE28 != -1) {
    dispatch_once(&qword_10001CE28, &stru_100018768);
  }
  return qword_10001CE20;
}

void sub_1000053E0(id a1)
{
  qword_10001CE20 = (uint64_t)os_log_create("com.apple.SpeechRecognitionCore", "SRCSignposts");
}

uint64_t RXOSLog()
{
  if (qword_10001CE38 != -1) {
    dispatch_once(&qword_10001CE38, &stru_1000187A8);
  }
  return qword_10001CE30;
}

void sub_10000544C(id a1)
{
  qword_10001CE30 = (uint64_t)os_log_create("com.apple.SpeechRecognitionCore", "SRCLogs");
}

CFMutableStringRef RDLanguageAssets::createLanguageFromLocaleID(CFStringRef theString, const __CFString *a2)
{
  CFMutableStringRef MutableCopy = CFStringCreateMutableCopy(0LL, 0LL, theString);
  v4.length = CFStringGetLength(MutableCopy);
  v4.location = 0LL;
  CFStringFindAndReplace(MutableCopy, @"_", @"-", v4, 0LL);
  return MutableCopy;
}

CFMutableStringRef RDLanguageAssets::createLocaleIDFromLanguage(CFStringRef theString, const __CFString *a2)
{
  CFMutableStringRef MutableCopy = CFStringCreateMutableCopy(0LL, 0LL, theString);
  v4.length = CFStringGetLength(MutableCopy);
  v4.location = 0LL;
  CFStringFindAndReplace(MutableCopy, @"-", @"_", v4, 0LL);
  return MutableCopy;
}

const __CFDictionary *RDLanguageAssets::CopyInstallationStatus(RDLanguageAssets *this)
{
  v8 = 0LL;
  if (qword_10001CE48 != -1) {
    dispatch_once(&qword_10001CE48, &stru_1000187E8);
  }
  uint64_t v1 = (const __CFDictionary *)[(id)qword_10001CE40 copyInstallationStatusForLangaugesWithError:&v8];
  v2 = (os_log_s *)RXOSLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint32_t v10 = v1;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "InstallationStatus resultStatus=%@", buf, 0xCu);
  }

  if (v8)
  {
    v3 = (os_log_s *)RXOSLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint32_t v10 = v8;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "InstallationStatus failed with: %@", buf, 0xCu);
    }
  }

  if (!v1) {
    return 0LL;
  }
  CFMutableStringRef MutableCopy = CFDictionaryCreateMutableCopy(kCFAllocatorDefault, 0LL, v1);
  v5 = (RDLanguageAssets *)RXGetAssetFallbackLocales();
  if (v5) {
    RDLanguageAssets::addAliasLocalesToResultStatus(v5, MutableCopy, v6);
  }
  CFRelease(v1);
  return MutableCopy;
}

void RDLanguageAssets::addAliasLocalesToResultStatus( RDLanguageAssets *this, const __CFDictionary *a2, __CFDictionary *a3)
{
  CFIndex Count = CFDictionaryGetCount(this);
  if (Count >= 1)
  {
    CFIndex v6 = Count;
    v7 = (const void **)malloc(8 * Count);
    CFDictionaryGetKeysAndValues(this, v7, 0LL);
    for (uint64_t i = 0LL; i != v6; ++i)
    {
      CFMutableStringRef LanguageFromLocaleID = RDLanguageAssets::createLanguageFromLocaleID((CFStringRef)v7[i], v8);
      Value = (const __CFString *)CFDictionaryGetValue(this, v7[i]);
      if (Value)
      {
        CFMutableStringRef v13 = RDLanguageAssets::createLanguageFromLocaleID(Value, v12);
        v14 = CFDictionaryGetValue(a2, v13);
        if (v14)
        {
          v15 = v14;
          if (!CFDictionaryGetValue(a2, LanguageFromLocaleID)) {
            CFDictionaryAddValue(a2, LanguageFromLocaleID, v15);
          }
        }

        CFRelease(v13);
      }

      CFRelease(LanguageFromLocaleID);
    }

    free(v7);
  }

id RDLanguageAssets::InstallAndCopyQuasarModelPathForLanguage(const __CFString *this, const __CFString *a2)
{
  CFMutableStringRef LocaleIDFromLanguage = RDLanguageAssets::createLocaleIDFromLanguage(this, a2);
  uint64_t v4 = RXGetAssetFallbackLocaleIdentifier();
  CFRelease(LocaleIDFromLanguage);
  uint32_t v10 = 0LL;
  if (qword_10001CE48 != -1) {
    dispatch_once(&qword_10001CE48, &stru_1000187E8);
  }
  if (v4) {
    v5 = (const __CFString *)v4;
  }
  else {
    v5 = this;
  }
  id v6 = [(id)qword_10001CE40 copyInstalledQuasarModelPathForLanguage:v5 error:&v10];
  v7 = (os_log_s *)RXOSLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v12 = this;
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "InstallAndCopyQuasarModelPathForLanguage language=%@ resultPath=%@",  buf,  0x16u);
  }

  if (v10)
  {
    v8 = (os_log_s *)RXOSLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "InstallAndCopyQuasarModelPathForLanguage failed with: %@",  buf,  0xCu);
    }
  }

  return v6;
}

id RDLanguageAssets::CopyInstalledAssetPathForLanguage(const __CFString *this, const __CFString *a2)
{
  CFMutableStringRef LocaleIDFromLanguage = RDLanguageAssets::createLocaleIDFromLanguage(this, a2);
  v3 = (const __CFString *)RXGetAssetFallbackLocaleIdentifier();
  if (!v3) {
    v3 = LocaleIDFromLanguage;
  }
  CFMutableStringRef LanguageFromLocaleID = RDLanguageAssets::createLanguageFromLocaleID(v3, v4);
  uint64_t v9 = 0LL;
  if (qword_10001CE48 != -1) {
    dispatch_once(&qword_10001CE48, &stru_1000187E8);
  }
  id v6 = [(id)qword_10001CE40 copyInstalledAssetPathForLangaugeWithError:LanguageFromLocaleID error:&v9];
  if (v9)
  {
    v7 = (os_log_s *)RXOSLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v11 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "CopyAssetPath failed with: %@", buf, 0xCu);
    }
  }

  return v6;
}

id RDLanguageAssets::CopyInstalledAssetSupportedTasksForLanguage( const __CFString *this, const __CFString *a2)
{
  CFMutableStringRef LocaleIDFromLanguage = RDLanguageAssets::createLocaleIDFromLanguage(this, a2);
  v3 = (const __CFString *)RXGetAssetFallbackLocaleIdentifier();
  if (!v3) {
    v3 = LocaleIDFromLanguage;
  }
  CFMutableStringRef LanguageFromLocaleID = RDLanguageAssets::createLanguageFromLocaleID(v3, v4);
  uint32_t v10 = 0LL;
  if (qword_10001CE48 != -1) {
    dispatch_once(&qword_10001CE48, &stru_1000187E8);
  }
  id v6 = [(id)qword_10001CE40 copyInstalledAssetSupportedTasksForLangaugeWithError:LanguageFromLocaleID error:&v10];
  if (v10)
  {
    v7 = (os_log_s *)RXOSLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "CopyAssetSupportedTasks failed with: %@",  buf,  0xCu);
    }
  }

  v8 = (os_log_s *)RXOSLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "RDLanguageAssets: supportedTasks:%@", buf, 0xCu);
  }

  return v6;
}

void RDLanguageAssets::CancelDownloadForLanguage(RDLanguageAssets *this, const __CFString *a2)
{
  v3 = (os_log_s *)RXOSLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v7 = this;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "CancelDownloadForLanguage language=%@",  buf,  0xCu);
  }

  v5 = 0LL;
  if (qword_10001CE48 != -1) {
    dispatch_once(&qword_10001CE48, &stru_1000187E8);
  }
  [(id)qword_10001CE40 cancelDownloadForLanguage:this error:&v5];
  if (v5)
  {
    uint64_t v4 = (os_log_s *)RXOSLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v7 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_ERROR,  "CancelDownloadForLanguage failed with: %@",  buf,  0xCu);
    }
  }

id RDLanguageAssets::PurgeInstalledQuasarAssets(RDLanguageAssets *this)
{
  v5 = 0LL;
  if (qword_10001CE48 != -1) {
    dispatch_once(&qword_10001CE48, &stru_1000187E8);
  }
  id v1 = [(id)qword_10001CE40 purgeInstalledAssetsWithError:&v5];
  v2 = (os_log_s *)RXOSLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v7 = v1;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Assets purged %@", buf, 0xCu);
  }

  if (v5)
  {
    v3 = (os_log_s *)RXOSLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v7 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_ERROR,  "PurgeInstalledQuasarAssets failed with: %@",  buf,  0xCu);
    }
  }

  return [v1 intValue];
}

void RDLanguageAssets::SetPurgeabilityForLanguages(RDLanguageAssets *this, const __CFArray *a2)
{
  uint64_t v4 = (os_log_s *)RXOSLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v8 = this;
    __int16 v9 = 1024;
    int v10 = (int)a2;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "SetPurgeabilityForLanguages languages=%@%d",  buf,  0x12u);
  }

  id v6 = 0LL;
  if (qword_10001CE48 != -1) {
    dispatch_once(&qword_10001CE48, &stru_1000187E8);
  }
  [(id)qword_10001CE40 setPurgeabilityForLanguages:this withPurgeability:a2 error:&v6];
  if (v6)
  {
    v5 = (os_log_s *)RXOSLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v8 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "SetPurgeabilityForLanguages failed with: %@",  buf,  0xCu);
    }
  }

id RDLanguageAssets::RemovePeerForProgressCallback(_xpc_connection_s *a1)
{
  v2 = (os_log_s *)RXOSLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109120;
    v4[1] = xpc_connection_get_pid(a1);
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "Removing Peer %d for callback",  (uint8_t *)v4,  8u);
  }

  if (qword_10001CE48 != -1) {
    dispatch_once(&qword_10001CE48, &stru_1000187E8);
  }
  return [(id)qword_10001CE40 removePeerFromCallback:a1];
}

id RDLanguageAssets::AddPeerForProgressCallback(_xpc_connection_s *a1)
{
  v2 = (os_log_s *)RXOSLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109120;
    v4[1] = xpc_connection_get_pid(a1);
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Adding Peer %d for callback", (uint8_t *)v4, 8u);
  }

  if (qword_10001CE48 != -1) {
    dispatch_once(&qword_10001CE48, &stru_1000187E8);
  }
  return [(id)qword_10001CE40 addPeerForCallback:a1];
}

void sub_100006094(id a1)
{
  int v1 = _os_feature_enabled_impl("VoiceControl", "new_asset_manager");
  v2 = (os_log_s *)RXOSLog();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);
  if (v1)
  {
    if (v3)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Using RDAssetManager2", buf, 2u);
    }

    uint64_t v4 = &off_100018240;
  }

  else
  {
    if (v3)
    {
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Using original RDAssetManager", v5, 2u);
    }

    uint64_t v4 = off_100018238;
  }

  qword_10001CE40 = -[__objc2_class sharedInstance](*v4, "sharedInstance");
}

void sub_1000065E8(id a1)
{
  qword_10001CE50 = objc_alloc_init(&OBJC_CLASS___RDAssetManager);
}

void sub_100006768(uint64_t a1)
{
  v2 = (os_log_s *)RXOSLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    if (*(_BYTE *)(a1 + 40)) {
      BOOL v3 = @"with";
    }
    else {
      BOOL v3 = @"without";
    }
    *(_DWORD *)buf = 138412290;
    uint64_t v11 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "Kicking off catalog download %@ urgency",  buf,  0xCu);
  }

  if (([*(id *)(a1 + 32) catalogDownloadInProgress] & 1) == 0)
  {
    if (*(_BYTE *)(a1 + 40))
    {
      uint64_t v4 = *(double **)(a1 + 32);
LABEL_12:
      [v4 setCatalogDownloadInProgress:1];
      id v7 = (os_log_s *)RXOSLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Downloading EmbeddedSpeech catalog",  buf,  2u);
      }

      id v8 = sub_100006944(*(unsigned __int8 *)(a1 + 40));
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472LL;
      v9[2] = sub_100006994;
      v9[3] = &unk_100018858;
      v9[4] = *(void *)(a1 + 32);
      +[MAAsset startCatalogDownload:options:then:]( &OBJC_CLASS___MAAsset,  "startCatalogDownload:options:then:",  @"com.apple.MobileAsset.EmbeddedSpeech",  v8,  v9);
      return;
    }

    -[NSDate timeIntervalSinceReferenceDate]( +[NSDate date](&OBJC_CLASS___NSDate, "date"),  "timeIntervalSinceReferenceDate");
    uint64_t v4 = *(double **)(a1 + 32);
    if (v5 - v4[1] >= 86400.0) {
      goto LABEL_12;
    }
    id v6 = (os_log_s *)RXOSLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Too early since last catalog download. Returning.",  buf,  2u);
    }
  }

id sub_100006944(int a1)
{
  id v2 = objc_alloc_init(&OBJC_CLASS___MADownloadOptions);
  [v2 setAllowsCellularAccess:0];
  [v2 setDiscretionary:a1 ^ 1u];
  [v2 setRequiresPowerPluggedIn:0];
  return v2;
}

id sub_100006994(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (os_log_s *)RXOSLog();
  double v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v6 = [*(id *)(a1 + 32) _errorStringForDownloadResult:a2];
      *(_DWORD *)buf = 138412290;
      id v27 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "The MobileAsset catalog download failed: error = %@",  buf,  0xCu);
    }

    id result = [*(id *)(a1 + 32) sendCallback];
    if ((_DWORD)result)
    {
      id v8 = *(void **)(a1 + 32);
      id v9 = [v8 _errorStringForDownloadResult:a2];
      LODWORD(v10) = -1.0;
      LODWORD(v11) = -1.0;
      LODWORD(v12) = -1.0;
      return [v8 _sendDownloadCallbackDictionaryWithLanguage:0 downloadPhase:@"DownloadFailed" timeRemaining:v9 bytesWritten:v10 bytesTotal:v11 error:v12];
    }
  }

  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Sucessfully downloaded the catalog", buf, 2u);
    }

    -[NSDate timeIntervalSinceReferenceDate]( +[NSDate date](&OBJC_CLASS___NSDate, "date"),  "timeIntervalSinceReferenceDate");
    *(void *)(*(void *)(a1 + 32) + 8LL) = v13;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    id v14 = [*(id *)(a1 + 32) requestedLanguagesForDownload];
    id result = [v14 countByEnumeratingWithState:&v22 objects:v28 count:16];
    if (result)
    {
      id v15 = result;
      uint64_t v16 = *(void *)v23;
      do
      {
        __int16 v17 = 0LL;
        do
        {
          if (*(void *)v23 != v16) {
            objc_enumerationMutation(v14);
          }
          uint64_t v18 = *(void *)(*((void *)&v22 + 1) + 8LL * (void)v17);
          uint64_t v19 = *(void *)(a1 + 32);
          v20 = *(dispatch_queue_s **)(v19 + 24);
          v21[0] = _NSConcreteStackBlock;
          v21[1] = 3221225472LL;
          v21[2] = sub_100006BC8;
          v21[3] = &unk_100018830;
          v21[4] = v19;
          v21[5] = v18;
          dispatch_async(v20, v21);
          __int16 v17 = (char *)v17 + 1;
        }

        while (v15 != v17);
        id result = [v14 countByEnumeratingWithState:&v22 objects:v28 count:16];
        id v15 = result;
      }

      while (result);
    }
  }

  return result;
}

id sub_100006BC8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchRemoteAssetForLanguage:*(void *)(a1 + 40)];
}

void sub_100006CB0(uint64_t a1, uint64_t a2)
{
}

void sub_100006CC0(uint64_t a1)
{
}

id sub_100006CCC(uint64_t a1)
{
  uint64_t v3 = 0LL;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) =  [*(id *)(a1 + 32) queryAndCopyInstallationStatusForLangaugesWithError:&v3];
  id result = *(id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
  if (!result || (id result = [result count]) == 0) {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL) = v3;
  }
  return result;
}

id sub_1000072E8(void *a1)
{
  int v1 = (const __CFString *)[a1 stringByAppendingPathComponent:@"mini.json"];
  if (-[NSFileManager fileExistsAtPath:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "fileExistsAtPath:",  v1))
  {
    id v2 = +[NSData dataWithContentsOfFile:](&OBJC_CLASS___NSData, "dataWithContentsOfFile:", v1);
    if (v2)
    {
      uint64_t v19 = 0LL;
      id v3 = +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v2,  0LL,  &v19);
      if (!v19)
      {
        uint64_t v13 = v3;
        uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSDictionary);
        if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0)
        {
          id v15 = [v13 objectForKey:@"model-info"];
          uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSDictionary);
          if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0)
          {
            id v17 = [v15 objectForKey:@"tasks"];
            uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSArray);
            if ((objc_opt_isKindOfClass(v17, v18) & 1) != 0) {
              return [v17 containsObject:@"DictationCC"];
            }
          }
        }

        return 0LL;
      }

      uint64_t v4 = (os_log_s *)RXOSLog();
      BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
      id result = 0LL;
      if (!v5) {
        return result;
      }
      *(_DWORD *)buf = 138412290;
      v21 = v1;
      id v7 = "%@ : not a valid json";
    }

    else
    {
      uint64_t v4 = (os_log_s *)RXOSLog();
      BOOL v12 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
      id result = 0LL;
      if (!v12) {
        return result;
      }
      *(_DWORD *)buf = 138412290;
      v21 = v1;
      id v7 = "could not read contents from : %@";
    }

    double v10 = v4;
    uint32_t v11 = 12;
  }

  else
  {
    id v8 = (os_log_s *)RXOSLog();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    id result = 0LL;
    if (!v9) {
      return result;
    }
    *(_DWORD *)buf = 138412546;
    v21 = @"mini.json";
    __int16 v22 = 2112;
    __int128 v23 = v1;
    id v7 = "%@ does not exist at: %@ ";
    double v10 = v8;
    uint32_t v11 = 22;
  }

  _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v7, buf, v11);
  return 0LL;
}

void sub_100007900( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

id sub_100007918(uint64_t a1)
{
  uint64_t v3 = 0LL;
  id result = [*(id *)(a1 + 32) _cancelDownloadForLangaugeWithError:*(void *)(a1 + 40) withError:&v3];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL) = v3;
  return result;
}

void sub_100007DFC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

NSError *sub_100007E20(uint64_t a1)
{
  if ([*(id *)(a1 + 32) catalogDownloadInProgress])
  {
    id result = (NSError *)objc_msgSend( objc_msgSend(*(id *)(a1 + 32), "requestedLanguagesForDownload"),  "containsObject:",  *(void *)(a1 + 40));
    if ((result & 1) == 0)
    {
      uint64_t v3 = (os_log_s *)RXOSLog();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v4 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Catalog download is in progress, caching %@",  buf,  0xCu);
      }

      objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "requestedLanguagesForDownload"), "addObject:", *(void *)(a1 + 40));
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL) = 0LL;
      NSErrorUserInfoKey v5 = NSLocalizedFailureReasonErrorKey;
      id v6 = @"Catalog download in progress";
      id result = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"kRXAssetDownloadErrorDomain",  100LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v6,  &v5,  1LL));
      *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL) = result;
    }
  }

  else
  {
    *(void *)buf = 0LL;
    id result = (NSError *)objc_msgSend( objc_msgSend( objc_msgSend( *(id *)(a1 + 32),  "_installedAssetForLanguage:error:",  *(void *)(a1 + 40),  buf),  "_es_quasarModelPath"),  "copy");
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL) = result;
    if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL)) {
      *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL) = *(void *)buf;
    }
  }

  return result;
}

void sub_100008034(int8x16_t *a1, uint64_t a2)
{
  v5[1] = 3221225472LL;
  int8x16_t v2 = vextq_s8(a1[2], a1[2], 8uLL);
  uint64_t v3 = a1[2].i64[0];
  v5[0] = _NSConcreteStackBlock;
  uint64_t v4 = *(dispatch_queue_s **)(v3 + 24);
  v5[2] = sub_1000080A0;
  v5[3] = &unk_100018920;
  int8x16_t v6 = v2;
  uint64_t v7 = a1[3].i64[0];
  uint64_t v8 = a2;
  dispatch_async(v4, v5);
}

void sub_1000080A0(uint64_t a1)
{
  if (*(void *)(a1 + 56))
  {
    int8x16_t v2 = (os_log_s *)RXOSLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      id v4 = [*(id *)(a1 + 40) _errorStringForQueryResult:*(void *)(a1 + 56)];
      *(_DWORD *)buf = 138412546;
      uint64_t v12 = v3;
      __int16 v13 = 2112;
      id v14 = v4;
      NSErrorUserInfoKey v5 = "Async asset query failed for query=%@, error=%@";
      int8x16_t v6 = v2;
      os_log_type_t v7 = OS_LOG_TYPE_ERROR;
      uint32_t v8 = 22;
LABEL_4:
      _os_log_impl((void *)&_mh_execute_header, v6, v7, v5, buf, v8);
    }
  }

  else
  {
    uint64_t v10 = 0LL;
    if (!objc_msgSend( *(id *)(a1 + 40),  "_installedAssetFromFoundAssets:language:error:",  objc_msgSend(*(id *)(a1 + 32), "results"),  *(void *)(a1 + 48),  &v10))
    {
      uint64_t v9 = (os_log_s *)RXOSLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v12 = v10;
        NSErrorUserInfoKey v5 = "Remote fetch asset fetch got assets but none have been installed yet: %@";
        int8x16_t v6 = v9;
        os_log_type_t v7 = OS_LOG_TYPE_DEFAULT;
        uint32_t v8 = 12;
        goto LABEL_4;
      }
    }
  }
}

LABEL_17:
        __int16 v13 = 0LL;
        uint32_t v11 = 0;
        break;
    }

    if (a5) {
      *a5 = v13;
    }
    v20 = (os_log_s *)RXOSLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = [a3 state];
      *(_DWORD *)buf = 134218498;
      if (v11) {
        __int16 v22 = 0LL;
      }
      else {
        __int16 v22 = v13;
      }
      v33 = v21;
      v34 = 1024;
      v35 = v11;
      v36 = 2112;
      v37 = v22;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Asset download state=%ld, success=%d, error=%@",  buf,  0x1Cu);
    }
  }

  return v11;
}

id sub_1000090E8(uint64_t a1, void *a2)
{
  unsigned __int8 v4 = [a2 isStalled];
  NSErrorUserInfoKey v5 = (os_log_s *)RXOSLog();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if ((v4 & 1) != 0)
  {
    if (v6)
    {
      int v25 = 134218240;
      double v26 = COERCE_DOUBLE([a2 totalWritten]);
      __int16 v27 = 2048;
      id v28 = [a2 totalExpected];
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Asset Download Progress stalled at %lld of %lld bytes",  (uint8_t *)&v25,  0x16u);
    }

    id result = [*(id *)(a1 + 32) sendCallback];
    if ((_DWORD)result)
    {
      uint32_t v8 = *(void **)(a1 + 32);
      id v9 = objc_msgSend(*(id *)(a1 + 40), "_es_language");
      float v10 = (float)(uint64_t)[a2 totalWritten];
      *(float *)&double v11 = (float)(uint64_t)[a2 totalExpected];
      uint64_t v12 = @"Stalled";
      LODWORD(v13) = -1.0;
      id v14 = v8;
      id v15 = v9;
      *(float *)&double v16 = v10;
      return [v14 _sendDownloadCallbackDictionaryWithLanguage:v15 downloadPhase:v12 timeRemaining:0 bytesWritten:v13 bytesTotal:v16 error:v11];
    }
  }

  else
  {
    if (v6)
    {
      float v17 = (float)(uint64_t)[a2 totalWritten];
      double v18 = (float)(v17 / (float)(uint64_t)[a2 totalExpected]);
      [a2 expectedTimeRemaining];
      int v25 = 134218240;
      double v26 = v18;
      __int16 v27 = 2048;
      id v28 = v19;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Asset Download progress: %.2f percent , ~%.2f seconds remaining",  (uint8_t *)&v25,  0x16u);
    }

    id result = [*(id *)(a1 + 32) sendCallback];
    if ((_DWORD)result)
    {
      v20 = *(void **)(a1 + 32);
      id v21 = objc_msgSend(*(id *)(a1 + 40), "_es_language");
      [a2 expectedTimeRemaining];
      float v23 = v22;
      float v24 = (float)(uint64_t)[a2 totalWritten];
      *(float *)&double v11 = (float)(uint64_t)[a2 totalExpected];
      uint64_t v12 = @"Downloading";
      id v14 = v20;
      id v15 = v21;
      *(float *)&double v13 = v23;
      *(float *)&double v16 = v24;
      return [v14 _sendDownloadCallbackDictionaryWithLanguage:v15 downloadPhase:v12 timeRemaining:0 bytesWritten:v13 bytesTotal:v16 error:v11];
    }
  }

  return result;
}

void sub_1000092D8(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    if ([*(id *)(a1 + 32) sendCallback])
    {
      unsigned __int8 v4 = *(void **)(a1 + 32);
      id v5 = objc_msgSend(*(id *)(a1 + 40), "_es_language");
      id v6 = [*(id *)(a1 + 32) _errorStringForDownloadResult:a2];
      LODWORD(v7) = -1.0;
      LODWORD(v_Block_object_dispose((const void *)(v9 - 96), 8) = -1.0;
      LODWORD(v9) = -1.0;
      [v4 _sendDownloadCallbackDictionaryWithLanguage:v5 downloadPhase:@"DownloadFailed" timeRemaining:v6 bytesWritten:v7 bytesTotal:v8 error:v9];
    }

    float v10 = (os_log_s *)RXOSLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = [*(id *)(a1 + 32) _errorStringForDownloadResult:a2];
      int v18 = 138412290;
      id v19 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "Asset download failed: %@",  (uint8_t *)&v18,  0xCu);
    }
  }

  else
  {
    uint64_t v12 = (os_log_s *)RXOSLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v1_Block_object_dispose((const void *)(v9 - 96), 8) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Asset download successful",  (uint8_t *)&v18,  2u);
    }

    if ([*(id *)(a1 + 32) sendCallback])
    {
      double v13 = *(void **)(a1 + 32);
      id v14 = objc_msgSend(*(id *)(a1 + 40), "_es_language");
      LODWORD(v15) = -1.0;
      LODWORD(v16) = -1.0;
      LODWORD(v17) = -1.0;
      [v13 _sendDownloadCallbackDictionaryWithLanguage:v14 downloadPhase:@"Downloaded" timeRemaining:0 bytesWritten:v15 bytesTotal:v16 error:v17];
    }
  }

void sub_10000944C(uint64_t a1, uint64_t a2)
{
  unsigned __int8 v4 = (os_log_s *)RXOSLog();
  id v5 = v4;
  if (a2)
  {
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      return;
    }
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = [*(id *)(a1 + 40) _errorStringForPurgeResult:a2];
    int v13 = 138412546;
    uint64_t v14 = v6;
    __int16 v15 = 2112;
    id v16 = v7;
    double v8 = "Failed to purge %@: %@";
    double v9 = v5;
    os_log_type_t v10 = OS_LOG_TYPE_ERROR;
    uint32_t v11 = 22;
  }

  else
  {
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    uint64_t v12 = *(void *)(a1 + 32);
    int v13 = 138412290;
    uint64_t v14 = v12;
    double v8 = "Purged %@";
    double v9 = v5;
    os_log_type_t v10 = OS_LOG_TYPE_DEFAULT;
    uint32_t v11 = 12;
  }

  _os_log_impl((void *)&_mh_execute_header, v9, v10, v8, (uint8_t *)&v13, v11);
}

NSNumber *sub_100009560(void *a1, uint64_t a2)
{
  id v4 = [[MAAssetQuery alloc] initWithType:@"com.apple.MobileAsset.EmbeddedSpeech"];
  id v5 = [v4 queryMetaDataSync];
  if (v5)
  {
    id v6 = v5;
    id v7 = (os_log_s *)RXOSLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      id v25 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "MobileAsset is sad: %ld", buf, 0xCu);
    }

    if (a1)
    {
      double v22 = @"MAQueryResult";
      float v23 = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v6);
      *a1 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"kRXAssetDownloadErrorDomain",  101LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v23,  &v22,  1LL));
    }

    return 0LL;
  }

  else
  {
    id v9 = [v4 results];

    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    id v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = 0LL;
      uint64_t v13 = *(void *)v18;
      uint64_t v14 = ASAttributeUnarchivedSize;
      do
      {
        for (uint64_t i = 0LL; i != v11; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v9);
          }
          id v16 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
          if (objc_msgSend(v16, "_es_isInstalled"))
          {
            buf[0] = 0;
            (*(void (**)(uint64_t, void *, uint8_t *))(a2 + 16))(a2, v16, buf);
            if (buf[0]) {
              return +[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v12);
            }
            v12 += (uint64_t)objc_msgSend( objc_msgSend(objc_msgSend(v16, "attributes"), "objectForKey:", v14),  "longLongValue");
          }
        }

        id v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }

      while (v11);
    }

    else
    {
      uint64_t v12 = 0LL;
    }

    return +[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v12);
  }

void sub_100009860( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_100009878(uint64_t a1, void *a2, _BYTE *a3)
{
  id v6 = (os_log_s *)RXOSLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v13 = a2;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Purging asset for CacheDelete: %@", buf, 0xCu);
  }

  id v7 = [a2 purgeSync];
  if (v7)
  {
    id v11 = +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v7, @"MAPurgeResult");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL) = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"kRXAssetDownloadErrorDomain",  102LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v11,  &v10,  1LL));
    double v8 = (os_log_s *)RXOSLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
      *(_DWORD *)buf = 138412290;
      uint64_t v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Purging failed: %@", buf, 0xCu);
    }

    *a3 = 1;
  }

void sub_100009A34(_Unwind_Exception *a1)
{
}

void sub_100009A90(_Unwind_Exception *a1)
{
}

void sub_100009AEC(_Unwind_Exception *a1)
{
}

void sub_100009FF8(_Unwind_Exception *exception_object)
{
}

void sub_10000A250(id a1)
{
  qword_10001CE60 = objc_alloc_init(&OBJC_CLASS___RDAssetManager2);
}

void sub_10000AA28(uint64_t a1, uint64_t a2)
{
}

void sub_10000AA38(uint64_t a1)
{
}

id sub_10000AA44(uint64_t a1)
{
  uint64_t v3 = 0LL;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) =  [*(id *)(a1 + 32) _queryAndCopyInstallationStatusForLanguagesWithError:&v3];
  id result = *(id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
  if (!result || (id result = [result count]) == 0) {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL) = v3;
  }
  return result;
}

void sub_10000B0C0(_Unwind_Exception *a1)
{
}

uint64_t sub_10000B110(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [a2 copy];
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

id sub_10000B4C8(uint64_t a1)
{
  uint64_t v3 = 0LL;
  id result = [*(id *)(a1 + 32) _cancelDownloadForLanguageWithError:*(void *)(a1 + 40) withError:&v3];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL) = v3;
  return result;
}

void sub_10000B904(uint64_t a1)
{
  uint64_t v5 = 0LL;
  +[SFSpeechAssetManager setAssetsPurgeability:forLanguages:error:]( &OBJC_CLASS___SFSpeechAssetManager,  "setAssetsPurgeability:forLanguages:error:",  *(unsigned __int8 *)(a1 + 56),  *(void *)(a1 + 32),  &v5);
  int8x16_t v2 = (os_log_s *)RXOSLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    int v4 = *(unsigned __int8 *)(a1 + 56);
    *(_DWORD *)buf = 138412802;
    uint64_t v7 = v3;
    __int16 v8 = 1024;
    int v9 = v4;
    __int16 v10 = 2112;
    uint64_t v11 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "setPurgeabilityForLanguages, languages=%@  purgeability= %d error=%@",  buf,  0x1Cu);
  }

  *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL) = v5;
}

void sub_10000BBDC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

id sub_10000BC00(uint64_t a1)
{
  uint64_t v3 = 0LL;
  id result = objc_msgSend( objc_msgSend(*(id *)(a1 + 32), "_installedAssetForLanguage:error:", *(void *)(a1 + 40), &v3),  "copy");
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL)) {
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL) = v3;
  }
  return result;
}

void sub_10000C028( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t sub_10000C050(uint64_t a1, void *a2, uint64_t a3)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL) = a3;
  if (!a3) {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL) = a2;
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

__n128 sub_10000C480(uint64_t a1, uint64_t a2, char a3)
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  __int128 v3 = *(_OWORD *)(a1 + 32);
  int v4 = *(dispatch_queue_s **)(*(void *)(a1 + 32) + 16LL);
  v6[2] = sub_10000C4FC;
  v6[3] = &unk_100018DB0;
  __int128 v7 = v3;
  int v10 = *(_DWORD *)(a1 + 56);
  uint64_t v8 = *(void *)(a1 + 48);
  uint64_t v9 = a2;
  int v11 = *(_DWORD *)(a1 + 60);
  char v12 = a3;
  dispatch_async(v4, v6);
  return result;
}

void sub_10000C4FC(uint64_t a1)
{
  if ([*(id *)(a1 + 32) _isActiveDownloadForLanguage:*(void *)(a1 + 40) downloadId:*(unsigned int *)(a1 + 64)])
  {
    float v2 = fmin((double)*(unint64_t *)(a1 + 56) / 100.0, 1.0);
    -[NSDate timeIntervalSinceDate:]( +[NSDate date](&OBJC_CLASS___NSDate, "date"),  "timeIntervalSinceDate:",  *(void *)(a1 + 48));
    float v4 = -1.0;
    if (v2 > 0.0)
    {
      if (v3 < 0.0) {
        double v3 = 0.0;
      }
      float v5 = v3;
      float v4 = (1.0 - v2) * v5 / v2;
    }

    float v6 = *(float *)(a1 + 68) * v2;
    __int128 v7 = *(void **)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    if (*(_BYTE *)(a1 + 72))
    {
      [v7 _stalledDownloadForLanguage:v8];
      uint64_t v9 = (os_log_s *)RXOSLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        double v10 = (float)(v6 / *(float *)(a1 + 68));
        int v11 = *(_DWORD *)(a1 + 64);
        id v12 = [*(id *)(a1 + 32) _downloadStatusDescription];
        int v26 = 134218754;
        *(double *)__int16 v27 = v10;
        *(_WORD *)&v27[8] = 2048;
        *(double *)&v27[10] = v4;
        __int16 v28 = 1024;
        int v29 = v11;
        __int16 v30 = 2112;
        id v31 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Asset Download Progress stalled at : %.2f ratio , ~%.2f seconds remaining, downloadId=%d, %@",  (uint8_t *)&v26,  0x26u);
      }

      if ([*(id *)(a1 + 32) _sendCallback])
      {
        id v16 = *(void **)(a1 + 32);
        uint64_t v17 = *(void *)(a1 + 40);
        LODWORD(v15) = *(_DWORD *)(a1 + 68);
        __int128 v18 = @"Stalled";
        LODWORD(v13) = -1.0;
LABEL_19:
        *(float *)&double v14 = v6;
        [v16 _sendDownloadCallbackDictionaryWithLanguage:v17 downloadPhase:v18 timeRemaining:0 bytesWritten:v13 bytesTotal:v14 error:v15];
      }
    }

    else
    {
      double v22 = (os_log_s *)RXOSLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        double v23 = (float)(v6 / *(float *)(a1 + 68));
        int v24 = *(_DWORD *)(a1 + 64);
        id v25 = [*(id *)(a1 + 32) _downloadStatusDescription];
        int v26 = 134218754;
        *(double *)__int16 v27 = v23;
        *(_WORD *)&v27[8] = 2048;
        *(double *)&v27[10] = v4;
        __int16 v28 = 1024;
        int v29 = v24;
        __int16 v30 = 2112;
        id v31 = v25;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Asset Download progress: %.2f ratio , ~%.2f seconds remaining, downloadId=%d, %@",  (uint8_t *)&v26,  0x26u);
      }

      if ([*(id *)(a1 + 32) _sendCallback])
      {
        id v16 = *(void **)(a1 + 32);
        uint64_t v17 = *(void *)(a1 + 40);
        LODWORD(v15) = *(_DWORD *)(a1 + 68);
        __int128 v18 = @"Downloading";
        *(float *)&double v13 = v4;
        goto LABEL_19;
      }
    }
  }

  else
  {
    __int128 v19 = (os_log_s *)RXOSLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = *(_DWORD *)(a1 + 64);
      id v21 = [*(id *)(a1 + 32) _downloadStatusDescription];
      int v26 = 67109378;
      *(_DWORD *)__int16 v27 = v20;
      *(_WORD *)&v27[4] = 2112;
      *(void *)&v27[6] = v21;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Ignoring non-active asset download progress downloadId=%d, %@",  (uint8_t *)&v26,  0x12u);
    }
  }

__n128 sub_10000C7CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  __int128 v3 = *(_OWORD *)(a1 + 32);
  float v4 = *(dispatch_queue_s **)(*(void *)(a1 + 32) + 16LL);
  block[2] = sub_10000C840;
  block[3] = &unk_100018E00;
  __int128 v7 = v3;
  int v10 = *(_DWORD *)(a1 + 48);
  uint64_t v8 = a3;
  uint64_t v9 = a2;
  int v11 = *(_DWORD *)(a1 + 52);
  dispatch_async(v4, block);
  return result;
}

void sub_10000C840(uint64_t a1)
{
  if ([*(id *)(a1 + 32) _isActiveDownloadForLanguage:*(void *)(a1 + 40) downloadId:*(unsigned int *)(a1 + 64)])
  {
    [*(id *)(a1 + 32) _endAllDownloadsForLanguage:*(void *)(a1 + 40)];
    float v2 = *(NSError **)(a1 + 48);
    if ([*(id *)(a1 + 56) length]) {
      unsigned int v3 = sub_10000D1E0(*(void **)(a1 + 56), 0LL, (uint64_t)@"DictationCC");
    }
    else {
      unsigned int v3 = 0;
    }
    if ([*(id *)(a1 + 56) length] && (v3 & 1) == 0)
    {
      NSErrorUserInfoKey v34 = NSLocalizedFailureReasonErrorKey;
      v35 = @"Asset is incompatible";
      float v2 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"kRXAssetDownloadErrorDomain",  101LL,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v35,  &v34,  1LL));
    }

    __int128 v7 = (os_log_s *)RXOSLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 56);
      int v9 = *(_DWORD *)(a1 + 64);
      id v10 = [*(id *)(a1 + 32) _downloadStatusDescription];
      int v26 = 138413314;
      *(void *)__int16 v27 = v8;
      *(_WORD *)&v27[8] = 2112;
      *(void *)&v27[10] = v2;
      __int16 v28 = 1024;
      unsigned int v29 = v3;
      __int16 v30 = 1024;
      int v31 = v9;
      __int16 v32 = 2112;
      id v33 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Asset downloaded, assetPath=%@, error=%@, isCompatibleAsset=%d, downloadId=%d, %@",  (uint8_t *)&v26,  0x2Cu);
    }

    int v11 = (os_log_s *)RXOSLog();
    id v12 = v11;
    if (v3)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v26) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Asset download successful",  (uint8_t *)&v26,  2u);
      }

      int v13 = *(_DWORD *)(a1 + 68);
      if ([*(id *)(a1 + 32) _sendCallback])
      {
        LODWORD(v16) = *(_DWORD *)(a1 + 68);
        LODWORD(v14) = 0;
        LODWORD(v15) = v13;
        [*(id *)(a1 + 32) _sendDownloadCallbackDictionaryWithLanguage:*(void *)(a1 + 40) downloadPhase:@"Downloading" timeRemaining:0 bytesWritten:v14 bytesTotal:v15 error:v16];
        uint64_t v17 = *(void **)(a1 + 32);
        uint64_t v18 = *(void *)(a1 + 40);
        LODWORD(v19) = *(_DWORD *)(a1 + 68);
        int v20 = @"Downloaded";
        LODWORD(v21) = 0;
        LODWORD(v22) = v13;
        id v23 = 0LL;
LABEL_21:
        [v17 _sendDownloadCallbackDictionaryWithLanguage:v18 downloadPhase:v20 timeRemaining:v23 bytesWritten:v21 bytesTotal:v22 error:v19];
      }
    }

    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v26) = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Asset download failed", (uint8_t *)&v26, 2u);
      }

      if ([*(id *)(a1 + 32) _sendCallback])
      {
        id v25 = *(void **)(a1 + 32);
        uint64_t v24 = *(void *)(a1 + 40);
        id v23 = -[NSError description](v2, "description");
        int v20 = @"DownloadFailed";
        LODWORD(v21) = -1.0;
        LODWORD(v22) = -1.0;
        LODWORD(v19) = -1.0;
        uint64_t v17 = v25;
        uint64_t v18 = v24;
        goto LABEL_21;
      }
    }
  }

  else
  {
    float v4 = (os_log_s *)RXOSLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = *(_DWORD *)(a1 + 64);
      id v6 = [*(id *)(a1 + 32) _downloadStatusDescription];
      int v26 = 67109378;
      *(_DWORD *)__int16 v27 = v5;
      *(_WORD *)&v27[4] = 2112;
      *(void *)&v27[6] = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Ignoring non-active asset download downloadId=%d, %@",  (uint8_t *)&v26,  0x12u);
    }
  }

void sub_10000CB88(_Unwind_Exception *a1)
{
}

void sub_10000CBE4(_Unwind_Exception *a1)
{
}

void sub_10000CC40(_Unwind_Exception *a1)
{
}

void sub_10000D14C(_Unwind_Exception *exception_object)
{
}

id sub_10000D1E0(void *a1, void *a2, uint64_t a3)
{
  if (![a1 length])
  {
    int v13 = (os_log_s *)RXOSLog();
    id result = (id)os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (!(_DWORD)result) {
      return result;
    }
    *(_WORD *)buf = 0;
    id v12 = "empty quasarModelPath";
    double v14 = v13;
    os_log_type_t v15 = OS_LOG_TYPE_ERROR;
    uint32_t v16 = 2;
    goto LABEL_14;
  }

  id v6 = (const __CFString *)[a1 stringByAppendingPathComponent:@"mini.json"];
  if (!-[NSFileManager fileExistsAtPath:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "fileExistsAtPath:",  v6))
  {
    uint64_t v17 = (os_log_s *)RXOSLog();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    id result = 0LL;
    if (!v18) {
      return result;
    }
    *(_DWORD *)buf = 138412546;
    v39 = @"mini.json";
    __int16 v40 = 2112;
    v41 = v6;
    id v12 = "%@ does not exist at: %@ ";
    double v14 = v17;
    os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
    uint32_t v16 = 22;
    goto LABEL_14;
  }

  __int128 v7 = +[NSData dataWithContentsOfFile:](&OBJC_CLASS___NSData, "dataWithContentsOfFile:", v6);
  if (!v7)
  {
    int v9 = (os_log_s *)RXOSLog();
    BOOL v19 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    id result = 0LL;
    if (!v19) {
      return result;
    }
    *(_DWORD *)buf = 138412290;
    v39 = v6;
    id v12 = "could not read contents from : %@";
    goto LABEL_13;
  }

  uint64_t v37 = 0LL;
  id v8 = +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v7,  0LL,  &v37);
  if (v37)
  {
    int v9 = (os_log_s *)RXOSLog();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    id result = 0LL;
    if (!v10) {
      return result;
    }
    *(_DWORD *)buf = 138412290;
    v39 = v6;
    id v12 = "%@ : not a valid json";
LABEL_13:
    double v14 = v9;
    os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
    uint32_t v16 = 12;
LABEL_14:
    _os_log_impl((void *)&_mh_execute_header, v14, v15, v12, buf, v16);
    return 0LL;
  }

  int v20 = v8;
  uint64_t v21 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v20, v21) & 1) == 0) {
    return 0LL;
  }
  objc_msgSend( +[_EARSpeechRecognizer minimumSupportedConfigurationVersion]( _EARSpeechRecognizer,  "minimumSupportedConfigurationVersion"),  "floatValue");
  float v23 = v22;
  objc_msgSend( +[_EARSpeechRecognizer maximumSupportedConfigurationVersion]( _EARSpeechRecognizer,  "maximumSupportedConfigurationVersion"),  "floatValue");
  float v25 = v24;
  id v26 = [v20 objectForKey:@"version-major"];
  uint64_t v27 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v26, v27) & 1) == 0) {
    return 0LL;
  }
  [v26 floatValue];
  if (v28 < v23) {
    return 0LL;
  }
  [v26 floatValue];
  if (v29 > v25) {
    return 0LL;
  }
  id v30 = [v20 objectForKey:@"model-info"];
  uint64_t v31 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v30, v31) & 1) == 0) {
    return 0LL;
  }
  id v32 = [v30 objectForKey:@"version"];
  uint64_t v33 = objc_opt_class(&OBJC_CLASS___NSString);
  char isKindOfClass = objc_opt_isKindOfClass(v32, v33);
  if (a2)
  {
    if ((isKindOfClass & 1) != 0) {
      *a2 = v32;
    }
  }

  id v35 = [v30 objectForKey:@"tasks"];
  id result = [v32 length];
  if (result)
  {
    uint64_t v36 = objc_opt_class(&OBJC_CLASS___NSArray);
    if ((objc_opt_isKindOfClass(v35, v36) & 1) != 0) {
      return [v35 containsObject:a3];
    }
    return 0LL;
  }

  return result;
}

uint64_t sub_10000D530(uint64_t a1)
{
  return a1;
}

uint64_t RDMinions::Unlock(uint64_t a1, unint64_t a2)
{
  unint64_t v7 = a2;
  pthread_mutex_lock(&stru_10001CE88);
  uint64_t v3 = sub_100010770(a1 + 144, &v7);
  uint64_t v4 = sub_100010770(a1 + 120, &v7);
  if (*(void *)(a1 + 168) == v7)
  {
    *(void *)(a1 + 16_Block_object_dispose((const void *)(v9 - 80), 8) = 0LL;
    goto LABEL_5;
  }

  if (v4 | v3)
  {
LABEL_5:
    pthread_cond_broadcast(&stru_10001CEC8);
    uint64_t v5 = 1LL;
    goto LABEL_6;
  }

  uint64_t v5 = 0LL;
LABEL_6:
  pthread_mutex_unlock(&stru_10001CE88);
  return v5;
}

void RDMinions::LockReader(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v9 = a2;
  sub_1000107E8((uint64_t **)(a1 + 120), (unint64_t *)&v9, &v9);
  xpc_retain(a3);
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000D688;
  block[3] = &unk_100018920;
  void block[4] = v9;
  block[5] = a3;
  block[6] = a4;
  block[7] = a1;
  dispatch_async(global_queue, block);
}

void sub_10000D688(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  v8[0] = 0LL;
  v8[1] = v8;
  v8[2] = 0x2020000000LL;
  char v9 = 1;
  uint64_t v4 = 0LL;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000LL;
  char v7 = 0;
  do
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472LL;
    v3[2] = sub_10000D7F0;
    v3[3] = &unk_100018E50;
    v3[4] = *(void *)(a1 + 32);
    v3[5] = &v4;
    v3[6] = v8;
    v3[7] = v2;
    dispatch_sync(&_dispatch_main_q, v3);
    if (*((_BYTE *)v5 + 24)) {
      break;
    }
    pthread_mutex_lock(&stru_10001CE88);
    pthread_cond_wait(&stru_10001CEC8, &stru_10001CE88);
    pthread_mutex_unlock(&stru_10001CE88);
  }

  while (!*((_BYTE *)v5 + 24));
  _Block_object_dispose(&v4, 8);
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 48));
  xpc_release(*(xpc_object_t *)(a1 + 40));
  xpc_release(*(xpc_object_t *)(a1 + 48));
  _Block_object_dispose(v8, 8);
}

void sub_10000D7C4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

void sub_10000D7F0(unint64_t *a1)
{
  unint64_t v2 = a1[7];
  uint64_t v3 = *(void **)(v2 + 128);
  if (!v3)
  {
LABEL_7:
    uint64_t v6 = (os_log_s *)RXOSLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "daemon died while waiting for read lock",  buf,  2u);
    }

    goto LABEL_9;
  }

  unint64_t v4 = a1[4];
  while (1)
  {
    unint64_t v5 = v3[4];
    if (v4 >= v5) {
      break;
    }
LABEL_6:
    uint64_t v3 = (void *)*v3;
    if (!v3) {
      goto LABEL_7;
    }
  }

  if (v5 < v4)
  {
    ++v3;
    goto LABEL_6;
  }

  if (!*(void *)(v2 + 168))
  {
    sub_100010770(v2 + 120, a1 + 4);
    sub_1000107E8((uint64_t **)(v2 + 144), a1 + 4, (uint64_t *)a1 + 4);
LABEL_9:
    *(_BYTE *)(*(void *)(a1[5] + 8) + 24LL) = 1;
    return;
  }

  if (*(_BYTE *)(*(void *)(a1[6] + 8) + 24LL))
  {
    char v7 = (os_log_s *)RXOSLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8[0] = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "daemon waiting for read lock",  (uint8_t *)v8,  2u);
    }

    *(_BYTE *)(*(void *)(a1[6] + 8) + 24LL) = 0;
  }

void RDMinions::LockWriter(uint64_t a1, void *a2, uint64_t a3)
{
  xpc_object_t v7 = a2;
  sub_1000107E8((uint64_t **)(a1 + 120), (unint64_t *)&v7, (uint64_t *)&v7);
  xpc_retain(v7);
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10000D9B0;
  v6[3] = &unk_100018E78;
  v6[5] = a3;
  v6[6] = a1;
  void v6[4] = v7;
  dispatch_async(global_queue, v6);
}

void sub_10000D9B0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  v8[0] = 0LL;
  v8[1] = v8;
  v8[2] = 0x2020000000LL;
  char v9 = 1;
  uint64_t v4 = 0LL;
  unint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000LL;
  char v7 = 0;
  do
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472LL;
    v3[2] = sub_10000DB18;
    v3[3] = &unk_100018E50;
    v3[4] = *(void *)(a1 + 32);
    v3[5] = &v4;
    v3[6] = v8;
    v3[7] = v2;
    dispatch_sync(&_dispatch_main_q, v3);
    if (*((_BYTE *)v5 + 24)) {
      break;
    }
    pthread_mutex_lock(&stru_10001CE88);
    pthread_cond_wait(&stru_10001CEC8, &stru_10001CE88);
    pthread_mutex_unlock(&stru_10001CE88);
  }

  while (!*((_BYTE *)v5 + 24));
  _Block_object_dispose(&v4, 8);
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 32), *(xpc_object_t *)(a1 + 40));
  xpc_release(*(xpc_object_t *)(a1 + 32));
  xpc_release(*(xpc_object_t *)(a1 + 40));
  _Block_object_dispose(v8, 8);
}

void sub_10000DAEC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

void sub_10000DB18(void *a1)
{
  uint64_t v2 = (void *)a1[7];
  uint64_t v3 = a1 + 4;
  uint64_t v4 = (void *)v2[16];
  if (!v4)
  {
LABEL_7:
    *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 1;
    unint64_t v7 = v2[21];
    goto LABEL_8;
  }

  unint64_t v5 = *v3;
  while (1)
  {
    unint64_t v6 = v4[4];
    if (v5 >= v6) {
      break;
    }
LABEL_6:
    uint64_t v4 = (void *)*v4;
    if (!v4) {
      goto LABEL_7;
    }
  }

  if (v6 < v5)
  {
    ++v4;
    goto LABEL_6;
  }

  unint64_t v7 = v2[21];
  if (!v7)
  {
    v2[21] = v5;
    unint64_t v7 = v5;
  }

LABEL_8:
  if (v7 == *v3 && !v2[20])
  {
    sub_100010770((uint64_t)(v2 + 15), v3);
    *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 1;
  }

  else if (!*(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) && *(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL))
  {
    id v8 = (os_log_s *)RXOSLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      pid_t pid = xpc_connection_get_pid((xpc_connection_t)*v3);
      uint64_t v10 = v2[20];
      v11[0] = 67109376;
      v11[1] = pid;
      __int16 v12 = 1024;
      int v13 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "daemon(%d) waiting for write lock (%u readers)",  (uint8_t *)v11,  0xEu);
    }

    *(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL) = 0;
  }

    __int16 v12 = 0LL;
LABEL_9:
    CFRelease(v5);
LABEL_12:
    CFRelease(v3);
    return v12;
  }

  return 0LL;
}

void RDMinions::EventHandler(uint64_t a1, _xpc_connection_s *a2, xpc_object_t object)
{
  float v28 = a2;
  xpc_type_t type = xpc_get_type(object);
  if (type == (xpc_type_t)&_xpc_type_error)
  {
    BOOL v9 = object == &_xpc_error_connection_invalid || object == &_xpc_error_connection_interrupted;
    if (v9)
    {
      uint64_t v10 = (os_log_s *)RXOSLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        pid_t pid = xpc_connection_get_pid(a2);
        __int16 v12 = "INTERRUPTED";
        if (object == &_xpc_error_connection_invalid) {
          __int16 v12 = "INVALID";
        }
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&uint8_t buf[4] = pid;
        *(_WORD *)&buf[8] = 2080;
        *(void *)&buf[10] = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "daemon(%d) XPC_ERROR_CONNECTION_%s",  buf,  0x12u);
      }

      int v13 = *(const void ***)(a1 + 24);
      if (v13 == (const void **)(a1 + 32))
      {
LABEL_23:
        int v16 = 0;
      }

      else
      {
        while (v13[8] != a2)
        {
          double v14 = (const void **)v13[1];
          if (v14)
          {
            do
            {
              os_log_type_t v15 = (const void ***)v14;
              double v14 = (const void **)*v14;
            }

            while (v14);
          }

          else
          {
            do
            {
              os_log_type_t v15 = (const void ***)v13[2];
              BOOL v9 = *v15 == v13;
              int v13 = (const void **)v15;
            }

            while (!v9);
          }

          int v13 = (const void **)v15;
        }

        sub_1000108A0((uint64_t **)(a1 + 24), v13 + 4);
        int v16 = 1;
      }

      else {
        int v17 = v16;
      }
      sub_100010770(a1 + 72, (unint64_t *)&v28);
      if ((v17 & 1) != 0 || RDMinions::Unlock(a1, (unint64_t)v28))
      {
        BOOL v18 = (os_log_s *)RXOSLog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          BOOL v19 = "starting";
          if (v17) {
            BOOL v19 = "busy";
          }
          int v20 = (const char *)a1;
          *(_DWORD *)buf = 136315394;
          *(void *)&uint8_t buf[4] = v19;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = v20;
          _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "daemon died while %s; rebuilding cache for %s",
            buf,
            0x16u);
        }

        uint64_t v21 = (const char *)a1;
        float v22 = CFStringCreateWithCStringNoCopy(0LL, v21, 0x8000100u, kCFAllocatorNull);
        RDNukeCache(v22);
        CFRelease(v22);
      }

      uint64_t v23 = qword_10001CE70;
      if ((uint64_t *)qword_10001CE70 != &qword_10001CE78)
      {
        do
        {
          context = xpc_connection_get_context(*(xpc_connection_t *)(v23 + 32));
          sub_100010770((uint64_t)context, (unint64_t *)&v28);
          float v25 = *(uint64_t **)(v23 + 8);
          if (v25)
          {
            do
            {
              id v26 = v25;
              float v25 = (uint64_t *)*v25;
            }

            while (v25);
          }

          else
          {
            do
            {
              id v26 = *(uint64_t **)(v23 + 16);
              BOOL v9 = *v26 == v23;
              uint64_t v23 = (uint64_t)v26;
            }

            while (!v9);
          }

          uint64_t v23 = (uint64_t)v26;
        }

        while (v26 != &qword_10001CE78);
      }

      uint64_t v27 = (uint64_t **)(a1 + 96);
      *(void *)buf = &v28;

      sub_100010770((uint64_t)v27, (unint64_t *)&v28);
    }
  }

  else
  {
    if (type != (xpc_type_t)&_xpc_type_dictionary) {
      sub_1000122C4();
    }
    int64_t int64 = xpc_dictionary_get_int64(object, kRDKeyMessage);
    if (int64 == 401)
    {
      RDMinions::Unlock(a1, (unint64_t)a2);
    }

    else if (int64 == 400)
    {
      xpc_object_t reply = xpc_dictionary_create_reply(object);
      xpc_dictionary_set_int64(reply, kRDKeyMessage, 301LL);
      RDMinions::LockWriter(a1, a2, (uint64_t)reply);
    }
  }

xpc_connection_t RDMinions::Summon(RDMinions *this)
{
  xpc_connection_t connection = 0LL;
  if (*((void *)this + 11))
  {
    xpc_connection_t connection = *(xpc_connection_t *)(*((void *)this + 9) + 32LL);
    sub_100010770((uint64_t)this + 72, (unint64_t *)&connection);
    uint64_t v2 = (os_log_s *)RXOSLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      pid_t pid = xpc_connection_get_pid(connection);
      *(_DWORD *)uuid_t out = 67109120;
      *(_DWORD *)&out[4] = pid;
      uint64_t v4 = "minion(%d) recycled.";
      unint64_t v5 = out;
      unint64_t v6 = v2;
      os_log_type_t v7 = OS_LOG_TYPE_ERROR;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v6, v7, v4, v5, 8u);
    }
  }

  else
  {
    uuid_generate(out);
    id v8 = xpc_connection_create("com.apple.SpeechRecognitionCore.speechrecognitiond", &_dispatch_main_q);
    xpc_connection_t connection = v8;
    if (v8)
    {
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472LL;
      v15[2] = sub_10000E2AC;
      v15[3] = &unk_100018EA0;
      v15[4] = v8;
      v15[5] = this;
      xpc_connection_set_event_handler(v8, v15);
      xpc_connection_set_instance(connection, out);
      xpc_connection_resume(connection);
      xpc_object_t v9 = xpc_dictionary_create(0LL, 0LL, 0LL);
      xpc_dictionary_set_int64(v9, kRDKeyMessage, 300LL);
      xpc_connection_send_message(connection, v9);
      xpc_release(v9);
      uint64_t v10 = os_transaction_create("com.apple.SpeechRecognitionCore.speechrecognitiond");
      *(void *)buf = &connection;
      sub_1000102C0((uint64_t **)this + 12, (unint64_t *)&connection, (uint64_t)&unk_1000142E8, (uint64_t **)buf)[5] = v10;
    }

    else
    {
      int v11 = (os_log_s *)RXOSLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        *(void *)&uint8_t buf[4] = out;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "Unable to create new minion instance %s",  buf,  0xCu);
      }
    }

    __int16 v12 = (os_log_s *)RXOSLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      pid_t v13 = xpc_connection_get_pid(connection);
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v13;
      uint64_t v4 = "minion(%d) created.";
      unint64_t v5 = buf;
      unint64_t v6 = v12;
      os_log_type_t v7 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_10;
    }
  }

  return connection;
}

void sub_10000E2AC(uint64_t a1, xpc_object_t object)
{
}

uint64_t sub_10000E2BC(uint64_t a1)
{
  return a1;
}

uint64_t sub_10000E2E8(uint64_t a1)
{
  uint64_t v2 = *(void **)a1;
  if (v2)
  {
    *(void *)(a1 + _Block_object_dispose(va, 8) = v2;
    operator delete(v2);
  }

  return a1;
}

void RDRecognizers::RDRecognizers(RDRecognizers *this)
{
  *((void *)this + 4) = 0LL;
  *((void *)this + 1) = 0LL;
  *((void *)this + 2) = 0LL;
  *(void *)this = 0LL;
  *((_DWORD *)this + 6) = 0;
  *(void *)out_token = 0LL;
  notify_register_dispatch("com.apple.sessionagent.screenIsLocked", &out_token[1], &_dispatch_main_q, &stru_100018EE0);
  notify_register_dispatch("com.apple.sessionagent.screenIsUnlocked", out_token, &_dispatch_main_q, &stru_100018F00);
}

void sub_10000E394(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + _Block_object_dispose(va, 8) = v3;
    operator delete(v3);
  }

  _Unwind_Resume(exception_object);
}

unint64_t RDRecognizers::UpdateRecognizer(char **a1, _xpc_connection_s *a2, xpc_object_t xdict)
{
  unint64_t int64 = xpc_dictionary_get_int64(xdict, kRDKeyRecognizerID);
  xpc_object_t value = xpc_dictionary_get_value(xdict, kRDKeyWantFeedback);
  if (value)
  {
    os_log_type_t v15 = value;
    if ((int64 & 0x8000000000000000LL) != 0 || (int v16 = *a1, int64 >= 0xCCCCCCCCCCCCCCCDLL * ((a1[1] - *a1) >> 3)))
    {
      int v17 = a1[4];
      if (v17)
      {
        a1[4] = v17 - 1;
        int v16 = *a1;
        uint64_t v18 = 40 * int64 + 40;
        do
        {
          ++int64;
          uint64_t v19 = *(void *)&v16[v18];
          v18 += 40LL;
        }

        while (v19);
      }

      else
      {
        float v22 = a1[1];
        unint64_t int64 = (v22 - *a1) / 40;
        uint64_t v23 = a1[2];
        if (v22 >= v23)
        {
          unint64_t v25 = 0xCCCCCCCCCCCCCCCDLL * ((v23 - *a1) >> 3);
          uint64_t v26 = 2 * v25;
          if (v25 >= 0x333333333333333LL) {
            unint64_t v27 = 0x666666666666666LL;
          }
          else {
            unint64_t v27 = v26;
          }
          if (v27) {
            float v28 = (char *)sub_100010A0C((uint64_t)(a1 + 2), v27);
          }
          else {
            float v28 = 0LL;
          }
          float v29 = &v28[40 * int64];
          id v30 = &v28[40 * v27];
          *((void *)v29 + 4) = 0LL;
          float v24 = v29 + 40;
          id v32 = *a1;
          uint64_t v31 = a1[1];
          if (v31 != *a1)
          {
            do
            {
              __int128 v33 = *(_OWORD *)(v31 - 40);
              __int128 v34 = *(_OWORD *)(v31 - 24);
              *((void *)v29 - 1) = *((void *)v31 - 1);
              *(_OWORD *)(v29 - 24) = v34;
              *(_OWORD *)(v29 - 40) = v33;
              v29 -= 40;
              v31 -= 40;
            }

            while (v31 != v32);
            uint64_t v31 = *a1;
          }

          *a1 = v29;
          a1[1] = v24;
          a1[2] = v30;
          if (v31) {
            operator delete(v31);
          }
        }

        else
        {
          *((void *)v22 + 4) = 0LL;
          float v24 = v22 + 40;
        }

        a1[1] = v24;
        int v16 = *a1;
      }

      int v35 = *((_DWORD *)a1 + 6);
      *((_DWORD *)a1 + 6) = v35 + 1;
      *(_DWORD *)&v16[40 * int64 + 16] = v35;
    }

    uint64_t v36 = &v16[40 * int64];
    *(void *)uint64_t v36 = a2;
    *((void *)v36 + 1) = xpc_dictionary_get_uint64(xdict, kRDKeyActivityMode);
    v36[20] = xpc_BOOL_get_value(v15);
    v36[22] = 0;
    int v37 = xpc_dictionary_get_int64(xdict, kRDKeyClientPID);
    *((_DWORD *)v36 + 6) = v37;
    v38 = (pid_t *)(v36 + 24);
    if (!v37) {
      pid_t *v38 = xpc_connection_get_pid(a2);
    }
    xpc_object_t v39 = xpc_dictionary_get_value(xdict, kRDKeyCommandInfo);
    if (v39)
    {
      __int16 v40 = v39;
      v41 = &v16[40 * int64];
      v44 = (const void *)*((void *)v41 + 4);
      v43 = v41 + 32;
      v42 = v44;
      if (v44) {
        CFRelease(v42);
      }
      if (xpc_get_type(v40) == (xpc_type_t)&_xpc_type_array) {
        void *v43 = _CFXPCCreateCFObjectFromXPCObject(v40);
      }
      else {
        void *v43 = 0LL;
      }
    }
  }

  else if ((int64 & 0x8000000000000000LL) != 0 || int64 >= 0xCCCCCCCCCCCCCCCDLL * ((a1[1] - *a1) >> 3))
  {
    sub_10000E6B8(0LL, v8, v9, v10, v11, v12, v13, v14, int64);
    return -1LL;
  }

  else
  {
    int v20 = &(*a1)[40 * int64];
    uint64_t v21 = (const void *)*((void *)v20 + 4);
    if (v21)
    {
      CFRelease(v21);
      *((void *)v20 + 4) = 0LL;
    }

    *(void *)int v20 = 0LL;
    ++a1[4];
  }

  return int64;
}

void sub_10000E6B8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v9 = CFStringCreateWithFormatAndArguments( 0LL,  0LL,  @"Received invalid recognizer ID in UpdateRecognizer %lld",  &a9);
  ExternalRepresentation = CFStringCreateExternalRepresentation(0LL, v9, 0x8000100u, 0);
  CFRelease(v9);
  uint64_t v11 = (os_log_s *)RXOSLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 68157954;
    int Length = CFDataGetLength(ExternalRepresentation);
    __int16 v14 = 2080;
    BytePtr = CFDataGetBytePtr(ExternalRepresentation);
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%.*s", buf, 0x12u);
  }

  CFRelease(ExternalRepresentation);
}

void RDRecognizers::RemovePeer(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)a1;
  uint64_t v3 = *(void **)(a1 + 8);
  if (*(void **)a1 != v3)
  {
    do
    {
      if (*v2 == a2)
      {
        unint64_t v6 = (const void *)v2[4];
        if (v6)
        {
          CFRelease(v6);
          v2[4] = 0LL;
        }

        void *v2 = 0LL;
        ++*(void *)(a1 + 32);
      }

      v2 += 5;
    }

    while (v2 != v3);
  }

int main(int argc, const char **argv, const char **envp)
{
  uint64_t v3 = pthread_cond_init(&stru_10001CEC8, 0LL);
  xpc_track_activity(v3);
  xpc_main((xpc_connection_handler_t)sub_10000E868);
}

void sub_10000E868(_xpc_connection_s *a1)
{
  xpc_connection_t v4 = a1;
  xpc_connection_set_target_queue(a1, &_dispatch_main_q);
  uint64_t v2 = operator new(0x18uLL);
  v2[2] = 0LL;
  v2[1] = 0LL;
  void *v2 = v2 + 1;
  xpc_connection_set_context(a1, v2);
  sub_1000107E8((uint64_t **)&qword_10001CE70, (unint64_t *)&v4, (uint64_t *)&v4);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10000E918;
  v3[3] = &unk_100018F28;
  v3[4] = v4;
  xpc_connection_set_event_handler(v4, v3);
  xpc_connection_resume(v4);
}

void sub_10000E918(uint64_t a1, xpc_object_t object)
{
  uint64_t v3 = *(_xpc_connection_s **)(a1 + 32);
  v105 = v3;
  xpc_type_t type = xpc_get_type(object);
  if (type != (xpc_type_t)&_xpc_type_error)
  {
    if (type != (xpc_type_t)&_xpc_type_dictionary) {
      sub_10001236C();
    }
    unint64_t int64 = (RDLanguageAssets *)xpc_dictionary_get_int64(object, kRDKeyMessage);
    switch((unint64_t)int64)
    {
      case 0x1F4uLL:
        xpc_object_t reply = xpc_dictionary_create_reply(object);
        os_log_type_t v7 = kRDKeyRecognizerID;
        int64_t updated = RDRecognizers::UpdateRecognizer((char **)&unk_10001CEF8, v3, object);
        xpc_object_t v9 = reply;
        uint64_t v10 = v7;
        goto LABEL_84;
      case 0x1F5uLL:
        xpc_object_t reply = xpc_dictionary_create_reply(object);
        goto LABEL_91;
      case 0x1F6uLL:
        xpc_object_t reply = xpc_dictionary_create_reply(object);
        xpc_object_t value = xpc_dictionary_get_value(object, kRDKeyLocale);
        v55 = (const __CFDictionary *)_CFXPCCreateCFObjectFromXPCObject(value);
        if (!v55) {
          goto LABEL_91;
        }
        goto LABEL_90;
      case 0x1F7uLL:
        xpc_object_t reply = xpc_dictionary_create_reply(object);
        uunint64_t int64 = (_xpc_connection_s *)xpc_dictionary_get_uint64(object, kRDKeyObjectID);
        context = xpc_connection_get_context(v3);
        v58 = (void *)context[1];
        if (v58)
        {
          v59 = context + 1;
          do
          {
            unint64_t v60 = v58[4];
            BOOL v61 = v60 >= (unint64_t)uint64;
            else {
              v62 = v58 + 1;
            }
            if (v61) {
              v59 = v58;
            }
            v58 = (void *)*v62;
          }

          while (*v62);
          if (v59 != context + 1 && v59[4] <= (unint64_t)uint64)
          {
            uint64_t v63 = v59[5] - 1;
            v59[5] = v63;
            if (!v63)
            {
              sub_10001037C((uint64_t **)context, v59);
              operator delete(v59);
            }

            sub_10000F794(uint64);
          }
        }

        goto LABEL_91;
      case 0x1F8uLL:
        v47 = RDLanguageAssets::CopyInstallationStatus(int64);
        xpc_object_t reply = xpc_dictionary_create_reply(object);
        if (!v47) {
          goto LABEL_91;
        }
        v48 = (void *)_CFXPCCreateXPCObjectFromCFObject(v47);
        v49 = &kRDKeyAssetStatus;
        goto LABEL_87;
      case 0x1F9uLL:
        string = xpc_dictionary_get_string(object, kRDKeyLocale);
        v67 = CFStringCreateWithCStringNoCopy(0LL, string, 0x8000100u, kCFAllocatorNull);
        id v69 = RDLanguageAssets::InstallAndCopyQuasarModelPathForLanguage(v67, v68);
        if (v69) {
          goto LABEL_97;
        }
        return;
      case 0x1FAuLL:
        signed int v70 = RDLanguageAssets::PurgeInstalledQuasarAssets(int64);
        xpc_object_t v9 = xpc_dictionary_create_reply(object);
        xpc_object_t reply = v9;
        uint64_t v10 = kRDKeyPurgeStatus;
        int64_t updated = v70;
LABEL_84:
        xpc_dictionary_set_int64(v9, v10, updated);
        goto LABEL_91;
      case 0x1FBuLL:
        if (xpc_dictionary_get_BOOL(object, kRDKeyDownloadProgress))
        {
          RDLanguageAssets::AddPeerForProgressCallback(v3);
          byte_10001CF20 = 1;
        }

        else
        {
          RDLanguageAssets::RemovePeerForProgressCallback(v3);
        }

        return;
      case 0x1FCuLL:
        v75 = xpc_dictionary_get_string(object, kRDKeyLocale);
        v76 = (RDLanguageAssets *)CFStringCreateWithCStringNoCopy(0LL, v75, 0x8000100u, kCFAllocatorNull);
        RDLanguageAssets::CancelDownloadForLanguage(v76, v77);
        return;
      case 0x1FDuLL:
        v50 = xpc_dictionary_get_string(object, kRDKeyLocale);
        v51 = CFStringCreateWithCStringNoCopy(0LL, v50, 0x8000100u, kCFAllocatorNull);
        v53 = (const __CFDictionary *)RDLanguageAssets::CopyInstalledAssetPathForLanguage(v51, v52);
        if (!v53) {
          return;
        }
        v47 = v53;
        xpc_object_t reply = xpc_dictionary_create_reply(object);
        v48 = (void *)_CFXPCCreateXPCObjectFromCFObject(v47);
        v49 = &kRDKeyInstalledAssetPath;
        goto LABEL_87;
      case 0x1FEuLL:
        v71 = xpc_dictionary_get_string(object, kRDKeyLocale);
        v72 = CFStringCreateWithCStringNoCopy(0LL, v71, 0x8000100u, kCFAllocatorNull);
        v74 = (const __CFDictionary *)RDLanguageAssets::CopyInstalledAssetSupportedTasksForLanguage(v72, v73);
        if (!v74) {
          return;
        }
        v47 = v74;
        xpc_object_t reply = xpc_dictionary_create_reply(object);
        v48 = (void *)_CFXPCCreateXPCObjectFromCFObject(v47);
        v49 = &kRDKeyInstalledAssetSupportedTasks;
LABEL_87:
        xpc_dictionary_set_value(reply, *v49, v48);
        if (v48) {
          CFRelease(v48);
        }
        v55 = v47;
LABEL_90:
        CFRelease(v55);
        goto LABEL_91;
      case 0x1FFuLL:
        xpc_object_t array = xpc_dictionary_get_array(object, kRDKeyLocales);
        Mutable = CFArrayCreateMutable(0LL, 0LL, &kCFTypeArrayCallBacks);
        count = (RDLanguageAssets *)xpc_array_get_count(array);
        if (count)
        {
          for (size_t i = 0LL; i < (unint64_t)count; ++i)
          {
            id v30 = xpc_array_get_string(array, i);
            uint64_t v31 = CFStringCreateWithCStringNoCopy(0LL, v30, 0x8000100u, kCFAllocatorNull);
            CFMutableStringRef MutableCopy = CFStringCreateMutableCopy(0LL, 0LL, v31);
            v109.length = CFStringGetLength(v31);
            v109.location = 0LL;
            CFStringFindAndReplace(MutableCopy, @"_", @"-", v109, 0LL);
            CFRelease(MutableCopy);
            __int128 v33 = CFStringCreateMutableCopy(0LL, 0LL, v31);
            v110.length = CFStringGetLength(v31);
            v110.location = 0LL;
            CFStringFindAndReplace(v33, @"-", @"_", v110, 0LL);
            CFRelease(v31);
            __int128 v34 = (const __CFString *)RXGetAssetFallbackLocaleIdentifier(v33);
            CFRelease(v33);
            if (v34)
            {
              int v35 = CFStringCreateMutableCopy(0LL, 0LL, v34);
              v111.length = CFStringGetLength(v34);
              v111.location = 0LL;
              CFStringFindAndReplace(v35, @"_", @"-", v111, 0LL);
              CFRelease(v35);
            }

            count = (RDLanguageAssets *)xpc_array_get_count(array);
          }
        }

        uint64_t v36 = RDLanguageAssets::CopyInstallationStatus(count);
        CFTypeID v37 = CFGetTypeID(v36);
        if (v37 == CFDictionaryGetTypeID())
        {
          unint64_t v38 = CFDictionaryGetCount(v36);
          CFIndex v39 = v38;
          if (v38 >> 61) {
            size_t v40 = -1LL;
          }
          else {
            size_t v40 = 8 * v38;
          }
          v41 = (const void **)operator new[](v40);
          v42 = CFArrayCreateMutable(0LL, v39, &kCFTypeArrayCallBacks);
          __p = v41;
          CFDictionaryGetKeysAndValues(v36, v41, 0LL);
          if (v39 >= 1)
          {
            do
            {
              v43 = (const __CFString *)*v41;
              v107.length = CFArrayGetCount(Mutable);
              v107.location = 0LL;
              if (!CFArrayContainsValue(Mutable, v107, v43))
              {
                v44 = CFStringCreateMutableCopy(0LL, 0LL, v43);
                v112.length = CFStringGetLength(v43);
                v112.location = 0LL;
                CFStringFindAndReplace(v44, @"-", @"_", v112, 0LL);
                v45 = (const __CFString *)RXGetAssetFallbackLocaleIdentifier(v44);
                CFRelease(v44);
                if (v45
                  && (CFMutableStringRef v46 = CFStringCreateMutableCopy(0LL, 0LL, v45),
                      v113.length = CFStringGetLength(v45),
                      v113.location = 0LL,
                      CFStringFindAndReplace(v46, @"_", @"-", v113, 0LL),
                      v46)
                  && (v108.length = CFArrayGetCount(Mutable),
                      v108.location = 0LL,
                      CFArrayContainsValue(Mutable, v108, v46)))
                {
                  CFRelease(v46);
                }

                else if (RXEngineTypeForLocaleIdentifier(v43) == 1)
                {
                  CFArrayAppendValue(v42, v43);
                }
              }

              ++v41;
              --v39;
            }

            while (v39);
          }

          operator delete[](__p);
          RDLanguageAssets::SetPurgeabilityForLanguages(v42, (const __CFArray *)1);
          CFRelease(v42);
        }

        RDLanguageAssets::SetPurgeabilityForLanguages(Mutable, 0LL);
        CFRelease(Mutable);
        id v69 = v36;
LABEL_97:
        CFRelease(v69);
        return;
      default:
        float v24 = int64;
        if (int64 != (RDLanguageAssets *)101)
        {
          unint64_t v25 = (os_log_s *)RXOSLog();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109376;
            *(_DWORD *)&uint8_t buf[4] = xpc_connection_get_pid(v3);
            *(_WORD *)&buf[8] = 2048;
            *(void *)&buf[10] = v24;
            int v20 = "peer(%d) unknown or unimplemented message %lld";
            uint64_t v21 = v25;
            os_log_type_t v22 = OS_LOG_TYPE_ERROR;
            uint32_t v23 = 18;
            goto LABEL_31;
          }

          return;
        }

        xpc_object_t reply = xpc_dictionary_create_reply(object);
        v64 = (char *)xpc_dictionary_get_string(object, kRDKeyLocale);
        sub_10000FA38(&v104, v64);
        if ((xpc_dictionary_get_uint64(object, kRDKeyOptions) & 0x400000) != 0)
        {
          v65 = ".q";
        }

        else
        {
          v65 = ".n";
        }

        std::string::append(&v104, v65);
LABEL_101:
        if ((v104.__r_.__value_.__s.__size_ & 0x80u) == 0) {
          v78 = &v104;
        }
        else {
          v78 = (std::string *)v104.__r_.__value_.__r.__words[0];
        }
        sub_10000FA38(buf, (char *)v78);
        v101[0] = buf;
        v79 = sub_10000FB98((uint64_t **)&sMinions, (const void **)buf, (uint64_t)&unk_1000142E8, (_OWORD **)v101);
        if ((buf[23] & 0x80000000) != 0) {
          operator delete(*(void **)buf);
        }
        uint64_t v80 = (uint64_t)v79 + 56;
        xpc_connection_t connection = 0LL;
        if (*((char *)v79 + 79) < 0)
        {
          if (*((void *)v79 + 8)) {
            goto LABEL_111;
          }
        }

        else if (*((_BYTE *)v79 + 79))
        {
          goto LABEL_111;
        }

        v81 = xpc_dictionary_get_string(object, kRDKeyLocale);
        std::string::assign((std::string *)((char *)v79 + 56), v81);
LABEL_111:
        if (!xpc_dictionary_get_BOOL(object, kRDKeyLiveAudio))
        {
          xpc_connection_t connection = RDMinions::Summon((RDMinions *)((char *)v79 + 56));
          if (!connection) {
            goto LABEL_134;
          }
          v92 = (os_log_s *)RXOSLog();
          if (os_log_type_enabled(v92, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134217984;
            *(void *)&uint8_t buf[4] = connection;
            _os_log_impl((void *)&_mh_execute_header, v92, OS_LOG_TYPE_INFO, "Summoning new batch minion %p", buf, 0xCu);
          }

LABEL_132:
          if (connection)
          {
            xpc_endpoint_t v97 = xpc_endpoint_create(connection);
            xpc_dictionary_set_int64(reply, kRDKeyMessage, 201LL);
            xpc_dictionary_set_value(reply, kRDKeyConnection, v97);
            xpc_dictionary_set_uint64(reply, kRDKeyObjectID, (uint64_t)connection);
            xpc_release(v97);
            v98 = (uint64_t **)xpc_connection_get_context(v3);
            *(void *)buf = &connection;
            v99 = sub_1000102C0(v98, (unint64_t *)&connection, (uint64_t)&unk_1000142E8, (uint64_t **)buf);
            ++v99[5];
            RDMinions::LockReader(v80, (uint64_t)connection, v3, (uint64_t)reply);
            xpc_object_t reply = 0LL;
          }

LABEL_134:
LABEL_91:
          if (reply)
          {
            xpc_connection_send_message(v3, reply);
            xpc_release(reply);
          }

          return;
        }

        v82 = xpc_dictionary_get_string(object, kRDKeyAudioDevice);
        if (v82) {
          v83 = (char *)v82;
        }
        else {
          v83 = "?";
        }
        sub_10000FA38(v101, v83);
        *(void *)buf = v101;
        v84 = sub_1000100B0((uint64_t **)v79 + 10, (const void **)v101, (uint64_t)&unk_1000142E8, (__int128 **)buf);
        if (v84[8])
        {
          v85 = (os_log_s *)RXOSLog();
          if (!os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_130;
          }
          v86 = (_xpc_connection_s *)v84[8];
          pid_t pid = xpc_connection_get_pid(v86);
          v88 = v101;
          if (v102 < 0) {
            v88 = (void **)v101[0];
          }
          *(_DWORD *)buf = 134218498;
          *(void *)&uint8_t buf[4] = v86;
          *(_WORD *)&_BYTE buf[12] = 1024;
          *(_DWORD *)&buf[14] = pid;
          *(_WORD *)&buf[18] = 2080;
          *(void *)&buf[20] = v88;
          v89 = "Using existing live minion %p[%d] for audio device %s";
          v90 = v85;
          uint32_t v91 = 28;
        }

        else
        {
          v84[8] = (uint64_t)RDMinions::Summon((RDMinions *)((char *)v79 + 56));
          v93 = (os_log_s *)RXOSLog();
          if (!os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_130;
          }
          uint64_t v94 = v84[8];
          v95 = v101;
          if (v102 < 0) {
            v95 = (void **)v101[0];
          }
          *(_DWORD *)buf = 134218242;
          *(void *)&uint8_t buf[4] = v94;
          *(_WORD *)&_BYTE buf[12] = 2080;
          *(void *)&buf[14] = v95;
          v89 = "Summoning new live minion %p for audio device %s";
          v90 = v93;
          uint32_t v91 = 22;
        }

        _os_log_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_DEFAULT, v89, buf, v91);
LABEL_130:
        uint64_t v96 = v84[7];
        xpc_connection_t connection = (xpc_connection_t)v84[8];
        v84[7] = v96 + 1;
        if (v102 < 0) {
          operator delete(v101[0]);
        }
        goto LABEL_132;
    }
  }

  BOOL v11 = object == &_xpc_error_connection_invalid || object == &_xpc_error_connection_interrupted;
  if (v11)
  {
    uint64_t v12 = (os_log_s *)RXOSLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      pid_t v13 = xpc_connection_get_pid(v3);
      __int16 v14 = "INTERRUPTED";
      if (object == &_xpc_error_connection_invalid) {
        __int16 v14 = "INVALID";
      }
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&uint8_t buf[4] = v13;
      *(_WORD *)&buf[8] = 2080;
      *(void *)&buf[10] = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "peer(%d) XPC_ERROR_CONNECTION_%s",  buf,  0x12u);
    }

    os_log_type_t v15 = (void **)xpc_connection_get_context(v3);
    int v16 = *v15;
    if (*v15 != v15 + 1)
    {
      do
      {
        sub_10000F794((_xpc_connection_s *)v16[4]);
        int v17 = (void *)v16[1];
        if (v17)
        {
          do
          {
            uint64_t v18 = v17;
            int v17 = (void *)*v17;
          }

          while (v17);
        }

        else
        {
          do
          {
            uint64_t v18 = (void *)v16[2];
            BOOL v11 = *v18 == (void)v16;
            int v16 = v18;
          }

          while (!v11);
        }

        int v16 = v18;
      }

      while (v18 != v15 + 1);
    }

    RDRecognizers::RemovePeer((uint64_t)&unk_10001CEF8, (uint64_t)v3);
    if ((byte_10001CF20 & 1) != 0) {
      RDLanguageAssets::RemovePeerForProgressCallback(v3);
    }
    sub_100010770((uint64_t)&qword_10001CE70, (unint64_t *)&v105);
    sub_10000F9F8((uint64_t)v15, v15[1]);
    operator delete(v15);
  }

  else if (object == &_xpc_error_termination_imminent)
  {
    uint64_t v19 = (os_log_s *)RXOSLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = xpc_connection_get_pid(v3);
      int v20 = "peer(%d) XPC_ERROR_TERMINATION_IMMINENT";
      uint64_t v21 = v19;
      os_log_type_t v22 = OS_LOG_TYPE_DEFAULT;
      uint32_t v23 = 8;
LABEL_31:
      _os_log_impl((void *)&_mh_execute_header, v21, v22, v20, buf, v23);
    }
  }

void sub_10000F71C( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, void *a17, uint64_t a18, int a19, __int16 a20, char a21, char a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, int a27, __int16 a28, char a29, char a30)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a22 < 0) {
    operator delete(a17);
  }
  _Unwind_Resume(exception_object);
}

void sub_10000F794(_xpc_connection_s *a1)
{
  xpc_connection_t connection = a1;
  uint64_t v2 = (os_log_s *)RXOSLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v19[0] = a1;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Releasing minion %p\n", buf, 0xCu);
  }

  uint64_t v3 = sMinions;
  if ((uint64_t *)sMinions != &qword_10001CF30)
  {
    while (1)
    {
      xpc_connection_t v4 = *(const void ***)(v3 + 80);
      if (v4 != (const void **)(v3 + 88))
      {
        while (v4[8] != connection)
        {
          unint64_t v5 = (const void **)v4[1];
          if (v5)
          {
            do
            {
              unint64_t v6 = (const void ***)v5;
              unint64_t v5 = (const void **)*v5;
            }

            while (v5);
          }

          else
          {
            do
            {
              unint64_t v6 = (const void ***)v4[2];
              BOOL v7 = *v6 == v4;
              xpc_connection_t v4 = (const void **)v6;
            }

            while (!v7);
          }

          xpc_connection_t v4 = (const void **)v6;
        }

        uint64_t v10 = (uint64_t)v4[7] - 1;
        v4[7] = (const void *)v10;
        if (!v10)
        {
          sub_1000108A0((uint64_t **)(v3 + 80), v4 + 4);
          sub_1000107E8((uint64_t **)(v3 + 128), (unint64_t *)&connection, (uint64_t *)&connection);
          BOOL v11 = (os_log_s *)RXOSLog();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            pid_t pid = xpc_connection_get_pid(connection);
            pid_t v13 = (void *)(v3 + 32);
            *(_DWORD *)buf = 67109378;
            LODWORD(v19[0]) = pid;
            WORD2(v19[0]) = 2080;
            *(void *)((char *)v19 + 6) = v13;
            __int16 v14 = "daemon(%d) [%s] is now idle (was live).";
            goto LABEL_25;
          }
        }

        return;
      }

LABEL_12:
      uint64_t v8 = *(uint64_t **)(v3 + 8);
      if (v8)
      {
        do
        {
          xpc_object_t v9 = v8;
          uint64_t v8 = (uint64_t *)*v8;
        }

        while (v8);
      }

      else
      {
        do
        {
          xpc_object_t v9 = *(uint64_t **)(v3 + 16);
          BOOL v7 = *v9 == v3;
          uint64_t v3 = (uint64_t)v9;
        }

        while (!v7);
      }

      uint64_t v3 = (uint64_t)v9;
      if (v9 == &qword_10001CF30) {
        return;
      }
    }

    sub_1000107E8((uint64_t **)(v3 + 128), (unint64_t *)&connection, (uint64_t *)&connection);
    BOOL v11 = (os_log_s *)RXOSLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      pid_t v15 = xpc_connection_get_pid(connection);
      int v16 = (void *)(v3 + 32);
      *(_DWORD *)buf = 67109378;
      LODWORD(v19[0]) = v15;
      WORD2(v19[0]) = 2080;
      *(void *)((char *)v19 + 6) = v16;
      __int16 v14 = "daemon(%d) [%s] is now idle (was batch).";
LABEL_25:
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v14, buf, 0x12u);
    }
  }

void sub_10000F9F8(uint64_t a1, void *a2)
{
  if (a2)
  {
    sub_10000F9F8(a1, *a2);
    sub_10000F9F8(a1, a2[1]);
    operator delete(a2);
  }

void *sub_10000FA38(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8LL) {
    sub_10000FAE8();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8LL) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    unint64_t v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000LL;
    *a1 = v6;
  }

  else
  {
    *((_BYTE *)a1 + 23) = v4;
    unint64_t v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }

  memmove(v6, __s, v5);
LABEL_9:
  *((_BYTE *)v6 + v5) = 0;
  return a1;
}

void sub_10000FAE8()
{
}

void sub_10000FAFC(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_10000FB4C(exception, a1);
}

void sub_10000FB38(_Unwind_Exception *a1)
{
}

std::logic_error *sub_10000FB4C(std::logic_error *a1, const char *a2)
{
  id result = std::logic_error::logic_error(a1, a2);
  return result;
}

void sub_10000FB70()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

_OWORD *sub_10000FB98(uint64_t **a1, const void **a2, uint64_t a3, _OWORD **a4)
{
  unint64_t v6 = (void **)sub_10000FCA4((uint64_t)a1, &v14, a2);
  uint64_t v7 = *v6;
  if (!*v6)
  {
    uint64_t v8 = (uint64_t **)v6;
    uint64_t v7 = operator new(0xE8uLL);
    v12[1] = a1 + 1;
    xpc_object_t v9 = *a4;
    uint64_t v10 = *((void *)*a4 + 2);
    v7[2] = **a4;
    *((void *)v7 + 6) = v10;
    v9[1] = 0LL;
    v9[2] = 0LL;
    *xpc_object_t v9 = 0LL;
    *((void *)v7 + 7) = 0LL;
    *((void *)v7 + _Block_object_dispose(va, 8) = 0LL;
    *((void *)v7 + 11) = 0LL;
    *((void *)v7 + 9) = 0LL;
    *((void *)v7 + 10) = (char *)v7 + 88;
    *((void *)v7 + 14) = 0LL;
    *((void *)v7 + 12) = 0LL;
    *((void *)v7 + 13) = v7 + 7;
    *((void *)v7 + 17) = 0LL;
    *((void *)v7 + 20) = 0LL;
    *((void *)v7 + 15) = 0LL;
    *((void *)v7 + 16) = (char *)v7 + 136;
    *((void *)v7 + 1_Block_object_dispose(va, 8) = 0LL;
    *((void *)v7 + 19) = v7 + 10;
    *((void *)v7 + 23) = 0LL;
    *((void *)v7 + 21) = 0LL;
    *((void *)v7 + 22) = (char *)v7 + 184;
    *((void *)v7 + 26) = 0LL;
    *((void *)v7 + 24) = 0LL;
    *((void *)v7 + 25) = v7 + 13;
    *((void *)v7 + 27) = 0LL;
    *((void *)v7 + 2_Block_object_dispose(va, 8) = 0LL;
    char v13 = 1;
    sub_10000FD40(a1, v14, v8, (uint64_t *)v7);
    v12[0] = 0LL;
    sub_10000FF94((uint64_t)v12, 0LL);
  }

  return v7;
}

void *sub_10000FCA4(uint64_t a1, void *a2, const void **a3)
{
  size_t v5 = (void *)(a1 + 8);
  uint64_t v4 = *(void *)(a1 + 8);
  if (v4)
  {
    uint64_t v7 = a1 + 16;
    do
    {
      while (1)
      {
        uint64_t v8 = (void *)v4;
        xpc_object_t v9 = (const void **)(v4 + 32);
        uint64_t v4 = *v8;
        size_t v5 = v8;
        if (!*v8) {
          goto LABEL_10;
        }
      }

      if (!sub_10000FD94(v7, v9, a3)) {
        break;
      }
      size_t v5 = v8 + 1;
      uint64_t v4 = v8[1];
    }

    while (v4);
  }

  else
  {
    uint64_t v8 = (void *)(a1 + 8);
  }

LABEL_10:
  *a2 = v8;
  return v5;
}

uint64_t *sub_10000FD40(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  *a4 = 0LL;
  a4[1] = 0LL;
  a4[2] = a2;
  *a3 = a4;
  size_t v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }

  id result = sub_10000FDFC(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

BOOL sub_10000FD94(uint64_t a1, const void **a2, const void **a3)
{
  int v3 = *((char *)a3 + 23);
  int v4 = *((char *)a2 + 23);
  if (v4 >= 0) {
    size_t v5 = *((unsigned __int8 *)a2 + 23);
  }
  else {
    size_t v5 = (size_t)a2[1];
  }
  if (v4 >= 0) {
    unint64_t v6 = a2;
  }
  else {
    unint64_t v6 = *a2;
  }
  if (v3 >= 0) {
    size_t v7 = *((unsigned __int8 *)a3 + 23);
  }
  else {
    size_t v7 = (size_t)a3[1];
  }
  if (v3 >= 0) {
    uint64_t v8 = a3;
  }
  else {
    uint64_t v8 = *a3;
  }
  if (v7 >= v5) {
    size_t v9 = v5;
  }
  else {
    size_t v9 = v7;
  }
  int v10 = memcmp(v6, v8, v9);
  if (v10) {
    return v10 < 0;
  }
  else {
    return v5 < v7;
  }
}

uint64_t *sub_10000FDFC(uint64_t *result, uint64_t *a2)
{
  *((_BYTE *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      uint64_t v2 = (uint64_t *)a2[2];
      if (*((_BYTE *)v2 + 24)) {
        return result;
      }
      int v3 = (uint64_t *)v2[2];
      int v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        uint64_t v7 = v3[1];
        if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), size_t v5 = (_BYTE *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            size_t v9 = (uint64_t **)a2[2];
          }

          else
          {
            size_t v9 = (uint64_t **)v2[1];
            int v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              int v3 = (uint64_t *)v2[2];
            }

            v9[2] = v3;
            *(void *)(v2[2] + 8LL * (*(void *)v2[2] != (void)v2)) = v9;
            *size_t v9 = v2;
            v2[2] = (uint64_t)v9;
            int v3 = v9[2];
            uint64_t v2 = (uint64_t *)*v3;
          }

          *((_BYTE *)v9 + 24) = 1;
          *((_BYTE *)v3 + 24) = 0;
          uint64_t v13 = v2[1];
          uint64_t *v3 = v13;
          if (v13) {
            *(void *)(v13 + 16) = v3;
          }
          v2[2] = v3[2];
          *(void *)(v3[2] + 8LL * (*(void *)v3[2] != (void)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }

      else if (!v4 || (int v6 = *((unsigned __int8 *)v4 + 24), v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          uint64_t v11 = a2[1];
          uint64_t *v2 = v11;
          if (v11)
          {
            *(void *)(v11 + 16) = v2;
            int v3 = (uint64_t *)v2[2];
          }

          a2[2] = (uint64_t)v3;
          *(void *)(v2[2] + 8LL * (*(void *)v2[2] != (void)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          int v3 = (uint64_t *)a2[2];
        }

        else
        {
          a2 = (uint64_t *)a2[2];
        }

        *((_BYTE *)a2 + 24) = 1;
        *((_BYTE *)v3 + 24) = 0;
        uint64_t v2 = (uint64_t *)v3[1];
        uint64_t v12 = *v2;
        v3[1] = *v2;
        if (v12) {
          *(void *)(v12 + 16) = v3;
        }
        v2[2] = v3[2];
        *(void *)(v3[2] + 8LL * (*(void *)v3[2] != (void)v3)) = v2;
        uint64_t *v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }

      *((_BYTE *)v2 + 24) = 1;
      a2 = v3;
      *((_BYTE *)v3 + 24) = v3 == result;
      _BYTE *v5 = 1;
    }

    while (v3 != result);
  }

  return result;
}

void sub_10000FF94(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = a2;
  if (v2)
  {
    if (*(_BYTE *)(a1 + 16)) {
      sub_10000FFD8((uint64_t)v2 + 32);
    }
    operator delete(v2);
  }

uint64_t sub_10000FFD8(uint64_t a1)
{
  return a1;
}

void sub_100010060(uint64_t a1, char *a2)
{
  if (a2)
  {
    sub_100010060(a1, *(void *)a2);
    sub_100010060(a1, *((void *)a2 + 1));
    if (a2[55] < 0) {
      operator delete(*((void **)a2 + 4));
    }
    operator delete(a2);
  }

uint64_t *sub_1000100B0(uint64_t **a1, const void **a2, uint64_t a3, __int128 **a4)
{
  int v6 = (uint64_t **)sub_10000FCA4((uint64_t)a1, &v9, a2);
  id result = *v6;
  if (!*v6)
  {
    sub_100010144((uint64_t)a1, a4, (uint64_t)&v8);
    sub_10000FD40(a1, v9, v6, v8);
    return v8;
  }

  return result;
}

_BYTE *sub_100010144@<X0>(uint64_t a1@<X0>, __int128 **a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v5 = a1 + 8;
  int v6 = operator new(0x48uLL);
  *(void *)a3 = v6;
  *(void *)(a3 + _Block_object_dispose(va, 8) = v5;
  *(_BYTE *)(a3 + 16) = 0;
  id result = v6 + 4;
  int v8 = *a2;
  if (*((char *)*a2 + 23) < 0)
  {
    id result = sub_1000101E8(result, *(void **)v8, *((void *)v8 + 1));
  }

  else
  {
    __int128 v9 = *v8;
    v6[6] = *((void *)v8 + 2);
    *(_OWORD *)id result = v9;
  }

  void v6[7] = 0LL;
  v6[8] = 0LL;
  *(_BYTE *)(a3 + 16) = 1;
  return result;
}

void sub_1000101CC(_Unwind_Exception *a1)
{
  *uint64_t v1 = 0LL;
  sub_100010274(v3, v2);
  _Unwind_Resume(a1);
}

void *sub_1000101E8(_BYTE *__dst, void *__src, unint64_t a3)
{
  uint64_t v5 = __dst;
  if (a3 > 0x16)
  {
    if (a3 >= 0x7FFFFFFFFFFFFFF8LL) {
      sub_10000FAE8();
    }
    uint64_t v6 = (a3 & 0xFFFFFFFFFFFFFFF8LL) + 8;
    if ((a3 | 7) != 0x17) {
      uint64_t v6 = a3 | 7;
    }
    uint64_t v7 = v6 + 1;
    int v8 = operator new(v6 + 1);
    v5[1] = a3;
    v5[2] = v7 | 0x8000000000000000LL;
    void *v5 = v8;
    uint64_t v5 = v8;
  }

  else
  {
    __dst[23] = a3;
  }

  return memmove(v5, __src, a3 + 1);
}

void sub_100010274(uint64_t a1, void **__p)
{
  if (*(_BYTE *)(a1 + 8))
  {
  }

  else if (!__p)
  {
    return;
  }

  operator delete(__p);
}

uint64_t *sub_1000102C0(uint64_t **a1, unint64_t *a2, uint64_t a3, uint64_t **a4)
{
  uint64_t v7 = a1 + 1;
  uint64_t v6 = a1[1];
  if (v6)
  {
    unint64_t v8 = *a2;
    while (1)
    {
      while (1)
      {
        __int128 v9 = (uint64_t **)v6;
        unint64_t v10 = v6[4];
        if (v8 >= v10) {
          break;
        }
        uint64_t v6 = *v9;
        uint64_t v7 = v9;
        if (!*v9) {
          goto LABEL_10;
        }
      }

      if (v10 >= v8) {
        break;
      }
      uint64_t v6 = v9[1];
      if (!v6)
      {
        uint64_t v7 = v9 + 1;
        goto LABEL_10;
      }
    }
  }

  else
  {
    __int128 v9 = a1 + 1;
LABEL_10:
    uint64_t v11 = (uint64_t *)operator new(0x30uLL);
    v11[4] = **a4;
    v11[5] = 0LL;
    sub_10000FD40(a1, (uint64_t)v9, v7, v11);
    return v11;
  }

  return (uint64_t *)v9;
}

uint64_t *sub_10001037C(uint64_t **a1, uint64_t *a2)
{
  uint64_t v2 = (uint64_t *)a2[1];
  if (v2)
  {
    do
    {
      uint64_t v3 = v2;
      uint64_t v2 = (uint64_t *)*v2;
    }

    while (v2);
  }

  else
  {
    int v4 = a2;
    do
    {
      uint64_t v3 = (uint64_t *)v4[2];
      BOOL v5 = *v3 == (void)v4;
      int v4 = v3;
    }

    while (!v5);
  }

  if (*a1 == a2) {
    *a1 = v3;
  }
  uint64_t v6 = a1[1];
  a1[2] = (uint64_t *)((char *)a1[2] - 1);
  sub_1000103EC(v6, a2);
  return v3;
}

uint64_t *sub_1000103EC(uint64_t *result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  uint64_t v3 = a2;
  if (*a2)
  {
    int v4 = (uint64_t *)a2[1];
    if (!v4)
    {
      uint64_t v3 = a2;
      goto LABEL_7;
    }

    do
    {
      uint64_t v3 = v4;
      int v4 = (uint64_t *)*v4;
    }

    while (v4);
  }

  uint64_t v2 = v3[1];
  if (v2)
  {
LABEL_7:
    int v5 = 0;
    *(void *)(v2 + 16) = v3[2];
    goto LABEL_8;
  }

  int v5 = 1;
LABEL_8:
  uint64_t v6 = (uint64_t **)v3[2];
  uint64_t v7 = *v6;
  if (*v6 == v3)
  {
    *uint64_t v6 = (uint64_t *)v2;
    if (v3 == result)
    {
      uint64_t v7 = 0LL;
      id result = (uint64_t *)v2;
    }

    else
    {
      uint64_t v7 = v6[1];
    }
  }

  else
  {
    v6[1] = (uint64_t *)v2;
  }

  int v8 = *((unsigned __int8 *)v3 + 24);
  if (v3 != a2)
  {
    uint64_t v9 = a2[2];
    v3[2] = v9;
    *(void *)(v9 + 8LL * (*(void *)a2[2] != (void)a2)) = v3;
    uint64_t v11 = *a2;
    uint64_t v10 = a2[1];
    *(void *)(v11 + 16) = v3;
    uint64_t *v3 = v11;
    v3[1] = v10;
    if (v10) {
      *(void *)(v10 + 16) = v3;
    }
    *((_BYTE *)v3 + 24) = *((_BYTE *)a2 + 24);
    if (result == a2) {
      id result = v3;
    }
  }

  if (!v8 || !result) {
    return result;
  }
  if (!v5)
  {
    *(_BYTE *)(v2 + 24) = 1;
    return result;
  }

  while (1)
  {
    uint64_t v12 = v7[2];
    if (!*((_BYTE *)v7 + 24))
    {
      *((_BYTE *)v7 + 24) = 1;
      *(_BYTE *)(v12 + 24) = 0;
      uint64_t v13 = *(uint64_t **)(v12 + 8);
      uint64_t v14 = *v13;
      *(void *)(v12 + _Block_object_dispose(va, 8) = *v13;
      if (v14) {
        *(void *)(v14 + 16) = v12;
      }
      v13[2] = *(void *)(v12 + 16);
      *(void *)(*(void *)(v12 + 16) + 8LL * (**(void **)(v12 + 16) != v12)) = v13;
      uint64_t *v13 = v12;
      *(void *)(v12 + 16) = v13;
      uint64_t v7 = *(uint64_t **)(*v7 + 8);
    }

    pid_t v15 = (void *)*v7;
    if (*v7 && !*((_BYTE *)v15 + 24))
    {
      int v16 = (uint64_t *)v7[1];
      if (!v16) {
        goto LABEL_56;
      }
LABEL_55:
      if (*((_BYTE *)v16 + 24))
      {
LABEL_56:
        *((_BYTE *)v15 + 24) = 1;
        *((_BYTE *)v7 + 24) = 0;
        uint64_t v22 = v15[1];
        uint64_t *v7 = v22;
        if (v22) {
          *(void *)(v22 + 16) = v7;
        }
        v15[2] = v7[2];
        *(void *)(v7[2] + 8LL * (*(void *)v7[2] != (void)v7)) = v15;
        v15[1] = v7;
        v7[2] = (uint64_t)v15;
        int v16 = v7;
      }

      else
      {
        pid_t v15 = v7;
      }

      uint64_t v23 = v15[2];
      *((_BYTE *)v15 + 24) = *(_BYTE *)(v23 + 24);
      *(_BYTE *)(v23 + 24) = 1;
      *((_BYTE *)v16 + 24) = 1;
      float v24 = *(uint64_t **)(v23 + 8);
      uint64_t v25 = *v24;
      *(void *)(v23 + _Block_object_dispose(va, 8) = *v24;
      if (v25) {
        *(void *)(v25 + 16) = v23;
      }
      v24[2] = *(void *)(v23 + 16);
      *(void *)(*(void *)(v23 + 16) + 8LL * (**(void **)(v23 + 16) != v23)) = v24;
      *float v24 = v23;
      goto LABEL_72;
    }

    int v16 = (uint64_t *)v7[1];
    if (v16 && !*((_BYTE *)v16 + 24)) {
      goto LABEL_55;
    }
    *((_BYTE *)v7 + 24) = 0;
    int v17 = (uint64_t *)v7[2];
    if (v17 == result)
    {
      int v17 = result;
LABEL_53:
      *((_BYTE *)v17 + 24) = 1;
      return result;
    }

    if (!*((_BYTE *)v17 + 24)) {
      goto LABEL_53;
    }
LABEL_49:
    uint64_t v7 = *(uint64_t **)(v17[2] + 8LL * (*(void *)v17[2] == (void)v17));
  }

  if (!*((_BYTE *)v7 + 24))
  {
    *((_BYTE *)v7 + 24) = 1;
    *(_BYTE *)(v12 + 24) = 0;
    uint64_t v18 = v7[1];
    *(void *)uint64_t v12 = v18;
    if (v18) {
      *(void *)(v18 + 16) = v12;
    }
    v7[2] = *(void *)(v12 + 16);
    *(void *)(*(void *)(v12 + 16) + 8LL * (**(void **)(v12 + 16) != v12)) = v7;
    v7[1] = v12;
    *(void *)(v12 + 16) = v7;
    uint64_t v7 = *(uint64_t **)v12;
  }

  uint64_t v19 = (void *)*v7;
  if (*v7 && !*((_BYTE *)v19 + 24)) {
    goto LABEL_68;
  }
  int v20 = (uint64_t *)v7[1];
  if (!v20 || *((_BYTE *)v20 + 24))
  {
    *((_BYTE *)v7 + 24) = 0;
    int v17 = (uint64_t *)v7[2];
    if (*((_BYTE *)v17 + 24)) {
      BOOL v21 = v17 == result;
    }
    else {
      BOOL v21 = 1;
    }
    if (v21) {
      goto LABEL_53;
    }
    goto LABEL_49;
  }

  if (v19 && !*((_BYTE *)v19 + 24))
  {
LABEL_68:
    int v20 = v7;
  }

  else
  {
    *((_BYTE *)v20 + 24) = 1;
    *((_BYTE *)v7 + 24) = 0;
    uint64_t v26 = *v20;
    v7[1] = *v20;
    if (v26) {
      *(void *)(v26 + 16) = v7;
    }
    v20[2] = v7[2];
    *(void *)(v7[2] + 8LL * (*(void *)v7[2] != (void)v7)) = v20;
    uint64_t *v20 = (uint64_t)v7;
    v7[2] = (uint64_t)v20;
    uint64_t v19 = v7;
  }

  uint64_t v23 = v20[2];
  *((_BYTE *)v20 + 24) = *(_BYTE *)(v23 + 24);
  *(_BYTE *)(v23 + 24) = 1;
  *((_BYTE *)v19 + 24) = 1;
  float v24 = *(uint64_t **)v23;
  uint64_t v27 = *(void *)(*(void *)v23 + 8LL);
  *(void *)uint64_t v23 = v27;
  if (v27) {
    *(void *)(v27 + 16) = v23;
  }
  v24[2] = *(void *)(v23 + 16);
  *(void *)(*(void *)(v23 + 16) + 8LL * (**(void **)(v23 + 16) != v23)) = v24;
  v24[1] = v23;
LABEL_72:
  *(void *)(v23 + 16) = v24;
  return result;
}

uint64_t sub_100010770(uint64_t a1, unint64_t *a2)
{
  uint64_t v2 = *(void **)(a1 + 8);
  if (!v2) {
    return 0LL;
  }
  unint64_t v3 = *a2;
  int v4 = (uint64_t *)(a1 + 8);
  do
  {
    unint64_t v5 = v2[4];
    BOOL v6 = v5 >= v3;
    if (v5 >= v3) {
      uint64_t v7 = v2;
    }
    else {
      uint64_t v7 = v2 + 1;
    }
    if (v6) {
      int v4 = v2;
    }
    uint64_t v2 = (void *)*v7;
  }

  while (*v7);
  sub_10001037C((uint64_t **)a1, v4);
  operator delete(v4);
  return 1LL;
}

uint64_t *sub_1000107E8(uint64_t **a1, unint64_t *a2, uint64_t *a3)
{
  BOOL v6 = a1 + 1;
  unint64_t v5 = a1[1];
  if (v5)
  {
    unint64_t v7 = *a2;
    while (1)
    {
      while (1)
      {
        int v8 = (uint64_t **)v5;
        unint64_t v9 = v5[4];
        if (v7 >= v9) {
          break;
        }
        unint64_t v5 = *v8;
        BOOL v6 = v8;
        if (!*v8) {
          goto LABEL_10;
        }
      }

      if (v9 >= v7) {
        break;
      }
      unint64_t v5 = v8[1];
      if (!v5)
      {
        BOOL v6 = v8 + 1;
        goto LABEL_10;
      }
    }
  }

  else
  {
    int v8 = a1 + 1;
LABEL_10:
    uint64_t v10 = (uint64_t *)operator new(0x28uLL);
    v10[4] = *a3;
    sub_10000FD40(a1, (uint64_t)v8, v6, v10);
    return v10;
  }

  return (uint64_t *)v8;
}

uint64_t sub_1000108A0(uint64_t **a1, const void **a2)
{
  uint64_t v3 = sub_1000108E4((uint64_t)a1, a2);
  sub_100010970(a1, v3);
  return 1LL;
}

uint64_t sub_1000108E4(uint64_t a1, const void **a2)
{
  uint64_t v2 = a1 + 8;
  uint64_t v3 = *(void *)(a1 + 8);
  if (!v3) {
    return v2;
  }
  uint64_t v5 = a1 + 16;
  uint64_t v6 = a1 + 8;
  do
  {
    BOOL v7 = sub_10000FD94(v5, (const void **)(v3 + 32), a2);
    int v8 = (uint64_t *)(v3 + 8);
    if (!v7)
    {
      int v8 = (uint64_t *)v3;
      uint64_t v6 = v3;
    }

    uint64_t v3 = *v8;
  }

  while (*v8);
  return v6;
}

uint64_t *sub_100010970(uint64_t **a1, uint64_t a2)
{
  uint64_t v3 = sub_10001037C(a1, (uint64_t *)a2);
  operator delete((void *)a2);
  return v3;
}

void sub_1000109B0(uint64_t a1, void *a2)
{
  if (a2)
  {
    sub_1000109B0(a1, *a2);
    sub_1000109B0(a1, a2[1]);
    sub_10000FFD8((uint64_t)(a2 + 4));
    operator delete(a2);
  }

void sub_1000109F8()
{
}

void *sub_100010A0C(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x666666666666667LL) {
    sub_10000FB70();
  }
  return operator new(40 * a2);
}

uint64_t sub_100010A50()
{
  qword_10001CE80 = 0LL;
  qword_10001CE78 = 0LL;
  qword_10001CE70 = (uint64_t)&qword_10001CE78;
  __cxa_atexit((void (*)(void *))sub_10000D530, &qword_10001CE70, (void *)&_mh_execute_header);
  qword_10001CF38 = 0LL;
  qword_10001CF30 = 0LL;
  sMinions = (uint64_t)&qword_10001CF30;
  __cxa_atexit((void (*)(void *))sub_10000E2BC, &sMinions, (void *)&_mh_execute_header);
  RDRecognizers::RDRecognizers((RDRecognizers *)&unk_10001CEF8);
  return __cxa_atexit((void (*)(void *))sub_10000E2E8, &unk_10001CEF8, (void *)&_mh_execute_header);
}

CFStringRef RDCopyModelPath(void)
{
  int v0 = (const __CFArray *)CFCopySearchPathForDirectoriesInDomains(5LL, 8LL, 1LL);
  ValueAtIndex = (const __CFURL *)CFArrayGetValueAtIndex(v0, 0LL);
  CFStringRef v2 = CFURLCopyFileSystemPath(ValueAtIndex, kCFURLPOSIXPathStyle);
  CFStringRef v3 = CFStringCreateWithFormat(0LL, 0LL, @"%@/Speech/Recognizers/SpeechRecognitionCoreLanguages", v2);
  CFRelease(v2);
  CFRelease(v0);
  return v3;
}

CFURLRef RDCopyCacheURL(void)
{
  int v0 = (const __CFArray *)CFCopySearchPathForDirectoriesInDomains(13LL, 1LL, 1LL);
  ValueAtIndex = (const __CFURL *)CFArrayGetValueAtIndex(v0, 0LL);
  CFStringRef v2 = CFURLCreateCopyAppendingPathComponent(0LL, ValueAtIndex, @"com.apple.SpeechRecognitionCore", 1u);
  CFRelease(v0);
  CFStringRef v3 = CFURLCopyPath(v2);
  if (v3)
  {
    int v4 = v3;
    CFStringGetCString(v3, buffer, 2000LL, 0x8000100u);
    uint64_t v5 = opendir(buffer);
    if (v5)
    {
      closedir(v5);
    }

    else if (mkdir(buffer, 0x1EDu))
    {
      BOOL v7 = (os_log_s *)RXOSLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        int v8 = 138412290;
        unint64_t v9 = v2;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Error creating %@", (uint8_t *)&v8, 0xCu);
      }
    }

    CFRelease(v4);
  }

  return v2;
}

CFDictionaryRef RDCopyInfoDict(CFURLRef url)
{
  uint64_t v1 = CFURLCreateCopyAppendingPathComponent(0LL, url, @"Info.plist", 0);
  return sub_100010CB8(v1);
}

CFDictionaryRef sub_100010CB8(CFURLRef fileURL)
{
  if (!fileURL) {
    return 0LL;
  }
  CFStringRef v2 = CFReadStreamCreateWithFile(0LL, fileURL);
  if (v2)
  {
    CFStringRef v3 = v2;
    CFReadStreamOpen(v2);
    CFErrorRef error = 0LL;
    int v4 = (const __CFDictionary *)CFPropertyListCreateWithStream(0LL, v3, 0LL, 0LL, 0LL, &error);
    uint64_t v5 = v4;
    if (v4)
    {
      Value = (const __CFString *)CFDictionaryGetValue(v4, @"CFBundleShortVersionString");
      if (CFStringGetCharacterAtIndex(Value, 0LL) <= 0x31u)
      {
        CFRelease(v5);
        uint64_t v5 = 0LL;
      }
    }

    CFReadStreamClose(v3);
    CFRelease(v3);
  }

  else
  {
    uint64_t v5 = 0LL;
  }

  CFRelease(fileURL);
  return v5;
}

CFBooleanRef RDCopyCacheVersion(const __CFString *a1)
{
  uint64_t v1 = sub_100010E84(a1);
  if (v1)
  {
    CFStringRef v2 = v1;
    CFStringRef v3 = CFURLCreateCopyAppendingPathComponent(0LL, v1, @"Info.plist", 0);
    int v4 = sub_100010CB8(v3);
    if (v4)
    {
      uint64_t v5 = v4;
      Value = (const __CFBoolean *)CFDictionaryGetValue(v4, @"CFBundleShortVersionString");
      if (Value)
      {
        CFBooleanRef v7 = Value;
        CFRetain(Value);
        CFRelease(v5);
LABEL_15:
        CFRelease(v2);
        return v7;
      }

      CFRelease(v5);
    }

    RDURL::RDURL((RDURL *)__p, v2, 0);
    if (v11 >= 0) {
      int v8 = __p;
    }
    else {
      int v8 = (void **)__p[0];
    }
    else {
      CFBooleanRef v7 = kCFBooleanTrue;
    }
    if (v11 < 0) {
      operator delete(__p[0]);
    }
    goto LABEL_15;
  }

  return 0LL;
}

void sub_100010E68( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

CFURLRef sub_100010E84(const __CFString *a1)
{
  CFStringRef v1 = RDCopyBestNashvilleLocaleIdentifier(a1);
  if (!v1) {
    return 0LL;
  }
  CFStringRef v2 = v1;
  CFStringRef v3 = RDCopyCacheURL();
  if (v3)
  {
    int v4 = v3;
    uint64_t v5 = CFURLCreateCopyAppendingPathComponent(0LL, v3, @"Users", 1u);
    if (v5)
    {
      uint64_t v6 = v5;
      CFURLRef v7 = CFURLCreateCopyAppendingPathComponent(0LL, v5, v2, 1u);
      CFRelease(v6);
    }

    else
    {
      CFURLRef v7 = 0LL;
    }

    CFRelease(v4);
  }

  else
  {
    CFURLRef v7 = 0LL;
  }

  CFRelease(v2);
  return v7;
}

void RDNukeCache(const __CFString *a1)
{
  if (a1)
  {
    CFStringRef v1 = sub_100010E84(a1);
    if (!v1) {
      return;
    }
    RDURL::RDURL((RDURL *)__p, v1, 1);
    if (v5 >= 0) {
      CFStringRef v2 = __p;
    }
    else {
      CFStringRef v2 = (void **)__p[0];
    }
  }

  else
  {
    CFStringRef v3 = RDCopyCacheURL();
    if (!v3) {
      return;
    }
    RDURL::RDURL((RDURL *)__p, v3, 1);
    if (v5 >= 0) {
      CFStringRef v2 = __p;
    }
    else {
      CFStringRef v2 = (void **)__p[0];
    }
  }

  removefile((const char *)v2, 0LL, 1u);
  if (v5 < 0) {
    operator delete(__p[0]);
  }
}

void sub_100010FD4( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

__CFSet *RDCopyNashvilleModelLanguages(void)
{
  int v0 = RDCopyModelPath();
  RDString::RDString((RDString *)v22, v0, 1);
  if ((v23 & 0x80u) == 0) {
    CFStringRef v1 = v22;
  }
  else {
    CFStringRef v1 = (void **)v22[0];
  }
  CFStringRef v2 = opendir((const char *)v1);
  CFMutableSetRef Mutable = CFSetCreateMutable(0LL, 0LL, &kCFTypeSetCallBacks);
  int v4 = Mutable;
  if (v2) {
    BOOL v5 = Mutable == 0LL;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    while (1)
    {
      while (1)
      {
        do
        {
          uint64_t v6 = readdir(v2);
          if (!v6)
          {
            closedir(v2);
            goto LABEL_30;
          }

          d_name = v6->d_name;
          int v8 = strstr(v6->d_name, ".SpeechRecognition");
        }

        while (!v8);
        unint64_t v9 = v8;
        if ((v23 & 0x80u) == 0) {
          size_t v10 = v23;
        }
        else {
          size_t v10 = (size_t)v22[1];
        }
        sub_1000121B8((uint64_t)&v20, v10 + 1);
        if ((v20.__r_.__value_.__s.__size_ & 0x80u) == 0) {
          char v11 = &v20;
        }
        else {
          char v11 = (std::string *)v20.__r_.__value_.__r.__words[0];
        }
        if (v10)
        {
          if ((v23 & 0x80u) == 0) {
            stat v12 = v22;
          }
          else {
            stat v12 = (void **)v22[0];
          }
          memmove(v11, v12, v10);
        }

        *(_WORD *)((char *)&v11->__r_.__value_.__l.__data_ + v10) = 47;
        uint64_t v13 = std::string::append(&v20, d_name);
        __int128 v14 = *(_OWORD *)&v13->__r_.__value_.__l.__data_;
        __p.__r_.__value_.__l.__cap_ = v13->__r_.__value_.__l.__cap_;
        *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v14;
        v13->__r_.__value_.__l.__size_ = 0LL;
        v13->__r_.__value_.__l.__cap_ = 0LL;
        v13->__r_.__value_.__r.__words[0] = 0LL;
        BOOL v15 = sub_10001126C(&__p);
        if (v15) {
          goto LABEL_27;
        }
      }

      operator delete(v20.__r_.__value_.__l.__data_);
      if (v15)
      {
LABEL_27:
        CFStringRef v16 = CFStringCreateWithBytes(0LL, (const UInt8 *)d_name, v9 - d_name, 0x8000100u, 0);
        CFSetAddValue(v4, v16);
        CFRelease(v16);
        int v17 = strchr(d_name, 95);
        if (v17)
        {
          CFStringRef v18 = CFStringCreateWithBytes(0LL, (const UInt8 *)d_name, v17 - d_name, 0x8000100u, 0);
          CFSetAddValue(v4, v18);
          CFRelease(v18);
        }
      }
    }
  }

LABEL_30:
  return v4;
}

void sub_10001120C( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20, char a21, uint64_t a22, void *__p, uint64_t a24, int a25, __int16 a26, char a27, char a28)
{
  if (a28 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

BOOL sub_10001126C(std::string *a1)
{
  CFStringRef v1 = a1;
  std::string::append(a1, "/Contents/Info.plist");
  CFStringRef v2 = (const char *)v1;
  if (stat(v2, &v9)) {
    return 0LL;
  }
  int v4 = CFStringCreateWithCStringNoCopy(0LL, (const char *)v1, 0x8000100u, kCFAllocatorNull);
  if (!v4) {
    return 0LL;
  }
  BOOL v5 = v4;
  uint64_t v6 = CFURLCreateWithFileSystemPath(0LL, v4, kCFURLPOSIXPathStyle, 0);
  CFURLRef v7 = sub_100010CB8(v6);
  BOOL v3 = v7 != 0LL;
  if (v7) {
    CFRelease(v7);
  }
  CFRelease(v5);
  return v3;
}

CFStringRef RDCopyBestNashvilleLocaleIdentifier(CFStringRef theString)
{
  std::string v67 = v66;
  memset(&v66, 0, sizeof(v66));
  CFStringRef v1 = RDCopyModelPath();
  if (!v1)
  {
    sub_10000FA38(&cStr, "");
    goto LABEL_169;
  }

  RDString::RDString((RDString *)v80, v1, 1);
  std::string::push_back(v2, 47);
  sub_10000FA38(&v77, ".SpeechRecognition");
  sub_100012018(v80, (const void **)&v67.__r_.__value_.__l.__data_, (uint64_t)&v75);
  if ((v79 & 0x80u) == 0) {
    BOOL v3 = (const std::string::value_type *)&v77;
  }
  else {
    BOOL v3 = (const std::string::value_type *)v77;
  }
  if ((v79 & 0x80u) == 0) {
    std::string::size_type v4 = v79;
  }
  else {
    std::string::size_type v4 = v78;
  }
  BOOL v5 = std::string::append(&v75, v3, v4);
  __int128 v6 = *(_OWORD *)&v5->__r_.__value_.__l.__data_;
  v76.__r_.__value_.__l.__cap_ = v5->__r_.__value_.__l.__cap_;
  *(_OWORD *)&v76.__r_.__value_.__l.__data_ = v6;
  v5->__r_.__value_.__l.__size_ = 0LL;
  v5->__r_.__value_.__l.__cap_ = 0LL;
  v5->__r_.__value_.__r.__words[0] = 0LL;
  BOOL v7 = sub_10001126C(&v76);
  if ((char)v75.__r_.__value_.__s.__size_ < 0)
  {
    operator delete(v75.__r_.__value_.__l.__data_);
    if (v7) {
      goto LABEL_59;
    }
  }

  else if (v7)
  {
    goto LABEL_59;
  }

  std::string::size_type v8 = std::string::find(&v67, 46, 0LL);
  if (v8 != -1LL)
  {
    stat v9 = (char *)&v67 + v67.__r_.__value_.__s.__size_;
    if ((v67.__r_.__value_.__s.__size_ & 0x80u) == 0)
    {
      size_t v10 = &v67;
    }

    else
    {
      stat v9 = (char *)(v67.__r_.__value_.__r.__words[0] + v67.__r_.__value_.__l.__size_);
      size_t v10 = (std::string *)v67.__r_.__value_.__r.__words[0];
    }

    std::string::erase(&v67, v8, v9 - ((char *)v10 + v8));
    sub_100012018(v80, (const void **)&v67.__r_.__value_.__l.__data_, (uint64_t)&v74);
    if ((v79 & 0x80u) == 0) {
      char v11 = (const std::string::value_type *)&v77;
    }
    else {
      char v11 = (const std::string::value_type *)v77;
    }
    if ((v79 & 0x80u) == 0) {
      std::string::size_type v12 = v79;
    }
    else {
      std::string::size_type v12 = v78;
    }
    uint64_t v13 = std::string::append(&v74, v11, v12);
    __int128 v14 = *(_OWORD *)&v13->__r_.__value_.__l.__data_;
    v75.__r_.__value_.__l.__cap_ = v13->__r_.__value_.__l.__cap_;
    *(_OWORD *)&v75.__r_.__value_.__l.__data_ = v14;
    v13->__r_.__value_.__l.__size_ = 0LL;
    v13->__r_.__value_.__l.__cap_ = 0LL;
    v13->__r_.__value_.__r.__words[0] = 0LL;
    BOOL v15 = sub_10001126C(&v75);
    if ((char)v74.__r_.__value_.__s.__size_ < 0)
    {
      operator delete(v74.__r_.__value_.__l.__data_);
      if (v15) {
        goto LABEL_59;
      }
    }

    else if (v15)
    {
      goto LABEL_59;
    }
  }

  if ((v67.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    CFStringRef v16 = &v67;
  }
  else {
    CFStringRef v16 = (std::string *)v67.__r_.__value_.__r.__words[0];
  }
  if ((v67.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    std::string::size_type size = v67.__r_.__value_.__s.__size_;
  }
  else {
    std::string::size_type size = v67.__r_.__value_.__l.__size_;
  }
  if (size)
  {
    CFStringRef v18 = (unsigned __int8 *)v16 + size;
    uint64_t v19 = v16;
LABEL_39:
    uint64_t v20 = 0LL;
    while (v19->__r_.__value_.__s.__data_[0] != asc_100015117[v20])
    {
      if (++v20 == 2)
      {
        uint64_t v19 = (std::string *)((char *)v19 + 1);
        if (v19 == (std::string *)v18) {
          goto LABEL_60;
        }
        goto LABEL_39;
      }
    }

    if (v19 != (std::string *)v18 && (char *)v19 - (char *)v16 != -1)
    {
      BOOL v21 = (char *)&v67 + v67.__r_.__value_.__s.__size_;
      if ((v67.__r_.__value_.__s.__size_ & 0x80u) != 0) {
        BOOL v21 = (char *)(v67.__r_.__value_.__r.__words[0] + v67.__r_.__value_.__l.__size_);
      }
      std::string::erase(&v67, (char *)v19 - (char *)v16, v21 - (char *)v19);
      sub_100012018(v80, (const void **)&v67.__r_.__value_.__l.__data_, (uint64_t)&v73);
      if ((v79 & 0x80u) == 0) {
        uint64_t v22 = (const std::string::value_type *)&v77;
      }
      else {
        uint64_t v22 = (const std::string::value_type *)v77;
      }
      if ((v79 & 0x80u) == 0) {
        std::string::size_type v23 = v79;
      }
      else {
        std::string::size_type v23 = v78;
      }
      float v24 = std::string::append(&v73, v22, v23);
      __int128 v25 = *(_OWORD *)&v24->__r_.__value_.__l.__data_;
      v74.__r_.__value_.__l.__cap_ = v24->__r_.__value_.__l.__cap_;
      *(_OWORD *)&v74.__r_.__value_.__l.__data_ = v25;
      v24->__r_.__value_.__l.__size_ = 0LL;
      v24->__r_.__value_.__l.__cap_ = 0LL;
      v24->__r_.__value_.__r.__words[0] = 0LL;
      BOOL v26 = sub_10001126C(&v74);
      if (v26)
      {
LABEL_59:
        std::string cStr = v67;
        memset(&v67, 0, sizeof(v67));
        goto LABEL_165;
      }
    }
  }

LABEL_60:
  sub_10000FA38(&v73, "");
  if (((char)v67.__r_.__value_.__s.__size_ & 0x80000000) == 0)
  {
    if (v67.__r_.__value_.__s.__size_ != 2) {
      goto LABEL_76;
    }
    if (LOWORD(v67.__r_.__value_.__l.__data_) != 28261)
    {
      if (LOWORD(v67.__r_.__value_.__l.__data_) != 29286)
      {
        if (LOWORD(v67.__r_.__value_.__l.__data_) != 29541)
        {
          uint64_t v27 = &v67;
          goto LABEL_70;
        }

LABEL_74:
        float v28 = "es_US";
        goto LABEL_75;
      }

LABEL_73:
      float v28 = "fr_FR";
      goto LABEL_75;
    }

LABEL_72:
    float v28 = "en_US";
    goto LABEL_75;
  }

  if (v67.__r_.__value_.__l.__size_ != 2) {
    goto LABEL_76;
  }
  uint64_t v27 = (std::string *)v67.__r_.__value_.__r.__words[0];
  switch(*(_WORD *)v67.__r_.__value_.__l.__data_)
  {
    case 0x6E65:
      goto LABEL_72;
    case 0x7266:
      goto LABEL_73;
    case 0x7365:
      goto LABEL_74;
  }

LABEL_70:
  if (LOWORD(v27->__r_.__value_.__l.__data_) == 25956)
  {
    float v28 = "de_DE";
LABEL_75:
    std::string::assign(&v73, v28);
  }

LABEL_76:
  std::string::size_type v29 = v73.__r_.__value_.__s.__size_;
  if ((v73.__r_.__value_.__s.__size_ & 0x80u) != 0) {
    std::string::size_type v29 = v73.__r_.__value_.__l.__size_;
  }
  if (v29)
  {
    sub_100012018(v80, (const void **)&v73.__r_.__value_.__l.__data_, (uint64_t)&__s1);
    if ((v79 & 0x80u) == 0) {
      id v30 = (const std::string::value_type *)&v77;
    }
    else {
      id v30 = (const std::string::value_type *)v77;
    }
    if ((v79 & 0x80u) == 0) {
      std::string::size_type v31 = v79;
    }
    else {
      std::string::size_type v31 = v78;
    }
    id v32 = std::string::append(&__s1, v30, v31);
    __int128 v33 = *(_OWORD *)&v32->__r_.__value_.__l.__data_;
    __p.__r_.__value_.__l.__cap_ = v32->__r_.__value_.__l.__cap_;
    *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v33;
    v32->__r_.__value_.__l.__size_ = 0LL;
    v32->__r_.__value_.__l.__cap_ = 0LL;
    v32->__r_.__value_.__r.__words[0] = 0LL;
    BOOL v34 = sub_10001126C(&__p);
    if ((char)__s1.__r_.__value_.__s.__size_ < 0)
    {
      operator delete(__s1.__r_.__value_.__l.__data_);
      if (v34) {
        goto LABEL_89;
      }
    }

    else if (v34)
    {
LABEL_89:
      std::string cStr = v73;
      memset(&v73, 0, sizeof(v73));
      goto LABEL_163;
    }
  }

  if ((v81 & 0x80u) == 0) {
    int v35 = (const char *)v80;
  }
  else {
    int v35 = (const char *)v80[0];
  }
  uint64_t v36 = opendir(v35);
  if (!v36)
  {
LABEL_162:
    sub_10000FA38(&cStr, "");
    goto LABEL_163;
  }

  while (1)
  {
    CFTypeID v37 = readdir(v36);
    if (!v37)
    {
      closedir(v36);
      goto LABEL_162;
    }

    d_name = v37->d_name;
    sub_10000FA38(&__s1, v37->d_name);
    int64_t v39 = __s1.__r_.__value_.__s.__size_;
    int v40 = (char)__s1.__r_.__value_.__s.__size_;
    p_s1 = (std::string *)__s1.__r_.__value_.__r.__words[0];
    v42 = (__s1.__r_.__value_.__s.__size_ & 0x80u) == 0 ? &__s1 : (std::string *)__s1.__r_.__value_.__r.__words[0];
    v43 = (v79 & 0x80u) == 0 ? (void **)&v77 : v77;
    int64_t v44 = (v79 & 0x80u) == 0 ? v79 : v78;
    if (!v44) {
      goto LABEL_140;
    }
    if ((__s1.__r_.__value_.__s.__size_ & 0x80u) != 0) {
      int64_t v39 = __s1.__r_.__value_.__l.__size_;
    }
    if (v39 >= v44)
    {
      v45 = (char *)v42 + v39;
      int v46 = *(char *)v43;
      v47 = v42;
      while (1)
      {
        int64_t v48 = v39 - v44;
        if (v48 == -1) {
          goto LABEL_159;
        }
        v49 = (char *)memchr(v47, v46, v48 + 1);
        if (!v49) {
          goto LABEL_159;
        }
        v50 = v49;
        if (!memcmp(v49, v43, v44)) {
          break;
        }
        v47 = (std::string *)(v50 + 1);
        int64_t v39 = v45 - (v50 + 1);
        if (v39 < v44) {
          goto LABEL_159;
        }
      }

      if (v50 != v45 && v50 - (char *)v42 != -1)
      {
LABEL_140:
        std::string::size_type v51 = (v67.__r_.__value_.__s.__size_ & 0x80u) == 0
            ? v67.__r_.__value_.__s.__size_
            : v67.__r_.__value_.__l.__size_;
        if (v40 < 0)
        {
          if (v51 == -1LL) {
LABEL_186:
          }
            sub_10001223C();
          unint64_t v52 = __s1.__r_.__value_.__l.__size_ >= 2 ? 2LL : __s1.__r_.__value_.__l.__size_;
        }

        else
        {
          if (v51 == -1LL) {
            goto LABEL_186;
          }
          unint64_t v52 = (v40 & 0xFE) != 0 ? 2LL : v40;
          p_s1 = &__s1;
        }

        v53 = (v67.__r_.__value_.__s.__size_ & 0x80u) == 0 ? &v67 : (std::string *)v67.__r_.__value_.__r.__words[0];
        size_t v54 = v52 >= v51 ? v51 : v52;
        if (!memcmp(p_s1, v53, v54) && v52 == v51) {
          break;
        }
      }
    }

LABEL_159:
    if ((v40 & 0x80) != 0) {
      operator delete(__s1.__r_.__value_.__l.__data_);
    }
  }

  if ((v81 & 0x80u) == 0) {
    size_t v56 = v81;
  }
  else {
    size_t v56 = (size_t)v80[1];
  }
  sub_1000121B8((uint64_t)&v69, v56 + 1);
  if ((v69.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    v57 = &v69;
  }
  else {
    v57 = (std::string *)v69.__r_.__value_.__r.__words[0];
  }
  if (v56)
  {
    if ((v81 & 0x80u) == 0) {
      v58 = v80;
    }
    else {
      v58 = (const void **)v80[0];
    }
    memmove(v57, v58, v56);
  }

  *(_WORD *)((char *)&v57->__r_.__value_.__l.__data_ + v56) = 47;
  v59 = std::string::append(&v69, d_name);
  __int128 v60 = *(_OWORD *)&v59->__r_.__value_.__l.__data_;
  v70.__r_.__value_.__l.__cap_ = v59->__r_.__value_.__l.__cap_;
  *(_OWORD *)&v70.__r_.__value_.__l.__data_ = v60;
  v59->__r_.__value_.__l.__size_ = 0LL;
  v59->__r_.__value_.__l.__cap_ = 0LL;
  v59->__r_.__value_.__r.__words[0] = 0LL;
  BOOL v61 = sub_10001126C(&v70);
  if (!v61)
  {
    LOBYTE(v4RDString::RDString((RDString *)&v66, theString, 0) = __s1.__r_.__value_.__s.__size_;
    goto LABEL_159;
  }

  closedir(v36);
  std::string::size_type v65 = sub_1000120E0((uint64_t *)&__s1, (char *)&v77, 0LL);
  std::string::basic_string(&cStr, &__s1, 0LL, v65, (std::allocator<char> *)&v69);
LABEL_163:
LABEL_165:
LABEL_169:
  if ((char)cStr.__r_.__value_.__s.__size_ < 0)
  {
    if (cStr.__r_.__value_.__l.__size_)
    {
      p_std::string cStr = (std::string *)cStr.__r_.__value_.__r.__words[0];
LABEL_178:
      CFStringRef v63 = CFStringCreateWithCString(0LL, (const char *)p_cStr, 0x8000100u);
    }

    else
    {
      CFStringRef v63 = 0LL;
    }

    operator delete(cStr.__r_.__value_.__l.__data_);
    return v63;
  }

  if (cStr.__r_.__value_.__s.__size_)
  {
    p_std::string cStr = &cStr;
    goto LABEL_178;
  }

  return 0LL;
}

void sub_100011B3C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20, char a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, void *a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, void *a35, uint64_t a36, uint64_t a37, void *a38, uint64_t a39, int a40, __int16 a41, char a42, char a43, void *__p, uint64_t a45, int a46, __int16 a47, char a48, char a49)
{
  if (a49 < 0) {
    operator delete(__p);
  }
  if (a43 < 0) {
    operator delete(a38);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (a15 < 0) {
    operator delete(a10);
  }
  _Unwind_Resume(a1);
}

uint64_t RDDoLocaleIdentifiersMatch(CFLocaleIdentifier localeIdentifier, const __CFString *a2)
{
  BOOL v3 = CFLocaleCreate(0LL, localeIdentifier);
  CFLocaleRef v4 = CFLocaleCreate(0LL, a2);
  if (v3)
  {
    BOOL v5 = v4;
    if (!v4)
    {
      uint64_t v12 = 0LL;
      goto LABEL_12;
    }

    Value = (const __CFString *)CFLocaleGetValue(v3, kCFLocaleLanguageCode);
    BOOL v7 = (const __CFString *)CFLocaleGetValue(v3, kCFLocaleCountryCode);
    std::string::size_type v8 = (const __CFString *)CFLocaleGetValue(v5, kCFLocaleLanguageCode);
    stat v9 = (const __CFString *)CFLocaleGetValue(v5, kCFLocaleCountryCode);
    if (Value) {
      BOOL v10 = v8 == 0LL;
    }
    else {
      BOOL v10 = 1;
    }
    if (v10) {
      goto LABEL_8;
    }
    char v11 = v9;
    if (CFStringCompare(Value, v8, 0LL)) {
      goto LABEL_8;
    }
    if (v7) {
      BOOL v14 = v11 == 0LL;
    }
    else {
      BOOL v14 = 1;
    }
    if (v14)
    {
    }

    else if (CFStringCompare(v7, v11, 0LL) == kCFCompareEqualTo)
    {
LABEL_22:
      uint64_t v12 = 1LL;
      goto LABEL_9;
    }

void RDString::RDString(RDString *this, CFStringRef theString, int a3)
{
  *(void *)this = 0LL;
  *((void *)this + 1) = 0LL;
  *((void *)this + 2) = 0LL;
  if (theString)
  {
    CStringPtr = CFStringGetCStringPtr(theString, 0x8000100u);
    if (CStringPtr)
    {
      std::string::assign((std::string *)this, CStringPtr);
    }

    else
    {
      CFIndex Length = CFStringGetLength(theString);
      CFIndex MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
      std::string::resize((std::string *)this, MaximumSizeForEncoding + 2, 0);
      stat v9 = (char *)this;
      CFStringGetCString(theString, v9, MaximumSizeForEncoding + 1, 0x8000100u);
      BOOL v10 = (const char *)this;
      size_t v11 = strlen(v10);
      std::string::resize((std::string *)this, v11, 0);
    }

    if (a3) {
      CFRelease(theString);
    }
  }

void sub_100011ECC(_Unwind_Exception *exception_object)
{
}

void RDInt::RDInt(RDInt *this, CFNumberRef number, int a3)
{
  if (number)
  {
    CFNumberGetValue(number, kCFNumberIntType, this);
    if (a3) {
      CFRelease(number);
    }
  }

  else
  {
    *(_DWORD *)this = 0;
  }

void RDURL::RDURL(RDURL *this, CFURLRef anURL, int a3)
{
  if (anURL)
  {
    __int128 v6 = CFURLCopyFileSystemPath(anURL, kCFURLPOSIXPathStyle);
    RDString::RDString(this, v6, 1);
    if (a3) {
      CFRelease(anURL);
    }
  }

  else
  {
    *(void *)this = 0LL;
    *((void *)this + 1) = 0LL;
    *((void *)this + 2) = 0LL;
  }

void sub_100011FB4(_Unwind_Exception *exception_object)
{
}

std::string *RDURL::DirName(std::string *this)
{
  id result = (std::string *)std::string::rfind(this, 47, 0xFFFFFFFFFFFFFFFFLL);
  if (result != (std::string *)-1LL) {
    return std::string::erase(this, (std::string::size_type)result, 0xFFFFFFFFFFFFFFFFLL);
  }
  return result;
}

uint64_t sub_100012018@<X0>(const void **a1@<X0>, const void **a2@<X1>, uint64_t a3@<X8>)
{
  else {
    size_t v5 = (size_t)a1[1];
  }
  else {
    size_t v6 = (size_t)a2[1];
  }
  uint64_t result = sub_1000121B8(a3, v6 + v5);
  else {
    std::string::size_type v8 = *(char **)result;
  }
  if (v5)
  {
    else {
      stat v9 = *a1;
    }
    uint64_t result = (uint64_t)memmove(v8, v9, v5);
  }

  BOOL v10 = &v8[v5];
  if (v6)
  {
    else {
      size_t v11 = *a2;
    }
    uint64_t result = (uint64_t)memmove(v10, v11, v6);
  }

  v10[v6] = 0;
  return result;
}

uint64_t sub_1000120E0(uint64_t *a1, char *a2, unint64_t a3)
{
  uint64_t v3 = (uint64_t)a1;
  if (*((char *)a1 + 23) < 0)
  {
    uint64_t v3 = *a1;
    unint64_t v4 = a1[1];
  }

  else
  {
    unint64_t v4 = *((unsigned __int8 *)a1 + 23);
  }

  int v5 = a2[23];
  if (v5 >= 0) {
    size_t v6 = a2;
  }
  else {
    size_t v6 = *(char **)a2;
  }
  if (v5 >= 0) {
    int64_t v7 = a2[23];
  }
  else {
    int64_t v7 = *((void *)a2 + 1);
  }
  if (v4 < a3) {
    return -1LL;
  }
  if (v7)
  {
    std::string::size_type v8 = (const void *)(v3 + a3);
    stat v9 = (char *)(v3 + v4);
    int64_t v10 = v4 - a3;
    if (v10 >= v7)
    {
      int v13 = *v6;
      do
      {
        uint64_t v14 = v10 - v7;
        if (v14 == -1) {
          break;
        }
        BOOL v15 = (char *)memchr(v8, v13, v14 + 1);
        if (!v15) {
          break;
        }
        size_t v11 = v15;
        if (!memcmp(v15, v6, v7)) {
          goto LABEL_15;
        }
        std::string::size_type v8 = v11 + 1;
        int64_t v10 = v9 - (v11 + 1);
      }

      while (v10 >= v7);
    }

    size_t v11 = v9;
LABEL_15:
    if (v11 == v9) {
      return -1LL;
    }
    else {
      return (uint64_t)&v11[-v3];
    }
  }

  return a3;
}

uint64_t sub_1000121B8(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x7FFFFFFFFFFFFFF8LL) {
    sub_10000FAE8();
  }
  if (a2 > 0x16)
  {
    uint64_t v4 = (a2 & 0xFFFFFFFFFFFFFFF8LL) + 8;
    if ((a2 | 7) != 0x17) {
      uint64_t v4 = a2 | 7;
    }
    uint64_t v5 = v4 + 1;
    size_t v6 = operator new(v4 + 1);
    *(void *)(a1 + _Block_object_dispose(va, 8) = a2;
    *(void *)(a1 + 16) = v5 | 0x8000000000000000LL;
    *(void *)a1 = v6;
  }

  else
  {
    *(void *)(a1 + _Block_object_dispose(va, 8) = 0LL;
    *(void *)(a1 + 16) = 0LL;
    *(void *)a1 = 0LL;
    *(_BYTE *)(a1 + 23) = a2;
  }

  return a1;
}

void sub_10001223C()
{
}

void sub_100012250(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_1000122A0(exception, a1);
}

void sub_10001228C(_Unwind_Exception *a1)
{
}

std::logic_error *sub_1000122A0(std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  return result;
}

void sub_1000122C4()
{
  __assert_rtn("EventHandler", "RDBroker.mm", 265, "type == XPC_TYPE_DICTIONARY");
}

void sub_1000122EC(_xpc_connection_s *a1)
{
  CFStringRef v2 = (os_log_s *)RXOSLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3[0] = 67109120;
    v3[1] = xpc_connection_get_pid(a1);
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "peer(%d) killed me (the bastard!)",  (uint8_t *)v3,  8u);
  }

  abort();
}

void sub_10001236C()
{
  __assert_rtn("brokerd_peer_event_handler", "RDBroker.mm", 761, "type == XPC_TYPE_DICTIONARY");
}

void operator delete[](void *__p)
{
  while (1)
    ;
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new[](size_t __sz)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

id objc_msgSend__sendDownloadCallbackDictionaryWithLanguage_downloadPhase_timeRemaining_bytesWritten_bytesTotal_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "_sendDownloadCallbackDictionaryWithLanguage:downloadPhase:timeRemaining:bytesWritten:bytesTotal:error:");
}

id objc_msgSend_totalWritten(void *a1, const char *a2, ...)
{
  return [a1 totalWritten];
}