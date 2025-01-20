id UARPStringDynamicAssetsFilepath()
{
  if (qword_10003DDD0 != -1) {
    dispatch_once(&qword_10003DDD0, &stru_10002CEE0);
  }
  return (id)qword_10003DDC8;
}

void sub_100001A30(id a1)
{
  uint64_t v1 = InternalStorageDirectoryPath(a1);
  id v4 = (id)objc_claimAutoreleasedReturnValue(v1);
  uint64_t v2 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/%@",  v4,  @"dynamicassets"));
  v3 = (void *)qword_10003DDC8;
  qword_10003DDC8 = v2;
}

id UARPStringSupplementalAssetsFilepath()
{
  if (qword_10003DDE0 != -1) {
    dispatch_once(&qword_10003DDE0, &stru_10002CF00);
  }
  return (id)qword_10003DDD8;
}

void sub_100001AD8(id a1)
{
  uint64_t v1 = InternalStorageDirectoryPath(a1);
  id v4 = (id)objc_claimAutoreleasedReturnValue(v1);
  uint64_t v2 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/%@",  v4,  @"supplementalassets"));
  v3 = (void *)qword_10003DDD8;
  qword_10003DDD8 = v2;
}

id UARPStringTempFilesFilepath()
{
  if (qword_10003DDF0 != -1) {
    dispatch_once(&qword_10003DDF0, &stru_10002CF20);
  }
  return (id)qword_10003DDE8;
}

void sub_100001B80(id a1)
{
  uint64_t v1 = InternalStorageDirectoryPath(a1);
  id v4 = (id)objc_claimAutoreleasedReturnValue(v1);
  uint64_t v2 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/%@",  v4,  @"tmpfiles"));
  v3 = (void *)qword_10003DDE8;
  qword_10003DDE8 = v2;
}

id UARPStringPcapFilesFilepath()
{
  if (qword_10003DE00 != -1) {
    dispatch_once(&qword_10003DE00, &stru_10002CF40);
  }
  return (id)qword_10003DDF8;
}

void sub_100001C28(id a1)
{
  uint64_t v1 = InternalStorageDirectoryPath(a1);
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](&OBJC_CLASS___NSArray, "arrayWithObjects:", v2, @"pcapfiles", 0LL));

  uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](&OBJC_CLASS___NSString, "pathWithComponents:", v5));
  id v4 = (void *)qword_10003DDF8;
  qword_10003DDF8 = v3;
}

id UARPPayloadHashAlgorithmStringToValue(void *a1)
{
  id v1 = a1;
  if ([v1 caseInsensitiveCompare:@"SHA-256"])
  {
    if ([v1 caseInsensitiveCompare:@"SHA-384"])
    {
      if ([v1 caseInsensitiveCompare:@"SHA-512"]) {
        uint64_t v2 = 0LL;
      }
      else {
        uint64_t v2 = 3LL;
      }
    }

    else
    {
      uint64_t v2 = 2LL;
    }
  }

  else
  {
    uint64_t v2 = 1LL;
  }

  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](&OBJC_CLASS___NSNumber, "numberWithUnsignedShort:", v2));

  return v3;
}

id UARPStringTmapDirectoryPath()
{
  if (qword_10003DE10 != -1) {
    dispatch_once(&qword_10003DE10, &stru_10002D0C0);
  }
  return (id)qword_10003DE08;
}

void sub_100001D8C(id a1)
{
  uint64_t v1 = InternalStorageDirectoryPath(a1);
  id v4 = (id)objc_claimAutoreleasedReturnValue(v1);
  uint64_t v2 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@/%@", v4, @"tmap"));
  uint64_t v3 = (void *)qword_10003DE08;
  qword_10003DE08 = v2;
}

id UARPStringTmapDatabaseFilePath()
{
  if (qword_10003DE20 != -1) {
    dispatch_once(&qword_10003DE20, &stru_10002D0E0);
  }
  return (id)qword_10003DE18;
}

void sub_100001E34(id a1)
{
  id v1 = UARPStringTmapDirectoryPath();
  id v4 = (id)objc_claimAutoreleasedReturnValue(v1);
  uint64_t v2 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/%@",  v4,  @"tmapdatabase"));
  uint64_t v3 = (void *)qword_10003DE18;
  qword_10003DE18 = v2;
}

id UARPStringTapToRadarFilePath()
{
  if (qword_10003DE30 != -1) {
    dispatch_once(&qword_10003DE30, &stru_10002D108);
  }
  return (id)qword_10003DE28;
}

void sub_100001EDC(id a1)
{
  uint64_t v1 = InternalStorageDirectoryPath(a1);
  id v4 = (id)objc_claimAutoreleasedReturnValue(v1);
  uint64_t v2 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/%@",  v4,  @"taptoradar"));
  uint64_t v3 = (void *)qword_10003DE28;
  qword_10003DE28 = v2;
}

id UARPStringLogsDirectoryFilePath()
{
  if (qword_10003DE40 != -1) {
    dispatch_once(&qword_10003DE40, &stru_10002D130);
  }
  return (id)qword_10003DE38;
}

void sub_100001F84(id a1)
{
  id v1 = UARPStringTapToRadarFilePath();
  id v4 = (id)objc_claimAutoreleasedReturnValue(v1);
  uint64_t v2 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@/%@", v4, @"logs"));
  uint64_t v3 = (void *)qword_10003DE38;
  qword_10003DE38 = v2;
}

id UARPStringCrashAnalyticsDirectoryFilePath()
{
  if (qword_10003DE50 != -1) {
    dispatch_once(&qword_10003DE50, &stru_10002D158);
  }
  return (id)qword_10003DE48;
}

void sub_10000202C(id a1)
{
  id v1 = UARPStringTapToRadarFilePath();
  id v4 = (id)objc_claimAutoreleasedReturnValue(v1);
  uint64_t v2 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@/%@", v4, @"crsh"));
  uint64_t v3 = (void *)qword_10003DE48;
  qword_10003DE48 = v2;
}

id UARPStringCmapDirectoryPath()
{
  if (qword_10003DE60 != -1) {
    dispatch_once(&qword_10003DE60, &stru_10002D238);
  }
  return (id)qword_10003DE58;
}

void sub_1000020D4(id a1)
{
  uint64_t v1 = InternalStorageDirectoryPath(a1);
  id v4 = (id)objc_claimAutoreleasedReturnValue(v1);
  uint64_t v2 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@/%@", v4, @"cmap"));
  uint64_t v3 = (void *)qword_10003DE58;
  qword_10003DE58 = v2;
}

id UARPStringCmapDatabaseFilePath()
{
  if (qword_10003DE70 != -1) {
    dispatch_once(&qword_10003DE70, &stru_10002D258);
  }
  return (id)qword_10003DE68;
}

void sub_10000217C(id a1)
{
  id v1 = UARPStringCmapDirectoryPath();
  id v4 = (id)objc_claimAutoreleasedReturnValue(v1);
  uint64_t v2 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/%@",  v4,  @"cmapdatabase"));
  uint64_t v3 = (void *)qword_10003DE68;
  qword_10003DE68 = v2;
}

id UARPStringSysdiagnoseDirectoryFilePath()
{
  if (qword_10003DE80 != -1) {
    dispatch_once(&qword_10003DE80, &stru_10002D288);
  }
  return (id)qword_10003DE78;
}

void sub_100002224(id a1)
{
  uint64_t v1 = InternalStorageDirectoryPath(a1);
  id v4 = (id)objc_claimAutoreleasedReturnValue(v1);
  uint64_t v2 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/%@",  v4,  @"sysdiagnose"));
  uint64_t v3 = (void *)qword_10003DE78;
  qword_10003DE78 = v2;
}

id UARPStringPifMetricsFilePath()
{
  if (qword_10003DE90 != -1) {
    dispatch_once(&qword_10003DE90, &stru_10002D2B0);
  }
  return (id)qword_10003DE88;
}

void sub_1000022CC(id a1)
{
  id v1 = UARPStringSysdiagnoseDirectoryFilePath();
  id v4 = (id)objc_claimAutoreleasedReturnValue(v1);
  uint64_t v2 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/%@",  v4,  @"com.apple.Bluetooth.AccessoryCase.pif_daily"));
  uint64_t v3 = (void *)qword_10003DE88;
  qword_10003DE88 = v2;
}

NSData *generateSHA256HashForDataAtLocationAsData(void *a1, uint64_t a2)
{
  return generateHashForDataAtLocationAsData(a1, 10LL, a2);
}

NSData *generateHashForDataAtLocationAsData(void *a1, uint64_t a2, uint64_t a3)
{
  id v5 = a1;
  uint64_t v6 = objc_claimAutoreleasedReturnValue( +[NSFileHandle fileHandleForReadingFromURL:error:]( &OBJC_CLASS___NSFileHandle,  "fileHandleForReadingFromURL:error:",  v5,  a3));
  v7 = (void *)v6;
  v8 = 0LL;
  if ((_DWORD)a2 && v6)
  {
    CCDigestInit(a2, v15);
    do
    {
      v9 = objc_autoreleasePoolPush();
      id v10 = objc_claimAutoreleasedReturnValue([v7 uarpReadDataUpToLength:0x4000 error:a3]);
      CCDigestUpdate(v15, [v10 bytes], objc_msgSend(v10, "length"));
      unint64_t v11 = (unint64_t)[v10 length];

      objc_autoreleasePoolPop(v9);
    }

    while (v11 >> 14);
    uint64_t OutputSize = CCDigestGetOutputSize(a2);
    v13 = &v15[-((__chkstk_darwin() + 15) & 0xFFFFFFFFFFFFFFF0LL)];
    CCDigestFinal(v15, v13);
    else {
      v8 = 0LL;
    }
  }

  return v8;
}

NSMutableString *generateSHA256HashForDataAtLocation(void *a1, uint64_t a2)
{
  return generateHashForDataAtLocation(a1, 10LL, a2);
}

NSMutableString *generateHashForDataAtLocation(void *a1, uint64_t a2, uint64_t a3)
{
  HashForDataAtLocationAsData = generateHashForDataAtLocationAsData(a1, a2, a3);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(HashForDataAtLocationAsData);
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
    v7 = (unsigned __int8 *)[v6 bytes];
    v8 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
    if ([v6 length])
    {
      unint64_t v9 = 0LL;
      do
        -[NSMutableString appendFormat:](v8, "appendFormat:", @"%02x", v7[v9++]);
      while (v9 < (unint64_t)[v6 length]);
    }
  }

  else
  {
    v8 = 0LL;
  }

  return v8;
}

id generateBase64HashForDataAtLocation(void *a1, uint64_t a2, uint64_t a3)
{
  HashForDataAtLocationAsData = generateHashForDataAtLocationAsData(a1, a2, a3);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(HashForDataAtLocationAsData);
  id v5 = v4;
  if (v4) {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 base64EncodedStringWithOptions:0]);
  }
  else {
    id v6 = 0LL;
  }

  return v6;
}

void CFDictionaryBuildKeySetInt64(__CFDictionary *a1, const void *a2, uint64_t a3)
{
  uint64_t valuePtr = a3;
  CFNumberRef v5 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt64Type, &valuePtr);
  CFDictionarySetValue(a1, a2, v5);
  CFRelease(v5);
}

void CFDictionaryBuildKeySetInt32(__CFDictionary *a1, const void *a2, int a3)
{
  int valuePtr = a3;
  CFNumberRef v5 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &valuePtr);
  CFDictionarySetValue(a1, a2, v5);
  CFRelease(v5);
}

void CFDictionaryBuildKeySetTag( __CFDictionary *a1, const void *a2, const __CFString *a3, const __CFString *a4)
{
  Mutable = CFStringCreateMutable(kCFAllocatorDefault, 0LL);
  CFStringAppend(Mutable, a3);
  CFStringAppend(Mutable, @",");
  CFStringAppend(Mutable, a4);
  CFDictionarySetValue(a1, a2, Mutable);
  CFRelease(Mutable);
}

void CFDictionaryBuildKeySetTicket( __CFDictionary *a1, const void *a2, const __CFString *a3, const __CFString *a4)
{
  Mutable = CFStringCreateMutable(kCFAllocatorDefault, 0LL);
  CFStringAppend(Mutable, @"@");
  CFStringAppend(Mutable, a3);
  CFStringAppend(Mutable, @",");
  CFStringAppend(Mutable, a4);
  CFDictionarySetValue(a1, a2, Mutable);
  CFRelease(Mutable);
}
}

void sub_100002B9C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_100002BB8(uint64_t a1, uint64_t a2)
{
}

void sub_100002BC8(uint64_t a1)
{
}

void sub_100002BD4(uint64_t a1)
{
  if (([*(id *)(a1 + 32) personalizeWithServer:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)] & 1) == 0 && objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "useSSOCredentials"))
  {
    unsigned int v2 = [*(id *)(*(void *)(a1 + 32) + 88) showPersonalizationRequiredDialogAndGetResponse];
    FudLog(6LL, @"%s(): Accessory not authlisted, retrying with credentials: %d");
    if (v2)
    {
      objc_msgSend( *(id *)(a1 + 32),  "freePersonalizationData",  "-[FudPersonalizer doPersonalization:]_block_invoke",  v2);
      [*(id *)(a1 + 32) personalizeWithServer:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
    }

    else
    {
      objc_msgSend( *(id *)(*(void *)(a1 + 32) + 88),  "personalizationDone:response:error:",  *(void *)(a1 + 40),  0,  FUDError(3, @"Failed to retrieve signed manifest"),  "-[FudPersonalizer doPersonalization:]_block_invoke",  0);
    }
  }

  *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL) = 0LL;
}

void sub_10000395C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (os_log_s *)FudLogger();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    uint64_t v5 = a2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v4, 0xCu);
  }

void sub_100003A44(id a1)
{
  id v1 = objc_alloc_init(&OBJC_CLASS___AUDeveloperSettingsDatabase);
  unsigned int v2 = (void *)qword_10003DE98;
  qword_10003DE98 = (uint64_t)v1;
}

void sub_100004410( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

int main(int argc, const char **argv, const char **envp)
{
  uint64_t v3 = os_log_create("com.apple.accessoryupdater.uarp", "legacyAudioUpdater");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Legacy Audio updater started", v8, 2u);
  }

  int v4 = AUSandboxPlatformInit(v3, 0LL);
  if (!v4)
  {
    uint64_t v5 = objc_opt_new(&OBJC_CLASS___ServiceDelegate);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCListener serviceListener](&OBJC_CLASS___NSXPCListener, "serviceListener"));
    [v6 setDelegate:v5];
    [v6 resume];
  }

  return v4;
}

id sub_100004970(uint64_t a1)
{
  unsigned int v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) deviceClassesForEAIdentifier:*(void *)(a1 + 40)]);
  id v3 = [v2 mutableCopy];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 24);
  *(void *)(v4 + 24) = v3;

  uint64_t v6 = objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 24) firstObject]);
  uint64_t v7 = *(void *)(a1 + 32);
  v8 = *(void **)(v7 + 32);
  *(void *)(v7 + 32) = v6;

  id v9 = [*(id *)(a1 + 48) copy];
  uint64_t v10 = *(void *)(a1 + 32);
  unint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  id result = [*(id *)(a1 + 32) startFirmwareUpdateStates];
  return result;
}

id sub_100005170(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 40)) {
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 48), "updateCompleteForAccessory:");
  }
  return [*(id *)(*(void *)(a1 + 32) + 16) findFirmwareWithOptions:0 remote:1];
}

void sub_100005328(uint64_t a1)
{
  if (([*(id *)(*(void *)(a1 + 32) + 32) containsString:@"multiasset"] & 1) != 0
    || ([*(id *)(*(void *)(a1 + 32) + 32) containsString:@"ANC"] & 1) != 0)
  {
    uint64_t v2 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:@"existingFWVersionOnAccessory"]);
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(v3 + 96);
    *(void *)(v3 + 96) = v2;
  }

  else
  {
    uint64_t v5 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:@"existingFWVersionOnAccessory"]);
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(v6 + 88);
    *(void *)(v6 + 8_Block_object_dispose(va, 8) = v5;
  }

LABEL_7:
  if (*(_BYTE *)(a1 + 48))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    if (*(_BYTE *)(a1 + 49))
    {
      id v12 = (id)objc_claimAutoreleasedReturnValue([*(id *)(v7 + 72) objectForKeyedSubscript:*(void *)(v7 + 32)]);
      if (v12)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:@"newFWVersion"]);
        [v12 setPostedFirmwareVersion:v8];

        [*(id *)(*(void *)(a1 + 32) + 72) setObject:v12 forKeyedSubscript:*(void *)(*(void *)(a1 + 32) + 32)];
      }

      id v9 = *(void **)(*(void *)(a1 + 32) + 16LL);
      if (*(_BYTE *)(a1 + 50)) {
        [v9 downloadFirmwareWithOptions:0];
      }
      else {
        [v9 prepareFirmwareWithOptions:0];
      }
    }

    else
    {
      uint64_t v10 = *(os_log_s **)(v7 + 8);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 32LL);
        *(_DWORD *)buf = 136315394;
        v14 = "-[LegacyAudioAccessory didFind:info:updateAvailable:needsDownload:error:]_block_invoke";
        __int16 v15 = 2112;
        uint64_t v16 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%s: No new firmware updates available for %@",  buf,  0x16u);
      }

      [*(id *)(a1 + 32) updateCompleteForActiveDeviceClass];
    }
  }

  else
  {
    [*(id *)(a1 + 32) updateCompleteForActiveDeviceClass];
  }

void sub_100005690(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(a1 + 32) + 72) objectForKeyedSubscript:*(void *)(*(void *)(a1 + 32) + 32)]);
  id v3 = v2;
  if (*(_BYTE *)(a1 + 40))
  {
    if (v2)
    {
      [v2 setDownloadStatus:1];
      [*(id *)(*(void *)(a1 + 32) + 72) setObject:v3 forKeyedSubscript:*(void *)(*(void *)(a1 + 32) + 32)];
    }

    [*(id *)(*(void *)(a1 + 32) + 16) prepareFirmwareWithOptions:0];
  }

  else
  {
    if (v2)
    {
      [v2 setDownloadStatus:2];
      [*(id *)(*(void *)(a1 + 32) + 72) setObject:v3 forKeyedSubscript:*(void *)(*(void *)(a1 + 32) + 32)];
    }

    [*(id *)(a1 + 32) updateCompleteForActiveDeviceClass];
  }
}

id sub_100005878(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v2 = *(id **)(a1 + 32);
  if (v1) {
    return [v2[2] applyFirmwareWithOptions:0];
  }
  else {
    return [v2 updateCompleteForActiveDeviceClass];
  }
}

void sub_1000059E4(uint64_t a1)
{
  id v4 = (id)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(a1 + 32) + 72) objectForKeyedSubscript:*(void *)(*(void *)(a1 + 32) + 32)]);
  if (v4)
  {
    [v4 setActiveFirmwareVersion:*(void *)(*(void *)(a1 + 32) + 88)];
    [v4 setStagingIterations:&off_100034C68];
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKeyedSubscript:@"currentSessionTimeTaken"]);
    [v4 setStagingDuration:v2];

    if (*(_BYTE *)(a1 + 48)) {
      uint64_t v3 = 6LL;
    }
    else {
      uint64_t v3 = 8LL;
    }
    [v4 setStagingStatus:v3];
    [*(id *)(*(void *)(a1 + 32) + 72) setObject:v4 forKeyedSubscript:*(void *)(*(void *)(a1 + 32) + 32)];
  }

  [*(id *)(*(void *)(a1 + 32) + 16) finishWithOptions:0];
}

id sub_100005CB0(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateCompleteForActiveDeviceClass];
}

id sub_100005D34(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 56LL);
  if (!v2)
  {
    uint64_t v3 = -[FudPersonalizer initWithDelegate:]( objc_alloc(&OBJC_CLASS___FudPersonalizer),  "initWithDelegate:",  *(void *)(a1 + 32));
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 56);
    *(void *)(v4 + 56) = v3;

    uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 56LL);
  }

  return [v2 doPersonalization:*(void *)(a1 + 40)];
}

LABEL_23:
                ;
              }

              uint64_t v10 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v26,  v31,  16LL);
            }

            while (v10);
          }
        }
      }
    }
  }

  NSLog( @"%s() No EAAccessory found for protocol=%@",  a2,  "+[EAFirmwareUpdater findAccessoryWithProtocolString:serialNum:]",  a3);
  return 0LL;
}

  -[EAFirmwareUpdater log:format:](self, "log:format:", 5LL, @"Event dict = %@", v23);
  return v23;
}

void sub_100006D94(id a1)
{
}

void sub_100007180(_Unwind_Exception *a1)
{
}

void sub_100007280(_Unwind_Exception *a1)
{
}

void sub_1000073FC(_Unwind_Exception *a1)
{
}

id sub_100007CA0(uint64_t a1, void *a2)
{
  id result = [a2 attributes];
  if (result)
  {
    uint64_t v4 = result;
    id result = [result objectForKey:@"FirmwareVersionMajor"];
    if (result)
    {
      id v5 = [result unsignedLongLongValue];
      id result = [v4 objectForKey:@"FirmwareVersionMinor"];
      if (result)
      {
        id v6 = [result unsignedLongLongValue];
        id result = [v4 objectForKey:@"FirmwareVersionRelease"];
        if (result)
        {
          id v7 = [result unsignedLongLongValue];
          id result = [v4 objectForKey:@"FormatVersion"];
          if (result)
          {
            id v8 = [result unsignedLongLongValue];
            [*(id *)(a1 + 32) log:5, @"%s %@", "-[EAFirmwareUpdater queryPredicate]_block_invoke", -[NSString initWithFormat:]( [NSString alloc], "initWithFormat:", @"Applying predicate: ((majorVersion > %llu) ||                                ((majorVersion == %llu) && ((minorVersion > %llu) || ((minorVersion == %llu) && (releaseVersion > %llu))))) &&                                (formatVersion == %d)"), *(void *)(*(void *)(a1 + 32) + 152), *(void *)(*(void *)(a1 + 32) + 152), *(void *)(*(void *)(a1 + 32) + 160), *(void *)(*(void *)(a1 + 32) + 160), *(void *)(*(void *)(a1 + 32) + 168), 1 format]);
            id result = 0;
            if ((unint64_t)v8 <= *(void *)(a1 + 40))
            {
              id v9 = *(void **)(a1 + 32);
              id v10 = (id)v9[19];
              if (v5 > v10) {
                return (id)1;
              }
              if (v5 == v10)
              {
                id v11 = (id)v9[20];
              }
            }
          }
        }
      }
    }
  }

  return result;
}

NSError *sub_1000081A8( uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10 =  -[NSString initWithFormat:arguments:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:arguments:",  a3,  &a9);
  id v11 = +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  1LL);
  if (v10)
  {
    NSLog(@"%@", v10);
    -[NSMutableDictionary setObject:forKey:](v11, "setObject:forKey:", v10, NSLocalizedDescriptionKey);
  }

  return +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.MobileAccessoryUpdater.EAFirmwareUpdater",  a2,  v11);
}

LABEL_16:
        v28 = 0LL;
        goto LABEL_18;
      }

      ++v20;
      v21 += 20;
      if (v20 >= v19[8]) {
        goto LABEL_16;
      }
    }

    v42 = @"Couldn't parse SuperBinary header tag";
LABEL_47:
    v28 = sub_1000081A8(0LL, 4, (uint64_t)v42, v23, v24, v25, v26, v27, (uint64_t)v48);
  }

  else
  {
    v28 = 0LL;
  }

  -[EAFirmwareUpdater doneWithAsset](self, "doneWithAsset");
  -[NSNotificationCenter removeObserver:]( +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"),  "removeObserver:",  self);
  objc_sync_exit(self);
}

LABEL_18:
  free(v19);
LABEL_19:

  return v28;
}

id sub_100009358(uint64_t a1)
{
  return [*(id *)(a1 + 32) closeSession];
}

LABEL_9:
  uint64_t v16 = 0;
  __int16 v15 = 0LL;
LABEL_10:
  free(v11);
LABEL_11:

  return v16;
}

LABEL_13:
  id v12 = -[FirmwareBundle initWithData:hashData:signatureData:certData:]( objc_alloc(&OBJC_CLASS___FirmwareBundle),  "initWithData:hashData:signatureData:certData:",  a3,  0LL,  0LL,  0LL);
  id v9 = 0LL;
LABEL_14:
  -[iAUPServer setFirmwareBundle:](self->_iAUPServer, "setFirmwareBundle:", v12);

  if ((_DWORD)v7) {
    -[FirmwareBundle setProductIDCode:]( -[iAUPServer firmwareBundle](self->_iAUPServer, "firmwareBundle"),  "setProductIDCode:",  v7);
  }
  if (!-[iAUPServer personalizationComplete](self->_iAUPServer, "personalizationComplete"))
  {
    v13 = @"Error during personalization response";
LABEL_18:
    -[EAFirmwareUpdater handleSessionError:message:](self, "handleSessionError:message:", 15LL, v13);
  }

    v13 = sub_1000081A8(0LL, v16, (uint64_t)v15, v4, v5, v6, v7, v8, v17);
    goto LABEL_11;
  }

LABEL_19:
}

  v17 = v15;
  self->_accessoryFusingType = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  AUDeveloperSettingsAccessoryFusingTypeToString(v11));
  v18 = +[AUDeveloperSettingsDatabase sharedDatabase](&OBJC_CLASS___AUDeveloperSettingsDatabase, "sharedDatabase");
  v19 = objc_msgSend(objc_msgSend(objc_msgSend(v18, "accessoriesDictionary"), "objectForKey:", v7), "mutableCopy");
  if (v19)
  {
    v20 = v19;
    if (objc_msgSend(objc_msgSend(v19, "objectForKeyedSubscript:", @"isOTADisabled"), "BOOLValue"))
    {
      -[FudPluginDelegate log:format:]( self->delegate,  "log:format:",  5LL,  @"Entry found in AUDeveloperSettingsDatabase Accessory:%@ with OTA Update disabled, not attempting update",  v32);
      return 0;
    }

    v25 = -[EAAccessoryUpdater getAssetLocation:](self, "getAssetLocation:", v20);
    -[FudPluginDelegate log:format:]( self->delegate,  "log:format:",  5LL,  @"Entry found in AUDeveloperSettingsDatabase Accessory:%@ assetLocation:%@",  v32,  v25);
    if (!-[NSString isEqualToString:]( v32,  "isEqualToString:",  [v20 objectForKeyedSubscript:@"name"]))
    {
      -[FudPluginDelegate log:format:]( self->delegate,  "log:format:",  6LL,  @"Updating name of accessory in AUDeveloperSettingsDatabase to %@",  v32);
      objc_msgSend(v20, "setObject:forKeyedSubscript:", -[NSString copy](v32, "copy"), @"name");
    }

    if (!v25)
    {
      v27 = MGGetBoolAnswer(@"InternalBuild", v26);
      v28 = (v16 & v27) == 0;
      if ((v16 & v27) != 0) {
        v29 = 0LL;
      }
      else {
        v29 = 2LL;
      }
      if (v28) {
        v30 = @"No asset location found for %@, defaulting to Customer (Mesu) for customer build or prod fused accessory";
      }
      else {
        v30 = @"No asset location found for %@, defaulting to Livability for internal builds and non-prod accessory";
      }
      objc_msgSend( v20,  "setObject:forKeyedSubscript:",  +[NSString stringWithUTF8String:]( NSString,  "stringWithUTF8String:",  AUDeveloperSettingsURLTypeToString(v29)),  @"assetLocation");
      -[FudPluginDelegate log:format:](self->delegate, "log:format:", 6LL, v30, v32);
    }

    [v20 setObject:&__kCFBooleanTrue forKeyedSubscript:@"SupportsDeveloperSettings"];
    -[EAAccessoryUpdater updateAccessoryInfoInDatabaseIfNeeded:](self, "updateAccessoryInfoInDatabaseIfNeeded:", v20);
  }

  else
  {
    v22 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
    objc_msgSend(v22, "setObject:forKeyedSubscript:", -[NSString copy](v32, "copy"), @"name");
    [v22 setObject:self->_accessoryFusingType forKeyedSubscript:@"fusing"];
    objc_msgSend( v22,  "setObject:forKeyedSubscript:",  -[NSString copy]( -[EAAccessory firmwareRevision]( -[EAFirmwareUpdater accessory](self->firmwareUpdater, "accessory"),  "firmwareRevision"),  "copy"),  @"activeVersion");
    objc_msgSend( v22,  "setObject:forKeyedSubscript:",  -[NSString copy]( -[EAAccessory modelNumber](-[EAFirmwareUpdater accessory](self->firmwareUpdater, "accessory"), "modelNumber"),  "copy"),  @"modelNumber");
    objc_msgSend( v22,  "setObject:forKeyedSubscript:",  +[NSString stringWithUTF8String:]( NSString,  "stringWithUTF8String:",  AUDeveloperSettingsURLTypeToString(2uLL)),  @"assetLocation");
    [v22 setObject:&__kCFBooleanTrue forKeyedSubscript:@"SupportsDeveloperSettings"];
    v24 = MGGetBoolAnswer(@"InternalBuild", v23);
    if ((v14 | v17) == 1 && v24) {
      objc_msgSend( v22,  "setObject:forKeyedSubscript:",  +[NSString stringWithUTF8String:]( NSString,  "stringWithUTF8String:",  AUDeveloperSettingsURLTypeToString(0)),  @"assetLocation");
    }
    v25 = -[EAAccessoryUpdater getAssetLocation:](self, "getAssetLocation:", v22);
    objc_msgSend( v18,  "addAccessoryWithSerialNumber:info:",  v7,  +[NSDictionary dictionaryWithDictionary:](NSDictionary, "dictionaryWithDictionary:", v22));
    -[FudPluginDelegate log:format:]( self->delegate,  "log:format:",  5LL,  @"Added Entry for %@ in AUDeveloperSettingsDatabase %@",  v32,  v18);
  }

  -[EAFirmwareUpdater setAssetLocationOverride:]( self->firmwareUpdater,  "setAssetLocationOverride:",  +[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v25));
  return 1;
}

id sub_100009770(uint64_t a1)
{
  [*(id *)(a1 + 32) log:5, @"%s %@", "-[EAFirmwareUpdater personalizationResponse:error:]_block_invoke", -[NSString initWithFormat:]( [NSString alloc], "initWithFormat:", @"(%@): personalizationResponse Error from FUD = %@, responseData = %@", objc_msgSend(*(id *)(a1 + 32), "protocolString"), *(void *)(a1 + 40), *(void *)(a1 + 48)) format];
  [*(id *)(a1 + 32) closeSession];
  uint64_t v3 = @"Event";
  uint64_t v4 = @"com.apple.fud.updateFailed";
  return objc_msgSend( *(id *)(a1 + 32),  "updateComplete:error:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v4,  &v3,  1),  *(void *)(a1 + 40));
}

id sub_10000994C(uint64_t a1)
{
  return [*(id *)(a1 + 32) closeSession];
}

_BYTE *sub_100009D5C(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) openSession];
  if (v2)
  {
    uint64_t v4 = v2;
    goto LABEL_8;
  }

  id result = *(_BYTE **)(a1 + 32);
  if (!result[466])
  {
    id result = objc_msgSend( objc_msgSend(result, "protocolString"),  "isEqualToString:",  objc_msgSend(*(id *)(a1 + 32), "appProtocol"));
    if ((_DWORD)result)
    {
      if ([*(id *)(a1 + 32) skipDFUMode]) {
        return [*(id *)(a1 + 32) log:5, @"%s %@", "-[EAFirmwareUpdater applyFirmware:progress:update:personalization:]_block_invoke", -[NSString initWithFormat:]( [NSString alloc], "initWithFormat:", @"Skipping DFU mode as requested for %@", objc_msgSend(*(id *)(a1 + 32), "protocolString")) format];
      }
      [*(id *)(a1 + 32) startReconnectTimer:1];
      BYTE4(v5) = -65;
      LODWORD(v5) = 1073807486;
      [*(id *)(a1 + 32) log:5, @"%s %@", "-[EAFirmwareUpdater applyFirmware:progress:update:personalization:]_block_invoke", -[NSString initWithFormat:]( [NSString alloc], "initWithFormat:", @"Sending COMMAND_SetBootloaderEntry to %@", objc_msgSend(*(id *)(a1 + 32), "protocolString")), v5 format];
      id result = objc_msgSend( *(id *)(a1 + 32),  "writeData:",  +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v5, 5));
      if (result)
      {
        uint64_t v4 = result;
        [*(id *)(a1 + 32) log:5, @"%s %@", "-[EAFirmwareUpdater applyFirmware:progress:update:personalization:]_block_invoke", -[NSString initWithFormat:]( [NSString alloc], "initWithFormat:", @"Error writing data to %@ NSError=%@", objc_msgSend(*(id *)(a1 + 32), "protocolString"), result) format];
        [*(id *)(a1 + 32) stopReconnectTimer];
LABEL_8:
        id v6 = @"Event";
        id v7 = @"com.apple.fud.updateFailed";
        return objc_msgSend( *(id *)(a1 + 32),  "updateComplete:error:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v7,  &v6,  1),  v4);
      }
    }
  }

  return result;
}

id sub_10000AB68(uint64_t a1)
{
  return [*(id *)(a1 + 32) closeSession];
}

LABEL_10:
  id v12 = -[EAFirmwareUpdater applyCompletion](self, "applyCompletion");
  v12[2](v12, v8, v11);
  _Block_release(self->_applyCompletion);
  self->_applyCompletion = 0LL;
  progressHandler = self->_progressHandler;
  if (progressHandler)
  {
    _Block_release(progressHandler);
    self->_progressHandler = 0LL;
  }

  updateHandler = self->_updateHandler;
  if (updateHandler)
  {
    _Block_release(updateHandler);
    self->_updateHandler = 0LL;
  }

  personalizationRequestHandler = self->_personalizationRequestHandler;
  if (personalizationRequestHandler)
  {
    _Block_release(personalizationRequestHandler);
    self->_personalizationRequestHandler = 0LL;
  }

  v13 = 0LL;
LABEL_11:
  pthread_mutex_unlock(p_flushOutputLock);
  return v13;
}

void sub_10000AE10(_Unwind_Exception *a1)
{
}

id sub_10000AE28(uint64_t a1)
{
  return [*(id *)(a1 + 32) closeSession];
}

id sub_10000AF88(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleInputData];
}

id sub_10000AF90(uint64_t a1)
{
  return [*(id *)(a1 + 32) flushOutput];
}

LABEL_22:
            id v12 = @"System error";
            goto LABEL_18;
          }
        }

        else
        {
          if (!objc_msgSend( v6,  "isEqualToString:",  -[EAFirmwareUpdater appProtocol](self, "appProtocol")))
          {
            -[EAFirmwareUpdater log:format:]( self,  "log:format:",  5LL,  @"%s() Ignoring unrelated connect notification",  "-[EAFirmwareUpdater _accessoryDidConnect:]");
            goto LABEL_20;
          }

          if (isExpectingReconnect == 2)
          {
            eaNotificationDispatchQueue = (dispatch_queue_s *)self->_eaNotificationDispatchQueue;
            if (eaNotificationDispatchQueue)
            {
              block[0] = _NSConcreteStackBlock;
              block[1] = 3221225472LL;
              block[2] = sub_10000B61C;
              block[3] = &unk_10002D680;
              block[4] = self;
              block[5] = v22;
              id v11 = block;
              goto LABEL_16;
            }

            goto LABEL_22;
          }
        }

        id v12 = @"Accessory reconnected in wrong mode";
LABEL_18:
        -[EAFirmwareUpdater log:format:]( self,  "log:format:",  5LL,  @"%s() Error - connect notification: supportedProtocol=%@ deviceClass=%@ [%@] ",  "-[EAFirmwareUpdater _accessoryDidConnect:]",  v6,  self->_deviceClass,  v12);
        v23 = @"Event";
        v24 = @"com.apple.fud.updateFailed";
        v13 = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v24,  &v23,  1LL);
        -[EAFirmwareUpdater updateComplete:error:]( self,  "updateComplete:error:",  v13,  sub_1000081A8(0LL, 11, (uint64_t)v12, v14, v15, v16, v17, v18, v19));
      }
    }
  }

LABEL_20:
  _Block_object_dispose(v22, 8);
}

    id v10 = (char *)a3;
    id v11 = -[iAUPServer commandString:](self, "commandString:", a3, a4, *(void *)&a5);
    id v8 = @"Command: 0x%X %s";
LABEL_25:
    id v9 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v8, v10, v11);
LABEL_26:
    id v7 = (const __CFString *)v9;
    goto LABEL_27;
  }

  if ((int)a3 > 4)
  {
    id v6 = (a3 - 6);
    if (((1LL << (a3 - 6)) & 0x3C000000) == 0)
    {
      if (((1LL << (a3 - 6)) & 0x1400000000000003LL) == 0)
      {
        if (v6 == 59)
        {
          id v7 = @"Setting app re-entry";
          goto LABEL_27;
        }

  v21 = 0LL;
LABEL_25:
  v28[0] = @"BoardID";
  v29[0] = +[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v10);
  v28[1] = @"ChipID";
  v29[1] = +[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v11);
  v28[2] = @"ECID";
  v29[2] = +[NSNumber numberWithUnsignedLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLong:", v12);
  v28[3] = @"securityDomain";
  v29[3] = +[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v13);
  v28[4] = @"productionMode";
  v29[4] = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v14 != 0);
  v28[5] = @"securityMode";
  if ((v9 & 0x20) != 0) {
    v23 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v27);
  }
  else {
    v23 = +[NSNull null](&OBJC_CLASS___NSNull, "null");
  }
  v29[5] = v23;
  v29[6] = v18;
  v28[6] = @"nonceHash";
  v28[7] = @"chipEpoch";
  if ((v9 & 0x80) != 0) {
    v24 = +[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v20);
  }
  else {
    v24 = +[NSNull null](&OBJC_CLASS___NSNull, "null");
  }
  v29[7] = v24;
  v28[8] = @"enableMixMatch";
  v29[8] = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v21);
  v25 = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v29,  v28,  9LL);
  NSLog(@"manifest infoDict from accessory: %@", v25);
  return v25;
}

void sub_10000B5BC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, char a27)
{
}

void sub_10000B5D8(uint64_t a1, uint64_t a2)
{
}

void sub_10000B5E8(uint64_t a1)
{
}

id sub_10000B5F4(uint64_t a1)
{
  return [*(id *)(a1 + 32) openSession];
}

void *sub_10000B61C(void *result)
{
  if (*(_BYTE *)(result[4] + 448LL))
  {
    int v1 = result;
    uint64_t v2 = @"Event";
    uint64_t v3 = @"com.apple.fud.updateCompleted";
    *(void *)(*(void *)(result[5] + 8LL) + 40LL) = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v3,  &v2,  1LL);
    return [(id)v1[4] updateComplete:*(void *)(*(void *)(v1[5] + 8) + 40) error:0];
  }

  return result;
}

void sub_10000B8B0(_Unwind_Exception *a1)
{
}

id sub_10000B8C4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) connectionID];
  id v3 = objc_msgSend(objc_msgSend(*(id *)(a1 + 40), "accessory"), "connectionID");
  uint64_t v4 = *(void **)(a1 + 40);
  id v5 = [*(id *)(a1 + 32) connectionID];
  id v6 = [*(id *)(a1 + 40) accessory];
  if (v2 == v3)
  {
    uint64_t v20 = (uint64_t)v5;
    [v4 log:5 format:@"disconnection for acc connectionID %u matches current accessory %@"];
    [*(id *)(a1 + 40) setAccessory:0];
    id v7 = *(unsigned int **)(a1 + 40);
    uint64_t v8 = v7[113];
    if ((_DWORD)v8 == 3)
    {
      v7[113] = 0;
      [*(id *)(a1 + 40) log:5, @"Accessory did not reconnect after staging complete %@", objc_msgSend(*(id *)(a1 + 32), "protocolStrings") format];
      v21 = @"Event";
      v22 = @"com.apple.fud.updateCompleted";
      v18 = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v22,  &v21,  1LL);
      v17 = *(void **)(a1 + 40);
      uint64_t v16 = 0LL;
    }

    else
    {
      if ((_DWORD)v8)
      {
        [v7 log:5, @"Waiting for acc to reconnect in mode %d - %@", v8, objc_msgSend(*(id *)(a1 + 32), "protocolStrings") format];
        return [*(id *)(*(void *)(a1 + 40) + 432) accessoryDisconnected];
      }

      v23 = @"Event";
      v24 = @"com.apple.fud.updateInterrupted";
      id v9 = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v24,  &v23,  1LL);
      id v10 = *(void **)(a1 + 40);
      uint64_t v16 = sub_1000081A8(0LL, 20, (uint64_t)@"Device unexpectedly disconnected", v11, v12, v13, v14, v15, v20);
      v17 = v10;
      v18 = v9;
    }

    [v17 updateComplete:v18 error:v16];
  }

  else
  {
    [v4 log:5, @"disconnection for acc connectionID %u does not apply, currently updating %@", v5, v6 format];
  }

  return [*(id *)(*(void *)(a1 + 40) + 432) accessoryDisconnected];
}

void sub_10000C7FC(uint64_t a1)
{
  id v1 = [objc_allocWithZone(*(Class *)(a1 + 32)) init];
  id v2 = (void *)qword_10003DEA8;
  qword_10003DEA8 = (uint64_t)v1;
}

void sub_10000C84C(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100017A10((uint64_t)a2);
  }
}

void sub_10000CAC0(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  id v2 = (void *)qword_10003DEB8;
  qword_10003DEB8 = (uint64_t)v1;
}

uint64_t sub_10000CCB8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10000CCC8(uint64_t a1)
{
}

void sub_10000CCD0(void *a1)
{
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v2 = *(id *)(a1[4] + 16LL);
  id v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v10 + 1) + 8LL * (void)i);
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "serialNumber", (void)v10));
        unsigned int v9 = [v8 isEqualToString:a1[5]];

        if (v9)
        {
          objc_storeStrong((id *)(*(void *)(a1[6] + 8LL) + 40LL), v7);
          goto LABEL_11;
        }
      }

      id v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }

LABEL_11:
}

id sub_10000CE84(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) removeObject:*(void *)(a1 + 40)];
}

id sub_10000CF0C(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) addObject:*(void *)(a1 + 40)];
}

id sub_10000CFB8(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) removeObject:*(void *)(a1 + 40)];
}

void sub_10000D078(uint64_t a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", *(void *)(*(void *)(a1 + 32) + 8LL)));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_10000D138(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) identifier]);
  unsigned int v3 = [v2 isEqualToString:@"PeriodicLaunchActivity"];

  if (v3) {
    [*(id *)(a1 + 40) sendActiveFirmwareAnalyticsEvent];
  }
}

void sub_10000D214(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) serialNumber]);

  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v9 = 0LL;
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v3,  1LL,  &v9));
    id v5 = v9;
    id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) cachedActiveFirmwareAccessories]);
    id v7 = [v6 mutableCopy];

    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) serialNumber]);
    [v7 setObject:v4 forKeyedSubscript:v8];

    [*(id *)(a1 + 40) setCachedActiveFirmwareAccessories:v7];
  }

const char *AUDeveloperSettingsAccessoryFusingTypeToString(unint64_t a1)
{
  if (a1 > 3) {
    return "unrecognized";
  }
  else {
    return off_10002D810[a1];
  }
}

uint64_t AUDeveloperSettingsAccessoryFusingStringToType(void *a1)
{
  id v1 = a1;
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", "Dev"));
  unsigned __int8 v3 = [v1 isEqualToString:v2];

  if ((v3 & 1) != 0)
  {
    uint64_t v4 = 0LL;
  }

  else
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", "Prod"));
    unsigned __int8 v6 = [v1 isEqualToString:v5];

    if ((v6 & 1) != 0)
    {
      uint64_t v4 = 1LL;
    }

    else
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", "Unfused"));
      unsigned __int8 v8 = [v1 isEqualToString:v7];

      if ((v8 & 1) != 0)
      {
        uint64_t v4 = 2LL;
      }

      else
      {
        id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", "Pending"));
        unsigned int v10 = [v1 isEqualToString:v9];

        if (v10) {
          uint64_t v4 = 3LL;
        }
        else {
          uint64_t v4 = 4LL;
        }
      }
    }
  }

  return v4;
}

const char *AUDeveloperSettingsURLTypeToString(unint64_t a1)
{
  if (a1 > 6) {
    return "unrecognized";
  }
  else {
    return off_10002D830[a1];
  }
}

uint64_t AUDeveloperSettingsURLStringToType(void *a1)
{
  id v1 = a1;
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", "Livability"));
  unsigned __int8 v3 = [v1 isEqualToString:v2];

  if ((v3 & 1) != 0)
  {
    uint64_t v4 = 0LL;
  }

  else
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", "Internal Seed"));
    unsigned __int8 v6 = [v1 isEqualToString:v5];

    if ((v6 & 1) != 0)
    {
      uint64_t v4 = 1LL;
    }

    else
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", "Customer"));
      unsigned __int8 v8 = [v1 isEqualToString:v7];

      if ((v8 & 1) != 0)
      {
        uint64_t v4 = 2LL;
      }

      else
      {
        id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", "Public Seed"));
        unsigned __int8 v10 = [v1 isEqualToString:v9];

        if ((v10 & 1) != 0)
        {
          uint64_t v4 = 3LL;
        }

        else
        {
          __int128 v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "Basejumper"));
          unsigned __int8 v12 = [v1 isEqualToString:v11];

          if ((v12 & 1) != 0)
          {
            uint64_t v4 = 4LL;
          }

          else
          {
            __int128 v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "Custom Basejumper"));
            unsigned __int8 v14 = [v1 isEqualToString:v13];

            if ((v14 & 1) != 0)
            {
              uint64_t v4 = 5LL;
            }

            else
            {
              uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "Mesu Staging"));
              unsigned int v16 = [v1 isEqualToString:v15];

              if (v16) {
                uint64_t v4 = 6LL;
              }
              else {
                uint64_t v4 = 7LL;
              }
            }
          }
        }
      }
    }
  }

  return v4;
}

id getInfoForAccessory(void *a1)
{
  id v1 = a1;
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue( +[AUDeveloperSettingsDatabase sharedDatabase]( &OBJC_CLASS___AUDeveloperSettingsDatabase,  "sharedDatabase"));
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([v2 accessoriesDictionary]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:v1]);

  return v4;
}

BOOL configuredToDefaultAssetLocationForAccessory(void *a1)
{
  id v1 = a1;
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([v1 objectForKeyedSubscript:@"fusing"]);
  BOOL v3 = (AUDeveloperSettingsAccessoryFusingStringToType(v2) & 5) != 0;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v1 objectForKeyedSubscript:@"assetLocation"]);

  uint64_t v5 = AUDeveloperSettingsURLStringToType(v4);
  return v5 == 2LL * v3;
}

__CFString *getURLForAssetURLType(unint64_t a1)
{
  if (a1 <= 6 && ((0x75u >> a1) & 1) != 0) {
    id v1 = *off_10002D868[a1];
  }
  else {
    id v1 = 0LL;
  }
  return v1;
}

void cleanupPersonalizedUpdateAvailable(void *a1)
{
  id v1 = a1;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[AUDeveloperSettingsDatabase sharedDatabase](&OBJC_CLASS___AUDeveloperSettingsDatabase, "sharedDatabase"));
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([v7 accessoriesDictionary]);
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:v1]);
  id v4 = [v3 mutableCopy];

  [v4 setObject:0 forKeyedSubscript:@"downloadedVersion"];
  [v4 setObject:0 forKeyedSubscript:@"personalizationRequired"];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[AUDeveloperSettingsDatabase sharedDatabase]( &OBJC_CLASS___AUDeveloperSettingsDatabase,  "sharedDatabase"));
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithDictionary:](&OBJC_CLASS___NSDictionary, "dictionaryWithDictionary:", v4));
  [v5 addAccessoryWithSerialNumber:v1 info:v6];
}

id findPartnerSerialNumbersInDatabase(void *a1)
{
  id v1 = a1;
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( +[AUDeveloperSettingsDatabase sharedDatabase]( &OBJC_CLASS___AUDeveloperSettingsDatabase,  "sharedDatabase"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 accessoriesDictionary]);

  id v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472LL;
  __int128 v11 = sub_10000E134;
  unsigned __int8 v12 = &unk_10002D7F0;
  id v13 = v1;
  id v14 = v2;
  id v5 = v2;
  id v6 = v1;
  [v4 enumerateKeysAndObjectsUsingBlock:&v9];
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", v5, v9, v10, v11, v12));

  return v7;
}

void sub_10000E134(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:@"partnerSerialNumbers"]);
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    while (2)
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        if (objc_msgSend( *(id *)(*((void *)&v11 + 1) + 8 * (void)i),  "isEqualToString:",  *(void *)(a1 + 32),  (void)v11)
          && ([v5 isEqualToString:*(void *)(a1 + 32)] & 1) == 0)
        {
          [*(id *)(a1 + 40) addObject:v5];
          goto LABEL_12;
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

LABEL_12:
}

id findPartnerSerialNumberForAccessory(void *a1)
{
  id v1 = a1;
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([v1 partnerSerialNumbers]);
  if (![v2 count])
  {
    BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v1 serialNumber]);
    id PartnerSerialNumbersInDatabase = findPartnerSerialNumbersInDatabase(v3);
    uint64_t v5 = objc_claimAutoreleasedReturnValue(PartnerSerialNumbersInDatabase);

    uint64_t v2 = (void *)v5;
  }

  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v1 hwFusingType]);
  v21 = (void *)objc_claimAutoreleasedReturnValue( +[AUDeveloperSettingsDatabase sharedDatabase]( &OBJC_CLASS___AUDeveloperSettingsDatabase,  "sharedDatabase"));
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id obj = v2;
  id v6 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v23;
    while (2)
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)v9);
        __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v21 accessoriesDictionary]);
        __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:v10]);

        __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:@"fusing"]);
        if (v13)
        {
          id v14 = v1;
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v1 serialNumber]);
          unsigned __int8 v16 = [v10 isEqualToString:v15];

          id v1 = v14;
          if ((v16 & 1) == 0
            && (![v13 caseInsensitiveCompare:v20]
             || ([v20 isEqualToString:@"prod"] & 1) == 0
             && [v13 caseInsensitiveCompare:@"prod"]))
          {
            id v17 = v10;

            goto LABEL_17;
          }
        }

        uint64_t v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  id v17 = 0LL;
LABEL_17:

  return v17;
}

id getAccessoryDatabaseKeyForAccessoryID(void *a1)
{
  id v1 = a1;
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([v1 modelNumber]);
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( +[UARPSupportedAccessory findByAppleModelNumber:]( &OBJC_CLASS___UARPSupportedAccessory,  "findByAppleModelNumber:",  v2));

  if ([v3 supportsInternalSettings]
    && (id v4 = (void *)objc_claimAutoreleasedReturnValue([v1 serialNumber]), v4, v4))
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[AUDeveloperSettingsDatabase sharedDatabase]( &OBJC_CLASS___AUDeveloperSettingsDatabase,  "sharedDatabase"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 accessoriesDictionary]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v1 serialNumber]);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:v7]);

    if (v8)
    {
      id v9 = (id)objc_claimAutoreleasedReturnValue([v1 serialNumber]);
    }

    else
    {
      id PartnerSerialNumberForAccessory = findPartnerSerialNumberForAccessory(v1);
      __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(PartnerSerialNumberForAccessory);
      __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v5 accessoriesDictionary]);
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:v12]);

      if (v8) {
        id v9 = v12;
      }
      else {
        id v9 = 0LL;
      }
    }

    id v10 = v9;
  }

  else
  {
    id v10 = 0LL;
  }

  return v10;
}

id isOTAUpdateDisabledForAccessoryID(void *a1)
{
  id AccessoryDatabaseKeyForAccessoryID = getAccessoryDatabaseKeyForAccessoryID(a1);
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(AccessoryDatabaseKeyForAccessoryID);
  if (v2)
  {
    BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( +[AUDeveloperSettingsDatabase sharedDatabase]( &OBJC_CLASS___AUDeveloperSettingsDatabase,  "sharedDatabase"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 accessoriesDictionary]);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:v2]);

    if (v5)
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"isOTADisabled"]);
      id v7 = [v6 BOOLValue];
    }

    else
    {
      id v7 = 0LL;
    }
  }

  else
  {
    id v7 = 0LL;
  }

  return v7;
}

void dropboxFileUpdateForAccessoryID(void *a1, void *a2)
{
  id v10 = a2;
  id AccessoryDatabaseKeyForAccessoryID = getAccessoryDatabaseKeyForAccessoryID(a1);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(AccessoryDatabaseKeyForAccessoryID);
  if (v4)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[AUDeveloperSettingsDatabase sharedDatabase]( &OBJC_CLASS___AUDeveloperSettingsDatabase,  "sharedDatabase"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 accessoriesDictionary]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:v4]);

    if (v7)
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v7));
      [v8 setObject:v10 forKeyedSubscript:@"dropboxVersion"];
      id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithDictionary:",  v8));
      [v5 addAccessoryWithSerialNumber:v4 info:v9];
    }
  }
}

void updateReachabilityForAccessoryID(void *a1, unsigned int a2)
{
  id v2 = a1;
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( +[AUDeveloperSettingsDatabase sharedDatabase]( &OBJC_CLASS___AUDeveloperSettingsDatabase,  "sharedDatabase"));
  id v4 = v3;
  if (v2)
  {
    id AccessoryDatabaseKeyForAccessoryID = getAccessoryDatabaseKeyForAccessoryID(v2);
    uint64_t v6 = objc_claimAutoreleasedReturnValue(AccessoryDatabaseKeyForAccessoryID);
    if (v6)
    {
      id v7 = (void *)v6;
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[AUDeveloperSettingsDatabase sharedDatabase]( &OBJC_CLASS___AUDeveloperSettingsDatabase,  "sharedDatabase"));
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 accessoriesDictionary]);
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:v7]);

      if (v10)
      {
        __int128 v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v10));
        __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a2));
        [v11 setObject:v12 forKeyedSubscript:@"accessoryReachable"];

        __int128 v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithDictionary:",  v11));
        [v8 addAccessoryWithSerialNumber:v7 info:v13];
      }
    }
  }

  else
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v3 accessoriesDictionary]);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 allKeys]);

    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    id v16 = v15;
    id v17 = [v16 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v29;
      do
      {
        for (i = 0LL; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v29 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = *(void *)(*((void *)&v28 + 1) + 8LL * (void)i);
          __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v4 accessoriesDictionary]);
          __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKey:v21]);

          if (v23)
          {
            __int128 v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v23));
            __int128 v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a2));
            [v24 setObject:v25 forKeyedSubscript:@"accessoryReachable"];

            v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithDictionary:",  v24));
            [v4 addAccessoryWithSerialNumber:v21 info:v26];
          }
        }

        id v18 = [v16 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }

      while (v18);
    }

    id v2 = 0LL;
  }
}

LABEL_28:
        if (a3 == 5)
        {
          id v9 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Downloading [%d] block 0x%04X",  *a4,  __rev16(*(unsigned __int16 *)(a4 + 1)));
          goto LABEL_26;
        }

  -[iAUPServer setCurrentAsset:](self, "setCurrentAsset:", 4LL);
  if (*a3 == 1)
  {
    v20[0] = -1;
    -[iAUPServer sendCommand:payload:payload_length:](self, "sendCommand:payload:payload_length:", 99LL, v20, 1LL);
    -[iAUPServerDelegate handleSessionError:message:](self->_delegate, "handleSessionError:message:", v16, v17);
  }

  else if (!*a3)
  {
    -[iAUPServer setServerState:](self, "setServerState:", 3LL);
    v20[0] = *a3;
    v20[1] = 0;
    -[iAUPServer sendCommand:payload:payload_length:](self, "sendCommand:payload:payload_length:", 97LL, v20, 2LL);

    self->_hsModel = 0LL;
  }

LABEL_30:
        id v9 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unknown command received (%02X)",  a3,  v11);
        goto LABEL_26;
      }

      goto LABEL_20;
    }

LABEL_24:
    id v10 = -[iAUPServer commandString:](self, "commandString:", a3, a4, *(void *)&a5);
    uint64_t v8 = @"Command: %s";
    goto LABEL_25;
  }

  if (a3 != 1) {
    goto LABEL_30;
  }
  switch(*a4)
  {
    case 0:
      id v7 = @"Bootloader initialized";
      break;
    case 1:
      id v7 = @"Metadata received";
      break;
    case 2:
      id v7 = @"Certificate received";
      break;
    case 3:
      id v7 = @"Certificate validated";
      break;
    case 4:
      id v7 = @"Hash received";
      break;
    case 5:
      id v7 = @"Signature verified";
      break;
    case 6:
      id v7 = @"Firmware mass erased";
      break;
    case 7:
      id v7 = @"Firmware image installed";
      break;
    case 8:
      id v7 = @"Firmware image validated";
      break;
    default:
      switch(*a4)
      {
        case -128:
          id v7 = @"Bad product ID code!";
          break;
        case -127:
          id v7 = @"Bad image start address!";
          break;
        case -126:
          id v7 = @"Bad image end address!";
          break;
        case -125:
          id v7 = @"Bad object size!";
          break;
        case -124:
          id v7 = @"Cert validation failure!";
          break;
        case -123:
          id v7 = @"Not an accessory update cert!";
          break;
        case -122:
          id v7 = @"Signature verification failure!";
          break;
        case -121:
          id v7 = @"FW image hash mismatch!";
          break;
        case -120:
          id v7 = @"General update failure!";
          break;
        default:
          id v7 = @"Process status unknown";
          break;
      }

      break;
  }

LABEL_27:
  -[iAUPServer appendToLog:](self, "appendToLog:", v7, a4, *(void *)&a5);
}

LABEL_51:
      switch(*v4)
      {
        case 0u:
          __int128 v28 = bswap32(-[FirmwareBundle firmwareImageSize](self->_firmwareBundle, "firmwareImageSize"));
          break;
        case 1u:
          __int128 v31 = -[FirmwareBundle certificate](self->_firmwareBundle, "certificate");
          goto LABEL_60;
        case 2u:
          __int128 v31 = -[FirmwareBundle hash](self->_firmwareBundle, "hash");
          goto LABEL_60;
        case 3u:
          __int128 v31 = -[FirmwareBundle signature](self->_firmwareBundle, "signature");
LABEL_60:
          __int128 v28 = bswap32(-[NSData length](v31, "length"));
          break;
        default:
          __int128 v28 = 0;
          break;
      }

      v46 = *v4;
      v47 = v28;
      v26 = self;
      v27 = 132LL;
LABEL_62:
      -[iAUPServer sendCommand:payload:payload_length:](v26, "sendCommand:payload:payload_length:", v27, &v46, 5LL);
      return;
    case 5:
      uint64_t v20 = *v4;
      uint64_t v21 = v3[1];
      LODWORD(v22) = self->objectBlockTransferSizes[v20];
      if (*v4)
      {
        if ((_DWORD)v20 == 1)
        {
          if (-[FirmwareBundle certificate](self->_firmwareBundle, "certificate"))
          {
            __int128 v23 = -[NSData length](-[FirmwareBundle certificate](self->_firmwareBundle, "certificate"), "length");
            __int128 v24 = -[FirmwareBundle certificate](self->_firmwareBundle, "certificate");
            goto LABEL_67;
          }
        }

        else if ((_DWORD)v20 == 3)
        {
          if (-[FirmwareBundle signature](self->_firmwareBundle, "signature"))
          {
            __int128 v23 = -[NSData length](-[FirmwareBundle signature](self->_firmwareBundle, "signature"), "length");
            __int128 v24 = -[FirmwareBundle signature](self->_firmwareBundle, "signature");
            goto LABEL_67;
          }
        }

        else if ((_DWORD)v20 == 2 && -[FirmwareBundle hash](self->_firmwareBundle, "hash"))
        {
          __int128 v23 = -[NSData length](-[FirmwareBundle hash](self->_firmwareBundle, "hash"), "length");
          __int128 v24 = -[FirmwareBundle hash](self->_firmwareBundle, "hash");
LABEL_67:
          __int128 v30 = -[NSData bytes](v24, "bytes");
          goto LABEL_68;
        }

LABEL_73:
        -[iAUPServer appendToLog:](self, "appendToLog:", @"COMMAND_GetObjectBlock: request for empty object.");
        uint64_t v8 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.iAUPServer.ErrorDomain",  -4LL,  0LL);
        v58 = @"Event";
        v59 = @"com.apple.fud.updateFailed";
        id v9 = &v59;
        id v10 = &v58;
        goto LABEL_89;
      }

      if (!-[FirmwareBundle firmwareImage](self->_firmwareBundle, "firmwareImage")
        && !-[FirmwareBundle firmwareLocalURL](self->_firmwareBundle, "firmwareLocalURL"))
      {
        goto LABEL_73;
      }

      __int128 v23 = -[FirmwareBundle firmwareImageSize](self->_firmwareBundle, "firmwareImageSize");
      __int128 v30 = &v29[--[FirmwareBundle firmwareImageBaseAddress](self->_firmwareBundle, "firmwareImageBaseAddress")];
LABEL_68:
      if (!v30 && !-[FirmwareBundle firmwareLocalURL](self->_firmwareBundle, "firmwareLocalURL") || !(_DWORD)v23)
      {
        -[iAUPServer appendToLog:]( self,  "appendToLog:",  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"COMMAND_GetObjectBlock Failed, Invalid object_type (%c) or Image (object_total_size = %u)",  v20,  v23));
        uint64_t v8 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.iAUPServer.ErrorDomain",  -4LL,  0LL);
        v56 = @"Event";
        v57 = @"com.apple.fud.updateFailed";
        id v9 = &v57;
        id v10 = &v56;
        goto LABEL_89;
      }

      v32 = (bswap32(v21) >> 16) * v22;
      v33 = v23 - v32;
      if (v23 < v32)
      {
        -[iAUPServer appendToLog:]( self,  "appendToLog:",  @"COMMAND_GetObjectBlock: bound check failed: block_offset * block_size > object_total_size");
        uint64_t v8 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.iAUPServer.ErrorDomain",  -2LL,  0LL);
        v54 = @"Event";
        v55 = @"com.apple.fud.updateFailed";
        id v9 = &v55;
        id v10 = &v54;
LABEL_89:
        -[iAUPServerDelegate firmwareUpdateComplete:error:]( self->_delegate,  "firmwareUpdateComplete:error:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v9,  v10,  1LL),  v8);

        return;
      }

      else {
        __int128 v22 = v33;
      }
      v34 = malloc((v22 + 3));
      if (!v34)
      {
        -[iAUPServer appendToLog:](self, "appendToLog:", @"COMMAND_GetObjectBlock: malloc failed.");
        uint64_t v8 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.iAUPServer.ErrorDomain",  -3LL,  0LL);
        v52 = @"Event";
        v53 = @"com.apple.fud.updateFailed";
        id v9 = &v53;
        id v10 = &v52;
        goto LABEL_89;
      }

      v35 = v34;
      if ((_DWORD)v20 || !-[FirmwareBundle firmwareLocalURL](self->_firmwareBundle, "firmwareLocalURL"))
      {
        v36 = *(_WORD *)v4;
        v37 = &v30[v32];
        v35[2] = v4[2];
        *(_WORD *)v35 = v36;
        v38 = v35 + 3;
        v39 = (id)v22;
      }

      else
      {
        v41 = -[FirmwareBundle getFirmwareDataInRange:error:]( self->_firmwareBundle,  "getFirmwareDataInRange:error:",  v32,  v22,  0LL);
        if (!v41)
        {
          -[iAUPServer appendToLog:]( self,  "appendToLog:",  @"COMMAND_GetObjectBlock: Failed to read firmware data from file");
          v45 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"com.apple.iAUPServer.ErrorDomain",  -4LL,  0LL);
          v50 = @"Event";
          v51 = @"com.apple.fud.updateFailed";
          -[iAUPServerDelegate firmwareUpdateComplete:error:]( self->_delegate,  "firmwareUpdateComplete:error:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v51,  &v50,  1LL),  v45);

          free(v35);
          return;
        }

        v42 = v41;
        v43 = *(_WORD *)v4;
        v35[2] = v4[2];
        *(_WORD *)v35 = v43;
        v44 = (char *)[v41 bytes];
        v39 = [v42 length];
        v38 = v35 + 3;
        v37 = v44;
      }

      memcpy(v38, v37, (size_t)v39);
      -[iAUPServer sendCommand:payload:payload_length:]( self,  "sendCommand:payload:payload_length:",  133LL,  v35,  (unsigned __int16)(v22 + 3));
      free(v35);
      self->_totalBytesDownloadedInCurrentSession += v22;
      if ((self->_accessoryCapabilities & 1) == 0 && !self->_startEventSent)
      {
        v49[0] = @"com.apple.fud.updateStarted";
        v48[0] = @"Event";
        v48[1] = @"resumeCount";
        v49[1] = +[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", 0LL);
        v48[2] = @"cumulativeUpdateTime";
        v49[2] = +[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", 0LL);
        v48[3] = @"cumulativeCloakTime";
        v49[3] = +[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", 0LL);
        v48[4] = @"totalBytesForCompleteUpdate";
        v49[4] = +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  -[FirmwareBundle firmwareImageSize](self->_firmwareBundle, "firmwareImageSize"));
        v48[5] = @"totalBytesDownloadedSoFar";
        v49[5] = +[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", 0LL);
        -[iAUPServerDelegate handleFirmwareUpdateStatus:]( self->_delegate,  "handleFirmwareUpdateStatus:",  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v49,  v48,  6LL));
        self->_startEventSent = 1;
      }

      if (!(_DWORD)v20)
      {
        delegate = self->_delegate;
        if (delegate) {
          -[iAUPServerDelegate updateProgress:]( delegate,  "updateProgress:",  (double)(v22 + v32) / (double)v23 * 100.0);
        }
      }

      return;
    case 6:
      __int128 v25 = *(unsigned __int16 *)v4;
      self->_accessoryCapabilities = v25;
      NSLog(@"_accessoryCapabilities set to 0x%x\n", v25);
      __int128 v12 = self;
      __int128 v13 = 134LL;
      id v14 = 0LL;
      uint64_t v15 = 0LL;
      goto LABEL_35;
    case 7:
      -[iAUPServer setResumeInfo:length:](self, "setResumeInfo:length:", v4, v6);
      return;
    default:
      return;
  }

void sub_10001116C(id *a1)
{
  if (a1[4]) {
    id v2 = "valid";
  }
  else {
    id v2 = "nil";
  }
  if (a1[5]) {
    BOOL v3 = "valid";
  }
  else {
    BOOL v3 = "nil";
  }
  NSLog( @"%s(): newModel=%s fallbackModel=%s error=%@\n",  "-[iAUPServer setHSModel:fallbackModel:error:]_block_invoke",  v2,  v3,  a1[6]);
  id v4 = a1[7];
  if (v4[4] != 5)
  {
    NSLog(@"[HS Callback] Invalid State=%s\n", objc_msgSend(v4, "serverStateString:"));
    goto LABEL_53;
  }

  if (a1[6]) {
    goto LABEL_9;
  }
  id v5 = a1[4];
  BOOL v6 = v5
    && [v5 modelData]
    && [a1[4] modelHash]
    && [a1[4] modelLocale] != 0;
  id v7 = a1[5];
  BOOL v8 = v7 && [v7 modelHash] && objc_msgSend(a1[5], "modelLocale") != 0;
  BOOL v34 = v8;
  BOOL v32 = v6;
  if (v6)
  {
    id v9 = objc_msgSend(objc_msgSend(a1[4], "modelHash"), "lengthOfBytesUsingEncoding:", 1);
    id v10 = objc_msgSend(objc_msgSend(a1[4], "modelLocale"), "lengthOfBytesUsingEncoding:", 1);
    id v33 = objc_msgSend(objc_msgSend(a1[4], "modelData"), "length");
    *((void *)a1[7] + 4) = -[FirmwareBundle initWithData:hashData:signatureData:certData:]( [FirmwareBundle alloc],  "initWithData:hashData:signatureData:certData:",  [a1[4] modelData],  objc_msgSend(a1[4], "digest"),  objc_msgSend(a1[4], "signature"),  objc_msgSend(a1[4], "certificate"));
    __int128 v11 = (void *)*((void *)a1[7] + 4);
    if (!v11)
    {
      NSLog(@"[HS Callback] Failed to create firmware bundle\n", v30);
      goto LABEL_9;
    }

    size_t v35 = (size_t)v10;
    size_t v36 = (size_t)v9;
    uint64_t v12 = ((_DWORD)v9 + (_DWORD)v10 + 4);
    if ([v11 firmwareImage]) {
      __int128 v13 = "valid";
    }
    else {
      __int128 v13 = "nil";
    }
    __int128 v31 = v13;
    id v14 = [*((id *)a1[7] + 4) firmwareImageSize];
    if ([*((id *)a1[7] + 4) hash]) {
      uint64_t v15 = "valid";
    }
    else {
      uint64_t v15 = "nil";
    }
    if ([*((id *)a1[7] + 4) signature]) {
      id v16 = "valid";
    }
    else {
      id v16 = "nil";
    }
    if ([*((id *)a1[7] + 4) certificate]) {
      id v17 = "valid";
    }
    else {
      id v17 = "nil";
    }
    NSLog( @"FimrwareBundle created [image=%s imageSize=%d hash=%s signature=%s cert=%s productID=%d baseAddress=%d]\n",  v31,  v14,  v15,  v16,  v17,  [*((id *)a1[7] + 4) productIDCode],  objc_msgSend(*((id *)a1[7] + 4), "firmwareImageBaseAddress"));
    if (!v34) {
      goto LABEL_35;
    }
  }

  else
  {
    size_t v35 = 0LL;
    size_t v36 = 0LL;
    id v33 = 0LL;
    uint64_t v12 = 2LL;
    if (!v8)
    {
LABEL_35:
      id v18 = 0LL;
      id v19 = 0LL;
      id v20 = 0LL;
      goto LABEL_38;
    }
  }

  id v18 = objc_msgSend(objc_msgSend(a1[5], "modelHash"), "lengthOfBytesUsingEncoding:", 1);
  id v19 = objc_msgSend(objc_msgSend(a1[5], "modelLocale"), "lengthOfBytesUsingEncoding:", 1);
  id v20 = objc_msgSend(objc_msgSend(a1[5], "modelData"), "length");
  uint64_t v12 = ((_DWORD)v18 + (_DWORD)v19 + v12 + 2);
LABEL_38:
  if ([a1[4] modelData]) {
    uint64_t v21 = "valid";
  }
  else {
    uint64_t v21 = "nil";
  }
  NSLog( @"%s(): newModel=[data[%lu]=%s locale[%lu]=%@ hash[%lu]=%@]\n",  "-[iAUPServer setHSModel:fallbackModel:error:]_block_invoke",  v33,  v21,  v35,  [a1[4] modelLocale],  v36,  objc_msgSend(a1[4], "modelHash"));
  if ([a1[5] modelData]) {
    __int128 v22 = "valid";
  }
  else {
    __int128 v22 = "nil";
  }
  NSLog( @"%s(): fbModel=[data[%lu]=%s locale[%lu]=%@ hash[%lu]=%@]\n",  "-[iAUPServer setHSModel:fallbackModel:error:]_block_invoke",  v20,  v22,  v19,  [a1[5] modelLocale],  v18,  objc_msgSend(a1[5], "modelHash"));
  NSLog(@"%s(): returnPayloadSize=%d\n", "-[iAUPServer setHSModel:fallbackModel:error:]_block_invoke", v12);
  __int128 v23 = calloc(v12, 1uLL);
  if (!v23)
  {
    NSLog(@"[HS Callback] Error allocating return payload buf size=%d\n", v12);
LABEL_9:
    [a1[7] setServerState:3];
    __int16 v37 = 0;
    objc_msgSend(a1[7], "sendCommand:payload:payload_length:", 99, &v37, 2);
    objc_msgSend( *((id *)a1[7] + 1),  "handleSessionError:message:",  objc_msgSend(a1[6], "code"),  @"Failed to retrieve HS Asset Info");
    goto LABEL_53;
  }

  __int128 v24 = v23;
  _BYTE *v23 = 0;
  unsigned int v25 = 2;
  if (v34) {
    char v26 = 2;
  }
  else {
    char v26 = 0;
  }
  v23[1] = v26 | v32;
  if (v32)
  {
    v23[2] = v35;
    memcpy(v23 + 3, objc_msgSend(objc_msgSend(a1[4], "modelLocale"), "cStringUsingEncoding:", 1), v35);
    v24[(v35 + 3)] = v36;
    memcpy( &v24[(v35 + 4)],  objc_msgSend(objc_msgSend(a1[4], "modelHash"), "cStringUsingEncoding:", 1),  v36);
    unsigned int v25 = v35 + 4 + v36;
  }

  if (v34)
  {
    uint64_t v27 = v25 + 1;
    v24[v25] = (_BYTE)v19;
    memcpy(&v24[v27], objc_msgSend(objc_msgSend(a1[5], "modelLocale"), "cStringUsingEncoding:", 1), (size_t)v19);
    int v28 = v27 + (_DWORD)v19;
    uint64_t v29 = (v27 + (_DWORD)v19 + 1);
    v24[v28] = (_BYTE)v18;
    memcpy(&v24[v29], objc_msgSend(objc_msgSend(a1[5], "modelHash"), "cStringUsingEncoding:", 1), (size_t)v18);
    LOWORD(v25) = v29 + (_WORD)v18;
  }

  objc_msgSend(a1[7], "sendCommand:payload:payload_length:", 97, v24, (unsigned __int16)v25);
  [a1[7] setServerState:6];
  free(v24);
LABEL_53:

  *((void *)a1[7] + 5) = 0LL;
}

void sub_100011A4C(uint64_t a1)
{
}

void sub_100011E08( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, char a26)
{
}

void sub_100011FD0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_100011FF0(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (CFPreferencesGetAppBooleanValue( @"simulateCoreSpeechNotRespoding",  @"com.apple.UARPUpdaterServiceLegacyAudio",  0LL))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Simulating CoreSpeech not responding",  buf,  2u);
    }
  }

  else
  {
    if (v7 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Download Model %@",  buf,  0xCu);
    }

    if (v8 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Fallback Model %@",  buf,  0xCu);
    }

    uint64_t v10 = *(void *)(a1 + 32);
    __int128 v11 = *(dispatch_queue_s **)(v10 + 16);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1000121E8;
    v12[3] = &unk_10002D950;
    v12[4] = v10;
    id v13 = v7;
    id v14 = v8;
    id v15 = v9;
    dispatch_async(v11, v12);
  }
}

void sub_1000121E8(void *a1)
{
  id v2 = *(void **)(a1[4] + 8LL);
  if (v2)
  {
    [v2 setHSModel:a1[5] fallbackModel:a1[6] error:a1[7]];
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136315138;
    id v4 = "-[HSModel scheduleCoreSpeechTask:minorVersion:downloadedModels:preinstalledModels:]_block_invoke";
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s: delegate is nil",  (uint8_t *)&v3,  0xCu);
  }

void sub_1000122EC(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = objc_getClass("CSVoiceTriggerRTModel");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    qword_10003DEC8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  }

  else
  {
    sub_100017B6C();
    sub_100012340();
  }

void sub_100012340()
{
  id v1 = 0LL;
  if (!qword_10003DED0)
  {
    __int128 v2 = off_10002D9C0;
    uint64_t v3 = 0LL;
    qword_10003DED0 = _sl_dlopen(&v2, &v1);
  }

  v0 = v1;
  if (!qword_10003DED0)
  {
    v0 = (char *)abort_report_np("%s", v1);
    goto LABEL_7;
  }

  if (v1) {
LABEL_7:
  }
    free(v0);
}

void sub_1000123EC(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = objc_getClass("CSCoreSpeechServices");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    qword_10003DED8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  }

  else
  {
    __int128 v2 = (void *)sub_100017B90();
    +[NSUserDefaults AUDeveloperSettingsSetObject:withKey:](v2, v3, v4, v5);
  }

void sub_100012660( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_100012678(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100012688(uint64_t a1)
{
}

void sub_100012690(uint64_t a1, void *a2)
{
}

CFStringRef MapPreferenceSuiteToString(uint64_t a1)
{
  id v1 = @"com.apple.accessoryupdaterd";
  if (a1) {
    id v1 = 0LL;
  }
  if (a1 == 1) {
    return @"com.apple.AUDeveloperSettings";
  }
  else {
    return v1;
  }
}

NSDictionary *sub_1000127D4(uint64_t a1)
{
  id v2 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  SEL v3 = v2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(v4 + 16);
  if (v5)
  {
    [v2 setObject:v5 forKeyedSubscript:@"manufacturerName"];
    uint64_t v4 = *(void *)(a1 + 32);
  }

  uint64_t v6 = *(void *)(v4 + 24);
  if (v6)
  {
    [v3 setObject:v6 forKeyedSubscript:@"modelName"];
    uint64_t v4 = *(void *)(a1 + 32);
  }

  uint64_t v7 = *(void *)(v4 + 32);
  if (v7)
  {
    [v3 setObject:v7 forKeyedSubscript:@"activeFirmwareVersion"];
    uint64_t v4 = *(void *)(a1 + 32);
  }

  if (*(void *)(v4 + 40))
  {
    objc_msgSend( v3,  "setObject:forKeyedSubscript:",  +[NSString stringWithUTF8String:]( NSString,  "stringWithUTF8String:",  UARPAccessoryTransportToString()),  @"transportType");
    uint64_t v4 = *(void *)(a1 + 32);
  }

  uint64_t v8 = *(void *)(v4 + 48);
  if (v8)
  {
    [v3 setObject:v8 forKeyedSubscript:@"countryCode"];
    uint64_t v4 = *(void *)(a1 + 32);
  }

  uint64_t v9 = *(void *)(v4 + 56);
  if (v9)
  {
    [v3 setObject:v9 forKeyedSubscript:@"postedFirmwareVersion"];
    uint64_t v4 = *(void *)(a1 + 32);
  }

  uint64_t v10 = *(void *)(v4 + 64);
  if (v10)
  {
    [v3 setObject:v10 forKeyedSubscript:@"downloadURL"];
    uint64_t v4 = *(void *)(a1 + 32);
  }

  if (*(void *)(v4 + 72))
  {
    objc_msgSend( v3,  "setObject:forKeyedSubscript:",  +[NSString stringWithUTF8String:]( NSString,  "stringWithUTF8String:",  UARPAnalyticsAssetChannelTypeToString()),  @"channel");
    uint64_t v4 = *(void *)(a1 + 32);
  }

  __int128 v11 = *(void **)(v4 + 80);
  if (v11)
  {
    [v3 setObject:UARPAnalyticsDurationToBucket(v11) forKeyedSubscript:@"downloadConsentDuration"];
    uint64_t v4 = *(void *)(a1 + 32);
  }

  uint64_t v12 = *(void *)(v4 + 88);
  if (v12)
  {
    [v3 setObject:v12 forKeyedSubscript:@"downloadUserInitiated"];
    uint64_t v4 = *(void *)(a1 + 32);
  }

  if (*(void *)(v4 + 96))
  {
    objc_msgSend( v3,  "setObject:forKeyedSubscript:",  +[NSString stringWithUTF8String:]( NSString,  "stringWithUTF8String:",  UARPAnalyticsAssetDownloadStatusToString()),  @"downloadStatus");
    uint64_t v4 = *(void *)(a1 + 32);
  }

  uint64_t v13 = *(void *)(v4 + 104);
  if (v13)
  {
    [v3 setObject:v13 forKeyedSubscript:@"stagingUserInitiated"];
    uint64_t v4 = *(void *)(a1 + 32);
  }

  id v14 = *(void **)(v4 + 112);
  if (v14)
  {
    [v3 setObject:UARPAnalyticsDurationToBucket(v14) forKeyedSubscript:@"stagingDuration"];
    uint64_t v4 = *(void *)(a1 + 32);
  }

  id v15 = *(void **)(v4 + 120);
  if (v15)
  {
    [v3 setObject:UARPAnalyticsIterationCountToBucket(v15) forKeyedSubscript:@"stagingIterations"];
    uint64_t v4 = *(void *)(a1 + 32);
  }

  if (*(void *)(v4 + 128))
  {
    objc_msgSend( v3,  "setObject:forKeyedSubscript:",  +[NSString stringWithUTF8String:]( NSString,  "stringWithUTF8String:",  UARPAnalyticsStagingStatusToString()),  @"stagingStatus");
    uint64_t v4 = *(void *)(a1 + 32);
  }

  uint64_t v16 = *(void *)(v4 + 136);
  if (v16)
  {
    [v3 setObject:v16 forKeyedSubscript:@"stagingVendorError"];
    uint64_t v4 = *(void *)(a1 + 32);
  }

  uint64_t v17 = *(void *)(v4 + 144);
  if (v17)
  {
    [v3 setObject:v17 forKeyedSubscript:@"applyUserInitiated"];
    uint64_t v4 = *(void *)(a1 + 32);
  }

  id v18 = *(void **)(v4 + 152);
  if (v18)
  {
    [v3 setObject:UARPAnalyticsDurationToBucket(v18) forKeyedSubscript:@"applyDuration"];
    uint64_t v4 = *(void *)(a1 + 32);
  }

  if (*(void *)(v4 + 160))
  {
    objc_msgSend( v3,  "setObject:forKeyedSubscript:",  +[NSString stringWithUTF8String:]( NSString,  "stringWithUTF8String:",  UARPAnalyticsApplyStatusToString()),  @"applyStatus");
    uint64_t v4 = *(void *)(a1 + 32);
  }

  uint64_t v19 = *(void *)(v4 + 168);
  if (v19)
  {
    [v3 setObject:v19 forKeyedSubscript:@"applyVendorError"];
    uint64_t v4 = *(void *)(a1 + 32);
  }

  objc_msgSend( v3,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", *(unsigned __int8 *)(v4 + 8)),  @"share3rdParty");
  return +[NSDictionary dictionaryWithDictionary:](&OBJC_CLASS___NSDictionary, "dictionaryWithDictionary:", v3);
}

uint64_t AUSandboxPlatformInitWithBundleIdentifier(void *a1, const char *a2)
{
  id v3 = a1;
  if (!v3)
  {
    id v3 = &_os_log_default;
    id v4 = &_os_log_default;
  }

  if (a2) {
    uint64_t v5 = a2;
  }
  else {
    uint64_t v5 = "com.apple.MobileAccessoryUpdater";
  }
  id v6 = v3;
  bzero(v10, 0x400uLL);
  id v7 = v6;
  if ((_set_user_dir_suffix(v5) & 1) != 0)
  {
    if (confstr(65537, v10, 0x400uLL))
    {
      uint64_t v8 = 0LL;
      goto LABEL_14;
    }

    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR)) {
      sub_100017BB4();
    }
  }

  else if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR))
  {
    sub_100017C28();
  }

  uint64_t v8 = 1LL;
LABEL_14:

  return v8;
}

void sub_100012FE0( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

NSDictionary *sub_1000130C0(uint64_t a1)
{
  id v2 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  id v3 = v2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(v4 + 16);
  if (v5)
  {
    [v2 setObject:v5 forKeyedSubscript:@"manufacturerName"];
    uint64_t v4 = *(void *)(a1 + 32);
  }

  uint64_t v6 = *(void *)(v4 + 24);
  if (v6)
  {
    [v3 setObject:v6 forKeyedSubscript:@"modelName"];
    uint64_t v4 = *(void *)(a1 + 32);
  }

  uint64_t v7 = *(void *)(v4 + 32);
  if (v7)
  {
    [v3 setObject:v7 forKeyedSubscript:@"countryCode"];
    uint64_t v4 = *(void *)(a1 + 32);
  }

  uint64_t v8 = *(void *)(v4 + 40);
  if (v8)
  {
    [v3 setObject:v8 forKeyedSubscript:@"downloadURL"];
    uint64_t v4 = *(void *)(a1 + 32);
  }

  uint64_t v9 = *(void *)(v4 + 48);
  if (v9)
  {
    [v3 setObject:v9 forKeyedSubscript:@"activeFirmwareVersion"];
    uint64_t v4 = *(void *)(a1 + 32);
  }

  if (*(void *)(v4 + 56))
  {
    objc_msgSend( v3,  "setObject:forKeyedSubscript:",  +[NSString stringWithUTF8String:]( NSString,  "stringWithUTF8String:",  UARPAccessoryTransportToString()),  @"transportType");
    uint64_t v4 = *(void *)(a1 + 32);
  }

  if (*(void *)(v4 + 64))
  {
    objc_msgSend( v3,  "setObject:forKeyedSubscript:",  +[NSString stringWithUTF8String:]( NSString,  "stringWithUTF8String:",  UARPAnalyticsAssetChannelTypeToString()),  @"channel");
    uint64_t v4 = *(void *)(a1 + 32);
  }

  objc_msgSend( v3,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", *(unsigned __int8 *)(v4 + 8)),  @"share3rdParty");
  return +[NSDictionary dictionaryWithDictionary:](&OBJC_CLASS___NSDictionary, "dictionaryWithDictionary:", v3);
}

LABEL_29:
  if (v11)
  {
    -[FirmwareBundle parseFileName:intoPath:andExtension:](v4, "parseFileName:intoPath:andExtension:", v11, &v36, &v35);
    if ([v35 caseInsensitiveCompare:@"bin"]) {
      __int128 v23 = -[FirmwareBundle parseResourceFileIntoData:]( v4,  "parseResourceFileIntoData:",  [a3 pathForResource:v36 ofType:v35]);
    }
    else {
      __int128 v23 = +[NSData dataWithContentsOfFile:]( NSData,  "dataWithContentsOfFile:",  [a3 pathForResource:v36 ofType:v35]);
    }
    v4->_signature = v23;
  }

  __int128 v24 = [v13 componentsSeparatedByString:@"."];
  if (v24) {
    LODWORD(v24) = objc_msgSend(objc_msgSend(v24, "lastObject"), "intValue");
  }
  v4->_productIDCode = v24;
  v4->_bundleDescription = (NSString *)objc_msgSend(objc_msgSend(a3, "bundlePath"), "lastPathComponent");
LABEL_37:
  if (-[FirmwareBundle firmwareImage](v4, "firmwareImage")) {
    unsigned int v25 = "valid";
  }
  else {
    unsigned int v25 = "nil";
  }
  char v26 = -[FirmwareBundle firmwareImageSize](v4, "firmwareImageSize");
  if (-[FirmwareBundle hash](v4, "hash")) {
    uint64_t v27 = "valid";
  }
  else {
    uint64_t v27 = "nil";
  }
  int v28 = -[NSData length](-[FirmwareBundle hash](v4, "hash"), "length");
  if (-[FirmwareBundle signature](v4, "signature")) {
    uint64_t v29 = "valid";
  }
  else {
    uint64_t v29 = "nil";
  }
  uint64_t v30 = -[NSData length](-[FirmwareBundle signature](v4, "signature"), "length");
  if (-[FirmwareBundle certificate](v4, "certificate")) {
    __int128 v31 = "valid";
  }
  else {
    __int128 v31 = "nil";
  }
  NSLog( @"%s: I=%s[%lu] H=%s[%lu] S=%s[%lu] C=%s[%lu] productID=%d baseAddress=%d\n",  "-[FirmwareBundle initWithBundle:]",  v25,  v26,  v27,  v28,  v29,  v30,  v31,  -[NSData length](-[FirmwareBundle certificate](v4, "certificate"), "length"),  -[FirmwareBundle productIDCode](v4, "productIDCode"),  -[FirmwareBundle firmwareImageBaseAddress](v4, "firmwareImageBaseAddress"));
  return v4;
}

LABEL_32:
  -[EAFirmwareUpdater setAlternateAssetTypes:](v12->firmwareUpdater, "setAlternateAssetTypes:", v19);
  if (-[NSDictionary objectForKey:](v12->deviceOptions, "objectForKey:", @"MultipleManifests")) {
    -[EAFirmwareUpdater setManifestIDs:]( v12->firmwareUpdater,  "setManifestIDs:",  -[NSDictionary objectForKey:](v12->deviceOptions, "objectForKey:", @"MultipleManifests"));
  }
  if (objc_msgSend( -[NSDictionary objectForKey:]( v12->deviceOptions,  "objectForKey:",  @"ExcludeUniqueAccessoryCheck"),  "BOOLValue")) {
    -[EAFirmwareUpdater setExcludeUniqueAccessoryCheck:](v12->firmwareUpdater, "setExcludeUniqueAccessoryCheck:", 1LL);
  }
  -[EAFirmwareUpdater setOverrideFile:]( v12->firmwareUpdater,  "setOverrideFile:",  @"/var/db/accessoryupdater/ea_updater_override.plist");
  if (MGGetBoolAnswer(@"InternalBuild", v43))
  {
    v44 =  +[NSURL URLWithString:]( NSURL,  "URLWithString:",  [@"/var/db/accessoryupdater/" stringByAppendingPathComponent:v48]);
    v12->dropboxPath = v44;
    -[FudPluginDelegate log:format:](v12->delegate, "log:format:", 7LL, @"Default Dropbox Path: %@", v44);
  }

  if (-[EAFirmwareUpdater overrideProtocol](v12->firmwareUpdater, "overrideProtocol")) {
    -[EAAccessoryUpdater overrideUpdaterOptions](v12, "overrideUpdaterOptions");
  }
  -[EAAccessoryUpdater allowConditionalDownloadOnCellular](v12, "allowConditionalDownloadOnCellular");
  v51[0] = @"PrepareWeight";
  v51[1] = @"ApplyWeight";
  v52[0] = &off_100034C98;
  v52[1] = &off_100034CB0;
  v51[2] = @"FinishWeight";
  v51[3] = @"AccessoryIdentifier";
  v52[2] = &off_100034C98;
  v52[3] = v48;
  *v49 = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v52,  v51,  4LL);
  return v12;
}

id copyPlistDeviceEntryFromDeviceClass(void *a1)
{
  id v2 = +[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle");
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = (const void *)MGCopyAnswer(@"InternalBuild", 0LL);
    else {
      uint64_t v5 = @"/AppleInternal/usr/local/misc/SupportedAccessories-iAUP.plist";
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      __int128 v11 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Use Alternate Accessory List from %@",  buf,  0xCu);
    }

    id v6 = -[NSDictionary objectForKeyedSubscript:]( +[NSDictionary dictionaryWithContentsOfURL:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfURL:",  +[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v5)),  "objectForKeyedSubscript:",  @"MobileAccessoryUpdaterProperties");
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      __int128 v11 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Loaded Alternate Accessory List from %@",  buf,  0xCu);
    }

    if (!v6)
    {
LABEL_11:
      id v6 = -[NSBundle objectForInfoDictionaryKey:]( v3,  "objectForInfoDictionaryKey:",  @"MobileAccessoryUpdaterProperties");
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Loaded Native iAUP Accessory List",  buf,  2u);
      }
    }

    id v2 = (NSBundle *)[v6 objectForKey:@"MatchingDevices"];
    if (v2)
    {
      id v7 = -[NSBundle filteredArrayUsingPredicate:]( v2,  "filteredArrayUsingPredicate:",  +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"DeviceClass = %@",  a1));
      if (v7 && (uint64_t v8 = v7, [v7 count]))
      {
        id v2 = (NSBundle *)[v8 objectAtIndexedSubscript:0];
      }

      else
      {
        NSLog(@"huh? deviceClass %@ not found", a1);
        id v2 = 0LL;
      }
    }
  }

  return -[NSBundle copy](v2, "copy");
}

id isSkipDFUModeInBundleInfoPlist(id result)
{
  if (result) {
    return objc_msgSend(objc_msgSend(result, "objectForKey:", @"skipDFUMode"), "BOOLValue");
  }
  return result;
}

id isByteEscapingDisabledInBundleInfoPlist(id result)
{
  if (result) {
    return objc_msgSend(objc_msgSend(result, "objectForKey:", @"disableByteEscaping"), "BOOLValue");
  }
  return result;
}

id isSkipReconnectBundleInfoPlist(id result)
{
  if (result) {
    return objc_msgSend(objc_msgSend(result, "objectForKey:", @"skipReconnect"), "BOOLValue");
  }
  return result;
}

id isSkipMinimumFirmwareVersionCheckInOptions(id result)
{
  if (result) {
    return objc_msgSend(objc_msgSend(result, "objectForKey:", @"skipMinimumFirmwareVersionCheck"), "BOOLValue");
  }
  return result;
}

void sub_10001591C(id a1)
{
  id v1 = "$SIDEBUILD_PARENT_TRAIN";
  if (!-[NSString isEqualToString:]( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s",  "$SIDEBUILD_PARENT_TRAIN"),  "isEqualToString:",  &stru_100031310)
    && !-[NSString isEqualToString:]( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s",  "$SIDEBUILD_PARENT_TRAIN"),  "isEqualToString:",  @"$SIDEBUILD_PARENT_TRAIN")
    || (id v1 = "SapphireC",
        !-[NSString isEqualToString:]( +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%s", "SapphireC"),  "isEqualToString:",  &stru_100031310))
    && !-[NSString isEqualToString:]( +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%s", "SapphireC"),  "isEqualToString:",  @"$RC_RELEASE"))
  {
    qword_10003DEE8 = (uint64_t)v1;
  }

int64_t sub_10001606C(id a1, NSURL *a2, NSURL *a3)
{
  uint64_t v6 = 0LL;
  -[NSURL getResourceValue:forKey:error:](a2, "getResourceValue:forKey:error:", &v6, NSURLLocalizedNameKey, 0LL);
  id v5 = 0LL;
  -[NSURL getResourceValue:forKey:error:](a3, "getResourceValue:forKey:error:", &v5, NSURLLocalizedNameKey, 0LL);
  return (int64_t)[v5 compare:v6];
}

LABEL_7:
      __int128 v11 = self->delegate;
      uint64_t v12 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.EAAccessoryUpdater",  -1LL,  0LL);
      delegate = v11;
      id v14 = 0LL;
      id v15 = 0LL;
      uint64_t v16 = 0LL;
LABEL_14:
      -[FudPluginDelegate didFind:info:updateAvailable:needsDownload:error:]( delegate,  "didFind:info:updateAvailable:needsDownload:error:",  v14,  v15,  v16,  0LL,  v12);
      return;
    }
  }

  if (MGGetBoolAnswer(@"InternalBuild", v10)
    && self->dropboxPath
    && -[NSFileManager fileExistsAtPath:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "fileExistsAtPath:",  -[NSURL path](self->dropboxPath, "path")))
  {
    size_t v35 = 0LL;
    __int128 v24 = -[EAAccessoryUpdater prepareFirmwareBundlesFromDropbox:error:]( self,  "prepareFirmwareBundlesFromDropbox:error:",  v7,  &v35);
    -[FudPluginDelegate didFind:info:updateAvailable:needsDownload:error:]( self->delegate,  "didFind:info:updateAvailable:needsDownload:error:",  v24,  v7,  v24,  0LL,  v35);
  }

  else
  {
    if (self->localFilePath)
    {
      unsigned int v25 = -[NSFileManager fileExistsAtPath:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "fileExistsAtPath:",  self->localFilePath);
      char v26 = self->delegate;
      localFilePath = self->localFilePath;
      if (v25)
      {
        -[FudPluginDelegate log:format:]( v26,  "log:format:",  5LL,  @"%s: attempting to use file from dropbox: %@",  "-[EAAccessoryUpdater findFirmwareWithOptions:remote:]",  localFilePath);
        -[EAFirmwareUpdater setFirmwareLocalURL:]( self->firmwareUpdater,  "setFirmwareLocalURL:",  +[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", self->localFilePath));
        delegate = self->delegate;
        id v14 = 1LL;
        id v15 = 0LL;
        goto LABEL_12;
      }

      -[FudPluginDelegate log:format:]( v26,  "log:format:",  3LL,  @"%s: invalid dropbox provided: %@",  "-[EAAccessoryUpdater findFirmwareWithOptions:remote:]",  localFilePath);
      goto LABEL_7;
    }

    if (v8)
    {
      if (-[EAFirmwareUpdater serialNumber](self->firmwareUpdater, "serialNumber"))
      {
        int v28 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@/%@",  @"/var/run/fud/seed/",  -[EAFirmwareUpdater modelNumber](self->firmwareUpdater, "modelNumber"),  -[EAFirmwareUpdater serialNumber](self->firmwareUpdater, "serialNumber"));
        if (v28)
        {
          if (-[NSURL checkResourceIsReachableAndReturnError:]( +[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v28),  "checkResourceIsReachableAndReturnError:",  0LL))
          {
            -[FudPluginDelegate log:format:]( self->delegate,  "log:format:",  7LL,  @"%s: User previously declined update for this accessory %@ (%@), ignoring this update",  "-[EAAccessoryUpdater findFirmwareWithOptions:remote:]",  self->deviceClass,  -[EAFirmwareUpdater serialNumber](self->firmwareUpdater, "serialNumber"));
            delegate = self->delegate;
            id v14 = 0LL;
            id v15 = 0LL;
            uint64_t v16 = 0LL;
            goto LABEL_13;
          }
        }
      }

      if (!-[NSString length](deviceClass, "length"))
      {
        -[FudPluginDelegate log:format:]( self->delegate,  "log:format:",  7LL,  @"%s: Accessory name unavailable for %@, using deviceClass",  "-[EAAccessoryUpdater findFirmwareWithOptions:remote:]",  self->deviceClass);
        deviceClass = self->deviceClass;
      }
    }

    firmwareUpdater = self->firmwareUpdater;
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472LL;
    v33[2] = sub_10001665C;
    v33[3] = &unk_10002DAE0;
    BOOL v34 = v8;
    v33[4] = self;
    v33[5] = deviceClass;
    -[EAFirmwareUpdater findAsset:completion:](firmwareUpdater, "findAsset:completion:", v4, v33);
  }

id sub_10001665C(uint64_t a1, void *a2)
{
  id v4 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  uint64_t v5 = *(void *)(a1 + 32);
  if (*(_BYTE *)(v5 + 72))
  {
    objc_msgSend( v4,  "setObject:forKey:",  +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1),  @"SilentUpdateNoUI");
    uint64_t v5 = *(void *)(a1 + 32);
  }

  if ([*(id *)(v5 + 16) currentFirmwareVersionOnAcc]) {
    objc_msgSend( v4,  "setObject:forKey:",  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "currentFirmwareVersionOnAcc"),  @"existingFWVersionOnAccessory");
  }
  if (a2)
  {
    uint64_t v6 = (const __CFString *)objc_msgSend(objc_msgSend(a2, "userInfo"), "objectForKey:", NSLocalizedDescriptionKey);
    if (v6) {
      id v7 = v6;
    }
    else {
      id v7 = @"GeneralError";
    }
    [v4 setObject:v7 forKey:@"error"];
    [v4 setObject:@"FailureStateFind" forKey:@"failureState"];
  }

  else if ([*(id *)(*(void *)(a1 + 32) + 16) assetAvailable])
  {
    if ([*(id *)(*(void *)(a1 + 32) + 16) firmwareVersionAvailable]) {
      objc_msgSend( v4,  "setObject:forKey:",  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "firmwareVersionAvailable"),  @"newFWVersion");
    }
    if (*(_BYTE *)(a1 + 48))
    {
      uint64_t v8 = +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@%@",  @"/var/run/fud/seed/",  [*(id *)(*(void *)(a1 + 32) + 16) modelNumber]);
      [*(id *)(*(void *)(a1 + 32) + 8) log:7, @"%s: Consent Required for updating %@", "-[EAAccessoryUpdater findFirmwareWithOptions:remote:]_block_invoke", *(void *)(*(void *)(a1 + 32) + 24) format];
      objc_msgSend( v4,  "setValue:forKey:",  +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0),  @"SilentUpdateNoUI");
      objc_msgSend( v4,  "setValue:forKey:",  +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1),  @"SeedConsentRequired");
      [v4 setValue:*(void *)(a1 + 40) forKey:@"AccessoryName"];
      [v4 setValue:v8 forKey:@"SeedUpdateDeclinedPath"];
      if ([*(id *)(*(void *)(a1 + 32) + 16) serialNumber]) {
        objc_msgSend( v4,  "setValue:forKey:",  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "serialNumber"),  @"SerialNumber");
      }
    }
  }

  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void **)(v9 + 8);
  id v11 = [*(id *)(v9 + 16) assetAvailable];
  else {
    uint64_t v12 = 0LL;
  }
  return [v10 didFind:a2 == 0 info:v4 updateAvailable:v11 needsDownload:v12 error:a2];
}

void sub_100016A04( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_100016A1C(uint64_t a1, uint64_t a2)
{
}

void sub_100016A2C(uint64_t a1)
{
}

id sub_100016A38(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v4 = (const __CFString *)objc_msgSend(objc_msgSend(a2, "userInfo"), "objectForKey:", NSLocalizedDescriptionKey);
    v9[0] = @"failureState";
    v9[1] = @"error";
    uint64_t v5 = @"GeneralError";
    if (v4) {
      uint64_t v5 = v4;
    }
    v10[0] = @"FailureStateDownload";
    v10[1] = v5;
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL) = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v10,  v9,  2LL);
    if (*(_BYTE *)(a1 + 48)) {
      [*(id *)(*(void *)(a1 + 32) + 16) purgeAsset];
    }
  }

  else if (*(_BYTE *)(*(void *)(a1 + 32) + 72LL))
  {
    id v7 = @"SilentUpdateNoUI";
    uint64_t v8 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL);
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL) = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v8,  &v7,  1LL);
  }

  return [*(id *)(*(void *)(a1 + 32) + 8) didDownload:a2 == 0 info:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) error:a2];
}

id sub_100016D28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) didApply:a3 == 0 info:a2 error:a3];
}

id sub_100016D84(uint64_t a1, double a2)
{
  id result = objc_msgSend( *(id *)(*(void *)(a1 + 32) + 8),  "log:format:",  7,  @"Update Progress: %f",  *(void *)&a2);
  uint64_t v5 = *(void *)(a1 + 32);
  if (*(_BYTE *)(v5 + 48) || !*(_BYTE *)(v5 + 72)) {
    return [*(id *)(v5 + 8) progress:a2];
  }
  return result;
}

id sub_100016E00(uint64_t a1, void *a2)
{
  id v4 = [a2 objectForKey:@"Event"];
  uint64_t v5 = @"com.apple.fud.updateStarted";
  uint64_t v5 = @"com.apple.fud.updateResumed";
  id result = [v4 isEqualToString:@"com.apple.fud.updateResumed"];
  if ((_DWORD)result) {
    return [*(id *)(*(void *)(a1 + 32) + 8) reportAnalytics:v5 info:a2];
  }
  return result;
}

id sub_100016EB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return [*(id *)(*(void *)(a1 + 32) + 8) log:3, @"%s: Error:%@ to get create FudPersonalizationRequest for %@", "-[EAAccessoryUpdater applyFirmwareWithOptions:]_block_invoke_4", *(void *)(*(void *)(a1 + 32) + 24) format];
  }
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 8);
  if (a2) {
    return [v4 personalizationRequest:a2];
  }
  else {
    return [v4 log:3, @"%s: Error: FudPersonalizationRequest = NULL for %@", "-[EAAccessoryUpdater applyFirmwareWithOptions:]_block_invoke_4", *(void *)(v3 + 24) format];
  }
}

void sub_1000170F4(_Unwind_Exception *a1)
{
}

id sub_10001710C(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  id result = objc_msgSend( *(id *)(a1 + 32),  "isEqual:",  +[NSURL URLWithString:](NSURL, "URLWithString:", a2));
  if ((_DWORD)result)
  {
    id result = [*(id *)(*(void *)(a1 + 40) + 8) log:7, @"%s: Pointing to Seed Location for %@, need to prompt for Consent", "-[EAAccessoryUpdater consentRequired]_block_invoke", *(void *)(*(void *)(a1 + 40) + 24) format];
    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
    *a3 = 1;
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 0;
  }

  return result;
}

_UNKNOWN **UARPAnalyticsDurationToBucket(void *a1)
{
  id v1 = [a1 unsignedIntegerValue];
  uint64_t v2 = 0LL;
  while ((unint64_t)v1 > qword_100025640[v2])
  {
    if (++v2 == 73) {
      return &off_100034CC8;
    }
  }

  return (_UNKNOWN **)+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:");
}

_UNKNOWN **UARPAnalyticsIterationCountToBucket(void *a1)
{
  id v1 = [a1 unsignedIntegerValue];
  else {
    return (_UNKNOWN **)+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v1);
  }
}

void sub_100017694(uint64_t a1, os_log_s *a2)
{
  int v2 = 136315650;
  uint64_t v3 = "-[AUDeveloperSettingsDatabase setAccessoriesDictionary:]";
  __int16 v4 = 2112;
  uint64_t v5 = @"accessories";
  __int16 v6 = 2112;
  uint64_t v7 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%s: seting %@:%@", (uint8_t *)&v2, 0x20u);
}

void sub_10001772C()
{
  sub_100004410((void *)&_mh_execute_header, v0, v1, "%s: dictionary = %@", v2, v3, v4, v5, 2u);
  sub_100004420();
}

void sub_100017798()
{
  v1[0] = 136315394;
  sub_1000043FC();
  _os_log_error_impl( (void *)&_mh_execute_header,  v0,  OS_LOG_TYPE_ERROR,  "%s: received unknown object = %@",  (uint8_t *)v1,  0x16u);
  sub_100004420();
}

void sub_100017810()
{
  sub_100004410((void *)&_mh_execute_header, v0, v1, "%s: dictionary = %@", v2, v3, v4, v5, 2u);
  sub_100004420();
}

void sub_10001787C(uint64_t *a1, os_log_s *a2)
{
  uint64_t v2 = *a1;
  int v3 = 136315394;
  uint64_t v4 = "-[LegacyAudioAccessory startFirmwareUpdateStates]";
  __int16 v5 = 2112;
  uint64_t v6 = v2;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "%s: Failed to create EAAccessoryUpdater for %@",  (uint8_t *)&v3,  0x16u);
}

void sub_100017908(uint64_t a1, id *a2)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*a2 activeAccessories]);
  sub_10000C6E8();
  sub_100004410( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v3,  "Added accessory %@, active accessories %@",  v4,  v5,  v6,  v7,  v8);

  sub_10000C700();
}

void sub_10001798C(uint64_t a1, id *a2)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*a2 activeAccessories]);
  sub_10000C6E8();
  sub_100004410( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v3,  "Removed accessory %@, active accessories %@",  v4,  v5,  v6,  v7,  v8);

  sub_10000C700();
}

void sub_100017A10(uint64_t a1)
{
  int v1 = 136315394;
  uint64_t v2 = "-[AUHelperInstance remoteObject]_block_invoke";
  __int16 v3 = 2112;
  uint64_t v4 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "%s: Failed to get remote object: %@",  (uint8_t *)&v1,  0x16u);
}

void sub_100017AA0()
{
  int v0 = 136315138;
  int v1 = "+[AUHelperInstance xpcConnectionToHelper]";
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "%s: Failed to get xpc connection",  (uint8_t *)&v0,  0xCu);
}

void sub_100017B24(uint8_t *buf, uint64_t a2, void *a3)
{
  *(_DWORD *)buf = 138412290;
  *a3 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Invalid accessoryData error %@",  buf,  0xCu);
}

uint64_t sub_100017B6C()
{
  uint64_t v0 = abort_report_np("Unable to find class %s", "CSVoiceTriggerRTModel");
  return sub_100017B90(v0);
}

uint64_t sub_100017B90()
{
  uint64_t v0 = abort_report_np("Unable to find class %s", "CSCoreSpeechServices");
  return sub_100017BB4(v0);
}

void sub_100017BB4()
{
}

void sub_100017C28()
{
}

void sub_100017C9C(uint64_t a1)
{
  int v1 = 136315394;
  uint64_t v2 = "-[FirmwareBundle initWithURL:hashData:signatureData:certData:]";
  __int16 v3 = 2112;
  uint64_t v4 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "%s: Invalid firmwareURL %@",  (uint8_t *)&v1,  0x16u);
}

id objc_msgSend_getHSModelForEngineMajorVersion_minorVersion_numHSModels_modelBuffer_length_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getHSModelForEngineMajorVersion:minorVersion:numHSModels:modelBuffer:length:");
}

id objc_msgSend_initWithDeviceClass_assetType_skipDFU_byteEscape_skipReconnect_skipVersionCheck_options_serialNum_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initWithDeviceClass:assetType:skipDFU:byteEscape:skipReconnect:skipVersionCheck:options:serialNum:");
}

id objc_msgSend_voiceTriggerRTModelForVersion_minorVersion_downloadedModels_preinstalledModels_completion_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "voiceTriggerRTModelForVersion:minorVersion:downloadedModels:preinstalledModels:completion:");
}

id objc_msgSend_xpcConnectionToHelper(void *a1, const char *a2, ...)
{
  return [a1 xpcConnectionToHelper];
}